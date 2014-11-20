CREATE DATABASE  IF NOT EXISTS `db_monsters_crs` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `db_monsters_crs`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_monsters_crs
-- ------------------------------------------------------
-- Server version	5.6.20

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
-- Table structure for table `courseassignment`
--

DROP TABLE IF EXISTS `courseassignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseassignment` (
  `aID` int(11) NOT NULL AUTO_INCREMENT,
  `Location` varchar(255) NOT NULL,
  `iID` int(11) NOT NULL,
  `cID` int(11) NOT NULL,
  PRIMARY KEY (`aID`),
  KEY `fk_OfficeAssignment_instructor1_idx` (`iID`),
  KEY `fk_officeassignment_course1_idx` (`cID`),
  CONSTRAINT `fk_OfficeAssignment_instructor1` FOREIGN KEY (`iID`) REFERENCES `instructor` (`iID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_officeassignment_course1` FOREIGN KEY (`cID`) REFERENCES `course` (`cID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseassignment`
--

LOCK TABLES `courseassignment` WRITE;
/*!40000 ALTER TABLE `courseassignment` DISABLE KEYS */;
INSERT INTO `courseassignment` VALUES (1,'MQH 911',1,15),(2,'MQH 211',2,16),(3,'MQH 591',5,17),(4,'DH 342',6,18),(5,'DH 901',1,19),(6,'DH 343',3,20),(7,'DH 342',4,21),(8,'MQH 911',7,22),(9,'MQH 211',7,23),(10,'MQH 591',8,24),(11,'ENG 290',8,25),(12,'DH 901',8,26),(13,'MQH 211',8,27),(14,'ENG 290',8,28);
/*!40000 ALTER TABLE `courseassignment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-13 20:48:33
