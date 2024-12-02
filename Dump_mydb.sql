-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `id` int NOT NULL,
  `fullname` varchar(45) DEFAULT NULL,
  `organization` varchar(45) DEFAULT NULL,
  `org_podrazdelenie` varchar(45) DEFAULT NULL,
  `doljnost` varchar(45) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'Андрианова Анастасия Александровна','Казанский федеральный университет','Кафедра САИТ','доцент','женский'),(2,'Латыпов Рустам Хафизович','Казанский федеральный университет','Кафедра САИТ','заведующий кафедрой','мужской'),(3,'Асхатов Радик Мухаметгалеевич','Казанский федеральный университет','Кафедра ПМИИ','доцент','мужской'),(4,'Рунг Елена Владимировна','Казанский федеральный университет','Кафедра ПМИИ','доцент','женский'),(5,'Хайруллина Лилия Эмитовна','Казанский федеральный университет','Кафедра ИС','доцент','женский'),(6,'Морозов Александр Васильевич','Астраханский государственный университет','Кафедра АСОИУ','доцент','мужской'),(7,'Мартьянова Александра Евгеньевна','Астраханский государственный университет','Кафедра физики','доцент','женский'),(8,'Михайлов Валерий Юрьевич','Казанский федеральный университет','Кафедра САИТ','доцент','мужской'),(9,'Лаптев Валерий Викторович','Астраханский государственный университет','Кафедра АСОИУ','доцент','мужской');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `fullname_author` BEFORE INSERT ON `author` FOR EACH ROW BEGIN
DECLARE firstname varchar(20);
DECLARE middlename varchar(20);
DECLARE lastname varchar(20);
SET lastname = SUBSTRING_INDEX(new.fullname,' ', 1);
SET firstname = SUBSTRING_INDEX(SUBSTRING_INDEX(new.fullname, ' ', 2),' ', -1);
SET middlename = SUBSTRING_INDEX(new.fullname,' ', -1);
SET new.fullname = IF (STRCMP(firstname, middlename)=0,  CONCAT( UPPER( LEFT( lastname, 1)) , LOWER ( SUBSTRING(lastname, 2)), ' ', UPPER( LEFT( firstname, 1)) , LOWER ( SUBSTRING(firstname, 2))), CONCAT( UPPER( LEFT( lastname, 1)) , LOWER ( SUBSTRING(lastname, 2)), ' ', UPPER( LEFT( firstname, 1)) , LOWER ( SUBSTRING(firstname, 2)), ' ', UPPER( LEFT( middlename, 1)) , LOWER ( SUBSTRING(middlename, 2))));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `book_author`
--

