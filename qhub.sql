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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignments`
--

LOCK TABLES `assignments` WRITE;
/*!40000 ALTER TABLE `assignments` DISABLE KEYS */;
INSERT INTO `assignments` VALUES (11,1,1,'automatic','CSE',2,2,2,1,'2020-01-01 10:10:10'),(12,2,2,'manual','CSE',2,2,6,2,'2020-01-01 10:10:10'),(13,2,2,'manual','CSE',2,2,2,2,'2020-01-01 10:10:10'),(14,2,5,'automatic','CSE',2,2,4,1,'2020-04-25 10:10:10'),(15,3,5,'automatic','CSE',2,2,4,1,'2020-04-25 10:10:10'),(16,2,2,'manual','CSE',2,2,2,2,'2020-05-10 10:10:10');
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
-- Table structure for table `c_outcome_k_level_mapping`
--

DROP TABLE IF EXISTS `c_outcome_k_level_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_outcome_k_level_mapping` (
  `outcome_id` int(11) NOT NULL,
  `k_id` int(11) NOT NULL,
  KEY `outcome_id` (`outcome_id`),
  KEY `k_id` (`k_id`),
  CONSTRAINT `c_outcome_k_level_mapping_ibfk_1` FOREIGN KEY (`outcome_id`) REFERENCES `course_outcomes` (`id`),
  CONSTRAINT `c_outcome_k_level_mapping_ibfk_2` FOREIGN KEY (`k_id`) REFERENCES `knowledge_levels` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_outcome_k_level_mapping`
--

LOCK TABLES `c_outcome_k_level_mapping` WRITE;
/*!40000 ALTER TABLE `c_outcome_k_level_mapping` DISABLE KEYS */;
INSERT INTO `c_outcome_k_level_mapping` VALUES (41,1),(41,2),(42,1),(42,2),(43,2),(44,2),(45,2),(45,4);
/*!40000 ALTER TABLE `c_outcome_k_level_mapping` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_outcomes`
--

LOCK TABLES `course_outcomes` WRITE;
/*!40000 ALTER TABLE `course_outcomes` DISABLE KEYS */;
INSERT INTO `course_outcomes` VALUES (1,'C216.1','Understand the structure and functions of OS',1),(2,'C216.2','Learn about Processes, Threads and Scheduling algorithms',1),(3,'C216.3','Understand the principles of concurrency and Deadlocks',1),(4,'C216.4','Learn various memory management scheme',1),(5,'C216.5','Study I/O management and File systems.',1),(41,'C216.1','Understand the structure and functions of OS',9),(42,'C216.2','Learn about Processes, Threads and Scheduling algorithms',9),(43,'C216.3','Understand the principles of concurrency and Deadlocks',9),(44,'C216.4','Learn various memory management scheme',9),(45,'C216.5','Study I/O management and File systems.',9);
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
  `info_profile_id` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculties`
--

LOCK TABLES `faculties` WRITE;
/*!40000 ALTER TABLE `faculties` DISABLE KEYS */;
INSERT INTO `faculties` VALUES (1,'Nibble Computer Society','ncs',NULL,'club','ab504a28ef8490f183fa3bed6f402730a1113deb','482'),(2,'Shobhit Agarwal','16it028','shobhitagarwal756@gmail.com','club','9c674b4cdc038575da6d3817638e31384f1d1ba4','14623');
/*!40000 ALTER TABLE `faculties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `faculty_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `faculty_id` (`faculty_id`),
  CONSTRAINT `images_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `faculties` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,'https://storage.googleapis.com/qhub_assignments/1587642278781shobhit.b138c6d.png',2),(2,'https://storage.googleapis.com/qhub_assignments/1587723383137q1.png',1);
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `knowledge_levels`
--

