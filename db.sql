CREATE DATABASE  IF NOT EXISTS `mess_management_system` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mess_management_system`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: mess_management_system
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `Month_bill_id` int NOT NULL,
  `Total_amount` decimal(10,2) DEFAULT NULL,
  `Student_usn` varchar(20) DEFAULT NULL,
  `Month` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Month_bill_id`),
  KEY `Student_usn` (`Student_usn`),
  CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`Student_usn`) REFERENCES `student` (`Student_usn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (101,2500.00,'1RV22CS145','January'),(102,2600.00,'1RV22ME112','January'),(103,2700.00,'1RV22EC156','January'),(104,2800.00,'1RV22IS201','January'),(105,2900.00,'1RV22CV078','January'),(106,3000.00,'1RV22BT045','January'),(107,3100.00,'1RV22AI092','January'),(108,3200.00,'1RV22EE034','January'),(109,3300.00,'1RV22IT123','January'),(110,3400.00,'1RV22AE210','January');
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `delivery_id` int NOT NULL AUTO_INCREMENT,
  `usn` varchar(20) NOT NULL,
  `meal_type` varchar(50) NOT NULL,
  `meal_id` int NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`delivery_id`),
  KEY `usn` (`usn`),
  CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`usn`) REFERENCES `student` (`Student_usn`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (1,'1RV22CS145','Lunch',169,'2025-01-23'),(2,'1RV22CS145','Lunch',169,'2025-01-23'),(3,'1RV22CS145','High Tea',170,'2025-01-23'),(4,'1RV22CS145','Dinner',171,'2025-01-23'),(5,'1RV22CS145','Lunch',171,'2025-01-23'),(6,'1RV22CS145','Dinner',179,'2025-01-23'),(7,'1RV22CS145','Lunch',194,'2025-01-23'),(8,'1RV22CS145','High Tea',195,'2025-01-23'),(9,'1RV22IS053','Lunch',196,'2025-01-24'),(10,'1RV22IS025','Lunch',203,'2025-01-24'),(11,'1RV22IS025','Dinner',219,'2025-01-24'),(12,'1RV22IS025','Breakfast',226,'2025-01-24'),(13,'1RV22IS053','Dinner',232,'2025-01-24'),(14,'1RV22EI035','Breakfast',233,'2025-01-24'),(15,'1RV22IS053','Dinner',234,'2025-01-24');
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `Feedback_id` int NOT NULL AUTO_INCREMENT,
  `Date` date DEFAULT NULL,
  `Student_usn` varchar(20) NOT NULL,
  `Rating` int DEFAULT NULL,
  `Comments` text,
  PRIMARY KEY (`Feedback_id`),
  KEY `Student_usn` (`Student_usn`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`Student_usn`) REFERENCES `student` (`Student_usn`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (12,'2025-01-01','1RV22CS145',4,'Good explanation and support.'),(13,'2025-01-02','1RV22ME112',5,'Excellent guidance and mentorship.'),(14,'2025-01-02','1RV22EC156',3,'Average experience, room for improvement.'),(15,'2025-01-05','1RV22IS201',5,'Highly satisfied with the assistance provided.'),(16,'2025-01-06','1RV22CV078',4,'Very supportive and clear communication.'),(17,'2025-01-07','1RV22BT045',3,'Satisfactory performance overall.'),(18,'2025-01-09','1RV22AI092',5,'Exceptional skills and great help.'),(19,'2025-01-12','1RV22EE034',4,'Helpful but could be more detailed.'),(20,'2025-01-13','1RV22IT123',5,'Amazing experience, very insightful.'),(21,'2025-01-15','1RV22AE210',4,'Good but can improve in some areas.'),(22,'2025-01-17','1RV22IS053',1,'excellent food'),(23,'2025-01-17','1RV22IS055',5,'Crazy stuff bro\nwill go very far in life\n\n'),(24,'2025-01-17','1RV22AI035',4,'bakwas food, but good interface'),(25,'2025-01-24','1RV22EI035',4,'Sexy  '),(26,'2025-01-24','1RV22IS053',3,'Very Nice Food');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meal`
--

DROP TABLE IF EXISTS `meal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meal` (
  `Meal_id` int NOT NULL,
  `Meal_type` varchar(20) DEFAULT NULL,
  `Morning_menu` text,
  `Lunch_menu` text,
  `Dinner_menu` text,
  `Date` date DEFAULT NULL,
  `Mealtoken_id` int DEFAULT NULL,
  PRIMARY KEY (`Meal_id`),
  KEY `Mealtoken_id` (`Mealtoken_id`),
  CONSTRAINT `meal_ibfk_1` FOREIGN KEY (`Mealtoken_id`) REFERENCES `token` (`Token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meal`
--

LOCK TABLES `meal` WRITE;
/*!40000 ALTER TABLE `meal` DISABLE KEYS */;
INSERT INTO `meal` VALUES (1,'Breakfast','Idli, Sambhar',NULL,NULL,'2025-01-01',1),(2,'Lunch',NULL,'Rice, Dal, Curry',NULL,'2025-01-01',2),(3,'Dinner',NULL,NULL,'Chapati, Sabzi','2025-01-01',3),(4,'Breakfast','Poha, Tea',NULL,NULL,'2025-01-02',4),(5,'Lunch',NULL,'Fried Rice, Manchurian',NULL,'2025-01-02',5),(6,'Dinner',NULL,NULL,'Pulao, Paneer','2025-01-02',6),(7,'Breakfast','Dosa, Chutney',NULL,NULL,'2025-01-03',7),(8,'Lunch',NULL,'Veg Biryani, Raita',NULL,'2025-01-03',8),(9,'Dinner',NULL,NULL,'Noodles, Spring Rolls','2025-01-03',9),(10,'Breakfast','Upma, Coconut Chutney',NULL,NULL,'2025-01-04',10);
/*!40000 ALTER TABLE `meal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `Student_usn` varchar(20) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Dept` varchar(50) DEFAULT NULL,
  `Room_no` varchar(10) DEFAULT NULL,
  `Email_id` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `Contact` varchar(15) DEFAULT NULL,
  `Health_status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Student_usn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('1RV22AE210','Priya Iyer','Aerospace','110','priya210@rvce.edu.in','Priya@123','9876543219','Healthy'),('1RV22AI034','nitin','AI','1','nitinkumar@rvce.edu.in','1234','8548036992','Healthy'),('1RV22AI035','nitin kumar loni','AI','206','nitinkumarloni.ai22@rvce.edu.in','1234','9741485668','Healthy'),('1RV22AI092','Nikhil Roy','AI&ML','107','nikhil092@rvce.edu.in','Nikhil@123','9876543216','Healthy'),('1RV22BT045','Pooja Jain','Biotech','106','pooja045@rvce.edu.in','Pooja@123','9876543215','Healthy'),('1RV22CS145','Arjun Sharma','CSE','101','arjun145@rvce.edu.in','Arjun@123','9876543210','Healthy'),('1RV22CV078','Aditya Gupta','Civil','105','aditya078@rvce.edu.in','Aditya@123','9876543214','Healthy'),('1RV22EC156','Karan Verma','ECE','103','karan156@rvce.edu.in','Karan@123','9876543212','Healthy'),('1RV22EE034','Sneha Rao','EEE','108','sneha034@rvce.edu.in','Sneha@123','9876543217','Healthy'),('1RV22EI020','Dhruv Bagade','EIE','123','dhruvbagade078@gmail.com','ilovecholebhature','9899984739','Healthy'),('1RV22EI035','Tarun','EIE','114','tarundharni@gmail.com','zxcv','9448329694','Healthy'),('1RV22IS025','Jeevan Kumar','ISE','115','jeevankumar@rvce.edu.in','1234','8548036991','Healthy'),('1RV22IS053','Sachidanand N Hede','ISE','119','sachinanandnh.is22@rvce.edu.in','qwer','8951078964','Healthy'),('1RV22IS055','Sandesh','ISE','113','sandeshdatattri.is22@rvce.edu.in','Sandesh','8123512909','Healthy'),('1RV22IS201','Simran Kaur','ISE','104','simran201@rvce.edu.in','Simran@123','9876543213','Healthy'),('1RV22IT123','Rahul Singh','IT','109','rahul123@rvce.edu.in','Rahul@123','9876543218','Healthy'),('1RV22ME112','Riya Mehta','Mechanical','102','riya112@rvce.edu.in','Riya@123','9876543211','Healthy');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token` (
  `Token_id` int NOT NULL,
  `MealCategory` varchar(30) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `IssuedTime` datetime DEFAULT NULL,
  `Student_usn` varchar(20) DEFAULT NULL,
  `Bill_id` int DEFAULT NULL,
  PRIMARY KEY (`Token_id`),
  KEY `Bill_id` (`Bill_id`),
  KEY `fk_student_usn` (`Student_usn`),
  CONSTRAINT `fk_student_usn` FOREIGN KEY (`Student_usn`) REFERENCES `student` (`Student_usn`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `token_ibfk_1` FOREIGN KEY (`Student_usn`) REFERENCES `student` (`Student_usn`),
  CONSTRAINT `token_ibfk_2` FOREIGN KEY (`Bill_id`) REFERENCES `bill` (`Month_bill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (1,'Breakfast','2025-01-01',NULL,'1RV22CS145',101),(2,'Lunch','2025-01-01',NULL,'1RV22ME112',102),(3,'Dinner','2025-01-01',NULL,'1RV22EC156',103),(4,'Breakfast','2025-01-02',NULL,'1RV22IS201',104),(5,'Lunch','2025-01-02',NULL,'1RV22CV078',105),(6,'Dinner','2025-01-02',NULL,'1RV22BT045',106),(7,'Breakfast','2025-01-03',NULL,'1RV22AI092',107),(8,'Lunch','2025-01-03',NULL,'1RV22EE034',108),(9,'Dinner','2025-01-03',NULL,'1RV22IT123',109),(10,'Breakfast','2025-01-04',NULL,'1RV22AE210',110),(11,'Lunch','2025-01-10',NULL,'1RV22AI092',107),(12,'Lunch','2025-01-12',NULL,'1RV22ME112',109),(13,'Lunch','2025-01-15',NULL,'1RV22EC156',105),(14,'Lunch','2025-01-12',NULL,'1RV22CS145',107),(15,'Dinner','2025-01-13',NULL,'1RV22CV078',108),(16,'Dinner','2025-01-06',NULL,'1RV22IS201',103),(17,'Lunch','2025-01-05',NULL,'1RV22ME112',104),(18,'Dinner','2025-01-13',NULL,'1RV22ME112',104),(19,'Lunch','2025-01-02',NULL,'1RV22CV078',104),(20,'Breakfast','2025-01-11',NULL,'1RV22EC156',109),(21,'Breakfast','2025-01-01',NULL,'1RV22CV078',105),(22,'Dinner','2025-01-07',NULL,'1RV22ME112',109),(23,'Dinner','2025-01-01',NULL,'1RV22EE034',110),(24,'Dinner','2025-01-04',NULL,'1RV22EE034',106),(25,'Lunch','2025-01-01',NULL,'1RV22CV078',107),(26,'Dinner','2025-01-13',NULL,'1RV22EE034',108),(27,'Breakfast','2025-01-08',NULL,'1RV22CS145',106),(28,'Dinner','2025-01-06',NULL,'1RV22EE034',109),(29,'Dinner','2025-01-10',NULL,'1RV22CS145',109),(30,'Lunch','2025-01-11',NULL,'1RV22CV078',106),(31,'Dinner','2025-01-10',NULL,'1RV22BT045',102),(32,'Breakfast','2025-01-04',NULL,'1RV22EC156',101),(33,'Breakfast','2025-01-02',NULL,'1RV22ME112',107),(34,'Breakfast','2025-01-06',NULL,'1RV22IS201',105),(35,'Dinner','2025-01-09',NULL,'1RV22AI092',101),(36,'Dinner','2025-01-06',NULL,'1RV22EC156',107),(37,'Breakfast','2025-01-03',NULL,'1RV22BT045',110),(38,'Lunch','2025-01-09',NULL,'1RV22IS201',105),(39,'Breakfast','2025-01-05',NULL,'1RV22BT045',102),(40,'Breakfast','2025-01-08',NULL,'1RV22ME112',108),(41,'Lunch','2025-01-09',NULL,'1RV22ME112',103),(42,'Lunch','2025-01-04',NULL,'1RV22CS145',104),(43,'Dinner','2025-01-06',NULL,'1RV22AI092',104),(44,'Lunch','2025-01-07',NULL,'1RV22ME112',104),(45,'Breakfast','2025-01-03',NULL,'1RV22IS201',101),(46,'Breakfast','2025-01-15',NULL,'1RV22EC156',105),(47,'Breakfast','2025-01-02',NULL,'1RV22BT045',104),(48,'Dinner','2025-01-03',NULL,'1RV22EC156',101),(49,'Dinner','2025-01-14',NULL,'1RV22EC156',101),(50,'Breakfast','2025-01-09',NULL,'1RV22BT045',101),(51,'Breakfast','2025-01-13',NULL,'1RV22BT045',108),(52,'Breakfast','2025-01-01',NULL,'1RV22AI092',109),(53,'Lunch','2025-01-15',NULL,'1RV22CV078',102),(54,'Breakfast','2025-01-13',NULL,'1RV22BT045',108),(55,'Breakfast','2025-01-08',NULL,'1RV22BT045',110),(56,'Lunch','2025-01-10',NULL,'1RV22IS201',109),(57,'Breakfast','2025-01-08',NULL,'1RV22CS145',104),(58,'Dinner','2025-01-05',NULL,'1RV22CV078',110),(59,'Lunch','2025-01-10',NULL,'1RV22IS201',108),(60,'Dinner','2025-01-01',NULL,'1RV22CV078',106),(61,'Breakfast','2025-01-07',NULL,'1RV22AI092',103),(62,'Dinner','2025-01-04',NULL,'1RV22EE034',101),(63,'Dinner','2025-01-01',NULL,'1RV22CS145',107),(64,'Dinner','2025-01-11',NULL,'1RV22ME112',109),(65,'Breakfast','2025-01-06',NULL,'1RV22AI092',108),(66,'Breakfast','2025-01-07',NULL,'1RV22BT045',108),(67,'Dinner','2025-01-03',NULL,'1RV22EC156',102),(68,'Lunch','2025-01-15',NULL,'1RV22CS145',101),(69,'Lunch','2025-01-05',NULL,'1RV22BT045',107),(70,'Lunch','2025-01-13',NULL,'1RV22EE034',110),(71,'Breakfast','2025-01-04',NULL,'1RV22CV078',108),(72,'Breakfast','2025-01-15',NULL,'1RV22BT045',102),(73,'Lunch','2025-01-08',NULL,'1RV22AI092',101),(74,'Breakfast','2025-01-13',NULL,'1RV22CV078',101),(75,'Lunch','2025-01-13',NULL,'1RV22EE034',110),(76,'Dinner','2025-01-13',NULL,'1RV22IS201',101),(77,'Dinner','2025-01-07',NULL,'1RV22BT045',109),(78,'Lunch','2025-01-02',NULL,'1RV22IS201',102),(79,'Dinner','2025-01-11',NULL,'1RV22IS201',103),(80,'Breakfast','2025-01-09',NULL,'1RV22CS145',108),(81,'Breakfast','2025-01-01',NULL,'1RV22CS145',101),(82,'Lunch','2025-01-14',NULL,'1RV22ME112',105),(83,'Lunch','2025-01-07',NULL,'1RV22ME112',101),(84,'Breakfast','2025-01-07',NULL,'1RV22EC156',110),(85,'Dinner','2025-01-14',NULL,'1RV22ME112',106),(86,'Breakfast','2025-01-04',NULL,'1RV22EC156',109),(87,'Lunch','2025-01-11',NULL,'1RV22CV078',103),(88,'Breakfast','2025-01-11',NULL,'1RV22CS145',109),(89,'Breakfast','2025-01-09',NULL,'1RV22BT045',101),(90,'Dinner','2025-01-12',NULL,'1RV22ME112',105),(91,'Lunch','2025-01-07',NULL,'1RV22CS145',105),(92,'Breakfast','2025-01-02',NULL,'1RV22CS145',107),(93,'Breakfast','2025-01-09',NULL,'1RV22ME112',108),(94,'Lunch','2025-01-15',NULL,'1RV22BT045',106),(95,'Dinner','2025-01-03',NULL,'1RV22EC156',103),(96,'Dinner','2025-01-06',NULL,'1RV22EC156',108),(97,'Breakfast','2025-01-07',NULL,'1RV22ME112',106),(98,'Dinner','2025-01-12',NULL,'1RV22CV078',106),(99,'Breakfast','2025-01-13',NULL,'1RV22CS145',103),(100,'Breakfast','2025-01-02',NULL,'1RV22IS201',105),(101,'Dinner','2025-01-03',NULL,'1RV22CV078',110),(102,'Lunch','2025-01-15',NULL,'1RV22CV078',107),(103,'Lunch','2025-01-08',NULL,'1RV22CV078',104),(104,'Lunch','2025-01-06',NULL,'1RV22AI092',109),(105,'Lunch','2025-01-14',NULL,'1RV22CS145',108),(106,'Lunch','2025-01-04',NULL,'1RV22ME112',107),(107,'Dinner','2025-01-13',NULL,'1RV22CS145',110),(108,'Breakfast','2025-01-12',NULL,'1RV22AI092',104),(109,'Dinner','2025-01-01',NULL,'1RV22IS201',105),(110,'Lunch','2025-01-12',NULL,'1RV22ME112',109),(111,'Breakfast','2025-01-16','2025-01-17 01:51:37','1RV22CS145',NULL),(112,'High Tea','2025-01-16','2025-01-17 01:52:31','1RV22IS053',NULL),(113,'High Tea','2025-01-16','2025-01-17 01:57:38','1RV22IS053',NULL),(114,'High Tea','2025-01-16','2025-01-17 01:58:13','1RV22IS053',NULL),(115,'High Tea','2025-01-16','2025-01-17 01:58:20','1RV22IS053',NULL),(116,'High Tea','2025-01-16','2025-01-17 01:58:32','1RV22IS053',NULL),(117,'High Tea','2025-01-16','2025-01-17 01:58:33','1RV22IS053',NULL),(118,'High Tea','2025-01-16','2025-01-17 01:58:57','1RV22IS053',NULL),(119,'High Tea','2025-01-16','2025-01-17 01:59:01','1RV22IS053',NULL),(120,'High Tea','2025-01-16','2025-01-17 02:00:12','1RV22IS053',NULL),(121,'High Tea','2025-01-16','2025-01-17 02:00:31','1RV22IS053',NULL),(122,'High Tea','2025-01-16','2025-01-17 02:00:33','1RV22IS053',NULL),(123,'High Tea','2025-01-16','2025-01-17 02:00:35','1RV22IS053',NULL),(124,'High Tea','2025-01-16','2025-01-17 02:01:00','1RV22IS053',NULL),(125,'High Tea','2025-01-16','2025-01-17 02:01:01','1RV22IS053',NULL),(126,'High Tea','2025-01-16','2025-01-17 02:01:02','1RV22IS053',NULL),(127,'High Tea','2025-01-16','2025-01-17 02:01:02','1RV22IS053',NULL),(128,'High Tea','2025-01-16','2025-01-17 02:01:03','1RV22IS053',NULL),(129,'Dinner','2025-01-16','2025-01-17 02:01:12','1RV22IS053',NULL),(130,'Dinner','2025-01-16','2025-01-17 02:01:45','1RV22IS053',NULL),(131,'Dinner','2025-01-16','2025-01-17 02:01:50','1RV22IS053',NULL),(132,'Dinner','2025-01-16','2025-01-17 02:01:58','1RV22IS053',NULL),(133,'Dinner','2025-01-16','2025-01-17 02:02:03','1RV22IS053',NULL),(134,'Dinner','2025-01-16','2025-01-17 02:02:08','1RV22IS053',NULL),(135,'Breakfast','2025-01-16','2025-01-17 02:05:55','1RV22IS053',NULL),(136,'Breakfast','2025-01-16','2025-01-17 02:18:46','1RV22IS053',NULL),(137,'Breakfast','2025-01-16','2025-01-17 02:18:49','1RV22IS053',NULL),(138,'Breakfast','2025-01-16','2025-01-17 02:35:08','1RV22IS053',NULL),(139,'Lunch','2025-01-17','2025-01-17 09:33:11','1RV22CS145',NULL),(140,'Breakfast','2025-01-17','2025-01-17 09:54:57','1RV22IS055',NULL),(141,'Lunch','2025-01-17','2025-01-17 10:13:50','1RV22CS145',NULL),(142,'High Tea','2025-01-17','2025-01-17 10:23:58','1RV22CS145',NULL),(143,'Lunch','2025-01-17','2025-01-17 19:09:18','1RV22CS145',NULL),(144,'Lunch','2025-01-17','2025-01-17 23:17:34','1RV22AI035',NULL),(145,'High Tea','2025-01-17','2025-01-17 23:19:24','1RV22AI035',NULL),(146,'Lunch','2025-01-17','2025-01-17 23:44:57','1RV22IS053',NULL),(147,'High Tea','2025-01-17','2025-01-17 23:45:17','1RV22IS053',NULL),(148,'High Tea','2025-01-17','2025-01-17 23:45:48','1RV22IS053',NULL),(149,'Breakfast','2025-01-23','2025-01-23 21:57:01','1RV22IS053',NULL),(150,'Breakfast','2025-01-23','2025-01-23 22:06:15','1RV22IS053',NULL),(151,'Breakfast','2025-01-23','2025-01-23 22:13:27','1RV22IS053',NULL),(152,'High Tea','2025-01-23','2025-01-23 22:14:18','1RV22IS053',NULL),(153,'High Tea','2025-01-23','2025-01-23 22:21:41','1RV22IS053',NULL),(154,'High Tea','2025-01-23','2025-01-23 22:22:41','1RV22IS053',NULL),(155,'High Tea','2025-01-23','2025-01-23 22:29:48','1RV22IS053',NULL),(156,'Breakfast','2025-01-23','2025-01-23 22:30:25','1RV22IS053',NULL),(157,'Breakfast','2025-01-23','2025-01-23 22:30:36','1RV22IS053',NULL),(158,'Breakfast','2025-01-23','2025-01-23 22:30:43','1RV22IS053',NULL),(159,'Breakfast','2025-01-23','2025-01-23 22:30:44','1RV22IS053',NULL),(160,'Breakfast','2025-01-23','2025-01-23 22:31:21','1RV22IS053',NULL),(161,'Breakfast','2025-01-23','2025-01-23 22:35:25','1RV22IS053',NULL),(162,'Lunch','2025-01-23','2025-01-23 23:09:35','1RV22IS053',NULL),(163,'Breakfast','2025-01-23','2025-01-23 23:22:41','1RV22IS053',NULL),(164,'Breakfast','2025-01-23','2025-01-24 00:02:39','1RV22IS053',NULL),(165,'Breakfast','2025-01-23','2025-01-24 00:08:48','1RV22IS053',NULL),(166,'Breakfast','2025-01-23','2025-01-24 01:54:46','1RV22IS053',NULL),(167,'Breakfast','2025-01-23','2025-01-24 02:35:40','1RV22IS053',NULL),(168,'Breakfast','2025-01-23','2025-01-24 02:35:44','1RV22IS053',NULL),(169,'Lunch','2025-01-23','2025-01-24 02:59:11','1RV22CS145',NULL),(170,'High Tea','2025-01-23','2025-01-24 03:00:07','1RV22CS145',NULL),(171,'Lunch','2025-01-23','2025-01-24 03:02:54','1RV22CS145',NULL),(172,'Lunch','2025-01-23','2025-01-24 03:06:15','1RV22CS145',NULL),(173,'Lunch','2025-01-23','2025-01-24 03:06:16','1RV22CS145',NULL),(174,'Lunch','2025-01-23','2025-01-24 03:06:18','1RV22CS145',NULL),(175,'Lunch','2025-01-23','2025-01-24 03:06:21','1RV22CS145',NULL),(176,'Lunch','2025-01-23','2025-01-24 03:06:23','1RV22CS145',NULL),(177,'Lunch','2025-01-23','2025-01-24 03:06:29','1RV22CS145',NULL),(178,'Lunch','2025-01-23','2025-01-24 03:06:31','1RV22CS145',NULL),(179,'Dinner','2025-01-23','2025-01-24 03:07:39','1RV22CS145',NULL),(180,'Dinner','2025-01-23','2025-01-24 03:08:39','1RV22CS145',NULL),(181,'Dinner','2025-01-23','2025-01-24 03:08:42','1RV22CS145',NULL),(182,'Dinner','2025-01-23','2025-01-24 03:08:47','1RV22CS145',NULL),(183,'Dinner','2025-01-23','2025-01-24 03:08:50','1RV22CS145',NULL),(184,'Dinner','2025-01-23','2025-01-24 03:09:04','1RV22CS145',NULL),(185,'Dinner','2025-01-23','2025-01-24 03:09:12','1RV22CS145',NULL),(186,'Dinner','2025-01-23','2025-01-24 03:09:13','1RV22CS145',NULL),(187,'Dinner','2025-01-23','2025-01-24 03:09:18','1RV22CS145',NULL),(188,'Dinner','2025-01-23','2025-01-24 03:09:21','1RV22CS145',NULL),(189,'Dinner','2025-01-23','2025-01-24 03:09:23','1RV22CS145',NULL),(190,'Dinner','2025-01-23','2025-01-24 03:09:29','1RV22CS145',NULL),(191,'Dinner','2025-01-23','2025-01-24 03:09:30','1RV22CS145',NULL),(192,'Dinner','2025-01-23','2025-01-24 03:09:35','1RV22CS145',NULL),(193,'Dinner','2025-01-23','2025-01-24 03:09:36','1RV22CS145',NULL),(194,'Lunch','2025-01-23','2025-01-24 03:10:47','1RV22CS145',NULL),(195,'High Tea','2025-01-23','2025-01-24 03:14:12','1RV22CS145',NULL),(196,'Lunch','2025-01-23','2025-01-24 03:51:23','1RV22IS053',NULL),(197,'Lunch','2025-01-23','2025-01-24 03:55:05','1RV22IS053',NULL),(198,'Lunch','2025-01-23','2025-01-24 03:55:16','1RV22IS053',NULL),(199,'Lunch','2025-01-23','2025-01-24 03:55:48','1RV22IS053',NULL),(200,'Lunch','2025-01-23','2025-01-24 03:56:20','1RV22IS053',NULL),(201,'Lunch','2025-01-23','2025-01-24 03:56:25','1RV22IS053',NULL),(202,'Lunch','2025-01-23','2025-01-24 03:56:37','1RV22IS053',NULL),(203,'Lunch','2025-01-23','2025-01-24 03:57:58','1RV22IS025',NULL),(204,'Lunch','2025-01-23','2025-01-24 03:59:41','1RV22IS025',NULL),(205,'Lunch','2025-01-23','2025-01-24 04:00:26','1RV22IS025',NULL),(206,'Lunch','2025-01-23','2025-01-24 04:00:32','1RV22IS025',NULL),(207,'Lunch','2025-01-23','2025-01-24 04:01:03','1RV22IS025',NULL),(208,'Lunch','2025-01-23','2025-01-24 04:01:57','1RV22IS025',NULL),(209,'Lunch','2025-01-23','2025-01-24 04:02:33','1RV22IS025',NULL),(210,'Lunch','2025-01-23','2025-01-24 04:03:18','1RV22IS025',NULL),(211,'Lunch','2025-01-23','2025-01-24 04:03:56','1RV22IS025',NULL),(212,'Lunch','2025-01-23','2025-01-24 04:04:01','1RV22IS025',NULL),(213,'Lunch','2025-01-23','2025-01-24 04:04:04','1RV22IS025',NULL),(214,'Lunch','2025-01-23','2025-01-24 04:04:06','1RV22IS025',NULL),(215,'Lunch','2025-01-23','2025-01-24 04:04:07','1RV22IS025',NULL),(216,'Lunch','2025-01-23','2025-01-24 04:04:08','1RV22IS025',NULL),(217,'Lunch','2025-01-23','2025-01-24 04:04:18','1RV22IS025',NULL),(218,'Lunch','2025-01-23','2025-01-24 04:04:21','1RV22IS025',NULL),(219,'Lunch','2025-01-23','2025-01-24 04:04:49','1RV22IS025',NULL),(220,'Lunch','2025-01-23','2025-01-24 04:05:53','1RV22IS025',NULL),(221,'Lunch','2025-01-23','2025-01-24 04:06:32','1RV22IS025',NULL),(222,'Lunch','2025-01-23','2025-01-24 04:07:20','1RV22IS025',NULL),(223,'Lunch','2025-01-23','2025-01-24 04:07:27','1RV22IS025',NULL),(224,'Lunch','2025-01-23','2025-01-24 04:07:50','1RV22IS025',NULL),(225,'Lunch','2025-01-23','2025-01-24 04:08:46','1RV22IS025',NULL),(226,'Breakfast','2025-01-24','2025-01-24 04:10:30','1RV22IS025',NULL),(227,'Breakfast','2025-01-24','2025-01-24 04:12:15','1RV22IS025',NULL),(228,'Breakfast','2025-01-24','2025-01-24 04:12:25','1RV22IS025',NULL),(229,'Breakfast','2025-01-24','2025-01-24 10:11:57','1RV22IS053',NULL),(230,'Breakfast','2025-01-24','2025-01-24 10:14:50','1RV22IS053',NULL),(231,'Breakfast','2025-01-24','2025-01-24 10:15:25','1RV22IS053',NULL),(232,'Dinner','2025-01-24','2025-01-24 10:23:37','1RV22IS053',NULL),(233,'Breakfast','2025-01-24','2025-01-24 20:31:38','1RV22EI035',NULL),(234,'Dinner','2025-01-24','2025-01-24 21:40:00','1RV22IS053',NULL);
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warden`
--

DROP TABLE IF EXISTS `warden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warden` (
  `Employee_id` varchar(20) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `Email_id` varchar(50) DEFAULT NULL,
  `Contact_no` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warden`
--

LOCK TABLES `warden` WRITE;
/*!40000 ALTER TABLE `warden` DISABLE KEYS */;
INSERT INTO `warden` VALUES ('W101','Rajesh Kumar','Warden@123','rajesh@rvce.edu.in','9998887776'),('W102','Priya Das','Priya@123','priya@rvce.edu.in','9998887777');
/*!40000 ALTER TABLE `warden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weeklymenu`
--

DROP TABLE IF EXISTS `weeklymenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weeklymenu` (
  `day` varchar(20) NOT NULL,
  `breakfast` varchar(255) NOT NULL,
  `lunch` varchar(255) NOT NULL,
  `high_tea` varchar(255) NOT NULL,
  `dinner` varchar(255) NOT NULL,
  PRIMARY KEY (`day`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weeklymenu`
--

LOCK TABLES `weeklymenu` WRITE;
/*!40000 ALTER TABLE `weeklymenu` DISABLE KEYS */;
INSERT INTO `weeklymenu` VALUES ('Friday','Rava Idli, Boonda, Chutney, Sambar, Ragi malt','Soya Palya, Vegetable Sambar, Lemon Rice, Masala Salad, Rice, Rasam, Sambar, Chapati, Curd','Bread toast','Paneer Butter Masala, Kashmiri Kalakandur, Orange/Gova Fruits, Rice, Rasam, Sambar, Chapati, Curd'),('Monday','Idli, Vada, Chutney, Sambar, Ragi malt','Alu Menthya, Mulangi Sambar, Khara Rice, Chutney, Pickle, Rice, Rasam, Sambar, Chapati, Curd','Pav Bhaji','Mushroom Curry, Dal Fry, Veg Fried Rice, Jalebi, Dry Jamun, Rice, Rasam, Sambar, Chapati, Curd'),('Saturday','Avalakki, Vada, Chutney, Ragi malt','Cauliflower Masala, Majjige, Sambar, Rice, Rasam, Sambar, Chapati, Curd','Vada Pav','Palak Paneer, Dal Curd, Besibele Bath, Rice, Rasam, Sambar, Chapati, Curd'),('Sunday','Masala Dosa, Chutney, Sambar','Triple Baawani, Majjige, Sambar, Salad, Rice, Rasam, Sambar, Chapati, Curd','Fruit Salad','Baby Corn Fry, Jeera Rice, Kashmiri Kalakandur, Banana, Rice, Rasam, Sambar, Chapati, Curd'),('Thursday','Aloo Paratha, Mint Chutney, Potato Palya, Ragi malt','Chutney, Binjal Curry, Cucumber Sambar, Mangalore Bajji, Rice, Rasam, Sambar, Chapati, Curd','samosa','Veg Korma, Veg Biryani, Dal Fry, French Fries, Rice, Rasam, Sambar, Chapati, Curd'),('Tuesday','Poori, Channa, Masala Chutney, Onion pieces, Banana','Dry Green Gram Palya, Drumstick Sambar, Coconut Chutney, Bendi Fry, Brinjal Curry, Cucumber, Rice, Rasam, Sambar, Chapati, Curd','Cheese Cake','Dal Makhani, Kadle Kal Palya, Gobi Manchuri, Jeera Rice, Rice, Rasam, Sambar, Chapati, Curd'),('Wednesday','Set Dosa, Mix Veg Sagu, Chutney','Channa Dal, Soppina Sambar, Beetroot Palya, Groundnut Chutney, Rice, Rasam, Sambar, Chapati, Curd','Mava Cake','Veg Rolls, Veg Biryani, Dal Fry, French Fries, Rice, Rasam, Sambar, Chapati, Curd');
/*!40000 ALTER TABLE `weeklymenu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-05 16:37:57
