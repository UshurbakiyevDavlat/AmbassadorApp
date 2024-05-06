-- MySQL dump 10.13  Distrib 8.4.0, for Linux (aarch64)
--
-- Host: localhost    Database: ambassador
-- ------------------------------------------------------
-- Server version	8.4.0

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
-- Table structure for table `link_products`
--

DROP TABLE IF EXISTS `link_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `link_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `link_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `link_products_link_id_foreign` (`link_id`),
  KEY `link_products_product_id_foreign` (`product_id`),
  CONSTRAINT `link_products_link_id_foreign` FOREIGN KEY (`link_id`) REFERENCES `links` (`id`),
  CONSTRAINT `link_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_products`
--

LOCK TABLES `link_products` WRITE;
/*!40000 ALTER TABLE `link_products` DISABLE KEYS */;
INSERT INTO `link_products` VALUES (1,1,12),(2,2,30),(3,3,7),(4,4,9),(5,5,28),(6,6,6),(7,7,9),(8,8,27),(9,9,22),(10,10,3),(11,11,6),(12,12,1),(13,13,28),(14,14,21),(15,15,24),(16,16,1),(17,17,3),(18,18,14),(19,19,13),(20,20,5),(21,21,7),(22,22,16),(23,23,11),(24,24,3),(25,25,26),(26,26,25),(27,27,5),(28,28,3),(29,29,26),(30,30,6),(31,31,1),(32,32,1),(33,33,1),(34,33,2),(35,34,2),(36,35,2),(37,36,2),(38,37,2),(39,37,3),(40,38,2),(41,38,3),(42,39,2),(43,39,3),(44,39,8);
/*!40000 ALTER TABLE `link_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `links` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `links_code_unique` (`code`),
  KEY `links_user_id_foreign` (`user_id`),
  CONSTRAINT `links_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `links`
--

LOCK TABLES `links` WRITE;
/*!40000 ALTER TABLE `links` DISABLE KEYS */;
INSERT INTO `links` VALUES (1,'aut-accusantium-recusandae-cupiditate-ullam-veniam-autem-non-dolorem',2,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(2,'atque-aut-excepturi-a-laborum-maiores',10,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(3,'et-totam-soluta-assumenda-dolorem-maiores-soluta-est',26,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(4,'dolores-autem-ducimus-quo-qui-rem-in',22,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(5,'voluptatum-modi-sint-iusto-inventore-aliquid',25,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(6,'magnam-pariatur-ipsam-praesentium-voluptas',13,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(7,'provident-dolorem-ut-quas-iste',28,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(8,'quo-facere-adipisci-dolorem-nihil-dolores',3,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(9,'suscipit-quis-mollitia-ut-et',21,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(10,'sequi-voluptate-aperiam-asperiores-voluptas-dolorem-sapiente-dolores-provident',13,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(11,'voluptate-aut-pariatur-sint',17,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(12,'iste-excepturi-reprehenderit-et-sit-molestiae',24,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(13,'labore-suscipit-quaerat-non-incidunt-voluptatem',5,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(14,'facilis-amet-et-aperiam-dolores',28,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(15,'qui-est-delectus-sint-quasi-quas',25,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(16,'est-corporis-rerum-amet-perferendis',13,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(17,'possimus-ut-suscipit-molestiae-nesciunt-aut-doloribus-voluptas-possimus',17,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(18,'distinctio-corrupti-aut-dolorum',21,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(19,'vero-laboriosam-et-quo-veniam-officiis-est',23,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(20,'id-facilis-ipsum-similique-cupiditate',29,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(21,'cupiditate-occaecati-ad-necessitatibus-ipsum-ducimus-voluptas',22,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(22,'ex-tempora-animi-libero-ea',25,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(23,'commodi-ad-harum-doloribus-earum-est-et-veritatis-expedita',28,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(24,'hic-neque-provident-est-facere-magnam',4,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(25,'et-reprehenderit-non-autem-ut',19,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(26,'voluptate-repudiandae-harum-pariatur-illum',16,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(27,'facilis-eos-veniam-impedit-ut-eum-in-odit',26,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(28,'quia-aut-et-rem-dolorum-et',17,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(29,'beatae-molestiae-eos-sed-voluptas-quam-et',11,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(30,'molestias-eaque-voluptatem-necessitatibus',10,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(31,'YAgMdz',31,'2024-05-04 16:48:11','2024-05-04 16:48:11'),(32,'9qadu7',31,'2024-05-04 16:49:07','2024-05-04 16:49:07'),(33,'Xmac1z',31,'2024-05-04 16:49:09','2024-05-04 16:49:09'),(34,'qGpFhX',31,'2024-05-04 16:49:14','2024-05-04 16:49:14'),(35,'zGhzXR',31,'2024-05-04 16:49:15','2024-05-04 16:49:15'),(36,'EM4jbG',31,'2024-05-04 16:49:19','2024-05-04 16:49:19'),(37,'LlFboF',31,'2024-05-04 16:49:22','2024-05-04 16:49:22'),(38,'zOiWBP',31,'2024-05-04 16:49:30','2024-05-04 16:49:30'),(39,'kXtVc8',31,'2024-05-04 16:49:39','2024-05-04 16:49:39');
/*!40000 ALTER TABLE `links` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2019_12_14_000001_create_personal_access_tokens_table',1),(3,'2021_02_19_160745_create_products_table',1),(4,'2021_02_20_091057_create_links_table',1),(5,'2021_02_20_091116_create_link_products_table',1),(6,'2021_02_20_152902_create_orders_table',1),(7,'2021_02_20_152916_create_order_items_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `product_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `quantity` int unsigned NOT NULL,
  `admin_revenue` decimal(8,2) NOT NULL,
  `ambassador_revenue` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,'Cum aut voluptatem earum.',73.00,3,197.10,21.90,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(2,1,'Eius placeat quisquam quasi.',23.00,3,62.10,6.90,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(3,2,'Aut ut vitae et est.',35.00,5,157.50,17.50,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(4,2,'Beatae aut est quia eligendi.',31.00,1,27.90,3.10,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(5,2,'Saepe nihil ut culpa modi.',37.00,5,166.50,18.50,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(6,2,'Omnis et corporis aut dicta.',21.00,5,94.50,10.50,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(7,2,'Porro ut eligendi labore.',72.00,1,64.80,7.20,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(8,3,'Eos at animi eveniet.',44.00,1,39.60,4.40,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(9,4,'Beatae aut est quia eligendi.',31.00,3,83.70,9.30,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(10,4,'Enim velit non saepe facere.',72.00,3,194.40,21.60,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(11,4,'Eius placeat quisquam quasi.',23.00,1,20.70,2.30,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(12,4,'Totam odio ut atque.',35.00,2,63.00,7.00,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(13,5,'Omnis ut ut at.',46.00,2,82.80,9.20,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(14,5,'Quia tempora qui ipsa cumque.',93.00,3,251.10,27.90,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(15,6,'Quia ab aliquam et.',92.00,1,82.80,9.20,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(16,6,'Id ea ratione nobis.',39.00,1,35.10,3.90,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(17,6,'Eius placeat quisquam quasi.',23.00,4,82.80,9.20,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(18,6,'Aperiam voluptas eum ullam.',10.00,1,9.00,1.00,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(19,7,'Eligendi neque est libero.',35.00,5,157.50,17.50,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(20,7,'Quia ab aliquam et.',92.00,2,165.60,18.40,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(21,7,'Illo ut et eos.',19.00,4,68.40,7.60,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(22,8,'Voluptas ipsam velit est.',84.00,1,75.60,8.40,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(23,8,'Beatae aut est quia eligendi.',31.00,3,83.70,9.30,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(24,8,'Beatae aut est quia eligendi.',31.00,2,55.80,6.20,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(25,9,'Odit et est inventore optio.',51.00,2,91.80,10.20,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(26,10,'Ullam autem rem voluptas.',55.00,5,247.50,27.50,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(27,10,'Alias id voluptas ut omnis.',44.00,3,118.80,13.20,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(28,10,'Saepe nihil ut culpa modi.',37.00,3,99.90,11.10,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(29,11,'Aperiam voluptas eum ullam.',10.00,4,36.00,4.00,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(30,11,'Eligendi neque est libero.',35.00,1,31.50,3.50,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(31,11,'Cum aut voluptatem earum.',73.00,2,131.40,14.60,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(32,11,'Aut ut vitae et est.',35.00,5,157.50,17.50,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(33,11,'In est ipsam aut qui.',99.00,5,445.50,49.50,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(34,12,'Porro ut eligendi labore.',72.00,3,194.40,21.60,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(35,12,'Eos at animi eveniet.',44.00,3,118.80,13.20,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(36,13,'Ullam expedita fuga autem.',68.00,4,244.80,27.20,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(37,13,'Enim velit non saepe facere.',72.00,1,64.80,7.20,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(38,14,'Saepe nihil ut culpa modi.',37.00,4,133.20,14.80,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(39,14,'Omnis ut ut at.',46.00,1,41.40,4.60,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(40,14,'Dolor natus ex error at.',26.00,3,70.20,7.80,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(41,14,'Vel ut rerum aut.',91.00,1,81.90,9.10,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(42,15,'Voluptas ipsam velit est.',84.00,1,75.60,8.40,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(43,15,'Repellat vel aut facilis ut.',53.00,5,238.50,26.50,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(44,15,'Quod mollitia in sunt.',72.00,5,324.00,36.00,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(45,15,'Quod mollitia in sunt.',72.00,3,194.40,21.60,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(46,15,'Quia ab aliquam et.',92.00,2,165.60,18.40,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(47,16,'In est ipsam aut qui.',99.00,4,356.40,39.60,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(48,17,'Alias id voluptas ut omnis.',44.00,3,118.80,13.20,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(49,17,'Aperiam voluptas eum ullam.',10.00,4,36.00,4.00,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(50,17,'Quia tempora qui ipsa cumque.',93.00,5,418.50,46.50,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(51,17,'Vel ut rerum aut.',91.00,2,163.80,18.20,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(52,17,'Id ea ratione nobis.',39.00,5,175.50,19.50,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(53,18,'Tempore est aut cum mollitia.',30.00,2,54.00,6.00,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(54,18,'Sit qui ex quia iure.',58.00,3,156.60,17.40,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(55,18,'Quod mollitia in sunt.',72.00,1,64.80,7.20,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(56,18,'Repellat vel aut facilis ut.',53.00,5,238.50,26.50,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(57,19,'Omnis ut ut at.',46.00,4,165.60,18.40,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(58,19,'Id ea ratione nobis.',39.00,5,175.50,19.50,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(59,19,'In est ipsam aut qui.',99.00,3,267.30,29.70,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(60,19,'Omnis ut ut at.',46.00,4,165.60,18.40,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(61,19,'In est ipsam aut qui.',99.00,1,89.10,9.90,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(62,20,'Ullam expedita fuga autem.',68.00,5,306.00,34.00,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(63,20,'Voluptas ipsam velit est.',84.00,4,302.40,33.60,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(64,20,'Cum aut voluptatem earum.',73.00,4,262.80,29.20,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(65,20,'Cum aut voluptatem earum.',73.00,4,262.80,29.20,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(66,21,'Aliquid adipisci natus ut.',30.00,3,81.00,9.00,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(67,21,'Aperiam voluptas eum ullam.',10.00,3,27.00,3.00,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(68,21,'Sit qui ex quia iure.',58.00,4,208.80,23.20,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(69,21,'Omnis ut ut at.',46.00,4,165.60,18.40,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(70,21,'Odit et est inventore optio.',51.00,2,91.80,10.20,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(71,22,'Enim velit non saepe facere.',72.00,1,64.80,7.20,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(72,22,'Id ea ratione nobis.',39.00,3,105.30,11.70,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(73,23,'Aperiam voluptas eum ullam.',10.00,3,27.00,3.00,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(74,23,'Quia tempora qui ipsa cumque.',93.00,2,167.40,18.60,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(75,23,'Odit et est inventore optio.',51.00,3,137.70,15.30,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(76,23,'Odit et est inventore optio.',51.00,4,183.60,20.40,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(77,24,'Eligendi neque est libero.',35.00,2,63.00,7.00,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(78,24,'Repellat vel aut facilis ut.',53.00,4,190.80,21.20,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(79,24,'Eligendi neque est libero.',35.00,3,94.50,10.50,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(80,25,'Cum aut voluptatem earum.',73.00,3,197.10,21.90,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(81,25,'Tempore est aut cum mollitia.',30.00,5,135.00,15.00,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(82,25,'Beatae aut est quia eligendi.',31.00,4,111.60,12.40,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(83,25,'Illo ut et eos.',19.00,4,68.40,7.60,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(84,25,'Eius placeat quisquam quasi.',23.00,4,82.80,9.20,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(85,26,'Quia ab aliquam et.',92.00,1,82.80,9.20,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(86,26,'Eos at animi eveniet.',44.00,2,79.20,8.80,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(87,26,'Totam odio ut atque.',35.00,3,94.50,10.50,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(88,26,'Alias id voluptas ut omnis.',44.00,4,158.40,17.60,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(89,26,'Vel ut rerum aut.',91.00,5,409.50,45.50,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(90,27,'Eius placeat quisquam quasi.',23.00,4,82.80,9.20,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(91,27,'Ullam expedita fuga autem.',68.00,5,306.00,34.00,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(92,27,'Quia tempora qui ipsa cumque.',93.00,5,418.50,46.50,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(93,27,'Dolor natus ex error at.',26.00,5,117.00,13.00,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(94,27,'Quia ab aliquam et.',92.00,1,82.80,9.20,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(95,28,'Sit qui ex quia iure.',58.00,3,156.60,17.40,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(96,28,'Totam odio ut atque.',35.00,3,94.50,10.50,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(97,29,'Illo ut et eos.',19.00,4,68.40,7.60,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(98,29,'Alias id voluptas ut omnis.',44.00,2,79.20,8.80,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(99,30,'Eligendi neque est libero.',35.00,5,157.50,17.50,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(100,30,'Voluptas ipsam velit est.',84.00,3,226.80,25.20,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(101,30,'Odit et est inventore optio.',51.00,4,183.60,20.40,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(102,30,'Id ea ratione nobis.',39.00,3,105.30,11.70,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(103,30,'Repellat vel aut facilis ut.',53.00,3,143.10,15.90,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(107,34,'Quia tempora qui ipsa cumque.',93.00,2,167.40,18.60,'2024-05-04 16:20:08','2024-05-04 16:20:08'),(114,37,'Alias id voluptas ut omnis.',44.00,1,39.60,4.40,'2024-05-05 10:01:13','2024-05-05 10:01:13'),(115,37,'Aperiam voluptas eum ullam.',10.00,1,9.00,1.00,'2024-05-05 10:01:13','2024-05-05 10:01:13'),(116,37,'Dolor natus ex error at.',26.00,1,23.40,2.60,'2024-05-05 10:01:13','2024-05-05 10:01:13'),(135,44,'Alias id voluptas ut omnis.',44.00,1,39.60,4.40,'2024-05-05 11:16:07','2024-05-05 11:16:07'),(136,44,'Aperiam voluptas eum ullam.',10.00,1,9.00,1.00,'2024-05-05 11:16:07','2024-05-05 11:16:07'),(137,44,'Dolor natus ex error at.',26.00,1,23.40,2.60,'2024-05-05 11:16:07','2024-05-05 11:16:07'),(138,45,'Alias id voluptas ut omnis.',44.00,1,39.60,4.40,'2024-05-05 11:18:48','2024-05-05 11:18:48'),(139,45,'Aperiam voluptas eum ullam.',10.00,1,9.00,1.00,'2024-05-05 11:18:48','2024-05-05 11:18:48'),(140,45,'Dolor natus ex error at.',26.00,1,23.40,2.60,'2024-05-05 11:18:48','2024-05-05 11:18:48'),(144,47,'Alias id voluptas ut omnis.',44.00,1,39.60,4.40,'2024-05-05 11:24:03','2024-05-05 11:24:03'),(145,47,'Aperiam voluptas eum ullam.',10.00,1,9.00,1.00,'2024-05-05 11:24:03','2024-05-05 11:24:03'),(146,47,'Dolor natus ex error at.',26.00,1,23.40,2.60,'2024-05-05 11:24:03','2024-05-05 11:24:03'),(147,48,'Alias id voluptas ut omnis.',44.00,1,39.60,4.40,'2024-05-05 11:24:46','2024-05-05 11:24:46'),(148,48,'Aperiam voluptas eum ullam.',10.00,1,9.00,1.00,'2024-05-05 11:24:46','2024-05-05 11:24:46'),(149,48,'Dolor natus ex error at.',26.00,1,23.40,2.60,'2024-05-05 11:24:46','2024-05-05 11:24:46'),(150,49,'Alias id voluptas ut omnis.',44.00,1,39.60,4.40,'2024-05-05 11:25:18','2024-05-05 11:25:18'),(151,49,'Aperiam voluptas eum ullam.',10.00,1,9.00,1.00,'2024-05-05 11:25:18','2024-05-05 11:25:18'),(152,49,'Dolor natus ex error at.',26.00,1,23.40,2.60,'2024-05-05 11:25:18','2024-05-05 11:25:18'),(153,50,'Alias id voluptas ut omnis.',44.00,1,39.60,4.40,'2024-05-05 11:26:04','2024-05-05 11:26:04'),(154,50,'Aperiam voluptas eum ullam.',10.00,1,9.00,1.00,'2024-05-05 11:26:04','2024-05-05 11:26:04'),(155,50,'Dolor natus ex error at.',26.00,1,23.40,2.60,'2024-05-05 11:26:04','2024-05-05 11:26:04'),(156,51,'Quia tempora qui ipsa cumque.',93.00,2,167.40,18.60,'2024-05-05 11:26:41','2024-05-05 11:26:41'),(157,52,'Alias id voluptas ut omnis.',44.00,1,39.60,4.40,'2024-05-05 11:27:15','2024-05-05 11:27:15'),(158,52,'Aperiam voluptas eum ullam.',10.00,1,9.00,1.00,'2024-05-05 11:27:15','2024-05-05 11:27:15'),(159,52,'Dolor natus ex error at.',26.00,1,23.40,2.60,'2024-05-05 11:27:15','2024-05-05 11:27:15'),(160,53,'Alias id voluptas ut omnis.',44.00,1,39.60,4.40,'2024-05-05 11:27:47','2024-05-05 11:27:47'),(161,53,'Aperiam voluptas eum ullam.',10.00,1,9.00,1.00,'2024-05-05 11:27:47','2024-05-05 11:27:47'),(162,53,'Dolor natus ex error at.',26.00,1,23.40,2.60,'2024-05-05 11:27:47','2024-05-05 11:27:47'),(163,54,'Alias id voluptas ut omnis.',44.00,1,39.60,4.40,'2024-05-05 11:34:17','2024-05-05 11:34:17'),(164,54,'Aperiam voluptas eum ullam.',10.00,1,9.00,1.00,'2024-05-05 11:34:17','2024-05-05 11:34:17'),(165,54,'Dolor natus ex error at.',26.00,1,23.40,2.60,'2024-05-05 11:34:17','2024-05-05 11:34:17'),(166,55,'Alias id voluptas ut omnis.',44.00,1,39.60,4.40,'2024-05-05 11:35:09','2024-05-05 11:35:09'),(167,55,'Aperiam voluptas eum ullam.',10.00,1,9.00,1.00,'2024-05-05 11:35:09','2024-05-05 11:35:09'),(168,55,'Dolor natus ex error at.',26.00,1,23.40,2.60,'2024-05-05 11:35:09','2024-05-05 11:35:09'),(169,56,'Alias id voluptas ut omnis.',44.00,1,39.60,4.40,'2024-05-05 14:29:59','2024-05-05 14:29:59'),(170,56,'Aperiam voluptas eum ullam.',10.00,1,9.00,1.00,'2024-05-05 14:29:59','2024-05-05 14:29:59'),(171,56,'Dolor natus ex error at.',26.00,1,23.40,2.60,'2024-05-05 14:29:59','2024-05-05 14:29:59');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ambassador_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `complete` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,NULL,13,'sequi-voluptate-aperiam-asperiores-voluptas-dolorem-sapiente-dolores-provident','vhomenick@example.org','Shanelle','Bogisich','mohammad.thiel@stanton.com',NULL,NULL,NULL,NULL,1,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(2,NULL,25,'ex-tempora-animi-libero-ea','edna.boehm@example.com','Neha','Pfeffer','agustin.schaden@hotmail.com',NULL,NULL,NULL,NULL,1,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(3,NULL,28,'provident-dolorem-ut-quas-iste','mueller.emmitt@example.net','Richie','Labadie','zjast@hotmail.com',NULL,NULL,NULL,NULL,1,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(4,NULL,28,'commodi-ad-harum-doloribus-earum-est-et-veritatis-expedita','mueller.emmitt@example.net','Cristian','Hane','dorthy.feest@runte.info',NULL,NULL,NULL,NULL,1,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(5,NULL,21,'suscipit-quis-mollitia-ut-et','keeling.cordie@example.org','Delmer','Ward','sage.dooley@maggio.info',NULL,NULL,NULL,NULL,1,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(6,NULL,16,'voluptate-repudiandae-harum-pariatur-illum','brannon.beatty@example.org','Reyna','Davis','loy40@gmail.com',NULL,NULL,NULL,NULL,1,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(7,NULL,4,'hic-neque-provident-est-facere-magnam','eschroeder@example.net','Betsy','McCullough','novella46@gmail.com',NULL,NULL,NULL,NULL,1,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(8,NULL,10,'atque-aut-excepturi-a-laborum-maiores','xrau@example.org','Karina','Swift','wiegand.providenci@hotmail.com',NULL,NULL,NULL,NULL,1,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(9,NULL,28,'facilis-amet-et-aperiam-dolores','mueller.emmitt@example.net','Forest','Kohler','corwin.broderick@yahoo.com',NULL,NULL,NULL,NULL,1,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(10,NULL,25,'ex-tempora-animi-libero-ea','edna.boehm@example.com','Claudie','Torp','jaida98@gmail.com',NULL,NULL,NULL,NULL,1,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(11,NULL,10,'atque-aut-excepturi-a-laborum-maiores','xrau@example.org','Brando','Price','mueller.sebastian@hotmail.com',NULL,NULL,NULL,NULL,1,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(12,NULL,17,'quia-aut-et-rem-dolorum-et','irippin@example.org','Eliezer','Lowe','kadams@hotmail.com',NULL,NULL,NULL,NULL,1,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(13,NULL,22,'dolores-autem-ducimus-quo-qui-rem-in','samir.marvin@example.net','Russell','Price','willms.torrance@hotmail.com',NULL,NULL,NULL,NULL,1,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(14,NULL,22,'dolores-autem-ducimus-quo-qui-rem-in','samir.marvin@example.net','Orrin','Walker','agustin61@hotmail.com',NULL,NULL,NULL,NULL,1,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(15,NULL,26,'et-totam-soluta-assumenda-dolorem-maiores-soluta-est','aweimann@example.com','Okey','Kohler','alfonso70@vandervort.org',NULL,NULL,NULL,NULL,1,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(16,NULL,21,'distinctio-corrupti-aut-dolorum','keeling.cordie@example.org','Diamond','Schowalter','micaela42@beatty.org',NULL,NULL,NULL,NULL,1,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(17,NULL,26,'facilis-eos-veniam-impedit-ut-eum-in-odit','aweimann@example.com','Kavon','Rosenbaum','eliezer37@hotmail.com',NULL,NULL,NULL,NULL,1,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(18,NULL,21,'distinctio-corrupti-aut-dolorum','keeling.cordie@example.org','Orin','Von','brooklyn.treutel@hotmail.com',NULL,NULL,NULL,NULL,1,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(19,NULL,25,'qui-est-delectus-sint-quasi-quas','edna.boehm@example.com','Maurice','Spencer','jon62@runolfsdottir.com',NULL,NULL,NULL,NULL,1,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(20,NULL,28,'provident-dolorem-ut-quas-iste','mueller.emmitt@example.net','Jairo','Cormier','dallin01@wolff.com',NULL,NULL,NULL,NULL,1,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(21,NULL,28,'commodi-ad-harum-doloribus-earum-est-et-veritatis-expedita','mueller.emmitt@example.net','Ethel','Runte','qharvey@yahoo.com',NULL,NULL,NULL,NULL,1,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(22,NULL,29,'id-facilis-ipsum-similique-cupiditate','streich.everette@example.org','Amy','Tremblay','murl.bashirian@gmail.com',NULL,NULL,NULL,NULL,1,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(23,NULL,25,'voluptatum-modi-sint-iusto-inventore-aliquid','edna.boehm@example.com','Marielle','Macejkovic','jacobi.melisa@keeling.com',NULL,NULL,NULL,NULL,1,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(24,NULL,3,'quo-facere-adipisci-dolorem-nihil-dolores','william92@example.net','Jessika','Fisher','padberg.georgette@goldner.com',NULL,NULL,NULL,NULL,1,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(25,NULL,28,'provident-dolorem-ut-quas-iste','mueller.emmitt@example.net','Cristian','Ritchie','walter.deshawn@huels.com',NULL,NULL,NULL,NULL,1,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(26,NULL,10,'atque-aut-excepturi-a-laborum-maiores','xrau@example.org','Oswald','Toy','dhand@welch.com',NULL,NULL,NULL,NULL,1,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(27,NULL,23,'vero-laboriosam-et-quo-veniam-officiis-est','janet.hilpert@example.org','Eli','Blick','farrell.novella@yahoo.com',NULL,NULL,NULL,NULL,1,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(28,NULL,10,'molestias-eaque-voluptatem-necessitatibus','xrau@example.org','Jamison','Rogahn','cristal.harvey@gmail.com',NULL,NULL,NULL,NULL,1,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(29,NULL,25,'qui-est-delectus-sint-quasi-quas','edna.boehm@example.com','Darwin','Ernser','waylon.stracke@ankunding.net',NULL,NULL,NULL,NULL,1,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(30,NULL,25,'ex-tempora-animi-libero-ea','edna.boehm@example.com','Melyssa','Schroeder','jarred.ondricka@gmail.com',NULL,NULL,NULL,NULL,1,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(34,'cs_test_a1TRhXSce1Vr5NAesFPYEeV8jdmax59jtR05litP7ahoFi7hxZHFwoPF8p',2,'aut-accusantium-recusandae-cupiditate-ullam-veniam-autem-non-dolorem','casey.goyette@example.org','Davlatbek','Ushurbakiyev','dushurbakiev@example.com',NULL,'Almaty','Kazakhstan',NULL,0,'2024-05-04 16:20:08','2024-05-04 16:20:11'),(37,'cs_test_b1Bdra1fv0B622ivlOipoosq3A9lDNkLvL17SSOuNXmk5gWDEDFTpbNp98',31,'kXtVc8','dushurbakiev@example.com','Davlatbek','Ushurbakiyev','dushurbakiev@example.com',NULL,'Almaty','Kazakhstan',NULL,0,'2024-05-05 10:01:13','2024-05-05 10:01:14'),(44,'cs_test_b1TzdMKnt2PGAbqOm2VgjidevSFnLlxTUqk7shzA8GFtziALDVvl36XeWE',31,'kXtVc8','dushurbakiev@example.com','Davlatbek','Ushurbakiyev','dushurbakiev@example.com',NULL,'Almaty','Kazakhstan',NULL,0,'2024-05-05 11:16:07','2024-05-05 11:16:09'),(45,'cs_test_b1mrOXQZ4UjvzAtfRudponGDBGrW4LW9OLZOFxqHa8I4WRXR0ZM4Do0kIM',31,'kXtVc8','dushurbakiev@example.com','Davlatbek','Ushurbakiyev','dushurbakiev@example.com',NULL,'Almaty','Kazakhstan',NULL,0,'2024-05-05 11:18:48','2024-05-05 11:18:50'),(47,'cs_test_b1HJWhADPiMhQvFaszmmnIVMe4oPQuCmxfOMFHmmp09KWlJfH0mWtSvzCy',31,'kXtVc8','dushurbakiev@example.com','Davlatbek','Ushurbakiyev','dushurbakiev@example.com',NULL,'Almaty','Kazakhstan',NULL,0,'2024-05-05 11:24:03','2024-05-05 11:24:04'),(48,'cs_test_b15Rp4JaNCrMWLY4ZOHwP11fFZHcVnoQzD7lC3JQoH17EEcxSQO8FnDDhu',31,'kXtVc8','dushurbakiev@example.com','Davlatbek','Ushurbakiyev','dushurbakiev@example.com',NULL,'Almaty','Kazakhstan',NULL,0,'2024-05-05 11:24:46','2024-05-05 11:24:48'),(49,'cs_test_b13fFjfFTtxIs4buGVxS174BFqzKjpV2eUiJdDiH0ebctcrybxYF3s6G3M',31,'kXtVc8','dushurbakiev@example.com','Davlatbek','Ushurbakiyev','dushurbakiev@example.com',NULL,'Almaty','Kazakhstan',NULL,0,'2024-05-05 11:25:18','2024-05-05 11:25:20'),(50,'cs_test_b1K5FglN2i1E32AcxrSFFpbDsYpI0u6eKT86AE8UEFcCyiZzoHgdQcvLqz',31,'kXtVc8','dushurbakiev@example.com','Davlatbek','Ushurbakiyev','dushurbakiev@example.com',NULL,'Almaty','Kazakhstan',NULL,0,'2024-05-05 11:26:04','2024-05-05 11:26:05'),(51,'cs_test_a1OKVEOKftcAN4hw4ikqnyzDnzS0H21LQWScdujSbfPp5DmNv0DfrXDIfH',2,'aut-accusantium-recusandae-cupiditate-ullam-veniam-autem-non-dolorem','casey.goyette@example.org','Davlatbek','Ushurbakiyev','dushurbakiev@example.com',NULL,'Almaty','Kazakhstan',NULL,0,'2024-05-05 11:26:41','2024-05-05 11:26:43'),(52,'cs_test_b1vvYjYUTSIzONQ8ACUB77icPWxNulnRgkOKfz0dZTP4x7bb71vqyBDwcP',31,'kXtVc8','dushurbakiev@example.com','Davlatbek','Ushurbakiyev','dushurbakiev@example.com',NULL,'Almaty','Kazakhstan',NULL,0,'2024-05-05 11:27:15','2024-05-05 11:27:17'),(53,'cs_test_b1X7jKk2S8d5zGF3E7OE1gySspW5yEZVP7SJW1YBe7wsDYQAV02BbkWqSR',31,'kXtVc8','dushurbakiev@example.com','Davlatbek','Ushurbakiyev','dushurbakiev@example.com',NULL,'Almaty','Kazakhstan',NULL,0,'2024-05-05 11:27:47','2024-05-05 11:27:49'),(54,'cs_test_b1j8gkahpw0KE0PFLeDTtxrlN8YKTUthe3WtXKej5JPpsVcy442SfGmC32',31,'kXtVc8','dushurbakiev@example.com','Davlatbek','Ushurbakiyev','dushurbakiev@example.com',NULL,'Almaty','Kazakhstan',NULL,0,'2024-05-05 11:34:17','2024-05-05 11:34:18'),(55,'cs_test_b1vm10jKlym1d0vunCCwEpInmUmmoSCCQvRaLHM1coPicGQMi9YT2E6BdB',31,'kXtVc8','dushurbakiev@example.com','Davlatbek','Ushurbakiyev','dushurbakiev@example.com',NULL,'Almaty','Kazakhstan',NULL,0,'2024-05-05 11:35:09','2024-05-05 11:35:10'),(56,'cs_test_b16EEr2pczPr8UgrPyhyS4Bh9Du5RdS0Ep750jI1jPYvju6eHryF1mo9Gw',31,'kXtVc8','dushurbakiev@example.com','Davlatbek','Ushurbakiyev','dushurbakiev@example.com',NULL,'Almaty','Kazakhstan',NULL,1,'2024-05-05 14:29:59','2024-05-05 14:30:47');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',31,'token','07f2c5928b95bd3555a098ad8643f680e298e1b55b5ef985e3b3d25ffcf21eb0','[\"ambassador\"]','2024-05-04 13:16:51','2024-05-04 13:16:50','2024-05-04 13:16:51'),(2,'App\\Models\\User',31,'token','bb0f354b3493391688fef72cb040d905b9049b27f0b49511f3c534888fa6771e','[\"admin\"]','2024-05-04 16:47:25','2024-05-04 16:46:45','2024-05-04 16:47:25'),(3,'App\\Models\\User',31,'token','f1a01b506ed74c1781fce67eeae865957c36306f34c5bab05c10829c090141df','[\"ambassador\"]','2024-05-05 05:28:26','2024-05-04 16:47:42','2024-05-05 05:28:26'),(4,'App\\Models\\User',31,'token','dfeb2774844e72d5f71b2637a9eec94f72f6877246f5f6bbd5261059ce080cfb','[\"admin\"]','2024-05-05 11:35:47','2024-05-05 10:02:14','2024-05-05 11:35:47'),(5,'App\\Models\\User',31,'token','6a957d086a0f9236ba9bff01a7585902101c3f8010cd57e3077b2800f556eb6f','[\"ambassador\"]','2024-05-05 11:36:48','2024-05-05 11:36:16','2024-05-05 11:36:48'),(6,'App\\Models\\User',31,'token','09096bcf2096add321a26fab22de259d661381bea748bbe554fc19f90f21d3d1','[\"ambassador\"]','2024-05-05 15:05:12','2024-05-05 15:05:12','2024-05-05 15:05:12');
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
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Vel ut rerum aut.','Necessitatibus facilis voluptas voluptate occaecati. Molestiae dolore voluptatibus omnis qui cumque provident consectetur. Facere in ut aut quod dolores.','https://via.placeholder.com/640x480.png/0044dd?text=ducimus',91.00,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(2,'Alias id voluptas ut omnis.','Vero id suscipit ea aut aut. Aspernatur veritatis sint pariatur quam commodi inventore. Quis inventore cum ducimus dignissimos. Maxime nobis pariatur dolorum eos quia.','https://via.placeholder.com/640x480.png/0055bb?text=optio',44.00,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(3,'Aperiam voluptas eum ullam.','Magnam sit sit et quam nisi et libero. Quia ea dolore cumque ipsam in quasi. Illum dolorem dolorum exercitationem ut rerum excepturi.','https://via.placeholder.com/640x480.png/007777?text=illo',10.00,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(4,'Illo ut et eos.','Magnam molestiae similique at ipsam veritatis exercitationem accusamus architecto. Voluptatem nihil fuga quibusdam ut pariatur aut. Ut quae qui numquam ea dolorum consequuntur similique.','https://via.placeholder.com/640x480.png/008866?text=laboriosam',19.00,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(5,'Quia ab aliquam et.','Ea a dolore eius aut excepturi dolorum. Porro est blanditiis eum dicta. Eaque laborum accusantium rem minus asperiores necessitatibus molestiae. Enim sed dolorum pariatur quos.','https://via.placeholder.com/640x480.png/000022?text=doloribus',92.00,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(6,'Omnis et corporis aut dicta.','Fugiat itaque asperiores sed et dolorem. Assumenda sed earum modi nulla non voluptas. Voluptatibus cupiditate ut illo odio beatae.','https://via.placeholder.com/640x480.png/00ff11?text=vel',21.00,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(7,'Beatae aut est quia eligendi.','Expedita totam fugiat ut sunt. Perferendis veniam sequi ut ut quibusdam tempore aut est.','https://via.placeholder.com/640x480.png/004488?text=nemo',31.00,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(8,'Dolor natus ex error at.','Et est ut eius quia cupiditate magnam. Voluptatem esse eius saepe quidem. Magnam omnis sunt sint voluptates. Magni tenetur labore quia aut.','https://via.placeholder.com/640x480.png/00ccff?text=fuga',26.00,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(9,'Porro ut eligendi labore.','Qui aut aliquam aspernatur modi voluptatem et. Expedita maxime corrupti exercitationem placeat. Facilis iure voluptatem itaque est esse sunt.','https://via.placeholder.com/640x480.png/001188?text=qui',72.00,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(10,'Eius placeat quisquam quasi.','Sint ab ut nisi qui dolor assumenda sint nihil. Sunt sed ea reiciendis dignissimos. Odit dolor amet provident molestiae maxime et. Et in quia odio eum.','https://via.placeholder.com/640x480.png/00ff88?text=et',23.00,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(11,'Tempore est aut cum mollitia.','Facere omnis enim laborum recusandae. Sit distinctio deserunt qui amet quia saepe voluptas repellat. Officiis velit qui ut dignissimos repellendus.','https://via.placeholder.com/640x480.png/002266?text=sint',30.00,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(12,'Quia tempora qui ipsa cumque.','Asperiores unde eligendi velit quidem facere voluptatem. Odio et explicabo quo. Culpa modi voluptatem sit distinctio sint id.','https://via.placeholder.com/640x480.png/00bbbb?text=commodi',93.00,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(13,'Id ea ratione nobis.','Ut expedita rerum quod qui. Reprehenderit non eaque tempora. Quia iste minus et dolor rerum non omnis. Odio debitis accusamus saepe quis quia.','https://via.placeholder.com/640x480.png/00bb44?text=occaecati',39.00,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(14,'Omnis ut ut at.','In ex molestiae vel. Accusamus quo fugit quisquam mollitia facere delectus. Fuga exercitationem optio doloribus optio. Blanditiis porro molestiae molestias velit odit sit ea facere.','https://via.placeholder.com/640x480.png/0077aa?text=fugit',46.00,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(15,'Aut ut vitae et est.','Et omnis perspiciatis id. Id provident ut dolores earum. Magni debitis nam dolores maiores ut. Illo ut quas voluptatem voluptates et.','https://via.placeholder.com/640x480.png/003333?text=veniam',35.00,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(16,'Aliquid adipisci natus ut.','Voluptatibus quaerat occaecati dolores magnam. Aliquid praesentium in voluptate ratione. Est pariatur modi laboriosam atque vero. Minima vel atque enim id est aut iure neque.','https://via.placeholder.com/640x480.png/009977?text=ratione',30.00,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(17,'In est ipsam aut qui.','Inventore ipsa dolore quasi sit officiis blanditiis omnis. Velit voluptate sit ut voluptas dolorem delectus. Porro odit temporibus beatae perferendis. Et voluptatibus officiis sint eum.','https://via.placeholder.com/640x480.png/004422?text=eius',99.00,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(18,'Eos at animi eveniet.','Hic est et architecto dolorum vitae. Doloremque repudiandae minus ex dolorem nostrum. Impedit iure quod mollitia qui consequuntur eius blanditiis.','https://via.placeholder.com/640x480.png/003399?text=beatae',44.00,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(19,'Ullam autem rem voluptas.','Qui nisi commodi id ut. Tempora repellendus velit minima cumque officiis. Ipsam voluptas sit voluptatem deserunt qui. Officiis numquam delectus quod debitis harum et amet.','https://via.placeholder.com/640x480.png/00aa00?text=labore',55.00,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(20,'Repellat vel aut facilis ut.','Sequi ut laudantium temporibus accusantium qui. Quia qui hic ut veritatis omnis. Veritatis enim dicta velit rerum sit est vitae quas. Temporibus dignissimos architecto aut voluptate dolores.','https://via.placeholder.com/640x480.png/00eedd?text=neque',53.00,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(21,'Odit et est inventore optio.','Odio omnis tempore consequatur. Sed iure quia fuga est animi architecto. Dolores architecto iure sit nesciunt. Maxime non mollitia in.','https://via.placeholder.com/640x480.png/0044ee?text=iste',51.00,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(22,'Enim velit non saepe facere.','Deserunt et assumenda occaecati quasi fuga consequuntur eius molestiae. Odio voluptatem possimus velit ipsum veritatis. Quas voluptas ut aut placeat distinctio et et.','https://via.placeholder.com/640x480.png/005500?text=quia',72.00,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(23,'Cum aut voluptatem earum.','Est nulla mollitia quo qui. Maxime fuga tempora nobis id quaerat quibusdam. Optio minus at omnis. Et quia ut facilis consequatur corrupti mollitia molestiae voluptatum.','https://via.placeholder.com/640x480.png/0000aa?text=molestiae',73.00,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(24,'Eligendi neque est libero.','Quia et nobis repudiandae dolorem et. Est et veniam placeat enim odit modi. Sint necessitatibus provident minus non tenetur quia error.','https://via.placeholder.com/640x480.png/009900?text=possimus',35.00,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(25,'Ullam expedita fuga autem.','Facilis facilis autem consequatur a officiis labore. Cum et dolorem possimus sequi aperiam tenetur eum molestiae. Fuga tempore ad ullam aut. Ea facilis eum sit cum at repellendus.','https://via.placeholder.com/640x480.png/008899?text=omnis',68.00,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(26,'Totam odio ut atque.','Rerum harum dicta adipisci quos veniam necessitatibus. Ea optio sint eos qui. Totam itaque dolorem alias vitae sed similique eveniet voluptatem.','https://via.placeholder.com/640x480.png/0022dd?text=repudiandae',35.00,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(27,'Saepe nihil ut culpa modi.','Omnis et qui id illo maiores sed esse. Aut eum cupiditate minima et consequatur. Architecto laborum nemo provident est.','https://via.placeholder.com/640x480.png/009922?text=consectetur',37.00,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(28,'Voluptas ipsam velit est.','Beatae tempore quo sed est mollitia. Est ut error deleniti voluptatibus et sed quidem. Dicta dolor aperiam ab quas.','https://via.placeholder.com/640x480.png/00cc00?text=est',84.00,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(29,'Quod mollitia in sunt.','Consequuntur esse atque earum. Quia velit qui autem eius culpa exercitationem doloremque. Laboriosam maiores ipsa aut et doloribus. Eius quasi iusto reprehenderit quidem voluptatibus.','https://via.placeholder.com/640x480.png/00ccee?text=quidem',72.00,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(30,'Sit qui ex quia iure.','Dolorem voluptatem aperiam ut ullam et quasi excepturi. Nulla et numquam exercitationem quia nisi. Itaque quas enim sunt quaerat. Beatae odio provident aut porro.','https://via.placeholder.com/640x480.png/00aa33?text=et',58.00,'2021-07-18 12:55:56','2021-07-18 12:55:56');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Heaven','Powlowski','bashirian.monty@example.org','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',0,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(2,'Felipe','Anderson','casey.goyette@example.org','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',0,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(3,'Lon','Graham','william92@example.net','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',0,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(4,'Merl','Little','eschroeder@example.net','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',0,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(5,'Dolly','Kutch','vonrueden.marcelino@example.org','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',0,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(6,'Robyn','Hilpert','jeffery.davis@example.com','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',0,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(7,'Lois','Ziemann','bernardo26@example.com','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',0,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(8,'Norwood','Bayer','zieme.eli@example.com','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',0,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(9,'Monty','D\'Amore','jacobson.skylar@example.net','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',0,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(10,'Maegan','Lakin','xrau@example.org','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',0,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(11,'Celia','Schneider','norris.gorczany@example.org','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',0,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(12,'Rahul','Renner','deangelo73@example.net','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',0,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(13,'Adell','Ziemann','vhomenick@example.org','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',0,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(14,'Krystal','Volkman','pstokes@example.org','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',0,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(15,'Kasey','Beier','zjacobi@example.net','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',0,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(16,'Reyes','Bogisich','brannon.beatty@example.org','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',0,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(17,'Kenna','Corkery','irippin@example.org','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',0,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(18,'Emile','Schaden','lind.glen@example.net','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',0,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(19,'Yasmin','Hermiston','mariana.weber@example.org','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',0,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(20,'Amparo','Zemlak','sylvia.bernhard@example.org','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',0,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(21,'Isabel','Bechtelar','keeling.cordie@example.org','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',0,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(22,'Aimee','Barrows','samir.marvin@example.net','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',0,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(23,'Spencer','Cummerata','janet.hilpert@example.org','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',0,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(24,'Jerod','Hoeger','hstroman@example.com','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',0,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(25,'Tressie','Sawayn','edna.boehm@example.com','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',0,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(26,'Vivian','Sauer','aweimann@example.com','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',0,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(27,'Pascale','Roob','paucek.viola@example.net','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',0,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(28,'Osborne','Bernier','mueller.emmitt@example.net','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',0,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(29,'Lacey','Erdman','streich.everette@example.org','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',0,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(30,'Carroll','Batz','runte.hilda@example.net','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',0,'2021-07-18 12:55:56','2021-07-18 12:55:56'),(31,'Davlat','Ushurbakiyev','dushurbakiev@example.com','$2y$10$/y1XRlrlhbmopCoE/NF6CuhMkt7XPlbPpNVrTSL9YydHnWLDFPHQe',1,'2024-05-04 13:16:34','2024-05-04 13:16:34');
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

-- Dump completed on 2024-05-06  4:04:20
