-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: dts
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('cl@gmail.com|172.16.10.254','i:1;',1737610310),('cl@gmail.com|172.16.10.254:timer','i:1737610310;',1737610310),('clorilla@gmail.com|172.16.10.254','i:2;',1737610068),('clorilla@gmail.com|172.16.10.254:timer','i:1737610068;',1737610068),('spatie.permission.cache','a:3:{s:5:\"alias\";a:4:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:2:{i:0;a:3:{s:1:\"a\";i:1;s:1:\"b\";s:12:\"manage_users\";s:1:\"c\";s:3:\"web\";}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:18:\"document_entry_all\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:3;}}}s:5:\"roles\";a:2:{i:0;a:3:{s:1:\"a\";i:1;s:1:\"b\";s:11:\"Super Admin\";s:1:\"c\";s:3:\"web\";}i:1;a:3:{s:1:\"a\";i:3;s:1:\"b\";s:4:\"Head\";s:1:\"c\";s:3:\"web\";}}}',1741845693);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `codetable_outgoing`
--

DROP TABLE IF EXISTS `codetable_outgoing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `codetable_outgoing` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `outgoing_id` bigint unsigned NOT NULL,
  `codetable_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codetable_outgoing_outgoing_id_foreign` (`outgoing_id`),
  KEY `codetable_outgoing_codetable_id_foreign` (`codetable_id`),
  CONSTRAINT `codetable_outgoing_codetable_id_foreign` FOREIGN KEY (`codetable_id`) REFERENCES `codetables` (`id`) ON DELETE CASCADE,
  CONSTRAINT `codetable_outgoing_outgoing_id_foreign` FOREIGN KEY (`outgoing_id`) REFERENCES `outgoings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codetable_outgoing`
--

LOCK TABLES `codetable_outgoing` WRITE;
/*!40000 ALTER TABLE `codetable_outgoing` DISABLE KEYS */;
INSERT INTO `codetable_outgoing` VALUES (1,164,9,NULL,NULL),(2,164,10,NULL,NULL),(3,169,9,NULL,NULL),(4,169,10,NULL,NULL),(5,171,9,NULL,NULL),(6,171,10,NULL,NULL),(7,175,9,NULL,NULL),(8,175,10,NULL,NULL),(9,180,9,NULL,NULL),(10,180,10,NULL,NULL),(11,186,9,NULL,NULL),(12,186,10,NULL,NULL),(13,190,9,NULL,NULL),(14,190,10,NULL,NULL),(15,192,9,NULL,NULL),(16,192,10,NULL,NULL),(17,195,9,NULL,NULL),(18,195,10,NULL,NULL),(19,199,9,NULL,NULL),(20,199,10,NULL,NULL),(21,202,9,NULL,NULL),(22,202,10,NULL,NULL),(23,204,9,NULL,NULL),(24,204,10,NULL,NULL),(25,217,9,NULL,NULL),(26,217,10,NULL,NULL),(27,219,9,NULL,NULL),(28,219,10,NULL,NULL),(29,221,9,NULL,NULL),(30,221,10,NULL,NULL),(31,224,9,NULL,NULL),(32,224,10,NULL,NULL),(33,234,9,NULL,NULL),(34,234,10,NULL,NULL),(35,241,9,NULL,NULL),(36,241,10,NULL,NULL),(37,243,9,NULL,NULL),(38,243,10,NULL,NULL),(39,247,9,NULL,NULL),(40,247,10,NULL,NULL),(41,250,9,NULL,NULL),(42,250,10,NULL,NULL),(43,253,9,NULL,NULL),(44,253,10,NULL,NULL),(45,255,10,NULL,NULL),(46,255,9,NULL,NULL),(47,258,9,NULL,NULL),(48,258,10,NULL,NULL),(49,260,9,NULL,NULL),(50,260,10,NULL,NULL);
/*!40000 ALTER TABLE `codetable_outgoing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `codetables`
--

DROP TABLE IF EXISTS `codetables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `codetables` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `codename` text COLLATE utf8mb4_unicode_ci,
  `codevalue` text COLLATE utf8mb4_unicode_ci,
  `desc1` text COLLATE utf8mb4_unicode_ci,
  `desc2` text COLLATE utf8mb4_unicode_ci,
  `desc3` text COLLATE utf8mb4_unicode_ci,
  `desc4` text COLLATE utf8mb4_unicode_ci,
  `desc5` text COLLATE utf8mb4_unicode_ci,
  `createdby` text COLLATE utf8mb4_unicode_ci,
  `date_created` date DEFAULT NULL,
  `edited_by` text COLLATE utf8mb4_unicode_ci,
  `date_edited` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codetables`
--

