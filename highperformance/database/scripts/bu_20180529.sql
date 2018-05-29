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
-- Table structure for table `chances`
--

DROP TABLE IF EXISTS `chances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chances` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_home` tinyint(1) NOT NULL DEFAULT '1',
  `chance_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1:PLAY 2:SHOOT PLAY',
  `chance_minute` tinyint(3) NOT NULL,
  `is_goal` tinyint(1) NOT NULL DEFAULT '1',
  `assisted_player` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scored_player` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `match_id` int(10) unsigned NOT NULL,
  `stopped_ball_id` int(10) unsigned DEFAULT NULL,
  `start_type_id` int(10) unsigned DEFAULT NULL,
  `field_zone_id` int(10) unsigned DEFAULT NULL,
  `initial_penetration_id` int(10) unsigned DEFAULT NULL,
  `player_position_id` int(10) unsigned DEFAULT NULL,
  `field_area_id` int(10) unsigned DEFAULT NULL,
  `invation_level_id` int(10) unsigned DEFAULT NULL,
  `numerical_balance_id` int(10) unsigned DEFAULT NULL,
  `possession_passes_id` int(10) unsigned DEFAULT NULL,
  `penetrating_passes_id` int(10) unsigned DEFAULT NULL,
  `progression_type_id` int(10) unsigned DEFAULT NULL,
  `pentagon_completion_id` int(10) unsigned DEFAULT NULL,
  `previous_action_id` int(10) unsigned DEFAULT NULL,
  `completion_action_id` int(10) unsigned DEFAULT NULL,
  `penultimate_field_zone_id` int(10) unsigned DEFAULT NULL,
  `last_field_zone_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `match_chance_idx` (`match_id`),
  KEY `sball_chance_idx` (`stopped_ball_id`),
  KEY `st_chance_idx` (`start_type_id`),
  KEY `fz_chance_idx` (`field_zone_id`),
  KEY `ip_chance_idx` (`initial_penetration_id`),
  KEY `pp_chance_idx` (`player_position_id`),
  KEY `fa_chance_idx` (`field_area_id`),
  KEY `il_chance_idx` (`invation_level_id`),
  KEY `nb_chance_idx` (`numerical_balance_id`),
  KEY `ppa_chance_idx` (`possession_passes_id`),
  KEY `pep_chance_idx` (`penetrating_passes_id`),
  KEY `pt_chance_idx` (`progression_type_id`),
  KEY `pc_chance_idx` (`pentagon_completion_id`),
  KEY `pa_chance_idx` (`previous_action_id`),
  KEY `ca_chance_idx` (`completion_action_id`),
  KEY `pfz_chance_idx` (`penultimate_field_zone_id`),
  KEY `lfz_chance_idx` (`last_field_zone_id`),
  CONSTRAINT `ca_chance_fk` FOREIGN KEY (`completion_action_id`) REFERENCES `completion_actions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fa_chance_fk` FOREIGN KEY (`field_area_id`) REFERENCES `field_areas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fz_chance_fk` FOREIGN KEY (`field_zone_id`) REFERENCES `field_zones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `il_chance_fk` FOREIGN KEY (`invation_level_id`) REFERENCES `invation_levels` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ip_chance_fk` FOREIGN KEY (`initial_penetration_id`) REFERENCES `initial_penetrations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `lfz_chance_fk` FOREIGN KEY (`last_field_zone_id`) REFERENCES `field_zones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `match_chance_fk` FOREIGN KEY (`match_id`) REFERENCES `matches` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `nb_chance_fk` FOREIGN KEY (`numerical_balance_id`) REFERENCES `numerical_balances` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pa_chance_fk` FOREIGN KEY (`previous_action_id`) REFERENCES `previous_actions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pc_chance_fk` FOREIGN KEY (`pentagon_completion_id`) REFERENCES `pentagon_completions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pep_chance_fk` FOREIGN KEY (`penetrating_passes_id`) REFERENCES `penetrating_passes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pfz_chance_fk` FOREIGN KEY (`penultimate_field_zone_id`) REFERENCES `field_zones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pp_chance_fk` FOREIGN KEY (`player_position_id`) REFERENCES `player_positions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ppa_chance_fk` FOREIGN KEY (`possession_passes_id`) REFERENCES `possession_passes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pt_chance_fk` FOREIGN KEY (`progression_type_id`) REFERENCES `progression_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sball_chance_fk` FOREIGN KEY (`stopped_ball_id`) REFERENCES `stopped_balls` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `st_chance_fk` FOREIGN KEY (`start_type_id`) REFERENCES `start_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chances`
--

LOCK TABLES `chances` WRITE;
/*!40000 ALTER TABLE `chances` DISABLE KEYS */;
INSERT INTO `chances` VALUES (6,0,2,2,1,'Jose Villacorta','Joaquin Oleachea',3,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-05-19 15:18:03','2018-05-23 04:54:10'),(7,1,2,10,0,NULL,NULL,3,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-05-19 15:19:07','2018-05-23 05:09:34'),(8,1,1,16,0,NULL,NULL,3,NULL,7,6,2,3,4,2,1,1,1,2,3,1,4,3,5,'2018-05-19 15:20:21','2018-05-23 05:18:00'),(9,1,1,18,0,NULL,NULL,3,NULL,2,7,2,3,4,2,2,1,1,2,3,3,3,3,1,'2018-05-19 15:21:51','2018-05-23 05:23:29'),(10,0,2,17,0,NULL,NULL,3,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-05-19 15:23:48','2018-05-23 05:19:31'),(45,1,1,2,0,NULL,NULL,5,NULL,7,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,'2018-05-19 15:59:34','2018-05-19 15:59:34'),(46,1,1,4,0,NULL,NULL,5,NULL,6,8,2,5,5,2,2,1,1,2,NULL,2,6,NULL,NULL,'2018-05-19 16:00:53','2018-05-19 16:00:53'),(47,1,1,7,0,NULL,NULL,5,NULL,7,8,2,5,NULL,2,NULL,1,NULL,NULL,NULL,1,4,NULL,NULL,'2018-05-19 16:02:21','2018-05-19 16:02:21'),(48,0,1,9,0,NULL,NULL,5,NULL,6,8,2,6,NULL,NULL,NULL,NULL,NULL,2,2,4,4,NULL,NULL,'2018-05-19 16:03:22','2018-05-19 16:03:22'),(49,1,2,11,0,NULL,NULL,5,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-05-19 16:03:49','2018-05-19 16:03:49'),(50,1,2,18,0,NULL,NULL,5,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-05-19 16:04:20','2018-05-19 16:04:20'),(51,1,2,22,0,NULL,NULL,5,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-05-19 16:04:56','2018-05-19 16:04:56'),(52,0,1,28,0,NULL,NULL,5,NULL,7,8,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,NULL,NULL,'2018-05-19 16:06:54','2018-05-19 16:06:54'),(53,1,1,30,0,NULL,NULL,5,NULL,7,8,2,5,4,NULL,NULL,NULL,NULL,NULL,NULL,3,3,NULL,NULL,'2018-05-19 16:08:48','2018-05-19 16:08:48'),(54,1,2,37,0,NULL,NULL,5,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-05-19 16:09:11','2018-05-19 16:09:11'),(55,1,2,43,0,NULL,NULL,5,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-05-19 16:10:01','2018-05-19 16:10:01'),(56,1,2,47,0,NULL,NULL,5,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-05-19 16:10:46','2018-05-19 16:10:46'),(57,1,1,50,0,NULL,NULL,5,NULL,7,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,5,NULL,NULL,'2018-05-19 16:12:13','2018-05-19 16:12:13'),(58,1,1,57,1,'Jorge Cazulo','Renzo Revoredo',5,NULL,2,8,3,4,2,3,2,1,1,2,2,3,4,NULL,NULL,'2018-05-19 16:19:34','2018-05-19 16:19:34'),(59,0,1,13,0,NULL,NULL,5,NULL,6,9,3,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,5,NULL,NULL,'2018-05-19 16:24:18','2018-05-19 16:24:18'),(60,0,1,13,0,NULL,NULL,5,NULL,6,9,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,5,NULL,NULL,'2018-05-19 16:25:18','2018-05-19 16:25:18'),(61,0,1,63,0,NULL,NULL,5,NULL,6,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,5,NULL,NULL,'2018-05-19 16:26:28','2018-05-19 16:26:28'),(62,1,1,73,0,NULL,NULL,5,NULL,8,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,4,NULL,NULL,'2018-05-19 16:27:55','2018-05-19 16:27:55'),(63,0,2,82,0,NULL,NULL,5,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-05-19 16:28:34','2018-05-19 16:28:34'),(64,1,1,83,0,NULL,NULL,5,NULL,1,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,4,NULL,NULL,'2018-05-19 16:30:42','2018-05-19 16:30:42'),(65,1,2,5,1,'Roberto Holsen','Jonier Montaño',6,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-05-19 20:39:13','2018-05-19 20:39:13'),(66,0,1,8,0,NULL,NULL,6,NULL,6,6,3,2,3,2,2,1,3,2,3,1,6,NULL,NULL,'2018-05-19 20:40:43','2018-05-19 20:40:43'),(85,1,1,45,1,'Rafael Garcia','Juan Ruiz',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-05-19 22:40:25','2018-05-19 22:40:25'),(86,1,2,5,1,'JB','JM',11,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-05-22 00:19:35','2018-05-22 00:36:09'),(87,0,1,8,0,NULL,NULL,11,NULL,4,6,3,5,4,3,2,3,2,2,3,2,5,3,8,'2018-05-22 00:39:25','2018-05-23 00:48:54'),(88,1,2,15,0,NULL,NULL,11,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-05-22 02:00:36','2018-05-23 00:48:43'),(92,0,2,70,1,'j balvin','nicky jam',11,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-05-23 00:58:01','2018-05-25 17:16:32'),(94,1,2,66,0,NULL,NULL,12,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-05-23 01:58:41','2018-05-23 01:58:41'),(95,1,2,5,1,NULL,'AAAAA',12,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-05-23 02:01:28','2018-05-23 02:01:28'),(96,0,1,45,1,'bbbbb','aaaa',12,NULL,6,7,3,6,4,3,3,3,3,2,3,3,5,6,9,'2018-05-23 03:11:11','2018-05-23 03:11:11'),(99,1,1,23,0,NULL,NULL,3,NULL,6,11,2,6,2,3,2,1,1,3,2,1,5,3,11,'2018-05-23 05:35:33','2018-05-23 05:35:33'),(100,1,2,27,0,NULL,NULL,3,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-05-23 05:39:26','2018-05-23 05:39:26'),(101,1,2,31,0,NULL,NULL,3,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-05-23 05:45:01','2018-05-23 05:45:01'),(102,1,1,39,0,NULL,NULL,3,NULL,4,1,2,1,2,1,1,1,1,2,2,1,5,3,1,'2018-05-23 05:55:08','2018-05-23 05:55:08'),(103,1,2,46,0,NULL,NULL,3,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-05-23 06:02:52','2018-05-23 06:02:52'),(104,0,1,58,0,NULL,NULL,3,NULL,7,7,2,3,2,2,2,2,1,3,3,4,2,3,1,'2018-05-23 06:06:25','2018-05-23 06:06:25'),(105,1,2,60,0,NULL,NULL,3,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-05-23 06:08:55','2018-05-23 06:08:55'),(106,1,1,61,0,NULL,NULL,3,NULL,8,9,2,5,3,2,2,1,1,2,3,2,5,3,1,'2018-05-23 06:12:23','2018-05-23 06:12:23'),(107,1,1,65,0,NULL,NULL,3,NULL,7,1,2,2,3,2,2,1,1,2,3,2,5,3,1,'2018-05-23 06:23:53','2018-05-23 06:23:53'),(108,1,2,68,0,NULL,NULL,3,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-05-23 06:27:24','2018-05-23 06:27:24'),(109,1,1,70,0,NULL,NULL,3,NULL,6,1,2,2,4,2,2,1,1,2,3,3,4,6,1,'2018-05-23 06:31:26','2018-05-23 06:31:26'),(110,1,1,74,0,NULL,NULL,3,NULL,2,12,2,5,3,2,3,2,2,3,3,1,5,3,1,'2018-05-23 06:37:39','2018-05-23 06:37:39'),(111,1,1,84,0,NULL,NULL,3,NULL,6,8,2,4,3,2,3,1,1,3,3,3,4,3,1,'2018-05-23 06:49:51','2018-05-23 06:49:51'),(112,1,1,87,1,NULL,'Jhony Olortegui',3,NULL,4,1,2,2,5,1,1,3,1,3,3,1,5,3,1,'2018-05-23 06:55:54','2018-05-23 06:56:57'),(113,0,2,89,0,NULL,NULL,3,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-05-23 06:58:37','2018-05-23 06:58:37'),(114,1,2,93,1,NULL,'Javier Bohuslav',3,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-05-23 07:10:18','2018-05-23 07:10:18'),(115,0,2,100,0,NULL,NULL,3,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-05-23 07:19:02','2018-05-23 07:19:02'),(116,1,1,2,0,NULL,NULL,7,NULL,2,9,2,4,5,1,2,1,1,3,3,1,5,4,1,'2018-05-23 21:24:53','2018-05-23 21:24:53'),(117,1,2,7,0,NULL,NULL,7,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-05-23 21:32:30','2018-05-23 21:32:30'),(118,0,1,11,0,NULL,NULL,7,NULL,7,6,3,4,3,2,3,2,1,3,3,3,2,8,10,'2018-05-23 21:41:06','2018-05-23 21:41:06'),(119,1,1,12,0,NULL,NULL,7,NULL,4,1,2,2,3,2,2,2,1,2,3,1,5,3,1,'2018-05-23 21:45:16','2018-05-23 21:45:16'),(120,1,1,17,0,NULL,NULL,7,NULL,8,8,3,4,3,1,2,1,1,3,3,5,4,1,5,'2018-05-23 23:09:25','2018-05-23 23:09:25'),(121,1,1,19,0,NULL,NULL,7,NULL,7,8,2,4,3,1,1,1,1,3,3,3,4,5,4,'2018-05-23 23:12:56','2018-05-23 23:12:56'),(122,1,1,21,0,NULL,NULL,7,NULL,7,8,2,4,4,1,1,2,1,3,3,3,2,4,1,'2018-05-23 23:21:59','2018-05-23 23:21:59'),(123,0,1,24,0,NULL,NULL,7,NULL,3,13,3,4,2,3,3,1,1,3,3,1,5,4,1,'2018-05-23 23:28:14','2018-05-23 23:28:14'),(124,1,1,27,0,NULL,NULL,7,NULL,1,10,3,5,4,1,2,1,1,3,3,4,4,3,1,'2018-05-23 23:44:42','2018-05-23 23:44:42'),(125,1,1,31,0,NULL,NULL,7,NULL,6,1,3,1,3,1,2,2,1,3,3,3,4,3,4,'2018-05-23 23:50:53','2018-05-23 23:50:53'),(126,1,1,34,0,NULL,NULL,7,NULL,1,10,3,3,3,2,2,2,1,2,2,4,4,1,1,'2018-05-24 00:09:50','2018-05-24 00:09:50'),(127,1,1,47,0,NULL,NULL,7,NULL,4,8,3,6,4,1,2,2,1,3,2,3,4,3,1,'2018-05-24 00:23:57','2018-05-24 00:23:57'),(128,1,1,50,0,NULL,NULL,7,NULL,7,8,3,4,3,1,1,1,1,3,3,1,5,6,1,'2018-05-24 00:44:47','2018-05-24 00:44:47'),(129,0,1,69,0,NULL,NULL,7,NULL,2,10,NULL,NULL,3,2,2,1,1,3,2,2,2,1,1,'2018-05-24 01:10:20','2018-05-24 01:10:20'),(130,1,1,74,0,NULL,NULL,7,NULL,1,13,3,5,2,3,3,1,1,2,2,2,4,4,1,'2018-05-24 01:17:09','2018-05-24 01:17:09'),(131,1,1,76,1,'#7','Antonio Mesacuadra',7,NULL,6,8,2,4,4,1,1,1,1,2,2,3,4,8,1,'2018-05-24 01:23:27','2018-05-24 01:23:27'),(132,1,2,80,0,NULL,NULL,7,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-05-24 01:26:45','2018-05-24 01:26:45'),(133,0,1,82,0,NULL,NULL,7,NULL,1,9,3,5,3,2,3,2,1,3,2,2,4,7,1,'2018-05-24 01:31:04','2018-05-24 01:31:04'),(134,0,2,88,0,NULL,NULL,7,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-05-24 01:37:41','2018-05-24 01:37:41'),(135,1,1,93,0,NULL,NULL,7,NULL,2,10,3,5,3,2,2,1,2,3,3,3,4,9,9,'2018-05-24 01:47:21','2018-05-24 01:47:21'),(136,0,2,3,0,NULL,NULL,15,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-05-24 17:11:39','2018-05-24 17:11:39'),(138,1,2,8,0,NULL,NULL,15,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-05-24 21:36:27','2018-05-24 21:36:27'),(139,0,1,16,0,NULL,NULL,15,NULL,4,1,2,1,4,1,2,1,1,2,2,1,5,4,1,'2018-05-24 21:47:19','2018-05-24 21:47:19'),(140,0,2,21,0,NULL,NULL,15,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-05-24 21:53:35','2018-05-24 21:53:35'),(141,0,1,23,1,'Germán Allemano','Ichiro Plasencia',15,NULL,1,9,3,5,4,1,2,1,NULL,3,2,1,5,4,1,'2018-05-24 21:57:47','2018-05-24 21:57:47'),(142,1,2,28,0,NULL,NULL,15,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-05-24 22:06:08','2018-05-24 22:06:08'),(143,1,2,36,1,NULL,'Roberto Jimenez',15,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-05-24 22:15:29','2018-05-24 22:15:29'),(144,0,1,43,0,NULL,NULL,15,NULL,1,12,2,5,4,1,1,1,1,3,2,1,5,3,1,'2018-05-24 22:28:46','2018-05-24 22:28:46'),(145,1,1,44,0,NULL,NULL,15,NULL,4,3,2,2,5,1,2,1,1,2,3,3,5,3,1,'2018-05-24 22:31:31','2018-05-24 22:31:31'),(146,1,2,45,1,NULL,'Omar Reyes (GPP)',15,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-05-24 22:33:48','2018-05-24 22:33:48'),(147,0,1,53,0,NULL,NULL,15,NULL,1,13,NULL,5,5,1,2,1,1,3,2,1,5,4,1,'2018-05-24 22:42:08','2018-05-24 22:42:08'),(148,0,2,56,1,NULL,'Enzo Borges',15,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-05-24 22:46:51','2018-05-24 22:46:51'),(149,0,1,64,0,NULL,NULL,15,NULL,2,13,3,5,5,1,3,1,1,3,3,3,3,4,4,'2018-05-24 22:55:31','2018-05-24 22:55:31'),(150,0,1,68,0,NULL,NULL,15,NULL,2,9,3,5,5,1,2,1,1,3,3,5,4,5,4,'2018-05-24 23:02:18','2018-05-24 23:02:18'),(151,1,1,70,0,NULL,NULL,15,NULL,8,9,NULL,NULL,5,1,2,2,1,3,2,1,5,3,1,'2018-05-24 23:07:33','2018-05-24 23:07:33'),(152,0,1,73,0,NULL,NULL,15,NULL,1,8,3,4,3,1,1,2,1,3,3,3,4,3,1,'2018-05-24 23:13:07','2018-05-24 23:13:07'),(153,0,1,74,0,NULL,NULL,15,NULL,7,5,3,4,4,2,2,2,1,3,2,3,4,4,4,'2018-05-24 23:17:06','2018-05-24 23:17:06'),(154,0,1,76,0,NULL,NULL,15,NULL,8,11,3,4,4,1,1,2,1,3,3,4,4,1,1,'2018-05-24 23:22:03','2018-05-24 23:22:03'),(155,1,1,78,0,NULL,NULL,15,NULL,7,5,2,4,4,1,1,1,1,2,3,3,2,7,7,'2018-05-24 23:27:48','2018-05-27 03:18:03'),(156,1,1,80,0,NULL,NULL,15,NULL,7,9,2,4,4,1,1,1,1,3,3,3,4,4,4,'2018-05-24 23:31:55','2018-05-24 23:31:55'),(157,1,1,86,0,NULL,NULL,15,NULL,7,9,2,4,4,1,1,2,1,3,2,NULL,4,5,3,'2018-05-24 23:43:17','2018-05-24 23:43:17'),(158,0,2,90,0,NULL,NULL,11,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-05-25 17:14:12','2018-05-25 17:14:12');
/*!40000 ALTER TABLE `chances` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clubs`
--

