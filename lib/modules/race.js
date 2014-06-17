var config = require("../../config").values;
var util = require("./util");
var mysql = require("mysql");
var press='';
var	r1='';
var	r2='';
var r3='';
var	r4='0';
var res = new Array();
	
var r1, r2, r3, r4, preg,rc,i,press;
var pregCompletas = new Object();
pregCompletas.pregunta = new Object();
pregCompletas.r1 = new Object();
pregCompletas.r2 = new Object();
pregCompletas.r3 = new Object();
pregCompletas.r4 = new Object();

	function shuffle(array){
  var j, temp;
  for(var i = array.length - 1; i > 0; i--){
    j = Math.floor(Math.random() * (i + 1));
    temp = array[i];
    array[i] = array[j];
    array[j] = temp;
  }
  for(i=0;i<=3;i++){
  }
  return array;
}

var connection = mysql.createConnection(
  {
  	host     : 'localhost',
  	user     : 'root',
  	password : 'root',
  	database : 'preguntas',
  }
)
function getRandomInt (min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}
connection.connect(); //Abre conexion a bbdd

function Operation () {
	
	var self = this;
	
	var member1 = getRandomInt(1,50);
	preg = 'SELECT a.pregunta,b.r1,b.r2,b.r3,c.rc FROM preguntas a,respuestas b,resp_correcta c WHERE a.id=b.id_pregunta AND a.id=c.id_pregunta AND b.id_pregunta=c.id_pregunta AND a.id='+member1;
    connection.query(preg, function(err, rows, fields) {
    	
			for (i in rows){
			pregCompletas.pregunta=rows[i].pregunta;
			pregCompletas.r1=rows[i].r1;
			pregCompletas.r2=rows[i].r2;
			pregCompletas.r3=rows[i].r3;
			pregCompletas.r4=rows[i].rc;

			
}

				press = pregCompletas.pregunta;
				r1 = pregCompletas.r1;
				r2 = pregCompletas.r2;
				r3 = pregCompletas.r3;
				r4 = pregCompletas.r4;

	});	
	res[0]=r1;
	res[1]=r2;
	res[2]=r3;
	res[3]=r4;
	
	shuffle(res);
	for(i=0;i<=3;i++){
		if (res[i]==r4){
		self.solution = i+1;
		}
	}
    self.quest = press + '<br>' + '1 - ' + res[0] + '<br>'+'2 - ' + res[1] + '<br>' + '3 - '  + res[2] + '<br>' + '4 - ' + res[3] + '<br>'; //Preguntas + Respuestas
 };

function createRace(server){
	var io = require('socket.io').listen(server);
	var socket = io.sockets;
	var clients = {} //id (int) : client (obj)
	var sessions = [] //array of client id's
	var scores = {}
	var history = [];
	var hall_of_fame = [];

	function UpdateHallOfFame(scores, timestamp){

		for (var i = 0, l = scores.length; i < l ;  i++) {
			var score = scores[i];
			score.timestamp = timestamp;
			hall_of_fame.push(score); //add all scores
		};

		//sort by score
		util.sort(hall_of_fame, 'score', true);

		//and slice array!
		return hall_of_fame.slice(0,config.game.show_hall_of_fame);
	}

	function broadcast(sessions, command, data, exception){
		for (var i=0, l=sessions.length; i < l ; i++) {
			if (!exception || sessions[i] != exception)
				clients[sessions[i]].emit(command, data);
		};
	}

	var operation = new Operation();

	function format_scores (scores){
	   var arr = [];
	   for(var key in scores){
	      arr.push({player: key, score : scores[key]});
	   }
	   return arr;
	}

	var game_duration = config.game.duration * 1000;
	var game_started = new Date();

	setInterval(function broadcastTime(){
		var elapsed = new Date().getTime() - game_started.getTime();
		var remaining = Math.floor((game_duration - elapsed) / 1000);
		if (remaining<0){
			//archive game
			var timestamp = game_started.getDate() + '/' + (game_started.getMonth() + 1) + '/' + game_started.getFullYear() + ' ' +  game_started.getHours() + ":" + (game_started.getMinutes() > 9 ? game_started.getMinutes() : '0' + game_started.getMinutes());
			if (format_scores(scores).length){
				history.push({
					timestamp: game_started.getTime(),
					name: timestamp,
					scores: format_scores(scores)
				});
				util.sort(history, 'timestamp', true);
				history = history.slice(0,config.game.show_history_games);
				hall_of_fame = UpdateHallOfFame(format_scores(scores), timestamp);
				broadcast (sessions, 'history', history); //broadcast history
			}
			scores = {}; //reset
			game_started = new Date(); //start game again!
			broadcast (sessions, 'scores', format_scores(scores)); //broadcast scores
			broadcast (sessions, 'hall_of_fame', hall_of_fame); //broadcast "hall of fame"
			broadcast (sessions, 'new_game', null); //flash 'new game!'
		}
		else
			broadcast (sessions, 'time', remaining); //broacast time ticks

	}, 1000);

	socket.on('connection', function (client) {
		client.on('disconnect', function () {
			for (var i = 0, l = sessions.length; i < l ;  i++) {
				if (sessions[i]==client.id){
					delete clients[client.id];
					sessions.splice(i,1);
					break;
				}
			};
		});

		client.on('join', function (data) {
			util.add (sessions, client.id); //add client id to list of sessions
			clients[client.id] = client;  //store specific client object
			client.emit ('new_operation', operation.quest); //send challenge to new client
			client.emit ('scores', format_scores(scores)); //send scores to new client
			client.emit ('history', history); //send history
			broadcast (sessions, 'hall_of_fame', hall_of_fame); //send hall of fame
		});

		client.on('solve_operation', function (data) {
				var safe_name = data.name.slice(0,25); //avoid long names
			if (data.operation == operation.solution){
				//result_operation: 1:you win, 2:other player won, 0: bad operation
				client.emit ('result_operation', 1); //msg to winner
				broadcast (sessions, 'result_operation', 2, client.id); //msg to rest of players. someone else won!

				scores[safe_name] = (scores[safe_name] || 0) + 1; //credit score to client
				broadcast (sessions, 'scores', format_scores(scores)); //broacast scores

				//new challenge
				operation =  new Operation();
				broadcast (sessions, 'new_operation', operation.quest); //new challenge for all players
			}
			else { //baaaad. you need some math classes
				client.emit ('result_operation', 0);
				scores[safe_name] = (scores[safe_name] || 0) - 1; //credit score to client
				broadcast (sessions, 'scores', format_scores(scores)); //broacast scores
				}
		});
	});
}
exports.createRace = createRace;
