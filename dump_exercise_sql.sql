-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: exercise_sql
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `actors`
--

DROP TABLE IF EXISTS `actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(500) DEFAULT NULL,
  `role_id` bigint unsigned DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `actors_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role_actors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actors`
--

LOCK TABLES `actors` WRITE;
/*!40000 ALTER TABLE `actors` DISABLE KEYS */;
INSERT INTO `actors` VALUES (1,'super_admin','$2a$04$e1it1T0mKhWvyvpIvbhMJuACG9qPS8DtV4laZnEpo6FPMTSk/CH1m',2,1,1,'2023-06-03 06:36:19','2023-06-03 06:36:19'),(4,'test-1685774234','$2a$04$jriv60QY7izGC7vOfOF2BO8qMxALTl/xC5v0Hkq8twXdaeJKxPgmW',1,1,1,'2023-06-03 06:37:13','2023-06-03 07:02:35'),(5,'test-1685774235','$2a$04$rVq43pzUOIl94BnUnrhKLeiEpgBGxaRB7acCs67A7vf6tsXIeN0jm',1,0,1,'2023-06-03 06:37:14','2023-06-03 07:34:33'),(7,'test-1685786355','$2a$04$WPdecxW8fJNUbUVzsv4hlOumigLAda9N0DPUOCxmV7RKmX1fTe8/K',1,0,1,'2023-06-03 09:59:15','2023-06-03 11:16:43'),(8,'test-1685786356','$2a$04$U8g2PS76s3q6i4OmvtwC5uyHHk6waykk3cyXj10BS8pmdPvgVWByK',1,0,1,'2023-06-03 09:59:16','2023-06-03 11:17:17'),(9,'test-1685786357','$2a$04$x7VC9jb1G2RExHBCl.c7Nua0CEY0ttWH5WwKi2P0lNbThdk9Z74NK',1,0,0,'2023-06-03 09:59:17','2023-06-03 09:59:17'),(10,'test-1685786358','$2a$04$b0ZWa9o1Ag5XF5igk2336OId/hz.QQj38VzurX775bZ4.vOsiWfrC',1,0,0,'2023-06-03 09:59:17','2023-06-03 09:59:17'),(11,'test-1685786359','$2a$04$jHPPnxX0QPw4z6A0x/zb4Ol4DTvdgxmmYbcum5EotqrTTDId/tYt6',1,0,0,'2023-06-03 09:59:18','2023-06-03 09:59:18'),(12,'test-1685789220','$2a$04$78TqlUMviflEEkjR4iuK1O7CSMc9V5nBSfOLr2VHsGLt7Y4Mc6JFm',1,0,0,'2023-06-03 10:47:00','2023-06-03 10:47:00');
/*!40000 ALTER TABLE `actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_reg`
--

DROP TABLE IF EXISTS `admin_reg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_reg` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` bigint unsigned DEFAULT NULL,
  `super_admin_id` bigint unsigned DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  KEY `super_admin_id` (`super_admin_id`),
  CONSTRAINT `admin_reg_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `actors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `admin_reg_ibfk_2` FOREIGN KEY (`super_admin_id`) REFERENCES `actors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_reg`
--

LOCK TABLES `admin_reg` WRITE;
/*!40000 ALTER TABLE `admin_reg` DISABLE KEYS */;
INSERT INTO `admin_reg` VALUES (3,4,1,'NEW STATUS...'),(4,5,1,'NEW STATUS....'),(5,7,1,'NEW STATUS....'),(6,8,1,'NEW STATUS....'),(7,9,1,'pending'),(8,10,1,'pending'),(9,11,1,'pending'),(10,12,1,'pending');
/*!40000 ALTER TABLE `admin_reg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authentications`
--

DROP TABLE IF EXISTS `authentications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authentications` (
  `token` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authentications`
--

LOCK TABLES `authentications` WRITE;
/*!40000 ALTER TABLE `authentications` DISABLE KEYS */;
/*!40000 ALTER TABLE `authentications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'George','Bluth','george.bluth@reqres.in','https://reqres.in/img/faces/1-image.jpg','2023-06-03 07:55:21','2023-06-03 07:55:21'),(2,'Janet','Weaver','janet.weaver@reqres.in','https://reqres.in/img/faces/2-image.jpg','2023-06-03 07:55:21','2023-06-03 07:55:21'),(3,'Emma','Wong','emma.wong@reqres.in','https://reqres.in/img/faces/3-image.jpg','2023-06-03 07:55:21','2023-06-03 07:55:21'),(4,'Eve','Holt','eve.holt@reqres.in','https://reqres.in/img/faces/4-image.jpg','2023-06-03 07:55:21','2023-06-03 07:55:21'),(5,'Charles','Morris','charles.morris@reqres.in','https://reqres.in/img/faces/5-image.jpg','2023-06-03 07:55:21','2023-06-03 07:55:21'),(6,'Tracey','Ramos','tracey.ramos@reqres.in','https://reqres.in/img/faces/6-image.jpg','2023-06-03 07:55:21','2023-06-03 07:55:21'),(7,'Michael','Lawson','michael.lawson@reqres.in','https://reqres.in/img/faces/7-image.jpg','2023-06-03 07:55:21','2023-06-03 07:55:21'),(8,'Lindsay','Ferguson','lindsay.ferguson@reqres.in','https://reqres.in/img/faces/8-image.jpg','2023-06-03 07:55:21','2023-06-03 07:55:21'),(9,'Tobias','Funke','tobias.funke@reqres.in','https://reqres.in/img/faces/9-image.jpg','2023-06-03 07:55:21','2023-06-03 07:55:21'),(10,'Byron','Fields','byron.fields@reqres.in','https://reqres.in/img/faces/10-image.jpg','2023-06-03 07:55:21','2023-06-03 07:55:21'),(11,'George','Edwards','george.edwards@reqres.in','https://reqres.in/img/faces/11-image.jpg','2023-06-03 07:55:21','2023-06-03 07:55:21'),(12,'Rachel','Howell','rachel.howell@reqres.in','https://reqres.in/img/faces/12-image.jpg','2023-06-03 07:55:21','2023-06-03 07:55:21'),(16,'tobias','New...','test@mail.co','https://reqres.in/img/faces/10-image.jpg','2023-06-03 15:44:00','2023-06-03 15:44:38'),(17,'tobi','albertino','test@mail.co','https://reqres.in/img/faces/1-image.jpg','2023-06-03 15:48:07','2023-06-03 15:48:07');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_actors`
--

DROP TABLE IF EXISTS `role_actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_actors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_actors`
--

LOCK TABLES `role_actors` WRITE;
/*!40000 ALTER TABLE `role_actors` DISABLE KEYS */;
INSERT INTO `role_actors` VALUES (1,'admin'),(2,'super_admin');
/*!40000 ALTER TABLE `role_actors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-04 20:31:45
