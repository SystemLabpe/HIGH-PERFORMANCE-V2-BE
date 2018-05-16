-- -----------------------------------------------------
-- Schema hp_db
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `hp_db` ;

-- -----------------------------------------------------
-- Schema hp_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hp_db` DEFAULT CHARACTER SET utf8 ;
USE `hp_db` ;

-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 18.188.252.113    Database: hp_db
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.16.04.1

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
-- Table structure for table `clubs`
--

DROP TABLE IF EXISTS `clubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clubs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'http://18.188.252.113/default.jpg',
  `rival_club_id` int(10) unsigned DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `club_club_idx` (`rival_club_id`),
  CONSTRAINT `club_club_fk` FOREIGN KEY (`rival_club_id`) REFERENCES `clubs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clubs`
--

LOCK TABLES `clubs` WRITE;
/*!40000 ALTER TABLE `clubs` DISABLE KEYS */;
INSERT INTO `clubs` VALUES (1,'Universitario de deportes','http://18.188.252.113/club/M3lcKBt8QFWbXOlXacoICyqnoFJdmNPeHXFsMHJP.png',NULL,1,'2018-05-11 03:12:34','2018-05-11 03:24:46'),(2,'Sport Loreto','http://18.188.252.113/club/bvMufKx8gSjyewmVw63dvv1Ycx3w9ekTyWRq8pIN.png',NULL,1,'2018-05-11 03:45:37','2018-05-11 04:13:34'),(3,'Aliaaanza Lima','http://18.188.252.113/club/RTjm0pC5tsEw36mb4vmL6u4UBa5knoFHWDOARqCJ.jpeg',NULL,1,'2018-05-11 17:21:24','2018-05-11 17:21:24');
/*!40000 ALTER TABLE `clubs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `completion_actions`
--

DROP TABLE IF EXISTS `completion_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `completion_actions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'http://18.188.252.113/default.jpg',
  `v_desc` text COLLATE utf8mb4_unicode_ci,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `completion_actions`
--

LOCK TABLES `completion_actions` WRITE;
/*!40000 ALTER TABLE `completion_actions` DISABLE KEYS */;
INSERT INTO `completion_actions` VALUES (1,'wewrgre3g','http://18.188.252.113/default.jpg','ergr4eger4eg',0,'2018-05-11 04:53:16','2018-05-12 17:10:06'),(2,'Tiro Lejano','http://18.188.252.113/default.jpg','La jugada finaliza con un tiro lejano (desviado)',1,'2018-05-12 17:10:42','2018-05-12 17:10:42'),(3,'Tiro de media distancia','http://18.188.252.113/default.jpg','La jugada finaliza con un tiro de media distancia',1,'2018-05-12 17:11:06','2018-05-12 17:11:06'),(4,'Tiro frontal','http://18.188.252.113/default.jpg','La jugada finaliza con un tiro frontal',1,'2018-05-12 17:11:31','2018-05-12 17:11:31'),(5,'Remate de cabeza','http://18.188.252.113/default.jpg','La jugada finaliza con un remate de cabeza',1,'2018-05-12 17:12:10','2018-05-12 17:12:10'),(6,'Tiro área','http://18.188.252.113/default.jpg','La jugada finaliza con un tiro al área.',1,'2018-05-12 17:12:30','2018-05-12 17:12:30'),(7,'Propia puerta','http://18.188.252.113/default.jpg','La jugada finaliza con un remate en nuestro propio arco',1,'2018-05-12 17:12:52','2018-05-12 17:12:52');
/*!40000 ALTER TABLE `completion_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_areas`
--

DROP TABLE IF EXISTS `field_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_areas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'http://18.188.252.113/default.jpg',
  `v_desc` text COLLATE utf8mb4_unicode_ci,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_areas`
--

LOCK TABLES `field_areas` WRITE;
/*!40000 ALTER TABLE `field_areas` DISABLE KEYS */;
INSERT INTO `field_areas` VALUES (1,'Zona 1','http://18.188.252.113/fieldArea/ztqcI211tGpeoJLcCr8ewWXFcJy5vFnImXuezWhI.png','ASDFIJGHIRUHJGOIR',0,'2018-05-11 04:50:31','2018-05-12 17:32:47'),(2,'Zona 1','http://18.188.252.113/default.jpg','La zona del terreno de juego del equipo rival en el inicio de la posesión se realiza en Zona 1',1,'2018-05-12 17:32:36','2018-05-12 17:32:36'),(3,'Zona 2','http://18.188.252.113/default.jpg','La zona del terreno de juego del equipo rival en el inicio de la posesión se realiza en Zona 2',1,'2018-05-12 17:33:12','2018-05-12 17:33:12'),(4,'Zona 3','http://18.188.252.113/default.jpg','La zona del terreno de juego del equipo rival en el inicio de la posesión se realiza en Zona 3',1,'2018-05-12 17:33:23','2018-05-12 17:33:23'),(5,'Zona 4','http://18.188.252.113/default.jpg','La zona del terreno de juego del equipo rival en el inicio de la posesión se realiza en Zona 4',1,'2018-05-12 17:33:33','2018-05-12 17:33:33');
/*!40000 ALTER TABLE `field_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_zones`
--

DROP TABLE IF EXISTS `field_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_zones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'http://18.188.252.113/default.jpg',
  `v_desc` text COLLATE utf8mb4_unicode_ci,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_zones`
--

LOCK TABLES `field_zones` WRITE;
/*!40000 ALTER TABLE `field_zones` DISABLE KEYS */;
INSERT INTO `field_zones` VALUES (1,'Z1M','http://18.188.252.113/fieldZone/1XEGbWW1x3jLCdQawSWI7UlCPiab7nNeYRmc71kI.png','Zona 1 Media',1,'2018-05-11 04:43:06','2018-05-11 04:43:06'),(2,'Z1LI','http://18.188.252.113/fieldZone/vbi0Ie175JJQ00tJTv8Xrw6nrrYucujtGJb54KUU.jpeg','Zona 1 lateral derecho',0,'2018-05-11 04:43:37','2018-05-11 04:44:18'),(3,'Z1LI','http://18.188.252.113/fieldZone/55DJTCSVkQnNQlyF1J8R0Y1OfAj0zt2DQugFwkMZ.jpeg','Zona 1 lateral izquierda',1,'2018-05-12 17:41:57','2018-05-12 17:43:03'),(4,'Z1LD','http://18.188.252.113/default.jpg','Zona 1 lateral derecha',1,'2018-05-12 17:43:26','2018-05-12 17:43:26'),(5,'Z2M','http://18.188.252.113/default.jpg','Zona 2 media',1,'2018-05-12 17:43:36','2018-05-12 17:43:36'),(6,'Z2LI','http://18.188.252.113/default.jpg','Zona 2 lateral izquierda',1,'2018-05-12 17:44:10','2018-05-12 17:44:10'),(7,'Z2LD','http://18.188.252.113/default.jpg','Zona 2 lateral derecho',1,'2018-05-12 17:44:27','2018-05-12 17:44:27'),(8,'Z3M','http://18.188.252.113/default.jpg','Zona 3 media',1,'2018-05-12 17:44:38','2018-05-12 17:44:38'),(9,'Z3LI','http://18.188.252.113/default.jpg','Zona 3 lateral izquierdo',1,'2018-05-12 17:44:54','2018-05-12 17:44:54'),(10,'Z3LD','http://18.188.252.113/default.jpg','Zona 3 lateral derecha',1,'2018-05-12 17:45:06','2018-05-12 17:45:06'),(11,'Z4M','http://18.188.252.113/default.jpg','Zona 4 media',1,'2018-05-12 17:45:16','2018-05-12 17:45:16'),(12,'Z4LD','http://18.188.252.113/default.jpg','Zona 4 lateral derecha',1,'2018-05-12 17:46:22','2018-05-12 17:46:22'),(13,'Z4LI','http://18.188.252.113/default.jpg','Zona 4 lateral izquierda',1,'2018-05-12 17:46:38','2018-05-12 17:46:38');
/*!40000 ALTER TABLE `field_zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `initial_penetrations`
--

DROP TABLE IF EXISTS `initial_penetrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `initial_penetrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'http://18.188.252.113/default.jpg',
  `v_desc` text COLLATE utf8mb4_unicode_ci,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `initial_penetrations`
--

LOCK TABLES `initial_penetrations` WRITE;
/*!40000 ALTER TABLE `initial_penetrations` DISABLE KEYS */;
INSERT INTO `initial_penetrations` VALUES (1,'Penetracion','http://18.188.252.113/initialPenetration/MJpbszUur56F77oeMsGPjg1K8J5nLQdxgoMxCxY6.png','asdfg',0,'2018-05-11 04:48:24','2018-05-12 15:39:47'),(2,'Penetración','http://18.188.252.113/default.jpg','La acción inicial supera a uno o varios jugadores rivales.',1,'2018-05-12 15:39:11','2018-05-12 15:39:11'),(3,'No penetración','http://18.188.252.113/initialPenetration/0Rwrwj3ivcZwzU9LEmqUVNmofI6pUHvvTQwj5eYO.jpeg','La acción inicial no supera a ningún jugador',1,'2018-05-12 15:40:33','2018-05-12 15:41:36');
/*!40000 ALTER TABLE `initial_penetrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invation_levels`
--

DROP TABLE IF EXISTS `invation_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invation_levels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'http://18.188.252.113/default.jpg',
  `v_desc` text COLLATE utf8mb4_unicode_ci,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invation_levels`
--

LOCK TABLES `invation_levels` WRITE;
/*!40000 ALTER TABLE `invation_levels` DISABLE KEYS */;
INSERT INTO `invation_levels` VALUES (1,'Zona no penetrante','http://18.188.252.113/invationLevel/gBTizOS6WHitUG3eyIxzmp6ezN5WNTzkodlRG7r9.png','Nuestro ataque se ubica en zona 4 del equipo rival',1,'2018-05-11 04:51:35','2018-05-12 16:04:28'),(2,'Zona penetrante','http://18.188.252.113/default.jpg','Nuestro ataque se ubica en zona 2 y 3 del equipo rival',1,'2018-05-12 16:06:59','2018-05-12 16:06:59'),(3,'Zona muy penetrante','http://18.188.252.113/default.jpg','Nuestro ataque se ubica en zona 1 del equipo rival',1,'2018-05-12 16:07:26','2018-05-12 16:07:26');
/*!40000 ALTER TABLE `invation_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `numerical_balances`
--

DROP TABLE IF EXISTS `numerical_balances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `numerical_balances` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'http://18.188.252.113/default.jpg',
  `v_desc` text COLLATE utf8mb4_unicode_ci,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numerical_balances`
--

LOCK TABLES `numerical_balances` WRITE;
/*!40000 ALTER TABLE `numerical_balances` DISABLE KEYS */;
INSERT INTO `numerical_balances` VALUES (1,'Bajo','http://18.188.252.113/default.jpg','La cantidad de jugadores rivales situados entre la línea del balón y su portería al inicio de la posición es de 1 - 3 jugadores',1,'2018-05-12 16:17:30','2018-05-12 16:17:30'),(2,'Medio','http://18.188.252.113/default.jpg','La cantidad de jugadores rivales situados entre la línea del balón y su portería al inicio de la posición es de 4 - 6 jugadores',1,'2018-05-12 16:17:47','2018-05-12 16:17:47'),(3,'Alto','http://18.188.252.113/default.jpg','La cantidad de jugadores rivales situados entre la línea del balón y su portería al inicio de la posición es de 7- 10 jugadores',1,'2018-05-12 16:19:35','2018-05-12 16:19:35');
/*!40000 ALTER TABLE `numerical_balances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
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
INSERT INTO `oauth_access_tokens` VALUES ('21a59185cbf8f8cd9f54377b633cfa956e969dbcd8d51716d8edf8fafc8dc421e03c69acb1c57e59',1,2,NULL,'[\"admin\"]',0,'2018-05-11 17:26:43','2018-05-11 17:26:43','2019-05-11 17:26:43'),('25d0664262197f0247bd9be1624c0cb21dd8620f311177e141c7573dba213138621a52bfc2a0ed1e',1,2,NULL,'[\"admin\"]',0,'2018-05-11 17:27:18','2018-05-11 17:27:18','2019-05-11 17:27:18'),('605e3847a0bf712020e52194944e03c1d0d8706f77a4b1e6df62e41f66f10e2ee6bd7bfb4680abd1',1,2,NULL,'[\"admin\"]',0,'2018-05-11 17:44:40','2018-05-11 17:44:40','2019-05-11 17:44:40'),('7d885d7f8c78e658c515085dfe78a2f1a69f98e521328099a14c5ad7f0581c6d8bd85569efc3c482',1,2,NULL,'[\"admin\"]',0,'2018-05-12 20:39:57','2018-05-12 20:39:57','2019-05-12 20:39:57'),('a1aeed5620b3fdcd163aa8e47b4a7eab0bbc6e2d579cc5bc63f2888c92556b04b2d69bd89f0c5817',1,2,NULL,'[\"admin\"]',0,'2018-05-11 17:20:32','2018-05-11 17:20:32','2019-05-11 17:20:32'),('a846466d95c460626ccced9e16f7fcfc6175c6fa19205a13df675e202879e93277c5f91b1c026ba7',1,2,NULL,'[\"admin\"]',0,'2018-05-12 20:13:29','2018-05-12 20:13:29','2019-05-12 20:13:29'),('c127ae2e26fcd7cd8c7205febc2fd71eb99be188c0afb67ac91f3e946d77f12c083c16f157d36c16',1,2,NULL,'[\"admin\"]',0,'2018-05-12 14:54:55','2018-05-12 14:54:55','2019-05-12 14:54:55'),('c6d6cad138f785d7b84487c28b2655a304a64432405c7df1810ace8f0e71915b6129e49336873d3a',1,2,NULL,'[\"admin\"]',0,'2018-05-11 17:25:57','2018-05-11 17:25:57','2019-05-11 17:25:57'),('cf145a8c91d95e34587bc016ffbfdb3f528076238d1f7f4d0a3268d29a0bdc2ae2cb08824ff5f4fb',1,2,NULL,'[\"admin\"]',0,'2018-05-11 03:24:15','2018-05-11 03:24:15','2019-05-11 03:24:15'),('e711fb6d91ed56258d2f7699c084a2e383168ca1d6a586118d16a30f16e6ecc0e7f4414300f69536',1,2,NULL,'[\"admin\"]',0,'2018-05-11 16:43:53','2018-05-11 16:43:53','2019-05-11 16:43:53'),('f8074f4f1f829ee76631b474658eaa95ded78aea27cecbfd3d0c6fa8e3c9cd081799cab8fd000828',1,2,NULL,'[\"admin\"]',0,'2018-05-11 03:08:45','2018-05-11 03:08:45','2019-05-11 03:08:45');
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
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `oauth_clients` VALUES (1,NULL,'Laravel Personal Access Client','DXdnFoP3etxPP0ZUbENdgNZk0l0G7Ow5FanM6Of7','http://localhost',1,0,0,'2018-05-01 22:11:10','2018-05-01 22:11:10'),(2,NULL,'Laravel Password Grant Client','1ro0u1LynfTZS7BNn6wGLxF3fx2dyyipRkGNr8AB','http://localhost',0,1,0,'2018-05-01 22:11:10','2018-05-01 22:11:10');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
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
INSERT INTO `oauth_refresh_tokens` VALUES ('1bda74ea21239f13ec29c5f7610682c579cfae5b6f9dc4250966b0f90e6515cde478c6fe1cec7e24','f8074f4f1f829ee76631b474658eaa95ded78aea27cecbfd3d0c6fa8e3c9cd081799cab8fd000828',0,'2019-05-11 03:08:45'),('209b6d7ce918c6c91cfb5e19f1640cb740099f120f333bd14d0602ac5f426eac64fde300d3144251','605e3847a0bf712020e52194944e03c1d0d8706f77a4b1e6df62e41f66f10e2ee6bd7bfb4680abd1',0,'2019-05-11 17:44:40'),('225840afb625020c6118d245e55f092f6e86ee35c4ef0fe88beb4146346dbe2e09520ff1e9017d10','c127ae2e26fcd7cd8c7205febc2fd71eb99be188c0afb67ac91f3e946d77f12c083c16f157d36c16',0,'2019-05-12 14:54:55'),('4346b3e2b3df8b28781ad3b23e1373bef84b44a5c5915d8ffbe92e0b8032d43d6bcbd0fbc468b158','cf145a8c91d95e34587bc016ffbfdb3f528076238d1f7f4d0a3268d29a0bdc2ae2cb08824ff5f4fb',0,'2019-05-11 03:24:15'),('4a3c20688e9c76af02e6e5a20d8e922fddb8907aae8c8656a9206bef4f98883c568563d3183ba2bb','21a59185cbf8f8cd9f54377b633cfa956e969dbcd8d51716d8edf8fafc8dc421e03c69acb1c57e59',0,'2019-05-11 17:26:43'),('680a7dcd2f26fb49b17a9e975ff370151537852921f05b4cfe41e4859b132a809b75c234a817aea6','a846466d95c460626ccced9e16f7fcfc6175c6fa19205a13df675e202879e93277c5f91b1c026ba7',0,'2019-05-12 20:13:29'),('6f215ad03f289c50818004818d319526abf6fec104ad201f0d23b15742387db7b4c21e57b47f2ff9','25d0664262197f0247bd9be1624c0cb21dd8620f311177e141c7573dba213138621a52bfc2a0ed1e',0,'2019-05-11 17:27:18'),('7a94acdf9ae692f20993cc9b52f6cc700c8e93fed63867e8a579ff99ba4020ecc780cc2f445a3d6e','e711fb6d91ed56258d2f7699c084a2e383168ca1d6a586118d16a30f16e6ecc0e7f4414300f69536',0,'2019-05-11 16:43:53'),('a52a997f57b54572f4ca3a6af1c560f30dda6a38b7e97d7be844b22f7e360c4f9a2715289ec867aa','c6d6cad138f785d7b84487c28b2655a304a64432405c7df1810ace8f0e71915b6129e49336873d3a',0,'2019-05-11 17:25:57'),('d3901e18b8db9a674897d5ca92e2a16b48734010ed71b4e67f72f689e55ccaa94601774429c7c4ef','a1aeed5620b3fdcd163aa8e47b4a7eab0bbc6e2d579cc5bc63f2888c92556b04b2d69bd89f0c5817',0,'2019-05-11 17:20:32'),('efee8b0e75bd86cda9fbd737d89e278cd5e99d598b04dfcad64bc17789f1423747e723f24900f30d','7d885d7f8c78e658c515085dfe78a2f1a69f98e521328099a14c5ad7f0581c6d8bd85569efc3c482',0,'2019-05-12 20:39:57');
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penetrating_passes`
--

DROP TABLE IF EXISTS `penetrating_passes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `penetrating_passes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'http://18.188.252.113/default.jpg',
  `v_desc` text COLLATE utf8mb4_unicode_ci,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penetrating_passes`
--

LOCK TABLES `penetrating_passes` WRITE;
/*!40000 ALTER TABLE `penetrating_passes` DISABLE KEYS */;
INSERT INTO `penetrating_passes` VALUES (1,'Bajo','http://18.188.252.113/default.jpg','<= 3 pases que superan líneas',1,'2018-05-12 16:32:53','2018-05-12 16:32:53'),(2,'Medio','http://18.188.252.113/default.jpg','Entre 3-6 pases que superan líneas',1,'2018-05-12 16:33:36','2018-05-12 16:33:36'),(3,'Alto','http://18.188.252.113/default.jpg','>7 pases que superan líneas',1,'2018-05-12 16:36:23','2018-05-12 16:36:23');
/*!40000 ALTER TABLE `penetrating_passes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pentagon_completions`
--

DROP TABLE IF EXISTS `pentagon_completions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pentagon_completions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'http://18.188.252.113/default.jpg',
  `v_desc` text COLLATE utf8mb4_unicode_ci,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pentagon_completions`
--

LOCK TABLES `pentagon_completions` WRITE;
/*!40000 ALTER TABLE `pentagon_completions` DISABLE KEYS */;
INSERT INTO `pentagon_completions` VALUES (1,'Penta 0M','http://18.188.252.113/default.jpg','wetrg',0,'2018-05-11 04:52:56','2018-05-12 16:50:01'),(2,'Dentro del pentágono','http://18.188.252.113/default.jpg','La ocasión de gol transcurre tiene lugar dentro del pentágono de finalización',1,'2018-05-12 16:51:12','2018-05-12 16:51:12'),(3,'Fuera del pentágono','http://18.188.252.113/default.jpg','La ocasión de gol transcurre tiene lugar fuera del pentágono de finalización',1,'2018-05-12 16:53:04','2018-05-12 16:53:04');
/*!40000 ALTER TABLE `pentagon_completions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_positions`
--

DROP TABLE IF EXISTS `player_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_positions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'http://18.188.252.113/default.jpg',
  `v_desc` text COLLATE utf8mb4_unicode_ci,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_positions`
--

LOCK TABLES `player_positions` WRITE;
/*!40000 ALTER TABLE `player_positions` DISABLE KEYS */;
INSERT INTO `player_positions` VALUES (1,'Portero','http://18.188.252.113/playerPosition/EoaiuQMWZ4jQlFCHIKUs7kUA0siv7l5bVRLTKly0.png','asdfghj',1,'2018-05-11 04:49:33','2018-05-11 04:49:58'),(2,'Defensa central','http://18.188.252.113/default.jpg','Jugada iniciada por el defensa central',1,'2018-05-12 15:43:49','2018-05-12 15:43:49'),(3,'Defensa lateral','http://18.188.252.113/default.jpg','Jugada iniciada por el defensa lateral',1,'2018-05-12 15:44:51','2018-05-12 15:44:51'),(4,'Medio','http://18.188.252.113/default.jpg','Jugada iniciada por el volante medio',1,'2018-05-12 15:45:13','2018-05-12 15:45:13'),(5,'Medio exterior','http://18.188.252.113/default.jpg','Jugada iniciada por el volante exterior',1,'2018-05-12 15:52:20','2018-05-12 15:52:20'),(6,'Delantero','http://18.188.252.113/default.jpg','Jugada iniciada por el delantero',1,'2018-05-12 15:52:38','2018-05-12 15:52:38');
/*!40000 ALTER TABLE `player_positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `possession_passes`
--

DROP TABLE IF EXISTS `possession_passes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `possession_passes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'http://18.188.252.113/default.jpg',
  `v_desc` text COLLATE utf8mb4_unicode_ci,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `possession_passes`
--

LOCK TABLES `possession_passes` WRITE;
/*!40000 ALTER TABLE `possession_passes` DISABLE KEYS */;
INSERT INTO `possession_passes` VALUES (1,'Pocos','http://18.188.252.113/possessionPass/1AoIvwv04COrurTLEA0ZFjLQb9bMRJI1LR3xysRA.jpeg','Máximo 3 pases realizados durante la posesión',1,'2018-05-12 16:28:03','2018-05-12 16:30:48'),(2,'Bastantes','http://18.188.252.113/default.jpg','Entre 4-6 pases realizados durante la posesión',1,'2018-05-12 16:29:51','2018-05-12 16:29:51'),(3,'Muchos','http://18.188.252.113/default.jpg','De 7 pases a más realizados durante la posesión',1,'2018-05-12 16:30:37','2018-05-12 16:30:37');
/*!40000 ALTER TABLE `possession_passes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `previous_actions`
--

DROP TABLE IF EXISTS `previous_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `previous_actions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'http://18.188.252.113/default.jpg',
  `v_desc` text COLLATE utf8mb4_unicode_ci,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `previous_actions`
--

LOCK TABLES `previous_actions` WRITE;
/*!40000 ALTER TABLE `previous_actions` DISABLE KEYS */;
INSERT INTO `previous_actions` VALUES (1,'Centro desde banda','http://18.188.252.113/default.jpg','La penútlima jugada antes de finalizar la acción se da con un centro desde la banda',1,'2018-05-12 17:02:53','2018-05-12 17:02:53'),(2,'Pase a profundidad','http://18.188.252.113/default.jpg','La penúltima jugada antes de finalizar la acción se da con un pase a profundidad',1,'2018-05-12 17:03:29','2018-05-12 17:03:29'),(3,'Pase lateral / atrás','http://18.188.252.113/default.jpg','La penúltima jugada antes de finalizar la acción se da con un pase lateral / atrás',1,'2018-05-12 17:05:13','2018-05-12 17:05:13'),(4,'Acción individual','http://18.188.252.113/default.jpg','La penúltima jugada antes de finalizar la acción se da con una acción individual',1,'2018-05-12 17:06:03','2018-05-12 17:06:03'),(5,'Rechace Portero / def','http://18.188.252.113/default.jpg','La penúltima jugada antes de finalizar la acción se da con un rechace del portero / defensa',1,'2018-05-12 17:06:53','2018-05-12 17:06:53'),(6,'Pared','http://18.188.252.113/default.jpg','La penúltima jugada antes de finalizar la acción se da con una pared entre dos jugadores',1,'2018-05-12 17:07:24','2018-05-12 17:07:24');
/*!40000 ALTER TABLE `previous_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `progression_types`
--

DROP TABLE IF EXISTS `progression_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `progression_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'http://18.188.252.113/default.jpg',
  `v_desc` text COLLATE utf8mb4_unicode_ci,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progression_types`
--

LOCK TABLES `progression_types` WRITE;
/*!40000 ALTER TABLE `progression_types` DISABLE KEYS */;
INSERT INTO `progression_types` VALUES (1,'12324324','http://18.188.252.113/default.jpg','fwfw3223',0,'2018-05-11 04:54:56','2018-05-12 16:45:22'),(2,'Directo','http://18.188.252.113/default.jpg','La progresión de juego se realiza mediante un pase largo desde la línea del balón hacia la línea de delanteros situada en zona 4',1,'2018-05-12 16:44:32','2018-05-12 16:44:32'),(3,'Indirecto','http://18.188.252.113/default.jpg','La progresión en el juego se realiza mediante pases cortos en la que conectar la línea defensiva con la línea media y la línea de delanteros',1,'2018-05-12 16:45:18','2018-05-12 16:45:18');
/*!40000 ALTER TABLE `progression_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `start_types`
--

DROP TABLE IF EXISTS `start_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `start_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'http://18.188.252.113/default.jpg',
  `v_desc` text COLLATE utf8mb4_unicode_ci,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `start_types`
--

LOCK TABLES `start_types` WRITE;
/*!40000 ALTER TABLE `start_types` DISABLE KEYS */;
INSERT INTO `start_types` VALUES (1,'Saque de banda','http://18.188.252.113/startType/6k72AoWw7qrescMVDHUXWD127IW8q0hqFh0NkDOm.png','El balón procede después de la ejecución del saque de banda',1,'2018-05-11 04:45:50','2018-05-11 04:46:18'),(2,'Tiro Libre','http://18.188.252.113/default.jpg','El balón procede después de la ejecución del tiro libre',1,'2018-05-12 17:49:36','2018-05-12 17:49:36'),(3,'Saque de esquina','http://18.188.252.113/default.jpg','El balón procede después de la ejecución del saque de esquina',1,'2018-05-12 17:50:11','2018-05-12 17:50:11'),(4,'Saque de inicio','http://18.188.252.113/default.jpg','El balón procede después de la ejecución del saque de inicio',1,'2018-05-12 17:50:43','2018-05-12 17:50:43'),(5,'Penal','http://18.188.252.113/default.jpg','El balón procede después de la ejecución del tiro penal',1,'2018-05-12 17:51:23','2018-05-12 17:51:23'),(6,'Apropiación','http://18.188.252.113/default.jpg','El balón procede de algún despeje o disputa',1,'2018-05-12 17:51:44','2018-05-12 17:51:44'),(7,'Robo','http://18.188.252.113/default.jpg','El balón es recuperado por una entrada sobre el rival',1,'2018-05-12 17:52:06','2018-05-12 17:52:06'),(8,'Interceptación','http://18.188.252.113/default.jpg','Se corta un pase entre dos oponentes, haciéndose con la posesión del balón.',1,'2018-05-12 17:52:32','2018-05-12 17:52:32');
/*!40000 ALTER TABLE `start_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stopped_balls`
--

DROP TABLE IF EXISTS `stopped_balls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stopped_balls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'http://18.188.252.113/default.jpg',
  `v_desc` text COLLATE utf8mb4_unicode_ci,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stopped_balls`
--

LOCK TABLES `stopped_balls` WRITE;
/*!40000 ALTER TABLE `stopped_balls` DISABLE KEYS */;
INSERT INTO `stopped_balls` VALUES (1,'Tiro Libre','http://18.188.252.113/stoppedBall/qU1MUCoEX3adFdMMSzKazhY7ws3OxfHqvL9Y5M0f.png',NULL,1,'2018-05-11 04:52:28','2018-05-12 17:35:26'),(2,'Saque de esquina','http://18.188.252.113/default.jpg',NULL,1,'2018-05-12 17:35:44','2018-05-12 17:35:44'),(3,'Lateral','http://18.188.252.113/default.jpg',NULL,1,'2018-05-12 17:35:53','2018-05-12 17:35:53'),(4,'Saque de inicio','http://18.188.252.113/default.jpg',NULL,1,'2018-05-12 17:36:04','2018-05-12 17:36:04'),(5,'Saque de arco','http://18.188.252.113/default.jpg',NULL,1,'2018-05-12 17:36:11','2018-05-12 17:36:11'),(6,'Penal','http://18.188.252.113/default.jpg',NULL,1,'2018-05-12 17:36:18','2018-05-12 17:36:18');
/*!40000 ALTER TABLE `stopped_balls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `u_type` tinyint(1) DEFAULT '0',
  `club_id` int(10) unsigned DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `club_user_idx` (`club_id`),
  CONSTRAINT `club_user_fk` FOREIGN KEY (`club_id`) REFERENCES `clubs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin@ehp.pe','$2y$10$uJ0Kkny3pUctVaJB.cJ86Ohxlu04qFFrV0ovHiLBBGIkKGHqBD5Fu',2,NULL,NULL,'2018-05-01 22:11:10','2018-05-01 22:11:10');
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

-- Dump completed on 2018-05-14  9:57:06
