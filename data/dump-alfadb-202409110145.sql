-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: alfadb
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `credentials`
--

DROP TABLE IF EXISTS `credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credentials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sandbox_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `merchant_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `server_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_notification_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recurring_notification_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_account_notification_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `finish_redirect_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unfinish_redirect_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `error_redirect_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credentials`
--

LOCK TABLES `credentials` WRITE;
/*!40000 ALTER TABLE `credentials` DISABLE KEYS */;
INSERT INTO `credentials` VALUES (1,'midtrans','Midtrans Sandbox environment is used to test the integration process.','https://app.sandbox.midtrans.com/snap/v1/transactions','G418834079','SB-Mid-client-cVCQsNnwSkX9Nhzp','SB-Mid-server-DBmHtR0FPww_GWLeP9U9ZEp0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `credentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2024_09_05_181951_create_products_table',2),(8,'2024_09_07_231627_create_roles_table',3),(9,'2024_09_07_231908_add_role_id_to_users_table',3),(11,'2024_09_08_144410_create_orders_table',4),(12,'2024_09_08_191555_create_credentials_table',4),(13,'2024_09_08_144410_create_transactions_table',5);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` int NOT NULL,
  `stock` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Key Ring','Gantungan Kunci Key Chain Ring Mobil BMW Mercedes Benz Carbon Fiber - AMG',2000,0,1,'2024-09-06 04:19:30','2024-09-10 17:48:17'),(2,'Tote Bag','Temukan Omegabag Tote Bag Polos Kanvas Putih Premium 25x30 | tote bag resleting kanvas - tas tote bag wanita',5000,38,0,'2024-09-06 04:24:55','2024-09-10 17:35:08'),(4,'Galon','Galon kuat dapat digunakan untuk air isi ulang',10000,5,0,'2024-09-10 15:31:12','2024-09-10 17:14:30'),(5,'Airminum botol Adua','Air minum kemasan murni dari mata air pilihan',10000,43,1,'2024-09-10 17:11:30','2024-09-10 17:43:27'),(6,'Air minum Le Water','Air minum kemasan murni dari mata air pilihan',10000,15,1,'2024-09-10 17:33:20','2024-09-10 17:40:34');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Administrator role','2024-09-07 23:33:58','2024-09-07 23:33:58'),(2,'customer','Customer role','2024-09-07 23:33:59','2024-09-07 23:33:59');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `quantity` int NOT NULL,
  `total_price` int NOT NULL,
  `redirect_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL,
  `order_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment_date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_user_id_foreign` (`user_id`),
  KEY `transactions_product_id_foreign` (`product_id`),
  CONSTRAINT `transactions_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,4,2,2,10000,'https://app.sandbox.midtrans.com/snap/v4/redirection/830e3763-1552-48fb-822b-750b64fc8631',1,'1725926963','2024-09-10 00:09:23','2024-09-10 00:09:54','2024-09-10 00:09:54'),(2,5,1,1,2000,'https://app.sandbox.midtrans.com/snap/v4/redirection/25ffbc95-f4f6-41c8-b5ce-0153d28bdb6c',2,'1725978442','2024-09-10 14:27:22','2024-09-10 14:28:30','2024-09-10 14:28:30'),(3,5,1,2,4000,'https://app.sandbox.midtrans.com/snap/v4/redirection/b580299d-b7f7-42cc-85d8-a73fbbfa11a3',1,'1725980776','2024-09-10 15:06:16','2024-09-10 15:07:00','2024-09-10 15:07:00'),(4,9,4,2,20000,'https://app.sandbox.midtrans.com/snap/v4/redirection/5bd830d8-7c2e-443f-bb92-26b07a1bf8df',1,'1725982452','2024-09-10 15:34:12','2024-09-10 15:36:33','2024-09-10 15:36:33'),(5,9,4,1,10000,'https://app.sandbox.midtrans.com/snap/v4/redirection/9a23875d-eb2e-49be-9e37-0a753cc9aa8c',1,'1725982757','2024-09-10 15:39:17','2024-09-10 15:39:45','2024-09-10 15:39:45'),(6,9,4,1,10000,'https://app.sandbox.midtrans.com/snap/v4/redirection/93f54c06-8c17-4ecd-b772-0fdc86848ea4',1,'1725982903','2024-09-10 15:41:43','2024-09-10 15:42:03','2024-09-10 15:42:03'),(7,9,1,1,2000,'https://app.sandbox.midtrans.com/snap/v4/redirection/cfc9451f-c0db-4c86-9ceb-6ac2b909bd36',1,'1725982999','2024-09-10 15:43:19','2024-09-10 15:44:20','2024-09-10 15:44:20'),(8,10,5,5,50000,NULL,0,'1725988634','2024-09-10 17:17:14','2024-09-10 17:17:14',NULL),(9,10,5,5,50000,'https://app.sandbox.midtrans.com/snap/v4/redirection/51dd2d15-36d6-4ed5-946c-5bd7a8e4f7e8',1,'1725988678','2024-09-10 17:17:58','2024-09-10 17:19:39','2024-09-10 17:19:39'),(10,10,1,2,4000,'https://app.sandbox.midtrans.com/snap/v4/redirection/2cb84c50-c762-4257-a65d-034093420e32',1,'1725988956','2024-09-10 17:22:36','2024-09-10 17:22:55','2024-09-10 17:22:55'),(11,11,6,5,50000,'https://app.sandbox.midtrans.com/snap/v4/redirection/c8d335c2-f5fd-4f2e-a964-78fa81d35617',1,'1725989976','2024-09-10 17:39:36','2024-09-10 17:40:34','2024-09-10 17:40:34'),(12,11,5,2,20000,'https://app.sandbox.midtrans.com/snap/v4/redirection/1926c216-f08d-4622-b640-676658b988c1',1,'1725990153','2024-09-10 17:42:33','2024-09-10 17:43:27','2024-09-10 17:43:27'),(13,11,1,10,20000,'https://app.sandbox.midtrans.com/snap/v4/redirection/c512c417-2c39-4eba-a304-cd71156c2f41',1,'1725990461','2024-09-10 17:47:41','2024-09-10 17:48:17','2024-09-10 17:48:17');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin05092024@gmail.com',NULL,'$2y$12$5bs7aIbFgpjTSlogOYm0quSmrSFAbl1Pu/0S2z1OCaR6omfD7OHu6',NULL,'2024-09-05 17:23:50','2024-09-05 17:23:50',NULL),(2,'Jhon Doe','jhon.doe@example.com',NULL,'$2y$12$j7v8QvfzoN1uAueyfqDHpuG4lxlgWWBcTp/AuDqq9HdcutvS.HIFa',NULL,'2024-09-06 05:40:46','2024-09-06 05:40:46',NULL),(3,'alfa','admin06092024@alfamail.com',NULL,'$2y$12$SbOHTIxj4nzt6nNHD4VHfel.pIrM1SaKuDpB05OV9MAdMqvK/OotO',NULL,'2024-09-06 06:04:07','2024-09-06 06:04:07',1),(4,'customer','customer@example.com',NULL,'$2y$12$1RDf1kPWaUjKp0n7tXSQbOUn.1dn/v3c9t.6EFrppqfsonMoQkIwK',NULL,'2024-09-07 18:54:17','2024-09-07 18:54:17',2),(5,'second_customer','second_customer@example.com',NULL,'$2y$12$fJnplM0LuQ3Ts9VnbowmBOrcLlK6CAcrjp20LMIZB8bGsJz1SKQfq',NULL,'2024-09-10 03:12:24','2024-09-10 03:12:24',2),(6,'third_customer','third_customer@example.com',NULL,'$2y$12$9.LbBy17Fyh15J9P0WOwDONi/ehVrdwbxKCHyEhyAY.uKSpAnoJ6O',NULL,'2024-09-10 03:20:51','2024-09-10 03:20:51',2),(7,'forth_customer','forth_customer@example.com',NULL,'$2y$12$NJImGXZR1efVGx2WHotjj.AnQfyFpetWJ.b39T8JFINqYpB1sVunu',NULL,'2024-09-10 03:26:12','2024-09-10 03:26:12',2),(8,'nextgen_customer','nextgen_customer@example.com',NULL,'$2y$12$Yr/CChLI8lagvW4CPK5cYO8BZIOGH2fPdHGnzlEYDoU1RQ0quFvNS',NULL,'2024-09-10 03:35:32','2024-09-10 03:35:32',2),(9,'alfa_customer','alfa_customer@example.com',NULL,'$2y$12$7rDL09XqCMqVHAtlOkHhM.Ti3/aAJp4nV3uF25j5OyGhYYpxGj7/.',NULL,'2024-09-10 15:28:14','2024-09-10 15:28:14',2),(10,'bravo_customer','bravo_customer@example.com',NULL,'$2y$12$vuOE3HaCTXQN9qa.nKiASO9JPYZEvuFcAq7T2XqUF6hJKAC2wfz96',NULL,'2024-09-10 17:09:21','2024-09-10 17:09:21',2),(11,'bravo1_customer','bravo1_customer@example.com',NULL,'$2y$12$8E97tMBoUKsChNQKgx0Rr.HTLOjGPJsKylmwNSWT/RTZajeEGoBHG',NULL,'2024-09-10 17:36:50','2024-09-10 17:36:50',2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'alfadb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-11  1:45:54
