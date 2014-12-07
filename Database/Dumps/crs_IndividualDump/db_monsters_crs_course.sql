CREATE DATABASE  IF NOT EXISTS `db_monsters_crs` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `db_monsters_crs`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: db_monsters_crs
-- ------------------------------------------------------
-- Server version	5.5.39

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
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `cID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) NOT NULL,
  `Credits` int(11) NOT NULL,
  `Status` varchar(10) NOT NULL,
  `nSeats` int(11) DEFAULT NULL,
  `Term` varchar(10) DEFAULT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `StartTime` time NOT NULL,
  `EndTime` time NOT NULL,
  `dID` int(11) NOT NULL,
  PRIMARY KEY (`cID`),
  KEY `fk_Course_department1_idx` (`dID`),
  CONSTRAINT `fk_Course_department1` FOREIGN KEY (`dID`) REFERENCES `department` (`dID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (15,'CS 157A',3,'open',4,'FALL','2014-08-25','2014-12-18','10:30:00','11:45:00',1),(16,'CS 160',3,'open',33,'FALL','2014-08-25','2014-12-18','15:00:00','16:15:00',1),(17,'CS 157A',3,'open',34,'FALL','2014-08-25','2014-12-18','19:30:00','20:45:00',1),(18,'CS 174',3,'open',35,'FALL','2014-08-25','2014-12-18','10:30:00','11:45:00',1),(19,'CS 147',3,'open',30,'FALL','2014-08-25','2014-12-18','18:00:00','19:15:00',1),(20,'SE 879',3,'open',36,'SUMMER','2014-08-25','2014-12-18','15:00:00','16:15:00',2),(21,'SE 390',3,'open',33,'WINTER','2014-08-25','2014-12-18','07:00:00','08:15:00',2),(22,'ART 1',3,'open',32,'SPRING','2014-08-25','2014-12-18','10:30:00','11:45:00',3),(23,'ART 2',3,'open',40,'SPRING','2014-08-25','2014-12-18','14:30:00','15:45:00',3),(24,'ENGL 903',3,'open',48,'SPRING','2014-08-25','2014-12-18','09:30:00','10:45:00',4),(25,'ENGL 905',3,'Open',48,'SPRING','2014-08-25','2014-12-18','12:00:00','13:15:00',4),(26,'ENGL 908',3,'open',42,'SUMMER','2014-08-25','2014-12-18','14:30:00','15:45:00',4),(27,'ENGL 1A',4,'open',45,'SUMMER','2014-08-25','2014-12-18','08:30:00','09:45:00',4),(28,'ENGL 1B',4,'open',47,'WINTER','2014-08-25','2014-12-18','09:00:00','10:15:00',4),(29,'CS 100W',3,'open',30,'SPRING','2015-01-22','2015-05-22','10:30:00','11:45:00',1),(30,'CS 156',3,'Open',25,'SPRING','2015-01-22','2015-05-22','13:30:00','14:45:00',1),(31,'CS 134',3,'open',25,'SPRING','2015-01-22','2015-05-22','16:30:00','17:45:00',1),(32,'CS 47',4,'open',50,'SPRING','2015-01-22','2015-05-22','13:00:00','14:45:00',1),(33,'CS 149',3,'open',30,'SPRING','2015-01-22','2015-05-22','07:30:00','08:45:00',1),(34,'CS 46A',3,'Open',100,'SPRING','2015-01-22','2015-05-22','12:00:00','13:15:00',1),(35,'CS 46B',3,'Open',100,'SPRING','2015-01-22','2015-05-22','15:00:00','16:15:00',1),(36,'CS 46ALAB',0,'Open',25,'SPRING','2015-01-22','2015-05-22','08:00:00','10:45:00',1),(37,'CS 46BLAB',0,'Open',25,'SPRING','2015-01-22','2015-05-22','11:00:00','13:45:00',1),(38,'CS 159',3,'open',30,'SPRING','2015-01-22','2015-05-22','15:00:00','16:15:00',1),(39,'CS 185C',3,'Open',25,'SPRING','2015-01-22','2015-05-22','09:00:00','10:15:00',1),(40,'CS 154',3,'Open',30,'SPRING','2015-01-22','2015-05-22','13:30:00','14:45:00',1),(41,'ENGL 10',3,'Open',25,'FALL','2014-08-25','2014-12-18','09:00:00','10:15:00',4),(42,'ENGL 22',3,'Open',30,'FALL','2014-08-25','2014-12-18','10:30:00','11:45:00',4),(43,'ENGL 56A',3,'Open',30,'FALL','2014-08-25','2014-12-18','12:00:00','13:15:00',4),(44,'ENGL 56B',3,'Open',30,'FALL','2014-08-25','2014-12-18','09:00:00','10:15:00',4),(45,'ENGL 117A',3,'Open',100,'FALL','2014-08-25','2014-12-18','15:00:00','17:45:00',4),(46,'ENGL 117B',3,'Open',100,'FALL','2014-08-25','2014-12-18','09:30:00','12:15:00',4),(47,'ENGL 125',3,'Open',25,'FALL','2014-08-25','2014-12-18','12:00:00','13:15:00',4),(48,'ENGL 130',3,'open',20,'FALL','2014-08-25','2014-12-18','12:00:00','13:15:00',4),(49,'ENGL 144',3,'open',30,'FALL','2014-08-25','2014-12-18','13:30:00','14:45:00',4),(50,'ENGL 168',3,'open',30,'FALL','2014-08-25','2014-12-18','10:30:00','11:45:00',4),(51,'ART 100',3,'Open',30,'FALL','2014-08-25','2014-12-18','09:00:00','10:15:00',3),(52,'ART 110',3,'Open',30,'FALL','2014-08-25','2014-12-18','07:30:00','08:45:00',3),(53,'ART 174',3,'Open',20,'FALL','2014-08-25','2014-12-18','10:30:00','11:45:00',3);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-06 16:52:02
