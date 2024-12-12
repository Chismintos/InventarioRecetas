/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.4.3-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: recetas
-- ------------------------------------------------------
-- Server version	11.4.3-MariaDB-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `ingredientes`
--

DROP TABLE IF EXISTS `ingredientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingredientes` (
  `id_ingrediente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id_ingrediente`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredientes`
--

LOCK TABLES `ingredientes` WRITE;
/*!40000 ALTER TABLE `ingredientes` DISABLE KEYS */;
INSERT INTO `ingredientes` VALUES
(1,'Huevo'),
(2,'Tomate'),
(3,'Cebolla'),
(4,'Chile'),
(5,'Aceite'),
(6,'Carne de res'),
(7,'Tortillas'),
(8,'Cilantro'),
(9,'Lim├│n'),
(10,'Fideos'),
(11,'Ajo'),
(12,'Caldo de pollo'),
(13,'Aguacate'),
(14,'Lechuga'),
(15,'Pollo'),
(16,'Pan'),
(17,'Spaghetti'),
(18,'Carne molida'),
(19,'Zanahoria'),
(20,'Pescado'),
(21,'Repollo'),
(22,'Frijoles refritos'),
(23,'Crema'),
(24,'Queso'),
(25,'Masa de ma├¡z'),
(26,'Aceite de oliva'),
(27,'Arroz');
/*!40000 ALTER TABLE `ingredientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recetas`
--

DROP TABLE IF EXISTS `recetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recetas` (
  `id_receta` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `instrucciones` text DEFAULT NULL,
  PRIMARY KEY (`id_receta`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recetas`
--

LOCK TABLES `recetas` WRITE;
/*!40000 ALTER TABLE `recetas` DISABLE KEYS */;
INSERT INTO `recetas` VALUES
(1,'Huevos a la Mexicana','Huevos revueltos con tomate, cebolla y chile.','Batir los huevos, picar los tomates, cebolla y chile, fre├¡r todo en aceite y mezclar con los huevos batidos. Cocinar a fuego lento.'),
(2,'Tacos de Carne Asada','Tacos con carne de res asada, cilantro y cebolla.','Asar la carne, picar el cilantro y la cebolla, calentar las tortillas y montar los tacos con carne, cebolla, cilantro y un poco de lim├│n.'),
(3,'Sopa de Fideos','Sopa con fideos, tomate, cebolla y caldo de pollo.','Fre├¡r los fideos, licuar el tomate, cebolla y ajo, agregar al caldo de pollo y cocinar los fideos en el caldo.'),
(4,'Guacamole','Guacamole hecho con aguacate, cebolla, tomate, chile y lim├│n.','Machacar el aguacate, picar los tomates, cebolla y chile, mezclar todo con lim├│n.'),
(5,'Ensalada C├®sar','Ensalada de lechuga con pollo, pan y aderezo de aceite de oliva.','Cocinar el pollo, tostar el pan, mezclar con lechuga, aderezar con aceite de oliva, ajo, y lim├│n.'),
(6,'Spaghetti a la Bolognesa','Spaghetti con salsa de carne molida y tomate.','Cocinar el spaghetti, hacer una salsa con carne molida, tomate, cebolla, ajo y zanahoria. Mezclar con el spaghetti.'),
(7,'Tacos de Pescado','Tacos de pescado con repollo, salsa picante y lim├│n.','Cocinar el pescado, calentar las tortillas, servir con repollo, lim├│n y salsa picante.'),
(8,'Arroz con Pollo','Arroz con pollo, zanahoria y caldo de pollo.','Cocinar el pollo, fre├¡r arroz, agregar caldo de pollo, zanahoria y cebolla, cocinar hasta que est├® listo.'),
(9,'Quesadillas','Tortillas rellenas de queso y fritas en aceite.','Calentar las tortillas, agregar queso, doblarlas y fre├¡rlas en aceite. Servir con salsa.'),
(10,'Sopes','Sopes hechos con masa de ma├¡z, frijoles refritos y crema.','Formar la masa en c├¡rculos, fre├¡r en aceite, colocar frijoles, crema, queso y lechuga. Servir con salsa.');
/*!40000 ALTER TABLE `recetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recetas_ingredientes`
--

DROP TABLE IF EXISTS `recetas_ingredientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recetas_ingredientes` (
  `id_receta` int(11) NOT NULL,
  `id_ingrediente` int(11) NOT NULL,
  `cantidad` float NOT NULL,
  PRIMARY KEY (`id_receta`,`id_ingrediente`),
  KEY `id_ingrediente` (`id_ingrediente`),
  CONSTRAINT `recetas_ingredientes_ibfk_1` FOREIGN KEY (`id_receta`) REFERENCES `recetas` (`id_receta`),
  CONSTRAINT `recetas_ingredientes_ibfk_2` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingredientes` (`id_ingrediente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recetas_ingredientes`
--

LOCK TABLES `recetas_ingredientes` WRITE;
/*!40000 ALTER TABLE `recetas_ingredientes` DISABLE KEYS */;
INSERT INTO `recetas_ingredientes` VALUES
(1,1,3),
(1,2,2),
(1,3,1),
(1,4,1),
(1,5,20),
(2,3,1),
(2,6,500),
(2,7,4),
(2,8,50),
(2,9,1),
(3,2,2),
(3,3,1),
(3,10,200),
(3,11,2),
(3,12,1),
(4,2,1),
(4,3,1),
(4,4,1),
(4,9,1),
(4,13,2),
(5,9,1),
(5,11,1),
(5,14,1),
(5,15,200),
(5,16,2),
(5,26,50),
(6,2,2),
(6,3,1),
(6,11,2),
(6,17,200),
(6,18,300),
(6,19,1),
(7,7,3),
(7,9,1),
(7,20,200),
(7,21,100),
(8,3,50),
(8,12,300),
(8,15,200),
(8,19,50),
(8,27,150),
(9,5,10),
(9,7,2),
(9,24,100),
(10,14,50),
(10,22,100),
(10,23,50),
(10,24,50),
(10,25,200);
/*!40000 ALTER TABLE `recetas_ingredientes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2024-12-11 23:08:41
