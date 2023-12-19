CREATE DATABASE  IF NOT EXISTS `dbrealstate` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dbrealstate`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: dbrealstate
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `guarantor`
--

DROP TABLE IF EXISTS `guarantor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guarantor` (
  `id_guarantor` int NOT NULL AUTO_INCREMENT COMMENT 'id guarantor',
  `first_name` varchar(25) NOT NULL COMMENT 'first name guarantor',
  `last_name` varchar(25) NOT NULL COMMENT 'last name guarantor',
  `id_tenant` int NOT NULL COMMENT 'guarantor of tenant',
  `id_property` int NOT NULL COMMENT 'guarantor of property',
  PRIMARY KEY (`id_guarantor`) COMMENT 'Primary key',
  KEY `FK_guarantor_tenant` (`id_tenant`),
  KEY `FK_guarantor_property` (`id_property`),
  CONSTRAINT `FK_guarantor_property` FOREIGN KEY (`id_property`) REFERENCES `property` (`id_property`),
  CONSTRAINT `FK_guarantor_tenant` FOREIGN KEY (`id_tenant`) REFERENCES `tenant` (`id_tenant`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='table guarantor';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guarantor`
--

LOCK TABLES `guarantor` WRITE;
/*!40000 ALTER TABLE `guarantor` DISABLE KEYS */;
INSERT INTO `guarantor` VALUES (1,'Andres','Rodriguez',2,5),(2,'Mariano','Lopez',5,6);
/*!40000 ALTER TABLE `guarantor` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `TRG_LOG_GUARANTOR` AFTER INSERT ON `guarantor` FOR EACH ROW BEGIN
	INSERT INTO LOG_audit_create(name_action , name_table , user, date_action, time_action)
	VALUES ( 'INSERT' , 'guarantor' , CURRENT_USER() , CURDATE(), CURTIME());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `TRG_LOG_GUARANTOR_ACTION` BEFORE UPDATE ON `guarantor` FOR EACH ROW BEGIN
	INSERT INTO LOG_audit_action(name_field , id_table, name_action , name_table, user, date_action, time_action)
	VALUES ( CONCAT("OLD FIELD: ", OLD.first_name, " NEW FIELD: ", NEW.first_name),
			OLD.id_guarantor,
            'UPDATE' ,
            'GUARANTOR' ,
            CURRENT_USER(),
            CURDATE(),
            CURTIME()) ;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `TRG_LOG_GUARANTOR_DELETE` BEFORE DELETE ON `guarantor` FOR EACH ROW BEGIN
	INSERT INTO LOG_audit_action(name_field, id_table, name_action , name_table, user, date_action, time_action)
	VALUES ( CONCAT("DELETE GUARANTOR: ", OLD.first_name),
			OLD.id_guarantor,
            'DELETE' ,
            'GUARANTOR' ,
            CURRENT_USER(),
            CURDATE(),
            CURTIME()) ;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `id_location` int NOT NULL AUTO_INCREMENT COMMENT 'id location',
  `province` varchar(25) NOT NULL COMMENT 'province of property',
  `country` varchar(25) NOT NULL COMMENT 'country of property',
  `department` varchar(25) NOT NULL COMMENT 'departament of property',
  PRIMARY KEY (`id_location`) COMMENT 'Primary key'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='table location';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Cordoba','Argentina','Ciudad'),(2,'Mendoza','Argentina','Ciudad'),(3,'Buenos Aires','Argentina','Ciudad'),(4,'San Luis','Argentina','Ciudad'),(5,'Santa Fe','Argentina','Ciudad'),(6,'Neuquen','Argentina','Ciudad');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `TRG_LOG_LOCATION` AFTER INSERT ON `location` FOR EACH ROW BEGIN
	INSERT INTO LOG_audit_create(name_action , name_table , user, date_action, time_action)
	VALUES ( 'INSERT' , 'location' , CURRENT_USER() , CURDATE(), CURTIME());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `TRG_LOG_LOCATION_ACTION` BEFORE UPDATE ON `location` FOR EACH ROW BEGIN
	INSERT INTO LOG_audit_action(name_field , id_table, name_action , name_table, user, date_action, time_action)
	VALUES ( CONCAT("OLD FIELD: ", OLD.province, " NEW FIELD: ", NEW.province),
			OLD.id_location,
            'UPDATE' ,
            'LOCATION' ,
            CURRENT_USER(),
            CURDATE(),
            CURTIME()) ;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `TRG_LOG_LOCATION_DELETE` BEFORE DELETE ON `location` FOR EACH ROW BEGIN
	INSERT INTO LOG_audit_action(name_field, id_table, name_action , name_table, user, date_action, time_action)
	VALUES ( CONCAT("DELETE LOCATION: ", OLD.province),
			OLD.id_location,
            'DELETE' ,
            'LOCATION' ,
            CURRENT_USER(),
            CURDATE(),
            CURTIME()) ;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `log_audit_action`
--

DROP TABLE IF EXISTS `log_audit_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_audit_action` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `name_field` varchar(50) DEFAULT NULL,
  `id_table` int NOT NULL,
  `new_field_old_field` varchar(100) DEFAULT NULL,
  `name_action` varchar(10) DEFAULT NULL,
  `name_table` varchar(50) DEFAULT NULL,
  `user` varchar(100) DEFAULT NULL,
  `date_action` date DEFAULT NULL,
  `time_action` time DEFAULT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_audit_action`
--

LOCK TABLES `log_audit_action` WRITE;
/*!40000 ALTER TABLE `log_audit_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_audit_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_audit_create`
--

DROP TABLE IF EXISTS `log_audit_create`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_audit_create` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `name_action` varchar(10) DEFAULT NULL,
  `name_table` varchar(50) DEFAULT NULL,
  `user` varchar(100) DEFAULT NULL,
  `date_action` date DEFAULT NULL,
  `time_action` time DEFAULT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_audit_create`
--

LOCK TABLES `log_audit_create` WRITE;
/*!40000 ALTER TABLE `log_audit_create` DISABLE KEYS */;
INSERT INTO `log_audit_create` VALUES (1,'INSERT','seller','admin@%','2023-12-19','16:24:24'),(2,'INSERT','seller','admin@%','2023-12-19','16:24:24'),(3,'INSERT','seller','admin@%','2023-12-19','16:24:24'),(4,'INSERT','tenant','admin@%','2023-12-19','16:24:24'),(5,'INSERT','tenant','admin@%','2023-12-19','16:24:24'),(6,'INSERT','tenant','admin@%','2023-12-19','16:24:24'),(7,'INSERT','tenant','admin@%','2023-12-19','16:24:24'),(8,'INSERT','tenant','admin@%','2023-12-19','16:24:24'),(9,'INSERT','tenant','admin@%','2023-12-19','16:24:24'),(10,'INSERT','tenant','admin@%','2023-12-19','16:24:24'),(11,'INSERT','tenant','admin@%','2023-12-19','16:24:24'),(12,'INSERT','tenant','admin@%','2023-12-19','16:24:24'),(13,'INSERT','tenant','admin@%','2023-12-19','16:24:24'),(14,'INSERT','tenant','admin@%','2023-12-19','16:24:24'),(15,'INSERT','property','admin@%','2023-12-19','16:24:24'),(16,'INSERT','property','admin@%','2023-12-19','16:24:24'),(17,'INSERT','property','admin@%','2023-12-19','16:24:24'),(18,'INSERT','property','admin@%','2023-12-19','16:24:24'),(19,'INSERT','property','admin@%','2023-12-19','16:24:24'),(20,'INSERT','property','admin@%','2023-12-19','16:24:24'),(21,'INSERT','property','admin@%','2023-12-19','16:24:24'),(22,'INSERT','property','admin@%','2023-12-19','16:24:24'),(23,'INSERT','property','admin@%','2023-12-19','16:24:24'),(24,'INSERT','property','admin@%','2023-12-19','16:24:24'),(25,'INSERT','owner','admin@%','2023-12-19','16:24:24'),(26,'INSERT','owner','admin@%','2023-12-19','16:24:24'),(27,'INSERT','owner','admin@%','2023-12-19','16:24:24'),(28,'INSERT','owner','admin@%','2023-12-19','16:24:24'),(29,'INSERT','owner','admin@%','2023-12-19','16:24:24'),(30,'INSERT','owner','admin@%','2023-12-19','16:24:24'),(31,'INSERT','owner','admin@%','2023-12-19','16:24:24'),(32,'INSERT','owner','admin@%','2023-12-19','16:24:24'),(33,'INSERT','owner','admin@%','2023-12-19','16:24:24'),(34,'INSERT','operation_detail','admin@%','2023-12-19','16:24:24'),(35,'INSERT','operation_detail','admin@%','2023-12-19','16:24:24'),(36,'INSERT','operation_detail','admin@%','2023-12-19','16:24:24'),(37,'INSERT','operation_detail','admin@%','2023-12-19','16:24:24'),(38,'INSERT','operation_detail','admin@%','2023-12-19','16:24:24'),(39,'INSERT','operation_detail','admin@%','2023-12-19','16:24:24'),(40,'INSERT','operation_detail','admin@%','2023-12-19','16:24:24'),(41,'INSERT','operation_detail','admin@%','2023-12-19','16:24:24'),(42,'INSERT','operation_detail','admin@%','2023-12-19','16:24:24'),(43,'INSERT','operation_detail','admin@%','2023-12-19','16:24:24'),(44,'INSERT','location','admin@%','2023-12-19','16:24:24'),(45,'INSERT','location','admin@%','2023-12-19','16:24:24'),(46,'INSERT','location','admin@%','2023-12-19','16:24:24'),(47,'INSERT','location','admin@%','2023-12-19','16:24:24'),(48,'INSERT','location','admin@%','2023-12-19','16:24:24'),(49,'INSERT','location','admin@%','2023-12-19','16:24:24'),(50,'INSERT','guarantor','admin@%','2023-12-19','16:24:24'),(51,'INSERT','guarantor','admin@%','2023-12-19','16:24:24');
/*!40000 ALTER TABLE `log_audit_create` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_detail`
--

DROP TABLE IF EXISTS `operation_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operation_detail` (
  `id_operation_detail` int NOT NULL AUTO_INCREMENT COMMENT 'id operation',
  `is_sale` tinyint(1) NOT NULL COMMENT 'property sale: yes or not',
  `is_rent` tinyint(1) NOT NULL COMMENT 'property rental: yes or not',
  `value_rent` float DEFAULT NULL COMMENT 'value rental',
  `value_sale` float DEFAULT NULL COMMENT 'value sale',
  `rent_start` date DEFAULT NULL COMMENT 'date start rental property',
  `rent_end` date DEFAULT NULL COMMENT 'date end rental property',
  `sale_date` date DEFAULT NULL COMMENT 'date sale property',
  `value_inscription` float DEFAULT NULL COMMENT 'value inscription',
  `id_guarantor` int DEFAULT NULL COMMENT 'id guarantor operation',
  `id_seller` int NOT NULL COMMENT 'id seller reference',
  PRIMARY KEY (`id_operation_detail`) COMMENT 'Primary key',
  KEY `FK_operation_guarantor` (`id_guarantor`),
  KEY `FK_operation_seller` (`id_seller`),
  CONSTRAINT `FK_operation_guarantor` FOREIGN KEY (`id_guarantor`) REFERENCES `guarantor` (`id_guarantor`),
  CONSTRAINT `FK_operation_seller` FOREIGN KEY (`id_seller`) REFERENCES `seller` (`id_seller`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='table operation_detail';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_detail`
--

LOCK TABLES `operation_detail` WRITE;
/*!40000 ALTER TABLE `operation_detail` DISABLE KEYS */;
INSERT INTO `operation_detail` VALUES (1,1,0,0,33000,NULL,NULL,'2011-04-23',0,NULL,2),(2,1,0,0,41000,NULL,NULL,'2018-08-23',0,NULL,2),(3,1,0,0,35000,NULL,NULL,'2022-03-23',0,NULL,1),(4,1,0,0,39000,NULL,NULL,'2001-04-23',0,NULL,1),(5,0,1,600,0,'2021-03-12','2025-06-12',NULL,150,1,2),(6,1,0,0,38500,NULL,NULL,'2016-07-23',0,NULL,2),(7,1,0,0,49500,NULL,NULL,'2030-06-23',0,NULL,2),(8,0,1,450,0,'2022-04-19','2027-09-13',NULL,150,2,3),(9,1,0,0,37500,NULL,NULL,'2028-09-23',0,NULL,3),(10,1,0,0,39500,NULL,NULL,'2025-12-23',0,NULL,3);
/*!40000 ALTER TABLE `operation_detail` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `TRG_LOG_OPERATION_DETAIL` AFTER INSERT ON `operation_detail` FOR EACH ROW BEGIN
	INSERT INTO LOG_audit_create(name_action , name_table , user, date_action, time_action)
	VALUES ( 'INSERT' , 'operation_detail' , CURRENT_USER() , CURDATE(), CURTIME());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `TRG_LOG_OPERATION_DETAIL_ACTION` BEFORE UPDATE ON `operation_detail` FOR EACH ROW BEGIN
	INSERT INTO LOG_audit_action(name_field , id_table, name_action , name_table, user, date_action, time_action)
	VALUES ( CONCAT("OLD FIELD: ", OLD.value_sale, " NEW FIELD: ", NEW.value_sale),
			OLD.id_operation_detail,
            'UPDATE' ,
            'OPERATION_DETAIL' ,
            CURRENT_USER(),
            CURDATE(),
            CURTIME()) ;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `TRG_LOG_OPERATION_DETAIL_DELETE` BEFORE DELETE ON `operation_detail` FOR EACH ROW BEGIN
	INSERT INTO LOG_audit_action(name_field, id_table, name_action , name_table, user, date_action, time_action)
	VALUES ( CONCAT("DELETE OPERATION ID: ", OLD.id_operation_detail),
			OLD.id_operation_detail,
            'DELETE' ,
            'OPERATION_DETAIL' ,
            CURRENT_USER(),
            CURDATE(),
            CURTIME()) ;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owner` (
  `id_owner` int NOT NULL AUTO_INCREMENT COMMENT 'id owner',
  `first_name` varchar(25) NOT NULL COMMENT 'name owner',
  `last_name` varchar(25) NOT NULL COMMENT 'last name owner',
  `email` varchar(100) DEFAULT NULL COMMENT 'email owner',
  `phone` int NOT NULL COMMENT 'phone owner',
  `age` int NOT NULL COMMENT 'age owner',
  `quantity_properties` int NOT NULL COMMENT 'quantity properties',
  `id_seller` int DEFAULT NULL COMMENT 'id seller',
  PRIMARY KEY (`id_owner`) COMMENT 'Primary key',
  KEY `FK_owner_seller` (`id_seller`),
  CONSTRAINT `FK_owner_seller` FOREIGN KEY (`id_seller`) REFERENCES `seller` (`id_seller`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='table owner';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owner`
--

LOCK TABLES `owner` WRITE;
/*!40000 ALTER TABLE `owner` DISABLE KEYS */;
INSERT INTO `owner` VALUES (1,'Raquel','Mendoza','rq-mendoza@gmail.com',1125403023,41,1,1),(2,'Luis','Ríos','luisrios@gmail.com',1124304950,46,1,1),(3,'Aitana','Medina','AM@gmail.com',1124403023,43,1,2),(4,'Manuel','Rosales','manuelrosales@gmail.com',1142344543,64,1,2),(5,'Lourdes','Paredes','Louparedes@gmail.com',1112023994,69,2,2),(6,'Diego','Cordero','Diegocordero@gmail.com',1112572938,39,1,2),(7,'Elena','Ramírez','ElenaRamirez@gmail.com',1128383903,37,1,3),(8,'Guillermo','Arroyo','GArroyo@gmail.com',1122393039,29,1,3),(9,'Isabel','Peña','isapeña@gmail.com',1127473343,30,1,3);
/*!40000 ALTER TABLE `owner` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `TRG_LOG_OWNER` AFTER INSERT ON `owner` FOR EACH ROW BEGIN
	INSERT INTO LOG_audit_create(name_action , name_table , user, date_action, time_action)
	VALUES ( 'INSERT' , 'owner' , CURRENT_USER() , CURDATE(), CURTIME());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `TRG_LOG_OWNER_ACTION` BEFORE UPDATE ON `owner` FOR EACH ROW BEGIN
	INSERT INTO LOG_audit_action(name_field, id_table, name_action , name_table, user, date_action, time_action)
	VALUES ( CONCAT("OLD FIELD: ", OLD.first_name, " NEW FIELD: ", NEW.first_name),
			OLD.id_owner,
            'UPDATE' ,
            'OWNER' ,
            CURRENT_USER(),
            CURDATE(),
            CURTIME()) ;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `TRG_LOG_OWNER_DELETE` BEFORE DELETE ON `owner` FOR EACH ROW BEGIN
	INSERT INTO LOG_audit_action(name_field, id_table, name_action , name_table, user, date_action, time_action)
	VALUES ( CONCAT("DELETE OWNER: ", OLD.first_name),
			OLD.id_owner,
            'DELETE' ,
            'OWNER' ,
            CURRENT_USER(),
            CURDATE(),
            CURTIME()) ;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `property`
--

DROP TABLE IF EXISTS `property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property` (
  `id_property` int NOT NULL AUTO_INCREMENT COMMENT 'id property',
  `sale` tinyint(1) NOT NULL COMMENT '¿property sale?',
  `retal` tinyint(1) NOT NULL COMMENT '¿property rental?',
  `environments` int NOT NULL COMMENT 'quantity environments',
  `bathrooms` int NOT NULL COMMENT 'quantity bathrooms',
  `kitchens` int NOT NULL COMMENT 'quantity kitchens',
  `garden` tinyint(1) NOT NULL COMMENT 'property garden',
  `bedrooms` int NOT NULL COMMENT 'quantity bedrooms',
  `id_operation_detail` int DEFAULT NULL COMMENT 'id sale detail',
  `id_location` int DEFAULT NULL COMMENT 'id location property',
  `id_owner` int NOT NULL COMMENT 'id owner property',
  PRIMARY KEY (`id_property`) COMMENT 'Primary key',
  KEY `FK_property_operation` (`id_operation_detail`),
  KEY `FK_property_location` (`id_location`),
  KEY `FK_property_owner` (`id_owner`),
  CONSTRAINT `FK_property_location` FOREIGN KEY (`id_location`) REFERENCES `location` (`id_location`),
  CONSTRAINT `FK_property_operation` FOREIGN KEY (`id_operation_detail`) REFERENCES `operation_detail` (`id_operation_detail`),
  CONSTRAINT `FK_property_owner` FOREIGN KEY (`id_owner`) REFERENCES `owner` (`id_owner`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='table property';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property`
--

LOCK TABLES `property` WRITE;
/*!40000 ALTER TABLE `property` DISABLE KEYS */;
INSERT INTO `property` VALUES (1,1,0,3,1,1,0,1,1,1,5),(2,1,0,5,2,1,1,2,2,1,5),(3,1,0,3,1,1,0,1,3,2,1),(4,1,0,4,1,1,1,1,4,3,2),(5,0,1,7,2,1,1,3,5,5,3),(6,1,0,4,1,1,1,1,6,2,4),(7,1,0,8,2,1,1,4,7,4,6),(8,0,1,5,1,1,0,3,8,6,7),(9,1,0,4,1,1,1,1,9,5,8),(10,1,0,4,1,1,0,2,10,6,9);
/*!40000 ALTER TABLE `property` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `TRG_LOG_PROPERTY` AFTER INSERT ON `property` FOR EACH ROW BEGIN
	INSERT INTO LOG_audit_create(name_action , name_table , user, date_action, time_action)
	VALUES ( 'INSERT' , 'property' , CURRENT_USER() , CURDATE(), CURTIME());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `TRG_LOG_PROPERTY_ACTION` BEFORE UPDATE ON `property` FOR EACH ROW BEGIN
	INSERT INTO LOG_audit_action(name_field, id_table, name_action , name_table, user, date_action, time_action)
	VALUES ( CONCAT("OLD FIELD: ", OLD.sale, " NEW FIELD: ", NEW.sale),
			OLD.id_property,
            'UPDATE' ,
            'PROPERTY' ,
            CURRENT_USER(),
            CURDATE(),
            CURTIME()) ;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `TRG_LOG_PROPERTY_DELETE` BEFORE DELETE ON `property` FOR EACH ROW BEGIN
	INSERT INTO LOG_audit_action(name_field, id_table, name_action , name_table, user, date_action, time_action)
	VALUES ( CONCAT("DELETE PROPERTY FOR OWNER: ", OLD.id_owner),
			OLD.id_property,
            'DELETE' ,
            'PROPERTY' ,
            CURRENT_USER(),
            CURDATE(),
            CURTIME()) ;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller` (
  `id_seller` int NOT NULL AUTO_INCREMENT COMMENT 'id seller',
  `first_name` varchar(25) NOT NULL COMMENT 'name seller',
  `last_name` varchar(25) NOT NULL COMMENT 'last name seller',
  `email` varchar(100) DEFAULT NULL COMMENT 'email seller',
  `phone` int NOT NULL COMMENT 'phone seller',
  `sales` int NOT NULL COMMENT 'total sales seller',
  `rating` float NOT NULL COMMENT 'rating sales',
  PRIMARY KEY (`id_seller`) COMMENT 'Primary key'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='table seller';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES (1,'Cristian','Lorenzo','cristianventas@inmobiliaria.com',1121338847,13,3.9),(2,'Rebeca','Navarro','rebecaventas@inmobiliaria.com',1121273782,25,4.8),(3,'Lucas','Vázques','Lucasventas@inmobiliaria.com',1123123964,21,4.2);
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `TRG_LOG_SELLER` AFTER INSERT ON `seller` FOR EACH ROW BEGIN
	INSERT INTO LOG_audit_create(name_action , name_table , user, date_action, time_action)
	VALUES ( 'INSERT' , 'seller' , CURRENT_USER() , CURDATE(), CURTIME());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `TRG_LOG_SELLER_ACTION` BEFORE UPDATE ON `seller` FOR EACH ROW BEGIN
	INSERT INTO LOG_audit_action(name_field , id_table, name_action , name_table, user, date_action, time_action)
	VALUES ( CONCAT("OLD FIELD: ", OLD.first_name, " NEW FIELD: ", NEW.first_name),
			OLD.id_seller,
            'UPDATE' ,
            'SELLER' ,
            CURRENT_USER(),
            CURDATE(), 
            CURTIME() ) ;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `TRG_LOG_SELLER_DELETE` BEFORE DELETE ON `seller` FOR EACH ROW BEGIN
	INSERT INTO LOG_audit_action(name_field, id_table, name_action , name_table, user, date_action, time_action)
	VALUES ( CONCAT("DELETE SELLER: ", OLD.first_name),
			OLD.id_seller,
            'DELETE' ,
            'SELLER' ,
            CURRENT_USER(),
            CURDATE(),
            CURTIME()) ;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tenant`
--

DROP TABLE IF EXISTS `tenant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tenant` (
  `id_tenant` int NOT NULL AUTO_INCREMENT COMMENT 'id tenant',
  `first_name` varchar(25) NOT NULL COMMENT 'name tenant',
  `last_name` varchar(25) NOT NULL COMMENT 'last name tenant',
  `email` varchar(100) DEFAULT NULL COMMENT 'email tenant',
  `phone` int NOT NULL COMMENT 'phone tenant',
  `age` int NOT NULL COMMENT 'age tenant',
  `civil_status` varchar(25) NOT NULL COMMENT 'civil status',
  `childrens` tinyint(1) NOT NULL COMMENT 'childrens',
  `id_seller` int DEFAULT NULL COMMENT 'id seller',
  PRIMARY KEY (`id_tenant`) COMMENT 'Primary key',
  KEY `FK_tenant_seller` (`id_seller`),
  CONSTRAINT `FK_tenant_seller` FOREIGN KEY (`id_seller`) REFERENCES `seller` (`id_seller`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='table tenant';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant`
--

LOCK TABLES `tenant` WRITE;
/*!40000 ALTER TABLE `tenant` DISABLE KEYS */;
INSERT INTO `tenant` VALUES (1,'Alexis','Gonzáles','A.G@gmail.com',1123324324,45,'soltero',0,1),(2,'Monica','Pérez','M.Pérez@gmail.com',1121333232,52,'casado',1,1),(3,'Roberto','Rodriguez','roberto.rodriguez@gmail.com',1123233233,23,'soltero',0,1),(4,'Carlos','Martínez','cm@gmail.com',1142342344,34,'soltero',0,2),(5,'Esteban','Sánchez','EstebanSan@gmail.com',1134994920,53,'soltero',0,2),(6,'María','López','Mlopez@gmail.com',1132430400,19,'soltero',0,2),(7,'José','García','jgarcia@gmail.com',1140284433,67,'soltero',0,3),(8,'Mariano','Fernández','marianof@gmail.com',1145454322,32,'casado',0,3),(9,'Alfonso','Torres','alftorr@gmail.com',1144432004,36,'soltero',0,3),(10,'Ricardo','Díaz','ricardodiaz@gmail.com',1124444432,41,'casado',1,1),(11,'Mariano','Morales','marianomorales@gmail.com',1119901923,27,'soltero',0,2);
/*!40000 ALTER TABLE `tenant` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `TRG_LOG_TENANT` AFTER INSERT ON `tenant` FOR EACH ROW BEGIN
	INSERT INTO LOG_audit_create(name_action , name_table , user, date_action, time_action)
	VALUES ( 'INSERT' , 'tenant' , CURRENT_USER() , CURDATE(), CURTIME());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `TRG_LOG_TENANT_ACTION` BEFORE UPDATE ON `tenant` FOR EACH ROW BEGIN
	INSERT INTO LOG_audit_action(name_field, id_table, name_action , name_table, user, date_action, time_action)
	VALUES ( CONCAT("OLD FIELD: ", OLD.first_name, " NEW FIELD: ", NEW.first_name),
			OLD.id_tenant,
            'UPDATE' ,
            'TENANT' ,
            CURRENT_USER(),
            CURDATE(),
            CURTIME()) ;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `TRG_LOG_TENANT_DELETE` BEFORE DELETE ON `tenant` FOR EACH ROW BEGIN
	INSERT INTO LOG_audit_action(name_field, id_table, name_action , name_table, user, date_action, time_action)
	VALUES ( CONCAT("DELETE TENANT: ", OLD.first_name),
			OLD.id_tenant,
            'DELETE' ,
            'TENANT' ,
            CURRENT_USER(),
            CURDATE(),
            CURTIME()) ;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `view_property_location_owner`
--

DROP TABLE IF EXISTS `view_property_location_owner`;
/*!50001 DROP VIEW IF EXISTS `view_property_location_owner`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_property_location_owner` AS SELECT 
 1 AS `id_property`,
 1 AS `sale`,
 1 AS `retal`,
 1 AS `environments`,
 1 AS `bathrooms`,
 1 AS `kitchens`,
 1 AS `garden`,
 1 AS `bedrooms`,
 1 AS `province`,
 1 AS `country`,
 1 AS `department`,
 1 AS `owner_first_name`,
 1 AS `owner_last_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_seller_operation`
--

DROP TABLE IF EXISTS `view_seller_operation`;
/*!50001 DROP VIEW IF EXISTS `view_seller_operation`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_seller_operation` AS SELECT 
 1 AS `seller_first_name`,
 1 AS `seller_last_name`,
 1 AS `is_sale`,
 1 AS `is_rent`,
 1 AS `value_rent`,
 1 AS `value_sale`,
 1 AS `rent_start`,
 1 AS `rent_end`,
 1 AS `sale_date`,
 1 AS `value_inscription`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_tenant_operation_guarantor`
--

DROP TABLE IF EXISTS `view_tenant_operation_guarantor`;
/*!50001 DROP VIEW IF EXISTS `view_tenant_operation_guarantor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_tenant_operation_guarantor` AS SELECT 
 1 AS `tenant_first_name`,
 1 AS `tenant_last_name`,
 1 AS `is_sale`,
 1 AS `is_rent`,
 1 AS `value_rent`,
 1 AS `value_sale`,
 1 AS `rent_start`,
 1 AS `rent_end`,
 1 AS `sale_date`,
 1 AS `value_inscription`,
 1 AS `guarantor_first_name`,
 1 AS `guarantor_last_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'dbrealstate'
--

--
-- Dumping routines for database 'dbrealstate'
--
/*!50003 DROP FUNCTION IF EXISTS `FN_ERROR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` FUNCTION `FN_ERROR`(
	P_message VARCHAR(250)
) RETURNS varchar(250) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE message_error VARCHAR(250);

    SET message_error = P_message;
    
    RETURN message_error;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FN_is_mail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` FUNCTION `FN_is_mail`(
    P_mail VARCHAR(250)
) RETURNS varchar(250) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE message_error VARCHAR(250);
    SET message_error = "";
    
    IF P_mail LIKE "%@%" THEN
        SET message_error = "OK";
    ELSE
        SET message_error = CONCAT("El mail ", P_mail, " no contiene @");
    END IF;
    
    RETURN message_error;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FN_seller_rating` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` FUNCTION `FN_seller_rating`(
	par_id_seller INT
) RETURNS float
    DETERMINISTIC
BEGIN
    DECLARE query_seller_rating FLOAT;

    SET query_seller_rating = (
        SELECT rating
        FROM seller
        WHERE seller.id_seller = par_id_seller
    );
    RETURN query_seller_rating;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_calculate_seller_commission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `SP_calculate_seller_commission`(
    IN P_id_operation INT,
    OUT P_commission FLOAT
)
BEGIN
    DECLARE commission FLOAT;
    SELECT 
        CASE 
            WHEN is_sale = 1 THEN value_sale * 0.10
            WHEN is_rent = 1 THEN value_rent * 0.05
            ELSE 0.00 
        END INTO commission
    FROM operation_detail
    WHERE id_operation_detail = P_id_operation;
    SET P_commission = commission;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_insert_table` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `SP_insert_table`(
    IN p_table_name VARCHAR(255),
    IN p_columns TEXT,
    IN p_values TEXT
)
BEGIN
    SET @query_insert = CONCAT("INSERT INTO ", p_table_name, " (", p_columns, ") VALUES (", p_values, ");");
    PREPARE param_query FROM @query_insert;
    EXECUTE param_query;
    DEALLOCATE PREPARE param_query;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_tables_relations` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `SP_tables_relations`(IN P_name_table VARCHAR(25),
									 IN P_name_constraint VARCHAR(35),
									 IN P_fk_id VARCHAR(25),
									 IN P_reference_table VARCHAR(25),
									 IN P_reference_id VARCHAR(25)
									 )
BEGIN

	IF P_name_table 
    OR P_name_constraint
    OR P_fk_id
    OR P_reference_table
    OR P_reference_id <> "" THEN
		SET @alter_table = CONCAT('ALTER TABLE ', P_name_table, 
								 ' ADD CONSTRAINT ', P_name_constraint, 
								 ' FOREIGN KEY ', "(", P_fk_id ,")"
								 ' REFERENCES ', P_reference_table, "(", P_reference_id, ")");
		-- Precompila string con query completa
		PREPARE param_at FROM @alter_table;
		-- Ejecuta query
		EXECUTE param_at;
		-- Liberar statement compilado
		DEALLOCATE PREPARE param_at;
	ELSE
		SELECT FN_ERROR("Los parametros no pueden estár vacios");
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_update_rent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `SP_update_rent`(
    IN P_id_operation INT,
    IN P_value_rent FLOAT,
    IN P_value_inscription FLOAT,
    IN P_rent_start DATE,
    IN P_rent_end DATE,
    IN P_id_guarantor INT
)
BEGIN
    IF P_id_operation IS NOT NULL
        AND P_value_rent IS NOT NULL
        AND P_rent_start IS NOT NULL
        AND P_rent_end IS NOT NULL
        AND P_id_guarantor IS NOT NULL
        AND P_value_inscription IS NOT NULL THEN

        SET @query_rent = CONCAT('UPDATE operation_detail
                                    SET value_rent = ', P_value_rent, ',
                                        rent_start = "', P_rent_start, '",
                                        rent_end = "', P_rent_end, '",
                                        id_guarantor = ', P_id_guarantor, ',
                                        value_inscription = ', P_value_inscription, '
                                    WHERE id_operation_detail = ', P_id_operation);

        PREPARE param_query FROM @query_rent;
        EXECUTE param_query;
        DEALLOCATE PREPARE param_query;
    ELSE
        SELECT FN_ERROR('Los parametros no pueden estar vacios');
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_update_sale` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `SP_update_sale`(
    IN P_id_operation INT,
    IN P_value_sale FLOAT,
    IN P_sale_date DATE
)
BEGIN
    IF P_id_operation IS NOT NULL
        AND P_value_sale IS NOT NULL
        AND P_sale_date IS NOT NULL THEN
        SET @query_sale = CONCAT('UPDATE operation_detail
                                    SET value_sale = ', P_value_sale, ',
                                        sale_date = "', P_sale_date, '"
									WHERE id_operation_detail = ', P_id_operation);

        PREPARE param_query FROM @query_sale;
        EXECUTE param_query;
        DEALLOCATE PREPARE param_query;
    ELSE
        SELECT FN_ERROR('Los parametros no pueden estar vacios');
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `view_property_location_owner`
--

/*!50001 DROP VIEW IF EXISTS `view_property_location_owner`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_property_location_owner` AS select `p`.`id_property` AS `id_property`,`p`.`sale` AS `sale`,`p`.`retal` AS `retal`,`p`.`environments` AS `environments`,`p`.`bathrooms` AS `bathrooms`,`p`.`kitchens` AS `kitchens`,`p`.`garden` AS `garden`,`p`.`bedrooms` AS `bedrooms`,`l`.`province` AS `province`,`l`.`country` AS `country`,`l`.`department` AS `department`,`o`.`first_name` AS `owner_first_name`,`o`.`last_name` AS `owner_last_name` from ((`property` `p` join `location` `l` on((`p`.`id_location` = `l`.`id_location`))) left join `owner` `o` on((`p`.`id_owner` = `o`.`id_owner`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_seller_operation`
--

/*!50001 DROP VIEW IF EXISTS `view_seller_operation`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_seller_operation` AS select `s`.`first_name` AS `seller_first_name`,`s`.`last_name` AS `seller_last_name`,`o`.`is_sale` AS `is_sale`,`o`.`is_rent` AS `is_rent`,`o`.`value_rent` AS `value_rent`,`o`.`value_sale` AS `value_sale`,`o`.`rent_start` AS `rent_start`,`o`.`rent_end` AS `rent_end`,`o`.`sale_date` AS `sale_date`,`o`.`value_inscription` AS `value_inscription` from (`seller` `s` join `operation_detail` `o` on((`s`.`id_seller` = `o`.`id_seller`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_tenant_operation_guarantor`
--

/*!50001 DROP VIEW IF EXISTS `view_tenant_operation_guarantor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_tenant_operation_guarantor` AS select `t`.`first_name` AS `tenant_first_name`,`t`.`last_name` AS `tenant_last_name`,`o`.`is_sale` AS `is_sale`,`o`.`is_rent` AS `is_rent`,`o`.`value_rent` AS `value_rent`,`o`.`value_sale` AS `value_sale`,`o`.`rent_start` AS `rent_start`,`o`.`rent_end` AS `rent_end`,`o`.`sale_date` AS `sale_date`,`o`.`value_inscription` AS `value_inscription`,`g`.`first_name` AS `guarantor_first_name`,`g`.`last_name` AS `guarantor_last_name` from ((`tenant` `t` join `operation_detail` `o` on((`t`.`id_seller` = `o`.`id_seller`))) left join `guarantor` `g` on((`o`.`id_guarantor` = `g`.`id_guarantor`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-19 16:32:10
