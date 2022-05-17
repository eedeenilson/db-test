-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: events
-- ------------------------------------------------------
-- Server version	5.5.5-10.6.7-MariaDB

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
-- Table structure for table `attendee`
--

DROP TABLE IF EXISTS `attendee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(200) NOT NULL,
  `identification_number` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `fk_groupId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `attendee_FK` (`fk_groupId`),
  CONSTRAINT `attendee_FK` FOREIGN KEY (`fk_groupId`) REFERENCES `eventgroup` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendee`
--

LOCK TABLES `attendee` WRITE;
/*!40000 ALTER TABLE `attendee` DISABLE KEYS */;
INSERT INTO `attendee` VALUES (4,'Elmer Arana','$2b$15$/r7p71xwrILGOwdToQ8uEezYAHpb6hjgTdEdwepB7N9xx8JNKE88O','2022-05-16 16:28:51',NULL,2,NULL,1),(5,'Elmer Arana','$2b$15$jWNMg/Llm8aX7DQPXs3NAeWiamG3VqIP.BkphZGBOCcQN91cSlD5e','2022-05-16 16:30:32',NULL,2,NULL,2),(6,'',NULL,'2022-05-16 18:24:05',NULL,2,NULL,5),(7,'Eduardo Valencia','$2b$15$doW6DcsKOKR9oezfF60cyerPHiK/ou.pStEJe/Obw9xYsxYXp7/0m','2022-05-16 19:07:38',NULL,2,NULL,6);
/*!40000 ALTER TABLE `attendee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'El Salvador','2022-05-15 09:56:52',NULL,1,NULL);
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `fk_locationId` int(11) NOT NULL,
  `event_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_FK` (`fk_locationId`),
  CONSTRAINT `event_FK` FOREIGN KEY (`fk_locationId`) REFERENCES `location` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (1,'evento de prueba','2022-05-15 11:45:22',NULL,2,NULL,1,'2022-05-15 09:56:52'),(2,'evento 2 bla bla bla','2022-05-15 11:47:07','2022-05-15 15:41:06',2,2,1,'2022-05-16 09:56:52'),(3,'Evento benefico','2022-05-16 15:14:29',NULL,2,NULL,1,'2022-05-31 15:14:00'),(4,'Otro evento','2022-05-16 15:16:14',NULL,2,NULL,1,'2022-05-31 15:16:00'),(5,'Un evento mas','2022-05-16 15:17:21',NULL,2,NULL,1,'2022-05-30 15:17:00'),(6,'Evento de prueba a las 7','2022-05-16 19:07:01',NULL,2,NULL,1,'2022-05-26 19:06:00');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventgroup`
--

DROP TABLE IF EXISTS `eventgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `fk_eventId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_FK` (`fk_eventId`),
  CONSTRAINT `group_FK` FOREIGN KEY (`fk_eventId`) REFERENCES `event` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventgroup`
--

LOCK TABLES `eventgroup` WRITE;
/*!40000 ALTER TABLE `eventgroup` DISABLE KEYS */;
INSERT INTO `eventgroup` VALUES (1,'2022-05-16 15:48:24',NULL,2,NULL,'default',5),(2,'2022-05-16 16:29:32',NULL,2,NULL,'default',4),(3,'2022-05-16 16:29:54',NULL,2,NULL,'GrupoEVentoMas',5),(4,'2022-05-16 18:21:01',NULL,2,NULL,'Otro grupo de prueba',5),(5,'2022-05-16 18:23:57',NULL,2,NULL,'Otro grupo mas',1),(6,'2022-05-16 19:07:20',NULL,2,NULL,'default 7',6);
/*!40000 ALTER TABLE `eventgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `fk_countryId` int(11) NOT NULL,
  `address` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `location_FK` (`fk_countryId`),
  CONSTRAINT `location_FK` FOREIGN KEY (`fk_countryId`) REFERENCES `country` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES ('2022-05-15 09:57:45',NULL,1,NULL,1,'Telus Cascadas',1,'San Salvador');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `fk_locationId` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `fk_userType` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_FK` (`fk_locationId`),
  KEY `user_FK_1` (`fk_userType`),
  CONSTRAINT `user_FK` FOREIGN KEY (`fk_locationId`) REFERENCES `location` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `user_FK_1` FOREIGN KEY (`fk_userType`) REFERENCES `usertype` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Administrator','admin','$2a$15$mAW3WJo4pxKlwEFhbhzWuOa4cXAQlHuQxQZtJUL9qEAzw0vXPZO16',1,'2022-05-15 09:58:27',NULL,1,NULL,1),(2,'Elmer Edenilson Arana Aguirre','nilson094','$2b$15$PIRonaYLBvw/dodHXKfaoO4pF9kY7WYuGRmdrdWDPyqWEQul3gIe.',1,'2022-05-15 10:39:42','2022-05-15 10:46:59',1,2,1),(3,'Juan Arana Murcia','not404','$2b$15$NRu5IHkdbubWNly.hJTqdeaZdhy6fB.gcJJQHtloPXEdfrFAgnha.',1,'2022-05-16 18:30:29',NULL,1,NULL,2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertype`
--

DROP TABLE IF EXISTS `usertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usertype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertype`
--

LOCK TABLES `usertype` WRITE;
/*!40000 ALTER TABLE `usertype` DISABLE KEYS */;
INSERT INTO `usertype` VALUES (1,'administrator','2022-05-15 09:54:49',NULL,1,NULL),(2,'staff','2022-05-15 09:54:49',NULL,1,NULL),(3,'regular','2022-05-15 09:54:49',NULL,1,NULL);
/*!40000 ALTER TABLE `usertype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'events'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-16 19:26:06
