-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: inventory1
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `certificates`
--

DROP TABLE IF EXISTS `certificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certificates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` bigint unsigned DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `info` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `owner_id` (`owner_id`),
  CONSTRAINT `certificates_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Сертификаты ЭП';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates`
--

LOCK TABLES `certificates` WRITE;
/*!40000 ALTER TABLE `certificates` DISABLE KEYS */;
INSERT INTO `certificates` VALUES (1,10,'2021-02-01','2023-02-01','ТАКСКОМ'),(2,NULL,NULL,NULL,'Не требуется'),(3,8,'2021-02-01','2023-02-01','ММВБ'),(4,5,'2021-02-01','2023-02-01','Инфотекс');
/*!40000 ALTER TABLE `certificates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `comps_users`
--

DROP TABLE IF EXISTS `comps_users`;
/*!50001 DROP VIEW IF EXISTS `comps_users`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `comps_users` AS SELECT 
 1 AS `Имя пользователя`,
 1 AS `Компьютер`,
 1 AS `Фамилия`,
 1 AS `Имя`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Отделы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'ИТ'),(2,'Бухгалтерия'),(3,'Служба безопасности'),(4,'Дирекция'),(5,'Маркетинг'),(6,'АХО'),(7,'Водители');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `installed`
--

DROP TABLE IF EXISTS `installed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `installed` (
  `id` bigint unsigned DEFAULT NULL,
  `soft_id` bigint unsigned DEFAULT NULL,
  `pc_id` bigint unsigned DEFAULT NULL,
  `cert_id` bigint unsigned DEFAULT NULL,
  `info` text,
  KEY `soft_id` (`soft_id`),
  KEY `pc_id` (`pc_id`),
  KEY `cert_id` (`cert_id`),
  CONSTRAINT `installed_ibfk_1` FOREIGN KEY (`soft_id`) REFERENCES `software` (`id`) ON DELETE CASCADE,
  CONSTRAINT `installed_ibfk_2` FOREIGN KEY (`pc_id`) REFERENCES `workstations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `installed_ibfk_3` FOREIGN KEY (`cert_id`) REFERENCES `certificates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Установленные программы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `installed`
--

LOCK TABLES `installed` WRITE;
/*!40000 ALTER TABLE `installed` DISABLE KEYS */;
INSERT INTO `installed` VALUES (NULL,1,1,2,'Стандартный браузер'),(NULL,1,2,2,'Стандартный браузер'),(NULL,2,2,2,'Стандартный архиватор'),(NULL,9,10,1,'Крипто ПО'),(NULL,1,4,2,'Стандартный браузер'),(NULL,2,4,2,'Стандартный архиватор'),(NULL,9,5,4,'Крипто ПО'),(NULL,1,5,2,'Стандартный браузер'),(NULL,2,5,2,'Стандартный архиватор'),(NULL,9,8,3,'Крипто ПО'),(NULL,1,6,2,'Стандартный браузер'),(NULL,2,6,2,'Стандартный архиватор'),(NULL,9,1,1,'Крипто ПО'),(NULL,1,7,2,'Стандартный браузер'),(NULL,2,7,2,'Стандартный архиватор'),(NULL,1,8,2,'Стандартный браузер'),(NULL,3,8,2,'Нестандартный архиватор'),(NULL,1,9,2,'Стандартный браузер'),(NULL,3,9,2,'Нестандартный архиватор'),(NULL,1,10,2,'Стандартный браузер'),(NULL,3,10,2,'Нестандартный архиватор'),(NULL,1,3,2,'Стандартный браузер'),(NULL,3,3,2,'Нестандартный архиватор');
/*!40000 ALTER TABLE `installed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `model_id` bigint unsigned DEFAULT NULL,
  `salesman` varchar(50) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `order_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `model_id` (`model_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`model_id`) REFERENCES `warehouse` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Заказы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,5,'Комус',10,NULL),(2,2,'Комус',3,NULL),(3,1,'Комус',2,NULL),(4,4,'Комус',20,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `printers`
--

DROP TABLE IF EXISTS `printers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `printers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `model` varchar(50) DEFAULT NULL,
  `department_id` bigint unsigned DEFAULT NULL,
  `last_service_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `printers_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Принтеры';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `printers`
--

LOCK TABLES `printers` WRITE;
/*!40000 ALTER TABLE `printers` DISABLE KEYS */;
INSERT INTO `printers` VALUES (1,'Aficio mp301',6,NULL),(2,'Aficio mp201',1,NULL),(3,'Aficio mp301',2,NULL),(4,'Aficio mp201',4,NULL),(5,'Aficio mp301',5,NULL);
/*!40000 ALTER TABLE `printers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `user_id` bigint unsigned DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `thirdname` varchar(50) DEFAULT NULL,
  `department_id` bigint unsigned DEFAULT NULL,
  `birthday_at` datetime DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `profiles_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Профили пользователей';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'Евгений','Лавренко','Владимирович',6,'1988-05-31 00:00:00'),(2,'Владимир','Куликов','Сергеевич',1,'1991-02-01 00:00:00'),(3,'Андрей','Коган','Яковлевич',1,'1988-05-01 00:00:00'),(4,'Артем','Иванов','Владимирович',1,'1990-06-28 00:00:00'),(5,'Андрей','Будников','Иванович',1,'1988-05-01 00:00:00'),(6,'Ярослав','Дубицкий','Вадимович',3,'1991-06-07 00:00:00'),(7,'Антон','Тотаев','Юрьевич',7,'1988-07-20 00:00:00'),(8,'Ольга','Туркина','Сергеевна',2,'1985-07-15 00:00:00'),(9,'Натали','Эмих','Александровна',5,'1994-03-03 00:00:00'),(10,'Кристина','Самсонова','Леонидовна',4,'1991-03-04 00:00:00');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `software`
--

DROP TABLE IF EXISTS `software`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `software` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `version` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `info` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Программное обеспечение';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `software`
--

LOCK TABLES `software` WRITE;
/*!40000 ALTER TABLE `software` DISABLE KEYS */;
INSERT INTO `software` VALUES (1,'Google Chrome','100','Free','Internet browser'),(2,'Winrar','4.0','Free','Архиватор'),(3,'7Zip','2021-12-26','Free','Архиватор'),(4,'Ms Outlook','2019','Corp.lic.','Почтовый клинет'),(5,'Ms Word','2019','Corp.lic.','Текстовый редактор'),(6,'Ms Excell','2019','Corp.lic.','Работа с таблицами'),(7,'Telegram','3.6.1','Free','Меседжер'),(8,'Screenpics','0.15.2','Free','Скриншотер'),(9,'Крипто Про CSP','3.9','232792794','Криптопровайдер'),(10,'Foxit Reader','10.1.3.37598','Free','PDF reader');
/*!40000 ALTER TABLE `software` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(50) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Пользователи';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'e.lavrenko',1,'2022-04-15 14:36:07',NULL),(2,'v.kulikov',1,'2022-04-15 14:36:07',NULL),(3,'a.kogan',1,'2022-04-15 14:36:07',NULL),(4,'a.ivanov',1,'2022-04-15 14:36:07',NULL),(5,'a.budnikov',1,'2022-04-15 14:36:07',NULL),(6,'y.dubitskiy',1,'2022-04-15 14:36:07',NULL),(7,'a.totaev',1,'2022-04-15 14:36:07',NULL),(8,'o.turkina',1,'2022-04-15 14:36:07',NULL),(9,'n.emikh',1,'2022-04-15 14:36:07',NULL),(10,'k.samsonova',1,'2022-04-15 14:36:07',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Склад';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
INSERT INTO `warehouse` VALUES (1,'Гарнитура','Defender',10),(2,'Монитор','Dell 2717hb',7),(3,'Стул','табуретка',15),(4,'Батаерйки','Duracell',150),(5,'Флешка','Kingston 16Gb',0);
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workstations`
--

DROP TABLE IF EXISTS `workstations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workstations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `hostname` varchar(50) DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `cpu` varchar(50) DEFAULT NULL,
  `ram` varchar(50) DEFAULT NULL,
  `hdd` varchar(50) DEFAULT NULL,
  `motherboard` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `workstations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Рабочие станции';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workstations`
--

LOCK TABLES `workstations` WRITE;
/*!40000 ALTER TABLE `workstations` DISABLE KEYS */;
INSERT INTO `workstations` VALUES (1,'elavrenko',1,'i7','16Gb','500','Asus'),(2,'vkulikov',2,'i7','16Gb','500','Tyan'),(3,'akogan',3,'i7','16Gb','500','Dell'),(4,'aivanov',4,'i7','16Gb','500','Biostar'),(5,'abudnikov',5,'i7','16Gb','500','PC Partner'),(6,'ydubitskiy',6,'i7','16Gb','500','Asrock'),(7,'atotaev',7,'i7','16Gb','500','Albatron'),(8,'oturkina',8,'i7','16Gb','500','Gigabyte'),(9,'nemikh',9,'i7','16Gb','500','MSI'),(10,'ksamsonova',10,'i7','16Gb','500','SuperMicro');
/*!40000 ALTER TABLE `workstations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `comps_users`
--

/*!50001 DROP VIEW IF EXISTS `comps_users`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `comps_users` AS select `u`.`login` AS `Имя пользователя`,`w`.`hostname` AS `Компьютер`,`p`.`lastname` AS `Фамилия`,`p`.`firstname` AS `Имя` from ((`users` `u` join `profiles` `p` on((`u`.`id` = `p`.`user_id`))) join `workstations` `w` on((`w`.`user_id` = `u`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-15 15:17:59
