-- ---------------------------------------- 
-- --        CLEAR DOWN THE TABLE        -- 
-- ---------------------------------------- 
TRUNCATE TABLE `prospecting_loot_template`; 
-- ---------------------------------------- 
-- MySQL dump 10.13  Distrib 5.5.37, for Win32 (x86)
--
-- Host: localhost    Database: mangos1
-- ------------------------------------------------------
-- Server version	5.5.5-10.5.8-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@SESSION.TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `prospecting_loot_template`
--

LOCK TABLES `prospecting_loot_template` WRITE;
/*!40000 ALTER TABLE `prospecting_loot_template` DISABLE KEYS */;
INSERT INTO `prospecting_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES 
(2770,774,50,2,1,1,0),
(2770,818,50,2,1,1,0),
(2770,1210,10,1,1,1,0),
(2770,24186,100,0,1,1,0),
(2771,1206,33.3,3,1,2,0),
(2771,1210,33.3,3,1,2,0),
(2771,1529,3.33,2,1,1,0),
(2771,1705,33.4,3,1,2,0),
(2771,3864,3.33,2,1,1,0),
(2771,7909,3.33,2,1,1,0),
(2771,13000,100,1,-13000,1,0),
(2771,24188,100,0,1,1,0),
(2772,1529,33.3,2,1,2,0),
(2772,1705,33.3,2,1,2,0),
(2772,3864,33.4,2,1,2,0),
(2772,7909,5,1,1,1,0),
(2772,7910,5,1,1,1,0),
(2772,24190,100,0,1,1,0),
(3858,3864,33.3,2,1,2,0),
(3858,7909,33.3,2,1,2,0),
(3858,7910,33.4,2,1,2,0),
(3858,12361,2.5,1,1,1,0),
(3858,12364,2.5,1,1,1,0),
(3858,12799,2.5,1,1,1,0),
(3858,12800,2.5,1,1,1,0),
(3858,24234,100,0,1,1,0),
(10620,7910,28,2,1,2,0),
(10620,12361,18,2,1,2,0),
(10620,12364,18,2,1,2,0),
(10620,12799,18,2,1,2,0),
(10620,12800,18,2,1,2,0),
(10620,21929,1,1,1,1,0),
(10620,23077,1,1,1,1,0),
(10620,23079,1,1,1,1,0),
(10620,23107,1,1,1,1,0),
(10620,23112,1,1,1,1,0),
(10620,23117,1,1,1,1,0),
(10620,24235,100,0,1,1,0),
(23424,21929,16.66,2,1,2,0),
(23424,23077,16.67,2,1,2,0),
(23424,23079,16.67,2,1,2,0),
(23424,23107,16.67,2,1,2,0),
(23424,23112,16.67,2,1,2,0),
(23424,23117,16.66,2,1,2,0),
(23424,23436,1,1,1,1,0),
(23424,23437,1,1,1,1,0),
(23424,23438,1,1,1,1,0),
(23424,23439,1,1,1,1,0),
(23424,23440,1,1,1,1,0),
(23424,23441,1,1,1,1,0),
(23424,24242,100,0,1,1,0),
(23425,13001,100,2,-13001,1,0),
(23425,13002,100,1,-13002,1,0),
(23425,23436,3.66,3,1,1,0),
(23425,23437,3.66,3,1,1,0),
(23425,23438,3.66,3,1,1,0),
(23425,23439,3.66,3,1,1,0),
(23425,23440,3.66,3,1,1,0),
(23425,23441,3.66,3,1,1,0),
(23425,24243,100,0,1,1,0);
/*!40000 ALTER TABLE `prospecting_loot_template` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-18 20:52:36
