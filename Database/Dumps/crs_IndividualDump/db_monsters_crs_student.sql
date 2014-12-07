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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-06 16:52:06