LOCK TABLES `clubs` WRITE;
/*!40000 ALTER TABLE `clubs` DISABLE KEYS */;
INSERT INTO `clubs` VALUES (1,'Universitario de deportes','http://18.188.252.113/club/z4ZDLkwWazIbVTL2FfutNkmKuWb2xKN9r6N0oj7G.png',NULL,1,'2018-05-11 03:12:34','2018-05-26 06:40:49'),(2,'Sport Loreto','http://18.188.252.113/club/bvMufKx8gSjyewmVw63dvv1Ycx3w9ekTyWRq8pIN.png',NULL,1,'2018-05-11 03:45:37','2018-05-11 04:13:34'),(3,'Sporting Cristal','http://18.188.252.113/club/YicqoVmgnd83TreMfCb56OYC9u8Yl0WNYCoLDUn8.jpeg',NULL,1,'2018-05-11 17:21:24','2018-05-19 13:26:28'),(4,'Willy Serrato','http://18.188.252.113/club/7Xtjc8EboHXGSRjDXgmh7998d5nVnhKCLphLcSqB.jpeg',2,1,'2018-05-19 13:32:46','2018-05-26 06:45:23'),(5,'Carlos Manucci','http://18.188.252.113/club/lejCS8Ku4k93lVBW2Jz3DH4mGV8k5OcZTIP9AHlm.jpeg',2,1,'2018-05-19 13:33:50','2018-05-19 13:33:50'),(6,'Deportivo Coopsol','http://18.188.252.113/club/pIqn2zmAP8vKFjucpYnU0qwDiMtGzRybBkTgDQs1.png',2,1,'2018-05-19 13:34:45','2018-05-19 13:34:45'),(7,'Sport Huancayo','http://18.188.252.113/club/udDde8aIXAsVVXU4qY8LFxZRB3wijqkw0c1n58HY.png',3,1,'2018-05-19 15:57:28','2018-05-19 15:57:28'),(8,'Los Caimanes','http://18.188.252.113/club/3HH0RymNrrN1KSmLcaFPiRdumbWWFm41uzUjw3i5.png',2,1,'2018-05-19 18:05:19','2018-05-19 18:05:19'),(9,'Santa Rosa PNP','http://18.188.252.113/club/8KoQwMozYumACirI1zTgFTrTXbnqMKaTfOzMeSII.png',2,1,'2018-05-19 18:07:09','2018-05-19 18:07:09'),(10,'Cienciano','http://18.188.252.113/club/1PYSEpGS06aQLF42XiFmWScFzwWXdYeUKaSw3PFa.jpeg',2,1,'2018-05-19 18:08:06','2018-05-19 18:08:06'),(11,'Atlético Grau','http://18.188.252.113/club/DEAnpZHYin9XpAGqfQRPPSfX6r9XrZTUU3IJ29E3.png',2,1,'2018-05-19 18:09:15','2018-05-19 18:09:15'),(12,'Sport Victoria','http://18.188.252.113/club/bJeZW2FxXr52LtbEWzO0WUAZ71YdFR76D7Y6KtTS.jpeg',2,1,'2018-05-19 18:10:07','2018-05-19 18:10:07'),(13,'Universidad Cesar Vallejo','http://18.188.252.113/club/ujHycXZDWc1dI2Kgg5chQAH6Dhzn4QMRqpbyWCpR.png',2,1,'2018-05-19 18:11:16','2018-05-19 18:11:16'),(14,'Unión Huaral','http://18.188.252.113/club/zwlxNbqNELtGQkDgsZ69xa5yybrK4Dpmp7x9Au9E.png',2,1,'2018-05-19 18:12:10','2018-05-19 18:12:10'),(15,'Juan Aurich','http://18.188.252.113/club/7VAGvWHVG2vWVFkQS1sILxJRJLh9nAj5OlsmbxBU.png',2,1,'2018-05-19 18:13:04','2018-05-19 18:13:04'),(16,'Deportivo Hualgayoc','http://18.188.252.113/club/nzn92sJYfVPKycjNqvdbSgaatPVfQASAhGwuxXMk.png',2,1,'2018-05-19 18:14:17','2018-05-19 18:14:17'),(17,'Alfredo Salinas','http://18.188.252.113/club/wo4eWoCparL9CTWInsTDVRnCrd4hiKzq7WQVQNeL.png',2,1,'2018-05-19 18:15:07','2018-05-19 18:15:07'),(18,'Alianza Atlético de Sullana','http://18.188.252.113/club/Y2GEeGXxY46I3lNlCJ6xUWzXvY31ZsbS1su0NUGG.jpeg',2,1,'2018-05-19 18:16:00','2018-05-19 18:16:00'),(19,'USMP','http://18.188.252.113/default.jpg',NULL,1,'2018-05-19 20:36:04','2018-05-19 20:36:04'),(20,'PUCP','http://18.188.252.113/default.jpg',19,1,'2018-05-19 20:37:16','2018-05-19 20:37:16'),(21,'UNMSM','http://18.188.252.113/default.jpg',19,1,'2018-05-19 20:37:26','2018-05-19 20:37:26'),(22,'UPC','http://18.188.252.113/default.jpg',19,1,'2018-05-19 22:10:43','2018-05-19 22:10:43'),(23,'Sport Boys','http://18.188.252.113/club/A6bQX7P94On0blZwALCoBI8nTCOh6G71rN93ZG9s.png',NULL,1,'2018-05-21 01:25:57','2018-05-21 01:25:57'),(24,'Alianza Lima','http://18.188.252.113/default.jpg',23,1,'2018-05-21 01:31:30','2018-05-21 01:31:30'),(25,'Sporting Cristal','http://18.188.252.113/club/KUUuCFn9l1E2tMgt8d3LKyCS9wUmXffNnzW71dxB.jpeg',23,1,'2018-05-21 01:31:49','2018-05-25 00:14:18'),(27,'Cienciano','http://18.188.252.113/default.jpg',23,1,'2018-05-25 00:40:35','2018-05-25 00:40:35');
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
INSERT INTO `completion_actions` VALUES (1,'wewrgre3g','http://18.188.252.113/default.jpg','ergr4eger4eg',0,'2018-05-11 04:53:16','2018-05-12 17:10:06'),(2,'Tiro Lejano','http://18.188.252.113/completionAction/whaJaICB3ugPmuop0B24e5IJZeveW0yF0cLHetIo.jpeg','La jugada finaliza con un tiro lejano (desviado)',1,'2018-05-12 17:10:42','2018-05-26 06:40:23'),(3,'Tiro de media distancia','http://18.188.252.113/default.jpg','La jugada finaliza con un tiro de media distancia',1,'2018-05-12 17:11:06','2018-05-12 17:11:06'),(4,'Tiro frontal','http://18.188.252.113/default.jpg','La jugada finaliza con un tiro frontal',1,'2018-05-12 17:11:31','2018-05-12 17:11:31'),(5,'Remate de cabeza','http://18.188.252.113/default.jpg','La jugada finaliza con un remate de cabeza',1,'2018-05-12 17:12:10','2018-05-12 17:12:10'),(6,'Tiro área','http://18.188.252.113/default.jpg','La jugada finaliza con un tiro al área.',1,'2018-05-12 17:12:30','2018-05-12 17:12:30'),(7,'Propia puerta','http://18.188.252.113/default.jpg','La jugada finaliza con un remate en nuestro propio arco',1,'2018-05-12 17:12:52','2018-05-12 17:12:52');
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
INSERT INTO `field_areas` VALUES (1,'Zona 1','http://18.188.252.113/fieldArea/ztqcI211tGpeoJLcCr8ewWXFcJy5vFnImXuezWhI.png','ASDFIJGHIRUHJGOIR',0,'2018-05-11 04:50:31','2018-05-12 17:32:47'),(2,'Zona 1','http://18.188.252.113/fieldArea/6vurlnrL82QuYEs4OZbuD8jnVR6oajFYvnmEb9jX.jpeg','La zona del terreno de juego del equipo rival en el inicio de la posesión se realiza en Zona 1',1,'2018-05-12 17:32:36','2018-05-26 06:36:35'),(3,'Zona 2','http://18.188.252.113/fieldArea/3zxpyq4PNCkzALiM6gIsArmH46iE1cPgzOE22HuP.jpeg','La zona del terreno de juego del equipo rival en el inicio de la posesión se realiza en Zona 2',1,'2018-05-12 17:33:12','2018-05-23 18:01:58'),(4,'Zona 3','http://18.188.252.113/fieldArea/miWdbJ6h65jbSTDmhIdpvLHwIXeR8kpO9Cq0oSOT.jpeg','La zona del terreno de juego del equipo rival en el inicio de la posesión se realiza en Zona 3',1,'2018-05-12 17:33:23','2018-05-23 18:02:09'),(5,'Zona 4','http://18.188.252.113/fieldArea/sHNLwqjtaqu4Ay2IlbiGfrqBN0aBJ8PVe5sXFyL8.jpeg','La zona del terreno de juego del equipo rival en el inicio de la posesión se realiza en Zona 4',1,'2018-05-12 17:33:33','2018-05-23 18:02:20');
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
INSERT INTO `field_zones` VALUES (1,'Z1M','http://18.188.252.113/fieldZone/9ZBZPJc1vAZJ9nTj7dlOxA06GzXV1JH4sKQibDd8.jpeg','Zona 1 Media',1,'2018-05-11 04:43:06','2018-05-26 06:34:23'),(2,'Z1LI','http://18.188.252.113/fieldZone/vbi0Ie175JJQ00tJTv8Xrw6nrrYucujtGJb54KUU.jpeg','Zona 1 lateral derecho',0,'2018-05-11 04:43:37','2018-05-11 04:44:18'),(3,'Z1LI','http://18.188.252.113/fieldZone/l2s1RmRfpBpK6Pt0xa6Y0ouivqIJPnGCppDTm2H6.jpeg','Zona 1 lateral izquierda',1,'2018-05-12 17:41:57','2018-05-19 16:34:22'),(4,'Z1LD','http://18.188.252.113/fieldZone/Q7EdUzj7xMM1HbSM9zzIe69LXs1vC1rmh1SrkbEi.jpeg','Zona 1 lateral derecha',1,'2018-05-12 17:43:26','2018-05-19 16:34:31'),(5,'Z2M','http://18.188.252.113/fieldZone/ZfDhU7BxNJk5OUMcBVEJDNybueZ0004NbdqA0phb.jpeg','Zona 2 media',1,'2018-05-12 17:43:36','2018-05-19 16:34:49'),(6,'Z2LI','http://18.188.252.113/fieldZone/ExjJNPF9lfo4I2goQ2qPHdirmTTe1Da4Eka57iPI.jpeg','Zona 2 lateral izquierda',1,'2018-05-12 17:44:10','2018-05-19 16:35:08'),(7,'Z2LD','http://18.188.252.113/fieldZone/2ApmIxcf7v2Oour5HT1HHGXSJVb7mObXVcU770Lz.jpeg','Zona 2 lateral derecho',1,'2018-05-12 17:44:27','2018-05-19 16:35:30'),(8,'Z3M','http://18.188.252.113/fieldZone/OqbtbOXCEMDGPgB2vQe1XTBskwYZOIzBwwwu91gw.jpeg','Zona 3 media',1,'2018-05-12 17:44:38','2018-05-19 16:35:39'),(9,'Z3LI','http://18.188.252.113/fieldZone/UdVwTRCJdWBbMMGJnlytgwkK5xXEf6oycAWo3tos.jpeg','Zona 3 lateral izquierdo',1,'2018-05-12 17:44:54','2018-05-19 16:35:52'),(10,'Z3LD','http://18.188.252.113/fieldZone/43Cg4aosGNmo5kIdA1GrPjdWash9MfWu189i5II8.jpeg','Zona 3 lateral derecha',1,'2018-05-12 17:45:06','2018-05-19 16:36:03'),(11,'Z4M','http://18.188.252.113/fieldZone/ErxTqYyMeaQg7y1bFKWznUhUqM8y0fN06bT8LwFc.jpeg','Zona 4 media',1,'2018-05-12 17:45:16','2018-05-19 16:36:13'),(12,'Z4LD','http://18.188.252.113/fieldZone/YmqFxFePZ1uK8apiyiSkgFlficHU3wzdS7X0G47o.jpeg','Zona 4 lateral derecha',1,'2018-05-12 17:46:22','2018-05-19 16:36:22'),(13,'Z4LI','http://18.188.252.113/fieldZone/hG6F78SskjvgYHyNFjJnNsqpIP4CYklOrnzif9sI.jpeg','Zona 4 lateral izquierda',1,'2018-05-12 17:46:38','2018-05-19 16:36:29');
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
INSERT INTO `initial_penetrations` VALUES (1,'Penetracion','http://18.188.252.113/initialPenetration/MJpbszUur56F77oeMsGPjg1K8J5nLQdxgoMxCxY6.png','asdfg',0,'2018-05-11 04:48:24','2018-05-12 15:39:47'),(2,'Penetración','http://18.188.252.113/initialPenetration/VdV6cu3CNI8nhthWeMiVtj0AsTj1Ml0AFzoLyWKk.jpeg','La acción inicial supera a uno o varios jugadores rivales.',1,'2018-05-12 15:39:11','2018-05-26 06:34:57'),(3,'No penetración','http://18.188.252.113/initialPenetration/0Rwrwj3ivcZwzU9LEmqUVNmofI6pUHvvTQwj5eYO.jpeg','La acción inicial no supera a ningún jugador',1,'2018-05-12 15:40:33','2018-05-12 15:41:36');
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
INSERT INTO `invation_levels` VALUES (1,'Zona no penetrante','http://18.188.252.113/invationLevel/N4Py7WlTduhu7G2YPUcstLVE9TmGBQsBi9zzt49c.jpeg','Nuestro ataque se ubica en zona 4 del equipo rival',1,'2018-05-11 04:51:35','2018-05-26 06:37:05'),(2,'Zona penetrante','http://18.188.252.113/invationLevel/0U8k8xtM2ovQ3bXVvRpI3LSTqFJYK4XtNoeej7GE.jpeg','Nuestro ataque se ubica en zona 2 y 3 del equipo rival',1,'2018-05-12 16:06:59','2018-05-23 18:03:06'),(3,'Zona muy penetrante','http://18.188.252.113/invationLevel/KStRnxcyWtJu7qjVrR4gmqHUXqTyqVM4hkGIcnY5.jpeg','Nuestro ataque se ubica en zona 1 del equipo rival',1,'2018-05-12 16:07:26','2018-05-23 18:03:16');
/*!40000 ALTER TABLE `invation_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matches`
--

DROP TABLE IF EXISTS `matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matches` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url_detail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `match_date` date NOT NULL,
  `home_score` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `away_score` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tournament_id` int(10) unsigned NOT NULL,
  `club_id` int(10) unsigned NOT NULL,
  `home_club_id` int(10) unsigned NOT NULL,
  `away_club_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tournament_match_idx` (`tournament_id`),
  KEY `hclub_match_idx` (`home_club_id`),
  KEY `aclub_match_idx` (`away_club_id`),
  KEY `club_match_fk` (`club_id`),
  CONSTRAINT `aclub_match_fk` FOREIGN KEY (`away_club_id`) REFERENCES `clubs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `club_match_fk` FOREIGN KEY (`club_id`) REFERENCES `clubs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `hclub_match_fk` FOREIGN KEY (`home_club_id`) REFERENCES `clubs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tournament_match_fk` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matches`
--

LOCK TABLES `matches` WRITE;
/*!40000 ALTER TABLE `matches` DISABLE KEYS */;
INSERT INTO `matches` VALUES (3,'https://www.youtube.com/watch?v=o5g-H7nnU90','2018-05-06','2','1',1,2,2,4,'2018-05-19 15:17:20','2018-05-23 04:43:48'),(5,NULL,'2018-05-12','1','0',2,3,3,7,'2018-05-19 15:58:43','2018-05-19 15:58:43'),(6,NULL,'2018-05-20','2','1',3,19,19,20,'2018-05-19 20:38:40','2018-05-19 20:38:40'),(7,'https://www.youtube.com/watch?v=qFzEmPb4Xig&t=96s','2018-05-12','1','0',1,2,5,2,'2018-05-19 20:46:07','2018-05-23 21:16:44'),(8,NULL,'2018-05-27','2','3',3,19,22,22,'2018-05-19 22:11:27','2018-05-19 22:11:27'),(9,NULL,'2018-05-22','2','1',3,19,21,22,'2018-05-19 22:14:43','2018-05-19 22:14:43'),(10,NULL,'2018-05-22','4','2',3,19,20,22,'2018-05-19 22:39:03','2018-05-19 22:39:03'),(11,'https://www.youtube.com/watch?v=3TrkEh_Af7I','2018-05-08','4','4',4,23,23,25,'2018-05-21 02:20:25','2018-05-23 03:50:40'),(12,'https://www.youtube.com/watch?v=3TrkEh_Af7I','2018-05-25','3','4',4,23,24,23,'2018-05-23 00:09:54','2018-05-23 03:51:51'),(15,'https://www.youtube.com/watch?v=TdbVnmXhv6I&t=3s','2018-05-20','2','2',1,2,2,6,'2018-05-23 04:41:59','2018-05-24 23:44:01'),(17,NULL,'2018-05-25','2','3',3,19,19,20,'2018-05-25 17:41:08','2018-05-25 17:41:08');
/*!40000 ALTER TABLE `matches` ENABLE KEYS */;
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
INSERT INTO `oauth_access_tokens` VALUES ('011402b473c61e5a5fceef7837f188f618aa4ab800ea3c59b82dea9343cd3564478050e8b8da4df9',5,2,NULL,'[\"user\"]',0,'2018-05-26 09:16:30','2018-05-26 09:16:30','2019-05-26 09:16:30'),('023eed0fee55181f0a2c058a8c43ea15e60e8ac9cf504473df449ffa60692044590f36d49a5b5560',2,2,NULL,'[\"user\"]',0,'2018-05-23 03:48:02','2018-05-23 03:48:02','2019-05-23 03:48:02'),('0442d0e772283f1a6ad05d8312e7a680de1b9f995956f5a9e03f9df155af1c735c75f80c0cb0ab2e',2,2,NULL,'[\"user\"]',0,'2018-05-19 14:58:08','2018-05-19 14:58:08','2019-05-19 14:58:08'),('04a2077a3698a1d4ec69417294962f8e99352d0bc1d7f947267721808249f8ffb71e247ea0eb38c0',4,2,NULL,'[\"user\"]',0,'2018-05-25 17:39:29','2018-05-25 17:39:29','2019-05-25 17:39:29'),('05e2ce142de7456344746eaddd09588a1321516e0ea57d41e27292f8b7d0c5055271c3d1c742b26e',2,2,NULL,'[\"user\"]',0,'2018-05-22 03:31:49','2018-05-22 03:31:49','2019-05-22 03:31:49'),('0d0591549d1b9552942e9feb6cd47618cee09a6abf56325a32b94a2fb59f96808df3f0a41b44d7e2',1,2,NULL,'[\"admin\"]',0,'2018-05-27 19:37:11','2018-05-27 19:37:11','2019-05-27 19:37:11'),('1266fe4d8096e976c76cb71718a19e0aa91cd7dd012f85eee357c8e9e0542f4749a1fa1e5dc0cfb6',1,2,NULL,'[\"admin\"]',0,'2018-05-24 19:44:16','2018-05-24 19:44:16','2019-05-24 19:44:16'),('141914c1dbaee97ebd2b2e3ce5b4df9a6d5f8eadd52020fdea66932fed2a7b9340866c3ecaef8f44',2,2,NULL,'[\"user\"]',0,'2018-05-23 18:21:42','2018-05-23 18:21:42','2019-05-23 18:21:42'),('177c587af70a22682d9d4f395fd17221f57cb1bcc1f8eab4db18edb0eebf47d1122c99fd44a909cb',2,2,NULL,'[\"user\"]',0,'2018-05-22 03:19:15','2018-05-22 03:19:15','2019-05-22 03:19:15'),('198d3a50c55ba0ca666e13582aaeaf0bce794ce112b0a3f9fcfce52005987f518ad019f518b26110',2,2,NULL,'[\"user\"]',0,'2018-05-19 20:35:35','2018-05-19 20:35:35','2019-05-19 20:35:35'),('1cafb7ece069fd54673bb97d907669a99abe667f1f0f666b1adacea0f38e7beaf099faae7d8cb79f',1,2,NULL,'[\"admin\"]',0,'2018-05-19 20:34:41','2018-05-19 20:34:41','2019-05-19 20:34:41'),('1e4047336d30f203803f90d7087b9862681e366dec3c428b0dd7a5a4b58d02601dc11219c44a6ca1',6,2,NULL,'[\"user\"]',0,'2018-05-27 19:54:30','2018-05-27 19:54:30','2019-05-27 19:54:30'),('1e85901fbc0c12e56583f156d0879d4c626b8f9eb560409a0e0ae2ec75c08b9757eae1b721cfbd13',1,2,NULL,'[\"admin\"]',0,'2018-05-26 09:10:15','2018-05-26 09:10:15','2019-05-26 09:10:15'),('21a59185cbf8f8cd9f54377b633cfa956e969dbcd8d51716d8edf8fafc8dc421e03c69acb1c57e59',1,2,NULL,'[\"admin\"]',0,'2018-05-11 17:26:43','2018-05-11 17:26:43','2019-05-11 17:26:43'),('22aa55c5b326b1cae3d345d6ae09805ae9b963afb0bb2abc940f4c6d9ffa1a19612d0f747a27193e',2,2,NULL,'[\"user\"]',0,'2018-05-24 19:49:49','2018-05-24 19:49:49','2019-05-24 19:49:49'),('24919a9c11679078c5866526b3597e1cb68ade1f80d24c6278e25c8c6ae69a38dd5259d0ffa9677d',1,2,NULL,'[\"admin\"]',0,'2018-05-22 03:16:45','2018-05-22 03:16:45','2019-05-22 03:16:45'),('25d0664262197f0247bd9be1624c0cb21dd8620f311177e141c7573dba213138621a52bfc2a0ed1e',1,2,NULL,'[\"admin\"]',0,'2018-05-11 17:27:18','2018-05-11 17:27:18','2019-05-11 17:27:18'),('26961827d5b221617d5a8069f95ca9093f6747f5a750b4ca75d6dffb5bff0833ac2a546c2d0c857c',3,2,NULL,'[\"user\"]',0,'2018-05-25 05:11:50','2018-05-25 05:11:50','2019-05-25 05:11:50'),('292ec7e765481e197c9d257fab225cd5ecd008868cf13f8322b7b6deb9941013d287e12a08c0e676',5,2,NULL,'[\"user\"]',0,'2018-05-24 00:43:50','2018-05-24 00:43:50','2019-05-24 00:43:50'),('2df6aefde121cb6561d19de86711ce75cd9331518e0e936c64e80c0cd53b63b9767e5e5473acb0ca',1,2,NULL,'[\"admin\"]',0,'2018-05-19 05:31:05','2018-05-19 05:31:05','2019-05-19 05:31:05'),('32760a66aaa31e8f5d9d5eef01641cb226ac3a696b572ddc7577bc5b7d4ca4ad3e86f2e990344a6a',5,2,NULL,'[\"user\"]',0,'2018-05-26 09:13:57','2018-05-26 09:13:57','2019-05-26 09:13:57'),('341b7196dd27487110bd858179796a85eb5039cede799564415b1dc9e84970b6453c113f031365e0',1,2,NULL,'[\"admin\"]',0,'2018-05-21 01:24:44','2018-05-21 01:24:44','2019-05-21 01:24:44'),('35a5c53c1bca0d2e84e65b63ebcfbca2c25ba57635db7c90b88b533f7420089953f25e35edd18a30',3,2,NULL,'[\"user\"]',0,'2018-05-22 03:30:14','2018-05-22 03:30:14','2019-05-22 03:30:14'),('36bfcf8ee93f0dea393b0a08df154c843ca163d5506a3fe384911307519689cbbd57f516e0add80a',3,2,NULL,'[\"user\"]',0,'2018-05-19 15:56:28','2018-05-19 15:56:28','2019-05-19 15:56:28'),('3a0d3723bcc75f4241a04118a9d1c0001607a6c9668a5a258f17383557e4f958f9a53aa26ce7089d',6,2,NULL,'[\"user\"]',0,'2018-05-27 04:22:38','2018-05-27 04:22:38','2019-05-27 04:22:38'),('3b8d252768be63c0e402bd8e330c621f6d02b586c03efd570ec0bf657de67667a9b06e92a0e84f69',8,2,NULL,'[\"user\"]',0,'2018-05-25 05:15:53','2018-05-25 05:15:53','2019-05-25 05:15:53'),('3de64ce673a423c395e8fd6c204d94e93aa2a5113269ce7f1acd2528aea1898af08afd69aaf7f5a9',4,2,NULL,'[\"user\"]',0,'2018-05-19 22:09:39','2018-05-19 22:09:39','2019-05-19 22:09:39'),('3e1a1503213342ce3fd2c5ed9f3d54d51525e9063d48f6ed3495915486fca75de44ce887c6d9efa3',1,2,NULL,'[\"admin\"]',0,'2018-05-23 01:29:08','2018-05-23 01:29:08','2019-05-23 01:29:08'),('4077f17303761c48cfaa79364eb4aff5a0c93d7e94cf2eec7910cdb820dec0ae6c20b743c580dd35',6,2,NULL,'[\"user\"]',0,'2018-05-25 05:04:50','2018-05-25 05:04:50','2019-05-25 05:04:50'),('440bade5b6c568a40fc8c256d96953c451caddbd1473cea0571a6bfbb69a9f7718d27a4e4bbe937d',1,2,NULL,'[\"admin\"]',0,'2018-05-25 20:48:10','2018-05-25 20:48:10','2019-05-25 20:48:10'),('4538377e1766211e533ed9f82301ded5962b98308ab99c3994dc157c282c02d7bd7b78b6703fe18b',3,2,NULL,'[\"user\"]',0,'2018-05-25 01:50:28','2018-05-25 01:50:28','2019-05-25 01:50:28'),('47f157c3d40cb0de49a647fe9e3c71431199b8f1840976048fd4df45ebdbdf05301005738fff8c78',1,2,NULL,'[\"admin\"]',0,'2018-05-25 05:28:42','2018-05-25 05:28:42','2019-05-25 05:28:42'),('4856b54d34e2cebfe0c62809cd3b96dd05d3b7052fd6d59a0fef88393291c170862d748493fb92c7',1,2,NULL,'[\"admin\"]',0,'2018-05-19 16:32:25','2018-05-19 16:32:25','2019-05-19 16:32:25'),('49daebfad4e724f9cc1acee4008160af43cdff0b9f302149a74ae77e6d91fc94d3a4d3bbb2478606',1,2,NULL,'[\"admin\"]',0,'2018-05-19 15:55:50','2018-05-19 15:55:50','2019-05-19 15:55:50'),('4a5b7fe8937d2e063313a032504089e0689398588d0d818be6c4ddc1d8e9130f68ec9b33145bf91c',2,2,NULL,'[\"user\"]',0,'2018-05-24 19:27:58','2018-05-24 19:27:58','2019-05-24 19:27:58'),('4b6bbdc92aabccd9ee529bbbfbe8178f2cdf6ecc5caf9c56a37c265c69033fca4c5f79b19bba6d66',1,2,NULL,'[\"admin\"]',0,'2018-05-26 09:11:15','2018-05-26 09:11:15','2019-05-26 09:11:15'),('4b836a3766014fbcd8b5dd1cf2a7019c5f168f66b6b417f746f2baec145ad28f26734c252e2bc71d',1,2,NULL,'[\"admin\"]',0,'2018-05-26 06:31:54','2018-05-26 06:31:54','2019-05-26 06:31:54'),('4b89732f8294c5e899c37dc69144a6514b88f00ead5966d26b2483292457f5176f5291f0c742b0b4',2,2,NULL,'[\"user\"]',0,'2018-05-23 03:57:41','2018-05-23 03:57:41','2019-05-23 03:57:41'),('4e213fb17c18a499eb8534dea22aa4520fa203814b22e10877ccaa9f0c926f7c1d7e415211b4eead',2,2,NULL,'[\"user\"]',0,'2018-05-19 13:27:47','2018-05-19 13:27:47','2019-05-19 13:27:47'),('508945a18eac7b229669f6c3a126b22da4af8be3be1eaff187185e719629e5f14977d4485d845ac2',1,2,NULL,'[\"admin\"]',0,'2018-05-22 03:29:47','2018-05-22 03:29:47','2019-05-22 03:29:47'),('512e13e5b61efb66d2cfc6ced378bf743a58ffb3e34e8f0768454052e9038a346ca5e941ee42dba8',8,2,NULL,'[\"user\"]',0,'2018-05-25 05:15:35','2018-05-25 05:15:35','2019-05-25 05:15:35'),('51df0c27e08c9702d45f4cb4c577ffabc4712dd2e218e8bfd724dcdab2f10a3d82a0075c4a8210ae',2,2,NULL,'[\"user\"]',0,'2018-05-22 16:39:33','2018-05-22 16:39:33','2019-05-22 16:39:33'),('56507bb8d5bc58d5b7ca5fc111e9d55cd97bc77ecde5d7aa29c59d279d1c709233a7ad8d71284786',3,2,NULL,'[\"user\"]',0,'2018-05-25 05:16:00','2018-05-25 05:16:00','2019-05-25 05:16:00'),('574710751040e9f5d6b428e57cd6e998c3af911460935e87b8cc5e6821ac2c6d3e20127337bfd7ea',1,2,NULL,'[\"admin\"]',0,'2018-05-24 20:24:11','2018-05-24 20:24:11','2019-05-24 20:24:11'),('5986563c8660dce44b78076d21cc6133e65b4945f7a38ade0cb248e74b9e4a26f85d79d1455b24a7',1,2,NULL,'[\"admin\"]',0,'2018-05-19 21:20:11','2018-05-19 21:20:11','2019-05-19 21:20:11'),('5a995b2521c6b470f4d048211b8e56f81aedaa46ccea2c029a09465d56de3e9a2dc408bdf97c0116',2,2,NULL,'[\"user\"]',0,'2018-05-29 05:23:59','2018-05-29 05:23:59','2019-05-29 05:23:59'),('5f82b4606dc5745d673dd5643f85695e9f3f8d6baf68210c4485186eb50f8d73f0c3a976e4f807a8',1,2,NULL,'[\"admin\"]',0,'2018-05-26 23:40:52','2018-05-26 23:40:52','2019-05-26 23:40:52'),('6049bd86bb5a0244a41dc6887f2f6b7da1169396afc2ece509b788db627382501d749d4c96148ff2',2,2,NULL,'[\"user\"]',0,'2018-05-26 10:16:26','2018-05-26 10:16:26','2019-05-26 10:16:26'),('605e3847a0bf712020e52194944e03c1d0d8706f77a4b1e6df62e41f66f10e2ee6bd7bfb4680abd1',1,2,NULL,'[\"admin\"]',0,'2018-05-11 17:44:40','2018-05-11 17:44:40','2019-05-11 17:44:40'),('6296c0ed83ccf7567fee7572bdbc73f80394612ddbc0cdf4c75605ae69b57f1a404ed5efb9460540',1,2,NULL,'[\"admin\"]',0,'2018-05-23 15:35:03','2018-05-23 15:35:03','2019-05-23 15:35:03'),('62c6b3af1c2e8f9718c01cd3801e1205800b09c34d472320f72f70cd0bde8ed8b8d8c83362523027',3,2,NULL,'[\"user\"]',0,'2018-05-19 16:36:43','2018-05-19 16:36:43','2019-05-19 16:36:43'),('6410bc77c9ad75cc9e19ee2bdecac357c9f3c823e8067f893cc6f9bd7f7fe0e6852efa11dafb1356',6,2,NULL,'[\"user\"]',0,'2018-05-26 23:32:19','2018-05-26 23:32:19','2019-05-26 23:32:19'),('64c8b9ca2613af1773935ee7470f292c5a0d8f67a07e0f21576fba5012fffde8cbbd80c964af014e',2,2,NULL,'[\"user\"]',0,'2018-05-23 03:56:35','2018-05-23 03:56:35','2019-05-23 03:56:35'),('64da03411b304a89906ab7a3160560745ea73afbe7e873af4759a472137f1ee004c0b3e32cc22f7f',1,2,NULL,'[\"admin\"]',0,'2018-05-22 00:52:40','2018-05-22 00:52:40','2019-05-22 00:52:40'),('659c5ff5bf25d22e3d99cec11258baeb0ee7fe9e29963301ac2088326d6a694e09fe45624310cd49',9,2,NULL,'[\"user\"]',0,'2018-05-28 02:58:27','2018-05-28 02:58:27','2019-05-28 02:58:27'),('65f2bdaa41aa9b084157b237afe9656892d3f8200a69cdd57990203cc18d359980bc5cfb1ecf5a4f',1,2,NULL,'[\"admin\"]',0,'2018-05-22 03:15:47','2018-05-22 03:15:47','2019-05-22 03:15:47'),('667c42d7d8ab819faeee15dc25f092ec7d5139ebeb42aa41206b1593fac720a60a47bfaa7ec14110',4,2,NULL,'[\"user\"]',0,'2018-05-25 16:58:55','2018-05-25 16:58:55','2019-05-25 16:58:55'),('66929489c4de1e1702215b616d4584203b448bcfa63cb800a2f77b92738201707ce8a040e901a052',6,2,NULL,'[\"user\"]',0,'2018-05-29 01:32:05','2018-05-29 01:32:05','2019-05-29 01:32:05'),('69fe15660a321ad7afc39dccf03eb65375c9eff561c917d3ae449b8e74d565c94e3b3944a513713f',5,2,NULL,'[\"user\"]',0,'2018-05-26 09:15:58','2018-05-26 09:15:58','2019-05-26 09:15:58'),('6c5f1d3f850dc223c8469fec2d6341ddf78b87978848117217055961dec5df850bfd4f20486c89c8',6,2,NULL,'[\"user\"]',0,'2018-05-27 03:09:03','2018-05-27 03:09:03','2019-05-27 03:09:03'),('7160ff345d6233b580ef5466871f110568759b8ab2b9afd5471cf2d6d49600ba60df6ed3aaef0b80',5,2,NULL,'[\"user\"]',0,'2018-05-23 03:52:22','2018-05-23 03:52:22','2019-05-23 03:52:22'),('726803e8a8db66d836a5aa8ad8f6d59a570f82fed6a9ef9f4bd7a5a2ef03bb62f3a1fe044da50ea9',2,2,NULL,'[\"user\"]',0,'2018-05-24 04:22:08','2018-05-24 04:22:08','2019-05-24 04:22:08'),('7490b2457eaa1d8a27bb51330f1d5d41836785ab7797a8d4ccafe43e766507b7d581deb933912dfe',6,2,NULL,'[\"user\"]',0,'2018-05-26 08:41:55','2018-05-26 08:41:55','2019-05-26 08:41:55'),('750a38afdf2c5f04cc2ace440a7f4c24546403072b43bd7a4dc2d8b8ce34abe2e81895b80add9747',5,2,NULL,'[\"user\"]',0,'2018-05-21 01:31:03','2018-05-21 01:31:03','2019-05-21 01:31:03'),('76625396bfd0032977ccab79f70c2796c85ac3c77cd2f689f0793ea9c396c48d28b93c885f7742ff',5,2,NULL,'[\"user\"]',0,'2018-05-22 02:53:45','2018-05-22 02:53:45','2019-05-22 02:53:45'),('77832a0bde30a1ed9441ef32c143418841e28b677b0a9d62f2243e80297b8d3fac8cac807695cae2',1,2,NULL,'[\"admin\"]',0,'2018-05-26 09:08:55','2018-05-26 09:08:55','2019-05-26 09:08:55'),('7838e13e9ee3946808801558333b9726d8d2f892ec1d3b0f5a09ab493d6aec356f3e99c5537ed9b6',5,2,NULL,'[\"user\"]',0,'2018-05-26 00:16:06','2018-05-26 00:16:06','2019-05-26 00:16:06'),('79f84fc6343ddda99ae863c6c6a6a683289a4ee209cc02dc4a8f0d0c7cda4f6938aaa6aa02b7a5b3',1,2,NULL,'[\"admin\"]',0,'2018-05-25 05:04:23','2018-05-25 05:04:23','2019-05-25 05:04:23'),('7d885d7f8c78e658c515085dfe78a2f1a69f98e521328099a14c5ad7f0581c6d8bd85569efc3c482',1,2,NULL,'[\"admin\"]',0,'2018-05-12 20:39:57','2018-05-12 20:39:57','2019-05-12 20:39:57'),('7f08cccacc3908a5db84200da869797e0bf9f3d528e64711df269e2d21aa039c0aab1f747a143648',1,2,NULL,'[\"admin\"]',0,'2018-05-26 09:16:07','2018-05-26 09:16:07','2019-05-26 09:16:07'),('80770cef897dc53f8f5dbf044bf1239d267be7a842abca2327c5c87d5161cf4b346111ec91d0ecd0',3,2,NULL,'[\"user\"]',0,'2018-05-26 06:49:42','2018-05-26 06:49:42','2019-05-26 06:49:42'),('80cb8bc32a09b387c00e462312ace750bc5c81301aab6b6a8f2ecb3396984049e7624a8cd5ccb242',3,2,NULL,'[\"user\"]',0,'2018-05-19 22:09:14','2018-05-19 22:09:14','2019-05-19 22:09:14'),('83c728962e89c6cd1da1c3f9f667f507b0ba603b5ff4cc957adc5633db6c2834ca5502b9a6b2e0fd',5,2,NULL,'[\"user\"]',0,'2018-05-26 09:03:26','2018-05-26 09:03:26','2019-05-26 09:03:26'),('843251aee17e8a1a95598eca46d99daf34c9856449485b19107b4c652086148c96cd672d39a6f02e',6,2,NULL,'[\"user\"]',0,'2018-05-29 03:33:42','2018-05-29 03:33:42','2019-05-29 03:33:42'),('84ae01a6e10caa043f55a4216ba2fed6bf9fbd7c691fedac8864b36492fff79572e16f0528012bd6',2,2,NULL,'[\"user\"]',0,'2018-05-19 15:11:38','2018-05-19 15:11:38','2019-05-19 15:11:38'),('8588f142d2bd1e355e7cc094763dc32a6720b9761a813643a6f1ca249ce03bef8a31a175f9610fb4',1,2,NULL,'[\"admin\"]',0,'2018-05-25 05:17:50','2018-05-25 05:17:50','2019-05-25 05:17:50'),('867590baa24f1d5ba1937ebbafb274b84c652f960b98408d0b3f077d4fd555ecea4ad519ab1ef367',4,2,NULL,'[\"user\"]',0,'2018-05-19 20:36:52','2018-05-19 20:36:52','2019-05-19 20:36:52'),('868f068e54e50f1db99e0930c3c4298a7284b904171bb23e099184532ba5744f04166f362d1308d1',1,2,NULL,'[\"admin\"]',0,'2018-05-26 09:10:55','2018-05-26 09:10:55','2019-05-26 09:10:55'),('8764d1505cd23232aa9f32e9c0b9ccd083e899e5538a21e5209e61e01f506244a7a7a13404a1f4bf',6,2,NULL,'[\"user\"]',0,'2018-05-26 14:48:58','2018-05-26 14:48:58','2019-05-26 14:48:58'),('87d7c612b88909480290ede54068e6d28d52f45bda3316c70263a0f882b157d073599e5566641aa3',1,2,NULL,'[\"admin\"]',0,'2018-05-26 09:05:47','2018-05-26 09:05:47','2019-05-26 09:05:47'),('8b932072aa328eaee236f032efaa83ee7f6c223b2e747d414d6a81953a83c295462bd47722b9e2f6',2,2,NULL,'[\"user\"]',0,'2018-05-24 21:13:31','2018-05-24 21:13:31','2019-05-24 21:13:31'),('909719bcee234baf22032badb70759dd75790e9691588b377fcb2fcd7ec9ac622f2504524367f1a5',6,2,NULL,'[\"user\"]',0,'2018-05-28 01:34:31','2018-05-28 01:34:31','2019-05-28 01:34:31'),('93c165d721e342d5c7fc5607cfaad756d56f35baf8eb97df2f1ef5ca59dbafe5d7f5e956fe10dc9c',1,2,NULL,'[\"admin\"]',0,'2018-05-26 06:32:24','2018-05-26 06:32:24','2019-05-26 06:32:24'),('943cb6d54923ced1e8817cbe81504dbc8e6da0aa06fd1c465806bf671ab1cbd8b54bc77c08fbc577',5,2,NULL,'[\"user\"]',0,'2018-05-22 00:54:13','2018-05-22 00:54:13','2019-05-22 00:54:13'),('9ce4a3bf15a4580caf4cebd9b3bfde868927b983e5334ee974a1fc369d1951fb9b2097efbe960385',1,2,NULL,'[\"admin\"]',0,'2018-05-23 18:05:45','2018-05-23 18:05:45','2019-05-23 18:05:45'),('9eeb4c5aaba1d51e9509fe2170dc18893ff753e42a6bc6bb11e30ae50db74c4752f31c57695927cd',1,2,NULL,'[\"admin\"]',0,'2018-05-26 06:32:25','2018-05-26 06:32:25','2019-05-26 06:32:25'),('a1aeed5620b3fdcd163aa8e47b4a7eab0bbc6e2d579cc5bc63f2888c92556b04b2d69bd89f0c5817',1,2,NULL,'[\"admin\"]',0,'2018-05-11 17:20:32','2018-05-11 17:20:32','2019-05-11 17:20:32'),('a5457b2ef4be0bbb0d55e076b2debaa97aa0791fbfdc2da603297044ad47fa5a7a5a3ed8b4c91b4c',1,2,NULL,'[\"admin\"]',0,'2018-05-29 16:45:59','2018-05-29 16:45:59','2019-05-29 16:45:59'),('a7643685689319184dc946bf27556c36bca18af75b64fd0e852ebb6c46b13cdd65bf2aaba48b1513',4,2,NULL,'[\"user\"]',0,'2018-05-25 17:38:02','2018-05-25 17:38:02','2019-05-25 17:38:02'),('a846466d95c460626ccced9e16f7fcfc6175c6fa19205a13df675e202879e93277c5f91b1c026ba7',1,2,NULL,'[\"admin\"]',0,'2018-05-12 20:13:29','2018-05-12 20:13:29','2019-05-12 20:13:29'),('a9a03002fd9ed726e57eee67fee16de510966cf366a52b0f9d2f46f4894b8f4a44d63cd94eeb340b',2,2,NULL,'[\"user\"]',0,'2018-05-26 09:32:12','2018-05-26 09:32:12','2019-05-26 09:32:12'),('ab61d17b99093badc7f5ab516e7451d4cc4506afadeeed640925f8cf8161dc26afa437badbaaa721',5,2,NULL,'[\"user\"]',0,'2018-05-26 09:11:05','2018-05-26 09:11:05','2019-05-26 09:11:05'),('ab75e890caac7e21f6d21955ebea54a5427331acd5d87ec25eec8f506f89fd69002eb6884675bbd3',4,2,NULL,'[\"user\"]',0,'2018-05-25 19:11:15','2018-05-25 19:11:15','2019-05-25 19:11:15'),('abf663c70cfb51be7f69ced17d84ff89cceacc0b4af8ff62eb0b41260f7a43584911b395512851e8',2,2,NULL,'[\"user\"]',0,'2018-05-25 23:59:43','2018-05-25 23:59:43','2019-05-25 23:59:43'),('af05b8e5c39a8561e3af94a43870078db4bfc1e760034c570c0ad3413f820c1dc8e8ee6201baa0c0',6,2,NULL,'[\"user\"]',0,'2018-05-26 06:52:58','2018-05-26 06:52:58','2019-05-26 06:52:58'),('b2467890718f1a2d27da80ab44e86b5bafdef311e5b0866f73ebf160db879a0613259c75b7a58629',9,2,NULL,'[\"user\"]',0,'2018-05-28 01:41:39','2018-05-28 01:41:39','2019-05-28 01:41:39'),('b36925b3431778b8a06a84b0f33b5a43ecf1ea591bf2521c503ca0d41815b7806f1993cb8b8f0218',6,2,NULL,'[\"user\"]',0,'2018-05-26 14:48:01','2018-05-26 14:48:01','2019-05-26 14:48:01'),('b3e6784c11c913bae1cfb3d56f50582925cd863cdc7fd7803f069bfbc33c0d6a84fd73a389384788',2,2,NULL,'[\"user\"]',0,'2018-05-19 15:10:42','2018-05-19 15:10:42','2019-05-19 15:10:42'),('b3f707ccf74fa987f9e76bb5ca65dd5c8746e9f4e250be46bc89190b77ae9d5bfe62d574fd917264',1,2,NULL,'[\"admin\"]',0,'2018-05-26 09:13:43','2018-05-26 09:13:43','2019-05-26 09:13:43'),('b540c11ff1bd630b6bdac148502573fdf8362b78d29efc62f96097d70daa877a9683474c6bd3d6f5',5,2,NULL,'[\"user\"]',0,'2018-05-23 03:53:06','2018-05-23 03:53:06','2019-05-23 03:53:06'),('b5f22bc1d7c5e86a2a5876c7bdc589f535a22017c7fdd2faa484bbcb7971809cbf229cf1573bf9e4',1,2,NULL,'[\"admin\"]',0,'2018-05-26 09:14:16','2018-05-26 09:14:16','2019-05-26 09:14:16'),('ba465f58a17ee0b3be785a95de7c9c195b3140a780ae676447e0b5d6115e6bcd051698bb07d6a86e',5,2,NULL,'[\"user\"]',0,'2018-05-23 03:01:51','2018-05-23 03:01:51','2019-05-23 03:01:51'),('bc3c2f19942dce5e3f78ee3b5b5f193826056ff11012a3dcfade28d8b8bcd3c351449b30c974282d',1,2,NULL,'[\"admin\"]',0,'2018-05-24 00:42:47','2018-05-24 00:42:47','2019-05-24 00:42:47'),('bedfaf57baae5140328370870ce74bf581dc2dd9db080ab51d6861e663ce0614695be9eed8e0207b',1,2,NULL,'[\"admin\"]',0,'2018-05-26 09:16:42','2018-05-26 09:16:42','2019-05-26 09:16:42'),('c072108b75b6a6d298f778df4c5968d464609b134161f5dd87b41d0b996eae4153c14a010a8b04e5',6,2,NULL,'[\"user\"]',0,'2018-05-28 18:39:09','2018-05-28 18:39:09','2019-05-28 18:39:09'),('c104197d73f6159a8f830fd7749f1e407c1c3480a6fdb7b43bc19e9ca114bbd0c4493b30ab392e6a',1,2,NULL,'[\"admin\"]',0,'2018-05-28 01:40:39','2018-05-28 01:40:39','2019-05-28 01:40:39'),('c127ae2e26fcd7cd8c7205febc2fd71eb99be188c0afb67ac91f3e946d77f12c083c16f157d36c16',1,2,NULL,'[\"admin\"]',0,'2018-05-12 14:54:55','2018-05-12 14:54:55','2019-05-12 14:54:55'),('c462be85ddfcc0792974aa2017571d0c426f80604a758445abcc331679e4e127bc7e6eed2f8bf0d8',1,2,NULL,'[\"admin\"]',0,'2018-05-22 03:29:51','2018-05-22 03:29:51','2019-05-22 03:29:51'),('c5104bc3a3da07ca6f7d5a87d608e4c36d8d302f4bbd51cdf5e667cd25aef7de8bc12ef50f7c92de',9,2,NULL,'[\"user\"]',0,'2018-05-29 16:48:23','2018-05-29 16:48:23','2019-05-29 16:48:23'),('c5b89e85215924f9892f05fd44cf018148a0adf29bcbb71162ea6a9d85b8c213df7a7e3a7976d22e',3,2,NULL,'[\"user\"]',0,'2018-05-28 18:36:30','2018-05-28 18:36:30','2019-05-28 18:36:30'),('c6d6cad138f785d7b84487c28b2655a304a64432405c7df1810ace8f0e71915b6129e49336873d3a',1,2,NULL,'[\"admin\"]',0,'2018-05-11 17:25:57','2018-05-11 17:25:57','2019-05-11 17:25:57'),('cbab6ce7bf759729fef718d59bcc36219f9edf3670160d644280964040505d08ffdd17e5f20acef1',1,2,NULL,'[\"admin\"]',0,'2018-05-23 13:25:19','2018-05-23 13:25:19','2019-05-23 13:25:19'),('cf145a8c91d95e34587bc016ffbfdb3f528076238d1f7f4d0a3268d29a0bdc2ae2cb08824ff5f4fb',1,2,NULL,'[\"admin\"]',0,'2018-05-11 03:24:15','2018-05-11 03:24:15','2019-05-11 03:24:15'),('d1aa012706f50ff99d66da3d7b5d9480dda051fb69b64011818bb016f46c9a29ad98c518ad29d946',2,2,NULL,'[\"user\"]',0,'2018-05-25 02:47:14','2018-05-25 02:47:14','2019-05-25 02:47:14'),('d3a8d25ff8b5ffe79eda5dd19c6d53c3b9a1b68d79a07ac1cc9e369fce71f66a3fc980e6f6ed4363',1,2,NULL,'[\"admin\"]',0,'2018-05-19 20:33:15','2018-05-19 20:33:15','2019-05-19 20:33:15'),('d5ca2a9db907a9134e91a9ab3ba9cf295b6c63c35f18df091adc272320501b0d35f7320cc7a02e9e',2,2,NULL,'[\"user\"]',0,'2018-05-23 13:25:12','2018-05-23 13:25:12','2019-05-23 13:25:12'),('da0ce5ec1518cc8fedd2b59c3bdbb54f317a90bd5f892e52713215f7179e0a35f49e2e320c8f7a0a',2,2,NULL,'[\"user\"]',0,'2018-05-19 20:45:09','2018-05-19 20:45:09','2019-05-19 20:45:09'),('da910f74ed61c8b67e6c4a6b1138721d1b156ad3468b160335517293f94413f277c3f4c4737e1621',6,2,NULL,'[\"user\"]',0,'2018-05-25 05:18:05','2018-05-25 05:18:05','2019-05-25 05:18:05'),('dba31277213be21bb464201e031aadc705f6b76da25327715440c75c9caf44743db946e651f3db5e',6,2,NULL,'[\"user\"]',0,'2018-05-28 18:24:33','2018-05-28 18:24:33','2019-05-28 18:24:33'),('dbee6544d7aa04a76d298a3098e2ab6b501c33c3d0b7caaa2486531c042af0450e839d41d97774b7',6,2,NULL,'[\"user\"]',0,'2018-05-28 03:15:44','2018-05-28 03:15:44','2019-05-28 03:15:44'),('dd31a3b4a435a8eeb2a10245ed297ceb5a683d45c0fa46e89c559dc0d7caafefbac8291c48350418',2,2,NULL,'[\"user\"]',0,'2018-05-26 06:42:07','2018-05-26 06:42:07','2019-05-26 06:42:07'),('ddb393b5d9e478c8b00951e98b9f638a78319fbe91695f85f4fef2fd7b60408f6738b25d3580c3b6',2,2,NULL,'[\"user\"]',0,'2018-05-19 16:43:55','2018-05-19 16:43:55','2019-05-19 16:43:55'),('df6fe76abc008e97fed86fd8a4271cf2f7ae4d75134b87155fddf310f7bf12a9802c598a807a47fe',1,2,NULL,'[\"admin\"]',0,'2018-05-19 20:35:52','2018-05-19 20:35:52','2019-05-19 20:35:52'),('df8873349c84d3beddb889f27fb1b24c62531ac785ef6d9392bd84943a7530dea0b437b047bac468',1,2,NULL,'[\"admin\"]',0,'2018-05-22 03:25:24','2018-05-22 03:25:24','2019-05-22 03:25:24'),('e21223f5922395ca9477528225fda74f34c96bb99bdc4390ed70d9e25506da95a544acb9ff99dfc9',3,2,NULL,'[\"user\"]',0,'2018-05-19 18:47:28','2018-05-19 18:47:28','2019-05-19 18:47:28'),('e6cdfb9294959db63b1b512bfbe8bbcbbf2fd4c73b54b70b28b1c924a9095b93879c7b88e2d82604',5,2,NULL,'[\"user\"]',0,'2018-05-26 09:17:12','2018-05-26 09:17:12','2019-05-26 09:17:12'),('e711fb6d91ed56258d2f7699c084a2e383168ca1d6a586118d16a30f16e6ecc0e7f4414300f69536',1,2,NULL,'[\"admin\"]',0,'2018-05-11 16:43:53','2018-05-11 16:43:53','2019-05-11 16:43:53'),('ea9daf8fcef6e2aafb58b1dcdd8c6904cd483534c5b11bb1a80d108528a7dede14eaae8276a98eec',4,2,NULL,'[\"user\"]',0,'2018-05-25 05:12:09','2018-05-25 05:12:09','2019-05-25 05:12:09'),('ec20c91875d351656313695090675e3dcdcc2d382e725a7c5bc8b7de26a7594ca5426c55d84cc1c9',2,2,NULL,'[\"user\"]',0,'2018-05-22 03:27:06','2018-05-22 03:27:06','2019-05-22 03:27:06'),('edc74aff4191f7b2533464c2e649471a8d9f6bb007384440a822586b340f486d4ce7ab6ab7585d2e',2,2,NULL,'[\"user\"]',0,'2018-05-29 17:20:14','2018-05-29 17:20:14','2019-05-29 17:20:14'),('ef71d0c2f7c1523814d4e25302bb23389ca41e66856183ed805cc44386251bac5b29cf55bfbc89d9',2,2,NULL,'[\"user\"]',0,'2018-05-22 04:16:07','2018-05-22 04:16:07','2019-05-22 04:16:07'),('f3dfc62d1f404c5719ded5d1320199726abe8463a361c86855a2fb63bff1506ed10f7c372c96bb2b',2,2,NULL,'[\"user\"]',0,'2018-05-19 15:10:48','2018-05-19 15:10:48','2019-05-19 15:10:48'),('f46ed3e6a5fa0f8b68ee7639ca2114cf983e43bbdd9eb20b319d0449f39d7c0d6cfd467c253d4b8b',2,2,NULL,'[\"user\"]',0,'2018-05-25 01:50:37','2018-05-25 01:50:37','2019-05-25 01:50:37'),('f6917b96965ae67481b72ca83303261713397d752bfc668c687a3f8d631110c1e570a002a8de73b1',1,2,NULL,'[\"admin\"]',0,'2018-05-25 05:12:22','2018-05-25 05:12:22','2019-05-25 05:12:22'),('f6bafefbff8a7785464baacd05820e98ae4e31679c0b174284ab4184de791cf2dbf10aef1276adae',2,2,NULL,'[\"user\"]',0,'2018-05-26 03:55:14','2018-05-26 03:55:14','2019-05-26 03:55:14'),('f7e8245c713bf20a9bde7a7dbd7196157aa2c53b3721704db03a19d48a08008337fc85aced3a0e7a',2,2,NULL,'[\"user\"]',0,'2018-05-24 16:26:33','2018-05-24 16:26:33','2019-05-24 16:26:33'),('f7ebc7ff284f272b0e289a3c299ed189c9be5ddd2905f6660e730007f027dec5e66e6fbbe030b668',2,2,NULL,'[\"user\"]',0,'2018-05-26 04:28:50','2018-05-26 04:28:50','2019-05-26 04:28:50'),('f8074f4f1f829ee76631b474658eaa95ded78aea27cecbfd3d0c6fa8e3c9cd081799cab8fd000828',1,2,NULL,'[\"admin\"]',0,'2018-05-11 03:08:45','2018-05-11 03:08:45','2019-05-11 03:08:45'),('faac7cb6e7907fbfe8bfa8242f15a574a954a76d7d965f396b445d1e5e7b16d8d92262b579d394a2',2,2,NULL,'[\"user\"]',0,'2018-05-23 13:31:41','2018-05-23 13:31:41','2019-05-23 13:31:41'),('fb8bf69647a914700e5d2e8537e190b3797304b34c25139368760a3316c8e2a300ed49253fdf1780',6,2,NULL,'[\"user\"]',0,'2018-05-27 17:37:39','2018-05-27 17:37:39','2019-05-27 17:37:39'),('fc12b0cbba2c892cc8f76cf6d4e94c446c3e964249140ef3c4315dddcfedefab82ccbac2bb232895',2,2,NULL,'[\"user\"]',0,'2018-05-29 03:33:45','2018-05-29 03:33:45','2019-05-29 03:33:45'),('fd2048106baafeda2ab8678904dd0224685e401e3e61f90600a464c2c49ddfa4c7d6fd1e74daa213',1,2,NULL,'[\"admin\"]',0,'2018-05-28 18:23:10','2018-05-28 18:23:10','2019-05-28 18:23:10'),('fd5a6650752dbe4b0bd3edde6f997cfa0d5643f46bf3ed8413cf3d1b7c53c00ea8670c6a20e860ad',6,2,NULL,'[\"user\"]',0,'2018-05-26 06:42:46','2018-05-26 06:42:46','2019-05-26 06:42:46'),('ff19e557ae1718065cd74d5aedb9fb1f284a82f5ae9a9eed659e3b8e6948634a95f883d66a630c74',2,2,NULL,'[\"user\"]',0,'2018-05-29 21:25:48','2018-05-29 21:25:48','2019-05-29 21:25:48'),('ffeaf6e92545a6bda377a731b0dfe9a398868c1d36085dbefc4e955de078e023048d9135d7de6749',1,2,NULL,'[\"admin\"]',0,'2018-05-25 02:18:54','2018-05-25 02:18:54','2019-05-25 02:18:54');
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
INSERT INTO `oauth_refresh_tokens` VALUES ('0629450f4f7ff9b5a262e09f6a721dd2e28532c7d373fef22313b7e5c37339a54670d2755356970e','dbee6544d7aa04a76d298a3098e2ab6b501c33c3d0b7caaa2486531c042af0450e839d41d97774b7',0,'2019-05-28 03:15:44'),('07488af8e1b9dce403f4b159fb4fc5e057456cba57f1a75d9cf2d33248853ee8fa9b304e02be49cc','c104197d73f6159a8f830fd7749f1e407c1c3480a6fdb7b43bc19e9ca114bbd0c4493b30ab392e6a',0,'2019-05-28 01:40:39'),('07ba3fa9ce20919cf47f9b748a50766af09d49ece40a2448f9b0470dfc599b497fe293e9959cf300','df8873349c84d3beddb889f27fb1b24c62531ac785ef6d9392bd84943a7530dea0b437b047bac468',0,'2019-05-22 03:25:24'),('0a6168bb895962a699811e2b315e2b1bbf47725bd81686cf6362119368efd5a22f98f1972c89ac9f','868f068e54e50f1db99e0930c3c4298a7284b904171bb23e099184532ba5744f04166f362d1308d1',0,'2019-05-26 09:10:55'),('0a8744bfb849a2a65c54ab67287dfaf72dc9b6a3911b3eaeece1f53e54beb19fe74f5b15fa2c9dd0','e6cdfb9294959db63b1b512bfbe8bbcbbf2fd4c73b54b70b28b1c924a9095b93879c7b88e2d82604',0,'2019-05-26 09:17:12'),('0b98a758cba1f86557031dd9e579c05d3d3791c78fb747c675e8f855573cbdbcb4e88a88914442da','7490b2457eaa1d8a27bb51330f1d5d41836785ab7797a8d4ccafe43e766507b7d581deb933912dfe',0,'2019-05-26 08:41:55'),('0e23e11c7faeb0b8868de2e0d74deeb95056852a82b625c745fafc656fe9116154ecb5374f4a031c','d1aa012706f50ff99d66da3d7b5d9480dda051fb69b64011818bb016f46c9a29ad98c518ad29d946',0,'2019-05-25 02:47:14'),('0ec08af98cd0ff3d256b701cc25de26b3f8bae33b17baf70fe74770164a910594a65f99f47c249f5','177c587af70a22682d9d4f395fd17221f57cb1bcc1f8eab4db18edb0eebf47d1122c99fd44a909cb',0,'2019-05-22 03:19:15'),('0f60e7b7f4fa54f2e7a726c30fcc72a52c2ff1895276229f194b469c76c79554ed82a58f3df9c3f4','b5f22bc1d7c5e86a2a5876c7bdc589f535a22017c7fdd2faa484bbcb7971809cbf229cf1573bf9e4',0,'2019-05-26 09:14:16'),('119675cb978626d488f48ad1e0e26454cbdf0fe79c741be03e6a8848eb493d70bf92f954281cf21e','fd5a6650752dbe4b0bd3edde6f997cfa0d5643f46bf3ed8413cf3d1b7c53c00ea8670c6a20e860ad',0,'2019-05-26 06:42:46'),('12404386542882a73ac7f7fa0b921e99904e6d3840be912ad9deb7b45dbd086fbadc6f49ee4cd0db','56507bb8d5bc58d5b7ca5fc111e9d55cd97bc77ecde5d7aa29c59d279d1c709233a7ad8d71284786',0,'2019-05-25 05:16:00'),('1548128cfabbe371ed418413b5781dd4b367746a54329fb768ece30c6af1c7f5b38dbafa93e5683f','198d3a50c55ba0ca666e13582aaeaf0bce794ce112b0a3f9fcfce52005987f518ad019f518b26110',0,'2019-05-19 20:35:35'),('18b3085400c945496afc447e9f41af18128450e8f5bd0134b0aee846ac5e449d913c5d9ae037fb43','4856b54d34e2cebfe0c62809cd3b96dd05d3b7052fd6d59a0fef88393291c170862d748493fb92c7',0,'2019-05-19 16:32:25'),('1a84be35b037f86fed2aef4375073311f38b30e9307da55203bfbc6897cdd2197246b82824e03621','fc12b0cbba2c892cc8f76cf6d4e94c446c3e964249140ef3c4315dddcfedefab82ccbac2bb232895',0,'2019-05-29 03:33:45'),('1b090440b3b5efd919e8a22933798238081bb3b0569129fda7b4107e0884127df2b19fab575c31cf','f6bafefbff8a7785464baacd05820e98ae4e31679c0b174284ab4184de791cf2dbf10aef1276adae',0,'2019-05-26 03:55:14'),('1bca700ea7cb5eb31bd1fe2ddc72c95aa4d8a3ec3298995f3d61ab436c9661b66f78ab537c05db4a','a9a03002fd9ed726e57eee67fee16de510966cf366a52b0f9d2f46f4894b8f4a44d63cd94eeb340b',0,'2019-05-26 09:32:12'),('1bda74ea21239f13ec29c5f7610682c579cfae5b6f9dc4250966b0f90e6515cde478c6fe1cec7e24','f8074f4f1f829ee76631b474658eaa95ded78aea27cecbfd3d0c6fa8e3c9cd081799cab8fd000828',0,'2019-05-11 03:08:45'),('1de909ca9a8ddbc701e4b90b417e1b6f4ce19ed7a13aa743702c6c9328ded69205e97df2d25931e9','4a5b7fe8937d2e063313a032504089e0689398588d0d818be6c4ddc1d8e9130f68ec9b33145bf91c',0,'2019-05-24 19:27:58'),('1e05e23e2118a8668d570e906de7cbba9415ce199451d802c70d720964e585e11770f4738c3c4abc','d3a8d25ff8b5ffe79eda5dd19c6d53c3b9a1b68d79a07ac1cc9e369fce71f66a3fc980e6f6ed4363',0,'2019-05-19 20:33:15'),('1ebaefb820a525a4205aa47d8d34180260f5e3fd0828352881378745ed1e8469633f91fdf3cc51a3','93c165d721e342d5c7fc5607cfaad756d56f35baf8eb97df2f1ef5ca59dbafe5d7f5e956fe10dc9c',0,'2019-05-26 06:32:24'),('1ef4db2638752e5e5687ba3f7e254236958635d9ac468219fd09c336edf818bd0a500a2235d41562','83c728962e89c6cd1da1c3f9f667f507b0ba603b5ff4cc957adc5633db6c2834ca5502b9a6b2e0fd',0,'2019-05-26 09:03:26'),('209b6d7ce918c6c91cfb5e19f1640cb740099f120f333bd14d0602ac5f426eac64fde300d3144251','605e3847a0bf712020e52194944e03c1d0d8706f77a4b1e6df62e41f66f10e2ee6bd7bfb4680abd1',0,'2019-05-11 17:44:40'),('211489760695e4d033b54214fb19ac78bda117bc929a9ee4af222cd8768918e68f1aaa17741e3d8e','7f08cccacc3908a5db84200da869797e0bf9f3d528e64711df269e2d21aa039c0aab1f747a143648',0,'2019-05-26 09:16:07'),('225840afb625020c6118d245e55f092f6e86ee35c4ef0fe88beb4146346dbe2e09520ff1e9017d10','c127ae2e26fcd7cd8c7205febc2fd71eb99be188c0afb67ac91f3e946d77f12c083c16f157d36c16',0,'2019-05-12 14:54:55'),('22e2c263683b852fa78410d712b90f9377a389627faac73b38161a28f10b03ee89b69c0181b00f06','c5104bc3a3da07ca6f7d5a87d608e4c36d8d302f4bbd51cdf5e667cd25aef7de8bc12ef50f7c92de',0,'2019-05-29 16:48:23'),('24425e13ff9b753522d53a245f88b54b3e4d364c15a1c0a47ff0818893671633934482c7cef63e37','3de64ce673a423c395e8fd6c204d94e93aa2a5113269ce7f1acd2528aea1898af08afd69aaf7f5a9',0,'2019-05-19 22:09:39'),('24b66fb5796c16d01dfb1eb95f1e0c94c6631085df213a505710ce628fd746a929e97d74c26766b5','3e1a1503213342ce3fd2c5ed9f3d54d51525e9063d48f6ed3495915486fca75de44ce887c6d9efa3',0,'2019-05-23 01:29:08'),('26f8b8caf9c8747045104a36e0af3a7667180b8aa3e687f1ed9805c9aa0002f4db76e4ba5bcb59f8','1266fe4d8096e976c76cb71718a19e0aa91cd7dd012f85eee357c8e9e0542f4749a1fa1e5dc0cfb6',0,'2019-05-24 19:44:16'),('28c3a47b46ca1bb06266018856ce1d981affed2c0eabd46bc3efdad46d1a8bc7f8ce3fc9ca98b29c','4077f17303761c48cfaa79364eb4aff5a0c93d7e94cf2eec7910cdb820dec0ae6c20b743c580dd35',0,'2019-05-25 05:04:50'),('2990ab91677b0d725a26247a9221a3f25f707b9a465cc08097de15cb279ed7f34e14a37e99d13dfa','f7e8245c713bf20a9bde7a7dbd7196157aa2c53b3721704db03a19d48a08008337fc85aced3a0e7a',0,'2019-05-24 16:26:33'),('2e732964085b8b447fbeae3e2ea2c589285792404fbbd467d40d58e118641bfb11e0904df60b2324','0442d0e772283f1a6ad05d8312e7a680de1b9f995956f5a9e03f9df155af1c735c75f80c0cb0ab2e',0,'2019-05-19 14:58:08'),('3249c2c0c7df95ff56f7f801e140f8d5b145b2c9fff724b465ee5137040aa701fe13eb23c7d1b943','77832a0bde30a1ed9441ef32c143418841e28b677b0a9d62f2243e80297b8d3fac8cac807695cae2',0,'2019-05-26 09:08:55'),('34c48f12c3a1a0a5976ce560e218e8fb93d7c21470d1c1ab40dab945b7d5bac139a9233b989b5e49','dd31a3b4a435a8eeb2a10245ed297ceb5a683d45c0fa46e89c559dc0d7caafefbac8291c48350418',0,'2019-05-26 06:42:07'),('35a345409b3f2c4fede82758a5b3429f04bd418073d5efb5eea40e323b57494d5d5322cd59f612da','c5b89e85215924f9892f05fd44cf018148a0adf29bcbb71162ea6a9d85b8c213df7a7e3a7976d22e',0,'2019-05-28 18:36:30'),('36fc3bf2c19cef5c2d201c49546ebb8c625d74385eb1a172aa51d6028f7f742ac846bd45d26d5726','ec20c91875d351656313695090675e3dcdcc2d382e725a7c5bc8b7de26a7594ca5426c55d84cc1c9',0,'2019-05-22 03:27:06'),('38bcf7e0008a2356809f8bc337351c8253722137d32403be7f19554ff30f66619129425dbf056da2','341b7196dd27487110bd858179796a85eb5039cede799564415b1dc9e84970b6453c113f031365e0',0,'2019-05-21 01:24:44'),('3b0fec158f1cd259ba399c0cd7771914aae8b4f08060febb67ffeb935dfe26454d7376c636ddf7c1','750a38afdf2c5f04cc2ace440a7f4c24546403072b43bd7a4dc2d8b8ce34abe2e81895b80add9747',0,'2019-05-21 01:31:03'),('3b9b2d68ee5dc30c7c651927c930a4be36fa4ecee18edc75b25a243db214bbc566814e3c38eda123','f6917b96965ae67481b72ca83303261713397d752bfc668c687a3f8d631110c1e570a002a8de73b1',0,'2019-05-25 05:12:22'),('403a6729ae534cc634d89ca66ec8c69eda47539576ad76043f4a02183f5254b03d2ac0f2edc17d6b','4b89732f8294c5e899c37dc69144a6514b88f00ead5966d26b2483292457f5176f5291f0c742b0b4',0,'2019-05-23 03:57:41'),('419edb20905a8179614567d3468c490c3cd2bb024561d54e10ff4d552cabf9e596a4925b36c615cc','faac7cb6e7907fbfe8bfa8242f15a574a954a76d7d965f396b445d1e5e7b16d8d92262b579d394a2',0,'2019-05-23 13:31:41'),('4346b3e2b3df8b28781ad3b23e1373bef84b44a5c5915d8ffbe92e0b8032d43d6bcbd0fbc468b158','cf145a8c91d95e34587bc016ffbfdb3f528076238d1f7f4d0a3268d29a0bdc2ae2cb08824ff5f4fb',0,'2019-05-11 03:24:15'),('43f9be8d39d376e6acc61322ad0cb3048827ecab2f3fb182e537a5f8f17725abb31c98c0b91ba3ae','d5ca2a9db907a9134e91a9ab3ba9cf295b6c63c35f18df091adc272320501b0d35f7320cc7a02e9e',0,'2019-05-23 13:25:12'),('460f5f1a9275701e0b0c709719973da043c6d92b6e720f4440dab8f7285926fa95fc53abcda81f1b','dba31277213be21bb464201e031aadc705f6b76da25327715440c75c9caf44743db946e651f3db5e',0,'2019-05-28 18:24:33'),('4642f501dfb3e8ad8f5e57102fc82c14e4c5e7ef6d1c8d6144fb2b6225c1aa43033c923ebe2e5653','edc74aff4191f7b2533464c2e649471a8d9f6bb007384440a822586b340f486d4ce7ab6ab7585d2e',0,'2019-05-29 17:20:14'),('47bee1982ef2e3c47c72a4086fc345ffbe6a47421ec2f3810dc3ff3875eab390a22bcbed998cf11c','64c8b9ca2613af1773935ee7470f292c5a0d8f67a07e0f21576fba5012fffde8cbbd80c964af014e',0,'2019-05-23 03:56:35'),('4a3c20688e9c76af02e6e5a20d8e922fddb8907aae8c8656a9206bef4f98883c568563d3183ba2bb','21a59185cbf8f8cd9f54377b633cfa956e969dbcd8d51716d8edf8fafc8dc421e03c69acb1c57e59',0,'2019-05-11 17:26:43'),('4c36841d38f5e951d34dd0ab5d283b4ef19837eefa53b1add970d3e2fb707cda843894b8b4430fe6','943cb6d54923ced1e8817cbe81504dbc8e6da0aa06fd1c465806bf671ab1cbd8b54bc77c08fbc577',0,'2019-05-22 00:54:13'),('522a8741c37d7efc576df794c707feb434b607ed78ca02b2d9009bc5e0ffc18e234db307e5e189d1','36bfcf8ee93f0dea393b0a08df154c843ca163d5506a3fe384911307519689cbbd57f516e0add80a',0,'2019-05-19 15:56:28'),('54f82007dc79539b32f348ba6da3a64511e59857b57c01012d73c7d8248f8fab4077b7dac015ec87','4538377e1766211e533ed9f82301ded5962b98308ab99c3994dc157c282c02d7bd7b78b6703fe18b',0,'2019-05-25 01:50:28'),('5676a9fabb51874b4fc22f60e4dd09934c4e5d9e005ceee666a985a6f8135742c0e4c01389ec8e43','5a995b2521c6b470f4d048211b8e56f81aedaa46ccea2c029a09465d56de3e9a2dc408bdf97c0116',0,'2019-05-29 05:23:59'),('60ec9ae3619f243ab42641bca911f6c7a0f0564b468de1d7f4ae253a9855366ab7ad8b9411bb2896','47f157c3d40cb0de49a647fe9e3c71431199b8f1840976048fd4df45ebdbdf05301005738fff8c78',0,'2019-05-25 05:28:42'),('6352f3eb435d986b0270230ec90b69e496f1d8e4d38c1ec9a6f0305eda1b3e81cc36888eb47ec630','f46ed3e6a5fa0f8b68ee7639ca2114cf983e43bbdd9eb20b319d0449f39d7c0d6cfd467c253d4b8b',0,'2019-05-25 01:50:37'),('6702cf8aa375fda9cc4d5798efcfb357fe8166eab4fd1dde7a022e84edf16ade58610d4ca80cb359','ba465f58a17ee0b3be785a95de7c9c195b3140a780ae676447e0b5d6115e6bcd051698bb07d6a86e',0,'2019-05-23 03:01:51'),('680a7dcd2f26fb49b17a9e975ff370151537852921f05b4cfe41e4859b132a809b75c234a817aea6','a846466d95c460626ccced9e16f7fcfc6175c6fa19205a13df675e202879e93277c5f91b1c026ba7',0,'2019-05-12 20:13:29'),('68942f4608d1df4830ac76e510ffb098b71fc37d41af88fdcc34fd7b83e8afef565bf0f447495dc9','f7ebc7ff284f272b0e289a3c299ed189c9be5ddd2905f6660e730007f027dec5e66e6fbbe030b668',0,'2019-05-26 04:28:50'),('697fa6f3abf18da897a906674c3a3ab0af3b44cb48e983a3dd763e10b14ca8f0b7ceb3c47736c6b9','5986563c8660dce44b78076d21cc6133e65b4945f7a38ade0cb248e74b9e4a26f85d79d1455b24a7',0,'2019-05-19 21:20:11'),('69837a05a71ff9c4793ed99c397019dc71e4e49a4ce8464c26d7106e3cd0319932a2055061de0029','4b836a3766014fbcd8b5dd1cf2a7019c5f168f66b6b417f746f2baec145ad28f26734c252e2bc71d',0,'2019-05-26 06:31:54'),('6e559036089e0de1b12b68d6d2fb220b1333738b45835255fe3133e881adec30c519e2156442d3fb','b3e6784c11c913bae1cfb3d56f50582925cd863cdc7fd7803f069bfbc33c0d6a84fd73a389384788',0,'2019-05-19 15:10:42'),('6f215ad03f289c50818004818d319526abf6fec104ad201f0d23b15742387db7b4c21e57b47f2ff9','25d0664262197f0247bd9be1624c0cb21dd8620f311177e141c7573dba213138621a52bfc2a0ed1e',0,'2019-05-11 17:27:18'),('6fa5d3a1ce88554eebd12aba367c0220d3cdd8662b84fa58fb4152bd6a473dd1fa3ef372b9371436','49daebfad4e724f9cc1acee4008160af43cdff0b9f302149a74ae77e6d91fc94d3a4d3bbb2478606',0,'2019-05-19 15:55:50'),('6faf4c8ee65b9aa65a805187143856ba3c8a0085c801c60e80a6942f13b590d3af2e00bc7d7ce112','da0ce5ec1518cc8fedd2b59c3bdbb54f317a90bd5f892e52713215f7179e0a35f49e2e320c8f7a0a',0,'2019-05-19 20:45:09'),('702bd6316d9e244e42c77c898f04fbc30bfef563c254e268186449c01c595bab4bd9d919df201ded','80770cef897dc53f8f5dbf044bf1239d267be7a842abca2327c5c87d5161cf4b346111ec91d0ecd0',0,'2019-05-26 06:49:42'),('70310b4572becbae3d5d723cafde50888a5fa7e51bbcd6d9c3c718be04a402ab75fcfe3f71668a6b','da910f74ed61c8b67e6c4a6b1138721d1b156ad3468b160335517293f94413f277c3f4c4737e1621',0,'2019-05-25 05:18:05'),('7072fa1ad34bf4cde42d66501a64d05b7af0802ca414c4979454f9b2978703cf7d71d3c610d41046','26961827d5b221617d5a8069f95ca9093f6747f5a750b4ca75d6dffb5bff0833ac2a546c2d0c857c',0,'2019-05-25 05:11:50'),('723db9f40b707de6ea8075abf31dbcd6b8e5e17acf91381afaea1c60e18bd778fdbc9f31cc5ddf38','ab75e890caac7e21f6d21955ebea54a5427331acd5d87ec25eec8f506f89fd69002eb6884675bbd3',0,'2019-05-25 19:11:15'),('72ddc808e536d7ac759492072d614749925491944e5f1dd576b0065ec3cac797d72d9e3d5f30a845','7838e13e9ee3946808801558333b9726d8d2f892ec1d3b0f5a09ab493d6aec356f3e99c5537ed9b6',0,'2019-05-26 00:16:06'),('75615a889dd83be810980ce293b6962baf9d9036653715bd2a927eadd704d3f9b861d0c62ea810b7','64da03411b304a89906ab7a3160560745ea73afbe7e873af4759a472137f1ee004c0b3e32cc22f7f',0,'2019-05-22 00:52:40'),('75bc80e710876e37d5c62cb2b5a90d6830f42eac6d09c235e821f47bc0f3bfd297f007188e654cc3','8764d1505cd23232aa9f32e9c0b9ccd083e899e5538a21e5209e61e01f506244a7a7a13404a1f4bf',0,'2019-05-26 14:48:58'),('75d56c1b05c8d2411798808e55fdf4d3957dd1492017e8f54093335ef41f5ddc2f6121774467944a','abf663c70cfb51be7f69ced17d84ff89cceacc0b4af8ff62eb0b41260f7a43584911b395512851e8',0,'2019-05-25 23:59:43'),('781f6a676bc350dac2da6def27d6843683e713ffcb9bbc3c078b3673bc54d690494949410d0774e8','3b8d252768be63c0e402bd8e330c621f6d02b586c03efd570ec0bf657de67667a9b06e92a0e84f69',0,'2019-05-25 05:15:53'),('78d016c5bc744411b39fe9db7f1f7eaabc4344990a10003fef02eb7196949dd3667d254c0d414e83','bc3c2f19942dce5e3f78ee3b5b5f193826056ff11012a3dcfade28d8b8bcd3c351449b30c974282d',0,'2019-05-24 00:42:47'),('7a94acdf9ae692f20993cc9b52f6cc700c8e93fed63867e8a579ff99ba4020ecc780cc2f445a3d6e','e711fb6d91ed56258d2f7699c084a2e383168ca1d6a586118d16a30f16e6ecc0e7f4414300f69536',0,'2019-05-11 16:43:53'),('7c70f2e4d1c0ce387fdca0115f5b32609eb065cd3e7d11ec5d69b4e913fcdf45b068cfa384ebba58','8588f142d2bd1e355e7cc094763dc32a6720b9761a813643a6f1ca249ce03bef8a31a175f9610fb4',0,'2019-05-25 05:17:50'),('810a6b07aa09d67b68a2df01fec97a7b6037a3e8a2213c95303a3a3060953add55c52388c40c7e40','04a2077a3698a1d4ec69417294962f8e99352d0bc1d7f947267721808249f8ffb71e247ea0eb38c0',0,'2019-05-25 17:39:29'),('8128b1de454b5a0db7459ec8268c63b6b2f4bed5a6d6b98304a23182b8edfd06660443eb5eec5c40','4e213fb17c18a499eb8534dea22aa4520fa203814b22e10877ccaa9f0c926f7c1d7e415211b4eead',0,'2019-05-19 13:27:47'),('82168eb5bbb09f294029a03d75ddf8938bb2a6759afa64211cb614d3f036fa89ed3ef50a92d6c5f8','867590baa24f1d5ba1937ebbafb274b84c652f960b98408d0b3f077d4fd555ecea4ad519ab1ef367',0,'2019-05-19 20:36:52'),('854bcf63ade0e25c5c7ca5a591fa53fcd9beb33faf6119989b1c50569cd9e1785281170771451bb7','e21223f5922395ca9477528225fda74f34c96bb99bdc4390ed70d9e25506da95a544acb9ff99dfc9',0,'2019-05-19 18:47:28'),('86f4ddcd5fe92a40d91793233b710f760cdef46d8079bec8f083c9688f2ad0601b62cbb030dac082','b36925b3431778b8a06a84b0f33b5a43ecf1ea591bf2521c503ca0d41815b7806f1993cb8b8f0218',0,'2019-05-26 14:48:01'),('89b17fa2adc1ee8f00d7b4a2dabe1ec38f7e2fa1ccf228456dbb03627b2e15a9eac95fd869e541df','c462be85ddfcc0792974aa2017571d0c426f80604a758445abcc331679e4e127bc7e6eed2f8bf0d8',0,'2019-05-22 03:29:51'),('89f8946bb508feb151bf673d102ddb9e570ce25bb69c6d90a9ab37ddc11c4a13e0186fba6157dfb1','bedfaf57baae5140328370870ce74bf581dc2dd9db080ab51d6861e663ce0614695be9eed8e0207b',0,'2019-05-26 09:16:42'),('8a8ee5b19798c0c2b3061e032f9f2ae311fc1e0c771729c016970ed05083cac64e11342e9200e638','fb8bf69647a914700e5d2e8537e190b3797304b34c25139368760a3316c8e2a300ed49253fdf1780',0,'2019-05-27 17:37:39'),('8ce76a0c55dc31b45b3c78b5a3406493b1ce13e55c3bac7df4f778383e9c73d63753dc61bfa685ce','ddb393b5d9e478c8b00951e98b9f638a78319fbe91695f85f4fef2fd7b60408f6738b25d3580c3b6',0,'2019-05-19 16:43:55'),('8df0fa40c8f8749673e7550074e25fd56f63c94f5671b374f46f272e8b74196ea86a32d987af7b57','76625396bfd0032977ccab79f70c2796c85ac3c77cd2f689f0793ea9c396c48d28b93c885f7742ff',0,'2019-05-22 02:53:45'),('8e244aec35ea0a2dc68f566354be04b0a6782f786aa943ace1910267fabfc1e65d69f2f392789534','1e4047336d30f203803f90d7087b9862681e366dec3c428b0dd7a5a4b58d02601dc11219c44a6ca1',0,'2019-05-27 19:54:30'),('8e752db28bc4c2b66e633782273fffeccfdb124ed259b7d61b2c04e2e82315649c91e2522ab2a899','c072108b75b6a6d298f778df4c5968d464609b134161f5dd87b41d0b996eae4153c14a010a8b04e5',0,'2019-05-28 18:39:09'),('97612cfdb04927eccef52e27e03d22033a7af5ee855fb608a8031597dfa485a39088c2f3bb7f6d62','66929489c4de1e1702215b616d4584203b448bcfa63cb800a2f77b92738201707ce8a040e901a052',0,'2019-05-29 01:32:05'),('979f76d20b691f90704cff3bde9c70ed0e0078f8c96bc41f0772abbe4bba61e4d7199b7b378b1ca9','32760a66aaa31e8f5d9d5eef01641cb226ac3a696b572ddc7577bc5b7d4ca4ad3e86f2e990344a6a',0,'2019-05-26 09:13:57'),('99b9bc651bc6985a5a37c7cebd078e0f4dfa4d8ef650f3a897ec1957ba72264e878704cc2fad1106','512e13e5b61efb66d2cfc6ced378bf743a58ffb3e34e8f0768454052e9038a346ca5e941ee42dba8',0,'2019-05-25 05:15:35'),('9a387ac4a185b339af446e18ca7af29e8b17968aa29f9d9313a4f6dbc39cc90a0ccd94f6c97f3037','ef71d0c2f7c1523814d4e25302bb23389ca41e66856183ed805cc44386251bac5b29cf55bfbc89d9',0,'2019-05-22 04:16:07'),('9ace426e8165434f70b792107f65ab118fa5ee5ab04f97fff97fcb50746ee6ee143f9ac3433f62a8','141914c1dbaee97ebd2b2e3ce5b4df9a6d5f8eadd52020fdea66932fed2a7b9340866c3ecaef8f44',0,'2019-05-23 18:21:42'),('9b3b083493ab57591116076bebcdb42a838c08ae631674f552cf9946c1b6466464b7deb83efa9094','6296c0ed83ccf7567fee7572bdbc73f80394612ddbc0cdf4c75605ae69b57f1a404ed5efb9460540',0,'2019-05-23 15:35:03'),('9cf2f9392c3a9df0d789504488a935ac693222e73c8326542e1f50f2a39091a41227de4cdf38c63e','65f2bdaa41aa9b084157b237afe9656892d3f8200a69cdd57990203cc18d359980bc5cfb1ecf5a4f',0,'2019-05-22 03:15:47'),('9e574fe30211e09c1a420920170fbdc10f557cbf339cb45ff90583d63316d02d47a92f1361d3b121','51df0c27e08c9702d45f4cb4c577ffabc4712dd2e218e8bfd724dcdab2f10a3d82a0075c4a8210ae',0,'2019-05-22 16:39:33'),('9e9a97a64a770daf20028787d158b9e21acde8c55498710dfca2bd6501c557273f4e4e3b53089faa','0d0591549d1b9552942e9feb6cd47618cee09a6abf56325a32b94a2fb59f96808df3f0a41b44d7e2',0,'2019-05-27 19:37:11'),('9f3484d92acb3bb97a90d344366b3b895a90a574fb30dc80041ec70b12e7bc35e4b0dd895bd28601','df6fe76abc008e97fed86fd8a4271cf2f7ae4d75134b87155fddf310f7bf12a9802c598a807a47fe',0,'2019-05-19 20:35:52'),('9f463bf7a4b76f66b653f5c0c0c3980685399e85948deaa953391ae9aead694d361e381975962064','574710751040e9f5d6b428e57cd6e998c3af911460935e87b8cc5e6821ac2c6d3e20127337bfd7ea',0,'2019-05-24 20:24:11'),('9f4b6e80c86ccf92dfbe30bba361821ca0d95abf90f765e897e90ca51f83b0b0ccff098f2929daa0','7160ff345d6233b580ef5466871f110568759b8ab2b9afd5471cf2d6d49600ba60df6ed3aaef0b80',0,'2019-05-23 03:52:22'),('9f8ca11f2204a43def5e72c4a299cf2c7f29ddabdd15fc56824cb57f09e85077561a456ab56a0cc5','843251aee17e8a1a95598eca46d99daf34c9856449485b19107b4c652086148c96cd672d39a6f02e',0,'2019-05-29 03:33:42'),('a2f3b8c07453e5e7ce63f02fddb63e03819a604f7e21221ac0283b331d3dfa3e8d0cfdde6274e03c','6c5f1d3f850dc223c8469fec2d6341ddf78b87978848117217055961dec5df850bfd4f20486c89c8',0,'2019-05-27 03:09:03'),('a52a997f57b54572f4ca3a6af1c560f30dda6a38b7e97d7be844b22f7e360c4f9a2715289ec867aa','c6d6cad138f785d7b84487c28b2655a304a64432405c7df1810ace8f0e71915b6129e49336873d3a',0,'2019-05-11 17:25:57'),('a6ff73aefa0c836af6549b1c429ff022e38aa4c1be85e67c90093969000e3330151964325811671a','1e85901fbc0c12e56583f156d0879d4c626b8f9eb560409a0e0ae2ec75c08b9757eae1b721cfbd13',0,'2019-05-26 09:10:15'),('ac18de031a67ce7712e31fd4fea623aacc72002873a10941586672faa5f9352db6bd6d48909f68bc','023eed0fee55181f0a2c058a8c43ea15e60e8ac9cf504473df449ffa60692044590f36d49a5b5560',0,'2019-05-23 03:48:02'),('ac265ef5f4dcca6e38affb47c724463cba3a3a88af58daa1c8126021aa125abd303d7c4b7e9e5007','b540c11ff1bd630b6bdac148502573fdf8362b78d29efc62f96097d70daa877a9683474c6bd3d6f5',0,'2019-05-23 03:53:06'),('ac7a68c666ad2d2eebba226599752d947011ce3f5d489975de5473a965c0e9866f7863b9587cfa24','5f82b4606dc5745d673dd5643f85695e9f3f8d6baf68210c4485186eb50f8d73f0c3a976e4f807a8',0,'2019-05-26 23:40:52'),('ae9116d4acd3763d7b6a7a72e91344092756c9b5344db37797b35050f909287702fdae82107e7250','a5457b2ef4be0bbb0d55e076b2debaa97aa0791fbfdc2da603297044ad47fa5a7a5a3ed8b4c91b4c',0,'2019-05-29 16:45:59'),('aef9018e5fec949e95a4259ef369e64b5501d68257225049fb0c06440564c79bc75363c975d5013b','667c42d7d8ab819faeee15dc25f092ec7d5139ebeb42aa41206b1593fac720a60a47bfaa7ec14110',0,'2019-05-25 16:58:55'),('b2187474d97090f6e4cc53d9ae81bf756ea451ec43d5a93d08910ed7d40e3a04b0ecaba11758b455','79f84fc6343ddda99ae863c6c6a6a683289a4ee209cc02dc4a8f0d0c7cda4f6938aaa6aa02b7a5b3',0,'2019-05-25 05:04:23'),('b74a81f1f01b22f8e5cfed654ed0a9459b1bdc41efc70aeaefff5177e2952590439d3f3aa61e24e8','84ae01a6e10caa043f55a4216ba2fed6bf9fbd7c691fedac8864b36492fff79572e16f0528012bd6',0,'2019-05-19 15:11:38'),('bc53d544981a8ff18c08b8209d24596e623ced5c54fe9719a1af28e680e10d5713ed147ce9e48b1d','ffeaf6e92545a6bda377a731b0dfe9a398868c1d36085dbefc4e955de078e023048d9135d7de6749',0,'2019-05-25 02:18:54'),('bef23cfc3ec6f03ef1873356737c9f86c516594723da71b1eca075c4ae21897ff9617d9ab4d8bd36','22aa55c5b326b1cae3d345d6ae09805ae9b963afb0bb2abc940f4c6d9ffa1a19612d0f747a27193e',0,'2019-05-24 19:49:49'),('c18a90877f4913e2e3cea31e72a0fd6a05aff05b862da5785c582c0c1658b617c474277b071265cb','4b6bbdc92aabccd9ee529bbbfbe8178f2cdf6ecc5caf9c56a37c265c69033fca4c5f79b19bba6d66',0,'2019-05-26 09:11:15'),('c33e874d002ea84afe099fde48a28cc24be314037df41d6acca5f7eee81cf7bfda2b19c7714b9e4d','6410bc77c9ad75cc9e19ee2bdecac357c9f3c823e8067f893cc6f9bd7f7fe0e6852efa11dafb1356',0,'2019-05-26 23:32:19'),('c34d3d7a28cb331743b9900515a760581d36536a32018c377ee1c4e2af38da94e76a7fda0171980b','fd2048106baafeda2ab8678904dd0224685e401e3e61f90600a464c2c49ddfa4c7d6fd1e74daa213',0,'2019-05-28 18:23:10'),('c396987d0be2e9d65239e7853c753cc214aa7b3b350b92e0a0c7ee3eafa082f13470c2c97b9468c9','af05b8e5c39a8561e3af94a43870078db4bfc1e760034c570c0ad3413f820c1dc8e8ee6201baa0c0',0,'2019-05-26 06:52:58'),('c84f4eb8000fa681fd4e13e3a0235f0b9ceaef10755b84a62c72ee591a2d4395c0b3c100578cf157','2df6aefde121cb6561d19de86711ce75cd9331518e0e936c64e80c0cd53b63b9767e5e5473acb0ca',0,'2019-05-19 05:31:05'),('cc8058c57d2278ba53d1ed205e8f67ffd8d8ddec9af4ad5879ece9f035392ca64a92dfc1b46233bb','a7643685689319184dc946bf27556c36bca18af75b64fd0e852ebb6c46b13cdd65bf2aaba48b1513',0,'2019-05-25 17:38:02'),('cfad64bb74e223563d0e5d5d14617a835507bc9ff53b69211bc4f66a52b156f162b79439473168a7','909719bcee234baf22032badb70759dd75790e9691588b377fcb2fcd7ec9ac622f2504524367f1a5',0,'2019-05-28 01:34:31'),('d3901e18b8db9a674897d5ca92e2a16b48734010ed71b4e67f72f689e55ccaa94601774429c7c4ef','a1aeed5620b3fdcd163aa8e47b4a7eab0bbc6e2d579cc5bc63f2888c92556b04b2d69bd89f0c5817',0,'2019-05-11 17:20:32'),('d6ba4b8af481ebd6cdbc2d5bd151d72d38c66e6f1d267e3764e31d3063628c656a4420ea664ad005','3a0d3723bcc75f4241a04118a9d1c0001607a6c9668a5a258f17383557e4f958f9a53aa26ce7089d',0,'2019-05-27 04:22:38'),('d978c4deba01d5c11ca40730bdceaeeb6b3def3cbef6e66c0966e0cf7219346fa8744a9dfb31edc6','24919a9c11679078c5866526b3597e1cb68ade1f80d24c6278e25c8c6ae69a38dd5259d0ffa9677d',0,'2019-05-22 03:16:45'),('dae0bd08454c33449026c9ac3a0edbd1acad2682f0924d463ace5f5d4f5a5215bd3737d2cee5ef47','35a5c53c1bca0d2e84e65b63ebcfbca2c25ba57635db7c90b88b533f7420089953f25e35edd18a30',0,'2019-05-22 03:30:14'),('dd1d8e9bbda21d5a6f3c80de4899a045bc91779b967ee16319fbf63bd62eac67b204df582f7f4856','011402b473c61e5a5fceef7837f188f618aa4ab800ea3c59b82dea9343cd3564478050e8b8da4df9',0,'2019-05-26 09:16:30'),('e58455a87234495e6cafa7442bbf24be85ed78a2fd1ea031f409d8b1e44f615ebdca473047fc9d13','cbab6ce7bf759729fef718d59bcc36219f9edf3670160d644280964040505d08ffdd17e5f20acef1',0,'2019-05-23 13:25:19'),('e621891701e291250057053b01cd1eacc185f7df2892c2f8c6f5b41010ec1d10039a6bafd703a1e6','8b932072aa328eaee236f032efaa83ee7f6c223b2e747d414d6a81953a83c295462bd47722b9e2f6',0,'2019-05-24 21:13:31'),('e798b344b440af1072ab953557d5fe7dbf1ee94689e5f77f36743e5f01f023d3a81a4684c6135c56','ab61d17b99093badc7f5ab516e7451d4cc4506afadeeed640925f8cf8161dc26afa437badbaaa721',0,'2019-05-26 09:11:05'),('e8eaa54eedc033f2c3a2b7d4ebb7e30993315c9b1b6a8f6e881e32094e0aab718f2249feab56f973','9ce4a3bf15a4580caf4cebd9b3bfde868927b983e5334ee974a1fc369d1951fb9b2097efbe960385',0,'2019-05-23 18:05:45'),('ea893b05c6e3e4dedf6dcc19cf3a77cada01d59d590c6b1cff654139410a6b8e40927e9bf8894000','508945a18eac7b229669f6c3a126b22da4af8be3be1eaff187185e719629e5f14977d4485d845ac2',0,'2019-05-22 03:29:47'),('ebbdb58e2af45d0e691f6de4497a5b0456054cde787b4999195682053d32fa4c222a88dcd31c9389','62c6b3af1c2e8f9718c01cd3801e1205800b09c34d472320f72f70cd0bde8ed8b8d8c83362523027',0,'2019-05-19 16:36:43'),('ec1882051e01a0a3b55e48da4446c7946e4f4643dd57138ec6470867585ca6009a11a5a10056513b','05e2ce142de7456344746eaddd09588a1321516e0ea57d41e27292f8b7d0c5055271c3d1c742b26e',0,'2019-05-22 03:31:49'),('ec4eddcd4a72ac341c7ee98c6f966303808de7eece08c4c1623169a1364fea83748fbbbc445f520f','b3f707ccf74fa987f9e76bb5ca65dd5c8746e9f4e250be46bc89190b77ae9d5bfe62d574fd917264',0,'2019-05-26 09:13:43'),('ec92abcfe2981cc34a3aff7c6af18f1464987e354726bdae071d7bbad84af6492d80538b85d4ce7e','292ec7e765481e197c9d257fab225cd5ecd008868cf13f8322b7b6deb9941013d287e12a08c0e676',0,'2019-05-24 00:43:50'),('ecbc373bd7995d20547a28d6c3775e18b13e816c288bce6deb82832bbc18cce8e5682c053d14ed4b','f3dfc62d1f404c5719ded5d1320199726abe8463a361c86855a2fb63bff1506ed10f7c372c96bb2b',0,'2019-05-19 15:10:48'),('ee70f005725a4245c85d2924ca27eb0485faceaff5a5ad20c2932984065a7fa0a5a16a8cb0ab76ff','ea9daf8fcef6e2aafb58b1dcdd8c6904cd483534c5b11bb1a80d108528a7dede14eaae8276a98eec',0,'2019-05-25 05:12:09'),('ef4ca7eca2c69d22f5c081db5ca4e850cd7cf8bde013e5ed72e0cf57560613ee615140b86fb1b5a2','6049bd86bb5a0244a41dc6887f2f6b7da1169396afc2ece509b788db627382501d749d4c96148ff2',0,'2019-05-26 10:16:26'),('efee8b0e75bd86cda9fbd737d89e278cd5e99d598b04dfcad64bc17789f1423747e723f24900f30d','7d885d7f8c78e658c515085dfe78a2f1a69f98e521328099a14c5ad7f0581c6d8bd85569efc3c482',0,'2019-05-12 20:39:57'),('f060d2563a113e4b47a4b4b30a65716463b06ee725d494b15b564513b24fa5040234a817a746974d','440bade5b6c568a40fc8c256d96953c451caddbd1473cea0571a6bfbb69a9f7718d27a4e4bbe937d',0,'2019-05-25 20:48:10'),('f12a23b0a3d693c624aea2b114f497fd372fc7f5c9deff01298e00c395e2e9eb24414062c36566ae','80cb8bc32a09b387c00e462312ace750bc5c81301aab6b6a8f2ecb3396984049e7624a8cd5ccb242',0,'2019-05-19 22:09:14'),('f2e8877334cf563b74666cc19375e6babf82435b2d8c582fcdc91c9fa07e1476c9852984381775b4','b2467890718f1a2d27da80ab44e86b5bafdef311e5b0866f73ebf160db879a0613259c75b7a58629',0,'2019-05-28 01:41:39'),('f691fc5cfe22f878b711df03a258c35044881db68eafc7dedcae21811eac5d677895182db43eb535','726803e8a8db66d836a5aa8ad8f6d59a570f82fed6a9ef9f4bd7a5a2ef03bb62f3a1fe044da50ea9',0,'2019-05-24 04:22:08'),('f8158c23c8306da26e940696f0df93d6c93c91981d4b238fd4803e1a90b36158a1065029cefcdfe0','9eeb4c5aaba1d51e9509fe2170dc18893ff753e42a6bc6bb11e30ae50db74c4752f31c57695927cd',0,'2019-05-26 06:32:25'),('f9006eae16bc15dc111e6291de86153a4a519c4f869d97ef9721725eea64f36c5a2ea965b7b794fe','69fe15660a321ad7afc39dccf03eb65375c9eff561c917d3ae449b8e74d565c94e3b3944a513713f',0,'2019-05-26 09:15:58'),('fbec1202a1350547ad9ce893b8332d2408f80324f7a0467dedc05c94fa2d543b4b3221b79718687d','ff19e557ae1718065cd74d5aedb9fb1f284a82f5ae9a9eed659e3b8e6948634a95f883d66a630c74',0,'2019-05-29 21:25:48'),('fc6f454c77743cfc985aed8102708b06eeba7c3e669034efe70b5b8309067075386aee02b63b81aa','1cafb7ece069fd54673bb97d907669a99abe667f1f0f666b1adacea0f38e7beaf099faae7d8cb79f',0,'2019-05-19 20:34:41'),('fc7053ee24ba9421d506ed2ab85bd3deafd6f7ad02042718f1cbfddfc9a903f9a73ba0437bc05ab0','659c5ff5bf25d22e3d99cec11258baeb0ee7fe9e29963301ac2088326d6a694e09fe45624310cd49',0,'2019-05-28 02:58:27'),('ffb1fd328198e87788584e0d3792d8d139370b092db3b87c59d5650c0c51fa1e9dc441612e9cedb2','87d7c612b88909480290ede54068e6d28d52f45bda3316c70263a0f882b157d073599e5566641aa3',0,'2019-05-26 09:05:47');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penetrating_passes`
--

LOCK TABLES `penetrating_passes` WRITE;
/*!40000 ALTER TABLE `penetrating_passes` DISABLE KEYS */;
INSERT INTO `penetrating_passes` VALUES (1,'Bajo','http://18.188.252.113/default.jpg','<= 3 pases que superan líneas',1,'2018-05-12 16:32:53','2018-05-12 16:32:53'),(2,'Medio','http://18.188.252.113/default.jpg','Entre 3-6 pases que superan líneas',1,'2018-05-12 16:33:36','2018-05-12 16:33:36'),(3,'Alto','http://18.188.252.113/default.jpg','>7 pases que superan líneas',1,'2018-05-12 16:36:23','2018-05-12 16:36:23'),(4,'fertg','http://18.188.252.113/default.jpg','erthyrt',0,'2018-05-27 19:38:31','2018-05-27 19:38:36');
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
INSERT INTO `pentagon_completions` VALUES (1,'Penta 0M','http://18.188.252.113/default.jpg','wetrg',0,'2018-05-11 04:52:56','2018-05-12 16:50:01'),(2,'Dentro del pentágono','http://18.188.252.113/pentagonCompletion/YrAxFlIfJsYKo2DZTFh0jyA8XMKNYc9rJWWOd5vD.jpeg','La ocasión de gol transcurre tiene lugar dentro del pentágono de finalización',1,'2018-05-12 16:51:12','2018-05-26 06:39:07'),(3,'Fuera del pentágono','http://18.188.252.113/pentagonCompletion/yJrGSthD7nYXbAMTGpdQuLlQZHDYjJp99VQIngD1.jpeg','La ocasión de gol transcurre tiene lugar fuera del pentágono de finalización',1,'2018-05-12 16:53:04','2018-05-23 18:03:45');
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
INSERT INTO `player_positions` VALUES (1,'Portero','http://18.188.252.113/playerPosition/qSMHMwvdBrzLSj1jnZG2cwIncSUah9EsjMilyiw4.jpeg','asdfghj',1,'2018-05-11 04:49:33','2018-05-26 06:36:24'),(2,'Defensa central','http://18.188.252.113/playerPosition/Spi1QhrzqmQmOsXaZcvGgmh0lt5p329pqpgNBN7q.jpeg','Jugada iniciada por el defensa central',1,'2018-05-12 15:43:49','2018-05-23 17:55:25'),(3,'Defensa lateral','http://18.188.252.113/playerPosition/DBQKZvyv1PLhMxGFhLGabizOAofrGBUWMCnz6r2w.jpeg','Jugada iniciada por el defensa lateral',1,'2018-05-12 15:44:51','2018-05-23 17:59:20'),(4,'Medio','http://18.188.252.113/playerPosition/icI0l6EC1sp7tleivT25AIcZijvu5R0yZ6xeZVOL.jpeg','Jugada iniciada por el volante medio',1,'2018-05-12 15:45:13','2018-05-23 17:59:59'),(5,'Medio exterior','http://18.188.252.113/playerPosition/BUKG5cWkQ0sLldbELv4pDZcLmQ1yClm6lbkaurZo.jpeg','Jugada iniciada por el volante exterior',1,'2018-05-12 15:52:20','2018-05-23 18:00:17'),(6,'Delantero','http://18.188.252.113/playerPosition/GTjJHpcI2rc31x3RCHbnmciGzTkhhgUiWHVw9RLK.jpeg','Jugada iniciada por el delantero',1,'2018-05-12 15:52:38','2018-05-23 18:00:50');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `possession_passes`
--

LOCK TABLES `possession_passes` WRITE;
/*!40000 ALTER TABLE `possession_passes` DISABLE KEYS */;
INSERT INTO `possession_passes` VALUES (1,'Pocos','http://18.188.252.113/possessionPass/qDUV2GKEiQQbGZIp0T0UfzdBRcZejqFJM3jK6pgm.jpeg','Máximo 3 pases realizados durante la posesión',1,'2018-05-12 16:28:03','2018-05-27 19:37:27'),(2,'Bastantes','http://18.188.252.113/default.jpg','Entre 4-6 pases realizados durante la posesión',1,'2018-05-12 16:29:51','2018-05-12 16:29:51'),(3,'Muchos','http://18.188.252.113/default.jpg','De 7 pases a más realizados durante la posesión',1,'2018-05-12 16:30:37','2018-05-12 16:30:37'),(4,'wet5e','http://18.188.252.113/default.jpg','rey46yu',0,'2018-05-27 19:37:52','2018-05-27 19:37:57');
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
INSERT INTO `previous_actions` VALUES (1,'Centro desde banda','http://18.188.252.113/previousAction/z6FMz21sWkWrelBEZuSOvlXT9oUsN3NWrTlgD9Lf.jpeg','La penútlima jugada antes de finalizar la acción se da con un centro desde la banda',1,'2018-05-12 17:02:53','2018-05-26 06:39:25'),(2,'Pase a profundidad','http://18.188.252.113/default.jpg','La penúltima jugada antes de finalizar la acción se da con un pase a profundidad',1,'2018-05-12 17:03:29','2018-05-12 17:03:29'),(3,'Pase lateral / atrás','http://18.188.252.113/default.jpg','La penúltima jugada antes de finalizar la acción se da con un pase lateral / atrás',1,'2018-05-12 17:05:13','2018-05-12 17:05:13'),(4,'Acción individual','http://18.188.252.113/default.jpg','La penúltima jugada antes de finalizar la acción se da con una acción individual',1,'2018-05-12 17:06:03','2018-05-12 17:06:03'),(5,'Rechace Portero / def','http://18.188.252.113/default.jpg','La penúltima jugada antes de finalizar la acción se da con un rechace del portero / defensa',1,'2018-05-12 17:06:53','2018-05-12 17:06:53'),(6,'Pared','http://18.188.252.113/default.jpg','La penúltima jugada antes de finalizar la acción se da con una pared entre dos jugadores',1,'2018-05-12 17:07:24','2018-05-12 17:07:24');
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
INSERT INTO `progression_types` VALUES (1,'12324324','http://18.188.252.113/default.jpg','fwfw3223',0,'2018-05-11 04:54:56','2018-05-12 16:45:22'),(2,'Directo','http://18.188.252.113/progressionType/8ZCOJr3Me66IHEGEx3eBuM7Az8UNE3tNprB33n4n.jpeg','La progresión de juego se realiza mediante un pase largo desde la línea del balón hacia la línea de delanteros situada en zona 4',1,'2018-05-12 16:44:32','2018-05-26 06:38:57'),(3,'Indirecto','http://18.188.252.113/default.jpg','La progresión en el juego se realiza mediante pases cortos en la que conectar la línea defensiva con la línea media y la línea de delanteros',1,'2018-05-12 16:45:18','2018-05-12 16:45:18');
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
INSERT INTO `start_types` VALUES (1,'Saque de banda','http://18.188.252.113/startType/PO1VsVQ7Pv9uSiQZi6xvzvZVTBJRjEjVEh9HIdYs.jpeg','El balón procede después de la ejecución del saque de banda',1,'2018-05-11 04:45:50','2018-05-26 06:34:44'),(2,'Tiro Libre','http://18.188.252.113/startType/ele1IkXENfa5bLatWoAvNxWxK03gdxxB10p27FSM.jpeg','El balón procede después de la ejecución del tiro libre',1,'2018-05-12 17:49:36','2018-05-23 17:49:43'),(3,'Saque de esquina','http://18.188.252.113/startType/SmiQWihJRTS3ghrOYNTLqA6PPxlun1iz36GOlYD3.jpeg','El balón procede después de la ejecución del saque de esquina',1,'2018-05-12 17:50:11','2018-05-23 17:50:24'),(4,'Saque de inicio','http://18.188.252.113/startType/6EFyqjULX77bjUwhjifJzfpp308AhsAIzFprh7Bf.jpeg','El balón procede después de la ejecución del saque de inicio',1,'2018-05-12 17:50:43','2018-05-23 17:50:37'),(5,'Penal','http://18.188.252.113/startType/ZO4XzDFZvM22Xq9Qlb9ekctO0jYUA8Xhz2gYw9TO.jpeg','El balón procede después de la ejecución del tiro penal',1,'2018-05-12 17:51:23','2018-05-23 17:50:48'),(6,'Apropiación','http://18.188.252.113/default.jpg','El balón procede de algún despeje o disputa',1,'2018-05-12 17:51:44','2018-05-12 17:51:44'),(7,'Robo','http://18.188.252.113/default.jpg','El balón es recuperado por una entrada sobre el rival',1,'2018-05-12 17:52:06','2018-05-12 17:52:06'),(8,'Interceptación','http://18.188.252.113/default.jpg','Se corta un pase entre dos oponentes, haciéndose con la posesión del balón.',1,'2018-05-12 17:52:32','2018-05-12 17:52:32');
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
INSERT INTO `stopped_balls` VALUES (1,'Tiro Libre','http://18.188.252.113/stoppedBall/Wm1PmYS0BFihcDIoDPGbhsaIv88Gms3zV7zejXk8.jpeg',NULL,1,'2018-05-11 04:52:28','2018-05-26 06:40:37'),(2,'Saque de esquina','http://18.188.252.113/stoppedBall/YMGq5zyq0H2oVLgVo0YBxIMCUiSNxjWZz3x2fl2S.jpeg',NULL,1,'2018-05-12 17:35:44','2018-05-23 18:04:34'),(3,'Lateral','http://18.188.252.113/stoppedBall/sb5vnKeT4C8tPZPiBskYjzSonsILtojw0AAtkCDU.jpeg',NULL,1,'2018-05-12 17:35:53','2018-05-23 18:04:41'),(4,'Saque de inicio','http://18.188.252.113/default.jpg',NULL,1,'2018-05-12 17:36:04','2018-05-12 17:36:04'),(5,'Saque de arco','http://18.188.252.113/stoppedBall/gfJoIgbhYjKiT7JuSwuI0DGulKwNsxh32ZwyTi0l.jpeg',NULL,1,'2018-05-12 17:36:11','2018-05-23 18:04:51'),(6,'Penal','http://18.188.252.113/stoppedBall/pJ1vtAKQJjWAuwxx9VX9QM2OTMAFo9PfNSTLjXyK.jpeg',NULL,1,'2018-05-12 17:36:18','2018-05-23 18:04:58');
/*!40000 ALTER TABLE `stopped_balls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tournament_club`
--

DROP TABLE IF EXISTS `tournament_club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tournament_club` (
  `tournament_id` int(11) unsigned NOT NULL,
  `club_id` int(11) unsigned NOT NULL,
  `rival_club_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`tournament_id`,`club_id`),
  KEY `tour_tour_club_idx` (`tournament_id`),
  KEY `club_tour_club_idx` (`club_id`),
  KEY `rclub_tour_club_idx` (`rival_club_id`),
  CONSTRAINT `club_tour_club_fk` FOREIGN KEY (`club_id`) REFERENCES `clubs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `rclub_tour_club_fk` FOREIGN KEY (`rival_club_id`) REFERENCES `clubs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tour_tour_club_fk` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tournament_club`
