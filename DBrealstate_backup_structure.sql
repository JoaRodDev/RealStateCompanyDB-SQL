CREATE DATABASE  IF NOT EXISTS `DBrealstate` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `DBrealstate`;
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-04 22:24:41
