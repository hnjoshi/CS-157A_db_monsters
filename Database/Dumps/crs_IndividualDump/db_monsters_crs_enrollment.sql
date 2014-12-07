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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-06 16:52:11