LOCK TABLES `codetables` WRITE;
/*!40000 ALTER TABLE `codetables` DISABLE KEYS */;
INSERT INTO `codetables` VALUES (1,'DOC_ORIGIN','EXTERNAL_ORIGIN','External',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'DOC_ORIGIN','INTERNAL_ORIGIN','Internal',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'DOC_TYPE','DOC_MEMO','Memo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'DOC_TYPE','DOC_FORM','Form',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'FORWARD_TYPE','FORWARD_INTERNAL','Internal',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'FORWARD_TYPE','FORWARD_EXTERNAL','External',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'DEPARTMENT','MISS','MISS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'DEPARTMENT','HRS','Human Resource',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'REQUESTED_ACTION','FOR_SIGNING','For Signing',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'REQUESTED_ACTION','FOR_RECEIVING','For receiving',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'PRIORITIZATION','SIMPLE','Simple Transaction',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'PRIORITIZATION','COMPLEX','Complex Transaction',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,'PRIORITIZATION','HIGHLY_TECHNICAL','Highly Technical Transaction',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `codetables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dept_head_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ref_series` int NOT NULL DEFAULT '1',
  `codevalue` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'MISS',1,NULL,NULL,24,'MISS'),(2,'RECORDS',1,NULL,NULL,3,'REC'),(3,'OED',1,NULL,NULL,1,'OED');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reference_number` varchar(450) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entered_by_id` bigint unsigned NOT NULL,
  `origin_id` bigint unsigned NOT NULL,
  `document_type_id` bigint unsigned NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci,
  `organization` text COLLATE utf8mb4_unicode_ci,
  `nlt` date DEFAULT NULL,
  `file_loc` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `completion_file` text COLLATE utf8mb4_unicode_ci,
  `is_forwardable_by_other_office` tinyint(1) NOT NULL DEFAULT '0',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `prioritization` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rec_reference_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `documents_rec_reference_number_unique` (`rec_reference_number`),
  UNIQUE KEY `reference_number_UNIQUE` (`reference_number`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (1,'REF-MISS-00021',9,1,3,'sdvd','fvfvd','2025-03-24',NULL,'2025-03-10 09:38:33','2025-03-10 09:39:00',NULL,1,'FORWARDED','vdvf','COMPLEX','2025-03-0000'),(2,'REF-MISS-00022',9,2,4,'svdvd','sddv','2025-03-10',NULL,'2025-03-10 09:39:14','2025-03-10 09:39:14',NULL,0,'ONHAND','dsdv','SIMPLE','2025-03-00'),(7,'REF-MISS-00023',9,1,3,'dsvfd','vdf','2025-03-24',NULL,'2025-03-10 10:03:40','2025-03-10 10:04:08',NULL,1,'FORWARDED','sfv','SIMPLE','2025-03-00001'),(8,'REF-MISS-00024',9,1,4,'ddvd','dfsfd','2025-03-24',NULL,'2025-03-10 10:04:29','2025-03-10 10:04:55',NULL,1,'FORWARDED','dsvfdv','HIGHLY_TECHNICAL','2025-03-00002');
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_outgoings`
--

DROP TABLE IF EXISTS `external_outgoings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `external_outgoings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `outgoing_id` bigint unsigned NOT NULL,
  `date_received` date DEFAULT NULL,
  `reference_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addressee` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `date_released` date DEFAULT NULL,
  `receiver_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deliver_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `courier_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `courier_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_outgoings`
--

LOCK TABLES `external_outgoings` WRITE;
/*!40000 ALTER TABLE `external_outgoings` DISABLE KEYS */;
INSERT INTO `external_outgoings` VALUES (1,213,NULL,NULL,'ADDRESSEE','SENDER','ADDRESS',NULL,NULL,NULL,'2025-02-26 22:36:49','2025-02-26 22:36:49',NULL,NULL),(2,217,NULL,NULL,'addressee','sender','address','2025-03-10','test','dfdf','2025-02-26 23:40:49','2025-03-10 06:18:08','dv','dvfd'),(3,219,'2025-03-04',NULL,'dcsdc','sender','navotas city','2025-03-04','rec','del','2025-03-03 19:41:07','2025-03-03 21:51:40',NULL,NULL),(4,221,'2025-03-04',NULL,'add','sen','scd','2025-03-10','dcdcs','cscds','2025-03-03 23:10:09','2025-03-10 06:13:13','dcc','cdcdc'),(5,224,'2025-03-04',NULL,'SDVS','DV','CSVF','2025-03-04','SCCSDC','SVFDV','2025-03-04 00:36:15','2025-03-04 00:37:44',NULL,NULL),(6,234,'2025-03-04',NULL,'csd','dccvf','csd','2025-03-04','vfv','dfv','2025-03-04 00:57:07','2025-03-04 00:58:04',NULL,NULL),(7,241,'2025-03-10','2025-3-00007','addressee','Send','navotas city',NULL,NULL,NULL,'2025-03-04 16:08:26','2025-03-10 08:32:21',NULL,NULL),(8,243,'2025-03-05','2025-03-00008','address','sender','vdc','2025-03-05','rec','del','2025-03-05 15:37:42','2025-03-05 15:42:25',NULL,NULL),(9,247,'2025-03-06','2025-03-00009','Ivan John Uy','Nikko Zamora','DICT Central Office','2025-03-06','Nikki Malinta','Gilbert','2025-03-06 08:25:28','2025-03-06 08:33:30',NULL,NULL),(10,250,'2025-03-10','2025-03-0012','addressee','sender','navotas city','2025-03-10','rec','del','2025-03-10 06:29:35','2025-03-10 08:34:16','DSC','245FBG'),(11,253,'2025-03-10','2025-03-0011','scs','scd','cds','2025-03-10','sdsv','db','2025-03-10 08:24:01','2025-03-10 08:25:31','dvfv','dvf'),(12,258,NULL,NULL,'addressee','sd','address',NULL,NULL,NULL,'2025-03-10 10:04:08','2025-03-10 10:04:08',NULL,NULL),(13,260,NULL,NULL,'dsc','ds','dcs',NULL,NULL,NULL,'2025-03-10 10:04:55','2025-03-10 10:04:55',NULL,NULL);
/*!40000 ALTER TABLE `external_outgoings` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
INSERT INTO `failed_jobs` VALUES (1,'26fe8677-8dc9-49a7-87d6-cd725f4414ca','database','default','{\"uuid\":\"26fe8677-8dc9-49a7-87d6-cd725f4414ca\",\"displayName\":\"App\\\\Jobs\\\\Document\\\\DocumentReceivedJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\Document\\\\DocumentReceivedJob\",\"command\":\"O:37:\\\"App\\\\Jobs\\\\Document\\\\DocumentReceivedJob\\\":0:{}\"}}','Error: Non-static method App\\Services\\Mail\\DocumentMailService::DocumentReceivedNotification() cannot be called statically in C:\\xampp2\\htdocs\\dts\\app\\Jobs\\Document\\DocumentReceivedJob.php:28\nStack trace:\n#0 C:\\xampp2\\htdocs\\dts\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\Document\\DocumentReceivedJob->handle()\n#1 C:\\xampp2\\htdocs\\dts\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#2 C:\\xampp2\\htdocs\\dts\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#3 C:\\xampp2\\htdocs\\dts\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#4 C:\\xampp2\\htdocs\\dts\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#5 C:\\xampp2\\htdocs\\dts\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#6 C:\\xampp2\\htdocs\\dts\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\Document\\DocumentReceivedJob))\n#7 C:\\xampp2\\htdocs\\dts\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\Document\\DocumentReceivedJob))\n#8 C:\\xampp2\\htdocs\\dts\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#9 C:\\xampp2\\htdocs\\dts\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\Document\\DocumentReceivedJob), false)\n#10 C:\\xampp2\\htdocs\\dts\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\Document\\DocumentReceivedJob))\n#11 C:\\xampp2\\htdocs\\dts\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\Document\\DocumentReceivedJob))\n#12 C:\\xampp2\\htdocs\\dts\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#13 C:\\xampp2\\htdocs\\dts\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\Document\\DocumentReceivedJob))\n#14 C:\\xampp2\\htdocs\\dts\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#15 C:\\xampp2\\htdocs\\dts\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#16 C:\\xampp2\\htdocs\\dts\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#17 C:\\xampp2\\htdocs\\dts\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(178): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\xampp2\\htdocs\\dts\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\xampp2\\htdocs\\dts\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#20 C:\\xampp2\\htdocs\\dts\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#21 C:\\xampp2\\htdocs\\dts\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#22 C:\\xampp2\\htdocs\\dts\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#23 C:\\xampp2\\htdocs\\dts\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#24 C:\\xampp2\\htdocs\\dts\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#25 C:\\xampp2\\htdocs\\dts\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#26 C:\\xampp2\\htdocs\\dts\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#27 C:\\xampp2\\htdocs\\dts\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\xampp2\\htdocs\\dts\\vendor\\symfony\\console\\Application.php(1047): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#29 C:\\xampp2\\htdocs\\dts\\vendor\\symfony\\console\\Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\xampp2\\htdocs\\dts\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\xampp2\\htdocs\\dts\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\xampp2\\htdocs\\dts\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1205): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\xampp2\\htdocs\\dts\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#34 {main}','2024-11-27 23:59:00');
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(5,'2024_11_20_012615_create_codetables_table',2),(9,'2024_11_20_012559_create_documents_table',3),(13,'2024_11_20_074238_create_outgoings_table',4),(14,'2024_11_21_013814_create_outgoing_codetable_table',5),(15,'2024_11_21_071349_add_is_received_flag',6),(19,'2024_11_21_074432_create_departments_table',7),(20,'2024_11_21_075047_add_department_id_in_users_table',7),(24,'2024_11_25_081546_add_completed_file_path',10),(25,'2024_11_26_055547_add_short_desc_in_department_table',10),(26,'2024_11_27_012647_create_trails_table',10),(27,'2024_12_03_030343_add_is_forwardable_by_other_on_documents_table',11),(28,'2024_12_04_015916_add_status_column_on_table',12),(29,'2024_12_04_052835_create_document_rejecteds_table',13),(32,'2024_12_16_080533_add_soft_delete_in_users',15),(33,'2025_01_01_234930_create_permission_tables',16),(35,'2025_01_22_024432_create_user_invites_table',17),(36,'2025_01_30_051925_add_description_in_document_entry',18),(38,'2025_01_30_092519_add_curr_document_location',19),(39,'2025_01_30_090842_add_stage_on_outgoing_documents',20),(40,'2025_02_04_050659_create_outgoing_changes_table',21),(41,'2025_02_04_052851_create_documet_status_histories_table',22),(42,'2025_02_04_053342_add_status_on_trail_table',23),(43,'2025_02_06_002403_add_forwarded_by_id',24),(44,'2025_02_06_013159_add_done_flag',25),(45,'2025_02_06_072542_add_parent_id',26),(46,'2025_02_10_071305_add_action_taken_file_in_outgoings_table',27),(47,'2025_02_11_065514_add_additional_trail_columns',28),(48,'2025_02_13_004611_create_outgoing_rejecteds_table',29),(50,'2025_02_20_062157_add_external_office_column',30),(51,'2025_02_25_050847_add_reference_number_cols_in_departments',31),(53,'2025_02_27_052443_create_external_outgoings_table',32),(54,'2025_03_04_053403_add_is_released_column_in_outgoing',33),(55,'2025_03_10_133956_add_additional_columns_in__outgoing_external',34),(56,'2025_03_10_150923_add_prioritization_col_in_documents_table',35),(57,'2025_03_10_170819_add_records_reference_number_in_documents',36),(58,'2025_03_10_171752_create_records_reference_numbers_table',37);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
INSERT INTO `model_has_permissions` VALUES (1,'App\\Models\\User',1),(1,'App\\Models\\User',6);
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\Models\\User',1),(3,'App\\Models\\User',4),(3,'App\\Models\\User',5),(2,'App\\Models\\User',6),(3,'App\\Models\\User',7),(1,'App\\Models\\User',9),(4,'App\\Models\\User',10),(3,'App\\Models\\User',11),(4,'App\\Models\\User',12),(3,'App\\Models\\User',13),(4,'App\\Models\\User',14);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outgoing_rejecteds`
--

DROP TABLE IF EXISTS `outgoing_rejecteds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `outgoing_rejecteds` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `rejected_by_id` bigint unsigned NOT NULL,
  `outgoing_id` bigint unsigned NOT NULL,
  `date_rejected` date DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outgoing_rejecteds`
--

LOCK TABLES `outgoing_rejecteds` WRITE;
/*!40000 ALTER TABLE `outgoing_rejecteds` DISABLE KEYS */;
INSERT INTO `outgoing_rejecteds` VALUES (1,11,165,'2025-02-18','rejected','2025-02-17 21:14:29','2025-02-17 21:14:29'),(2,11,166,'2025-02-18','rejected','2025-02-17 21:15:10','2025-02-17 21:15:10'),(3,11,172,'2025-02-18','dvfdv','2025-02-17 21:32:30','2025-02-17 21:32:30'),(4,11,173,'2025-02-18','dvfdv','2025-02-17 21:33:11','2025-02-17 21:33:11'),(5,11,176,'2025-02-18','dvfd','2025-02-17 21:40:44','2025-02-17 21:40:44'),(6,11,177,'2025-02-18','dvfd','2025-02-17 21:41:02','2025-02-17 21:41:02'),(7,11,187,'2025-02-19','Paki edit','2025-02-18 19:46:08','2025-02-18 19:46:08'),(8,11,188,'2025-02-19','Paki edit','2025-02-18 19:47:31','2025-02-18 19:47:31'),(9,11,207,'2025-02-20','edit tthis','2025-02-19 23:58:59','2025-02-19 23:58:59');
/*!40000 ALTER TABLE `outgoing_rejecteds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outgoings`
--

DROP TABLE IF EXISTS `outgoings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `outgoings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `accomplished_by_id` bigint unsigned DEFAULT NULL,
  `forward_type_id` bigint unsigned DEFAULT NULL,
  `department_id` bigint unsigned DEFAULT NULL,
  `document_entry_id` bigint unsigned DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_received` tinyint(1) NOT NULL DEFAULT '0',
  `date_received` date DEFAULT NULL,
  `outgoing_status` varchar(450) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `forwarded_by` bigint unsigned NOT NULL,
  `is_claimed` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` bigint unsigned NOT NULL,
  `signed_file` text COLLATE utf8mb4_unicode_ci,
  `external_office` text COLLATE utf8mb4_unicode_ci,
  `is_released` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outgoings`
--

LOCK TABLES `outgoings` WRITE;
/*!40000 ALTER TABLE `outgoings` DISABLE KEYS */;
INSERT INTO `outgoings` VALUES (163,NULL,NULL,1,1,NULL,'2025-02-17 21:10:35','2025-02-17 21:10:35',0,NULL,'DRAFT',9,0,0,NULL,NULL,0),(164,NULL,5,2,1,'dc','2025-02-17 21:10:44','2025-02-17 21:13:11',0,NULL,'RECEIVED',9,0,0,NULL,NULL,0),(165,NULL,5,2,1,'dc','2025-02-17 21:14:29','2025-02-17 21:15:10',0,NULL,'REJECTED',11,1,164,NULL,NULL,0),(166,NULL,5,1,1,'SC','2025-02-17 21:15:10','2025-02-17 21:18:49',0,NULL,'FORWARDED',11,1,165,NULL,NULL,0),(167,NULL,5,2,1,'SC','2025-02-17 21:18:50','2025-02-17 21:18:50',0,NULL,'PENDING',9,0,166,NULL,NULL,0),(168,NULL,NULL,1,2,NULL,'2025-02-17 21:28:04','2025-02-17 21:28:04',0,NULL,'DRAFT',9,0,0,NULL,NULL,0),(169,NULL,5,2,2,'dfvghg','2025-02-17 21:28:28','2025-02-17 21:28:28',0,NULL,'PENDING',9,0,0,NULL,NULL,0),(170,NULL,NULL,1,3,NULL,'2025-02-17 21:31:24','2025-02-17 21:31:24',0,NULL,'DRAFT',9,0,0,NULL,NULL,0),(171,NULL,5,2,3,'sdc','2025-02-17 21:31:35','2025-02-17 21:32:11',0,NULL,'RECEIVED',9,0,0,NULL,NULL,0),(172,NULL,5,2,3,'sdc','2025-02-17 21:32:30','2025-02-17 21:33:11',0,NULL,'REJECTED',11,1,171,NULL,NULL,0),(173,NULL,5,1,3,'sdc','2025-02-17 21:33:11','2025-02-17 21:33:11',0,NULL,'REJECTED',11,1,172,NULL,NULL,0),(174,NULL,NULL,1,4,NULL,'2025-02-17 21:39:38','2025-02-17 21:39:38',0,NULL,'DRAFT',9,0,0,NULL,NULL,0),(175,NULL,5,2,4,'ddvfvv','2025-02-17 21:39:50','2025-02-17 21:40:18',0,NULL,'RECEIVED',9,0,0,NULL,NULL,0),(176,NULL,5,2,4,'ddvfvv','2025-02-17 21:40:44','2025-02-17 21:41:02',0,NULL,'REJECTED',11,1,175,NULL,NULL,0),(177,NULL,5,1,4,'ddvfvv','2025-02-17 21:41:02','2025-02-17 21:41:02',0,NULL,'REJECTED',11,1,176,NULL,NULL,0),(178,NULL,5,2,4,'dssfvgh','2025-02-17 21:41:39','2025-02-17 21:45:50',0,NULL,'RECEIVED',9,0,177,NULL,NULL,0),(179,NULL,NULL,1,5,NULL,'2025-02-17 23:44:11','2025-02-17 23:44:11',0,NULL,'DRAFT',9,0,0,NULL,NULL,0),(180,NULL,5,2,5,'dfvd','2025-02-17 23:44:22','2025-02-17 23:44:22',0,NULL,'PENDING',9,0,0,NULL,NULL,0),(181,NULL,6,1,6,'DVF','2025-02-18 01:48:12','2025-02-19 23:11:39',0,NULL,'FORWARDED',9,0,0,NULL,NULL,0),(182,NULL,5,2,7,'for testing','2025-02-18 17:45:24','2025-02-18 17:55:38',0,NULL,'FORWARDED',11,0,0,NULL,NULL,0),(183,NULL,5,1,7,'for testing','2025-02-18 17:55:38','2025-02-18 19:14:27',0,NULL,'ACTION_TAKEN',11,1,182,'',NULL,0),(184,NULL,5,2,7,'for testing','2025-02-18 19:14:27','2025-02-18 19:14:27',0,NULL,'ACTION_TAKEN',9,1,183,NULL,NULL,0),(185,NULL,NULL,1,8,NULL,'2025-02-18 19:38:27','2025-02-18 19:38:27',0,NULL,'DRAFT',9,0,0,NULL,NULL,0),(186,NULL,5,2,8,'FROM MA\'AM ENENG NOTE','2025-02-18 19:42:22','2025-02-18 19:43:44',0,NULL,'ACTION_TAKEN',9,0,0,'',NULL,0),(187,NULL,5,2,8,'FROM MA\'AM ENENG NOTE','2025-02-18 19:46:08','2025-02-18 19:47:31',0,NULL,'REJECTED',11,1,186,NULL,NULL,0),(188,NULL,5,1,8,'FROM MA\'AM ENENG NOTE','2025-02-18 19:47:31','2025-02-18 19:47:31',0,NULL,'REJECTED',11,1,187,NULL,NULL,0),(189,NULL,NULL,1,9,NULL,'2025-02-18 21:31:54','2025-02-18 21:31:54',0,NULL,'DRAFT',9,0,0,NULL,NULL,0),(190,NULL,6,2,9,'dsfvd','2025-02-18 21:32:06','2025-02-18 21:32:06',0,NULL,'PENDING',9,0,0,NULL,NULL,0),(191,NULL,NULL,1,10,NULL,'2025-02-18 21:35:16','2025-02-18 21:35:16',0,NULL,'DRAFT',9,0,0,NULL,NULL,0),(192,NULL,5,2,10,'note','2025-02-18 21:35:31','2025-02-18 21:41:04',0,NULL,'ACTION_TAKEN',9,1,0,'',NULL,0),(193,NULL,5,1,10,'note','2025-02-18 21:41:04','2025-02-18 21:41:04',0,NULL,'ACTION_TAKEN',11,1,192,NULL,NULL,0),(194,NULL,NULL,1,11,NULL,'2025-02-19 17:19:56','2025-02-19 17:19:56',0,NULL,'DRAFT',9,0,0,NULL,NULL,0),(195,NULL,5,2,11,'note here','2025-02-19 17:20:24','2025-02-19 17:20:24',0,NULL,'PENDING',9,0,0,NULL,NULL,0),(196,NULL,6,NULL,6,'DVF','2025-02-19 23:11:39','2025-02-19 23:11:39',0,NULL,'PENDING',9,0,181,NULL,NULL,0),(197,NULL,NULL,1,12,NULL,'2025-02-19 23:24:48','2025-02-19 23:24:48',0,NULL,'DRAFT',9,0,0,NULL,NULL,0),(198,NULL,NULL,1,13,NULL,'2025-02-19 23:33:53','2025-02-19 23:33:53',0,NULL,'DRAFT',9,0,0,NULL,NULL,0),(199,NULL,6,2,13,'dsvfd','2025-02-19 23:34:06','2025-02-19 23:34:06',0,NULL,'PENDING',9,0,0,NULL,NULL,0),(200,NULL,NULL,1,14,NULL,'2025-02-19 23:35:26','2025-02-19 23:35:26',0,NULL,'DRAFT',9,0,0,NULL,NULL,0),(201,NULL,NULL,1,15,NULL,'2025-02-19 23:40:48','2025-02-19 23:40:48',0,NULL,'DRAFT',9,0,0,NULL,NULL,0),(202,NULL,6,2,15,'dsvf','2025-02-19 23:40:57','2025-02-19 23:40:57',0,NULL,'PENDING',9,0,0,NULL,NULL,0),(203,NULL,NULL,1,16,NULL,'2025-02-19 23:46:17','2025-02-19 23:46:17',0,NULL,'DRAFT',9,0,0,NULL,NULL,0),(204,NULL,6,2,16,'hh','2025-02-19 23:46:25','2025-02-19 23:59:19',0,NULL,'ACTION_TAKEN',9,0,0,'','g',0),(205,NULL,6,1,17,'fg','2025-02-19 23:47:09','2025-02-19 23:53:35',0,NULL,'FORWARDED',9,0,0,NULL,NULL,0),(206,NULL,6,2,17,'fg','2025-02-19 23:53:35','2025-02-19 23:57:44',0,NULL,'RECEIVED',9,0,205,NULL,'dict',0),(207,NULL,6,2,17,'fg','2025-02-19 23:58:58','2025-02-19 23:58:58',0,NULL,'REJECTED',11,0,206,NULL,'dict',0),(208,NULL,NULL,1,19,NULL,'2025-02-24 21:38:37','2025-02-24 21:38:37',0,NULL,'DRAFT',9,0,0,NULL,NULL,0),(209,NULL,NULL,1,20,NULL,'2025-02-24 21:44:21','2025-02-24 21:44:21',0,NULL,'DRAFT',9,0,0,NULL,NULL,0),(210,NULL,NULL,1,21,NULL,'2025-02-24 21:44:53','2025-02-24 21:44:53',0,NULL,'DRAFT',9,0,0,NULL,NULL,0),(211,NULL,NULL,1,22,NULL,'2025-02-24 21:48:17','2025-02-24 21:48:17',0,NULL,'DRAFT',9,0,0,NULL,NULL,0),(212,NULL,NULL,1,23,NULL,'2025-02-24 21:51:53','2025-02-24 21:51:53',0,NULL,'DRAFT',9,0,0,NULL,NULL,0),(213,NULL,6,1,24,'NOTE','2025-02-25 18:04:37','2025-02-26 22:36:49',0,NULL,'FORWARDED',9,0,0,NULL,NULL,0),(214,NULL,6,2,24,'NOTE','2025-02-26 22:36:49','2025-02-26 22:36:49',0,NULL,'PENDING',9,0,213,NULL,'DICT',0),(215,NULL,5,1,25,'dsvfdv','2025-02-26 22:41:29','2025-03-04 01:40:08',0,NULL,'FORWARDED',9,0,0,NULL,NULL,0),(216,NULL,NULL,1,26,NULL,'2025-02-26 23:40:25','2025-02-26 23:40:25',0,NULL,'DRAFT',9,0,0,NULL,NULL,0),(217,NULL,6,2,26,'note','2025-02-26 23:40:48','2025-03-10 06:18:08',0,NULL,'FORWARDED',9,0,0,NULL,'dvfdv',1),(218,NULL,NULL,1,28,NULL,'2025-03-03 19:40:31','2025-03-03 19:40:31',0,NULL,'DRAFT',9,0,0,NULL,NULL,0),(219,NULL,6,2,28,'dcc','2025-03-03 19:41:07','2025-03-03 21:51:40',0,NULL,'RECEIVED',9,0,0,NULL,'DICT',1),(220,NULL,NULL,1,29,NULL,'2025-03-03 23:09:47','2025-03-03 23:09:47',0,NULL,'DRAFT',9,0,0,NULL,NULL,0),(221,NULL,6,2,29,'note','2025-03-03 23:10:09','2025-03-10 06:13:13',0,NULL,'FORWARDED',9,0,0,NULL,'PhilHealth',1),(222,NULL,NULL,2,30,NULL,'2025-03-04 00:32:03','2025-03-04 00:32:03',0,NULL,'DRAFT',11,0,0,NULL,NULL,0),(223,NULL,NULL,1,31,NULL,'2025-03-04 00:36:03','2025-03-04 00:36:03',0,NULL,'DRAFT',9,0,0,NULL,NULL,0),(224,NULL,6,2,31,'CDSVDSV','2025-03-04 00:36:15','2025-03-04 00:39:35',0,NULL,'ACTION_TAKEN',9,1,0,'','DICT',0),(225,NULL,6,2,31,'CDSVDSV','2025-03-04 00:39:35','2025-03-04 00:39:35',0,NULL,'ACTION_TAKEN',11,1,224,NULL,NULL,0),(226,NULL,6,2,31,'CDSVDSV','2025-03-04 00:43:41','2025-03-04 00:43:53',0,NULL,'CLAIMED',11,1,225,NULL,NULL,0),(227,NULL,6,2,31,'CDSVDSV','2025-03-04 00:43:53','2025-03-04 00:43:53',0,NULL,'ACTION_TAKEN',11,1,226,NULL,NULL,0),(228,NULL,6,2,31,'CDSVDSV','2025-03-04 00:45:16','2025-03-04 00:45:16',0,NULL,'ACTION_TAKEN',11,1,227,NULL,NULL,0),(229,NULL,6,2,31,'CDSVDSV','2025-03-04 00:47:19','2025-03-04 00:50:04',0,NULL,'ACTION_TAKEN',11,1,228,NULL,NULL,0),(230,NULL,6,2,31,'CDSVDSV','2025-03-04 00:50:04','2025-03-04 00:50:04',0,NULL,'CLAIMED',11,1,229,NULL,NULL,0),(231,NULL,6,2,31,'CDSVDSV','2025-03-04 00:50:44','2025-03-04 00:52:49',0,NULL,'ACTION_TAKEN',11,1,230,NULL,NULL,0),(232,NULL,5,1,31,'cvfd','2025-03-04 00:52:49','2025-03-04 01:34:00',0,NULL,'FORWARDED',11,1,231,NULL,NULL,0),(233,NULL,NULL,1,32,NULL,'2025-03-04 00:56:55','2025-03-04 00:56:55',0,NULL,'DRAFT',9,0,0,NULL,NULL,0),(234,NULL,6,2,32,'ddvfd','2025-03-04 00:57:07','2025-03-04 00:58:48',0,NULL,'ACTION_TAKEN',9,1,0,'','DICT',0),(235,NULL,6,1,32,'ddvfd','2025-03-04 00:58:48','2025-03-04 00:58:48',0,NULL,'CLAIMED',11,1,234,NULL,NULL,0),(236,NULL,5,3,31,'cvfd','2025-03-04 01:34:00','2025-03-04 01:34:00',0,NULL,'PENDING',9,0,232,NULL,NULL,0),(237,NULL,5,3,25,'dsvfdv','2025-03-04 01:40:08','2025-03-04 01:40:38',0,NULL,'ACTION_TAKEN',9,1,215,'',NULL,0),(238,NULL,5,1,25,'dsvdv','2025-03-04 01:40:38','2025-03-04 01:40:59',0,NULL,'FORWARDED',14,1,237,NULL,NULL,0),(239,NULL,5,2,25,'dsvdv','2025-03-04 01:40:59','2025-03-04 01:40:59',0,NULL,'PENDING',9,0,238,NULL,NULL,0),(240,NULL,NULL,1,33,NULL,'2025-03-04 16:08:04','2025-03-04 16:08:04',0,NULL,'DRAFT',9,0,0,NULL,NULL,0),(241,NULL,6,2,33,'dc','2025-03-04 16:08:26','2025-03-10 08:32:21',0,NULL,'RECEIVED',9,0,0,NULL,'DOST',0),(242,NULL,NULL,1,34,NULL,'2025-03-05 15:37:15','2025-03-05 15:37:15',0,NULL,'DRAFT',9,0,0,NULL,NULL,0),(243,NULL,6,2,34,'notes 1','2025-03-05 15:37:42','2025-03-05 15:48:03',0,NULL,'ACTION_TAKEN',9,1,0,'','DOST',0),(244,NULL,6,1,34,'notes 1','2025-03-05 15:48:03','2025-03-05 15:48:03',0,NULL,'CLAIMED',11,1,243,NULL,NULL,0),(245,NULL,NULL,1,35,NULL,'2025-03-06 00:51:33','2025-03-06 00:51:33',0,NULL,'DRAFT',9,0,0,NULL,NULL,0),(246,NULL,NULL,1,36,NULL,'2025-03-06 08:22:38','2025-03-06 08:22:38',0,NULL,'DRAFT',9,0,0,NULL,NULL,0),(247,NULL,6,2,36,'sample note','2025-03-06 08:25:28','2025-03-06 08:49:19',0,NULL,'ACTION_TAKEN',9,1,0,'','DICT',0),(248,NULL,6,1,36,'sample note','2025-03-06 08:49:19','2025-03-06 08:49:19',0,NULL,'CLAIMED',11,1,247,NULL,NULL,0),(249,NULL,NULL,1,37,NULL,'2025-03-10 06:29:12','2025-03-10 06:29:12',0,NULL,'DRAFT',9,0,0,NULL,NULL,0),(250,NULL,6,2,37,'note','2025-03-10 06:29:35','2025-03-10 08:34:16',0,NULL,'FORWARDED',9,0,0,NULL,'DICT',1),(251,NULL,NULL,2,38,NULL,'2025-03-10 07:33:13','2025-03-10 07:33:13',0,NULL,'DRAFT',11,0,0,NULL,NULL,0),(252,NULL,NULL,1,39,NULL,'2025-03-10 08:23:45','2025-03-10 08:23:45',0,NULL,'DRAFT',9,0,0,NULL,NULL,0),(253,NULL,6,2,39,'dcc','2025-03-10 08:24:01','2025-03-10 08:25:31',0,NULL,'FORWARDED',9,0,0,NULL,'DICT',1),(254,NULL,NULL,1,1,NULL,'2025-03-10 09:38:33','2025-03-10 09:38:33',0,NULL,'DRAFT',9,0,0,NULL,NULL,0),(255,NULL,5,2,1,'svdfv','2025-03-10 09:39:00','2025-03-10 09:39:00',0,NULL,'PENDING',9,0,0,NULL,NULL,0),(256,NULL,NULL,1,2,NULL,'2025-03-10 09:39:14','2025-03-10 09:39:14',0,NULL,'DRAFT',9,0,0,NULL,NULL,0),(257,NULL,NULL,1,7,NULL,'2025-03-10 10:03:40','2025-03-10 10:03:40',0,NULL,'DRAFT',9,0,0,NULL,NULL,0),(258,NULL,6,2,7,'vd','2025-03-10 10:04:08','2025-03-10 10:04:08',0,NULL,'PENDING',9,0,0,NULL,'sd',0),(259,NULL,NULL,1,8,NULL,'2025-03-10 10:04:29','2025-03-10 10:04:29',0,NULL,'DRAFT',9,0,0,NULL,NULL,0),(260,NULL,6,2,8,'ddsc','2025-03-10 10:04:55','2025-03-10 10:04:55',0,NULL,'PENDING',9,0,0,NULL,'DICT',0);
/*!40000 ALTER TABLE `outgoings` ENABLE KEYS */;
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
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'manage_users','web','2025-01-01 16:03:48','2025-01-01 16:03:48'),(2,'document_entry_all','web',NULL,NULL);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `records_reference_numbers`
--