DROP TABLE IF EXISTS `book_author`;
/*!50001 DROP VIEW IF EXISTS `book_author`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `book_author` AS SELECT 
 1 AS `book`,
 1 AS `authors`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `journal`
--

DROP TABLE IF EXISTS `journal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `journal` (
  `id` int NOT NULL,
  `nazvanie` varchar(45) DEFAULT NULL,
  `izdatelstvo` varchar(45) DEFAULT NULL,
  `amount_quotation` int DEFAULT NULL,
  `vak` int DEFAULT NULL,
  `scopus` int DEFAULT NULL,
  `rubrika_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_journal_rubrika1_idx` (`rubrika_id`),
  CONSTRAINT `fk_journal_rubrika1` FOREIGN KEY (`rubrika_id`) REFERENCES `rubrika` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal`
--

LOCK TABLES `journal` WRITE;
/*!40000 ALTER TABLE `journal` DISABLE KEYS */;
INSERT INTO `journal` VALUES (1,'Вестник АГТУ','ФГБОУ ВО \"АГТУ\"',15,1,0,1),(2,'Сибирский педагогический журнал','ФГБОУ ВПО \"НГПУ\"',0,1,0,3),(3,'Вестник Самарского университета','Самарский университет',5,1,0,2),(4,'Казанский педагогический журнал ','ФГБНУ \"ИППСП\"',1,1,0,3),(5,'Ученые записки Казанского университета','ФГАОУ ВО \"КФУ\"',15,1,1,2),(6,'Известия высших учебных заведений. Математика','ФГАОУ ВО \"КФУ\"',10,1,1,1),(7,'Journal of Physics: Conference Series','Institute of Physics Publishing',4,0,1,2);
/*!40000 ALTER TABLE `journal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `kpfu`
--

DROP TABLE IF EXISTS `kpfu`;
/*!50001 DROP VIEW IF EXISTS `kpfu`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `kpfu` AS SELECT 
 1 AS `author`,
 1 AS `department`,
 1 AS `kolvo`,
 1 AS `sum_quotation`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `period`
--

DROP TABLE IF EXISTS `period`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `period` (
  `id` int NOT NULL,
  `nachalo_perioda` date DEFAULT NULL,
  `konec_perioda` date DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `journal_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_period_journal1_idx` (`journal_id`),
  CONSTRAINT `fk_period_journal1` FOREIGN KEY (`journal_id`) REFERENCES `journal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `period`
--

LOCK TABLES `period` WRITE;
/*!40000 ALTER TABLE `period` DISABLE KEYS */;
INSERT INTO `period` VALUES (1,'2007-10-10','2022-10-12','1',1);
/*!40000 ALTER TABLE `period` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication`
--

DROP TABLE IF EXISTS `publication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication` (
  `id` int NOT NULL,
  `naimenovanie` varchar(45) DEFAULT NULL,
  `tematika` varchar(45) DEFAULT NULL,
  `publication_date` date DEFAULT NULL,
  `quotation` int DEFAULT NULL,
  `publication_type_id` int NOT NULL,
  `journal_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_publication_publication_type_idx` (`publication_type_id`),
  KEY `fk_publication_journal1_idx` (`journal_id`),
  CONSTRAINT `fk_publication_journal1` FOREIGN KEY (`journal_id`) REFERENCES `journal` (`id`),
  CONSTRAINT `fk_publication_publication_type` FOREIGN KEY (`publication_type_id`) REFERENCES `publication_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication`
--

LOCK TABLES `publication` WRITE;
/*!40000 ALTER TABLE `publication` DISABLE KEYS */;
INSERT INTO `publication` VALUES (1,'Решение задачи матфизики','Электротехника','2019-11-21',3,1,1),(2,'Обратная связь в обучающей среде ','Электротехника','2011-09-20',0,1,1),(3,'Генерация вариантов задания для лабработ','Электротехника','2009-12-07',12,1,1),(4,'Impact of packing fraction','Математика','2017-07-10',0,1,7),(5,'Comparative analysis of optimization models','Математика','2019-04-05',0,1,7),(6,'Вопросы качества проектирования решений','Педагогические науки','2014-11-11',1,1,4),(7,'Управление процессом минимизации ','Электротехника','2002-08-27',3,1,6),(8,'Сингулярное интегродифференциальное уравнение','Математика','2013-04-11',3,1,3),(9,'Идентификация состояния сложного объекта ','Математика','2020-10-04',0,1,3),(10,'Модуль синтеза математической модели','Электротехника','2018-03-23',2,1,3),(11,'Simulation of electron motion','Математика','2018-04-10',4,1,7),(12,'Решение основных краевых задач','Математика','2013-10-15',4,1,5),(13,'Модели задачи негильотинного размещения ','Математический анализ','2012-12-08',4,1,5),(14,'Исследование неявной разностной схемы','Математический анализ','2012-09-17',1,1,5),(15,'Применение метода сумматорных тождеств ','Математика','2015-12-03',6,1,5),(16,'Алгебра пространства','Математика','2018-03-22',7,1,6);
/*!40000 ALTER TABLE `publication` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `publ_qotation_in` BEFORE INSERT ON `publication` FOR EACH ROW BEGIN
IF (new.quotation < 0) THEN
SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning: quotation < 0!';
END IF;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sum_quot_afterinsert` AFTER INSERT ON `publication` FOR EACH ROW BEGIN
UPDATE journal SET journal.amount_quotation = journal.amount_quotation + new.quotation
WHERE journal.id = new.journal_id;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `publ_qotation_up` BEFORE UPDATE ON `publication` FOR EACH ROW BEGIN
    IF (new.quotation < 0) THEN 
        SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning: quotation < 0!';
    END IF;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sum_quot_afterupdate` AFTER UPDATE ON `publication` FOR EACH ROW BEGIN
UPDATE journal SET journal.amount_quotation = journal.amount_quotation - old.quotation + new.quotation
WHERE journal.id = new.journal_id;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sum_quot_afterdelete` AFTER DELETE ON `publication` FOR EACH ROW BEGIN
UPDATE journal SET journal.amount_quotation = journal.amount_quotation - old.quotation
WHERE journal.id = old.journal_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `publication_has_author`
--

DROP TABLE IF EXISTS `publication_has_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication_has_author` (
  `publication_id` int NOT NULL,
  `author_id` int NOT NULL,
  PRIMARY KEY (`publication_id`,`author_id`),
  KEY `fk_publication_has_author_author1_idx` (`author_id`),
  KEY `fk_publication_has_author_publication1_idx` (`publication_id`),
  CONSTRAINT `fk_publication_has_author_author1` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`),
  CONSTRAINT `fk_publication_has_author_publication1` FOREIGN KEY (`publication_id`) REFERENCES `publication` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_has_author`
--

LOCK TABLES `publication_has_author` WRITE;
/*!40000 ALTER TABLE `publication_has_author` DISABLE KEYS */;
INSERT INTO `publication_has_author` VALUES (5,1),(6,1),(7,1),(13,1),(6,2),(11,3),(12,3),(14,3),(16,3),(14,4),(15,4),(8,5),(2,6),(9,6),(10,6),(1,7),(6,8),(2,9),(3,9),(4,9);
/*!40000 ALTER TABLE `publication_has_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_type`
--

DROP TABLE IF EXISTS `publication_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication_type` (
  `id` int NOT NULL,
  `naimenovanie_tipa` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_type`
--

LOCK TABLES `publication_type` WRITE;
/*!40000 ALTER TABLE `publication_type` DISABLE KEYS */;
INSERT INTO `publication_type` VALUES (1,'Научная статья'),(2,'Научный реферат'),(3,'Методические разработки'),(4,'Монография'),(5,'Информативный реферат '),(6,'Материалы научной конференции ');
/*!40000 ALTER TABLE `publication_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rubrika`
--

DROP TABLE IF EXISTS `rubrika`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rubrika` (
  `id` int NOT NULL,
  `kod_rubriki` varchar(10) DEFAULT NULL,
  `naimenovanie_rubriki` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rubrika`
--

LOCK TABLES `rubrika` WRITE;
/*!40000 ALTER TABLE `rubrika` DISABLE KEYS */;
INSERT INTO `rubrika` VALUES (1,'50','Автоматика. Вычислительная техника'),(2,'27','Математика'),(3,'14','Народное образование. Педагогика'),(4,'37','qyhczxan amgvmtjso'),(5,'6','ydmcr spzcmgfv'),(6,'22','luwca yymgyhsam'),(7,'45','fxjmw sniuc'),(8,'42','wtzrw fygebkrd'),(9,'11','yiwivnu lqessejye'),(10,'6','evgxhmqm ogxconsgx'),(11,'31','pdhytkgfj qpzyrztgf'),(12,'49','uyxlr ljlbmboic'),(13,'14','bezxnbww nsqpdigpm'),(14,'6','olfwiyx wpcet'),(15,'2','xhmqjhvd iquzqscm'),(16,'8','kbcwncq zkejnrue'),(17,'26','ujwti ecfknnut'),(18,'46','vpcgeyh kvmwusb'),(19,'7','hftezuwd cdpvjoc'),(20,'32','oavrsi vgzovu'),(21,'31','ebufxhhem suprtrzam'),(22,'50','vsozfz kjfdnb'),(23,'33','ooucj zqfuch'),(24,'46','xnfvt xeqwr'),(25,'13','gcmrxvv dcdiu'),(26,'43','nxvwp xvwwxqi'),(27,'20','vyklqdhkt ekvoe'),(28,'30','idiik zizhdqvi'),(29,'27','taqloehel fiiyshhdj'),(30,'46','wlztsrbp nommtlkri'),(31,'14','txqaw hhjyjlkp'),(32,'46','ngdwoi sguvpixu'),(33,'13','ebeqyf kmdtp'),(34,'44','wxjtqjss tnhapnmex'),(35,'28','vgakh grubka'),(36,'1','tcejksh ocfhmt'),(37,'26','klqpwip hsbytqghf'),(38,'33','vosptm dtcszauw'),(39,'35','niaarqgp jusfn'),(40,'15','cdmps suuzo'),(41,'44','pvczcg arnlmdg'),(42,'26','mijexjov irtiqx'),(43,'32','genxfil ecvdxojc'),(44,'36','afyrxsvk csvgq'),(45,'25','fmzjvjju hcbajlr'),(46,'45','duoyz vyulygih'),(47,'6','taqftist kdekowqmd'),(48,'10','aaspgok ljyfqwo'),(49,'33','cjjemtftg usquzae'),(50,'15','lzneaywof bszmmzy'),(51,'50','hbhkjbxsq hxthywps'),(52,'13','uwglbyat svtutkscc'),(53,'25','qyqaej txnkfxoy'),(54,'5','vwtfeysvf hmathalk'),(55,'16','qixubzzv mkiey'),(56,'2','jaech innmpw'),(57,'12','eoklvqqrg qpnyziy'),(58,'21','ltsbqggt wllfhiso'),(59,'17','zudeo llbtpdp'),(60,'41','snlejr cxitpyhvj'),(61,'45','hbbasj utuyd'),(62,'18','nfopalzy oqqfrmpu'),(63,'24','jzacdk djjixo'),(64,'47','ofpao gwffhiyh'),(65,'13','bnbois ymqamk'),(66,'21','suxot insuldiyj'),(67,'12','txqwuocz mniwy'),(68,'14','wgszvwryi eaukohtnb'),(69,'16','shltdsost wyrnt'),(70,'46','iygmvjnh ewcnt'),(71,'43','aegdltn zddlkfgsx'),(72,'37','xvbipqzj dijwdnu'),(73,'14','pxxhb jlcuo'),(74,'37','dqtbtrwyr yriulc'),(75,'49','bszmgzmaf kadqq'),(76,'10','adizuykhh caqmfqzjm'),(77,'13','khrxgl cjtio'),(78,'25','jnvqvh geoleuqme'),(79,'13','ggvbifd aivzbmacm'),(80,'13','tptzrt cgigjze'),(81,'41','kbnfiud igdtueyxi'),(82,'37','rojyvanau seeuk'),(83,'2','hmuprj lmpwx'),(84,'29','akwsqn vfiqlo'),(85,'3','ndsbxzsx qpwajewsw'),(86,'14','yoyijx gawjenb'),(87,'22','qdzxww qtvzztqrw'),(88,'25','cncgt oppbutymz'),(89,'49','idurnla aelsoi'),(90,'21','hemhncg jpygo'),(91,'28','epjbrheo hpzgg'),(92,'50','sjtkj fxhebr'),(93,'43','bqxguemty okoxumlot'),(94,'26','tnptvcs moexglt'),(95,'36','lwlyhjj djeewlpes'),(96,'19','vglsoksu lqkjdper'),(97,'42','fjdxloe gwqersh'),(98,'32','savgjp uivizuvm'),(99,'41','mununkph cpdpj'),(100,'32','wrulxwlvc lmrvjbzzz'),(101,'46','rewwg hemsf'),(102,'7','pahtoe unwcxjzrv'),(103,'15','yxjpzttvy abxje'),(104,'0','knvctntv pmifdkqey'),(105,'10','ecvewkd fhoujl'),(106,'42','sdxljgg arprvek'),(107,'21','djazjh kjwpkbt'),(108,'3','oqovpxpxx flnkmvo');
/*!40000 ALTER TABLE `rubrika` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `simple_`
--

DROP TABLE IF EXISTS `simple_`;
/*!50001 DROP VIEW IF EXISTS `simple_`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `simple_` AS SELECT 
 1 AS `book`,
 1 AS `quotation`,
 1 AS `tematika`,
 1 AS `journal`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'mydb'
--
/*!50003 DROP PROCEDURE IF EXISTS `bookby` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `bookby`(in fio VARCHAR(50))
BEGIN	
    SELECT naimenovanie AS book, quotation AS quotation, publication_date
	FROM publication
	JOIN publication_has_author ON (publication.id=publication_has_author.publication_id)
	JOIN author ON (publication_has_author.author_id=author.id)
    WHERE fullname LIKE fio
	ORDER BY naimenovanie;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createAuthor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createAuthor`( in id INT, 
in fname varchar(45), 
in org varchar(45), 
in org_podr varchar(45), 
in dol varchar(45), 
in gender varchar(10))
BEGIN
	INSERT INTO author (id, fullname, organization, org_podrazdelenie, doljnost, gender)
    VALUES (id, fname, org, org_podr, dol, gender);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `book_author`
--

/*!50001 DROP VIEW IF EXISTS `book_author`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `book_author` AS select `publication`.`naimenovanie` AS `book`,group_concat(`author`.`fullname` order by `author`.`fullname` ASC separator ', ') AS `authors` from ((`publication` join `publication_has_author` on((`publication`.`id` = `publication_has_author`.`publication_id`))) join `author` on((`publication_has_author`.`author_id` = `author`.`id`))) group by `publication_has_author`.`publication_id` order by `publication`.`naimenovanie` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `kpfu`
--

/*!50001 DROP VIEW IF EXISTS `kpfu`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `kpfu` AS select `author`.`fullname` AS `author`,`author`.`org_podrazdelenie` AS `department`,count(0) AS `kolvo`,sum(`publication`.`quotation`) AS `sum_quotation` from ((`publication` join `publication_has_author` on((`publication`.`id` = `publication_has_author`.`publication_id`))) join `author` on((`publication_has_author`.`author_id` = `author`.`id`))) where (`author`.`organization` = 'Казанский федеральный университет') group by `author`.`fullname` order by `author`.`fullname` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `simple_`
--

/*!50001 DROP VIEW IF EXISTS `simple_`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `simple_` AS select `publication`.`naimenovanie` AS `book`,`publication`.`quotation` AS `quotation`,`publication`.`tematika` AS `tematika`,`journal`.`nazvanie` AS `journal` from (`publication` join `journal` on((`publication`.`journal_id` = `journal`.`id`))) where ((`publication`.`tematika` = 'Математика') and (`publication`.`quotation` >= '3') and (`journal`.`vak` = '1')) order by `publication`.`naimenovanie` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-02 18:04:45
