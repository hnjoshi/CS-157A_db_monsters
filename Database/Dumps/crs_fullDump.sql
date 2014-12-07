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
-- Table structure for table `archenrollment`
--

DROP TABLE IF EXISTS `archenrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archenrollment` (
  `eID` int(11) NOT NULL DEFAULT '0',
  `Grade` varchar(2) DEFAULT NULL,
  `sID` int(11) DEFAULT NULL,
  `cID` int(11) DEFAULT NULL,
  `updatedON` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`eID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archenrollment`
--

LOCK TABLES `archenrollment` WRITE;
/*!40000 ALTER TABLE `archenrollment` DISABLE KEYS */;
/*!40000 ALTER TABLE `archenrollment` ENABLE KEYS */;
UNLOCK TABLES;

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
  `updatedON` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`aID`),
  KEY `fk_OfficeAssignment_instructor1_idx` (`iID`),
  KEY `fk_officeassignment_course1_idx` (`cID`),
  CONSTRAINT `fk_officeassignment_course1` FOREIGN KEY (`cID`) REFERENCES `course` (`cID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_OfficeAssignment_instructor1` FOREIGN KEY (`iID`) REFERENCES `instructor` (`iID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseassignment`
--

LOCK TABLES `courseassignment` WRITE;
/*!40000 ALTER TABLE `courseassignment` DISABLE KEYS */;
INSERT INTO `courseassignment` VALUES (1,'MH211',1,16,'2014-11-28 01:41:34'),(2,'WSQ 102',2,34,'2014-11-29 05:20:25'),(3,'WSQ 102',2,33,'2014-11-29 05:20:25'),(4,'WSQ 210',3,45,'2014-11-29 05:20:25'),(5,'WSQ 210',3,46,'2014-11-29 05:20:25'),(6,'SCI 311',4,29,'2014-11-29 05:20:25'),(11,'MH231',1,18,'2014-11-30 00:21:56'),(12,'MH111',5,22,'2014-11-30 01:15:43'),(13,'MH222',5,23,'2014-11-30 01:15:43'),(14,'MH222',1,20,'2014-12-05 02:03:14'),(15,'MQH21',1,21,'2014-12-05 02:03:14'),(16,'MH34',8,22,'2014-12-05 02:47:48'),(17,'MH23',8,23,'2014-12-05 02:47:48');
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
  `updatedON` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`eID`),
  KEY `fk_Enrollment_student1_idx` (`sID`),
  KEY `fk_enrollment_course1_idx` (`cID`),
  CONSTRAINT `fk_enrollment_course1` FOREIGN KEY (`cID`) REFERENCES `course` (`cID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_Enrollment_student1` FOREIGN KEY (`sID`) REFERENCES `student` (`sID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
INSERT INTO `enrollment` VALUES (14,'A+',4,22,'2014-11-30 01:17:15'),(16,'NA',2,15,'2014-11-29 05:15:50'),(19,'a+',5,16,'2014-11-29 21:18:37'),(21,'b-',3,16,'2014-11-30 00:27:43'),(22,'b',3,18,'2014-11-30 00:28:24'),(23,'NA',3,15,'2014-11-29 16:23:00'),(30,'b-',6,20,'2014-12-07 00:37:15'),(31,'NA',6,21,'2014-11-29 16:40:16'),(35,'c',4,18,'2014-12-04 19:25:00'),(54,'NA',7,41,'2014-11-30 23:58:28'),(55,'NA',7,42,'2014-11-30 23:58:30'),(56,'NA',7,43,'2014-11-30 23:58:33'),(59,'NA',8,15,'2014-12-03 02:41:46'),(61,'NA',8,17,'2014-12-03 02:41:55'),(62,'NA',8,18,'2014-12-03 02:42:34'),(63,'NA',8,19,'2014-12-03 02:42:36'),(64,'NA',9,17,'2014-12-03 09:57:41'),(65,'NA',2,16,'2014-12-04 03:42:22'),(66,'NA',2,23,'2014-12-04 03:46:18'),(92,'NA',1,16,'2014-12-06 16:11:57'),(93,'NA',1,18,'2014-12-06 16:12:03'),(94,'NA',1,19,'2014-12-06 16:12:07'),(95,'NA',1,22,'2014-12-06 16:12:12'),(96,'NA',1,28,'2014-12-06 16:12:18');
/*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER UpdateCourseStatus_toClose
AFTER INSERT ON enrollment
FOR EACH ROW
BEGIN
DECLARE totalSeats INT DEFAULT 0;
DECLARE currentEnrolled INT DEFAULT 0;

SET totalSeats = (select nSeats from course c where c.cID=new.cID);
SET currentEnrolled = (select count(*) from enrollment e where e.cID=new.cID);

 IF (totalSeats = currentEnrolled)
 THEN
  update course set course.status = 'close'
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
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER UpdateCourseStatus_toOpen
AFTER DELETE ON enrollment
FOR EACH ROW
BEGIN
DECLARE totalSeats INT DEFAULT 0;
DECLARE currentEnrolled INT DEFAULT 0;

SET totalSeats = (select nSeats from course c where c.cID=old.cID);
SET currentEnrolled = (select count(*) from enrollment e where e.cID=old.cID);

 IF (totalSeats > currentEnrolled)
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
  CONSTRAINT `fk_instructor_department1` FOREIGN KEY (`dID`) REFERENCES `department` (`dID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES (1,'rnjoshi','��f���r���.Dn|_ķ���G�����uo^','Joshi','Rutvik','2014-11-27',1),(2,'rmak','m=��I2p�O���@��X�2_K�\ZO�','mak','ron','2014-11-28',1),(3,'jengell','m=��I2p�O���@��X�2_K�\ZO�','engell','john','2014-11-28',4),(4,'dcaires','m=��I2p�O���@��X�2_K�\ZO�','caires','debra','2014-11-29',1),(5,'tinku','����bӰ�DSK��h��:zU�Wk���','Panchal','Tinku','2014-11-29',3),(6,'taustin','���ü6dL�0��P�Y!��A�\'q/��3U�K','austin','thomas','2014-12-01',1),(7,'fbutt','���ü6dL�0��P�Y!��A�\'q/��3U�K','butt','frank','2009-12-03',1),(8,'myinst','��f���r���.Dn|_ķ���G�����uo^','last','first','2014-12-04',3);
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
  CONSTRAINT `fk_student_department1` FOREIGN KEY (`dID`) REFERENCES `department` (`dID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'hnjoshi','��f���r���.Dn|_ķ���G�����uo^','Joshi','Hardik','2014-11-23',1),(2,'test','vq�/l3���|����W���Q:�H/V','test','test','2014-11-26',1),(3,'sgajjar','��f���r���.Dn|_ķ���G�����uo^','Gajjar','Shail','2014-11-28',2),(4,'rpanchal','��f���r���.Dn|_ķ���G�����uo^','Panchal','Rajvi','2014-11-28',3),(5,'jay','���\"�\n�!45z�8������I��SA}+�','patel','jay','2014-11-29',1),(6,'prem','��f���r���.Dn|_ķ���G�����uo^','Panchal','Prem','2014-11-29',2),(7,'ako','���ü6dL�0��P�Y!��A�\'q/��3U�K','ko2','alvin','2014-11-29',1),(8,'ffake','(\nr����\"��ƅɚǭf�y�3q����','fake','fake','2014-12-03',1),(9,'bob','��!�{�9��ag�5Y�^�$��b�va=','Smith','Bob','2014-12-03',1),(10,'tests','��f���r���.Dn|_ķ���G�����uo^','test','test','2014-12-06',1);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_monsters_crs'
--
/*!50003 DROP PROCEDURE IF EXISTS `archiveEnrollmentsUntil` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `archiveEnrollmentsUntil`(IN d DATE)
BEGIN

insert into archenrollment
	select * from enrollment
		where updatedON <= d;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteOlderAssignment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOlderAssignment`(IN d DATE)
BEGIN 
delete from courseassignment
	where iID = any (select iID from instructor
						where instructor.iID = courseassignment.iID
								and HireDate < d);
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

-- Dump completed on 2014-12-06 16:51:16
