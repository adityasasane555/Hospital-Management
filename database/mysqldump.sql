-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: hospital
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `hospitals`
--

DROP TABLE IF EXISTS `hospitals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hospitals` (
  `HID` int(11) NOT NULL,
  `HName` varchar(200) NOT NULL,
  PRIMARY KEY (`HID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospitals`
--

LOCK TABLES `hospitals` WRITE;
/*!40000 ALTER TABLE `hospitals` DISABLE KEYS */;
INSERT INTO `hospitals` VALUES (1,'Apollo Hospital'),(2,'Jawaharlal Nehru Medical Collage and Hospital'),(3,'Indira Gandhi Institute of Medical Science(IGIMS)'),(4,'AIIMS-All India Institute Of Medical Science');
/*!40000 ALTER TABLE `hospitals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patients` (
  `Name` varchar(200) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Phone` text NOT NULL,
  `Password` varchar(200) NOT NULL,
  `Photo` varchar(200) NOT NULL,
  `PsychiatristsID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES ('Aditya Varma','niphad nashik','adivarma@gmail.com','+919888455312','123aditya@','1661542921083-profile.jpg',104),('Sagar Sharma','ShambajiNagar,Maharashtra','sagarsharma47@gmail.com','+918990674531','12345@Sharma','1661582066056-profile.jpg',204),('Manoj Gupta','Solapur,Maharashtra','manojgupta07@gmail.com','+919931201548','Manoj@15','1661582630021-profile.jpg',201),('Akash Patil','Phaltan,Maharashtra','patilakash7@gmail.com','+918854421778','AkashPatil@500','1661584188126-profile.jpg',403),('Suraj Nikam','Nanded,Maharashtra','nikamsuraj28@gmail.com','+917889561436','Suraj@45','1661584290559-profile.jpg',305),('Sayli More','Mumbai,Maharashtra','syalimore12@gmail.com','+919970684499','Suraj@45','1661584841954-profile.jpg',305),('Piyush Meheta','Pune,Maharashtra','mehetapiyush007@gmail.com','+919572341536','Meheta@007','1661584927514-profile.jpg',103),('Ramesh Rathod','Nashik,Maharashtra','rameshrathod09@gmail.com','+919882051234','Ramesh@45','1661585106943-profile.jpg',107),('Nikita Thakur','Dhule,Maharashtra','thakurnikita14@gmail.com','+918268785419','Thakur@12','1661585284048-profile.jpg',107),('Lilavati Joshi','Pune,Maharashtra','lilavatijoshi@gmail.com','+919061627845','Lilavati@68','1661585426418-profile.jpg',401),('Ram Kale','Mumbai,Maharashtra','kaleram30@gmail.com','+917578321471','Ramkale@030','1661585517530-profile.jpg',406),('Rajesh Chavan','Nashik,Maharashtra','rajeshchavan51@gmail.com','+918844326234','Rajesh051@','1661585731396-profile.jpg',205),('Dhiraj Kumar','Pune,Maharashtra','dhirajkumar71@gmail.com','+919199957245','Dhiraj071@','1661585832691-profile.jpg',306),('Tanuja Sanap','Niphad,Nashik,Maharashtra','sanaptanu21@gmail.com','+918834525144','Sanap@21','1661585976603-profile.jpg',301),('Kartik Patil','Dharashiv,Maharashtra','patilkartik81@gmail.com','+919189674532','Kartik@081','1661586057563-profile.jpg',301);
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `psychiatrists`
--

DROP TABLE IF EXISTS `psychiatrists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `psychiatrists` (
  `PsychiatristsID` int(11) NOT NULL,
  `PsychiatristsName` varchar(200) NOT NULL,
  `HID` int(11) NOT NULL,
  `PatientsCount` int(11) NOT NULL,
  PRIMARY KEY (`PsychiatristsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `psychiatrists`
--

LOCK TABLES `psychiatrists` WRITE;
/*!40000 ALTER TABLE `psychiatrists` DISABLE KEYS */;
INSERT INTO `psychiatrists` VALUES (101,'Ramesh Thakur',1,0),(102,'Bhavesh Aggarwal',1,0),(103,'Ashish Kapoor',1,1),(104,'Shravani Mehta',1,1),(105,'Preeti Singh',1,0),(106,'Aditi Joshi',1,0),(107,'Tanuja Chavan',1,2),(201,'Manoj Sharma',2,3),(202,'Ratan Varma',2,0),(203,'Veer Chavan',2,0),(204,'Gargi Rathi',2,1),(205,'Sakshi Varma',2,1),(301,'Madan Prasad',3,2),(302,'Bhushan Bhat',3,0),(303,'Axer Patel',3,0),(304,'Vidya Joshi',3,1),(305,'Minakshi Chavan',3,2),(306,'Ankita Shirvastav',3,1),(401,'Ketan Kumar',4,1),(402,'Navdeep Pal',4,0),(403,'Tarak Mheta',4,1),(404,'Sai Shinde',4,0),(405,'Tapsaya Thakur',4,0),(406,'Sehnal Patil',4,1);
/*!40000 ALTER TABLE `psychiatrists` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-27 14:00:32
