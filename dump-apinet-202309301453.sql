-- MySQL dump 10.13  Distrib 5.7.40, for Win64 (x86_64)
--
-- Host: localhost    Database: apinet
-- ------------------------------------------------------
-- Server version	5.7.40-log

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
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2016_06_01_000001_create_oauth_auth_codes_table',1),(4,'2016_06_01_000002_create_oauth_access_tokens_table',1),(5,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(6,'2016_06_01_000004_create_oauth_clients_table',1),(7,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(8,'2019_08_19_000000_create_failed_jobs_table',1),(9,'2019_12_14_000001_create_personal_access_tokens_table',1),(10,'2023_09_30_062050_create_roles_table',2),(11,'2023_09_30_062206_add_role_id_to_users_table',2),(12,'2023_09_30_064029_create_projects_table',3),(13,'2023_09_30_064028_create_projects_table',4),(14,'2023_09_30_070603_create_task_states_table',5),(15,'2023_09_30_070604_create_tasks_table',5);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES ('00420a53595c426756c654c708782390154a5a0925200292d8badb2876f614ba786253da321e5e87',2,1,'MyToken','[]',0,'2023-09-30 11:57:49','2023-09-30 11:57:49','2024-09-30 06:57:49'),('1cd6608e3a58bb7eb1bab5b7585402dd3d43369b1029b91108664d174238154e9f77173c39f10043',7,1,'MyToken','[]',0,'2023-09-30 13:03:37','2023-09-30 13:03:37','2024-09-30 08:03:37'),('216a0d9475be2969590f7566bb67fd3c89751611f3f58acfe530e732017775bb2d6b81f8c52eb339',12,1,'MyToken','[]',0,'2023-10-01 00:11:46','2023-10-01 00:11:46','2024-09-30 19:11:46'),('6f77ca0341156844193a598e8c912bd48620cd2af016abe5db3b4f05d0d86e5eef1650b3a21ae79d',12,1,'MyToken','[]',0,'2023-09-30 21:04:18','2023-09-30 21:04:18','2024-09-30 16:04:18'),('78ea2e9bca94da003892533bd56f157484ca5853ebe9b712d15b7d1f87f5c10a20fe00db83a58549',1,1,'MyToken','[]',0,'2023-09-30 11:19:36','2023-09-30 11:19:36','2024-09-30 06:19:36'),('7f958196775879c9c304b6758416a04527fe261153da4432ea728084743feac8df0fa4e65483fba0',12,1,'MyToken','[]',1,'2023-09-30 21:02:05','2023-09-30 21:04:10','2024-09-30 16:02:05'),('9d60b17cc365b1684eb2b0f0d4be3fdbf2abee59a1b6bb8db15a7c89706284045bd5612f4cbc16da',7,1,'MyToken','[]',0,'2023-09-30 12:52:15','2023-09-30 12:52:15','2024-09-30 07:52:15'),('bc5bd9589e6ca7a8a5f66864808f7b8f8387afc16d1342cc48c16e017990f46a317dead260901e14',7,1,'MyToken','[]',0,'2023-09-30 13:02:31','2023-09-30 13:02:31','2024-09-30 08:02:31'),('c60009448cfc4465751d4af21dfa25b6c25690de9cd928dced45a41e786fba5152474d2198af101a',12,1,'MyToken','[]',1,'2023-09-30 20:27:03','2023-09-30 20:37:27','2024-09-30 15:27:03'),('c9b3710478cf15a2a8bdc37e07399ed5387852a733d26398185efa5cffb1b1fcb4c3324ef4283d2e',12,1,'MyToken','[]',1,'2023-09-30 20:42:30','2023-09-30 20:51:22','2024-09-30 15:42:30'),('ea59102197d9724b67ead5390efc1d5025115f509768016e0882b433a7dce2cee3f7ea4b1398d27c',2,1,'MyToken','[]',0,'2023-09-30 12:35:21','2023-09-30 12:35:21','2024-09-30 07:35:21');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Laravel Personal Access Client','qTBF1wEnnhhAGwK9iGdMmn0MBLBw817dsznBqb7L',NULL,'http://localhost',1,0,0,'2023-09-30 11:10:16','2023-09-30 11:10:16'),(2,NULL,'Laravel Password Grant Client','vSCNMHSX5D1vcSW293J90upwl55H68cul4ABcH0v','users','http://localhost',0,1,0,'2023-09-30 11:10:16','2023-09-30 11:10:16');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2023-09-30 11:10:16','2023-09-30 11:10:16');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_user`
--

