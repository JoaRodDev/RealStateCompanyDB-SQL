-- Las tablas que incluí en el Backup fueron las siguientes:
-- guarantor, location, operation_detail, owner, property, seller y tentant
-- Elegí estas tablas ya que los datos son fijos y los utilizo desde el comienzo del 
-- proyecto a diferencia de las tablas "LOGS" Ya que los datos se actualizan cada vez que se realiza una acción.

-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: DBrealstate
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `guarantor`
--

LOCK TABLES `guarantor` WRITE;
/*!40000 ALTER TABLE `guarantor` DISABLE KEYS */;
INSERT INTO `guarantor` VALUES (1,'Andres','Rodriguez',2,5),(2,'Mariano','Lopez',5,6);
/*!40000 ALTER TABLE `guarantor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Cordoba','Argentina','Ciudad'),(2,'Mendoza','Argentina','Ciudad'),(3,'Buenos Aires','Argentina','Ciudad'),(4,'San Luis','Argentina','Ciudad'),(5,'Santa Fe','Argentina','Ciudad'),(6,'Neuquen','Argentina','Ciudad');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `operation_detail`
--

LOCK TABLES `operation_detail` WRITE;
/*!40000 ALTER TABLE `operation_detail` DISABLE KEYS */;
INSERT INTO `operation_detail` VALUES (1,1,0,0,33000,NULL,NULL,'2011-04-23',0,NULL,2),(2,1,0,0,41000,NULL,NULL,'2018-08-23',0,NULL,2),(3,1,0,0,35000,NULL,NULL,'2022-03-23',0,NULL,1),(4,1,0,0,39000,NULL,NULL,'2001-04-23',0,NULL,1),(5,0,1,600,0,'2021-03-12','2025-06-12',NULL,150,1,2),(6,1,0,0,38500,NULL,NULL,'2016-07-23',0,NULL,2),(7,1,0,0,49500,NULL,NULL,'2030-06-23',0,NULL,2),(8,0,1,450,0,'2022-04-19','2027-09-13',NULL,150,2,3),(9,1,0,0,37500,NULL,NULL,'2028-09-23',0,NULL,3),(10,1,0,0,39500,NULL,NULL,'2025-12-23',0,NULL,3);
/*!40000 ALTER TABLE `operation_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `owner`
--

LOCK TABLES `owner` WRITE;
/*!40000 ALTER TABLE `owner` DISABLE KEYS */;
INSERT INTO `owner` VALUES (1,'Raquel','Mendoza','rq-mendoza@gmail.com',1125403023,41,1,1),(2,'Luis','Ríos','luisrios@gmail.com',1124304950,46,1,1),(3,'Aitana','Medina','AM@gmail.com',1124403023,43,1,2),(4,'Manuel','Rosales','manuelrosales@gmail.com',1142344543,64,1,2),(5,'Lourdes','Paredes','Louparedes@gmail.com',1112023994,69,2,2),(6,'Diego','Cordero','Diegocordero@gmail.com',1112572938,39,1,2),(7,'Elena','Ramírez','ElenaRamirez@gmail.com',1128383903,37,1,3),(8,'Guillermo','Arroyo','GArroyo@gmail.com',1122393039,29,1,3),(9,'Isabel','Peña','isapeña@gmail.com',1127473343,30,1,3);
/*!40000 ALTER TABLE `owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `property`
--

LOCK TABLES `property` WRITE;
/*!40000 ALTER TABLE `property` DISABLE KEYS */;
INSERT INTO `property` VALUES (1,1,0,3,1,1,0,1,1,1,5),(2,1,0,5,2,1,1,2,2,1,5),(3,1,0,3,1,1,0,1,3,2,1),(4,1,0,4,1,1,1,1,4,3,2),(5,0,1,7,2,1,1,3,5,5,3),(6,1,0,4,1,1,1,1,6,2,4),(7,1,0,8,2,1,1,4,7,4,6),(8,0,1,5,1,1,0,3,8,6,7),(9,1,0,4,1,1,1,1,9,5,8),(10,1,0,4,1,1,0,2,10,6,9);
/*!40000 ALTER TABLE `property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES (1,'Cristian','Lorenzo','cristianventas@inmobiliaria.com',1121338847,13,3.9),(2,'Rebeca','Navarro','rebecaventas@inmobiliaria.com',1121273782,25,4.8),(3,'Lucas','Vázques','Lucasventas@inmobiliaria.com',1123123964,21,4.2);
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tenant`
--

LOCK TABLES `tenant` WRITE;
/*!40000 ALTER TABLE `tenant` DISABLE KEYS */;
INSERT INTO `tenant` VALUES (1,'Alexis','Gonzáles','A.G@gmail.com',1123324324,45,'soltero',0,1),(2,'Monica','Pérez','M.Pérez@gmail.com',1121333232,52,'casado',1,1),(3,'Roberto','Rodriguez','roberto.rodriguez@gmail.com',1123233233,23,'soltero',0,1),(4,'Carlos','Martínez','cm@gmail.com',1142342344,34,'soltero',0,2),(5,'Esteban','Sánchez','EstebanSan@gmail.com',1134994920,53,'soltero',0,2),(6,'María','López','Mlopez@gmail.com',1132430400,19,'soltero',0,2),(7,'José','García','jgarcia@gmail.com',1140284433,67,'soltero',0,3),(8,'Mariano','Fernández','marianof@gmail.com',1145454322,32,'casado',0,3),(9,'Alfonso','Torres','alftorr@gmail.com',1144432004,36,'soltero',0,3),(10,'Ricardo','Díaz','ricardodiaz@gmail.com',1124444432,41,'casado',1,1),(11,'Mariano','Morales','marianomorales@gmail.com',1119901923,27,'soltero',0,2);
/*!40000 ALTER TABLE `tenant` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-04 22:05:46
