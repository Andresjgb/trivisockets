var config = require ('./config').values

var app = require ('./app').getApp(config)

var port = parseInt(process.argv[2], 10) || 3001
app.listen(port);

//create handler for socket.io
var race = require ('./lib/modules/race')
race.createRace(app);

console.log("Servidor escuchando en puerto %d modo %s", app.address().port, app.settings.env);

process.on('SIGINT', function () {
	app.close();
	console.log();
	console.log('Apagando el servidor...');
	process.exit(0);
});
