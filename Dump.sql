-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: humhub
-- ------------------------------------------------------
-- Server version       5.7.23-0ubuntu0.16.04.1

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
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(100) NOT NULL,
  `module` varchar(100) DEFAULT '',
  `object_model` varchar(100) DEFAULT '',
  `object_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES (1,'humhub\\modules\\space\\activities\\Created','space','humhub\\modules\\space\\models\\Space',1),(2,'humhub\\modules\\content\\activities\\ContentCreated','content','humhub\\modules\\post\\models\\Post',1),(3,'humhub\\modules\\space\\activities\\MemberAdded','space','humhub\\modules\\space\\models\\Space',1),(4,'humhub\\modules\\space\\activities\\MemberAdded','space','humhub\\modules\\space\\models\\Space',1),(5,'humhub\\modules\\content\\activities\\ContentCreated','content','humhub\\modules\\post\\models\\Post',2),(6,'humhub\\modules\\comment\\activities\\NewComment','comment','humhub\\modules\\comment\\models\\Comment',1),(7,'humhub\\modules\\comment\\activities\\NewComment','comment','humhub\\modules\\comment\\models\\Comment',2),(8,'humhub\\modules\\like\\activities\\Liked','like','humhub\\modules\\like\\models\\Like',1),(9,'humhub\\modules\\like\\activities\\Liked','like','humhub\\modules\\like\\models\\Like',2),(10,'humhub\\modules\\content\\activities\\ContentCreated','content','humhub\\modules\\polls\\models\\Poll',1),(11,'humhub\\modules\\polls\\activities\\NewVote','polls','humhub\\modules\\polls\\models\\Poll',1),(12,'humhub\\modules\\comment\\activities\\NewComment','comment','humhub\\modules\\comment\\models\\Comment',3),(13,'humhub\\modules\\polls\\activities\\NewVote','polls','humhub\\modules\\polls\\models\\Poll',1),(14,'humhub\\modules\\comment\\activities\\NewComment','comment','humhub\\modules\\comment\\models\\Comment',4);
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_entry`
--

DROP TABLE IF EXISTS `calendar_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `start_datetime` datetime NOT NULL,
  `end_datetime` datetime NOT NULL,
  `all_day` tinyint(4) NOT NULL,
  `participation_mode` tinyint(4) NOT NULL,
  `recur` tinyint(4) DEFAULT NULL,
  `recur_type` tinyint(4) DEFAULT NULL,
  `recur_interval` tinyint(4) DEFAULT NULL,
  `recur_end` datetime DEFAULT NULL,
  `color` varchar(7) DEFAULT NULL,
  `allow_decline` tinyint(4) DEFAULT '1',
  `allow_maybe` tinyint(4) DEFAULT '1',
  `time_zone` varchar(60) DEFAULT NULL,
  `participant_info` text,
  `closed` tinyint(1) DEFAULT '0',
  `max_participants` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_entry`
--

