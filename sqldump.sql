-- MySQL dump 10.13  Distrib 8.0.26, for macos11 (arm64)
--
-- Host: localhost    Database: aashiyana
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `CATEGORY`
--

DROP TABLE IF EXISTS `CATEGORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CATEGORY` (
  `CATEGORY_ID` int NOT NULL AUTO_INCREMENT,
  `CATEGORY_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CATEGORY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CATEGORY`
--

LOCK TABLES `CATEGORY` WRITE;
/*!40000 ALTER TABLE `CATEGORY` DISABLE KEYS */;
INSERT INTO `CATEGORY` VALUES (1,'Tablets'),(3,'Liquid'),(7,'Hygine');
/*!40000 ALTER TABLE `CATEGORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDERS`
--

DROP TABLE IF EXISTS `ORDERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ORDERS` (
  `ORDER_ID` int NOT NULL AUTO_INCREMENT,
  `USER_ID` int DEFAULT NULL,
  `PRODUCT_ID` int DEFAULT NULL,
  `ORDER_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ORDER_STATUS` enum('COMPLETE','PENDING') DEFAULT 'PENDING',
  PRIMARY KEY (`ORDER_ID`),
  KEY `USER_ID` (`USER_ID`),
  KEY `PRODUCT_ID` (`PRODUCT_ID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `USERS` (`USER_ID`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `PRODUCT` (`PRODUCT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDERS`
--

LOCK TABLES `ORDERS` WRITE;
/*!40000 ALTER TABLE `ORDERS` DISABLE KEYS */;
INSERT INTO `ORDERS` VALUES (1,1,2,'2022-11-05 18:27:05','COMPLETE'),(2,1,4,'2022-11-05 18:27:07','COMPLETE'),(3,1,5,'2022-11-05 18:27:12','COMPLETE'),(4,1,2,'2022-11-05 18:43:27','COMPLETE'),(5,1,4,'2022-11-05 18:43:29','COMPLETE'),(6,6,2,'2022-11-05 18:43:40','COMPLETE'),(7,6,5,'2022-11-05 18:43:43','COMPLETE'),(8,6,4,'2022-11-05 18:43:46','COMPLETE'),(9,7,5,'2022-11-05 18:46:24','PENDING'),(10,1,2,'2022-11-05 21:37:34','PENDING'),(11,1,4,'2022-11-05 21:37:36','PENDING'),(12,1,5,'2022-11-05 21:37:38','PENDING'),(13,1,5,'2022-11-05 21:39:27','PENDING'),(14,1,2,'2022-11-06 04:51:06','PENDING'),(15,6,4,'2022-11-06 08:37:07','PENDING'),(16,8,2,'2022-11-06 13:18:11','COMPLETE'),(17,8,4,'2022-11-06 13:18:15','PENDING'),(18,8,5,'2022-11-06 13:18:18','PENDING');
/*!40000 ALTER TABLE `ORDERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCT`
--

DROP TABLE IF EXISTS `PRODUCT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PRODUCT` (
  `PRODUCT_ID` int NOT NULL AUTO_INCREMENT,
  `PRODUCT_NAME` varchar(255) NOT NULL,
  `PRODUCT_IMAGE` varchar(255) NOT NULL,
  `PRODUCT_CATEGORY` int NOT NULL,
  `PRODUCT_QUANTITY` int NOT NULL,
  `PRODUCT_PRICE` int NOT NULL,
  `PRODUCT_EXPIRY` varchar(255) NOT NULL,
  `PRODUCT_DESCRIPTION` varchar(255) NOT NULL,
  PRIMARY KEY (`PRODUCT_ID`),
  KEY `PRODUCT_CATEGORY` (`PRODUCT_CATEGORY`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`PRODUCT_CATEGORY`) REFERENCES `CATEGORY` (`CATEGORY_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCT`
--

LOCK TABLES `PRODUCT` WRITE;
/*!40000 ALTER TABLE `PRODUCT` DISABLE KEYS */;
INSERT INTO `PRODUCT` VALUES (2,'Rheovit','/img/Rheovit.webp',1,10,55,'DEC2023','Rheovit capsule is a brand of Mecobalamin.'),(4,'Crocin','/img/Crocin.webp',1,20,22,'MAR2024','Crocin Advance Tablet helps relieve pain and fever'),(5,'Revital H','/img/Revital.webp',1,30,585,'DEC2023','Revital H capsule is a unique and balanced combination.'),(6,'Sanitizer','/img/Sanitizer.webp',7,80,80,'JAN2025','The LivEasy Instant Hand Sanitizer kills 99.9% of germs instantly.'),(7,'Honitus','/img/Honitus.webp',3,200,176,'MAR2024','It is used to treat cough and relieve nasal congestion.');
/*!40000 ALTER TABLE `PRODUCT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `USER_ID` int NOT NULL AUTO_INCREMENT,
  `EMAIL` varchar(255) NOT NULL,
  `USERNAME` varchar(255) NOT NULL,
  `PASS_WORD` varchar(255) NOT NULL,
  `ADDRESS` varchar(255) NOT NULL,
  `ROLES` enum('ROLE_USER','ROLE_ADMIN') DEFAULT 'ROLE_USER',
  PRIMARY KEY (`USER_ID`),
  KEY `usern` (`USERNAME`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'user@gmail.com','user123','ee11cbb19052e40b07aac0ca060c23ee','Home','ROLE_USER'),(2,'admin@gmail.com','admin','21232f297a57a5a743894a0e4a801fc3','Home','ROLE_ADMIN'),(6,'test@gmail.com','test','098f6bcd4621d373cade4e832627b4f6','Home','ROLE_USER'),(7,'A@gmail.com','asd','7815696ecbf1c96e6894b779456d330e','pjb','ROLE_USER'),(8,'harsh@gmail.com','harsh','d4e3730e8cba214f85cddae5f9331d74','Home','ROLE_USER');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-09 10:13:00
