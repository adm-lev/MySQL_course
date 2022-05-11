-- MariaDB dump 10.19  Distrib 10.5.12-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_23
-- ------------------------------------------------------
-- Server version	10.5.12-MariaDB-cll-lve

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
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_user_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `name` (`name`),
  KEY `admin_user_id` (`admin_user_id`),
  CONSTRAINT `communities_ibfk_1` FOREIGN KEY (`admin_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (1,'qui',20),(2,'voluptatem',17),(3,'id',20),(4,'harum',12),(5,'ab',18),(6,'esse',20),(7,'eius',1),(8,'voluptatem',16),(9,'doloremque',7),(10,'beatae',9),(11,'impedit',11),(12,'ea',2),(13,'aspernatur',15),(14,'ratione',12),(15,'a',14),(16,'ea',1),(17,'illum',18),(18,'aut',15),(19,'ab',18),(20,'quaerat',1);
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friend_requests` (
  `initiator_user_id` bigint(20) unsigned NOT NULL,
  `target_user_id` bigint(20) unsigned NOT NULL,
  `status` enum('requested','approved','declined','unfrended') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`initiator_user_id`,`target_user_id`),
  KEY `target_user_id` (`target_user_id`),
  CONSTRAINT `friend_requests_ibfk_1` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `friend_requests_ibfk_2` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`initiator_user_id` <> `target_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_requests`
--

LOCK TABLES `friend_requests` WRITE;
/*!40000 ALTER TABLE `friend_requests` DISABLE KEYS */;
INSERT INTO `friend_requests` VALUES (1,3,'approved','1974-03-31 10:54:56','2009-12-28 12:26:52'),(2,8,'requested','1988-05-28 09:46:12','1973-04-09 09:02:06'),(6,7,'declined','2011-09-08 04:57:15','1973-08-07 04:08:01'),(7,11,'declined','1981-10-29 12:18:51','1998-01-25 01:35:04'),(9,1,'unfrended','1994-05-02 20:23:22','2000-02-13 06:28:44'),(10,4,'approved','1975-12-20 19:57:44','1989-03-07 02:19:17'),(11,5,'unfrended','2020-08-17 02:01:26','2013-03-25 12:11:02'),(12,16,'unfrended','1982-06-05 08:13:22','2016-06-18 03:46:22'),(15,13,'approved','2010-01-13 21:22:17','2000-11-28 04:23:25'),(15,18,'declined','1997-09-12 12:03:28','1984-05-31 04:54:42'),(16,12,'requested','2020-11-03 15:17:49','2015-01-21 10:16:54'),(17,15,'approved','1982-05-24 21:38:29','1981-07-07 11:27:34'),(17,16,'requested','1995-05-08 15:23:31','1986-07-29 01:51:45'),(18,2,'declined','2013-08-03 19:08:19','2003-07-15 23:38:00'),(18,8,'unfrended','1985-08-10 21:08:41','2000-08-02 13:24:41'),(18,13,'declined','1998-02-09 03:15:53','2012-09-18 11:23:00'),(18,15,'approved','1987-10-04 10:48:48','1999-08-11 13:37:56'),(19,20,'declined','1991-10-30 06:45:39','1986-02-15 15:40:25'),(20,6,'requested','1993-06-02 13:20:05','2007-12-24 19:30:31');
/*!40000 ALTER TABLE `friend_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gifts`
--

DROP TABLE IF EXISTS `gifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gifts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gift_type` enum('flower','heart','donut','teddy') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_user_id` bigint(20) unsigned NOT NULL,
  `gift_cost` int(11) DEFAULT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `gifts_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `gifts_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Подарки';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gifts`
--

LOCK TABLES `gifts` WRITE;
/*!40000 ALTER TABLE `gifts` DISABLE KEYS */;
INSERT INTO `gifts` VALUES (1,'heart',14,13,97,'1992-07-11 13:33:08','2007-03-09 08:17:54'),(2,'teddy',9,11,25,'2000-02-04 12:11:47','1983-12-12 10:43:54'),(3,'teddy',18,17,74,'2012-05-29 20:27:10','1983-11-17 00:48:19'),(4,'flower',18,16,96,'2015-07-24 15:26:57','1984-11-12 14:02:48'),(5,'donut',11,11,15,'1979-12-27 11:07:15','1981-01-24 20:16:25'),(6,'heart',3,20,24,'2002-01-13 21:34:32','1993-07-06 03:42:17'),(7,'donut',11,17,83,'2017-10-18 01:38:27','2018-07-19 19:01:00'),(8,'flower',20,6,13,'2001-01-04 23:05:35','2000-08-26 21:37:21'),(9,'donut',4,12,32,'2004-10-14 16:29:03','1991-02-28 09:26:47'),(10,'donut',16,17,18,'2006-08-14 10:44:08','1975-08-15 17:04:47'),(11,'teddy',11,7,24,'1989-12-24 16:19:17','2017-04-09 10:15:35'),(12,'teddy',8,12,45,'1983-12-16 09:16:12','2017-06-10 05:05:35'),(13,'flower',7,11,29,'2013-08-04 13:49:23','2019-04-27 05:31:50'),(14,'flower',1,17,36,'2009-12-26 14:36:52','1994-01-14 15:47:24'),(15,'donut',4,10,79,'1973-09-08 05:49:05','1988-06-29 07:08:14'),(16,'teddy',10,17,32,'1971-01-12 01:09:20','1987-02-12 16:36:47'),(17,'donut',2,19,61,'1985-10-10 15:15:28','2008-06-16 09:40:01'),(18,'heart',8,20,81,'1990-08-31 10:26:13','1986-02-18 04:26:54'),(19,'heart',15,5,72,'2014-01-12 19:01:58','2015-01-10 07:08:47'),(20,'teddy',15,5,44,'1977-12-31 22:17:22','2010-03-06 17:28:47');
/*!40000 ALTER TABLE `gifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,6,6,'1977-06-13 20:36:19'),(2,19,19,'2005-05-19 19:05:29'),(3,16,18,'1991-07-14 07:04:07'),(4,3,16,'2021-04-05 04:48:21'),(5,5,13,'2020-04-12 05:05:56'),(6,1,6,'2007-04-18 00:45:28'),(7,2,15,'1970-06-25 10:07:55'),(8,8,12,'2008-04-11 00:09:34'),(9,8,5,'1985-03-03 03:33:51'),(10,17,17,'2011-08-28 05:54:19'),(11,6,8,'2017-10-25 08:56:54'),(12,19,6,'1992-06-06 23:45:05'),(13,4,8,'1988-08-05 05:06:15'),(14,18,2,'1977-12-26 02:08:36'),(15,8,11,'1981-08-30 13:17:20'),(16,6,14,'1972-03-02 01:47:01'),(17,17,5,'2015-09-20 06:42:35'),(18,12,12,'2009-11-15 08:27:08'),(19,3,15,'1990-09-28 15:37:59'),(20,7,7,'1997-03-10 15:56:27');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `media_type_id` bigint(20) unsigned NOT NULL,
  `body` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `create_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_type_id` (`media_type_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,9,1,'Voluptas iste deserunt quis vitae et itaque. Non qui quia natus earum quis esse consectetur. Voluptate magni voluptatum maiores ad.','consequatur',NULL,'1988-07-20 15:27:37','2007-05-05 23:01:00'),(2,8,2,'Quo sint enim et unde aliquid nulla. Voluptatum ut expedita quia iusto totam voluptatum assumenda. Quam cum tempore voluptatem sed omnis fuga.','ipsum',NULL,'2020-09-01 19:25:05','1981-08-03 04:00:42'),(3,19,3,'Vitae voluptas qui voluptatem ut. Repellat dolorum ea nesciunt qui ipsam. Aut est illo iure unde. Ut vel temporibus cum exercitationem maiores.','corporis',NULL,'2018-03-11 01:23:50','2017-06-14 16:38:26'),(4,5,4,'Et veritatis adipisci est officia dolorem delectus. Est soluta error molestiae. Maxime excepturi et temporibus quis omnis qui. Est omnis velit ut occaecati nihil sit consequatur.','et',NULL,'1998-12-28 09:15:54','2002-10-07 09:51:40'),(5,12,5,'Sapiente in et fuga. Recusandae non aut quia incidunt accusamus aut. Autem quis est incidunt et temporibus quibusdam suscipit eum.','aperiam',NULL,'2004-11-20 06:30:54','1974-10-14 22:53:42'),(6,11,6,'Voluptatem commodi aspernatur dolorem ut magni facere laborum. Mollitia cupiditate ullam fugit sit voluptatum nihil.','sunt',NULL,'1984-07-15 02:28:22','1979-03-07 10:46:59'),(7,8,7,'Fugiat enim assumenda asperiores consequatur rerum accusamus ullam. Consequatur illo praesentium placeat aliquam sunt ipsa vel. Harum sequi molestiae modi dolorem in quisquam. Ratione quisquam totam pariatur nulla et.','laboriosam',NULL,'1998-05-15 04:31:45','2000-08-11 07:20:07'),(8,7,8,'Et dolores vel ducimus id. Perspiciatis et consequuntur ut omnis. Est doloribus nulla quasi quam aut ipsa facere.','unde',NULL,'2010-10-28 12:55:49','2007-03-19 17:01:53'),(9,6,9,'Veritatis quod aut qui impedit cumque mollitia rerum. Natus qui aliquam et. Nemo qui quidem reprehenderit odit omnis commodi.','sed',NULL,'2020-11-29 04:00:29','2010-08-18 04:29:26'),(10,15,10,'Ut ipsum dolor itaque et magni. Et voluptas autem illum ex. Magni sed et natus quibusdam sed. Corrupti ab sit iusto architecto tempora ut laudantium porro.','ut',NULL,'2009-09-17 03:25:02','1978-07-21 16:06:32'),(11,18,11,'Ratione excepturi vel illum et voluptatem omnis rerum. Tempora et quasi dolorem ducimus voluptate sint quo. Ut quidem quidem omnis voluptatem. Inventore adipisci commodi illum dolores eum.','fuga',NULL,'1985-06-20 13:11:01','2019-04-12 10:52:34'),(12,8,12,'Dolores dolorem iusto inventore ducimus. Dolor provident et ea. Culpa qui aliquid sit adipisci assumenda dolorem.','rerum',NULL,'1973-08-22 05:25:17','1997-09-30 10:35:02'),(13,2,13,'Molestiae blanditiis eum consequatur in voluptas. Et earum nostrum et molestias nesciunt quia doloremque. Id delectus est nisi maxime.','et',NULL,'1970-06-22 09:24:09','2020-07-31 13:26:29'),(14,3,14,'Voluptate laborum non reiciendis nulla quos veritatis. Autem et occaecati sit et atque sapiente. Quod omnis debitis ut. Porro provident voluptatem dolor velit nam.','quos',NULL,'2007-05-12 11:13:20','1992-04-14 16:24:51'),(15,1,15,'Quidem optio nam deleniti atque nam ullam. Ea optio sit eveniet recusandae consequuntur numquam necessitatibus. Alias eaque similique suscipit dolore doloribus ducimus.','dolorem',NULL,'2020-10-30 05:21:20','1979-06-23 04:24:27'),(16,15,16,'Quidem aut et distinctio explicabo voluptatem. Accusantium aut facere quis voluptatem necessitatibus. Provident voluptatem illum deserunt qui eos nulla neque.','possimus',NULL,'2007-11-06 11:34:32','1999-01-01 16:55:21'),(17,14,17,'Iure et non est quia quasi repudiandae. Nisi omnis repudiandae ipsam atque libero. Quod praesentium sit id animi itaque deleniti. Quod sunt et magni inventore et soluta.','voluptatem',NULL,'1977-07-05 03:45:45','1988-05-12 07:10:03'),(18,16,18,'Eum fugiat reiciendis rem molestiae itaque. Ullam vel nam facere cumque blanditiis. Ratione qui harum ratione earum ipsum. Dolorem dolore est dolorem autem.','vel',NULL,'1989-04-07 03:50:01','2011-10-12 12:25:41'),(19,6,19,'Repellendus vel nihil mollitia non placeat. Facilis asperiores molestias sed et quia itaque laboriosam. Fugit et iste mollitia.','totam',NULL,'2010-06-15 13:16:30','1971-08-06 13:30:18'),(20,8,20,'Et veniam facilis et. Quia quod ab sunt et voluptate omnis autem ad. Reprehenderit voluptatibus magnam eos dolor.','impedit',NULL,'1987-04-25 18:57:24','1996-06-18 05:58:16');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'ad'),(2,'vel'),(3,'dolorem'),(4,'sit'),(5,'soluta'),(6,'quos'),(7,'voluptatum'),(8,'quasi'),(9,'reiciendis'),(10,'enim'),(11,'doloremque'),(12,'voluptates'),(13,'qui'),(14,'architecto'),(15,'facilis'),(16,'aut'),(17,'sed'),(18,'dolores'),(19,'quae'),(20,'molestias');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,12,18,'Repellat nisi repellendus libero aliquid est. Aut est et tenetur perspiciatis blanditiis omnis.','2015-05-19 02:57:01'),(2,4,9,'Dolor atque recusandae delectus reiciendis. Alias magni odio cumque sapiente quas beatae quia. Rem error quis in sed iusto qui beatae. Aut repudiandae eligendi labore alias nesciunt quaerat quia.','2006-08-19 03:03:49'),(3,14,3,'Ab veritatis architecto eos aliquid fuga qui consequuntur architecto. Soluta accusamus aliquid dolor soluta. A totam reprehenderit qui possimus.','2002-04-02 23:58:16'),(4,12,2,'Repellat iste qui nihil. Quos qui quia aut eaque voluptate nobis voluptas. Nostrum beatae voluptas et rem impedit. Esse possimus rem maxime necessitatibus quae qui dolorem non.','1982-05-03 07:18:46'),(5,6,6,'Ut voluptas ut ut quo tempore et ratione. Aperiam quos et nulla omnis necessitatibus debitis. At velit laborum ipsum tenetur temporibus temporibus illum.','2002-03-13 07:42:03'),(6,12,15,'Ut qui autem nesciunt aperiam. Eaque ipsam sit aperiam qui cupiditate ratione. Quisquam quisquam quo consequatur.','2017-11-09 20:37:03'),(7,13,11,'Sit facilis provident modi. Neque mollitia laudantium asperiores.','2014-04-26 11:18:32'),(8,20,5,'Laudantium aut aliquid consequuntur mollitia officiis nam assumenda velit. Blanditiis corporis in dolores consequatur et. Sapiente voluptates quas tempora omnis.','2002-03-09 13:35:45'),(9,1,7,'A culpa reprehenderit necessitatibus ut laborum. Quos delectus rerum consequuntur ut. Unde sint debitis incidunt fuga. Sed dolor ut voluptates doloremque.','1991-04-02 03:59:10'),(10,11,6,'Voluptates fugiat est unde iste illum. Corporis accusamus voluptas ab voluptatibus molestias cupiditate enim iste. Voluptatum ullam ut soluta voluptas illum. Et rerum iusto dolor doloremque accusantium.','2015-07-01 05:48:11'),(11,1,9,'Sequi sapiente laudantium quae dignissimos voluptates nostrum adipisci. Rerum beatae aliquid ab dolores quaerat. Ut occaecati adipisci non commodi. Rerum ut reprehenderit perspiciatis asperiores enim ut.','1990-04-13 13:18:51'),(12,14,3,'Qui ab aut doloribus enim quod ut. Deleniti consequatur commodi consequuntur dolores ut dolores. Sunt qui sequi doloremque qui veniam est quo. Doloremque sit sunt quod ab.','2012-01-28 03:46:54'),(13,11,14,'Libero velit quam odit ducimus. Vel sapiente omnis in enim sit aut. Labore et perferendis ratione. At consectetur rem non.','2003-10-17 12:00:25'),(14,17,5,'Nostrum eum dolorum sit totam totam voluptatibus qui nulla. Autem aut magni non nisi doloribus est aut sequi. Qui sed quia necessitatibus non eum.','1990-06-21 02:44:27'),(15,10,2,'Autem nostrum soluta voluptate rerum quod quod. Saepe voluptatem eius ratione unde voluptatem facere. Impedit consequuntur iure consectetur quia perferendis velit culpa. Earum cumque omnis libero est iure doloremque ab.','1980-11-01 23:06:03'),(16,12,2,'Rerum quia aut qui aut quas aut. Debitis ut illum quidem corrupti pariatur repellat. Qui voluptas autem aut necessitatibus suscipit ducimus hic.','1985-10-12 13:06:22'),(17,20,16,'Debitis quisquam nihil enim dolores corporis consequatur porro. Neque et at quia odit ducimus necessitatibus. Optio inventore ratione voluptatem tenetur. Et ea consequatur quia provident in doloremque et voluptate.','1978-03-21 09:01:40'),(18,10,13,'Dolores laboriosam voluptas enim voluptas autem ut alias. Doloribus blanditiis aut commodi aliquid eos dolorem quis incidunt. Rerum eius ea est impedit consequatur aspernatur doloribus.','1976-07-29 05:46:33'),(19,19,1,'Accusantium sed ea voluptatem. Et doloremque odit aliquid eligendi asperiores. Et non mollitia autem quasi quia perspiciatis sint. Sequi illum quia velit voluptas.','2004-09-18 12:11:31'),(20,14,5,'Quisquam enim est illum quo. Nemo ut incidunt similique molestiae rerum magnam. Aut quia est voluptatem placeat. Eaque animi nulla velit possimus aperiam ipsam non.','2020-08-16 07:36:44');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mood`
--

DROP TABLE IF EXISTS `mood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mood` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `message` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `mood_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Настроение(статус дня)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mood`
--

LOCK TABLES `mood` WRITE;
/*!40000 ALTER TABLE `mood` DISABLE KEYS */;
INSERT INTO `mood` VALUES (1,1,'Suscipit eos beatae mollitia. Quia ut hic doloremque a tenetur error voluptate ab. Sit molestiae por','2021-05-24 22:44:45','2010-03-08 16:33:14'),(2,2,'Et eum maxime corporis omnis nesciunt maxime rerum. Sunt tempore sunt deleniti corrupti ut ut volupt','2018-03-01 13:29:49','1988-07-28 04:50:38'),(3,3,'Vel ut ullam quis ut sunt ea officia iste. Modi sequi consequatur magnam placeat. Id dolore quis ape','2007-01-22 10:14:57','1974-02-23 07:10:55'),(4,4,'Nemo enim sed ad est. Est nihil totam aut provident voluptatem vel. Et iusto ut debitis ratione aut ','2014-08-13 08:02:20','2012-11-12 03:25:35'),(5,5,'Distinctio hic odit earum non perspiciatis. Aut qui voluptate facere consequuntur iste. Harum volupt','1979-10-20 02:33:32','1975-02-24 05:24:13'),(6,6,'Molestiae voluptas quis dolorem ut et dolor. Pariatur expedita nulla fugit occaecati. Vitae voluptat','1983-08-29 14:42:38','2009-11-16 08:37:02'),(7,7,'Non laborum quia dolorem veritatis. Maiores ipsum porro omnis quo voluptas consequatur sit et. Eum a','1980-01-02 22:59:09','1987-04-16 07:38:19'),(8,8,'Aspernatur expedita maiores neque sunt non. Maxime itaque delectus in rerum reiciendis non sequi ut.','1970-09-29 14:19:43','1977-10-07 13:42:13'),(9,9,'Enim deleniti qui facere ratione enim accusamus. Ratione quas itaque et. Et et vero ipsa rem et. Nul','2001-02-04 17:43:53','2009-11-17 04:14:34'),(10,10,'Numquam sed quas nesciunt maiores expedita magnam rerum. Facere a porro voluptatem. Et nulla vel ven','1985-01-31 16:54:04','1987-04-05 06:52:11'),(11,11,'Est ad et fugiat mollitia ut officiis magni. Excepturi non ut accusamus necessitatibus. Blanditiis r','1981-04-05 05:13:22','1998-11-07 20:01:55'),(12,12,'Voluptatum qui vel blanditiis numquam. Dolorum molestias corporis repellat illum perspiciatis eum qu','1988-06-01 11:37:17','2018-07-07 23:09:46'),(13,13,'Ipsam doloribus inventore mollitia accusamus. Quod aliquam nemo tempora voluptas nostrum.','1993-06-21 09:15:11','2005-01-30 22:37:05'),(14,14,'Nihil provident optio ut veritatis harum. Voluptatem ut necessitatibus sed ipsa aut et. Laboriosam q','1978-06-23 23:56:47','2006-09-07 05:59:50'),(15,15,'Sit soluta repellendus inventore accusamus maxime neque et. Est quae nobis ad ut deserunt ut. Sunt q','1987-09-16 12:19:45','1978-05-20 20:18:34'),(16,16,'Recusandae nobis labore molestias qui optio nesciunt. Dignissimos voluptas porro aperiam ducimus num','1994-04-19 15:51:35','1978-02-22 14:24:32'),(17,17,'Consequatur consectetur eos laborum. Et ipsam necessitatibus eos praesentium. Suscipit esse praesent','2005-09-23 00:46:56','1972-06-28 06:46:18'),(18,18,'Nihil est quia consectetur dolorem animi. Non a est impedit. Sequi aspernatur in eius tempore qui es','1970-10-10 22:15:58','1994-01-29 08:00:04'),(19,19,'Repellat aut alias quod voluptates ipsa voluptatem expedita nobis. Consequatur ab quos aut fuga rati','1970-09-17 10:20:30','2020-11-06 13:32:47'),(20,20,'Deserunt et deleniti eius voluptatem et delectus. Dolorem ad voluptatem asperiores ea. Vero voluptat','2018-04-25 21:50:58','2020-03-11 19:44:53');
/*!40000 ALTER TABLE `mood` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `gender` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hometown` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `birthday` date DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `vk_profiles_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'F','East Eduardoport',1,'1995-04-09 02:21:14','1978-03-12 01:32:08'),(2,'M','Lake Dianaton',1,'2018-01-30 04:41:37','1989-09-24 04:02:08'),(3,'F','Port Margueriteshire',1,'2016-09-15 18:27:25','2017-02-10 13:20:56'),(4,'M','New Phyllisside',1,'2013-04-11 17:22:53','2003-12-09 05:35:58'),(5,'F','Chaseberg',1,'1983-04-22 04:07:06','1982-05-22 04:44:11'),(6,'F','Pollichburgh',1,'1981-05-27 03:52:40','1994-07-09 16:05:15'),(7,'M','Tremblaychester',1,'2019-10-04 19:30:55','1973-09-05 21:20:20'),(8,'F','Port Ewell',1,'1975-01-13 18:00:09','1989-04-12 05:00:04'),(9,'F','Camillechester',1,'2003-12-23 18:49:57','1984-09-27 23:06:51'),(10,'M','South Ernaborough',1,'2015-04-29 10:14:20','1981-03-24 01:41:07'),(11,'M','Greenholtside',1,'2019-05-03 02:22:25','2020-04-04 16:13:43'),(12,'F','Arlieshire',1,'1981-02-02 03:35:26','1981-03-16 09:56:57'),(13,'M','East Ruthie',1,'2007-02-08 06:42:58','1977-12-02 11:54:47'),(14,'M','Adamsport',1,'1998-04-27 21:54:57','2008-05-05 22:33:56'),(15,'M','Amelieburgh',1,'1979-05-13 06:20:03','1986-09-12 14:41:51'),(16,'F','Casperborough',1,'2009-12-27 16:27:32','2018-02-05 06:46:05'),(17,'M','Port Andreaneland',1,'2016-10-25 13:46:44','1996-07-18 00:08:57'),(18,'F','North Celiaside',1,'2018-12-03 13:39:55','1978-07-23 16:54:10'),(19,'F','Lake Meghan',1,'2014-08-18 11:25:58','1984-12-13 14:00:14'),(20,'M','New General',1,'1991-07-13 22:55:59','1986-12-19 10:16:16');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'фамилия',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` bigint(20) unsigned DEFAULT NULL,
  `password_hash` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `idx_firstname_lastname` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='юзеры';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Lyric','Hoeger','carmelo09@example.com',89140064432,'2503e12fa9d3b6741d39407a46de0e7c81b5028e'),(2,'Nora','Hintz','o\'connell.bridie@example.net',89574045125,'83070d7961d2cc5ecf19a1ab2f78a5a6afbfe38d'),(3,'Emil','Friesen','edison69@example.com',89869989986,'df081943a2425e651851e6a8e4b1e1ba770491a5'),(4,'Rowena','Parker','harris.ayden@example.net',89138698805,'795b0af2220fea54b66aacb7b45c4b8dd2c3b812'),(5,'Roma','Cronin','michel71@example.net',89668539108,'195df016a85e02c585b1d9ff39f8c15d6738b6f4'),(6,'Ethelyn','Medhurst','goodwin.leila@example.net',89442895008,'5992288827a5bc67c60761e12369adc938b232d4'),(7,'Kathryn','Mills','elody.kuvalis@example.org',89003581013,'904a3542b1ff40ca89b3b7b77695a9f6129711e4'),(8,'Gerson','Gottlieb','moshe.gottlieb@example.net',89374427680,'167a9032a54ac28b1832152baa03125dcc126949'),(9,'Laron','Stehr','tomas46@example.com',89071237344,'eac6521da9d5a6625b08d4ebac8dc9efd40e7c03'),(10,'Caitlyn','Bernhard','ilabadie@example.org',89830477922,'a2e8c170ea0192f037ffe35d46b5aa957d9709dd'),(11,'Zula','Purdy','teagan.howell@example.net',89573057768,'46572c9abd534f64af0096ece8f7fa9b5632a0f1'),(12,'Jude','Harris','herminio13@example.com',89405074757,'91eab682f340f73b96d5698ce23dd25de781a6c0'),(13,'Aurore','Schamberger','obosco@example.org',89546871715,'37268481a4d332a3791dea0669db0c2013f74d68'),(14,'Pauline','Orn','kschaefer@example.org',89947724853,'78f4975634077c4ebfa8669d770ba7ba151f9a54'),(15,'Etha','Hegmann','baumbach.emelie@example.org',89612970374,'af44b0421eedabecb3d77a3138c118e70f2ea064'),(16,'Austen','Trantow','phegmann@example.net',89244539888,'08efbfd8e7134a5d39634fe6013baeb2836b7202'),(17,'Lorena','Macejkovic','beverly.kshlerin@example.net',89236270024,'79a522351d29a4293aa123153abde32bd2943220'),(18,'Benton','Wolf','nikki63@example.net',89643996520,'0fc5e203e545241e131fd99796e4e2ef2c50faf6'),(19,'Lexie','Williamson','schinner.hunter@example.com',89852252286,'f983e4a3a2a8b9d06dca52e678aabbc389dd9dcc'),(20,'Julio','Howell','timmy.heidenreich@example.org',89998870845,'8d4f8c38d2b5f353dfb846f3361a62bf97b39ddb');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_communities`
--

DROP TABLE IF EXISTS `users_communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_communities` (
  `user_id` bigint(20) unsigned NOT NULL,
  `community_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`community_id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `users_communities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_communities_ibfk_2` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_communities`
--

LOCK TABLES `users_communities` WRITE;
/*!40000 ALTER TABLE `users_communities` DISABLE KEYS */;
INSERT INTO `users_communities` VALUES (1,12),(2,17),(6,18),(8,13),(8,19),(9,18),(9,20),(10,10),(10,17),(10,20),(12,9),(12,18),(13,9),(13,17),(14,9),(17,1),(17,12),(17,14),(19,15),(20,11);
/*!40000 ALTER TABLE `users_communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vallet`
--

DROP TABLE IF EXISTS `vallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vallet` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `value` int(11) DEFAULT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `vallet_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Кошелек';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vallet`
--

LOCK TABLES `vallet` WRITE;
/*!40000 ALTER TABLE `vallet` DISABLE KEYS */;
INSERT INTO `vallet` VALUES (1,12,208,'1992-10-17 12:26:08','1986-01-24 19:53:59'),(2,20,450,'1984-01-03 05:49:55','2003-06-07 08:11:12'),(3,7,943,'1995-12-16 08:43:24','2011-09-13 09:46:51'),(4,14,567,'2011-10-20 12:35:57','1991-10-25 23:25:25'),(5,11,616,'1993-08-05 05:37:53','1978-07-26 13:11:42'),(6,19,364,'2001-06-06 03:43:42','1982-02-10 09:05:43'),(7,4,666,'2015-01-08 03:02:26','1979-04-15 11:12:28'),(8,9,181,'1986-05-27 13:27:28','2002-05-19 22:04:46'),(9,8,363,'2021-02-04 08:19:59','1995-07-28 03:20:18'),(10,4,880,'1981-11-21 16:20:17','2006-12-27 14:11:12'),(11,14,682,'2002-11-04 08:52:18','1997-01-07 13:14:09'),(12,12,951,'2014-05-09 02:38:59','2013-10-08 05:02:19'),(13,10,286,'2005-10-31 20:28:55','2007-09-01 08:21:12'),(14,7,477,'2016-05-25 12:43:10','2017-02-10 16:50:12'),(15,20,113,'2014-08-17 01:08:24','2006-03-09 00:28:38'),(16,5,102,'1971-10-04 05:15:01','1978-12-28 13:57:22'),(17,12,481,'1982-07-16 09:04:05','1979-02-04 03:27:22'),(18,10,672,'1977-10-25 19:25:38','2007-04-10 08:32:53'),(19,19,348,'1995-08-29 17:52:32','1994-08-08 02:01:26'),(20,19,409,'1983-09-14 20:19:50','2008-09-18 22:43:50');
/*!40000 ALTER TABLE `vallet` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-06 12:58:04