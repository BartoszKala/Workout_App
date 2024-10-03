-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: mysql-project-daru979.k.aivencloud.com    Database: workout-project
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `exercises`
--

DROP TABLE IF EXISTS `exercises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exercises` (
  `exercise_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `body_part` enum('Całe ciało','Górna część ciała','Dolna część ciała','Ramiona','Klatka piersiowa','Plecy','Barki','Nogi','Pośladki','Mięśnie brzucha') NOT NULL,
  `difficulty_level` enum('Łatwy','Średni','Trudny') DEFAULT NULL,
  `calories_burned_per_minute` int DEFAULT NULL,
  `average_time` int DEFAULT NULL,
  `description` text,
  `gif_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`exercise_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercises`
--

LOCK TABLES `exercises` WRITE;
/*!40000 ALTER TABLE `exercises` DISABLE KEYS */;
INSERT INTO `exercises` VALUES (1,'Pomki','Klatka piersiowa','Średni',2,2,'Ćwicznie angażujące mięśnie klatki piersiowej i mięśnie rąk','/Style/Gifs/12.gif'),(2,'Krążenie ciężarem','Ramiona','Łatwy',1,5,'Ćwiczenie odziałujące na mięśnie w okolicach barków','/Style/Gifs/13.gif'),(4,'Skosy','Mięśnie brzucha','Trudny',3,2,'Wymagające ćwiczenie angażujące praktycznie wszystkie mięśnie brzucha','/Style/Gifs/1.gif'),(5,'Deska dla początkujących','Górna część ciała','Łatwy',2,4,'Ćwiczenie przystepne dla początkujących osób, angażuje mięśnie brzucha oraz plecy, zalecane dla osób z wadą postawy','/Style/Gifs/2.gif'),(6,'Wykroki w miejscu','Całe ciało','Łatwy',4,5,'Ćwiczenie ogólnorozwojowe, angażuje praktycznie całe ciało. Wspomaga kordynację ruchową i pomaga uzyskać prawidłową postawę','/Style/Gifs/3.gif'),(7,'Wyskoki z obciążeniem','Całe ciało','Trudny',5,3,'Ćwiczenie wymagające dużych pokładów energii, zalecane dla osób trenujących od pewnego czasu','/Style/Gifs/4.gif'),(8,'Brzuszki z nogami w górze','Mięśnie brzucha','Trudny',1,3,'Bardziej zawansowana odmiana brzuszków, angażuje praktycznie wszystkie mieśnie brzucha','/Style/Gifs/5.gif'),(9,'Brzuszki','Mięśnie brzucha','Łatwy',1,3,'Klasyczne ćwiczenie na wzmocnienie mięśini brzucha','/Style/Gifs/6.gif'),(10,'Wykroki podporem tyłem','Dolna część ciała','Łatwy',1,4,'Ćwiczenie poprawiające kordynacje ruchową','/Style/Gifs/7.gif'),(12,'Pajacyki','Całe ciało','Łatwy',3,5,'Ćwiczenie zalecane w ramach rozgrzewki','/Style/Gifs/9.gif'),(13,'Wyskoki w miejscu','Dolna część ciała','Łatwy',4,5,'Ćwiczenie angażujące głównie nogi, zalecane dla sportowców, którzy chcą poprawić swój wyskok','/Style/Gifs/10.gif'),(14,'Deska z wykrokiem','Całe ciało','Trudny',3,2,'Bardzo wymagające ćwiczenie, angażuje mięśnie brzucha, pośladki i mięśnie nóg. Zmusza do wytrzymania w niewygodnej pozycji pod własnym ciężarem, przy okazji wymuszając utrzymanie równowagi','/Style/Gifs/11.gif'),(15,'Prostowanie łokci z obciążeniem','Ramiona','Średni',1,5,'Czynność ma na celu wzomcnienie mięśni tricepsu','/Style/Gifs/15.gif'),(16,'Przysiady kordynacyjne','Nogi','Łatwy',1,4,'Ćwiczenie poprawiające kondycje mięści ud i mięśni głębokich, odpowiedzalnych za równowagę ','/Style/Gifs/16.gif'),(17,'Unoszenie hantli','Barki','Łatwy',1,4,'Ćwiczenie wzmacniające braki i mięśnie ramion','/Style/Gifs/17.gif');
/*!40000 ALTER TABLE `exercises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_exercises`
--

DROP TABLE IF EXISTS `plan_exercises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_exercises` (
  `plan_exercises_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `plan_id` bigint unsigned NOT NULL,
  `exercise_id` bigint unsigned NOT NULL,
  `order` int DEFAULT NULL,
  `duration` int DEFAULT NULL,
  PRIMARY KEY (`plan_exercises_id`),
  KEY `plan_id_idx` (`plan_id`),
  KEY `exercise_id_idx` (`exercise_id`),
  CONSTRAINT `exercise_id_1` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`exercise_id`),
  CONSTRAINT `plan_id_1` FOREIGN KEY (`plan_id`) REFERENCES `workout_plans` (`plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_exercises`
--

LOCK TABLES `plan_exercises` WRITE;
/*!40000 ALTER TABLE `plan_exercises` DISABLE KEYS */;
INSERT INTO `plan_exercises` VALUES (12,1,1,2,5),(18,4,2,1,2),(22,4,2,2,30),(25,1,7,4,10),(26,1,7,5,15),(27,4,7,3,1),(28,1,7,3,5),(31,1,14,1,40),(32,11,8,1,2),(33,11,9,2,1),(40,16,12,1,1),(41,16,1,2,1),(42,16,12,3,1),(43,16,16,4,1),(44,16,12,5,1),(45,16,13,6,1),(50,21,1,1,1),(51,21,12,2,1);
/*!40000 ALTER TABLE `plan_exercises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_progress`
--

DROP TABLE IF EXISTS `user_progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_progress` (
  `progress_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `date` datetime DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `body_fat_percentage` float DEFAULT NULL,
  `bmi` float DEFAULT NULL,
  PRIMARY KEY (`progress_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `user_id_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_progress`
--

LOCK TABLES `user_progress` WRITE;
/*!40000 ALTER TABLE `user_progress` DISABLE KEYS */;
INSERT INTO `user_progress` VALUES (1,1,'2024-06-01 15:00:00',80.5,20,24.2),(2,1,'2024-06-02 18:00:00',80.3,20,24.2),(4,77,'2024-06-11 19:47:25',85.6,30.5,24.3),(5,77,'2024-06-11 20:35:11',69.6,25,19.8),(6,77,'2024-06-11 20:42:41',74.6,26.7,21.2),(7,77,'2024-06-11 20:42:54',77.6,27.8,22.1),(8,1,'2024-06-11 20:44:46',77.8,19.7,25.1),(9,77,'2024-06-11 21:13:18',69.8,25.1,19.9),(10,1,'2024-06-11 21:16:32',88,23.6,28.4),(11,1,'2024-06-11 21:16:49',99,27.9,32),(12,1,'2024-06-11 21:17:04',70,16.7,22.6),(13,1,'2024-06-11 21:42:39',75,18.6,24.2),(14,1,'2024-06-11 21:44:20',73,17.8,23.6),(15,1,'2024-06-11 21:46:36',70,16.7,22.6),(16,1,'2024-06-11 21:48:28',72.6,17.7,23.4),(17,1,'2024-06-11 22:08:25',90.8,24.7,29.3),(18,1,'2024-06-12 14:29:24',66,15.1,21.3),(19,1,'2024-06-12 14:29:35',45,7,14.5),(20,1,'2024-06-12 14:29:46',84,22.1,27.1),(21,78,'2024-06-12 15:50:51',100.8,37.1,25.8),(22,1,'2024-06-12 15:56:48',83.5,21.9,27),(24,1,'2024-06-13 15:21:50',67,15.5,21.6),(25,1,'2024-06-14 20:40:04',70.9,17,22.9),(26,1,'2024-06-14 20:41:30',80,20.5,25.8),(27,1,'2024-06-14 20:44:43',78,19.8,25.2),(28,1,'2024-06-14 20:48:19',90,24.4,29.1),(29,1,'2024-06-14 20:48:42',89,24,28.7),(30,1,'2024-06-14 20:48:54',77,19.4,24.9),(31,1,'2024-06-14 20:52:38',79,20.2,25.5),(32,77,'2024-06-14 22:24:41',68.1,24.5,19.4),(33,1,'2024-06-18 14:45:23',78,19.8,25.2),(34,80,'2024-06-18 15:17:41',67,30.6,26.2),(35,1,'2024-06-24 09:39:10',76.8,19.3,24.8);
/*!40000 ALTER TABLE `user_progress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(300) NOT NULL,
  `email` varchar(100) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `gender` enum('M','F') DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `height` float DEFAULT NULL,
  `total_workouts` int DEFAULT '0',
  `total_calories_burned` int DEFAULT '0',
  `total_time_spent` int DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'jkowalski','$2a$11$mgYIBqgxp/sJTedOthu6duWpwHb8Z3HcgVputZrn6E52sYf4dANlG','jkowalski@wp.pl','1999-06-10','M',76.8,176,20,152223,373,'2024-06-08','2024-06-24 10:11:38'),(77,'koks2137','$2a$11$c5r4MtSrDtiiAOrTu4iMJ.VbrWBydOh8DtHetRCtM7RCIQaf0d8r6','koks@email.com','1994-06-16','F',68.1,187.5,5,904,96,'2024-06-11','2024-06-18 14:01:04'),(78,'anowak','$2a$11$CBSx/wWNhROwsmS4cf3Jge2PdtE0OLZg54EAuqk1Hnwn/JwWWsXHW','email@wp.pl','1974-06-12','F',100.8,197.5,0,0,0,'2024-06-12','2024-06-18 21:17:21'),(80,'jkowalok','$2a$11$SSnBU9Vud9FFbcnW8Ly4N.vd0OcTOGUhl5SfmUEsaEWKOlDzDgdYS','tutu@wp.pl','2004-06-10','F',67,160,0,0,0,'2024-06-18','2024-06-18 15:17:52');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workout_plans`
--

DROP TABLE IF EXISTS `workout_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workout_plans` (
  `plan_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `total_time` int DEFAULT NULL,
  `total_calories_burned` int DEFAULT NULL,
  `description` text,
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`plan_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workout_plans`
--

LOCK TABLES `workout_plans` WRITE;
/*!40000 ALTER TABLE `workout_plans` DISABLE KEYS */;
INSERT INTO `workout_plans` VALUES (1,'Plan ogólno rozwojowy',1,75,280,'Plan ogólno rozwojowy idealny dla początkujących','2024-06-05'),(4,'Plan na koniec',1,33,37,'test','2024-06-08'),(11,'Plan testowy nr.2',1,3,3,'Plan z 2 ćwiczeniami','2024-06-14'),(16,'szybki plan',77,6,16,'','2024-06-14'),(20,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque sapien lorem, ullamcorper est',1,0,0,'a','2024-06-16'),(21,'plan2',1,2,5,'opis','2024-06-24');
/*!40000 ALTER TABLE `workout_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workout_sessions`
--

DROP TABLE IF EXISTS `workout_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workout_sessions` (
  `session_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `plan_id` bigint unsigned NOT NULL,
  `date` date DEFAULT NULL,
  `time_spent` int DEFAULT NULL,
  `calories_burned` int DEFAULT NULL,
  PRIMARY KEY (`session_id`),
  KEY `user_id_idx` (`user_id`),
  KEY `plan_id_idx` (`plan_id`),
  CONSTRAINT `plan_id` FOREIGN KEY (`plan_id`) REFERENCES `workout_plans` (`plan_id`),
  CONSTRAINT `user_id_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workout_sessions`
--

LOCK TABLES `workout_sessions` WRITE;
/*!40000 ALTER TABLE `workout_sessions` DISABLE KEYS */;
INSERT INTO `workout_sessions` VALUES (1,1,1,'2024-06-05',30,150000),(2,1,1,'2024-06-10',60,300),(3,1,4,'2024-05-22',45,250),(4,1,1,'2024-05-15',60,300),(5,1,4,'2024-03-22',45,250),(6,1,4,'2024-06-12',60,500),(7,77,1,'2024-06-12',30,500),(8,77,4,'2024-06-12',60,300),(9,1,1,'2024-06-12',10,200),(10,1,1,'2024-06-12',10,100),(11,77,4,'2024-06-10',5,100),(12,1,1,'2024-06-13',45,300),(15,1,4,'2024-06-14',1,5),(19,77,16,'2024-06-14',0,0),(21,77,16,'2024-06-14',1,4),(22,1,11,'2024-06-14',0,0),(23,1,1,'2024-06-14',0,0),(27,1,1,'2024-06-15',0,0),(28,1,1,'2024-06-15',0,0),(29,1,1,'2024-06-15',1,3),(30,1,1,'2024-06-15',1,3),(31,1,1,'2024-06-15',1,3),(34,1,21,'2024-06-24',1,2);
/*!40000 ALTER TABLE `workout_sessions` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`avnadmin`@`%`*/ /*!50003 TRIGGER `update_total_workouts` AFTER INSERT ON `workout_sessions` FOR EACH ROW BEGIN
    DECLARE total_workouts_count INT;
    SELECT COUNT(*) INTO total_workouts_count FROM workout_sessions WHERE user_id = NEW.user_id;
    UPDATE users SET total_workouts = total_workouts_count WHERE user_id = NEW.user_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`avnadmin`@`%`*/ /*!50003 TRIGGER `update_total_calories_burned` AFTER INSERT ON `workout_sessions` FOR EACH ROW BEGIN
    DECLARE total_calories_count INT;
    SELECT SUM(calories_burned) INTO total_calories_count FROM workout_sessions WHERE user_id = NEW.user_id;
    UPDATE users SET total_calories_burned = total_calories_count WHERE user_id = NEW.user_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`avnadmin`@`%`*/ /*!50003 TRIGGER `update_total_time_spent` AFTER INSERT ON `workout_sessions` FOR EACH ROW BEGIN
    DECLARE total_time_count INT;
    SELECT SUM(time_spent) INTO total_time_count FROM workout_sessions WHERE user_id = NEW.user_id;
    UPDATE users SET total_time_spent = total_time_count WHERE user_id = NEW.user_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping routines for database 'workout-project'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-24 11:24:27
