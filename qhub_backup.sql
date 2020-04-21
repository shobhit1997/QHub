-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: QHub
-- ------------------------------------------------------
-- Server version	5.7.29-0ubuntu0.18.04.1

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
-- Table structure for table `assignments`
--

DROP TABLE IF EXISTS `assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assignment_no` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `type` enum('automatic','manual') NOT NULL,
  `branch` varchar(20) NOT NULL,
  `year` int(11) NOT NULL,
  `section` int(11) DEFAULT NULL,
  `question_count` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `last_date_of_submission` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `unit_id` (`unit_id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `assignments_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`),
  CONSTRAINT `assignments_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `faculties` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignments`
--

LOCK TABLES `assignments` WRITE;
/*!40000 ALTER TABLE `assignments` DISABLE KEYS */;
INSERT INTO `assignments` VALUES (11,1,1,'automatic','CSE',2,2,2,2,'2020-01-01 10:10:10'),(12,2,2,'manual','CSE',2,2,6,2,'2020-01-01 10:10:10'),(13,2,2,'manual','CSE',2,2,2,2,'2020-01-01 10:10:10');
/*!40000 ALTER TABLE `assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_tokens`
--

DROP TABLE IF EXISTS `auth_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_tokens` (
  `username` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `faculty_id` int(11) DEFAULT NULL,
  KEY `faculty_id` (`faculty_id`),
  CONSTRAINT `auth_tokens_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `faculties` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_tokens`
--

LOCK TABLES `auth_tokens` WRITE;
/*!40000 ALTER TABLE `auth_tokens` DISABLE KEYS */;
INSERT INTO `auth_tokens` VALUES ('ncs','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6Im5jcyIsImlkIjoxLCJpYXQiOjE1ODczNjIxNDd9.F8YQFC6KfiI62eN9MnUyIrU7-EEnBnevmoGDOx-rHCU',1),('ncs','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6Im5jcyIsImlkIjoxLCJpYXQiOjE1ODczNjI0MDh9.vs90m8xAAr2bVDRQOwnqJVFZnhOKbw1mYuypHTBjElk',1),('ncs','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6Im5jcyIsImlkIjoxLCJpYXQiOjE1ODczNjI5NjR9._pvFeTMRo9_zBJv4UAAalg698VLi4aec6Sb5NhDczIA',1),('ncs','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6Im5jcyIsImlkIjoxLCJpYXQiOjE1ODczNjI5OTR9.T76bEBwfHSn-grnLqTXqnMY-3Ufl5L5-lrJlb9Fsl7E',1),('16it028','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IjE2aXQwMjgiLCJmYWN1bHR5X2lkIjoyLCJpYXQiOjE1ODczNzM4MTF9.HzsZ3VG7SnH0yLAaVqc03vaEm49zabs3eWFezbvO8q4',2),('16it028','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IjE2aXQwMjgiLCJmYWN1bHR5X2lkIjoyLCJpYXQiOjE1ODczNzM4ODV9.7BT8EYgMeGYOSXrtHohv5S6dkcI-V_SPyLTDWKgrR4s',2),('16it028','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IjE2aXQwMjgiLCJmYWN1bHR5X2lkIjoyLCJpYXQiOjE1ODczNzM5ODV9.be7jnyHydeCzAZtfYL1nzbFP6jI_dfcyCBviVaPyPIM',2),('16it028','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IjE2aXQwMjgiLCJpZCI6MiwiaWF0IjoxNTg3Mzc3MDU4fQ.PAVLkD5mD4r4MUI2Sxb6EiYQiVt1oThqhLlXAPw6tXU',2),('16it028','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IjE2aXQwMjgiLCJpZCI6MiwiaWF0IjoxNTg3NDg5NzcwfQ.2_RoWrZOmAAW754VWQYkdUcdVYbMCbJSAoqoA5_gjJE',2);
/*!40000 ALTER TABLE `auth_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_outcomes`
--

DROP TABLE IF EXISTS `course_outcomes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_outcomes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) DEFAULT NULL,
  `outcome` varchar(100) DEFAULT NULL,
  `subject_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `course_outcomes_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_outcomes`
--

LOCK TABLES `course_outcomes` WRITE;
/*!40000 ALTER TABLE `course_outcomes` DISABLE KEYS */;
INSERT INTO `course_outcomes` VALUES (1,'C216.1','Understand the structure and functions of OS',1),(2,'C216.2','Learn about Processes, Threads and Scheduling algorithms',1),(3,'C216.3','Understand the principles of concurrency and Deadlocks',1),(4,'C216.4','Learn various memory management scheme',1),(5,'C216.5','Study I/O management and File systems.',1);
/*!40000 ALTER TABLE `course_outcomes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculties`
--

DROP TABLE IF EXISTS `faculties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faculties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `info_token` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculties`
--

LOCK TABLES `faculties` WRITE;
/*!40000 ALTER TABLE `faculties` DISABLE KEYS */;
INSERT INTO `faculties` VALUES (1,'Nibble Computer Society','ncs',NULL,'club','ab504a28ef8490f183fa3bed6f402730a1113deb'),(2,'Shobhit Agarwal','16it028','shobhitagarwal756@gmail.com','club','9c674b4cdc038575da6d3817638e31384f1d1ba4');
/*!40000 ALTER TABLE `faculties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_mapping`
--

DROP TABLE IF EXISTS `question_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_paper_id` int(11) DEFAULT NULL,
  `question_id` int(11) NOT NULL,
  `type` enum('assignment','question-paper') NOT NULL,
  `assignment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`),
  KEY `question_paper_id` (`question_paper_id`),
  KEY `assignment_id` (`assignment_id`),
  CONSTRAINT `question_mapping_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`),
  CONSTRAINT `question_mapping_ibfk_2` FOREIGN KEY (`question_paper_id`) REFERENCES `question_papers` (`id`),
  CONSTRAINT `question_mapping_ibfk_3` FOREIGN KEY (`assignment_id`) REFERENCES `assignments` (`id`),
  CONSTRAINT `question_mapping_ibfk_4` FOREIGN KEY (`question_paper_id`) REFERENCES `question_papers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_mapping`
--

LOCK TABLES `question_mapping` WRITE;
/*!40000 ALTER TABLE `question_mapping` DISABLE KEYS */;
INSERT INTO `question_mapping` VALUES (5,NULL,3,'assignment',11),(6,NULL,5,'assignment',11);
/*!40000 ALTER TABLE `question_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_paper_sections`
--

DROP TABLE IF EXISTS `question_paper_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_paper_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_paper_id` int(11) NOT NULL,
  `questions_count` int(11) NOT NULL,
  `max_marks` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_paper_id` (`question_paper_id`),
  CONSTRAINT `question_paper_sections_ibfk_1` FOREIGN KEY (`question_paper_id`) REFERENCES `question_papers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_paper_sections`