--

LOCK TABLES `tournament_club` WRITE;
/*!40000 ALTER TABLE `tournament_club` DISABLE KEYS */;
INSERT INTO `tournament_club` VALUES (1,4,2),(1,5,2),(1,6,2),(1,8,2),(1,9,2),(1,10,2),(1,11,2),(1,12,2),(1,13,2),(1,14,2),(1,15,2),(1,16,2),(1,17,2),(1,18,2),(2,7,3),(3,20,19),(3,21,19),(4,24,23),(4,25,23);
/*!40000 ALTER TABLE `tournament_club` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tournaments`
--

DROP TABLE IF EXISTS `tournaments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tournaments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_init` date NOT NULL,
  `date_end` date NOT NULL,
  `club_id` int(10) unsigned NOT NULL,
  `rival_club_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `club_tournament_idx` (`club_id`),
  CONSTRAINT `club_tournament_fk` FOREIGN KEY (`club_id`) REFERENCES `clubs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tournaments`
--

LOCK TABLES `tournaments` WRITE;
/*!40000 ALTER TABLE `tournaments` DISABLE KEYS */;
INSERT INTO `tournaments` VALUES (1,'Segunda División de Perú 2018','2018-04-07','2018-12-22',2,NULL,'2018-05-19 13:35:49','2018-05-19 13:35:49'),(2,'Torneo de Verano de Primera División 2018','2018-01-20','2018-05-12',3,NULL,'2018-05-19 15:58:16','2018-05-19 15:58:16'),(3,'FEDUP','2018-05-19','2018-06-09',19,NULL,'2018-05-19 20:38:01','2018-05-19 20:38:01'),(4,'Apertura','2018-05-01','2018-05-10',23,NULL,'2018-05-21 01:51:00','2018-05-21 01:51:00');
/*!40000 ALTER TABLE `tournaments` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin@ehp.pe','$2y$10$uJ0Kkny3pUctVaJB.cJ86Ohxlu04qFFrV0ovHiLBBGIkKGHqBD5Fu',2,NULL,NULL,'2018-05-01 22:11:10','2018-05-01 22:11:10'),(2,'Jean Carlo Jesús Vallejos Pongo','jjcvallejosp@outlook.com','$2y$10$7LfaOhp8mtWJv82Ayi8Af.mWzVCFjoItU3lGE0YPMccqwOiL06Re.',1,2,NULL,'2018-05-19 13:27:36','2018-05-19 13:27:36'),(3,'Jesús Vallejos','jeancva94@gmail.com','$2y$10$A8eIouS94fowgNxB8pXInOuY3S9sNa6p7Vej94lQcMjgdEQLwu5je',1,3,NULL,'2018-05-19 15:56:14','2018-05-19 15:56:14'),(4,'Esteban Quispe','estebanquispe2@gmail.com','$2y$10$8hJcfY6X98X.3f1qFnNsm.ioegdEtjiq2M5YAWwq6XXYW5NRecvWq',1,19,NULL,'2018-05-19 20:36:26','2018-05-19 20:36:26'),(5,'Juan Mosquera','jmosquera@gmail.com','$2y$10$cDjLqDp7ZEBfVRKg53WCeOlk2irkappAb0FT/I4WPgM/M6Th7p/tS',1,23,NULL,'2018-05-21 01:30:43','2018-05-21 01:30:43'),(6,'Carlos Galván','negrogalvan73@gmail.com','$2y$10$HQxaxxNhdI822ahztUYn6O1c/TuD9sjl/FGVZqkwrvPeIly7ZxLpC',1,2,NULL,'2018-05-24 19:45:39','2018-05-24 20:24:46'),(7,'Washington Villena','wvillena@gmail.com','$2y$10$ynzNQzzCMP2.cR2iuog88OTos8RUFASITXJEduKQXjwWbTTsR8szG',1,2,NULL,'2018-05-24 19:45:56','2018-05-24 19:45:56'),(8,'Esteban Quispe','estebanql@gmail.com','$2y$10$W5LuqXFVsb7twHqsg7471O9cy0QWuswd2BsC6IJqPAwTjb63sD4qu',1,1,NULL,'2018-05-25 05:13:27','2018-05-25 05:13:27'),(9,'Esteban Quispe Lopez','equispe@gmail.com','$2y$10$VrRj2jHCMXSrdk3wPLezUuIKrymYUDL0haxO3LgTiVufStr4RzcXq',1,2,NULL,'2018-05-28 01:41:17','2018-05-28 01:41:17');
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

-- Dump completed on 2018-05-29 16:50:19
