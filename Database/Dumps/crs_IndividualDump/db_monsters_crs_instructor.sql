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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-06 16:52:13
