

--
-- Table structure for table `dkmh`
--

DROP TABLE IF EXISTS `dkmh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dkmh` (
  `users_id` int NOT NULL,
  `subject_id` int NOT NULL,
  PRIMARY KEY (`users_id`,`subject_id`),
  KEY `FKlwefj8rpoiedof7k5oh3393ao` (`subject_id`),
  CONSTRAINT `FK9ufm9ox1x9ojcsopq3b2uw1fh` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKlwefj8rpoiedof7k5oh3393ao` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dkmh`
--

LOCK TABLES `dkmh` WRITE;
/*!40000 ALTER TABLE `dkmh` DISABLE KEYS */;
INSERT INTO `dkmh` VALUES (1,1),(2,1),(1,2),(2,2),(1,3),(1,4),(2,4),(1,5),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10),(2,11),(1,12),(2,13),(1,14),(2,14),(1,15),(2,15),(2,16),(2,17),(1,18),(2,18),(1,19),(2,19),(2,20),(2,21),(2,22),(2,23),(2,25),(2,26),(2,27),(2,28),(1,29),(2,29),(1,30),(2,30),(1,31),(2,31);
/*!40000 ALTER TABLE `dkmh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(400) NOT NULL,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ofx66keruapi6vyqpv6f2or37` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','ROLE_ADMIN'),(2,'user','ROLE_USER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_subject` varchar(128) NOT NULL,
  `name_subject` varchar(128) NOT NULL,
  `total_credits` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'Đại cương','Vật lí 1',3),(2,'Đại cương','Toán 1',3),(3,'Đại cương ','Toán 2',3),(4,'Đại cương','Toán 3',3),(5,'Chuyên ngành','Nhập môn lập trình ',3),(6,'Chuyên ngành','Kỹ thuật lập trình',3),(7,'Chuyên ngành ','Nhập môn ngành CNTT',3),(8,'Chuyên ngành','Cơ sở dữ liệu ',3),(9,'Đại cương','Kinh tế chính trị',2),(10,'Đại cương','Triết học',3),(11,'Đại cương','Chủ nghĩa xã hội khoa học',3),(12,'Đại cương','Lịch sử Đảng',3),(13,'Đại cương','Tư tưởng Hồ Chí Minh',3),(14,'Đại cương','Xác suất thống kê',3),(15,'Chuyên ngành','Toán rời rạc',3),(16,'Chuyên ngành','Hệ quản trị và cơ sở dữ liệu',3),(17,'Chuyên ngành','Lập trình Web',3),(18,'Chuyên ngành','Công nghệ phần mềm',3),(19,'Chuyên ngành','Trí tuệ nhân tạo',3),(20,'Chuyên ngành','Lập trình Window',3),(21,'Chuyên ngành','Điện toán đám mây',3),(22,'Chuyên ngành','Ngôn ngữ lập trình tiên tiến',3),(23,'Chuyên ngành','Học sâu',3),(24,'Chuyên ngành','Thương mại điện tử',3),(25,'Chuyên ngành','Hệ thống nhúng',3),(26,'Chuyên ngành','Học máy',3),(27,'Đại cương','Kinh tế học đại cương',3),(28,'Đại cương','Anh văn 1',3),(29,'Đại cương','Anh văn 2',3),(30,'Đại cương','Anh văn 3',3),(31,'Đại cương','Anh văn 4',3);
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `class` varchar(45) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `password` varchar(64) NOT NULL,
  `username` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'191101',_binary '','Minh Duc','$2a$10$PrI5Gk9L.tSZiW9FXhTS8O8Mz9E97k2FZbFvGFFaSsiTUIl.TCrFu','ducduc'),(2,'191101',_binary '','Tong','$2a$10$PrI5Gk9L.tSZiW9FXhTS8O8Mz9E97k2FZbFvGFFaSsiTUIl.TCrFu','tong');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_roles` (
  `users_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`users_id`,`role_id`),
  KEY `FKj6m8fwv7oqv74fcehir1a9ffy` (`role_id`),
  CONSTRAINT `FKj6m8fwv7oqv74fcehir1a9ffy` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `FKml90kef4w2jy7oxyqv742tsfc` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (1,1),(2,1),(1,2),(2,2);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-02 22:14:06
