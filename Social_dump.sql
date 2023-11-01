-- MySQL dump 10.13  Distrib 8.1.0, for Win64 (x86_64)
--
-- Host: localhost    Database: social
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `postId` int NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `content` text NOT NULL,
  `seen` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `postId` (`postId`),
  KEY `userId` (`userId`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`postId`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (39,3,9,'2023-10-27 22:42:10','doen',1),(51,3,62,'2023-10-30 13:21:54','new comment',1),(52,3,67,'2023-10-30 17:17:49','done',1),(53,3,60,'2023-10-30 17:17:56','done',1);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ownerId` int NOT NULL,
  `image` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `communities` (`ownerId`),
  CONSTRAINT `communities` FOREIGN KEY (`ownerId`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friends`
--

DROP TABLE IF EXISTS `friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friends` (
  `userId` int NOT NULL,
  `friendId` int NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userId`,`friendId`),
  KEY `friendId` (`friendId`),
  CONSTRAINT `friends_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `friends_ibfk_2` FOREIGN KEY (`friendId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friends`
--

LOCK TABLES `friends` WRITE;
/*!40000 ALTER TABLE `friends` DISABLE KEYS */;
INSERT INTO `friends` VALUES (1,2,'2023-10-24 16:53:04',1),(3,1,'2023-10-29 23:22:46',1),(3,2,'2023-10-24 17:09:01',1);
/*!40000 ALTER TABLE `friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `postId` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `seen` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userId` (`userId`,`postId`),
  KEY `postId` (`postId`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`postId`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (172,3,9,'angry','2023-10-29 16:04:47',1),(173,3,8,'love','2023-10-29 16:06:51',1),(174,3,6,'like','2023-10-29 16:07:01',1),(175,3,5,'haha','2023-10-29 16:07:05',1),(185,1,8,'angry','2023-10-30 00:07:53',1),(198,3,62,'wow','2023-10-30 17:58:59',1),(201,1,67,'wow','2023-10-31 17:31:12',0);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `senderId` int NOT NULL,
  `reciverId` int NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `content` text NOT NULL,
  `image` text,
  `seen` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `senderId` (`senderId`),
  KEY `reciverId` (`reciverId`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`senderId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `message_ibfk_2` FOREIGN KEY (`reciverId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,3,1,'2023-10-29 17:14:30','hello omer kahled',NULL,1),(2,3,1,'2023-10-29 17:31:54','hello gqy',NULL,1),(3,1,3,'2023-10-28 17:14:30','hello another',NULL,1),(4,1,3,'2023-10-29 21:20:37','message turn on?😍😀',NULL,1),(5,3,1,'2023-10-29 21:20:51','ok its run',NULL,1),(6,1,3,'2023-10-29 21:22:15','done',NULL,1),(7,3,1,'2023-10-29 21:31:29','ok iam omer khaled mohamed😍😍🥰',NULL,1),(8,1,3,'2023-10-29 21:52:30','ok',NULL,1),(9,3,1,'2023-10-29 21:52:41','قول كلام غير ده',NULL,1),(10,1,3,'2023-10-29 22:06:41','ياعم خلصانه',NULL,1),(11,1,3,'2023-10-29 23:56:54','مصطفى اشف جه😍😂',NULL,1),(12,3,1,'2023-10-29 23:57:41','تمام',NULL,1),(13,3,1,'2023-10-29 23:58:25','done',NULL,1),(14,1,3,'2023-10-30 00:14:35','iam 0mer khaled moahemd khaled  khaled  khaled khaled khaled khaled khaled khaled khaled khaled khaled khaled ',NULL,1),(15,3,1,'2023-10-30 00:15:24','iam 0mer khaled moahemd khaled khaled khaled khaled khaled khaled khaled khaled khaled khaled khaled khaled',NULL,1),(16,3,1,'2023-10-30 13:51:49','hello',NULL,1),(17,3,1,'2023-10-30 13:53:19','hello again',NULL,1),(18,3,1,'2023-10-30 13:53:23','ok',NULL,1),(19,3,1,'2023-10-30 13:53:36','ok',NULL,1),(20,3,1,'2023-10-30 13:53:37','pk',NULL,1),(21,3,1,'2023-10-30 13:53:38','pk',NULL,1),(22,3,1,'2023-10-30 13:53:54','done',NULL,1),(23,3,1,'2023-10-30 13:53:56','done',NULL,1),(24,3,1,'2023-10-30 13:57:31','done last',NULL,1),(25,3,1,'2023-10-30 14:01:48','two',NULL,1),(26,3,1,'2023-10-30 14:02:00','three',NULL,1),(27,3,1,'2023-10-30 14:03:11','four',NULL,1),(28,3,1,'2023-10-30 14:04:39','five',NULL,1),(29,3,1,'2023-10-30 14:06:01','six',NULL,1),(30,3,1,'2023-10-30 14:06:11','seven',NULL,1),(31,3,1,'2023-10-30 14:06:17','eight',NULL,1),(32,3,1,'2023-10-30 17:17:03','new message',NULL,1),(33,3,1,'2023-10-30 17:17:23','new message test',NULL,1),(34,3,1,'2023-10-30 18:02:06','test one mostafa ashraf',NULL,1),(35,3,1,'2023-10-30 18:02:19','test one mostafa',NULL,1),(36,3,1,'2023-10-30 18:02:50','ازيك يسطا',NULL,1),(37,3,1,'2023-10-30 18:03:08','ازيك يسطاي😍🥰',NULL,1),(38,3,1,'2023-10-30 18:05:08','dddd',NULL,1),(39,3,1,'2023-10-30 18:05:13','two d',NULL,1),(40,3,1,'2023-10-30 18:05:39','dddd',NULL,1),(41,3,1,'2023-10-30 18:05:54','dfffff',NULL,1),(42,3,1,'2023-10-30 18:14:44','ffffffffffffff',NULL,1),(43,3,1,'2023-10-30 18:15:12','dddddddddddd',NULL,1),(44,3,1,'2023-10-30 18:15:27','ggggg',NULL,1),(45,3,1,'2023-10-30 18:16:32','d',NULL,1),(46,3,1,'2023-10-30 18:17:41','gggg',NULL,1),(47,3,1,'2023-10-30 18:19:57','f',NULL,1),(48,3,1,'2023-10-30 18:20:34','ff',NULL,1),(49,3,1,'2023-10-30 18:21:50','gggggg',NULL,1),(50,3,1,'2023-10-30 18:24:12','d',NULL,1),(51,3,1,'2023-10-30 18:24:22','gggggggggggggggggggggg',NULL,1),(52,3,1,'2023-10-30 18:25:15','jhgfghjkjhgfghjhgf',NULL,1),(53,3,1,'2023-10-30 18:25:28','jjjjjjjj',NULL,1),(54,3,1,'2023-10-30 18:26:30','ggggggggggg',NULL,1),(55,3,1,'2023-10-30 18:26:37','g',NULL,1),(56,3,1,'2023-10-30 18:30:08','q',NULL,1),(57,3,1,'2023-10-30 18:31:11','b',NULL,1),(58,3,1,'2023-10-30 18:31:22','k',NULL,1),(59,3,1,'2023-10-30 18:31:53','g',NULL,1),(60,3,1,'2023-10-30 18:32:12','l',NULL,1),(61,3,1,'2023-10-30 18:32:19','r',NULL,1);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `userId` int NOT NULL,
  `image` text,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (5,'last post',1,'f3c4b5de-36c3-47f1-ad94-dcb25aaa62faalpear3.jpg','2023-10-19 23:38:40'),(6,'heloo wrolld from my first post ',1,'e97abb80-84a0-4586-af2e-edd81ca882fd3828544.jpg','2023-10-24 23:57:08'),(8,'last post for me on this plat form😂😍😀😁😂😀',1,NULL,'2023-10-25 00:17:33'),(9,'😂😂🙂😃😀😃last',1,'c1b7fa1c-791a-4b75-9786-d25ff48bf52bf4.png','2023-10-25 00:30:11'),(60,'one',1,NULL,'2023-10-29 23:24:31'),(62,'three\r\n',1,NULL,'2023-10-29 23:25:00'),(67,'hello world😍🥰😇😇😄😀😃',3,'f7df2362-50cd-41e7-a947-a49ad3d20ab7f3.png','2023-10-30 17:04:18');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postsincommunities`
--

DROP TABLE IF EXISTS `postsincommunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postsincommunities` (
  `postId` int NOT NULL,
  `communityId` int NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`postId`),
  KEY `communityId` (`communityId`),
  CONSTRAINT `postsincommunities_ibfk_1` FOREIGN KEY (`postId`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `postsincommunities_ibfk_2` FOREIGN KEY (`communityId`) REFERENCES `communities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postsincommunities`
--

LOCK TABLES `postsincommunities` WRITE;
/*!40000 ALTER TABLE `postsincommunities` DISABLE KEYS */;
/*!40000 ALTER TABLE `postsincommunities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `password` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'omer khaled','omerkhaled@gmail.com','491dbafb-258b-4fcd-8881-9a750e1ef329personalImage.jpg','2023-10-19 16:50:43','$2b$12$Fqw49hGDwheR2UAcnq4jueWOxR5YPxJ0LkZ4P.nIrFFeu923jeW5e'),(2,'mohamed khaled','mohamedkhaled@gmail.com','d82bf82c-211e-461b-a71e-e4fbc61fdf10download (2).jpeg','2023-10-20 15:17:17','$2b$12$mLuA1pgDiq9O19bQzg9FJOEyheWkW8eMOypwGNN/8CZEKtnCT5C.C'),(3,'Omer Khaled Mohamed','omerkhaledmohamedmohamed123@gmail.com','be417bae-b846-4a2f-b36e-93ab4626e4a5download (2).jpeg','2023-10-23 23:46:01','$2b$12$Mrtd8RYt0M/j4StlPbfagOswFxihOUsd5heWV.3CDsRqmd9kxgopm');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usersincommunities`
--

DROP TABLE IF EXISTS `usersincommunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usersincommunities` (
  `userId` int NOT NULL,
  `communityId` int NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userId`,`communityId`),
  KEY `communityId` (`communityId`),
  CONSTRAINT `usersincommunities_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `usersincommunities_ibfk_2` FOREIGN KEY (`communityId`) REFERENCES `communities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usersincommunities`
--

LOCK TABLES `usersincommunities` WRITE;
/*!40000 ALTER TABLE `usersincommunities` DISABLE KEYS */;
/*!40000 ALTER TABLE `usersincommunities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-31 21:59:11