DROP TABLE IF EXISTS `project_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_user_project_id_user_id_unique` (`project_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_user`
--

LOCK TABLES `project_user` WRITE;
/*!40000 ALTER TABLE `project_user` DISABLE KEYS */;
INSERT INTO `project_user` VALUES (1,1,1,NULL,NULL),(2,1,2,NULL,NULL),(3,1,3,NULL,NULL),(4,2,2,NULL,NULL),(5,2,3,NULL,NULL),(6,3,1,NULL,NULL),(7,3,2,NULL,NULL),(8,3,3,NULL,NULL),(9,4,1,NULL,NULL),(10,4,2,NULL,NULL),(11,4,3,NULL,NULL),(15,6,3,NULL,NULL),(16,7,2,NULL,NULL),(17,8,1,NULL,NULL),(18,8,6,NULL,NULL),(19,8,7,NULL,NULL),(20,9,12,NULL,NULL),(21,9,2,NULL,NULL),(22,9,10,NULL,NULL),(23,9,9,NULL,NULL);
/*!40000 ALTER TABLE `project_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'Proyecto de Prueba','Este es un proyecto de prueba.','2023-09-30','2023-10-15','2023-09-30 11:54:16','2023-09-30 11:54:16'),(2,'Proyecto de Prueba 2','Este es un proyecto de prueba2.','2023-09-30','2023-10-15','2023-09-30 11:55:08','2023-09-30 11:55:08'),(5,'Proyecto de Prueba postman','Este es un proyecto de prueba de edicion.','2023-09-30','2023-10-15','2023-09-30 12:00:30','2023-10-01 00:22:13'),(7,'Prueba front','a ver','2023-09-01','2023-09-25','2023-09-30 21:58:41','2023-09-30 21:58:41'),(8,'Prueba final','asddasda','2023-09-01','2023-09-25','2023-09-30 22:17:46','2023-09-30 22:17:46'),(9,'Prueba final antes de pasar a tareas','Vamos a ver que tal','2023-08-29','2023-09-27','2023-09-30 22:51:56','2023-09-30 22:51:56'),(10,'Proyecto de Prueba postman','Este es un proyecto de prueba.','2023-09-30','2023-10-15','2023-10-01 00:19:06','2023-10-01 00:19:06');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrador','2023-09-30 11:32:31','2023-09-30 11:32:31'),(2,'Desarrollador','2023-09-30 11:32:43','2023-09-30 11:32:43'),(3,'Editor','2023-10-01 00:23:21','2023-10-01 00:23:21');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_states`
--

DROP TABLE IF EXISTS `task_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_states` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_states`
--

LOCK TABLES `task_states` WRITE;
/*!40000 ALTER TABLE `task_states` DISABLE KEYS */;
INSERT INTO `task_states` VALUES (1,'Pendiente','2023-09-30 12:14:13','2023-09-30 12:14:13'),(2,'En Progreso','2023-09-30 12:14:20','2023-09-30 12:14:20'),(3,'Completada','2023-09-30 12:14:28','2023-09-30 12:14:28'),(4,'Rechazada','2023-10-01 00:25:03','2023-10-01 00:25:03');
/*!40000 ALTER TABLE `task_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_id` bigint(20) unsigned NOT NULL,
  `task_state_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tasks_project_id_foreign` (`project_id`),
  KEY `tasks_task_state_id_foreign` (`task_state_id`),
  CONSTRAINT `tasks_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tasks_task_state_id_foreign` FOREIGN KEY (`task_state_id`) REFERENCES `task_states` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,'Tarea de ejemplo','Esta es una tarea de prueba',1,3,'2023-09-30 12:16:31','2023-09-30 23:53:11'),(3,'Tarea de ejemplo postman','Esta es una tarea de prueba',1,2,'2023-09-30 12:19:15','2023-10-01 00:22:24'),(4,'Tarea de ejemplo 8','Esta es una tarea de prueba',5,3,'2023-09-30 12:19:19','2023-09-30 12:19:19'),(5,'Tarea de ejemplo 8','Esta es una tarea de prueba',5,2,'2023-09-30 12:19:24','2023-09-30 12:19:24'),(7,'Tarea terminada','vamos a ve',9,1,'2023-09-30 23:39:01','2023-09-30 23:39:01'),(8,'Tarea de ejemplo postman','Esta es una tarea de prueba',1,3,'2023-10-01 00:21:24','2023-10-01 00:21:24');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Juan Laurens Prueba','usuario@example.com',NULL,'$2y$10$oZlFuX4UyW9AyRH2HHftrOdk7CWWteabrUBQZmUOEmgHdy2izaZwu',NULL,'2023-09-30 11:17:28','2023-09-30 11:17:28',NULL),(2,'Juan José Laurens','16rusherlaurens@gmail.com',NULL,'Laurens',NULL,'2023-09-30 11:34:44','2023-09-30 11:34:44',1),(3,'Juank Laurens','cjjuanjo@hotmail.com',NULL,'$2y$10$dE7QGY5Als70tCSxL55z6OCr1uceP6ZTERMGoX54Tbv7UJcJQg626',NULL,'2023-09-30 11:38:22','2023-09-30 11:38:22',1),(4,'Juank Laurens','cjjuanjo@hotm.com',NULL,'$2y$10$As96iHSx07hoxXeR6BISr.nW//62GL5yks8WUc1pDnvcwJtyB8xyO',NULL,'2023-09-30 11:53:19','2023-09-30 11:53:19',2),(5,'Prueba 2','cjjuanjo@hot.com',NULL,'$2y$10$k6ok1/SFwxHEhy7duutTl.nSqrritBv2Dnt9CdM9r79ps6.Z/L7ya',NULL,'2023-09-30 11:53:28','2023-09-30 11:53:28',2),(6,'Prueba32','prueba@hot.com',NULL,'$2y$10$D0yn1S5h6evdpTXHc2TjtOitgYxcSnmOqLdbn70LqTHFz1j9YSHOG',NULL,'2023-09-30 11:53:39','2023-09-30 11:53:39',2),(7,'Por que no da','juank@gmail.com',NULL,'$2y$10$W0ZUpvtXb9gU1yYRiLTNXO3VDljzmKRCZ7V7jOH4.wTsg54Raltum',NULL,'2023-09-30 12:51:59','2023-09-30 12:51:59',1),(8,'Prueba api','prueba@prueba.com',NULL,'$2y$10$7EHczM2t6xoAbczWNg.QyeeelyuRKaSQLcWrbEMC0kAyRW1ZmzqMm',NULL,'2023-09-30 20:11:38','2023-09-30 20:11:38',2),(9,'Prueba 2','prueba2@prueba.com',NULL,'$2y$10$ev5vahQQUilVNAj5R.0s.eUspTshPoh76HJxUza7Cpwx4fwuPo4F6',NULL,'2023-09-30 20:14:36','2023-09-30 20:14:36',2),(10,'Prueba 3','prueba3@gmail.com',NULL,'$2y$10$3AnvTVFHXeJs1fM6oLwqN.GfMiQhE2KlH4J4O0BQhVH4vteAh.b.C',NULL,'2023-09-30 20:16:08','2023-09-30 20:16:08',2),(11,'Prueba 4','laurens@laurens.com',NULL,'$2y$10$OiYy6eV.dTel.n5q4sLbkuHA22yIXF5g.nJXZGZJ92oVBdNQi32pm',NULL,'2023-09-30 20:18:04','2023-09-30 20:18:04',2),(12,'Juan Laurens Admin','juanlaurens22@gmail.com',NULL,'$2y$10$2hIAS.ZjQSl9opL1pK/blefjeDZc6coA28Cr56ZDBJhvuRWvUbJAq',NULL,'2023-09-30 20:26:53','2023-09-30 20:26:53',2),(13,'Prueba Postman','postman@gmail.com',NULL,'$2y$10$9Y18LXhmMBgvj2KlZL3mfeouSFXzKT6AIBz2UtyVgztZwSaFJqN7W',NULL,'2023-10-01 00:13:22','2023-10-01 00:13:22',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'apinet'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-30 14:53:45