DROP TABLE IF EXISTS `records_reference_numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `records_reference_numbers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `series` int NOT NULL DEFAULT '1',
  `last_reset` varchar(450) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `records_reference_numbers`
--

LOCK TABLES `records_reference_numbers` WRITE;
/*!40000 ALTER TABLE `records_reference_numbers` DISABLE KEYS */;
INSERT INTO `records_reference_numbers` VALUES (1,2,'2025','2025-03-10 09:38:33','2025-03-10 10:04:29');
/*!40000 ALTER TABLE `records_reference_numbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` VALUES (2,1),(2,3);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
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
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Super Admin','web',NULL,NULL),(2,'Supervisor','web',NULL,NULL),(3,'Head','web',NULL,NULL),(4,'Employee','web',NULL,NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('2vq44zJ0AHOBNSxjZJ5IE6N7B1NfjolEBggxK4eR',9,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoielM3WGpjT2VlajJtcVVMcXBsQ0ZoQ2pmYzVkYnlMWU5VNlgwM1dZTCI7czozOiJ1cmwiO2E6MDp7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjk7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTAzOiJodHRwOi8vbG9jYWxob3N0OjgwODAvZHRzL3JlcG9ydHMvZXhwb3J0L0V4cG9ydEFsbERvY3VtZW50RW50ZXJlZD9mcm9tPTIwMjUtMDMtMDUmb2ZmaWNlPSZ0bz0yMDI1LTAzLTEzIjt9fQ==',1741750442),('dZfTlW0bb5FuX6XJR1SQ9dgUSn0L6JWUGYx1Ekpc',9,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoieWd4bFg4WDFRRThMMlZiTldrZm05Wm9RZ1F2RjM4S2Q3ZmVxRHJMOCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM0OiJodHRwOi8vbG9jYWxob3N0OjgwODAvZHRzL2RvY3VtZW50Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6OTt9',1741773423),('PILduS3ct8Wao9hol39tQFjTewg5BtTHQ5ODRZHm',9,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiNjEyM0E0OU80YkZ5dnd0Sk8xbXNVWVVOQzc1VmxlVDVCM2tqQUF0OSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQ3OiJodHRwOi8vbG9jYWxob3N0OjgwODAvZHRzL2RvY3VtZW50L2RvY2VudHJ5TGlzdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjk7fQ==',1741762849);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trails`
--

DROP TABLE IF EXISTS `trails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trails` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `trailable_id` bigint unsigned NOT NULL,
  `trailable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `update_by_id` bigint unsigned NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latest_transaction` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `outgoing_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trails`
--

LOCK TABLES `trails` WRITE;
/*!40000 ALTER TABLE `trails` DISABLE KEYS */;
INSERT INTO `trails` VALUES (1,1,'App\\Models\\Document','REF-00001 has been created by Nikko Niel Zamora-MISS','2025-02-17 21:10:35','2025-02-17 21:10:35',9,NULL,'ENCODED',0),(2,1,'App\\Models\\Document','REF-00001 has been forwarded to RECORDS by Nikko Niel Zamora - MISS','2025-02-17 21:10:44','2025-02-17 21:10:44',9,NULL,'FORWARDED',164),(3,1,'App\\Models\\Document','REF-00001 has been RECEIVED by Record Head - RECORDS','2025-02-17 21:13:11','2025-02-17 21:13:11',11,NULL,'RECEIVED',164),(4,1,'App\\Models\\Document','REF-00001 has been tagged as REJECTED by Record Head - RECORDS','2025-02-17 21:14:29','2025-02-17 21:14:29',11,NULL,'REJECTED',164),(5,1,'App\\Models\\Document','REF-00001 with Rejected status has been tagged as claimed by Record Head - RECORDS','2025-02-17 21:15:10','2025-02-17 21:15:10',11,NULL,'CLAIMED',165),(6,1,'App\\Models\\Document','REF-00001 has been tagged as claimed by Record Head - RECORDS','2025-02-17 21:15:10','2025-02-17 21:15:10',11,NULL,'CLAIMED',165),(7,1,'App\\Models\\Document','REF-00001 has been forwarded to RECORDS by Nikko Niel Zamora - MISS','2025-02-17 21:18:50','2025-02-17 21:18:50',9,NULL,'FORWARDED',166),(8,2,'App\\Models\\Document','REF-00002 has been created by Nikko Niel Zamora-MISS','2025-02-17 21:28:04','2025-02-17 21:28:04',9,NULL,'ENCODED',0),(9,2,'App\\Models\\Document','REF-00002 has been forwarded to RECORDS by Nikko Niel Zamora - MISS','2025-02-17 21:28:28','2025-02-17 21:28:28',9,NULL,'FORWARDED',169),(10,3,'App\\Models\\Document','REF-00003 has been created by Nikko Niel Zamora-MISS','2025-02-17 21:31:24','2025-02-17 21:31:24',9,NULL,'ENCODED',0),(11,3,'App\\Models\\Document','REF-00003 has been forwarded to RECORDS by Nikko Niel Zamora - MISS','2025-02-17 21:31:35','2025-02-17 21:31:35',9,NULL,'FORWARDED',171),(12,3,'App\\Models\\Document','REF-00003 has been RECEIVED by Record Head - RECORDS','2025-02-17 21:32:11','2025-02-17 21:32:11',11,NULL,'RECEIVED',171),(13,3,'App\\Models\\Document','REF-00003 has been tagged as REJECTED by Record Head - RECORDS','2025-02-17 21:32:30','2025-02-17 21:32:30',11,NULL,'REJECTED',171),(14,3,'App\\Models\\Document','REF-00003 with Rejected status has been tagged as claimed by Record Head - RECORDS','2025-02-17 21:33:11','2025-02-17 21:33:11',11,NULL,'CLAIMED',172),(15,3,'App\\Models\\Document','REF-00003 has been tagged as claimed by Record Head - RECORDS','2025-02-17 21:33:11','2025-02-17 21:33:11',11,NULL,'CLAIMED',172),(16,4,'App\\Models\\Document','REF-00004 has been created by Nikko Niel Zamora-MISS','2025-02-17 21:39:38','2025-02-17 21:39:38',9,NULL,'ENCODED',0),(17,4,'App\\Models\\Document','REF-00004 has been forwarded to RECORDS by Nikko Niel Zamora - MISS','2025-02-17 21:39:50','2025-02-17 21:39:50',9,NULL,'FORWARDED',175),(18,4,'App\\Models\\Document','REF-00004 has been RECEIVED by Record Head - RECORDS','2025-02-17 21:40:18','2025-02-17 21:40:18',11,NULL,'RECEIVED',175),(19,4,'App\\Models\\Document','REF-00004 has been tagged as REJECTED by Record Head - RECORDS','2025-02-17 21:40:44','2025-02-17 21:40:44',11,NULL,'REJECTED',175),(20,4,'App\\Models\\Document','REF-00004 with Rejected status has been tagged as claimed by Record Head - RECORDS','2025-02-17 21:41:02','2025-02-17 21:41:02',11,NULL,'CLAIMED',176),(21,4,'App\\Models\\Document','REF-00004 has been tagged as claimed by Record Head - RECORDS','2025-02-17 21:41:02','2025-02-17 21:41:02',11,NULL,'CLAIMED',176),(22,4,'App\\Models\\Document','REF-00004 - tthis rejected document has been forwarded to RECORDS by Nikko Niel Zamora - MISS','2025-02-17 21:41:39','2025-02-17 21:41:39',9,NULL,'FORWARDED',177),(23,4,'App\\Models\\Document','REF-00004 has been RECEIVED by Record Head - RECORDS','2025-02-17 21:45:50','2025-02-17 21:45:50',11,NULL,'RECEIVED',178),(24,5,'App\\Models\\Document','REF-00005 has been created by Nikko Niel Zamora-MISS','2025-02-17 23:44:11','2025-02-17 23:44:11',9,NULL,'ENCODED',0),(25,5,'App\\Models\\Document','REF-00005 has been forwarded to RECORDS by Nikko Niel Zamora - MISS','2025-02-17 23:44:22','2025-02-17 23:44:22',9,NULL,'FORWARDED',180),(26,6,'App\\Models\\Document','REF-00006 has been created by Nikko Niel Zamora-MISS','2025-02-18 01:48:12','2025-02-18 01:48:12',9,NULL,'ENCODED',0),(27,7,'App\\Models\\Document','REF-00007 has been created by Record Head-RECORDS','2025-02-18 17:45:24','2025-02-18 17:45:24',11,NULL,'ENCODED',0),(28,7,'App\\Models\\Document','REF-00007 has been forwarded to MISS by Record Head - RECORDS','2025-02-18 17:55:38','2025-02-18 17:55:38',11,NULL,'FORWARDED',182),(29,7,'App\\Models\\Document','REF-00007 has been RECEIVED by Nikko Niel Zamora - MISS','2025-02-18 18:04:58','2025-02-18 18:04:58',9,NULL,'RECEIVED',183),(30,7,'App\\Models\\Document','REF-00007 - Action has been taken by Nikko Niel Zamora - MISS','2025-02-18 18:09:39','2025-02-18 18:09:39',9,NULL,'ACTION_TAKEN',183),(31,7,'App\\Models\\Document','REF-00007 has been tagged as claimed by Nikko Niel Zamora - MISS','2025-02-18 19:14:27','2025-02-18 19:14:27',9,NULL,'CLAIMED',183),(32,7,'App\\Models\\Document','REF-00007 has been tagged as completed by Record Head-RECORDS','2025-02-18 19:29:27','2025-02-18 19:29:27',11,NULL,'COMPLETED',0),(33,8,'App\\Models\\Document','REF-00008 has been created by Nikko Niel Zamora-MISS','2025-02-18 19:38:27','2025-02-18 19:38:27',9,NULL,'ENCODED',0),(34,8,'App\\Models\\Document','REF-00008 has been forwarded to RECORDS by Nikko Niel Zamora - MISS','2025-02-18 19:42:22','2025-02-18 19:42:22',9,NULL,'FORWARDED',186),(35,8,'App\\Models\\Document','REF-00008 has been RECEIVED by Record Head - RECORDS','2025-02-18 19:43:00','2025-02-18 19:43:00',11,NULL,'RECEIVED',186),(36,8,'App\\Models\\Document','REF-00008 - Action has been taken by Record Head - RECORDS','2025-02-18 19:43:44','2025-02-18 19:43:44',11,NULL,'ACTION_TAKEN',186),(37,8,'App\\Models\\Document','REF-00008 has been tagged as REJECTED by Record Head - RECORDS','2025-02-18 19:46:08','2025-02-18 19:46:08',11,NULL,'REJECTED',186),(38,8,'App\\Models\\Document','REF-00008 with Rejected status has been tagged as claimed by Record Head - RECORDS','2025-02-18 19:47:31','2025-02-18 19:47:31',11,NULL,'CLAIMED',187),(39,8,'App\\Models\\Document','REF-00008 has been tagged as claimed by Record Head - RECORDS','2025-02-18 19:47:31','2025-02-18 19:47:31',11,NULL,'CLAIMED',187),(40,9,'App\\Models\\Document','REF-00009 has been created by Nikko Niel Zamora-MISS','2025-02-18 21:31:54','2025-02-18 21:31:54',9,NULL,'ENCODED',0),(41,9,'App\\Models\\Document','REF-00009 has been forwarded to RECORDS by Nikko Niel Zamora - MISS','2025-02-18 21:32:06','2025-02-18 21:32:06',9,NULL,'FORWARDED',190),(42,10,'App\\Models\\Document','REF-00010 has been created by Nikko Niel Zamora-MISS','2025-02-18 21:35:16','2025-02-18 21:35:16',9,NULL,'ENCODED',0),(43,10,'App\\Models\\Document','REF-00010 has been forwarded to RECORDS by Nikko Niel Zamora - MISS','2025-02-18 21:35:31','2025-02-18 21:35:31',9,NULL,'FORWARDED',192),(44,10,'App\\Models\\Document','REF-00010 has been RECEIVED by Record Head - RECORDS','2025-02-18 21:38:18','2025-02-18 21:38:18',11,NULL,'RECEIVED',192),(45,10,'App\\Models\\Document','REF-00010 - Action has been taken by Record Head - RECORDS','2025-02-18 21:40:53','2025-02-18 21:40:53',11,NULL,'ACTION_TAKEN',192),(46,10,'App\\Models\\Document','REF-00010 has been tagged as claimed by Record Head - RECORDS','2025-02-18 21:41:04','2025-02-18 21:41:04',11,NULL,'CLAIMED',192),(47,10,'App\\Models\\Document','REF-00010 has been tagged as completed by Nikko Niel Zamora-MISS','2025-02-18 21:41:58','2025-02-18 21:41:58',9,NULL,'COMPLETED',0),(48,11,'App\\Models\\Document','REF-00011 has been created by Nikko Niel Zamora-MISS','2025-02-19 17:19:56','2025-02-19 17:19:56',9,NULL,'ENCODED',0),(49,11,'App\\Models\\Document','REF-00011 has been forwarded to RECORDS by Nikko Niel Zamora - MISS','2025-02-19 17:20:24','2025-02-19 17:20:24',9,NULL,'FORWARDED',195),(50,12,'App\\Models\\Document','REF-00012 has been created by Nikko Niel Zamora-MISS','2025-02-19 23:24:48','2025-02-19 23:24:48',9,NULL,'ENCODED',0),(51,13,'App\\Models\\Document','REF-00013 has been created by Nikko Niel Zamora-MISS','2025-02-19 23:33:53','2025-02-19 23:33:53',9,NULL,'ENCODED',0),(52,13,'App\\Models\\Document','REF-00013 has been forwarded to RECORDS by Nikko Niel Zamora - MISS','2025-02-19 23:34:06','2025-02-19 23:34:06',9,NULL,'FORWARDED',199),(53,14,'App\\Models\\Document','REF-00014 has been created by Nikko Niel Zamora-MISS','2025-02-19 23:35:26','2025-02-19 23:35:26',9,NULL,'ENCODED',0),(54,15,'App\\Models\\Document','REF-00015 has been created by Nikko Niel Zamora-MISS','2025-02-19 23:40:48','2025-02-19 23:40:48',9,NULL,'ENCODED',0),(55,15,'App\\Models\\Document','REF-00015 has been forwarded to RECORDS by Nikko Niel Zamora - MISS','2025-02-19 23:40:57','2025-02-19 23:40:57',9,NULL,'FORWARDED',202),(56,16,'App\\Models\\Document','REF-00016 has been created by Nikko Niel Zamora-MISS','2025-02-19 23:46:17','2025-02-19 23:46:17',9,NULL,'ENCODED',0),(57,16,'App\\Models\\Document','REF-00016 has been forwarded to RECORDS by Nikko Niel Zamora - MISS','2025-02-19 23:46:26','2025-02-19 23:46:26',9,NULL,'FORWARDED',204),(58,17,'App\\Models\\Document','REF-00017 has been created by Nikko Niel Zamora-MISS','2025-02-19 23:47:09','2025-02-19 23:47:09',9,NULL,'ENCODED',0),(59,17,'App\\Models\\Document','REF-00017 has been forwarded to RECORDS by Nikko Niel Zamora - MISS','2025-02-19 23:53:36','2025-02-19 23:53:36',9,NULL,'FORWARDED',205),(60,17,'App\\Models\\Document','REF-00017 has been RECEIVED by Record Head - RECORDS','2025-02-19 23:57:44','2025-02-19 23:57:44',11,NULL,'RECEIVED',206),(61,16,'App\\Models\\Document','REF-00016 has been RECEIVED by Record Head - RECORDS','2025-02-19 23:57:55','2025-02-19 23:57:55',11,NULL,'RECEIVED',204),(62,17,'App\\Models\\Document','REF-00017 has been tagged as REJECTED by Record Head - RECORDS','2025-02-19 23:58:59','2025-02-19 23:58:59',11,NULL,'REJECTED',206),(63,16,'App\\Models\\Document','REF-00016 - Action has been taken by Record Head - RECORDS','2025-02-19 23:59:19','2025-02-19 23:59:19',11,NULL,'ACTION_TAKEN',204),(64,8,'App\\Models\\Document','REF-00008 has been tagged as completed by Nikko Niel Zamora-MISS','2025-02-23 19:06:13','2025-02-23 19:06:13',9,NULL,'COMPLETED',0),(65,18,'App\\Models\\Document','1 has been created by Nikko Niel Zamora-MISS','2025-02-24 21:35:39','2025-02-24 21:35:39',9,NULL,'ENCODED',0),(66,19,'App\\Models\\Document','REF-MISS00002 has been created by Nikko Niel Zamora-MISS','2025-02-24 21:38:37','2025-02-24 21:38:37',9,NULL,'ENCODED',0),(67,20,'App\\Models\\Document','REF-MISS-00003 has been created by Nikko Niel Zamora-MISS','2025-02-24 21:44:21','2025-02-24 21:44:21',9,NULL,'ENCODED',0),(68,21,'App\\Models\\Document','REF-MISS-00004 has been created by Nikko Niel Zamora-MISS','2025-02-24 21:44:53','2025-02-24 21:44:53',9,NULL,'ENCODED',0),(69,22,'App\\Models\\Document','REF-MISS-00005 has been created by Nikko Niel Zamora-MISS','2025-02-24 21:48:17','2025-02-24 21:48:17',9,NULL,'ENCODED',0),(70,23,'App\\Models\\Document','REF-MISS-00007 has been created by Nikko Niel Zamora-MISS','2025-02-24 21:51:53','2025-02-24 21:51:53',9,NULL,'ENCODED',0),(71,24,'App\\Models\\Document','REF-MISS-00008 has been created by Nikko Niel Zamora-MISS','2025-02-25 18:04:37','2025-02-25 18:04:37',9,NULL,'ENCODED',0),(72,24,'App\\Models\\Document','REF-MISS-00008 has been forwarded to RECORDS by Nikko Niel Zamora - MISS','2025-02-26 22:36:50','2025-02-26 22:36:50',9,NULL,'FORWARDED',213),(73,25,'App\\Models\\Document','REF-MISS-00009 has been created by Nikko Niel Zamora-MISS','2025-02-26 22:41:29','2025-02-26 22:41:29',9,NULL,'ENCODED',0),(74,26,'App\\Models\\Document','REF-MISS-00010 has been created by Nikko Niel Zamora-MISS','2025-02-26 23:40:25','2025-02-26 23:40:25',9,NULL,'ENCODED',0),(75,26,'App\\Models\\Document','REF-MISS-00010 has been forwarded to RECORDS by Nikko Niel Zamora - MISS','2025-02-26 23:40:49','2025-02-26 23:40:49',9,NULL,'FORWARDED',217),(76,26,'App\\Models\\Document','REF-MISS-00010 has been RECEIVED by Record Head - RECORDS','2025-02-26 23:50:20','2025-02-26 23:50:20',11,NULL,'RECEIVED',217),(77,28,'App\\Models\\Document','REF-MISS-00011 has been created by Nikko Niel Zamora-MISS','2025-03-03 19:40:31','2025-03-03 19:40:31',9,NULL,'ENCODED',0),(78,28,'App\\Models\\Document','REF-MISS-00011 has been forwarded to RECORDS by Nikko Niel Zamora - MISS','2025-03-03 19:41:07','2025-03-03 19:41:07',9,NULL,'FORWARDED',219),(79,28,'App\\Models\\Document','REF-MISS-00011 has been RECEIVED by Record Head - RECORDS','2025-03-03 19:44:42','2025-03-03 19:44:42',11,NULL,'RECEIVED',219),(80,28,'App\\Models\\Document','REF-MISS-00011 - Document has been relealeased by Record Head - RECORDS','2025-03-03 21:51:40','2025-03-03 21:51:40',11,NULL,'RELEASED',219),(81,29,'App\\Models\\Document','REF-MISS-00012 has been created by Nikko Niel Zamora-MISS','2025-03-03 23:09:47','2025-03-03 23:09:47',9,NULL,'ENCODED',0),(82,29,'App\\Models\\Document','REF-MISS-00012 has been forwarded to RECORDS by Nikko Niel Zamora - MISS','2025-03-03 23:10:09','2025-03-03 23:10:09',9,NULL,'FORWARDED',221),(83,29,'App\\Models\\Document','REF-MISS-00012 has been RECEIVED by Record Head - RECORDS','2025-03-03 23:12:46','2025-03-03 23:12:46',11,NULL,'RECEIVED',221),(84,29,'App\\Models\\Document','REF-MISS-00012 - Document has been relealeased by Record Head - RECORDS','2025-03-03 23:13:28','2025-03-03 23:13:28',11,NULL,'RELEASED',221),(85,30,'App\\Models\\Document','REF-REC-00002 has been created by Record Head-RECORDS','2025-03-04 00:32:03','2025-03-04 00:32:03',11,NULL,'ENCODED',0),(86,31,'App\\Models\\Document','REF-MISS-00013 has been created by Nikko Niel Zamora-MISS','2025-03-04 00:36:03','2025-03-04 00:36:03',9,NULL,'ENCODED',0),(87,31,'App\\Models\\Document','REF-MISS-00013 has been forwarded to RECORDS by Nikko Niel Zamora - MISS','2025-03-04 00:36:15','2025-03-04 00:36:15',9,NULL,'FORWARDED',224),(88,31,'App\\Models\\Document','REF-MISS-00013 has been RECEIVED by Record Head - RECORDS','2025-03-04 00:37:12','2025-03-04 00:37:12',11,NULL,'RECEIVED',224),(89,31,'App\\Models\\Document','REF-MISS-00013 - Document has been relealeased by Record Head - RECORDS','2025-03-04 00:37:44','2025-03-04 00:37:44',11,NULL,'RELEASED',224),(90,31,'App\\Models\\Document','REF-MISS-00013 - Document is now currenlt on hand of RECORDS: Tagged by - Record Head - RECORDS','2025-03-04 00:38:49','2025-03-04 00:38:49',11,NULL,'FORWARDED',224),(91,31,'App\\Models\\Document','REF-MISS-00013 - Action has been taken by Record Head - RECORDS','2025-03-04 00:39:25','2025-03-04 00:39:25',11,NULL,'ACTION_TAKEN',224),(92,31,'App\\Models\\Document','REF-MISS-00013 has been tagged as claimed by Record Head - RECORDS','2025-03-04 00:39:35','2025-03-04 00:39:35',11,NULL,'CLAIMED',224),(93,31,'App\\Models\\Document','REF-MISS-00013 has been tagged as claimed by Record Head - RECORDS','2025-03-04 00:43:41','2025-03-04 00:43:41',11,NULL,'CLAIMED',225),(94,31,'App\\Models\\Document','REF-MISS-00013 has been tagged as claimed by Record Head - RECORDS','2025-03-04 00:43:53','2025-03-04 00:43:53',11,NULL,'CLAIMED',226),(95,31,'App\\Models\\Document','REF-MISS-00013 has been tagged as claimed by Record Head - RECORDS','2025-03-04 00:45:16','2025-03-04 00:45:16',11,NULL,'CLAIMED',227),(96,31,'App\\Models\\Document','REF-MISS-00013 has been tagged as claimed by Record Head - RECORDS','2025-03-04 00:47:19','2025-03-04 00:47:19',11,NULL,'CLAIMED',228),(97,31,'App\\Models\\Document','REF-MISS-00013 has been tagged as claimed by Record Head - RECORDS','2025-03-04 00:50:04','2025-03-04 00:50:04',11,NULL,'CLAIMED',229),(98,31,'App\\Models\\Document','REF-MISS-00013 has been tagged as claimed by Record Head - RECORDS','2025-03-04 00:50:44','2025-03-04 00:50:44',11,NULL,'CLAIMED',230),(99,31,'App\\Models\\Document','REF-MISS-00013 has been tagged as claimed by Record Head - RECORDS','2025-03-04 00:52:49','2025-03-04 00:52:49',11,NULL,'CLAIMED',231),(100,32,'App\\Models\\Document','REF-MISS-00014 has been created by Nikko Niel Zamora-MISS','2025-03-04 00:56:55','2025-03-04 00:56:55',9,NULL,'ENCODED',0),(101,32,'App\\Models\\Document','REF-MISS-00014 has been forwarded to RECORDS by Nikko Niel Zamora - MISS','2025-03-04 00:57:07','2025-03-04 00:57:07',9,NULL,'FORWARDED',234),(102,32,'App\\Models\\Document','REF-MISS-00014 has been RECEIVED by Record Head - RECORDS','2025-03-04 00:57:47','2025-03-04 00:57:47',11,NULL,'RECEIVED',234),(103,32,'App\\Models\\Document','REF-MISS-00014 - Document has been relealeased by Record Head - RECORDS','2025-03-04 00:58:04','2025-03-04 00:58:04',11,NULL,'RELEASED',234),(104,32,'App\\Models\\Document','REF-MISS-00014 - Document is now currenlt on hand of RECORDS: Tagged by - Record Head - RECORDS','2025-03-04 00:58:27','2025-03-04 00:58:27',11,NULL,'FORWARDED',234),(105,32,'App\\Models\\Document','REF-MISS-00014 - Action has been taken by Record Head - RECORDS','2025-03-04 00:58:40','2025-03-04 00:58:40',11,NULL,'ACTION_TAKEN',234),(106,32,'App\\Models\\Document','REF-MISS-00014 has been tagged as claimed by Record Head - RECORDS','2025-03-04 00:58:48','2025-03-04 00:58:48',11,NULL,'CLAIMED',234),(107,32,'App\\Models\\Document','REF-MISS-00014 has been tagged as completed by Nikko Niel Zamora-MISS','2025-03-04 01:02:45','2025-03-04 01:02:45',9,NULL,'COMPLETED',0),(108,31,'App\\Models\\Document','REF-MISS-00013 has been forwarded to OED by Nikko Niel Zamora - MISS','2025-03-04 01:34:00','2025-03-04 01:34:00',9,NULL,'FORWARDED',232),(109,25,'App\\Models\\Document','REF-MISS-00009 has been forwarded to OED by Nikko Niel Zamora - MISS','2025-03-04 01:40:08','2025-03-04 01:40:08',9,NULL,'FORWARDED',215),(110,25,'App\\Models\\Document','REF-MISS-00009 has been RECEIVED by Oed EmployeeOne - OED','2025-03-04 01:40:24','2025-03-04 01:40:24',14,NULL,'RECEIVED',237),(111,25,'App\\Models\\Document','REF-MISS-00009 - Action has been taken by Oed EmployeeOne - OED','2025-03-04 01:40:34','2025-03-04 01:40:34',14,NULL,'ACTION_TAKEN',237),(112,25,'App\\Models\\Document','REF-MISS-00009 has been tagged as claimed by Oed EmployeeOne - OED','2025-03-04 01:40:38','2025-03-04 01:40:38',14,NULL,'CLAIMED',237),(113,25,'App\\Models\\Document','REF-MISS-00009 has been forwarded to RECORDS by Nikko Niel Zamora - MISS','2025-03-04 01:40:59','2025-03-04 01:40:59',9,NULL,'FORWARDED',238),(114,29,'App\\Models\\Document','REF-MISS-00012 has been RECEIVED by Record Head - RECORDS','2025-03-04 15:42:43','2025-03-04 15:42:43',11,NULL,'RECEIVED',221),(115,33,'App\\Models\\Document','REF-MISS-00015 has been created by Nikko Niel Zamora-MISS','2025-03-04 16:08:04','2025-03-04 16:08:04',9,NULL,'ENCODED',0),(116,33,'App\\Models\\Document','REF-MISS-00015 has been forwarded to RECORDS by Nikko Niel Zamora - MISS','2025-03-04 16:08:26','2025-03-04 16:08:26',9,NULL,'FORWARDED',241),(117,3,'App\\Models\\Document','REF-00003 has been tagged as completed by Nikko Niel Zamora-MISS','2025-03-05 00:17:07','2025-03-05 00:17:07',9,NULL,'COMPLETED',0),(118,34,'App\\Models\\Document','REF-MISS-00016 has been created by Nikko Niel Zamora-MISS','2025-03-05 15:37:15','2025-03-05 15:37:15',9,NULL,'ENCODED',0),(119,34,'App\\Models\\Document','REF-MISS-00016 has been forwarded to RECORDS by Nikko Niel Zamora - MISS','2025-03-05 15:37:42','2025-03-05 15:37:42',9,NULL,'FORWARDED',243),(120,34,'App\\Models\\Document','REF-MISS-00016 has been RECEIVED by Record Head - RECORDS','2025-03-05 15:39:33','2025-03-05 15:39:33',11,NULL,'RECEIVED',243),(121,34,'App\\Models\\Document','REF-MISS-00016 - Document has been relealeased by Record Head - RECORDS','2025-03-05 15:42:25','2025-03-05 15:42:25',11,NULL,'RELEASED',243),(122,34,'App\\Models\\Document','REF-MISS-00016 - Document is now currenlt on hand of RECORDS: Tagged by - Record Head - RECORDS','2025-03-05 15:47:17','2025-03-05 15:47:17',11,NULL,'FORWARDED',243),(123,34,'App\\Models\\Document','REF-MISS-00016 - Action has been taken by Record Head - RECORDS','2025-03-05 15:47:45','2025-03-05 15:47:45',11,NULL,'ACTION_TAKEN',243),(124,34,'App\\Models\\Document','REF-MISS-00016 has been tagged as claimed by Record Head - RECORDS','2025-03-05 15:48:03','2025-03-05 15:48:03',11,NULL,'CLAIMED',243),(125,34,'App\\Models\\Document','REF-MISS-00016 has been tagged as completed by Nikko Niel Zamora-MISS','2025-03-05 15:48:45','2025-03-05 15:48:45',9,NULL,'COMPLETED',0),(126,35,'App\\Models\\Document','REF-MISS-00017 has been created by Nikko Niel Zamora-MISS','2025-03-06 00:51:33','2025-03-06 00:51:33',9,NULL,'ENCODED',0),(127,36,'App\\Models\\Document','REF-MISS-00018 has been created by Nikko Niel Zamora-MISS','2025-03-06 08:22:38','2025-03-06 08:22:38',9,NULL,'ENCODED',0),(128,36,'App\\Models\\Document','REF-MISS-00018 has been forwarded to RECORDS by Nikko Niel Zamora - MISS','2025-03-06 08:25:28','2025-03-06 08:25:28',9,NULL,'FORWARDED',247),(129,36,'App\\Models\\Document','REF-MISS-00018 has been RECEIVED by Record Head - RECORDS','2025-03-06 08:26:16','2025-03-06 08:26:16',11,NULL,'RECEIVED',247),(130,36,'App\\Models\\Document','REF-MISS-00018 - Document has been relealeased by Record Head - RECORDS','2025-03-06 08:33:30','2025-03-06 08:33:30',11,NULL,'RELEASED',247),(131,36,'App\\Models\\Document','REF-MISS-00018 - Document is now currenlt on hand of RECORDS: Tagged by - Record Head - RECORDS','2025-03-06 08:37:24','2025-03-06 08:37:24',11,NULL,'FORWARDED',247),(132,36,'App\\Models\\Document','REF-MISS-00018 - Action has been taken by Record Head - RECORDS','2025-03-06 08:48:05','2025-03-06 08:48:05',11,NULL,'ACTION_TAKEN',247),(133,36,'App\\Models\\Document','REF-MISS-00018 has been tagged as claimed by Record Head - RECORDS','2025-03-06 08:49:19','2025-03-06 08:49:19',11,NULL,'CLAIMED',247),(134,29,'App\\Models\\Document','REF-MISS-00012 - Document has been relealeased by Record Head - RECORDS','2025-03-10 06:13:13','2025-03-10 06:13:13',11,NULL,'RELEASED',221),(135,26,'App\\Models\\Document','REF-MISS-00010 - Document has been relealeased by Record Head - RECORDS','2025-03-10 06:18:08','2025-03-10 06:18:08',11,NULL,'RELEASED',217),(136,37,'App\\Models\\Document','REF-MISS-00019 has been created by Nikko Niel Zamora-MISS','2025-03-10 06:29:12','2025-03-10 06:29:12',9,NULL,'ENCODED',0),(137,37,'App\\Models\\Document','REF-MISS-00019 has been forwarded to RECORDS by Nikko Niel Zamora - MISS','2025-03-10 06:29:35','2025-03-10 06:29:35',9,NULL,'FORWARDED',250),(138,37,'App\\Models\\Document','REF-MISS-00019 has been RECEIVED by Record Head - RECORDS','2025-03-10 06:30:43','2025-03-10 06:30:43',11,NULL,'RECEIVED',250),(139,37,'App\\Models\\Document','REF-MISS-00019 - Document has been relealeased by Record Head - RECORDS','2025-03-10 06:32:25','2025-03-10 06:32:25',11,NULL,'RELEASED',250),(140,37,'App\\Models\\Document','REF-MISS-00019 - Document is now currenlt on hand of RECORDS: Tagged by - Record Head - RECORDS','2025-03-10 06:33:06','2025-03-10 06:33:06',11,NULL,'FORWARDED',250),(141,38,'App\\Models\\Document','REF-REC-00003 has been created by Record Head-RECORDS','2025-03-10 07:33:13','2025-03-10 07:33:13',11,NULL,'ENCODED',0),(142,39,'App\\Models\\Document','REF-MISS-00020 has been created by Nikko Niel Zamora-MISS','2025-03-10 08:23:45','2025-03-10 08:23:45',9,NULL,'ENCODED',0),(143,39,'App\\Models\\Document','REF-MISS-00020 has been forwarded to RECORDS by Nikko Niel Zamora - MISS','2025-03-10 08:24:01','2025-03-10 08:24:01',9,NULL,'FORWARDED',253),(144,39,'App\\Models\\Document','REF-MISS-00020 has been RECEIVED by Record Head - RECORDS','2025-03-10 08:24:26','2025-03-10 08:24:26',11,NULL,'RECEIVED',253),(145,39,'App\\Models\\Document','REF-MISS-00020 - Document has been relealeased by Record Head - RECORDS','2025-03-10 08:25:31','2025-03-10 08:25:31',11,NULL,'RELEASED',253),(146,33,'App\\Models\\Document','REF-MISS-00015 has been RECEIVED by Record Head - RECORDS','2025-03-10 08:32:21','2025-03-10 08:32:21',11,NULL,'RECEIVED',241),(147,37,'App\\Models\\Document','REF-MISS-00019 - Document has been relealeased by Record Head - RECORDS','2025-03-10 08:34:16','2025-03-10 08:34:16',11,NULL,'RELEASED',250),(148,1,'App\\Models\\Document','REF-MISS-00021 has been created by Nikko Niel Zamora-MISS','2025-03-10 09:38:33','2025-03-10 09:38:33',9,NULL,'ENCODED',0),(149,1,'App\\Models\\Document','REF-MISS-00021 has been forwarded to RECORDS by Nikko Niel Zamora - MISS','2025-03-10 09:39:00','2025-03-10 09:39:00',9,NULL,'FORWARDED',255),(150,2,'App\\Models\\Document','REF-MISS-00022 has been created by Nikko Niel Zamora-MISS','2025-03-10 09:39:14','2025-03-10 09:39:14',9,NULL,'ENCODED',0),(151,7,'App\\Models\\Document','REF-MISS-00023 has been created by Nikko Niel Zamora-MISS','2025-03-10 10:03:40','2025-03-10 10:03:40',9,NULL,'ENCODED',0),(152,7,'App\\Models\\Document','REF-MISS-00023 has been forwarded to RECORDS by Nikko Niel Zamora - MISS','2025-03-10 10:04:08','2025-03-10 10:04:08',9,NULL,'FORWARDED',258),(153,8,'App\\Models\\Document','REF-MISS-00024 has been created by Nikko Niel Zamora-MISS','2025-03-10 10:04:29','2025-03-10 10:04:29',9,NULL,'ENCODED',0),(154,8,'App\\Models\\Document','REF-MISS-00024 has been forwarded to RECORDS by Nikko Niel Zamora - MISS','2025-03-10 10:04:55','2025-03-10 10:04:55',9,NULL,'FORWARDED',260);
/*!40000 ALTER TABLE `trails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_invites`
--

DROP TABLE IF EXISTS `user_invites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_invites` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invited_by_id` bigint unsigned NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_invites_email_unique` (`email`),
  UNIQUE KEY `user_invites_token_unique` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_invites`
--

LOCK TABLES `user_invites` WRITE;
/*!40000 ALTER TABLE `user_invites` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_invites` ENABLE KEYS */;
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
  `department_id` bigint unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (7,'Christian Lorilla','cl@gmail.com',NULL,'$2y$12$If7rljOhGUKh9.wjaFWLleWZr5P4CaTCyyrHVii4j6BY4FxJYbM.m',NULL,'2025-01-22 21:25:32','2025-01-22 21:25:32',1,NULL),(9,'Nikko Niel Zamora','nikkoniel1@gmail.com',NULL,'$2y$12$V8r67Xz1wg39s/CrsX9LbeDRXVDDj4XNhtgVM.puQpn7kboCpKD7O',NULL,'2025-01-22 21:36:41','2025-01-22 21:36:41',1,NULL),(10,'Michael Sacdal','ms@gmail.com',NULL,'$2y$12$Ht5PRvWoTNmni96M3kVEX.v3AFU3Y5t34qsnVA3GOE3AnO58y5gia',NULL,'2025-01-22 21:39:43','2025-01-22 21:39:43',1,NULL),(11,'Record Head','rchead@gmail.com',NULL,'$2y$12$zfspg8K78wtPhG2FAoWipeH2xWmCdRGAO8DJ/NAda2EjD55.Mv1aG',NULL,'2025-01-22 21:42:48','2025-01-22 21:42:48',2,NULL),(12,'Record EmployeeOne','rcemp1@gmail.com',NULL,'$2y$12$VIw6ojHzzotFJCEMbyW/huMl7EE1TocIiC2Dui3uDSuc6j4PERhga',NULL,'2025-01-22 21:43:29','2025-01-22 21:43:29',2,NULL),(13,'Oed Head','oedhead@gmail.com',NULL,'$2y$12$8KEI7uRsBT7ODwCmYpuk2eNnLzySDRE6JshyXELmqJChERuxteK8W',NULL,'2025-01-22 21:44:08','2025-01-22 21:44:08',3,NULL),(14,'Oed EmployeeOne','oedemp1@gmail.com',NULL,'$2y$12$b/eFSXWiWKBLL.w9c4/9E.1NUbMOmpXEt7PLKxbCkzLO4sCbkCd/q',NULL,'2025-01-22 21:44:44','2025-01-22 21:44:44',3,NULL);
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

-- Dump completed on 2025-03-13 13:18:40
