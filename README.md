Trivisockets
============
Proyecto integrado para el ciclo formativo de grado superior.

Se trata de un juego de trivial con preguntas y respuestas, para multiples jugadores utilizando para ello nodejs y socket.io.
Se usa una base de datos mysql para extraer las preguntas y mostrarlas a los jugadores. 
Es necesario instalar nodejs, express, jade, socket.io, mysql usando el gestor de paquetes npm.
Una vez instaladas las depencias, instalado el servidor mysql y añadida la base de datos, se ejecuta el juego desde una
terminal usando el comando "node server.js", los jugadores podran conectarse al servidor usando la ip del mismo y el puerto
especifico indicado para el servidor, en este caso es el 3001, por tanto para la conexion de los jugadores debe realizarse 
desde el navegador web de la siguiente forma: http:IP_SERVIDOR:3001.

Los jugadores deberan introducir un nombre de usuario mayor de 3 letras para que el servidor le permita el acceso al juego, 
una vez hecho, comienza el juego, son 120 segundos para responder el maximo numero de respuestas posibles. Las preguntas se
muestran de manera aleatoria escogidas de la base de datos y los usuarios deberan responder usando el teclado numerico de 1 
a 4 forman las respuestas, existiendo solamente una opcion correcta, el primer usuario que responda ganará 1 punto, y si lo 
hace de forma incorrecta se le restara 1 punto, pudiendo llegar a valores negativos.

Pasados los 120 segundos, finaliza la partida y mostrará un mensaje al usuario ganador y otro al usuario perdedor, tambien 
entrara en el salon de la fama aquel que consiga mas puntos.

Existe un pequeño bug en la aplicacion que muestra la primera pregunta vacia, pero se ha "parcheado" indicando el numero de 
la respuesta correcta y pudiendo continuar el juego sin problemas. Esto solo sucede cuando se inicia el servidor por primera
vez.