DROP TABLE IF EXISTS `knowledge_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `knowledge_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `code` varchar(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `knowledge_levels`
--

LOCK TABLES `knowledge_levels` WRITE;
/*!40000 ALTER TABLE `knowledge_levels` DISABLE KEYS */;
INSERT INTO `knowledge_levels` VALUES (1,'Remember','K1'),(2,'Understand','K2'),(3,'Apply','K3'),(4,'Analyze','K4'),(5,'Evaluate','K5'),(6,'Create','K6');
/*!40000 ALTER TABLE `knowledge_levels` ENABLE KEYS */;
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
  `section_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`),
  KEY `question_paper_id` (`question_paper_id`),
  KEY `assignment_id` (`assignment_id`),
  KEY `section_id` (`section_id`),
  CONSTRAINT `question_mapping_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`),
  CONSTRAINT `question_mapping_ibfk_2` FOREIGN KEY (`question_paper_id`) REFERENCES `question_papers` (`id`),
  CONSTRAINT `question_mapping_ibfk_3` FOREIGN KEY (`assignment_id`) REFERENCES `assignments` (`id`),
  CONSTRAINT `question_mapping_ibfk_4` FOREIGN KEY (`question_paper_id`) REFERENCES `question_papers` (`id`),
  CONSTRAINT `question_mapping_ibfk_5` FOREIGN KEY (`section_id`) REFERENCES `question_paper_sections` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_mapping`
--

LOCK TABLES `question_mapping` WRITE;
/*!40000 ALTER TABLE `question_mapping` DISABLE KEYS */;
INSERT INTO `question_mapping` VALUES (5,NULL,3,'assignment',11,NULL),(6,NULL,5,'assignment',11,NULL),(14,NULL,9,'assignment',14,NULL),(15,NULL,8,'assignment',14,NULL),(16,NULL,7,'assignment',14,NULL),(17,NULL,10,'assignment',14,NULL),(18,NULL,8,'assignment',15,NULL),(19,NULL,9,'assignment',15,NULL),(20,NULL,10,'assignment',15,NULL),(21,NULL,7,'assignment',15,NULL),(31,NULL,3,'question-paper',NULL,187),(32,NULL,5,'question-paper',NULL,187),(33,NULL,10,'question-paper',NULL,188),(34,NULL,6,'question-paper',NULL,188),(35,NULL,7,'question-paper',NULL,188),(36,NULL,13,'question-paper',NULL,189),(37,NULL,4,'question-paper',NULL,189),(38,NULL,14,'question-paper',NULL,189),(39,NULL,12,'question-paper',NULL,189),(40,NULL,5,'question-paper',NULL,193),(41,NULL,6,'question-paper',NULL,193),(42,NULL,5,'question-paper',NULL,193),(43,NULL,6,'question-paper',NULL,193);
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
  `type` enum('optional','compulsary') NOT NULL,
  `compulsary_questions` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_paper_id` (`question_paper_id`),
  CONSTRAINT `question_paper_sections_ibfk_1` FOREIGN KEY (`question_paper_id`) REFERENCES `question_papers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_paper_sections`
--

LOCK TABLES `question_paper_sections` WRITE;
/*!40000 ALTER TABLE `question_paper_sections` DISABLE KEYS */;
INSERT INTO `question_paper_sections` VALUES (187,66,2,4,'compulsary',2),(188,66,3,8,'optional',2),(189,66,4,18,'optional',3),(190,67,2,4,'compulsary',2),(191,67,3,8,'optional',2),(192,67,4,18,'optional',3),(193,69,2,4,'compulsary',2),(194,69,3,8,'optional',2),(195,69,4,18,'optional',3);
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
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_paper_units`
--

LOCK TABLES `question_paper_units` WRITE;
/*!40000 ALTER TABLE `question_paper_units` DISABLE KEYS */;
INSERT INTO `question_paper_units` VALUES (125,66,5),(126,66,6),(127,67,5),(128,67,6),(129,69,5),(130,69,6);
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
  `created_by` int(11) NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `date_of_exam` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `question_papers_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `faculties` (`id`),
  CONSTRAINT `question_papers_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_papers`
--

