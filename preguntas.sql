CREATE DATABASE  IF NOT EXISTS `preguntas` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `preguntas`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: preguntas
-- ------------------------------------------------------
-- Server version	5.5.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `preguntas`
--

DROP TABLE IF EXISTS `preguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preguntas` (
  `id` int(11) NOT NULL,
  `pregunta` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntas`
--

LOCK TABLES `preguntas` WRITE;
/*!40000 ALTER TABLE `preguntas` DISABLE KEYS */;
INSERT INTO `preguntas` VALUES (1,'¿Quien descubrio America?'),(2,'¿Que Buscaba Colon en su viaje?'),(3,'¿Que piloto español conquisto la F1?'),(4,'¿Cual fue el año de guerra civil?'),(5,'¿Cual de estos terminos no pertenece a la informatica?'),(6,'¿En que año se fundo IBM?'),(7,'¿Quien es el creador de Windows?'),(8,'¿Cuantos megabytes almacena un cd?'),(9,'¿En que año fue lanzado Windows XP?'),(10,'¿Cuantos bytes es un terabyte?'),(11,'¿Que teclas abren el administrador de tareas en Windows?'),(12,'¿Quien creo el ordenador Z3?'),(13,'¿Cual de los siguientes no es un navegador?'),(14,'¿Que significa WWW?'),(15,'En Big Bang Theory: ¿a que se dedica Leonard:?'),(16,'En Big Bang Theory: ¿que nacionalidad tiene Rajesh Koothrappali:?'),(17,'En Big Bang Theory: ¿donde pasan 3 meses Sheldon, Leonard, Howard y Rajesh:?'),(18,'En Big Bang Theory: ¿cual es la serie que no le gusta a Sheldon?:'),(19,'Knock Knock Knock ..... Knock Knock Knock ..... Knock Knock Knock .....'),(20,'¿En que pelicula Anakin Skaiwalker se pasa al lado oscuro?'),(21,'¿Cuantos monos hay en Madagascar?'),(22,'¿Donde tiene Harry Potter su cicatriz?'),(23,'¿A que pais se van Los Simpsons en la pelicula?'),(24,'¿Que clase de pez es Nemo?'),(25,'¿Donde se encuentra el Vaticano?'),(26,'¿En Anatomia: Organo muscular hueco que recibe la sangre y la impulsa hacia las venas'),(27,'Sobre el oceano atlancico hay un famoso triangulo llamado:'),(28,'¿Quien escribio la novela La Metamorfosis?'),(29,' La señal en morse para pedir auxilio es'),(30,'¿Que comunidad Autonoma se encuentra entre el Pais Vasco y Asturias?'),(31,' ¿En cual de estas peliculas de Tim Burton no sale Jhonny Deep?'),(32,' ¿Como se llamaba el acompañante de Pierre Nodoyuna?'),(33,'¿De que color es la espada mas importante en el universo de Star Wars?'),(34,'En Big Bang Theory: segun Leonard donde puedes encontrar dinero si vas corto?'),(35,'¿Quien interpretaba a Batman en la primera adaptacion al cine?'),(36,'¿En que se baso Bob Kane para crear a Batman?'),(37,'¿Cual es la comida preferida de Garfield?'),(38,'¿En que pais transcurre la pelicula El Laberinto del fauno?'),(39,'¿De que color es el Pato Lucas?'),(40,'¿Cuantos colores podia presentar en pantalla el Amstrad CPC464?'),(41,'¿Que ordenador traia su propio monitor en lugar de conectarse al televisor como el resto de ordenado'),(42,'¿Que compañia desarrollo el videojuego Commados?'),(43,'¿Cual es la combinacion de teclas para pegar?'),(44,'¿Que tecla salta de caja en caja en un formulario?'),(45,'¿Como se escribe el simbolo del Euro?'),(46,'¿Para que sirve la tecla de Windows?'),(47,'¿Que combinacion de teclas equivale a ALT GR?'),(48,'¿Cual es la funcion de la tecla Impr Pant?'),(49,'¿Que tecla borra lo que se encuentra a la izquierda del cursor?'),(50,'¿Que nota le pondrias a este proyecto?');
/*!40000 ALTER TABLE `preguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resp_correcta`
--

DROP TABLE IF EXISTS `resp_correcta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resp_correcta` (
  `id_pregunta` int(11) NOT NULL,
  `rc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resp_correcta`
--

LOCK TABLES `resp_correcta` WRITE;
/*!40000 ALTER TABLE `resp_correcta` DISABLE KEYS */;
INSERT INTO `resp_correcta` VALUES (1,'Colon'),(2,'Las Indias'),(3,'Fernando Alonso'),(4,'1936'),(5,'Cable WZD'),(6,'1911'),(7,'Bill Gates'),(8,'700'),(9,'2001'),(10,'1099511627776'),(11,'ctrl+alt+supr'),(12,'Konrad Zuse'),(13,'Operar'),(14,'World Wide Web'),(15,'Fisico Experimental'),(16,'India'),(17,'Polo Norte'),(18,'Babylon 5'),(19,'Penny'),(20,'Star Wars 3'),(21,'2'),(22,'Frente'),(23,'Alaska'),(24,'Payaso'),(25,'Roma'),(26,'Corazon'),(27,'De las Bermudas'),(28,'Kafka'),(29,'S.O.S'),(30,'Cantabria'),(31,'Pesadilla antes de navidad'),(32,'Patan'),(33,'Negra'),(34,'En el culo de Linterna Verde'),(35,'Adam West'),(36,'En el aparato volador de Miguel Angel'),(37,'Lasaña'),(38,'España'),(39,'Negro'),(40,'4'),(41,'Amstrad'),(42,'Pyro Studios'),(43,'ctrl+v'),(44,'Tabulador'),(45,'alt gr+e'),(46,'Abre el menu de inicio'),(47,'ctrl+alt'),(48,'Envia al portapapeles una copia de la pantalla'),(49,'Retroceso'),(50,'10');
/*!40000 ALTER TABLE `resp_correcta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuestas`
--

DROP TABLE IF EXISTS `respuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `respuestas` (
  `id_pregunta` int(11) NOT NULL,
  `r1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `r2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `r3` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuestas`
--

LOCK TABLES `respuestas` WRITE;
/*!40000 ALTER TABLE `respuestas` DISABLE KEYS */;
INSERT INTO `respuestas` VALUES (1,'Butragueño','Santa Maria','Coppernico'),(2,'Canarias','Las Americas','Benalmadena'),(3,'Felipe Massa','Pedro De La Rosa','Antonio Lobato'),(4,'1992','1942','1963'),(5,'Cable UTP','Cable HDMI','Cable USB'),(6,'1973','1935','1854'),(7,'Mark Zuckerberg','Steve Jobs','Paul Allen'),(8,'450','750','650'),(9,'2005','1999','2003'),(10,'1012022548636','2225545656888','1254887330147'),(11,'supr+alt+tab','alt+m+shift','ctrl+sup'),(12,'Bill Gates','Abraham Collins','Neil Shmit'),(13,'Internet Explorer','Safari','Chrome'),(14,'Web Word Web','Wide World Web','Web Wide Wide'),(15,'Biologo','Fisico Teorico','Ingeniero'),(16,'Turca','Judia','China'),(17,'Polo Sur','Alaska','Brasil'),(18,'Star Trek','Galactica','Stargate'),(19,'Pasen','Quien?','Adelante'),(20,'Star Wars 1','Star Wars 2','Star Wars 4'),(21,'0','3','4'),(22,'Mano','Codo','Pierna'),(23,'Rusia','Canada','Brasil'),(24,'Espada','Raya','Globo'),(25,'Paris','Varsovia','Venecia'),(26,'Higado','Pancreas','Riñon'),(27,'De las Bahamas','Isosceles','Rectangulo'),(28,'Logan','Garcia Marquez','Bolaños'),(29,'911',' D.O.S',' H.L.P'),(30,'Aragon','Andalucia',' Comunidad Valenciana'),(31,'SleepyHollow','Sweeny Todd','La Novia cadaver'),(32,'Rissoto','Risueño','Lindo Pulgoso'),(33,'Amarilla','Verde','Morada'),(34,'Entre el nº 32 y 33 de Flash','En el tarro de las galletas de Batman','En el banco'),(35,'George Clooney','Val Kilmer','Michael Keaton'),(36,'En el libro de la sombra','Un murcielago que tenia de niño','Plagiar a Superman'),(37,'Pizza','Milanesa','Chocolate'),(38,'Mexico','Italia','Francia'),(39,'Marron','Gris','Rojo'),(40,'2','10','8'),(41,'Commoddore','Spectrum','MSX'),(42,'Codemaster','Erbe','Eidos Interactive'),(43,'ctrl+c','ctrl+s','ctrl+x'),(44,'Entrar','Flecha','Espacio'),(45,'alt+e','Mayuscula+e','ctrl+e'),(46,'Reiniciar el ordenador','Mandar un correo a Bill Gates diciendo Basta Ya!','Formatea e instala Ubuntu 12.04'),(47,'Mayus+insert','Mayus+alt','Mayus+inicio'),(48,'Imprime pantalla','Enciende la impresora','Ninguna'),(49,'Flecha del cursor izquierda','Flecha del cursor izquierda+supr','Suprimir'),(50,'7','8','9');
/*!40000 ALTER TABLE `respuestas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-06-16 19:42:32
