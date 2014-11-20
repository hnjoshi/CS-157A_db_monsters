CREATE DATABASE  IF NOT EXISTS `db_monsters_crs` /*!40100 DEFAULT CHARACTER SET utf8 */;
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
  CONSTRAINT `fk_Course_department1` FOREIGN KEY (`dID`) REFERENCES `department` (`dID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (15,'CS 157A',3,'Open',32,'FALL','2014-08-25','2014-12-10','00:00:00','00:00:00',1),(16,'CS 160',3,'Open',33,'FALL','2014-08-25','2014-12-10','00:00:00','00:00:00',1),(17,'CS 157A',3,'Open',34,'FALL','2014-08-25','2014-12-10','00:00:00','00:00:00',1),(18,'CS 174',3,'Open',35,'FALL','2014-08-25','2014-12-10','00:00:00','00:00:00',1),(19,'CS 147',3,'Open',30,'FALL','2014-08-25','2014-12-10','00:00:00','00:00:00',1),(20,'SE 879',3,'Open',36,'SUMMER','2014-08-25','2014-12-10','00:00:00','00:00:00',2),(21,'SE 390',3,'Open',33,'WINTER','2014-08-25','2014-12-10','00:00:00','00:00:00',2),(22,'ART 1',3,'Open',32,'SPRING','2014-08-25','2014-12-10','00:00:00','00:00:00',3),(23,'ART 2',3,'Open',40,'SPRING','2014-08-25','2014-12-10','00:00:00','00:00:00',3),(24,'ENGL 903',3,'Open',48,'SPRING','2014-08-25','2014-12-10','00:00:00','00:00:00',4),(25,'ENGL 905',3,'Open',48,'SPRING','2014-08-25','2014-12-10','00:00:00','00:00:00',4),(26,'ENGL 908',3,'Open',42,'SUMMER','2014-08-25','2014-12-10','00:00:00','00:00:00',4),(27,'ENGL 1A',4,'Open',45,'SUMMER','2014-08-25','2014-12-10','00:00:00','00:00:00',4),(28,'ENGL 1B',4,'Open',47,'WINTER','2014-08-25','2014-12-10','00:00:00','00:00:00',4);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

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
  `updatedON` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`aID`),
  KEY `fk_OfficeAssignment_instructor1_idx` (`iID`),
  KEY `fk_officeassignment_course1_idx` (`cID`),
  CONSTRAINT `fk_OfficeAssignment_instructor1` FOREIGN KEY (`iID`) REFERENCES `instructor` (`iID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_officeassignment_course1` FOREIGN KEY (`cID`) REFERENCES `course` (`cID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseassignment`
--

LOCK TABLES `courseassignment` WRITE;
/*!40000 ALTER TABLE `courseassignment` DISABLE KEYS */;
INSERT INTO `courseassignment` VALUES (1,'MQH 911',1,15,'2014-11-20 07:48:56'),(2,'MQH 211',2,16,'2014-11-20 07:48:56'),(3,'MQH 591',5,17,'2014-11-20 07:48:56'),(4,'DH 342',6,18,'2014-11-20 07:48:56'),(5,'DH 901',1,19,'2014-11-20 07:48:56'),(6,'DH 343',3,20,'2014-11-20 07:48:56'),(7,'DH 342',4,21,'2014-11-20 07:48:56'),(8,'MQH 911',7,22,'2014-11-20 07:48:56'),(9,'MQH 211',7,23,'2014-11-20 07:48:56'),(10,'MQH 591',8,24,'2014-11-20 07:48:56'),(11,'ENG 290',8,25,'2014-11-20 07:48:56'),(12,'DH 901',8,26,'2014-11-20 07:48:56'),(13,'MQH 211',8,27,'2014-11-20 07:48:56'),(14,'ENG 290',8,28,'2014-11-20 07:48:56');
/*!40000 ALTER TABLE `courseassignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `dID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Budget` float DEFAULT NULL,
  `StartDate` date NOT NULL,
  PRIMARY KEY (`dID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Computer Science',900001,'2002-12-26'),(2,'Software Engineering',800001,'2002-12-26'),(3,'Art',300000,'2000-04-06'),(4,'English',400000,'2003-03-15');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrollment` (
  `eID` int(11) NOT NULL AUTO_INCREMENT,
  `Grade` varchar(2) DEFAULT NULL,
  `sID` int(11) NOT NULL,
  `cID` int(11) NOT NULL,
  `updatedON` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`eID`),
  KEY `fk_Enrollment_student1_idx` (`sID`),
  KEY `fk_enrollment_course1_idx` (`cID`),
  CONSTRAINT `fk_Enrollment_student1` FOREIGN KEY (`sID`) REFERENCES `student` (`sID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_enrollment_course1` FOREIGN KEY (`cID`) REFERENCES `course` (`cID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
INSERT INTO `enrollment` VALUES (1,NULL,8,15,'2014-11-20 07:48:57'),(2,NULL,9,16,'2014-11-20 07:48:57'),(3,NULL,10,17,'2014-11-20 07:48:57'),(4,NULL,11,20,'2014-11-20 07:48:57'),(5,NULL,12,18,'2014-11-20 07:48:57'),(6,NULL,13,22,'2014-11-20 07:48:57'),(7,NULL,14,21,'2014-11-20 07:48:57'),(8,NULL,16,24,'2014-11-20 07:48:57'),(9,NULL,8,19,'2014-11-20 07:48:57'),(10,NULL,13,23,'2014-11-20 07:48:57'),(11,NULL,16,25,'2014-11-20 07:48:57'),(12,NULL,16,26,'2014-11-20 07:48:57'),(13,NULL,8,17,'2014-11-20 07:48:57');
/*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER CourseStatus_Waitlisted
AFTER INSERT ON enrollment
FOR EACH ROW
BEGIN
	IF (select count(*) from enrollment where cID=new.cID) = 
    (select nSeats from course where cID=new.cID) THEN     
    update course set course.status = 'waitlisted'
    where cID=new.cID;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER CourseStatus_Open
AFTER DELETE ON enrollment
FOR EACH ROW
BEGIN
	IF (select count(*) from enrollment where cID=old.cID) < 
		(select nSeats from course where cID=old.cID)
	THEN     
		update course set course.status = 'open'
		where cID=old.cID;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructor` (
  `iID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(45) NOT NULL,
  `Password` varchar(256) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `HireDate` date NOT NULL,
  `dID` int(11) NOT NULL,
  PRIMARY KEY (`iID`,`UserName`),
  KEY `fk_instructor_department1_idx` (`dID`),
  CONSTRAINT `fk_instructor_department1` FOREIGN KEY (`dID`) REFERENCES `department` (`dID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES (1,'skim','','Suney','Kim','2007-01-20',1),(2,'rmak','','Mak','Ron','0000-00-00',1),(3,'plavallo','','Lavallo','Pat','0000-00-00',2),(4,'rjoshi','','Joshi','Rutvik','0000-00-00',2),(5,'ngupta','','Gupta','Neha','0000-00-00',1),(6,'ppatel','','Patel','Pollette','0000-00-00',1),(7,'mmistry','','Mistry','Mitali','0000-00-00',3),(8,'vpatel','','Patel','Vipul','0000-00-00',4);
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `sID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(45) NOT NULL,
  `Password` varchar(256) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `AdmissionDate` date NOT NULL,
  `dID` int(11) NOT NULL,
  PRIMARY KEY (`sID`,`UserName`),
  KEY `fk_student_department1_idx` (`dID`),
  CONSTRAINT `fk_student_department1` FOREIGN KEY (`dID`) REFERENCES `department` (`dID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (8,'hnjoshi','','Joshi','Hardik','2013-05-26',1),(9,'jpatel','','Patel','Jay','2012-06-09',1),(10,'jdesai','','Desai','Jagrut','2010-07-02',1),(11,'rjoshi','','Joshi','Rutvik','2009-12-20',2),(12,'sgajjar','','Gajjar','Shail','2011-04-23',1),(13,'rpanchal','','Panchal','Rajvi','2013-05-26',3),(14,'ssaini','','Saini','Sonam','2014-04-30',2),(15,'sshah','','Shah','Shukan','2010-06-10',1),(16,'pshah','','Shah','Priyank','2008-06-19',4);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_monsters_crs'
--
/*!50003 DROP PROCEDURE IF EXISTS `CountEnrollment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CountEnrollment`(IN courseID INT, OUT total INT)
    DETERMINISTIC
    COMMENT 'A procedure to return number of enrollment for given cID'
BEGIN
    SELECT count(*) INTO total FROM enrollment WHERE cID=courseID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-19 23:52:16