--

LOCK TABLES `question_paper_sections` WRITE;
/*!40000 ALTER TABLE `question_paper_sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_paper_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_paper_units`
--

DROP TABLE IF EXISTS `question_paper_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_paper_units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_paper_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_paper_id` (`question_paper_id`),
  KEY `unit_id` (`unit_id`),
  CONSTRAINT `question_paper_units_ibfk_1` FOREIGN KEY (`question_paper_id`) REFERENCES `question_papers` (`id`),
  CONSTRAINT `question_paper_units_ibfk_2` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_paper_units`
--

LOCK TABLES `question_paper_units` WRITE;
/*!40000 ALTER TABLE `question_paper_units` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_paper_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_papers`
--

DROP TABLE IF EXISTS `question_papers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_papers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam` enum('cia-1','cia-2','cia-3') NOT NULL,
  `type` enum('automatic','manual') NOT NULL,
  `branch` varchar(20) NOT NULL,
  `year` int(11) NOT NULL,
  `section` int(11) NOT NULL,
  `question_count` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `question_papers_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `faculties` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_papers`
--

LOCK TABLES `question_papers` WRITE;
/*!40000 ALTER TABLE `question_papers` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_papers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `cognitive_level` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `max_marks` int(11) NOT NULL,
  `min_marks` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `unit_id` (`unit_id`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'What is Stack?',1,1,'test',4,2),(2,'What is DBMS?',1,3,'test',4,2),(3,'What is Queue?',1,1,'http://shobhitagarwal.me/static/img/shobhit.b138c6d.png',4,2),(4,'What is Tree?',1,1,'test',4,2),(5,'What is Binary Tree?',1,1,'http://shobhitagarwal.me/static/img/shobhit.b138c6d.png',4,2),(6,'What is DQueue?',1,2,'test',4,2);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `subject_code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subject_code` (`subject_code`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'DS','RCS301'),(8,'Database','RCS302');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `unit_no` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `cognitive_level` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `units_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` VALUES (1,'Linear DS 1',1,1,1),(2,'Queues',2,1,2),(3,'SQL',1,8,1);
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-21 23:09:17