LOCK TABLES `question_papers` WRITE;
/*!40000 ALTER TABLE `question_papers` DISABLE KEYS */;
INSERT INTO `question_papers` VALUES (66,'cia-1','automatic','CSE',2,2,9,'2020-05-10 10:10:10'),(67,'cia-2','manual','CSE',2,2,NULL,NULL),(69,'cia-2','manual','CSE',2,2,9,'2020-05-11 10:10:10');
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
  `knowledge_level` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `max_marks` int(11) NOT NULL,
  `min_marks` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `unit_id` (`unit_id`),
  KEY `knowledge_level` (`knowledge_level`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`),
  CONSTRAINT `questions_ibfk_2` FOREIGN KEY (`knowledge_level`) REFERENCES `knowledge_levels` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'What is Stack?',1,5,NULL,2,1),(2,'What is DBMS?',1,6,NULL,2,1),(3,'What is Queue?',1,5,'http://shobhitagarwal.me/static/img/shobhit.b138c6d.png',2,1),(4,'What is Tree?',1,5,NULL,6,5),(5,'What is Binary Tree?',1,6,'http://shobhitagarwal.me/static/img/shobhit.b138c6d.png',2,1),(6,'What is DQueue?',1,5,NULL,4,3),(7,'Show how SEMPHORES can be used to achieve the precedence of the following graph? Answer the following questions:-\n(a)\nAt least how many Semaphores will be required? Give\nJustification for your answer.\n(b)\nWhat will be the initial Count of each semaphore?\n(c)\nWhat will be the advantage of using “Counting Semaphores”\nrather than “Binary Semaphores”?\n(d)\nCan “Condition” variables be used to provide the same solution?',2,6,'https://storage.googleapis.com/qhub_assignments/1587723383137q1.png',4,3),(8,'Write a solution for “Sleeping Barber” Problem, using Monitor.',2,5,NULL,4,3),(9,'Show how Lamport’s “Bakery Algorithm” meets all the three requirements of a satisfactory Critical Section Solution.',2,6,NULL,4,3),(10,'Is it possible to have a solution for Dijkstra’s “Dining Philosophers” Problem,that ensures, under all possible conditions:-\n(a)That no philosopher ever faces condition of “Starvation”\nAND\n(b)The solution meets the requirement of “Progress”\n',2,5,NULL,4,3),(11,'With reference to the following set of Processes/Jobs, determine Average Waiting Time & Average Turnaround Time, using following scheduling algorithms',2,6,NULL,4,3),(12,'With reference to the following set of Processes/Jobs, determine Average Waiting Time & Average Turnaround Time, using following scheduling algorithms',2,6,NULL,6,5),(13,'Suppose a system is using SJF algorithm for CPU scheduling and it predicts next CPU burst using exponential average of the previous CPU bursts. If the first prediction of CPU burst T 0 = 20 ms, weight factor  = 0.6, and the previous CPU burst are 08, 16, 24, 16 ms in that sequence. Predict the next CPU burst.',2,5,NULL,6,5),(14,'For the following snap-shots of processes, use bankers algorithm to determine:- (a) Need Matrix? (b) Whether the system is in a safe state? (c) What is safe sequence?',2,6,NULL,6,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'DS','RCS301'),(8,'Database','RCS302'),(9,'Operating System','RCS-401');
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
  `name` varchar(255) DEFAULT NULL,
  `unit_no` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `outcome_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subject_id` (`subject_id`),
  KEY `outcome_id` (`outcome_id`),
  CONSTRAINT `units_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
  CONSTRAINT `units_ibfk_2` FOREIGN KEY (`outcome_id`) REFERENCES `course_outcomes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` VALUES (1,'Linear DS 1',1,1,1),(2,'Queues',2,1,2),(3,'SQL',1,8,1),(4,'Introduction',1,9,41),(5,'Concurrent Processes',2,9,42),(6,'CPU Scheduling',3,9,43),(7,'Memory Management',4,9,44),(8,'I/O Management and Disk Scheduling',5,9,45);
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

-- Dump completed on 2020-05-01 18:08:42