LOCK TABLES `calendar_entry` WRITE;
/*!40000 ALTER TABLE `calendar_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_entry_participant`
--

DROP TABLE IF EXISTS `calendar_entry_participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar_entry_participant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calendar_entry_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `participation_state` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_entryuser` (`calendar_entry_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_entry_participant`
--

LOCK TABLES `calendar_entry_participant` WRITE;
/*!40000 ALTER TABLE `calendar_entry_participant` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_entry_participant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfiles_file`
--

DROP TABLE IF EXISTS `cfiles_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfiles_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_folder_id` int(11) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfiles_file`
--

LOCK TABLES `cfiles_file` WRITE;
/*!40000 ALTER TABLE `cfiles_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `cfiles_file` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `cfiles_folder`
--

DROP TABLE IF EXISTS `cfiles_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfiles_folder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_folder_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `has_wall_entry` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfiles_folder`
--

LOCK TABLES `cfiles_folder` WRITE;
/*!40000 ALTER TABLE `cfiles_folder` DISABLE KEYS */;
/*!40000 ALTER TABLE `cfiles_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text,
  `object_model` varchar(100) NOT NULL,
  `object_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'Nike – Just buy it. ;Wink;','humhub\\modules\\post\\models\\Post',2,'2018-08-12 17:53:13',2,'2018-08-12 17:53:13',2),(2,'Calvin Klein – Between love and madness lies obsession.','humhub\\modules\\post\\models\\Post',2,'2018-08-12 17:53:13',3,'2018-08-12 17:53:13',3),(3,'Why don\'t we go to Bemelmans Bar?','humhub\\modules\\polls\\models\\Poll',1,'2018-08-12 17:53:14',2,'2018-08-12 17:53:14',2),(4,'Again? ;Weary;','humhub\\modules\\polls\\models\\Poll',1,'2018-08-12 17:53:15',3,'2018-08-12 17:53:15',3);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(45) NOT NULL,
  `object_model` varchar(100) NOT NULL,
  `object_id` int(11) NOT NULL,
  `pinned` tinyint(4) DEFAULT NULL,
  `visibility` tinyint(4) DEFAULT NULL,
  `archived` tinytext,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `contentcontainer_id` int(11) DEFAULT NULL,
  `stream_sort_date` datetime DEFAULT NULL,
  `stream_channel` char(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_object_model` (`object_model`,`object_id`),
  UNIQUE KEY `index_guid` (`guid`),
  KEY `fk-contentcontainer` (`contentcontainer_id`),
  KEY `fk-create-user` (`created_by`),
  KEY `fk-update-user` (`updated_by`),
  CONSTRAINT `fk-contentcontainer` FOREIGN KEY (`contentcontainer_id`) REFERENCES `contentcontainer` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk-create-user` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk-update-user` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (1,'8086ef5d-c7c2-4d1c-af1e-d4d2b136077d','humhub\\modules\\activity\\models\\Activity',1,NULL,1,'0','2018-08-12 17:53:08',1,'2018-08-12 17:53:08',1,2,NULL,NULL),(2,'141bbf4c-a59f-4b2b-8dda-93b62df353f1','humhub\\modules\\post\\models\\Post',1,NULL,1,'0','2018-08-12 17:53:09',1,'2018-08-12 17:53:09',1,2,NULL,NULL),(3,'96ab8ad4-ae2c-42ad-b98e-f6c3d642f6cb','humhub\\modules\\activity\\models\\Activity',2,NULL,1,'0','2018-08-12 17:53:09',1,'2018-08-12 17:53:09',1,2,NULL,NULL),(4,'ca9645e6-37ce-43f1-892c-2b573b0fd53e','humhub\\modules\\activity\\models\\Activity',3,NULL,0,'0','2018-08-12 17:53:12',2,'2018-08-12 17:53:12',1,2,NULL,NULL),(5,'d4942164-c07e-4c92-81e0-cf02d95bf904','humhub\\modules\\activity\\models\\Activity',4,NULL,0,'0','2018-08-12 17:53:12',3,'2018-08-12 17:53:12',1,2,NULL,NULL),(6,'eacbf348-efb2-402a-8344-c6521a8d6367','humhub\\modules\\post\\models\\Post',2,NULL,0,'0','2018-08-12 17:53:13',1,'2018-08-12 17:53:13',1,2,NULL,NULL),(7,'b8d71bc0-c35d-491e-b713-be286784a1c4','humhub\\modules\\activity\\models\\Activity',5,NULL,0,'0','2018-08-12 17:53:13',1,'2018-08-12 17:53:13',1,2,NULL,NULL),(8,'9790fd6e-7e23-4092-bef9-cae558936459','humhub\\modules\\activity\\models\\Activity',6,NULL,0,'0','2018-08-12 17:53:13',2,'2018-08-12 17:53:13',2,2,NULL,NULL),(9,'64605062-1202-4844-9bfa-e0f91b376aff','humhub\\modules\\activity\\models\\Activity',7,NULL,0,'0','2018-08-12 17:53:13',3,'2018-08-12 17:53:13',3,2,NULL,NULL),(10,'fa9938bd-929a-4a30-9d67-8263ace88656','humhub\\modules\\activity\\models\\Activity',8,NULL,0,'0','2018-08-12 17:53:14',3,'2018-08-12 17:53:14',3,2,NULL,NULL),(11,'d520dd48-b5ba-45e7-9231-ba1127236ca5','humhub\\modules\\activity\\models\\Activity',9,NULL,0,'0','2018-08-12 17:53:14',3,'2018-08-12 17:53:14',3,2,NULL,NULL),(12,'f24ef674-cec3-4ab8-b9ab-7bb4ab91ac84','humhub\\modules\\polls\\models\\Poll',1,NULL,0,'0','2018-08-12 17:53:14',1,'2018-08-12 17:53:14',1,2,NULL,NULL),(13,'3497dc69-fdba-4679-8baa-7040afedb30a','humhub\\modules\\activity\\models\\Activity',10,NULL,0,'0','2018-08-12 17:53:14',1,'2018-08-12 17:53:14',1,2,NULL,NULL),(14,'23c22a2e-18fd-4584-9673-5dc8425b34a1','humhub\\modules\\activity\\models\\Activity',11,NULL,0,'0','2018-08-12 17:53:14',2,'2018-08-12 17:53:14',2,2,NULL,NULL),(15,'1fad029c-c51a-4916-91ef-0a89c7e0ebad','humhub\\modules\\activity\\models\\Activity',12,NULL,0,'0','2018-08-12 17:53:14',2,'2018-08-12 17:53:14',2,2,NULL,NULL),(16,'3fabd71b-2365-488e-8b00-6c17c31e1487','humhub\\modules\\activity\\models\\Activity',13,NULL,0,'0','2018-08-12 17:53:15',3,'2018-08-12 17:53:15',3,2,NULL,NULL),(17,'40a091b3-ff72-4050-b986-0175efe46a95','humhub\\modules\\activity\\models\\Activity',14,NULL,0,'0','2018-08-12 17:53:15',3,'2018-08-12 17:53:15',3,2,NULL,NULL);
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_tag`
--

DROP TABLE IF EXISTS `content_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `module_id` varchar(100) NOT NULL,
  `contentcontainer_id` int(11) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `color` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx-content-tag` (`module_id`,`contentcontainer_id`,`name`),
  KEY `fk-content-tag-container-id` (`contentcontainer_id`),
  KEY `fk-content-tag-parent-id` (`parent_id`),
  CONSTRAINT `fk-content-tag-container-id` FOREIGN KEY (`contentcontainer_id`) REFERENCES `contentcontainer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk-content-tag-parent-id` FOREIGN KEY (`parent_id`) REFERENCES `content_tag` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_tag`
--

LOCK TABLES `content_tag` WRITE;
/*!40000 ALTER TABLE `content_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_tag_relation`
--

DROP TABLE IF EXISTS `content_tag_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_tag_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk-content-tag-rel-content-id` (`content_id`),
  KEY `fk-content-tag-rel-tag-id` (`tag_id`),
  CONSTRAINT `fk-content-tag-rel-content-id` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk-content-tag-rel-tag-id` FOREIGN KEY (`tag_id`) REFERENCES `content_tag` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_tag_relation`
--

LOCK TABLES `content_tag_relation` WRITE;
/*!40000 ALTER TABLE `content_tag_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_tag_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contentcontainer`
--

DROP TABLE IF EXISTS `contentcontainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contentcontainer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) DEFAULT NULL,
  `class` varchar(255) DEFAULT NULL,
  `pk` int(11) DEFAULT NULL,
  `owner_user_id` int(11) DEFAULT NULL,
  `wall_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_target` (`class`,`pk`),
  UNIQUE KEY `unique_guid` (`guid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentcontainer`
--

LOCK TABLES `contentcontainer` WRITE;
/*!40000 ALTER TABLE `contentcontainer` DISABLE KEYS */;
INSERT INTO `contentcontainer` VALUES (1,'9f887f17-b7a1-44d9-9894-5e8968db021d','humhub\\modules\\user\\models\\User',1,1,1),(2,'915c29e7-c0ce-4a2b-b24e-616b75feacb4','humhub\\modules\\space\\models\\Space',1,1,2),(3,'8fbe58be-4fbc-4d0a-a945-e9b24d20c5c6','humhub\\modules\\user\\models\\User',2,2,3),(4,'4804a4fb-ff1e-4fac-b1a7-0c10cfaf1709','humhub\\modules\\user\\models\\User',3,3,4);
/*!40000 ALTER TABLE `contentcontainer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contentcontainer_permission`
--
DROP TABLE IF EXISTS `contentcontainer_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contentcontainer_permission` (
  `permission_id` varchar(150) NOT NULL,
  `contentcontainer_id` int(11) NOT NULL,
  `group_id` varchar(50) NOT NULL,
  `module_id` varchar(50) NOT NULL,
  `class` varchar(255) DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`permission_id`,`group_id`,`module_id`,`contentcontainer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentcontainer_permission`
--

LOCK TABLES `contentcontainer_permission` WRITE;
/*!40000 ALTER TABLE `contentcontainer_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `contentcontainer_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contentcontainer_setting`
--

DROP TABLE IF EXISTS `contentcontainer_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contentcontainer_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` varchar(50) NOT NULL,
  `contentcontainer_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings-unique` (`module_id`,`contentcontainer_id`,`name`),
  KEY `fk-contentcontainerx` (`contentcontainer_id`),
  CONSTRAINT `fk-contentcontainerx` FOREIGN KEY (`contentcontainer_id`) REFERENCES `contentcontainer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentcontainer_setting`
--

LOCK TABLES `contentcontainer_setting` WRITE;
/*!40000 ALTER TABLE `contentcontainer_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `contentcontainer_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_pages_container_page`
--

DROP TABLE IF EXISTS `custom_pages_container_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_pages_container_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `page_content` text,
  `type` smallint(6) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `in_new_window` tinyint(1) DEFAULT '0',
  `admin_only` tinyint(1) DEFAULT '0',
  `cssClass` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_pages_container_page`
--

LOCK TABLES `custom_pages_container_page` WRITE;
/*!40000 ALTER TABLE `custom_pages_container_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_pages_container_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_pages_container_snippet`
--

DROP TABLE IF EXISTS `custom_pages_container_snippet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_pages_container_snippet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `page_content` text,
  `type` smallint(6) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `admin_only` tinyint(1) DEFAULT '0',
  `cssClass` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_pages_container_snippet`
--

LOCK TABLES `custom_pages_container_snippet` WRITE;
/*!40000 ALTER TABLE `custom_pages_container_snippet` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_pages_container_snippet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_pages_page`
--

DROP TABLE IF EXISTS `custom_pages_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_pages_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` smallint(6) NOT NULL,
  `title` varchar(255) NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `content` mediumtext,
  `sort_order` int(11) DEFAULT NULL,
  `navigation_class` varchar(255) NOT NULL,
  `admin_only` tinyint(1) DEFAULT '0',
  `in_new_window` tinyint(1) DEFAULT '0',
  `cssClass` varchar(255) DEFAULT NULL,
  `url` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `custom-page-url-unique` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_pages_page`
--
--

LOCK TABLES `custom_pages_page` WRITE;
/*!40000 ALTER TABLE `custom_pages_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_pages_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_pages_snippet`
--

DROP TABLE IF EXISTS `custom_pages_snippet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_pages_snippet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `content` text,
  `type` smallint(6) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `sidebar` varchar(255) NOT NULL,
  `admin_only` tinyint(1) DEFAULT '0',
  `cssClass` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_pages_snippet`
--

LOCK TABLES `custom_pages_snippet` WRITE;
/*!40000 ALTER TABLE `custom_pages_snippet` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_pages_snippet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_pages_template`
--

DROP TABLE IF EXISTS `custom_pages_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_pages_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `engine` varchar(100) NOT NULL,
  `description` text,
  `source` text,
  `allow_for_spaces` tinyint(1) DEFAULT '0',
  `type` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_tmpl_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_pages_template`
--

LOCK TABLES `custom_pages_template` WRITE;
/*!40000 ALTER TABLE `custom_pages_template` DISABLE KEYS */;
INSERT INTO `custom_pages_template` VALUES (1,'system_two_column_layout','twig','Simple two column layout.','<div class=\"row\">\r\n    <div class=\"col-md-8\">\r\n            <div class=\"panel panel-default\">\r\n                 <div class=\"panel-body\">\r\n                          {{ content }}\r\n                       </div>\r\n              </div>\r\n      </div>\r\n      <div class=\"col-md-4\">\r\n            <div class=\"panel panel-default\">\r\n                 <div class=\"panel-body\">\r\n                          {{ sidebar_container }}\r\n                     </div>\r\n              </div>  \r\n    </div>\r\n</div>',0,'layout','2018-08-12 17:52:20',NULL,NULL,NULL),(2,'system_one_column_layout','twig','Simple one column layout.','<div class=\"row\">\r\n    <div class=\"col-md-12\">\r\n            <div class=\"panel panel-default\">\r\n                        <div class=\"panel-body\">\r\n                            {{ content }}\r\n                        </div>\r\n            </div>\r\n     </div>\r\n</div>',0,'layout','2018-08-12 17:52:21',NULL,NULL,NULL),(3,'system_headline_container','twig','Simple headline row with background image.','{% if background.empty %}\r\n    {% set bg = assets[\'bgImage2.jpg\']  %}\r\n{% else %}\r\n    {% set bg =  background %}\r\n{% endif %}\r\n\r\n<div style=\"height:218px;overflow:hidden;color:#fff;background-image: url(\'{{ bg }}\');background-position:50% 50%;text-align:center;\">\r\n   <div style=\"padding-top:40px;\">\r\n           <h1 style=\"color:#fff;font-size:36px;margin:20px 0 10px;\">{{ heading }}</h1>\r\n              <hr style=\"max-width:100px;border-width:3px;\">\r\n             <span>{{ subheading }}</span>\r\n       </div>\r\n</div>',0,'container','2018-08-12 17:52:21',NULL,NULL,NULL),(4,'system_article_container','twig','Simple richtext article.','<div style=\"margin-top:15px;\">\r\n    <div style=\"padding:0 15px;\">\r\n             {{ content }}\r\n       </div>\r\n</div>',0,'container','2018-08-12 17:52:21',NULL,NULL,NULL),(5,'system_simple_snippet_layout','twig','Simple snippet layout with head container and richtext.','<div>\r\n        {{ heading }}\r\n</div>\r\n<div style=\"margin-top:15px;\">\r\n      {{ content }}\r\n</div>',0,'snipped-layout','2018-08-12 17:52:21',NULL,NULL,NULL);
/*!40000 ALTER TABLE `custom_pages_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_pages_template_container`
--

DROP TABLE IF EXISTS `custom_pages_template_container`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_pages_template_container` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_model` varchar(100) NOT NULL,
  `object_id` int(11) NOT NULL,
  `template_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk-tmpl-template` (`template_id`),
  CONSTRAINT `fk-tmpl-template` FOREIGN KEY (`template_id`) REFERENCES `custom_pages_template` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_pages_template_container`
--

LOCK TABLES `custom_pages_template_container` WRITE;
/*!40000 ALTER TABLE `custom_pages_template_container` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_pages_template_container` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_pages_template_container_content`
--

DROP TABLE IF EXISTS `custom_pages_template_container_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_pages_template_container_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `definition_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk-tmpl-container-definition` (`definition_id`),
  CONSTRAINT `fk-tmpl-container-definition` FOREIGN KEY (`definition_id`) REFERENCES `custom_pages_template_container_content_definition` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_pages_template_container_content`
--

LOCK TABLES `custom_pages_template_container_content` WRITE;
/*!40000 ALTER TABLE `custom_pages_template_container_content` DISABLE KEYS */;
INSERT INTO `custom_pages_template_container_content` VALUES (1,1),(2,2),(3,3),(4,4);
/*!40000 ALTER TABLE `custom_pages_template_container_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_pages_template_container_content_definition`
                                                                                                                                                                                                                                                            
DROP TABLE IF EXISTS `custom_pages_template_container_content_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_pages_template_container_content_definition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `allow_multiple` tinyint(1) DEFAULT '0',
  `is_inline` tinyint(1) DEFAULT '0',
  `is_default` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_pages_template_container_content_definition`
--

LOCK TABLES `custom_pages_template_container_content_definition` WRITE;
/*!40000 ALTER TABLE `custom_pages_template_container_content_definition` DISABLE KEYS */;
INSERT INTO `custom_pages_template_container_content_definition` VALUES (1,1,0,1),(2,1,0,1),(3,1,0,1),(4,0,0,1);
/*!40000 ALTER TABLE `custom_pages_template_container_content_definition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_pages_template_container_content_item`
--

DROP TABLE IF EXISTS `custom_pages_template_container_content_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_pages_template_container_content_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) NOT NULL,
  `container_content_id` int(11) NOT NULL,
  `sort_order` int(11) DEFAULT '100',
  `title` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk-tmpl-container-item-tmpl` (`template_id`),
  KEY `fk-tmpl-container-item-content` (`container_content_id`),
  CONSTRAINT `fk-tmpl-container-item-content` FOREIGN KEY (`container_content_id`) REFERENCES `custom_pages_template_container_content` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk-tmpl-container-item-tmpl` FOREIGN KEY (`template_id`) REFERENCES `custom_pages_template` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_pages_template_container_content_item`
--

LOCK TABLES `custom_pages_template_container_content_item` WRITE;
/*!40000 ALTER TABLE `custom_pages_template_container_content_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_pages_template_container_content_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_pages_template_container_content_template`
--

DROP TABLE IF EXISTS `custom_pages_template_container_content_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_pages_template_container_content_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) NOT NULL,
  `definition_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk-tmpl-container-tmpl` (`template_id`),
  KEY `fk-tmpl-container-tmpl-definition` (`definition_id`),
  CONSTRAINT `fk-tmpl-container-tmpl` FOREIGN KEY (`template_id`) REFERENCES `custom_pages_template` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk-tmpl-container-tmpl-definition` FOREIGN KEY (`definition_id`) REFERENCES `custom_pages_template_container_content_definition` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
                                                                                                                                                                                                                                                          
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_pages_template_container_content_template`
--

LOCK TABLES `custom_pages_template_container_content_template` WRITE;
/*!40000 ALTER TABLE `custom_pages_template_container_content_template` DISABLE KEYS */;
INSERT INTO `custom_pages_template_container_content_template` VALUES (1,3,4);
/*!40000 ALTER TABLE `custom_pages_template_container_content_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_pages_template_element`
--

DROP TABLE IF EXISTS `custom_pages_template_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_pages_template_element` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `content_type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk-tmpl-element-tmpl` (`template_id`),
  CONSTRAINT `fk-tmpl-element-tmpl` FOREIGN KEY (`template_id`) REFERENCES `custom_pages_template` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_pages_template_element`
--

LOCK TABLES `custom_pages_template_element` WRITE;
/*!40000 ALTER TABLE `custom_pages_template_element` DISABLE KEYS */;
INSERT INTO `custom_pages_template_element` VALUES (1,1,'content','humhub\\modules\\custom_pages\\modules\\template\\models\\ContainerContent'),(2,1,'sidebar_container','humhub\\modules\\custom_pages\\modules\\template\\models\\ContainerContent'),(3,2,'content','humhub\\modules\\custom_pages\\modules\\template\\models\\ContainerContent'),(4,3,'heading','humhub\\modules\\custom_pages\\modules\\template\\models\\TextContent'),(5,3,'subheading','humhub\\modules\\custom_pages\\modules\\template\\models\\TextContent'),(6,3,'background','humhub\\modules\\custom_pages\\modules\\template\\models\\FileContent'),(7,4,'content','humhub\\modules\\custom_pages\\modules\\template\\models\\RichtextContent'),(8,5,'heading','humhub\\modules\\custom_pages\\modules\\template\\models\\ContainerContent'),(9,5,'content','humhub\\modules\\custom_pages\\modules\\template\\models\\RichtextContent');
/*!40000 ALTER TABLE `custom_pages_template_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_pages_template_file_content`
--

DROP TABLE IF EXISTS `custom_pages_template_file_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_pages_template_file_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_guid` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_pages_template_file_content`
--

LOCK TABLES `custom_pages_template_file_content` WRITE;
/*!40000 ALTER TABLE `custom_pages_template_file_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_pages_template_file_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_pages_template_image_content`
--
                                                                                                                                                                                                                                                             
--

DROP TABLE IF EXISTS `custom_pages_template_image_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_pages_template_image_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_guid` varchar(45) NOT NULL,
  `alt` varchar(100) DEFAULT NULL,
  `definition_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk-tmpl-image-definition` (`definition_id`),
  CONSTRAINT `fk-tmpl-image-definition` FOREIGN KEY (`definition_id`) REFERENCES `custom_pages_template_image_content_definition` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_pages_template_image_content`
--

LOCK TABLES `custom_pages_template_image_content` WRITE;
/*!40000 ALTER TABLE `custom_pages_template_image_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_pages_template_image_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_pages_template_image_content_definition`
--

DROP TABLE IF EXISTS `custom_pages_template_image_content_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_pages_template_image_content_definition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `height` int(10) DEFAULT NULL,
  `width` int(10) DEFAULT NULL,
  `style` varchar(200) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_pages_template_image_content_definition`
--

LOCK TABLES `custom_pages_template_image_content_definition` WRITE;
/*!40000 ALTER TABLE `custom_pages_template_image_content_definition` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_pages_template_image_content_definition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_pages_template_owner_content`
--

DROP TABLE IF EXISTS `custom_pages_template_owner_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_pages_template_owner_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `element_name` varchar(100) NOT NULL,
  `owner_model` varchar(100) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `content_type` varchar(100) NOT NULL,
  `content_id` int(11) NOT NULL,
  `use_default` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
                                                                                                                                                                                                                                                             
--
-- Dumping data for table `custom_pages_template_owner_content`
--

LOCK TABLES `custom_pages_template_owner_content` WRITE;
/*!40000 ALTER TABLE `custom_pages_template_owner_content` DISABLE KEYS */;
INSERT INTO `custom_pages_template_owner_content` VALUES (1,'content','humhub\\modules\\custom_pages\\modules\\template\\models\\Template',1,'humhub\\modules\\custom_pages\\modules\\template\\models\\ContainerContent',1,0),(2,'sidebar_container','humhub\\modules\\custom_pages\\modules\\template\\models\\Template',1,'humhub\\modules\\custom_pages\\modules\\template\\models\\ContainerContent',2,0),(3,'content','humhub\\modules\\custom_pages\\modules\\template\\models\\Template',2,'humhub\\modules\\custom_pages\\modules\\template\\models\\ContainerContent',3,0),(4,'heading','humhub\\modules\\custom_pages\\modules\\template\\models\\Template',3,'humhub\\modules\\custom_pages\\modules\\template\\models\\TextContent',1,0),(5,'subheading','humhub\\modules\\custom_pages\\modules\\template\\models\\Template',3,'humhub\\modules\\custom_pages\\modules\\template\\models\\TextContent',2,0),(6,'content','humhub\\modules\\custom_pages\\modules\\template\\models\\Template',4,'humhub\\modules\\custom_pages\\modules\\template\\models\\RichtextContent',1,0),(7,'heading','humhub\\modules\\custom_pages\\modules\\template\\models\\Template',5,'humhub\\modules\\custom_pages\\modules\\template\\models\\ContainerContent',4,0),(8,'content','humhub\\modules\\custom_pages\\modules\\template\\models\\Template',5,'humhub\\modules\\custom_pages\\modules\\template\\models\\RichtextContent',2,0);
/*!40000 ALTER TABLE `custom_pages_template_owner_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_pages_template_richtext_content`
--

DROP TABLE IF EXISTS `custom_pages_template_richtext_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_pages_template_richtext_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_pages_template_richtext_content`
--

LOCK TABLES `custom_pages_template_richtext_content` WRITE;
/*!40000 ALTER TABLE `custom_pages_template_richtext_content` DISABLE KEYS */;
INSERT INTO `custom_pages_template_richtext_content` VALUES (1,'<h1>This is a&nbsp;simple article!</h1>\r\n\r\n<hr />\r\n<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>\r\n'),(2,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>');
/*!40000 ALTER TABLE `custom_pages_template_richtext_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_pages_template_text_content`
--

DROP TABLE IF EXISTS `custom_pages_template_text_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_pages_template_text_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_pages_template_text_content`
--

LOCK TABLES `custom_pages_template_text_content` WRITE;
/*!40000 ALTER TABLE `custom_pages_template_text_content` DISABLE KEYS */;
INSERT INTO `custom_pages_template_text_content` VALUES (1,'My Headline'),(2,'My Subheadline');
/*!40000 ALTER TABLE `custom_pages_template_text_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file`
                                                                                                                                                                                                                                                             
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(45) DEFAULT NULL,
  `object_model` varchar(100) DEFAULT '',
  `object_id` varchar(100) DEFAULT '',
  `file_name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `mime_type` varchar(150) DEFAULT NULL,
  `size` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `show_in_stream` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `index_object` (`object_model`,`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `space_id` int(10) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `ldap_dn` varchar(255) DEFAULT NULL,
  `is_admin_group` tinyint(1) NOT NULL DEFAULT '0',
  `show_at_registration` tinyint(1) NOT NULL DEFAULT '1',
  `show_at_directory` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES (1,NULL,'Administrator','Administrator Group','2018-08-12 17:51:13',NULL,NULL,NULL,NULL,1,0,0),(2,NULL,'Users','Example Group by Installer',NULL,NULL,NULL,NULL,NULL,0,1,1);
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_permission`
                                                                                                                                                                                                                                                             
DROP TABLE IF EXISTS `group_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_permission` (
  `permission_id` varchar(150) NOT NULL,
  `group_id` int(11) NOT NULL,
  `module_id` varchar(50) NOT NULL,
  `class` varchar(255) DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`permission_id`,`group_id`,`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_permission`
--

LOCK TABLES `group_permission` WRITE;
/*!40000 ALTER TABLE `group_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_user`
--

DROP TABLE IF EXISTS `group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `is_group_manager` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx-group_user` (`user_id`,`group_id`),
  KEY `fk-group-group` (`group_id`),
  CONSTRAINT `fk-group-group` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk-user-group` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_user`
--

LOCK TABLES `group_user` WRITE;
/*!40000 ALTER TABLE `group_user` DISABLE KEYS */;
INSERT INTO `group_user` VALUES (1,1,1,0,'2018-08-12 17:53:08',NULL,'2018-08-12 17:53:08',NULL);
/*!40000 ALTER TABLE `group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `instructor_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
                                                                                                                                                                                                                                                             
--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like`
--

DROP TABLE IF EXISTS `like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_user_id` int(11) DEFAULT NULL,
  `object_model` varchar(100) NOT NULL,
  `object_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_object` (`object_model`,`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like`
--

LOCK TABLES `like` WRITE;
/*!40000 ALTER TABLE `like` DISABLE KEYS */;
INSERT INTO `like` VALUES (1,NULL,'humhub\\modules\\comment\\models\\Comment',1,'2018-08-12 17:53:14',3,'2018-08-12 17:53:14',3),(2,NULL,'humhub\\modules\\post\\models\\Post',2,'2018-08-12 17:53:14',3,'2018-08-12 17:53:14',3);
/*!40000 ALTER TABLE `like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `live`
--

DROP TABLE IF EXISTS `live`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `live` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contentcontainer_id` int(11) DEFAULT NULL,
  `visibility` int(1) DEFAULT NULL,
  `serialized_data` text NOT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contentcontainer` (`contentcontainer_id`),
  CONSTRAINT `contentcontainer` FOREIGN KEY (`contentcontainer_id`) REFERENCES `contentcontainer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `live`
--

LOCK TABLES `live` WRITE;
/*!40000 ALTER TABLE `live` DISABLE KEYS */;
/*!40000 ALTER TABLE `live` ENABLE KEYS */;
UNLOCK TABLES;

--
                                                                                                                                                                                                                                                             
--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `level` int(11) DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_time` double DEFAULT NULL,
  `prefix` text COLLATE utf8_unicode_ci,
  `message` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_log_level` (`level`),
  KEY `idx_log_category` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=1132 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,1,'yii\\db\\Exception',1534114448.9566,'[98.197.153.57][1][l5nrcprirga2gko3g2n89vjhe5]','PDOException: SQLSTATE[42000]: Syntax error or access violation: 1055 Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'humhub.notification.id\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by in /var/www/html/humhub/protected/vendor/yiisoft/yii2/db/Command.php:900\nStack trace:\n#0 /var/www/html/humhub/protected/vendor/yiisoft/yii2/db/Command.php(900): PDOStatement->execute()\n#1 /var/www/html/humhub/protected/vendor/yiisoft/yii2/db/Command.php(388): yii\\db\\Command->queryInternal(\'fetchColumn\', 0)\n#2 /var/www/html/humhub/protected/vendor/yiisoft/yii2/db/Query.php(398): yii\\db\\Command->queryScalar()\n#3 /var/www/html/humhub/protected/vendor/yiisoft/yii2/db/ActiveQuery.php(334): yii\\db\\Query->queryScalar(\'COUNT(*)\', NULL)\n#4 /var/www/html/humhub/protected/vendor/yiisoft/yii2/db/Query.php(300): yii\\db\\ActiveQuery->queryScalar(\'COUNT(*)\', NULL)\n#5 /var/www/html/humhub/protected/humhub/modules/notification/controllers/ListController.php(108): yii\\db\\Query->count()\n#6 /var/www/html/humhub/protected/humhub/modules/notification/widgets/Overview.php(31): humhub\\modules\\notification\\controllers\\ListController::getUpdates()\n#7 /var/www/html/humhub/protected/vendor/yiisoft/yii2/base/Widget.php(102): humhub\\modules\\notification\\widgets\\Overview->run()\n#8 /var/www/html/humhub/protected/humhub/widgets/BaseStack.php(92): yii\\base\\Widget::widget(Array)\n#9 /var/www/html/humhub/protected/vendor/yiisoft/yii2/base/Widget.php(102): humhub\\widgets\\BaseStack->run()\n#10 /var/www/html/humhub/protected/humhub/views/layouts/main.php(99): yii\\base\\Widget::widget(Array)\n#11 /var/www/html/humhub/protected/vendor/yiisoft/yii2/base/View.php(325): require(\'/var/www/html/h...\')\n#12 /var/www/html/humhub/protected/vendor/yiisoft/yii2/base/View.php(247): yii\\base\\View->renderPhpFile(\'/var/www/html/h...\', \'[<span class=\"s...\')\n#13 /var/www/html/humhub/protected/vendor/yiisoft/yii2/base/Controller.php(393): yii\\base\\View->renderFile(\'/var/www/html/h...\', Array, Object(humhub\\modules\\dashboard\\controllers\\DashboardController))\n#14 /var/www/html/humhub/protected/vendor/yiisoft/yii2/base/Controller.php(379): yii\\base\\Controller->renderContent(\'<div class=\"con...\')\n#15 /var/www/html/humhub/protected/humhub/modules/dashboard/controllers/DashboardController.php(63): yii\\base\\Controller->render(\'index\', Array)\n#16 [internal function]: humhub\\modules\\dashboard\\controllers\\DashboardController->actionIndex()\n#17 /var/www/html/humhub/protected/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#18 /var/www/html/humhub/protected/vendor/yiisoft/yii2/base/Controller.php(154): yii\\base\\InlineAction->runWithParams(Array)\n#19 /var/www/html/humhub/protected/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'\', Array)\n#20 /var/www/html/humhub/protected/vendor/yiisoft/yii2/web/Application.php(87): yii\\base\\Module->runAction(\'\', Array)\n#21 /var/www/html/humhub/protected/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(humhub\\components\\Request))\n#22 /var/www/html/humhub/index.php(25): yii\\base\\Application->run()\n#23 {main}\n\nNext yii\\db\\Exception: SQLSTATE[42000]: Syntax error or access violation: 1055 Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'humhub.notification.id\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by\nThe SQL being executed was: SELECT COUNT(*) FROM (SELECT `notification`.*, count(distinct(originator_user_id)) as group_count, max(created_at) as group_created_at, min(seen) as group_seen FROM `notification` WHERE ((`seen`=0) OR (`seen` IS NULL)) AND (`user_id`=1) GROUP BY COALESCE(group_key, id), `class` ORDER BY `group_seen`, `group_created_at` DESC) `c` in /var/www/html/humhub/protected/vendor/yiisoft/yii2/db/Schema.php:633\nStack trace:\n#0 /var/www/html/humhub/protected/vendor/yiisoft/yii2/db/Command.php(915): yii\\db\\Schema->convertException(Object(PDOException), \'SELECT COUNT(*)...\')\n#1 /var/www/html/humhub/protected/vendor/yiisoft/yii2/db/Command.php(388): yii\\db\\Command->queryInternal(\'fetchColumn\', 0)\n#2 /var/www/html/humhub/protected/vendor/yiisoft/yii2/db/Query.php(398): yii\\db\\Command->queryScalar()\n#3 /var/www/html/humhub/protected/vendor/yiisoft/yii2/db/ActiveQuery.php(334): yii\\db\\Query->queryScalar(\'COUNT(*)\', NULL)\n#4 /var/www/html/humhub/protected/vendor/yiisoft/yii2/db/Query.php(300): yii\\db\\ActiveQuery->queryScalar(\'COUNT(*)\', NULL)\n#5 /var/www/html/humhub/protected/humhub/modules/notification/controllers/ListController.php(108): yii\\db\\Query->count()\n#6 /var/www/html/humhub/protected/humhub/modules/notification/widgets/Overview.php(31): humhub\\modules\\notification\\controllers\\ListController::getUpdates()\n#7 /var/www/html/humhub/protected/vendor/yiisoft/yii2/base/Widget.php(102): humhub\\modules\\notification\\widgets\\Overview->run()\n#8 /var/www/html/humhub/protected/humhub/widgets/BaseStack.php(92): yii\\base\\Widget::widget(Array)\n#9 /var/www/html/humhub/protected/vendor/yiisoft/yii2/base/Widget.php(102): humhub\\widgets\\BaseStack->run()\n#10 /var/www/html/humhub/protected/humhub/views/layouts/main.php(99): yii\\base\\Widget::widget(Array)\n#11 /var/www/html/humhub/protected/vendor/yiisoft/yii2/base/View.php(325): require(\'/var/www/html/h...\')\n#12 /var/www/html/humhub/protected/vendor/yiisoft/yii2/base/View.php(247): yii\\base\\View->renderPhpFile(\'/var/www/html/h...\', \'[<span class=\"s...\')\n#13 /var/www/html/humhub/protected/vendor/yiisoft/yii2/base/Controller.php(393): yii\\base\\View->renderFile(\'/var/www/html/h...\', Array, Object(humhub\\modules\\dashboard\\controllers\\DashboardController))\n#14 /var/www/html/humhub/protected/vendor/yiisoft/yii2/base/Controller.php(379): yii\\base\\Controller->renderContent(\'<div class=\"con...\')\n#15 /var/www/html/humhub/protected/humhub/modules/dashboard/controllers/DashboardController.php(63): yii\\base\\Controller->render(\'index\', Array)\n#16 [internal function]: humhub\\modules\\dashboard\\controllers\\DashboardController->actionIndex()\n#17 /var/www/html/humhub/protected/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#18 /var/www/html/humhub/protected/vendor/yiisoft/yii2/base/Controller.php(154): yii\\base\\InlineAction->runWithParams(Array)\n#19 /var/www/html/humhub/protected/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'\', Array)\n#20 /var/www/html/humhub/protected/vendor/yiisoft/yii2/web/Application.php(87): yii\\base\\Module->runAction(\'\', Array)\n#21 /var/www/html/humhub/protected/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(humhub\\components\\Request))\n#22 /var/www/html/humhub/index.php(25): yii\\base\\Application->run()\n#23 {main}\nAdditional Information:\nArray\n(\n    [0] => 42000\n    [1] => 1055\n    [2] => Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'humhub.notification.id\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by\n)\n'),(2,4,'application',1534114448.8016,'[98.197.153.57][1][l5nrcprirga2gko3g2n89vjhe5]','$_SERVER = [\n    \'HTTP_HOST\' => \'128.206.119.44\'\n    \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:47.0) Gecko/20100101 Firefox/47.0\'\n    \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\'\n    \'HTTP_ACCEPT_LANGUAGE\' => \'en-US,en;q=0.5\'\n    \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate\'\n    \'HTTP_REFERER\' => \'http://128.206.119.44/humhub/index.php?r=user%2Fauth%2Flogin\'\n    \'HTTP_COOKIE\' => \'_csrf=417dac71df362e38ede58c6c704e3d274ae306609a1af1cd0b522517847a2a68a%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%226c8rzKnqHfa4CE5wINzqSf4m88PJQ43l%22%3B%7D; PHPSESSID=l5nrcprirga2gko3g2n89vjhe5; _identity=38a20aebdd3d9dc858319fce2fec453d6aaed9195056839c93389805add44b5ea%3A2%3A%7Bi%3A0%3Bs%3A9%3A%22_identity%22%3Bi%3A1%3Bs%3A50%3A%22%5B1%2C%229f887f17-b7a1-44d9-9894-5e8968db021d%22%2C2592000%5D%22%3B%7D\'\n    \'HTTP_CONNECTION\' => \'keep-alive\'\n    \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\'\n    \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at 128.206.119.44 Port 80</address>\n\'\n    \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\'\n    \'SERVER_NAME\' => \'128.206.119.44\'\n    \'SERVER_ADDR\' => \'128.206.119.44\'\n    \'SERVER_PORT\' => \'80\'\n    \'REMOTE_ADDR\' => \'98.197.153.57\'\n    \'DOCUMENT_ROOT\' => \'/var/www/html\'\n    \'REQUEST_SCHEME\' => \'http\'\n    \'CONTEXT_PREFIX\' => \'\'\n    \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/html\'\n    \'SERVER_ADMIN\' => \'webmaster@localhost\'\n    \'SCRIPT_FILENAME\' => \'/var/www/html/humhub/index.php\'\n    \'REMOTE_PORT\' => \'54779\'\n    \'GATEWAY_INTERFACE\' => \'CGI/1.1\'\n    \'SERVER_PROTOCOL\' => \'HTTP/1.1\'\n    \'REQUEST_METHOD\' => \'GET\'\n    \'QUERY_STRING\' => \'\'\n    \'REQUEST_URI\' => \'/humhub/index.php\'\n    \'SCRIPT_NAME\' => \'/humhub/index.php\'\n    \'PHP_SELF\' => \'/humhub/index.php\'\n    \'REQUEST_TIME_FLOAT\' => 1534114448.801\n    \'REQUEST_TIME\' => 1534114448\n]'),(3,2,'yii\\caching\\FileCache::setValue',1534114771.6016,'[98.197.153.57][1][l5nrcprirga2gko3g2n89vjhe5]','Unable to write cache file \'/var/www/html/humhub/protected/runtime/cache/hu/humhub371445828d3fcc247a07ac700688c925.bin\': file_put_contents(/var/www/html/humhub/protected/runtime/cache/hu/humhub371445828d3fcc247a07ac700688c925.bin): failed to open stream: Permission denied'),(4,2,'yii\\caching\\FileCache::setValue',1534114771.6018,'[98.197.153.57][1][l5nrcprirga2gko3g2n89vjhe5]','Unable to write cache file \'/var/www/html/humhub/protected/runtime/cache/hu/humhubdf6d0f4218c7262aa5e92e24c5e9bc9b.bin\': file_put_contents(/var/www/html/humhub/protected/runtime/cache/hu/humhubdf6d0f4218c7262aa5e92e24c5e9bc9b.bin): failed to open stream: Permission denied'),(5,2,'yii\\caching\\FileCache::setValue',1534114771.6022,'[98.197.153.57][1][l5nrcprirga2gko3g2n89vjhe5]','Unable to write cache file \'/var/www/html/humhub/protected/runtime/cache/hu/humhub0111d6b9a787c361e740eafe05a28e4b.bin\': file_put_contents(/var/www/html/humhub/protected/runtime/cache/hu/humhub0111d6b9a787c361e740eafe05a28e4b.bin): failed to open stream: Permission denied'),(6,2,'yii\\caching\\FileCache::setValue',1534114771.6953,'[98.197.153.57][1][l5nrcprirga2gko3g2n89vjhe5]','Unable to write cache file \'/var/www/html/humhub/protected/runtime/cache/hu/humhub371445828d3fcc247a07ac700688c925.bin\': file_put_contents(/var/www/html/humhub/protected/runtime/cache/hu/humhub371445828d3fcc247a07ac700688c925.bin): failed to open stream: Permission denied'),(7,2,'yii\\caching\\FileCache::setValue',1534114771.6954,'[98.197.153.57][1][l5nrcprirga2gko3g2n89vjhe5]','Unable to write cache file \'/var/www/html/humhub/protected/runtime/cache/hu/humhubff363904ced6e7467a097af2c177116e.bin\': file_put_contents(/var/www/html/humhub/protected/runtime/cache/hu/humhubff363904ced6e7467a097af2c177116e.bin): failed to open stream: Permission denied'),(8,2,'yii\\caching\\FileCache::setValue',1534114771.6957,'[98.197.153.57][1][l5nrcprirga2gko3g2n89vjhe5]','Unable to write cache file \'/var/www/html/humhub/protected/runtime/cache/hu/humhubenabledModuleIds.bin\': file_put_contents(/var/www/html/humhub/protected/runtime/cache/hu/humhubenabledModuleIds.bin): failed to open stream: Permission denied'),(9,2,'yii\\caching\\FileCache::setValue',1534114771.7167,'[98.197.153.57][1][l5nrcprirga2gko3g2n89vjhe5]','Unable to write cache file \'/var/www/html/humhub/protected/runtime/cache/hu/humhub371445828d3fcc247a07ac700688c925.bin\': file_put_contents(/var/www/html/humhub/protected/runtime/cache/hu/humhub371445828d3fcc247a07ac700688c925.bin): failed to open stream: Permission denied'),(10,2,'yii\\caching\\FileCache::setValue',1534114771.7169,'[98.197.153.57][1][l5nrcprirga2gko3g2n89vjhe5]','Unable to write cache file \'/var/www/html/humhub/protected/runtime/cache/hu/humhub28d199234f921b7208124c5d580087a0.bin\': file_put_contents(/var/www/html/humhub/protected/runtime/cache/hu/humhub28d199234f921b7208124c5d580087a0.bin): failed to open stream: Permission denied'),(11,2,'yii\\caching\\FileCache::setValue',1534114771.7508,'[98.197.153.57][1][l5nrcprirga2gko3g2n89vjhe5]','Unable to write cache file \'/var/www/html/humhub/protected/runtime/cache/hu/humhubdc7b5e97e95928dc737fd5b276ad8bfe.bin\': file_put_contents(/var/www/html/humhub/protected/runtime/cache/hu/humhubdc7b5e97e95928dc737fd5b276ad8bfe.bin): failed to open stream: Permission denied'),(12,1,'yii\\db\\Exception',1534114771.7681,'[98.197.153.57][1][l5nrcprirga2gko3g2n89vjhe5]','PDOException: SQLSTATE[42S22]: Column not found: 1054 Unknown column \'send_web_notifications\' in \'where clause\' in /var/www/html/humhub/protected/vendor/yiisoft/yii2/db/Command.php:915\nStack trace:\n#0 /var/www/html/humhub/protected/vendor/yiisoft/yii2/db/Command.php(915): PDOStatement->execute()\n#1 /var/www/html/humhub/protected/vendor/yiisoft/yii2/db/Command.php(388): yii\\db\\Command->queryInternal(\'fetchColumn\', 0)\n#2 /var/www/html/humhub/protected/vendor/yiisoft/yii2/db/Query.php(438): yii\\db\\Command->queryScalar()\n#3 /var/www/html/humhub/protected/vendor/yiisoft/yii2/db/ActiveQuery.php(339): yii\\db\\Query->queryScalar(\'COUNT(*)\', Object(yii\\db\\Connection))\n#4 /var/www/html/humhub/protected/vendor/yiisoft/yii2/db/Query.php(319): yii\\db\\ActiveQuery->queryScalar(\'COUNT(*)\', Object(yii\\db\\Connection))\n#5 /var/www/html/humhub/protected/humhub/modules/notification/controllers/ListController.php(98): yii\\db\\Query->count()\n#6 /var/www/html/humhub/protected/humhub/modules/notification/controllers/ListController.php(86): humhub\\modules\\notification\\controllers\\ListController::getUpdates()\n#7 [internal function]: humhub\\modules\\notification\\controllers\\ListController->actionGetUpdateJson()\n#8 /var/www/html/humhub/protected/vendor/yiisoft/yii2/base/InlineAction.php(57): call_user_func_array(Array, Array)\n#9 /var/www/html/humhub/protected/vendor/yiisoft/yii2/base/Controller.php(156): yii\\base\\InlineAction->runWithParams(Array)\n#10 /var/www/html/humhub/protected/vendor/yiisoft/yii2/base/Module.php(523): yii\\base\\Controller->runAction(\'get-update-json\', Array)\n#11 /var/www/html/humhub/protected/vendor/yiisoft/yii2/web/Application.php(102): yii\\base\\Module->runAction(\'notification/li...\', Array)\n#12 /var/www/html/humhub/protected/vendor/yiisoft/yii2/base/Application.php(380): yii\\web\\Application->handleRequest(Object(humhub\\components\\Request))\n#13 /var/www/html/humhub/index.php(25): yii\\base\\Application->run()\n#14 {main}\n\nNext yii\\db\\Exception: SQLSTATE[42S22]: Column not found: 1054 Unknown column \'send_web_notifications\' in \'where clause\'\nThe SQL being executed was: SELECT COUNT(*) FROM (SELECT `notification`.*, count(distinct(originator_user_id)) as group_user_count, count(*) as group_count, max(created_at) as group_created_at, min(seen) as group_seen FROM `notification` WHERE ((`user_id`=1) AND (`send_web_notifications`=1) AND (`seen`=0)) OR (`seen` IS NULL) GROUP BY COALESCE(group_key, id), `class` ORDER BY `group_seen`, `group_created_at` DESC) `c` in /var/www/html/humhub/protected/vendor/yiisoft/yii2/db/Schema.php:636\nStack trace:\n#0 /var/www/html/humhub/protected/vendor/yiisoft/yii2/db/Command.php(930): yii\\db\\Schema->convertException(Object(PDOException), \'SELECT COUNT(*)...\')\n#1 /var/www/html/humhub/protected/vendor/yiisoft/yii2/db/Command.php(388): yii\\db\\Command->queryInternal(\'fetchColumn\', 0)\n#2 /var/www/html/humhub/protected/vendor/yiisoft/yii2/db/Query.php(438): yii\\db\\Command->queryScalar()\n#3 /var/www/html/humhub/protected/vendor/yiisoft/yii2/db/ActiveQuery.php(339): yii\\db\\Query->queryScalar(\'COUNT(*)\', Object(yii\\db\\Connection))\n#4 /var/www/html/humhub/protected/vendor/yiisoft/yii2/db/Query.php(319): yii\\db\\ActiveQuery->queryScalar(\'COUNT(*)\', Object(yii\\db\\Connection))\n#5 /var/www/html/humhub/protected/humhub/modules/notification/controllers/ListController.php(98): yii\\db\\Query->count()\n#6 /var/www/html/humhub/protected/humhub/modules/notification/controllers/ListController.php(86): humhub\\modules\\notification\\controllers\\ListController::getUpdates()\n#7 [internal function]: humhub\\modules\\notification\\controllers\\ListController->actionGetUpdateJson()\n#8 /var/www/html/humhub/protected/vendor/yiisoft/yii2/base/InlineAction.php(57): call_user_func_array(Array, Array)\n#9 /var/www/html/humhub/protected/vendor/yiisoft/yii2/base/Controller.php(156): yii\\base\\InlineAction->runWithParams(Array)\n#10 /var/www/html/humhub/protected/vendor/yiisoft/yii2/base/Module.php(523): yii\\base\\Controller->runAction(\'get-update-json\', Array)\n#11 /var/www/html/humhub/protected/vendor/yiisoft/yii2/web/Application.php(102): yii\\base\\Module->runAction(\'notification/li...\', Array)\n#12 /var/www/html/humhub/protected/vendor/yiisoft/yii2/base/Application.php(380): yii\\web\\Application->handleRequest(Object(humhub\\components\\Request))\n#13 /var/www/html/humhub/index.php(25): yii\\base\\Application->run()\n#14 {main}\nAdditional Information:\nArray\n(\n    [0] => 42S22\n    [1] => 1054\n    [2] => Unknown column \'send_web_notifications\' in \'where clause\'\n)\n'),(13,4,'application',1534114771.3363,'[98.197.153.57][1][l5nrcprirga2gko3g2n89vjhe5]','$_GET = [\n    \'r\' => \'notification/list/get-update-json\'\n]\n\n$_SERVER = [\n    \'HTTP_HOST\' => \'128.206.119.44\'\n    \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:47.0) Gecko/20100101 Firefox/47.0\'\n    \'HTTP_ACCEPT\' => \'application/json, text/javascript, */*; q=0.01\'\n    \'HTTP_ACCEPT_LANGUAGE\' => \'en-US,en;q=0.5\'\n    \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate\'\n    \'HTTP_X_CSRF_TOKEN\' => \'eWFvWEZUMVFPAlcqPB9fIDEHDmwFEQQmMC8VKRUyBTxBWT8SF2ACPQ==\'\n    \'HTTP_X_REQUESTED_WITH\' => \'XMLHttpRequest\'\n    \'HTTP_REFERER\' => \'http://128.206.119.44/humhub/index.php\'\n    \'HTTP_COOKIE\' => \'pm_getting-started-panel=expanded; _csrf=417dac71df362e38ede58c6c704e3d274ae306609a1af1cd0b522517847a2a68a%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%226c8rzKnqHfa4CE5wINzqSf4m88PJQ43l%22%3B%7D; PHPSESSID=l5nrcprirga2gko3g2n89vjhe5; _identity=38a20aebdd3d9dc858319fce2fec453d6aaed9195056839c93389805add44b5ea%3A2%3A%7Bi%3A0%3Bs%3A9%3A%22_identity%22%3Bi%3A1%3Bs%3A50%3A%22%5B1%2C%229f887f17-b7a1-44d9-9894-5e8968db021d%22%2C2592000%5D%22%3B%7D\'\n    \'HTTP_CONNECTION\' => \'keep-alive\'\n    \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\'\n    \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at 128.206.119.44 Port 80</address>\n\'\n    \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\'\n    \'SERVER_NAME\' => \'128.206.119.44\'\n    \'SERVER_ADDR\' => \'128.206.119.44\'\n    \'SERVER_PORT\' => \'80\'\n    \'REMOTE_ADDR\' => \'98.197.153.57\'\n    \'DOCUMENT_ROOT\' => \'/var/www/html\'\n    \'REQUEST_SCHEME\' => \'http\'\n    \'CONTEXT_PREFIX\' => \'\'\n    \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/html\'\n    \'SERVER_ADMIN\' => \'webmaster@localhost\'\n    \'SCRIPT_FILENAME\' => \'/var/www/html/humhub/index.php\'\n    \'REMOTE_PORT\' => \'54993\'\n    \'GATEWAY_INTERFACE\' => \'CGI/1.1\'\n    \'SERVER_PROTOCOL\' => \'HTTP/1.1\'\n    \'REQUEST_METHOD\' => \'GET\'\n    \'QUERY_STRING\' => \'r=dashboard%2Fdashboard\'\n    \'REQUEST_URI\' => \'/humhub/index.php?r=dashboard%2Fdashboard\'\n    \'SCRIPT_NAME\' => \'/humhub/index.php\'\n    \'PHP_SELF\' => \'/humhub/index.php\'\n    \'REQUEST_TIME_FLOAT\' => 1534116045.292\n    \'REQUEST_TIME\' => 1534116045\n]'),(1126,2,'yii\\log\\Dispatcher::dispatch',1534116045.7304,'[98.197.153.57][1][-]','Unable to send log via yii\\log\\FileTarget: Exception (Invalid Configuration) \'yii\\base\\InvalidConfigException\' with message \'Unable to append to log file: /var/www/html/humhub/protected/runtime/logs/app.log\' \n\nin /var/www/html/humhub/protected/vendor/yiisoft/yii2/log/FileTarget.php:108\n\nStack trace:\n#0 /var/www/html/humhub/protected/vendor/yiisoft/yii2/log/Target.php(124): yii\\log\\FileTarget->export()\n#1 /var/www/html/humhub/protected/vendor/yiisoft/yii2/log/Dispatcher.php(188): yii\\log\\Target->collect(Array, true)\n#2 /var/www/html/humhub/protected/vendor/yiisoft/yii2/log/Logger.php(177): yii\\log\\Dispatcher->dispatch(Array, true)\n#3 [internal function]: yii\\log\\Logger->flush(true)\n#4 {main}'),(1127,4,'application',1534116045.2929,'[98.197.153.57][1][-]','$_GET = [\n    \'r\' => \'dashboard/dashboard\'\n]\n\n$_SERVER = [\n    \'HTTP_HOST\' => \'128.206.119.44\'\n    \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:47.0) Gecko/20100101 Firefox/47.0\'\n    \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\'\n    \'HTTP_ACCEPT_LANGUAGE\' => \'en-US,en;q=0.5\'\n    \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate\'\n    \'HTTP_REFERER\' => \'http://128.206.119.44/humhub/index.php?r=user%2Fauth%2Flogin\'\n    \'HTTP_COOKIE\' => \'pm_getting-started-panel=expanded; _csrf=417dac71df362e38ede58c6c704e3d274ae306609a1af1cd0b522517847a2a68a%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%226c8rzKnqHfa4CE5wINzqSf4m88PJQ43l%22%3B%7D; PHPSESSID=l5nrcprirga2gko3g2n89vjhe5; _identity=38a20aebdd3d9dc858319fce2fec453d6aaed9195056839c93389805add44b5ea%3A2%3A%7Bi%3A0%3Bs%3A9%3A%22_identity%22%3Bi%3A1%3Bs%3A50%3A%22%5B1%2C%229f887f17-b7a1-44d9-9894-5e8968db021d%22%2C2592000%5D%22%3B%7D\'\n    \'HTTP_CONNECTION\' => \'keep-alive\'\n    \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\'\n    \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at 128.206.119.44 Port 80</address>\n\'\n    \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\'\n    \'SERVER_NAME\' => \'128.206.119.44\'\n    \'SERVER_ADDR\' => \'128.206.119.44\'\n    \'SERVER_PORT\' => \'80\'\n    \'REMOTE_ADDR\' => \'98.197.153.57\'\n    \'DOCUMENT_ROOT\' => \'/var/www/html\'\n    \'REQUEST_SCHEME\' => \'http\'\n    \'CONTEXT_PREFIX\' => \'\'\n    \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/html\'\n    \'SERVER_ADMIN\' => \'webmaster@localhost\'\n    \'SCRIPT_FILENAME\' => \'/var/www/html/humhub/index.php\'\n    \'REMOTE_PORT\' => \'54993\'\n    \'GATEWAY_INTERFACE\' => \'CGI/1.1\'\n    \'SERVER_PROTOCOL\' => \'HTTP/1.1\'\n    \'REQUEST_METHOD\' => \'GET\'\n    \'QUERY_STRING\' => \'r=dashboard%2Fdashboard\'\n    \'REQUEST_URI\' => \'/humhub/index.php?r=dashboard%2Fdashboard\'\n    \'SCRIPT_NAME\' => \'/humhub/index.php\'\n    \'PHP_SELF\' => \'/humhub/index.php\'\n    \'REQUEST_TIME_FLOAT\' => 1534116045.292\n    \'REQUEST_TIME\' => 1534116045\n]'),(1128,1,'yii\\base\\InvalidConfigException',1534116068.1429,'[98.197.153.57][1][l5nrcprirga2gko3g2n89vjhe5]','yii\\base\\InvalidConfigException: The table does not exist: session in /var/www/html/humhub/protected/vendor/yiisoft/yii2/db/ActiveRecord.php:333\nStack trace:\n#0 /var/www/html/humhub/protected/vendor/yiisoft/yii2/db/ActiveRecord.php(364): yii\\db\\ActiveRecord::getTableSchema()\n#1 /var/www/html/humhub/protected/vendor/yiisoft/yii2/db/BaseActiveRecord.php(472): yii\\db\\ActiveRecord->attributes()\n#2 /var/www/html/humhub/protected/vendor/yiisoft/yii2/db/BaseActiveRecord.php(279): yii\\db\\BaseActiveRecord->hasAttribute(\'isNewRecord\')\n#3 /var/www/html/humhub/protected/humhub/components/behaviors/GUID.php(34): yii\\db\\BaseActiveRecord->__get(\'isNewRecord\')\n#4 [internal function]: humhub\\components\\behaviors\\GUID->setGuid(Object(yii\\base\\ModelEvent))\n#5 /var/www/html/humhub/protected/vendor/yiisoft/yii2/base/Component.php(545): call_user_func(Array, Object(yii\\base\\ModelEvent))\n#6 /var/www/html/humhub/protected/vendor/yiisoft/yii2/base/Model.php(376): yii\\base\\Component->trigger(\'beforeValidate\', Object(yii\\base\\ModelEvent))\n#7 /var/www/html/humhub/protected/vendor/yiisoft/yii2/base/Model.php(343): yii\\base\\Model->beforeValidate()\n#8 /var/www/html/humhub/protected/humhub/modules/session/models/SessionSearch.php(81): yii\\base\\Model->validate()\n#9 /var/www/html/humhub/protected/humhub/modules/session/controllers/SessionController.php(56): humhub\\modules\\session\\models\\SessionSearch->search(Array)\n#10 [internal function]: humhub\\modules\\session\\controllers\\SessionController->actionIndex()\n#11 /var/www/html/humhub/protected/vendor/yiisoft/yii2/base/InlineAction.php(57): call_user_func_array(Array, Array)\n#12 /var/www/html/humhub/protected/vendor/yiisoft/yii2/base/Controller.php(156): yii\\base\\InlineAction->runWithParams(Array)\n#13 /var/www/html/humhub/protected/vendor/yiisoft/yii2/base/Module.php(523): yii\\base\\Controller->runAction(\'\', Array)\n#14 /var/www/html/humhub/protected/vendor/yiisoft/yii2/web/Application.php(102): yii\\base\\Module->runAction(\'session/session\', Array)\n#15 /var/www/html/humhub/protected/vendor/yiisoft/yii2/base/Application.php(380): yii\\web\\Application->handleRequest(Object(humhub\\components\\Request))\n#16 /var/www/html/humhub/index.php(25): yii\\base\\Application->run()\n#17 {main}'),(1129,4,'application',1534116068.088,'[98.197.153.57][1][l5nrcprirga2gko3g2n89vjhe5]','$_GET = [\n    \'r\' => \'session/session\'\n    \'_pjax\' => \'#layout-content\'\n    \'_\' => \'1534116065427\'\n]\n\n$_SERVER = [\n    \'HTTP_HOST\' => \'128.206.119.44\'\n    \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:47.0) Gecko/20100101 Firefox/47.0\'\n    \'HTTP_ACCEPT\' => \'text/html, */*; q=0.01\'\n    \'HTTP_ACCEPT_LANGUAGE\' => \'en-US,en;q=0.5\'\n    \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate\'\n    \'HTTP_X_CSRF_TOKEN\' => \'AOXT86PaUrJFjKU8fTnPZxCNVcHTyXcKn6NPw6kK2QI2huuB2ZE8ww3qxAg-fPoQWcMvsICvQ2enmx-J-D7qbg==\'\n    \'CONTENT_TYPE\' => \'application/x-www-form-urlencoded; charset=UTF-8\'\n    \'HTTP_X_PJAX\' => \'true\'\n    \'HTTP_X_PJAX_CONTAINER\' => \'#layout-content\'\n    \'HTTP_X_REQUESTED_WITH\' => \'XMLHttpRequest\'\n    \'HTTP_REFERER\' => \'http://128.206.119.44/humhub/index.php?r=dashboard%2Fdashboard\'\n    \'HTTP_COOKIE\' => \'pm_getting-started-panel=expanded; _csrf=417dac71df362e38ede58c6c704e3d274ae306609a1af1cd0b522517847a2a68a%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%226c8rzKnqHfa4CE5wINzqSf4m88PJQ43l%22%3B%7D; PHPSESSID=l5nrcprirga2gko3g2n89vjhe5; _identity=38a20aebdd3d9dc858319fce2fec453d6aaed9195056839c93389805add44b5ea%3A2%3A%7Bi%3A0%3Bs%3A9%3A%22_identity%22%3Bi%3A1%3Bs%3A50%3A%22%5B1%2C%229f887f17-b7a1-44d9-9894-5e8968db021d%22%2C2592000%5D%22%3B%7D\'\n    \'HTTP_CONNECTION\' => \'keep-alive\'\n    \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\'\n    \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at 128.206.119.44 Port 80</address>\n\'\n    \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\'\n    \'SERVER_NAME\' => \'128.206.119.44\'\n    \'SERVER_ADDR\' => \'128.206.119.44\'\n    \'SERVER_PORT\' => \'80\'\n    \'REMOTE_ADDR\' => \'98.197.153.57\'\n    \'DOCUMENT_ROOT\' => \'/var/www/html\'\n    \'REQUEST_SCHEME\' => \'http\'\n    \'CONTEXT_PREFIX\' => \'\'\n    \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/html\'\n    \'SERVER_ADMIN\' => \'webmaster@localhost\'\n    \'SCRIPT_FILENAME\' => \'/var/www/html/humhub/index.php\'\n    \'REMOTE_PORT\' => \'54998\'\n    \'GATEWAY_INTERFACE\' => \'CGI/1.1\'\n    \'SERVER_PROTOCOL\' => \'HTTP/1.1\'\n    \'REQUEST_METHOD\' => \'GET\'\n    \'QUERY_STRING\' => \'r=session%2Fsession&_pjax=%23layout-content&_=1534116065427\'\n    \'REQUEST_URI\' => \'/humhub/index.php?r=session%2Fsession&_pjax=%23layout-content&_=1534116065427\'\n    \'SCRIPT_NAME\' => \'/humhub/index.php\'\n    \'PHP_SELF\' => \'/humhub/index.php\'\n    \'REQUEST_TIME_FLOAT\' => 1534116068.087\n    \'REQUEST_TIME\' => 1534116068\n]'),(1130,1,'yii\\base\\InvalidConfigException',1534116068.4049,'[98.197.153.57][1][l5nrcprirga2gko3g2n89vjhe5]','yii\\base\\InvalidConfigException: The table does not exist: session in /var/www/html/humhub/protected/vendor/yiisoft/yii2/db/ActiveRecord.php:333\nStack trace:\n#0 /var/www/html/humhub/protected/vendor/yiisoft/yii2/db/ActiveRecord.php(364): yii\\db\\ActiveRecord::getTableSchema()\n#1 /var/www/html/humhub/protected/vendor/yiisoft/yii2/db/BaseActiveRecord.php(472): yii\\db\\ActiveRecord->attributes()\n#2 /var/www/html/humhub/protected/vendor/yiisoft/yii2/db/BaseActiveRecord.php(279): yii\\db\\BaseActiveRecord->hasAttribute(\'isNewRecord\')\n#3 /var/www/html/humhub/protected/humhub/components/behaviors/GUID.php(34): yii\\db\\BaseActiveRecord->__get(\'isNewRecord\')\n#4 [internal function]: humhub\\components\\behaviors\\GUID->setGuid(Object(yii\\base\\ModelEvent))\n#5 /var/www/html/humhub/protected/vendor/yiisoft/yii2/base/Component.php(545): call_user_func(Array, Object(yii\\base\\ModelEvent))\n#6 /var/www/html/humhub/protected/vendor/yiisoft/yii2/base/Model.php(376): yii\\base\\Component->trigger(\'beforeValidate\', Object(yii\\base\\ModelEvent))\n#7 /var/www/html/humhub/protected/vendor/yiisoft/yii2/base/Model.php(343): yii\\base\\Model->beforeValidate()\n#8 /var/www/html/humhub/protected/humhub/modules/session/models/SessionSearch.php(81): yii\\base\\Model->validate()\n#9 /var/www/html/humhub/protected/humhub/modules/session/controllers/SessionController.php(56): humhub\\modules\\session\\models\\SessionSearch->search(Array)\n#10 [internal function]: humhub\\modules\\session\\controllers\\SessionController->actionIndex()\n#11 /var/www/html/humhub/protected/vendor/yiisoft/yii2/base/InlineAction.php(57): call_user_func_array(Array, Array)\n#12 /var/www/html/humhub/protected/vendor/yiisoft/yii2/base/Controller.php(156): yii\\base\\InlineAction->runWithParams(Array)\n#13 /var/www/html/humhub/protected/vendor/yiisoft/yii2/base/Module.php(523): yii\\base\\Controller->runAction(\'\', Array)\n#14 /var/www/html/humhub/protected/vendor/yiisoft/yii2/web/Application.php(102): yii\\base\\Module->runAction(\'session/session\', Array)\n#15 /var/www/html/humhub/protected/vendor/yiisoft/yii2/base/Application.php(380): yii\\web\\Application->handleRequest(Object(humhub\\components\\Request))\n#16 /var/www/html/humhub/index.php(25): yii\\base\\Application->run()\n#17 {main}'),(1131,4,'application',1534116068.374,'[98.197.153.57][1][l5nrcprirga2gko3g2n89vjhe5]','$_GET = [\n    \'r\' => \'session/session\'\n]\n\n$_SERVER = [\n    \'HTTP_HOST\' => \'128.206.119.44\'\n    \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:47.0) Gecko/20100101 Firefox/47.0\'\n    \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\'\n    \'HTTP_ACCEPT_LANGUAGE\' => \'en-US,en;q=0.5\'\n    \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate\'\n    \'HTTP_REFERER\' => \'http://128.206.119.44/humhub/index.php?r=dashboard%2Fdashboard\'\n    \'HTTP_COOKIE\' => \'pm_getting-started-panel=expanded; _csrf=417dac71df362e38ede58c6c704e3d274ae306609a1af1cd0b522517847a2a68a%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%226c8rzKnqHfa4CE5wINzqSf4m88PJQ43l%22%3B%7D; PHPSESSID=l5nrcprirga2gko3g2n89vjhe5; _identity=38a20aebdd3d9dc858319fce2fec453d6aaed9195056839c93389805add44b5ea%3A2%3A%7Bi%3A0%3Bs%3A9%3A%22_identity%22%3Bi%3A1%3Bs%3A50%3A%22%5B1%2C%229f887f17-b7a1-44d9-9894-5e8968db021d%22%2C2592000%5D%22%3B%7D\'\n    \'HTTP_CONNECTION\' => \'keep-alive\'\n    \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\'\n    \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at 128.206.119.44 Port 80</address>\n\'\n    \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\'\n    \'SERVER_NAME\' => \'128.206.119.44\'\n    \'SERVER_ADDR\' => \'128.206.119.44\'\n    \'SERVER_PORT\' => \'80\'\n    \'REMOTE_ADDR\' => \'98.197.153.57\'\n    \'DOCUMENT_ROOT\' => \'/var/www/html\'\n    \'REQUEST_SCHEME\' => \'http\'\n    \'CONTEXT_PREFIX\' => \'\'\n    \'CONTEXT_DOCUMENT_ROOT\' => \'/var/www/html\'\n    \'SERVER_ADMIN\' => \'webmaster@localhost\'\n    \'SCRIPT_FILENAME\' => \'/var/www/html/humhub/index.php\'\n    \'REMOTE_PORT\' => \'54996\'\n    \'GATEWAY_INTERFACE\' => \'CGI/1.1\'\n    \'SERVER_PROTOCOL\' => \'HTTP/1.1\'\n    \'REQUEST_METHOD\' => \'GET\'\n    \'QUERY_STRING\' => \'r=session%2Fsession\'\n    \'REQUEST_URI\' => \'/humhub/index.php?r=session%2Fsession\'\n    \'SCRIPT_NAME\' => \'/humhub/index.php\'\n    \'PHP_SELF\' => \'/humhub/index.php\'\n    \'REQUEST_TIME_FLOAT\' => 1534116068.373\n    \'REQUEST_TIME\' => 1534116068\n]');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_updated` (`updated_at`),
  KEY `index_updated_by` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_entry` 
--

DROP TABLE IF EXISTS `message_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `file_id` int(11) DEFAULT NULL,
  `content` text NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_id` (`user_id`),
  KEY `index_message_id` (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_entry`
--

LOCK TABLES `message_entry` WRITE;
/*!40000 ALTER TABLE `message_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` VALUES ('m000000_000000_base',1534114218),('m131023_164513_initial',1534114223),('m131023_165214_initial',1534114356),('m131023_165411_initial',1534114224),('m131023_165507_initial',1534114348),('m131023_165625_initial',1534114225),('m131023_165755_initial',1534114225),('m131023_165835_initial',1534114226),('m131023_165921_initial',1534114351),('m131023_170033_initial',1534114226),('m131023_170135_initial',1534114226),('m131023_170159_initial',1534114226),('m131023_170253_initial',1534114227),('m131023_170339_initial',1534114227),('m131030_122743_longer_questions',1534114352),('m131203_110444_oembed',1534114227),('m131213_165552_user_optimize',1534114229),('m140226_111945_ldap',1534114230),('m140303_125031_password',1534114231),('m140304_142711_memberautoadd',1534114231),('m140321_000917_content',1534114232),('m140324_170617_membership',1534114232),('m140507_150421_create_settings_table',1534114232),('m140507_171527_create_settings_table',1534114233),('m140512_141414_i18n_profilefields',1534114234),('m140513_180317_createlogging',1534114234),('m140701_000611_profile_genderfield',1534114234),('m140701_074404_protect_default_profilefields',1534114235),('m140702_143912_notify_notification_unify',1534114235),('m140703_104527_profile_birthdayfield',1534114235),('m140704_080659_installationid',1534114235),('m140705_065525_emailing_settings',1534114236),('m140706_135210_lastlogin',1534114236),('m140812_093445_rename_deadline_column',1534114356),('m140829_122906_delete',1534114237),('m140830_145504_following',1534114238),('m140901_080147_indizies',1534114238),('m140901_080432_indices',1534114238),('m140901_112246_addState',1534114240),('m140901_153403_addState',1534114242),('m140901_170329_group_create_space',1534114242),('m140902_091234_session_key_length',1534114243),('m140907_140822_zip_field_to_text',1534114243),('m140930_045035_initial',1534114331),('m140930_205511_fix_default',1534114244),('m140930_205859_fix_default',1534114244),('m140930_210142_fix_default',1534114245),('m140930_210635_fix_default',1534114246),('m140930_212528_fix_default',1534114247),('m141002_084750_fix_default',1534114357),('m141002_092800_fix_deadline',1534114357),('m141002_093710_fix_default',1534114352),('m141004_022835_initial',1534114359),('m141015_173305_follow_notifications',1534114247),('m141019_093319_mentioning',1534114248),('m141020_162639_fix_default',1534114249),('m141020_193920_rm_alsocreated',1534114249),('m141020_193931_rm_alsoliked',1534114249),('m141021_162639_oembed_setting',1534114249),('m141022_094635_addDefaults',1534114249),('m141026_135537_adminOnly',1534114332),('m141106_185632_log_init',1534114250),('m150204_103433_html5_notified',1534114250),('m150210_190006_user_invite_lang',1534114251),('m150302_114347_add_visibility',1534114251),('m150322_194403_remove_type_field',1534114252),('m150322_195619_allowedExt2Text',1534114252),('m150429_190600_indexes',1534114348),('m150429_223856_optimize',1534114252),('m150510_102900_update',1534114252),('m150629_220311_change',1534114253),('m150703_012735_typelength',1534114253),('m150703_024635_activityTypes',1534114253),('m150703_033650_namespace',1534114253),('m150703_130157_migrate',1534114253),('m150704_005338_namespace',1534114254),('m150704_005418_namespace',1534114254),('m150704_005434_namespace',1534114254),('m150704_005452_namespace',1534114254),('m150704_005504_namespace',1534114254),('m150705_081309_namespace',1534114359),('m150709_050451_namespace',1534114348),('m150709_151858_namespace',1534114352),('m150710_055123_namespace',1534114357),('m150713_054441_timezone',1534114254),('m150714_093525_activity',1534114255),('m150714_100355_cleanup',1534114258),('m150720_174011_initial',1534114323),('m150831_061628_notifications',1534114258),('m150910_223305_fix_user_follow',1534114258),('m150916_131805_container',1534114332),('m150917_104409_add_new_windows',1534114333),('m150924_133344_update_notification_fix',1534114258),('m150924_154635_user_invite_add_first_lastname',1534114259),('m150927_190830_create_contentcontainer',1534114260),('m150928_103711_permissions',1534114261),('m150928_134934_groups',1534114262),('m150928_140718_setColorVariables',1534114262),('m151010_124437_group_permissions',1534114263),('m151010_175000_default_visibility',1534114264),('m151013_223814_include_dashboard',1534114264),('m151022_131128_module_fix',1534114264),('m151106_090948_addColor',1534114264),('m151223_171310_fix_notifications',1534114264),('m151224_162440_fix_module_id_notifications',1534114357),('m151226_164234_authclient',1534114265),('m160125_053702_stored_filename',1534114265),('m160216_160119_initial',1534114266),('m160217_161220_addCanLeaveFlag',1534114267),('m160218_132531_close_and_anonymous_poll',1534114353),('m160220_013525_contentcontainer_id',1534114270),('m160221_222312_public_permission_change',1534114270),('m160225_180229_remove_website',1534114270),('m160227_073020_birthday_date',1534114270),('m160229_162959_multiusergroups',1534114274),('m160309_141222_longerUserName',1534114274),('m160408_100725_rename_groupadmin_to_manager',1534114274),('m160501_220850_activity_pk_int',1534114274),('m160507_202611_settings',1534114275),('m160508_005740_settings_cleanup',1534114278),('m160509_214811_spaceurl',1534114279),('m160517_132535_group',1534114279),('m160523_105732_profile_searchable',1534114280),('m160714_142827_remove_space_id',1534114280),('m160719_131212_init_templates',1534114339),('m160808_124800_text_content',1534114339),('m160810_174011_add_description',1534114324),('m160817_130334_page_content_medium_text',1534114340),('m160817_180831_add_type',1534114324),('m160824_120822_add_has_wall_entry',1534114324),('m160831_133950_snippets',1534114340),('m160907_122454_file_content',1534114340),('m160907_175706_default_templates',1534114341),('m160908_084038_admin_only_other_pagetypes',1534114342),('m160922_092100_page_class',1534114343),('m160922_115053_page_url',1534114344),('m160922_143514_page_url_index',1534114344),('m170122_091531_missingdefault',1534114357);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_enabled`
--

DROP TABLE IF EXISTS `module_enabled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module_enabled` (
  `module_id` varchar(100) NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_enabled`
--

LOCK TABLES `module_enabled` WRITE;
/*!40000 ALTER TABLE `module_enabled` DISABLE KEYS */;
INSERT INTO `module_enabled` VALUES ('birthday'),('cfiles'),('custom_pages'),('mail'),('polls'),('tasks'),('wiki');
/*!40000 ALTER TABLE `module_enabled` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `seen` tinyint(4) DEFAULT NULL,
  `source_class` varchar(100) DEFAULT NULL,
  `source_pk` int(11) DEFAULT NULL,
  `space_id` int(11) DEFAULT NULL,
  `emailed` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `desktop_notified` tinyint(1) DEFAULT '0',
  `originator_user_id` int(11) DEFAULT NULL,
  `module` varchar(100) DEFAULT '',
  `group_key` varchar(75) DEFAULT NULL,
  `send_web_notifications` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `index_user_id` (`user_id`),
  KEY `index_seen` (`seen`),
  KEY `index_desktop_notified` (`desktop_notified`),
  KEY `index_desktop_emailed` (`emailed`),
  KEY `index_groupuser` (`user_id`,`class`,`group_key`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,'humhub\\modules\\comment\\notifications\\NewComment',1,0,'humhub\\modules\\comment\\models\\Comment',1,1,0,'2018-08-12 17:53:13',1,2,'comment','humhub\\modules\\post\\models\\Post-2',1),(2,'humhub\\modules\\comment\\notifications\\NewComment',1,0,'humhub\\modules\\comment\\models\\Comment',2,1,0,'2018-08-12 17:53:13',1,3,'comment','humhub\\modules\\post\\models\\Post-2',1),(3,'humhub\\modules\\comment\\notifications\\NewComment',2,0,'humhub\\modules\\comment\\models\\Comment',2,1,0,'2018-08-12 17:53:13',0,3,'comment','humhub\\modules\\post\\models\\Post-2',1),(4,'humhub\\modules\\comment\\notifications\\NewComment',1,0,'humhub\\modules\\comment\\models\\Comment',3,1,0,'2018-08-12 17:53:14',1,2,'comment','humhub\\modules\\polls\\models\\Poll-1',1),(5,'humhub\\modules\\comment\\notifications\\NewComment',1,0,'humhub\\modules\\comment\\models\\Comment',4,1,0,'2018-08-12 17:53:15',1,3,'comment','humhub\\modules\\polls\\models\\Poll-1',1),(6,'humhub\\modules\\comment\\notifications\\NewComment',2,0,'humhub\\modules\\comment\\models\\Comment',4,1,0,'2018-08-12 17:53:15',0,3,'comment','humhub\\modules\\polls\\models\\Poll-1',1);
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poll`
--

DROP TABLE IF EXISTS `poll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `allow_multiple` smallint(6) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `is_random` tinyint(1) DEFAULT '0',
  `closed` tinyint(1) DEFAULT '0',
  `anonymous` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll`
--

LOCK TABLES `poll` WRITE;
/*!40000 ALTER TABLE `poll` DISABLE KEYS */;
INSERT INTO `poll` VALUES (1,'Right now, we are in the planning stages for our next meetup and we would like to know from you, where you would like to go?',0,'2018-08-12 17:53:14',1,'2018-08-12 17:53:14',1,0,0,0);
/*!40000 ALTER TABLE `poll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poll_answer`
--

DROP TABLE IF EXISTS `poll_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poll_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poll_id` int(11) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll_answer`
--

LOCK TABLES `poll_answer` WRITE;
/*!40000 ALTER TABLE `poll_answer` DISABLE KEYS */;
INSERT INTO `poll_answer` VALUES (1,1,'To Daniel','2018-08-12 17:53:14',1,'2018-08-12 17:53:14',1),(2,1,'Club A Steakhouse','2018-08-12 17:53:14',1,'2018-08-12 17:53:14',1),(3,1,'Pisillo Italian Panini','2018-08-12 17:53:14',1,'2018-08-12 17:53:14',1);
/*!40000 ALTER TABLE `poll_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poll_answer_user`
--

DROP TABLE IF EXISTS `poll_answer_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poll_answer_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poll_id` int(11) NOT NULL,
  `poll_answer_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll_answer_user`
--

LOCK TABLES `poll_answer_user` WRITE;
/*!40000 ALTER TABLE `poll_answer_user` DISABLE KEYS */;
INSERT INTO `poll_answer_user` VALUES (1,1,2,'2018-08-12 17:53:14',2,'2018-08-12 17:53:14',2),(2,1,3,'2018-08-12 17:53:15',3,'2018-08-12 17:53:15',3);
/*!40000 ALTER TABLE `poll_answer_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--
DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_2trash` text,
  `message` text,
  `url` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,NULL,'Yay! I\'ve just installed HumHub ;Cool;',NULL,'2018-08-12 17:53:09',1,'2018-08-12 17:53:09',1),(2,NULL,'We\'re looking for great slogans of famous brands. Maybe you can come up with some samples?',NULL,'2018-08-12 17:53:13',1,'2018-08-12 17:53:13',1);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--
DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `user_id` int(11) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `birthday_hide_year` int(1) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `about` text,
  `phone_private` varchar(255) DEFAULT NULL,
  `phone_work` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `im_skype` varchar(255) DEFAULT NULL,
  `im_msn` varchar(255) DEFAULT NULL,
  `im_xmpp` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `url_facebook` varchar(255) DEFAULT NULL,
  `url_linkedin` varchar(255) DEFAULT NULL,
  `url_xing` varchar(255) DEFAULT NULL,
  `url_youtube` varchar(255) DEFAULT NULL,
  `url_vimeo` varchar(255) DEFAULT NULL,
  `url_flickr` varchar(255) DEFAULT NULL,
  `url_myspace` varchar(255) DEFAULT NULL,
  `url_googleplus` varchar(255) DEFAULT NULL,
  `url_twitter` varchar(255) DEFAULT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (1,'Sai Shreya','Nuguri','System Administration',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'David','Roberts','Late riser',NULL,'2443 Queens Lane','24574','Allwood','Virginia',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'Sara','Schuster','Do-gooder',NULL,'Schmarjestrasse 51','17095','Friedland','Niedersachsen',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_field`
--

DROP TABLE IF EXISTS `profile_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_field_category_id` int(11) NOT NULL,
  `module_id` varchar(255) DEFAULT NULL,
  `field_type_class` varchar(255) NOT NULL,
  `field_type_config` text,
  `internal_name` varchar(100) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `sort_order` int(11) NOT NULL DEFAULT '100',
  `required` tinyint(4) DEFAULT NULL,
  `show_at_registration` tinyint(4) DEFAULT NULL,
  `editable` tinyint(4) NOT NULL DEFAULT '1',
  `visible` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `ldap_attribute` varchar(255) DEFAULT NULL,
  `translation_category` varchar(255) DEFAULT NULL,
  `is_system` int(1) DEFAULT NULL,
  `searchable` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `index_profile_field_category` (`profile_field_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_field`
--

LOCK TABLES `profile_field` WRITE;
/*!40000 ALTER TABLE `profile_field` DISABLE KEYS */;
INSERT INTO `profile_field` VALUES (1,1,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":20,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','firstname','First name',NULL,100,1,1,1,1,NULL,NULL,NULL,NULL,'givenName',NULL,1,1),(2,1,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":30,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','lastname','Last name',NULL,200,1,1,1,1,NULL,NULL,NULL,NULL,'sn',NULL,1,1),(3,1,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":50,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','title','Title',NULL,300,NULL,NULL,1,1,NULL,NULL,NULL,NULL,'title',NULL,1,1),(4,1,NULL,'humhub\\modules\\user\\models\\fieldtype\\Select','{\"options\":\"male=>Male\\nfemale=>Female\\ncustom=>Custom\",\"fieldTypes\":[]}','gender','Gender',NULL,300,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,1,1),(5,1,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":150,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','street','Street',NULL,400,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,1,1),(6,1,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":10,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','zip','Zip',NULL,500,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,1,1),(7,1,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":100,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','city','City',NULL,600,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,1,1),(8,1,NULL,'humhub\\modules\\user\\models\\fieldtype\\CountrySelect','{\"options\":null,\"fieldTypes\":[]}','country','Country',NULL,700,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,1,1),(9,1,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":100,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','state','State',NULL,800,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,1,1),(10,1,NULL,'humhub\\modules\\user\\models\\fieldtype\\Birthday','{\"defaultHideAge\":false,\"fieldTypes\":[]}','birthday','Birthday',NULL,900,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,1,1),(11,1,NULL,'humhub\\modules\\user\\models\\fieldtype\\TextArea','{\"fieldTypes\":[]}','about','About',NULL,900,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,1,1),(12,2,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":100,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','phone_private','Phone Private',NULL,100,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,1,1),(13,2,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":100,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','phone_work','Phone Work',NULL,200,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,1,1),(14,2,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":100,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','mobile','Mobile',NULL,300,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,1,1),(15,2,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":100,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','fax','Fax',NULL,400,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,1,1),(16,2,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":100,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','im_skype','Skype Nickname',NULL,500,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,1,1),(17,2,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":100,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','im_msn','MSN',NULL,600,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,1,1),(18,2,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":255,\"validator\":\"email\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','im_xmpp','XMPP Jabber Address',NULL,800,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,1,1),(19,3,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','url','Url',NULL,100,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,1,1),(20,3,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','url_facebook','Facebook URL',NULL,200,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,1,1),(21,3,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','url_linkedin','LinkedIn URL',NULL,300,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,1,1),(22,3,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','url_xing','Xing URL',NULL,400,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,1,1),(23,3,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','url_youtube','Youtube URL',NULL,500,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,1,1),(24,3,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','url_vimeo','Vimeo URL',NULL,600,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,1,1),(25,3,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','url_flickr','Flickr URL',NULL,700,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,1,1),(26,3,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','url_myspace','MySpace URL',NULL,800,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,1,1),(27,3,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','url_googleplus','Google+ URL',NULL,900,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,1,1),(28,3,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','url_twitter','Twitter URL',NULL,1000,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,1,1);
/*!40000 ALTER TABLE `profile_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_field_category`
--

DROP TABLE IF EXISTS `profile_field_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_field_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '100',
  `module_id` int(11) DEFAULT NULL,
  `visibility` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `translation_category` varchar(255) DEFAULT NULL,
  `is_system` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_field_category`
--

LOCK TABLES `profile_field_category` WRITE;
/*!40000 ALTER TABLE `profile_field_category` DISABLE KEYS */;
INSERT INTO `profile_field_category` VALUES (1,'General','',100,NULL,1,NULL,NULL,NULL,NULL,NULL,1),(2,'Communication','',200,NULL,1,NULL,NULL,NULL,NULL,NULL,1),(3,'Social bookmarks','',300,NULL,1,NULL,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `profile_field_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `job` blob NOT NULL,
  `created_at` int(11) NOT NULL,
  `timeout` int(11) NOT NULL DEFAULT '0',
  `started_at` int(11) DEFAULT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `channel` (`channel`),
  KEY `started_at` (`started_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reward`
--

DROP TABLE IF EXISTS `reward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reward` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `rewarded_date` date DEFAULT NULL,
  `session_id` int(11) NOT NULL,
  `rewarded_by` int(11) DEFAULT NULL,
  `rewardcol` varchar(45) DEFAULT NULL,
  `contentcontainer_id` int(11) DEFAULT NULL,
  `url` varchar(45) DEFAULT NULL,
  `token_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_reward_1_idx` (`session_id`),
  KEY `fk_reward_user_id_idx` (`user_id`),
  KEY `fk_reward_token_id_idx` (`token_id`),
  CONSTRAINT `fk_reward_session_id` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reward_token_id` FOREIGN KEY (`token_id`) REFERENCES `tokens` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reward_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reward`
--

LOCK TABLES `reward` WRITE;
/*!40000 ALTER TABLE `reward` DISABLE KEYS */;
/*!40000 ALTER TABLE `reward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` varchar(8) NOT NULL,
  `role_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(45) DEFAULT NULL,
  `session_name` varchar(50) DEFAULT NULL,
  `instructor_name` varchar(45) DEFAULT NULL,
  `start_day` date DEFAULT NULL,
  `end_day` date DEFAULT NULL,
  `start_time` varchar(50) DEFAULT NULL,
  `end_time` varchar(45) DEFAULT NULL,
  `contentcontainer_id` int(11) DEFAULT NULL,
  `url` varchar(45) DEFAULT NULL,
  `hf_url` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `guid_UNIQUE` (`guid`),
  UNIQUE KEY `hf_url_UNIQUE` (`hf_url`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` VALUES (1,'1','VR Session','Sai Shreya Nuguri','2018-08-10','2018-08-10','10:00:00','12:00:00',1,'https://mechanic-karl-65706.netlify.com/','hifi://vSocial/games');
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session_membership`
--

DROP TABLE IF EXISTS `session_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session_membership` (
  `session_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `originator_user_id` varchar(45) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `show_at_dashboard` tinyint(1) DEFAULT '1',
  `send_notifications` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`session_id`,`user_id`),
  KEY `fk_session_membership-user_id_idx` (`user_id`),
  CONSTRAINT `fk_session_membership-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_membership`
--

LOCK TABLES `session_membership` WRITE;
/*!40000 ALTER TABLE `session_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `session_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `value` text,
  `module_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unique-setting` (`name`,`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` VALUES (1,'oembedProviders','{\"vimeo.com\":\"http:\\/\\/vimeo.com\\/api\\/oembed.json?scheme=https&url=%url%&format=json&maxwidth=450\",\"youtube.com\":\"http:\\/\\/www.youtube.com\\/oembed?scheme=https&url=%url%&format=json&maxwidth=450\",\"youtu.be\":\"http:\\/\\/www.youtube.com\\/oembed?scheme=https&url=%url%&format=json&maxwidth=450\",\"soundcloud.com\":\"https:\\/\\/soundcloud.com\\/oembed?url=%url%&format=json&maxwidth=450\",\"slideshare.net\":\"https:\\/\\/www.slideshare.net\\/api\\/oembed\\/2?url=%url%&format=json&maxwidth=450\"}','base'),(2,'defaultVisibility','1','space'),(3,'defaultJoinPolicy','1','space'),(4,'colorDefault','#ededed','base'),(5,'colorPrimary','#708fa0','base'),(6,'colorInfo','#6fdbe8','base'),(7,'colorSuccess','#97d271','base'),(8,'colorWarning','#fdd198','base'),(9,'colorDanger','#ff8989','base'),(10,'name','OnTimeSocial','base'),(11,'baseUrl','http://128.206.119.44/humhub','base'),(12,'paginationSize','10','base'),(13,'displayNameFormat','{profile.firstname} {profile.lastname}','base'),(14,'auth.ldap.refreshUsers','1','user'),(15,'auth.needApproval','1','user'),(16,'auth.anonymousRegistration','1','user'),(17,'auth.internalUsersCanInvite','','user'),(18,'mailer.transportType','php','base'),(19,'mailer.systemEmailAddress','social@example.com','base'),(20,'mailer.systemEmailName','OnTimeSocial','base'),(21,'receive_email_activities','1','activity'),(22,'receive_email_notifications','2','notification'),(23,'maxFileSize','5242880','file'),(24,'maxPreviewImageWidth','200','file'),(25,'maxPreviewImageHeight','200','file'),(26,'hideImageFileInfo','0','file'),(27,'cache.class','yii\\caching\\FileCache','base'),(28,'cache.expireTime','3600','base'),(29,'installationId','bc911ba3ed76113e08a7366161c855c8','admin'),(30,'theme','HumHub','base'),(31,'spaceOrder','0','space'),(32,'enable','1','tour'),(33,'defaultLanguage','en-US','base'),(34,'enable_html5_desktop_notifications','0','notification'),(35,'useCase','intranet','base'),(36,'auth.allowGuestAccess','0','user'),(37,'enable','1','friendship'),(38,'shownDays','2','birthday'),(39,'sampleData','1','installer'),(40,'secret','fd0a60ab-6611-4058-8a8e-3fa0f1ec2d94','base'),(41,'timeZone','America/Chicago','base');
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `space`
--

DROP TABLE IF EXISTS `space`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `space` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(45) DEFAULT NULL,
  `wall_id` int(11) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `description` text,
  `join_policy` tinyint(4) DEFAULT NULL,
  `visibility` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `tags` text,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `ldap_dn` varchar(255) DEFAULT NULL,
  `auto_add_new_members` int(4) DEFAULT NULL,
  `contentcontainer_id` int(11) DEFAULT NULL,
  `default_content_visibility` tinyint(1) DEFAULT NULL,
  `color` varchar(7) DEFAULT NULL,
  `members_can_leave` int(11) DEFAULT '1',
  `url` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url-unique` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `space`
--

LOCK TABLES `space` WRITE;
/*!40000 ALTER TABLE `space` DISABLE KEYS */;
INSERT INTO `space` VALUES (1,'915c29e7-c0ce-4a2b-b24e-616b75feacb4',2,'Welcome Space','Your first sample space to discover the platform.',2,2,1,NULL,'2018-08-12 17:53:08',1,'2018-08-12 17:53:08',1,NULL,1,2,NULL,'#6fdbe8',1,'welcome-space');
/*!40000 ALTER TABLE `space` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `space_membership`
--

DROP TABLE IF EXISTS `space_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `space_membership` (
  `space_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `originator_user_id` varchar(45) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `request_message` text,
  `last_visit` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `group_id` varchar(255) DEFAULT 'member',
  `show_at_dashboard` tinyint(1) DEFAULT '1',
  `can_cancel_membership` int(11) DEFAULT '1',
  `send_notifications` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`space_id`,`user_id`),
  KEY `index_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `space_membership`
--

LOCK TABLES `space_membership` WRITE;
/*!40000 ALTER TABLE `space_membership` DISABLE KEYS */;
INSERT INTO `space_membership` VALUES (1,1,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,'admin',1,1,NULL),(1,2,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,'member',1,1,NULL),(1,3,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,'member',1,1,NULL);
/*!40000 ALTER TABLE `space_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `space_module`
--

DROP TABLE IF EXISTS `space_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `space_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` varchar(255) NOT NULL,
  `space_id` int(11) NOT NULL,
  `state` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `space_module`
--

LOCK TABLES `space_module` WRITE;
/*!40000 ALTER TABLE `space_module` DISABLE KEYS */;
INSERT INTO `space_module` VALUES (1,'cfiles',1,1),(2,'custom_pages',1,1),(3,'polls',1,1),(4,'tasks',1,1),(5,'wiki',1,1);
/*!40000 ALTER TABLE `space_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `deadline` datetime DEFAULT NULL,
  `max_users` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `percent` smallint(6) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_user`
--

DROP TABLE IF EXISTS `task_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_user`
--

LOCK TABLES `task_user` WRITE;
/*!40000 ALTER TABLE `task_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `tokens` int(11) DEFAULT NULL,
  `pass` int(11) DEFAULT NULL,
  `strike` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tokens_session_id_idx` (`session_id`),
  CONSTRAINT `fk_tokens_session_id` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_oembed`
--

DROP TABLE IF EXISTS `url_oembed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_oembed` (
  `url` varchar(255) NOT NULL,
  `preview` text NOT NULL,
  PRIMARY KEY (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_oembed`
--

LOCK TABLES `url_oembed` WRITE;
/*!40000 ALTER TABLE `url_oembed` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_oembed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(45) DEFAULT NULL,
  `wall_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `auth_mode` varchar(10) NOT NULL,
  `tags` text,
  `language` varchar(5) DEFAULT NULL,
  `last_activity_email` datetime NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `visibility` int(1) DEFAULT '1',
  `time_zone` varchar(100) DEFAULT NULL,
  `contentcontainer_id` int(11) DEFAULT NULL,
  `role_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_email` (`email`),
  UNIQUE KEY `unique_username` (`username`),
  UNIQUE KEY `unique_guid` (`guid`),
  UNIQUE KEY `unique_wall_id` (`wall_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'9f887f17-b7a1-44d9-9894-5e8968db021d',1,1,'saisn.67','saisn.67@gmail.com','local','Administration, Support, HumHub','','2018-08-12 17:53:08','2018-08-12 17:53:08',NULL,'2018-08-12 17:53:08',NULL,'2018-08-12 17:54:08',1,NULL,1,'Instructor'),(2,'8fbe58be-4fbc-4d0a-a945-e9b24d20c5c6',3,1,'david1986','david.roberts@example.com','local','Microsoft Office, Marketing, SEM, Digital Native','','2018-08-12 17:53:12','2018-08-12 17:53:12',1,'2018-08-12 17:53:12',1,NULL,1,NULL,3,NULL),(3,'4804a4fb-ff1e-4fac-b1a7-0c10cfaf1709',4,1,'sara1989','sara.schuster@example.com','local','Yoga, Travel, English, German, French','','2018-08-12 17:53:12','2018-08-12 17:53:12',1,'2018-08-12 17:53:12',1,NULL,1,NULL,4,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_auth`
--

DROP TABLE IF EXISTS `user_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `source` varchar(255) NOT NULL,
  `source_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_id` (`user_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_auth`
--

LOCK TABLES `user_auth` WRITE;
/*!40000 ALTER TABLE `user_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_follow`
--

DROP TABLE IF EXISTS `user_follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_model` varchar(100) NOT NULL,
  `object_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `send_notifications` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `index_user` (`user_id`),
  KEY `index_object` (`object_model`,`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_follow`
--

LOCK TABLES `user_follow` WRITE;
/*!40000 ALTER TABLE `user_follow` DISABLE KEYS */;
INSERT INTO `user_follow` VALUES (1,'humhub\\modules\\post\\models\\Post',1,1,1),(2,'humhub\\modules\\post\\models\\Post',2,1,1),(3,'humhub\\modules\\post\\models\\Post',2,2,1),(4,'humhub\\modules\\post\\models\\Post',2,3,1),(5,'humhub\\modules\\polls\\models\\Poll',1,1,1),(6,'humhub\\modules\\polls\\models\\Poll',1,2,1),(7,'humhub\\modules\\polls\\models\\Poll',1,3,1);
/*!40000 ALTER TABLE `user_follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_friendship`
--

DROP TABLE IF EXISTS `user_friendship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_friendship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `friend_user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx-friends` (`user_id`,`friend_user_id`),
  KEY `fk-friend` (`friend_user_id`),
  CONSTRAINT `fk-friend` FOREIGN KEY (`friend_user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk-user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_friendship`
--

LOCK TABLES `user_friendship` WRITE;
/*!40000 ALTER TABLE `user_friendship` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_friendship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_http_session`
--

DROP TABLE IF EXISTS `user_http_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_http_session` (
  `id` char(255) NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `data` longblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_http_session`
--

LOCK TABLES `user_http_session` WRITE;
/*!40000 ALTER TABLE `user_http_session` DISABLE KEYS */;
INSERT INTO `user_http_session` VALUES ('l5nrcprirga2gko3g2n89vjhe5',1534117798,1,_binary '__flash|a:0:{}__returnUrl|s:17:\"/humhub/index.php\";__id|i:1;currentAuthClientId|s:5:\"local\";__expire|i:1534117758;user.canSeeAdminSection|b:1;live.poll.lastQueryTime|i:1534116358;');
/*!40000 ALTER TABLE `user_http_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_invite`
--

DROP TABLE IF EXISTS `user_invite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_invite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_originator_id` int(11) DEFAULT NULL,
  `space_invite_id` int(11) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `source` varchar(45) DEFAULT NULL,
  `token` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_email` (`email`),
  UNIQUE KEY `unique_token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_invite`
--

LOCK TABLES `user_invite` WRITE;
/*!40000 ALTER TABLE `user_invite` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_invite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_mentioning`
--

DROP TABLE IF EXISTS `user_mentioning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_mentioning` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_model` varchar(100) NOT NULL,
  `object_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `i_user` (`user_id`),
  KEY `i_object` (`object_model`,`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_mentioning`
--

LOCK TABLES `user_mentioning` WRITE;
/*!40000 ALTER TABLE `user_mentioning` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_mentioning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_message`
--

DROP TABLE IF EXISTS `user_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_message` (
  `message_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_originator` tinyint(4) DEFAULT NULL,
  `last_viewed` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`message_id`,`user_id`),
  KEY `index_last_viewed` (`last_viewed`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_message`
--

LOCK TABLES `user_message` WRITE;
/*!40000 ALTER TABLE `user_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_module`
--

DROP TABLE IF EXISTS `user_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `state` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_user_module` (`user_id`,`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_module`
--

LOCK TABLES `user_module` WRITE;
/*!40000 ALTER TABLE `user_module` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_password`
--

DROP TABLE IF EXISTS `user_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_password` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `algorithm` varchar(20) DEFAULT NULL,
  `password` text,
  `salt` text,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_password`
--

LOCK TABLES `user_password` WRITE;
/*!40000 ALTER TABLE `user_password` DISABLE KEYS */;
INSERT INTO `user_password` VALUES (1,1,'sha512whirlpool','0e122e86b8db90e9497682a805ce9dca608e21157518c6dd2de34010987e8145afdaaa216fe39aff8a814abd13620ea366622b6fb453c728b0520a098acfb8b5','1a1b3fde-494d-458a-9c9b-d9bc1a2d928b','2018-08-12 17:53:08');
/*!40000 ALTER TABLE `user_password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wall`
--

DROP TABLE IF EXISTS `wall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_model` varchar(50) NOT NULL,
  `object_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wall`
--

LOCK TABLES `wall` WRITE;
/*!40000 ALTER TABLE `wall` DISABLE KEYS */;
INSERT INTO `wall` VALUES (1,'humhub\\modules\\user\\models\\User',1,NULL,NULL,NULL,NULL),(2,'humhub\\modules\\space\\models\\Space',1,NULL,NULL,NULL,NULL),(3,'humhub\\modules\\user\\models\\User',2,NULL,NULL,NULL,NULL),(4,'humhub\\modules\\user\\models\\User',3,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `wall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wall_entry`
--

DROP TABLE IF EXISTS `wall_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wall_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wall_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wall_entry`
--

LOCK TABLES `wall_entry` WRITE;
/*!40000 ALTER TABLE `wall_entry` DISABLE KEYS */;
INSERT INTO `wall_entry` VALUES (1,2,1,'2018-08-12 17:53:08',1,'2018-08-12 17:53:08',1),(2,2,3,'2018-08-12 17:53:09',1,'2018-08-12 17:53:09',1),(3,2,2,'2018-08-12 17:53:09',1,'2018-08-12 17:53:09',1),(4,2,4,'2018-08-12 17:53:12',1,'2018-08-12 17:53:12',1),(5,2,5,'2018-08-12 17:53:12',1,'2018-08-12 17:53:12',1),(6,2,7,'2018-08-12 17:53:13',1,'2018-08-12 17:53:13',1),(7,2,6,'2018-08-12 17:53:13',1,'2018-08-12 17:53:14',3),(8,2,8,'2018-08-12 17:53:13',2,'2018-08-12 17:53:13',2),(9,2,9,'2018-08-12 17:53:13',3,'2018-08-12 17:53:13',3),(10,2,10,'2018-08-12 17:53:14',3,'2018-08-12 17:53:14',3),(11,2,11,'2018-08-12 17:53:14',3,'2018-08-12 17:53:14',3),(12,2,13,'2018-08-12 17:53:14',1,'2018-08-12 17:53:14',1),(13,2,12,'2018-08-12 17:53:14',1,'2018-08-12 17:53:15',3),(14,2,14,'2018-08-12 17:53:14',2,'2018-08-12 17:53:14',2),(15,2,15,'2018-08-12 17:53:14',2,'2018-08-12 17:53:14',2),(16,2,16,'2018-08-12 17:53:15',3,'2018-08-12 17:53:15',3),(17,2,17,'2018-08-12 17:53:15',3,'2018-08-12 17:53:15',3);
/*!40000 ALTER TABLE `wall_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_page`
--

DROP TABLE IF EXISTS `wiki_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `is_home` tinyint(4) NOT NULL DEFAULT '0',
  `admin_only` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_page`
--

LOCK TABLES `wiki_page` WRITE;
/*!40000 ALTER TABLE `wiki_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_page_revision`
--

DROP TABLE IF EXISTS `wiki_page_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_page_revision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `revision` int(11) NOT NULL,
  `is_latest` tinyint(1) NOT NULL DEFAULT '0',
  `wiki_page_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_page_revision`
--

LOCK TABLES `wiki_page_revision` WRITE;
/*!40000 ALTER TABLE `wiki_page_revision` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_page_revision` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-13 11:33:12
