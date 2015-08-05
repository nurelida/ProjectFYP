-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.22-rc-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema finalyearproject
--

CREATE DATABASE IF NOT EXISTS finalyearproject;
USE finalyearproject;

--
-- Definition of table `announcement`
--

DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement` (
  `annID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `annTitle` varchar(255) NOT NULL,
  `annDesc` text NOT NULL,
  `annShow` varchar(45) NOT NULL,
  PRIMARY KEY (`annID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `announcement`
--

/*!40000 ALTER TABLE `announcement` DISABLE KEYS */;
INSERT INTO `announcement` (`annID`,`annTitle`,`annDesc`,`annShow`) VALUES 
 (10,'Online Final Year System Implementation','All PSM1 students are required to register before you can use this system. After register, use Matrices No to login.','Y');
/*!40000 ALTER TABLE `announcement` ENABLE KEYS */;


--
-- Definition of table `demo_room`
--

DROP TABLE IF EXISTS `demo_room`;
CREATE TABLE `demo_room` (
  `room_name` varchar(50) NOT NULL,
  `roomID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`roomID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `demo_room`
--

/*!40000 ALTER TABLE `demo_room` DISABLE KEYS */;
INSERT INTO `demo_room` (`room_name`,`roomID`) VALUES 
 ('PSM Lab',17),
 ('Case Lab',18);
/*!40000 ALTER TABLE `demo_room` ENABLE KEYS */;


--
-- Definition of table `engapply`
--

DROP TABLE IF EXISTS `engapply`;
CREATE TABLE `engapply` (
  `metricNo` varchar(20) NOT NULL,
  `reason` text NOT NULL,
  `svSuppReason` text,
  `status` varchar(45) DEFAULT NULL,
  `proID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`metricNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `engapply`
--

/*!40000 ALTER TABLE `engapply` DISABLE KEYS */;
INSERT INTO `engapply` (`metricNo`,`reason`,`svSuppReason`,`status`,`proID`) VALUES 
 ('AC060117','\'\'\'\'\'','1.\'\r\n2.','Approved',19);
/*!40000 ALTER TABLE `engapply` ENABLE KEYS */;


--
-- Definition of table `ev_pembentangan_psm1`
--

DROP TABLE IF EXISTS `ev_pembentangan_psm1`;
CREATE TABLE `ev_pembentangan_psm1` (
  `metricNo` varchar(20) NOT NULL,
  `peradaban` varchar(20) NOT NULL,
  `persiapan` varchar(20) NOT NULL,
  `ketepatan` varchar(20) NOT NULL,
  `kefahaman` varchar(20) NOT NULL,
  `keyakinan` varchar(20) NOT NULL,
  `soal_jawab` varchar(20) NOT NULL,
  `jumlah` varchar(20) NOT NULL,
  `ev_comment` text NOT NULL,
  PRIMARY KEY (`metricNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ev_pembentangan_psm1`
--

/*!40000 ALTER TABLE `ev_pembentangan_psm1` DISABLE KEYS */;
INSERT INTO `ev_pembentangan_psm1` (`metricNo`,`peradaban`,`persiapan`,`ketepatan`,`kefahaman`,`keyakinan`,`soal_jawab`,`jumlah`,`ev_comment`) VALUES 
 ('AC060117','1.00','2.00','3.00','5.00','2.00','2.00','15.00','a'),
 ('AC070095','1.00','2.00','3.00','5.00','2.00','2.00','15.00',' f');
/*!40000 ALTER TABLE `ev_pembentangan_psm1` ENABLE KEYS */;


--
-- Definition of table `ev_pembentangan_psm2`
--

DROP TABLE IF EXISTS `ev_pembentangan_psm2`;
CREATE TABLE `ev_pembentangan_psm2` (
  `metricNo` varchar(20) NOT NULL,
  `peradaban` varchar(20) NOT NULL,
  `persiapan` varchar(20) NOT NULL,
  `ketepatan` varchar(20) NOT NULL,
  `kefahaman` varchar(20) NOT NULL,
  `keyakinan` varchar(20) NOT NULL,
  `soal_jawab` varchar(20) NOT NULL,
  `jumlah` varchar(20) NOT NULL,
  `ev_comment` text NOT NULL,
  PRIMARY KEY (`metricNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ev_pembentangan_psm2`
--

/*!40000 ALTER TABLE `ev_pembentangan_psm2` DISABLE KEYS */;
INSERT INTO `ev_pembentangan_psm2` (`metricNo`,`peradaban`,`persiapan`,`ketepatan`,`kefahaman`,`keyakinan`,`soal_jawab`,`jumlah`,`ev_comment`) VALUES 
 ('AC060117','1.00','2.00','3.00','5.00','2.00','2.00','15.00','a');
/*!40000 ALTER TABLE `ev_pembentangan_psm2` ENABLE KEYS */;


--
-- Definition of table `ev_penilaian_psm1`
--

DROP TABLE IF EXISTS `ev_penilaian_psm1`;
CREATE TABLE `ev_penilaian_psm1` (
  `metricNo` varchar(10) NOT NULL,
  `matlamat` varchar(20) NOT NULL,
  `kajian` varchar(20) NOT NULL,
  `perancangan` varchar(20) NOT NULL,
  `pengumpulan` varchar(20) NOT NULL,
  `teknik` varchar(20) NOT NULL,
  `rekabentuk` varchar(20) NOT NULL,
  `perkakasan` varchar(20) NOT NULL,
  `hasil` varchar(20) NOT NULL,
  `rujukan` varchar(20) NOT NULL,
  `lampiran` varchar(20) NOT NULL,
  `laporan` varchar(20) NOT NULL,
  `total` varchar(20) NOT NULL,
  `komen` text NOT NULL,
  PRIMARY KEY (`metricNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ev_penilaian_psm1`
--

/*!40000 ALTER TABLE `ev_penilaian_psm1` DISABLE KEYS */;
INSERT INTO `ev_penilaian_psm1` (`metricNo`,`matlamat`,`kajian`,`perancangan`,`pengumpulan`,`teknik`,`rekabentuk`,`perkakasan`,`hasil`,`rujukan`,`lampiran`,`laporan`,`total`,`komen`) VALUES 
 ('AC060117','2.00','3.00','1.00','2.00','3.00','5.00','2.00','3.00','1.00','1.00','2.00','25.00',' fggg');
/*!40000 ALTER TABLE `ev_penilaian_psm1` ENABLE KEYS */;


--
-- Definition of table `ev_penilaian_psm2`
--

DROP TABLE IF EXISTS `ev_penilaian_psm2`;
CREATE TABLE `ev_penilaian_psm2` (
  `metricNo` varchar(10) NOT NULL,
  `skop` varchar(20) NOT NULL,
  `metodologi` varchar(20) NOT NULL,
  `hasil` varchar(20) NOT NULL,
  `teknologi` varchar(20) NOT NULL,
  `komersial` varchar(20) NOT NULL,
  `total` varchar(20) NOT NULL,
  `komen` text NOT NULL,
  PRIMARY KEY (`metricNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ev_penilaian_psm2`
--

/*!40000 ALTER TABLE `ev_penilaian_psm2` DISABLE KEYS */;
INSERT INTO `ev_penilaian_psm2` (`metricNo`,`skop`,`metodologi`,`hasil`,`teknologi`,`komersial`,`total`,`komen`) VALUES 
 ('AC060117','6.00','3.00','8.00','4.00','4.00','25.00','a');
/*!40000 ALTER TABLE `ev_penilaian_psm2` ENABLE KEYS */;


--
-- Definition of table `expertisefield`
--

DROP TABLE IF EXISTS `expertisefield`;
CREATE TABLE `expertisefield` (
  `staffNo` varchar(50) NOT NULL,
  `expertised` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `expertised_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`expertised_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `expertisefield`
--

/*!40000 ALTER TABLE `expertisefield` DISABLE KEYS */;
INSERT INTO `expertisefield` (`staffNo`,`expertised`,`description`,`expertised_ID`) VALUES 
 ('S001','SED01','Web developement, sheduling system.',27),
 ('S002','SED03','Expert System',28),
 ('S004','SED03','Component based software engineering',30),
 ('S002','SED01','Web Developtment',31),
 ('S002','SED02','Genetic Algoritm',32),
 ('S004','SED02','fefef',33),
 ('S006','SED01','Web Development',34),
 ('S006','SED02','Genetic algoritm',35),
 ('S003','SED01','Web Developtment',36),
 ('4724','SED02','Intelligent System\r\nSpeech recognition and verification',37),
 ('7331','SED01','Compotent based software engineering\r\n,Software reuse',38),
 ('7351','SED02','Planning, scheduling and timetabling(School, Examination, Course);\r\nOptimization Alorithms - Genetic Algorithm, Simulated Annealing, Tabu Search;Fuzzy Logic ; Classification Problem',39),
 ('7351','SED01','Web based software development',40),
 ('6838','SED01','Web based application',41),
 ('6838','SED03','',42),
 ('10054','SED02','Data/ Text mining',43),
 ('2135','SED01','Web Development',44),
 ('7019','SED01','Real Time Software',45),
 ('8096','SED02','Bioinformatics & Computational Biology: Protein-Protein Interaction, Remote Protein Homology Detection, Fold Recognition, Gene Expression Analysis, Protein Domain Detection etc.',46),
 ('1898','SED01','Computer science education/ elearning',47),
 ('1898','SED03','Expert System',48),
 ('5160','SED01','Intelligent System, elearning algorithm',49),
 ('5501','SED01','Web Based Development Syatem',50),
 ('2586','SED01','- Web development\r\n- Software Testing',51),
 ('2157','SED02','Pattern Recognition using Artificial Neural Network',52),
 ('7801','SED01','Agent oriented software engineering',53),
 ('5975','SED01','Software engineering',54),
 ('5975','SED02','Genetic algorithm, case base reasoning, neural network, support vector machine',55),
 ('4298','SED01','Software engineering',56),
 ('5419','SED01','Web based System',57),
 ('6749','SED01','Software engineering',58),
 ('6749','SED02','Soft computing, techniques and applications',59),
 ('7352','SED01','Software Design / Architecture,\r\nService-Oriented Architecture,\r\nModel-Driven Architecture,\r\nEvolvable Software,\r\nWeb Developement.',60),
 ('4724','SED01','Web Development',62),
 ('10650','SED01','Usability, Human-Computer Interaction, Interaction/Interface Design',63),
 ('7801','SED01','- Software Reuse\r\n- Pattern-Oriented Design\r\n- Service-Oriented Architecture\r\n- Formal Methods',64),
 ('7801','SED04','- Agent-Oriented Software Engineering',65),
 ('7903','SED02','Intelligent techniques such as genetic algorithms and particle swarm optimisation ',66),
 ('7903','SED03','Expert system based on fuzzy logic, rule-based or any intelligent techniques',67),
 ('7409','SED01','Web based system, mobile systems',68),
 ('7409','SED02','Neural networks, intelligent systems',69),
 ('7409','SED04','Ubiquitous agent, mobile agent, RFID agent, agent verification and validlidations',70),
 ('5501','SED01','Intelligent e-learning system',71),
 ('8063','SED02','Enterprise-based Information Management,\r\nViable Systems,\r\nBioinformatics (in silico experiments)',72),
 ('7331','SED01','Domain of mobile robot and embedded real-time systems',73),
 ('8096','SED01','Software Development: Biotechnology-Based Data Centre, Web-Based Application, Ontology-Based Application, Agent-Based Application, Bioinformatics Tools etc. ',74),
 ('7019','SED05','Symbian\r\nWindows Mobile',75),
 ('2586','SED02','- artificial immune system\r\n- rough set',76);
/*!40000 ALTER TABLE `expertisefield` ENABLE KEYS */;


--
-- Definition of table `flag_lec_ev_schedule`
--

DROP TABLE IF EXISTS `flag_lec_ev_schedule`;
CREATE TABLE `flag_lec_ev_schedule` (
  `flag` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flag_lec_ev_schedule`
--

/*!40000 ALTER TABLE `flag_lec_ev_schedule` DISABLE KEYS */;
INSERT INTO `flag_lec_ev_schedule` (`flag`) VALUES 
 ('No');
/*!40000 ALTER TABLE `flag_lec_ev_schedule` ENABLE KEYS */;


--
-- Definition of table `flag_stud_result`
--

DROP TABLE IF EXISTS `flag_stud_result`;
CREATE TABLE `flag_stud_result` (
  `flag` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flag_stud_result`
--

/*!40000 ALTER TABLE `flag_stud_result` DISABLE KEYS */;
INSERT INTO `flag_stud_result` (`flag`) VALUES 
 ('No');
/*!40000 ALTER TABLE `flag_stud_result` ENABLE KEYS */;


--
-- Definition of table `lec_ev_timetable`
--

DROP TABLE IF EXISTS `lec_ev_timetable`;
CREATE TABLE `lec_ev_timetable` (
  `ev1` varchar(10) DEFAULT NULL,
  `ev2` varchar(10) DEFAULT NULL,
  `slot` varchar(45) DEFAULT NULL,
  `room` varchar(100) DEFAULT NULL,
  `semester` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lec_ev_timetable`
--

/*!40000 ALTER TABLE `lec_ev_timetable` DISABLE KEYS */;
INSERT INTO `lec_ev_timetable` (`ev1`,`ev2`,`slot`,`room`,`semester`) VALUES 
 ('4724','2135','tt0102','17','200820092'),
 ('2135','4724','tt0202','17','200820092');
/*!40000 ALTER TABLE `lec_ev_timetable` ENABLE KEYS */;


--
-- Definition of table `lec_ev_timetable_psm2`
--

DROP TABLE IF EXISTS `lec_ev_timetable_psm2`;
CREATE TABLE `lec_ev_timetable_psm2` (
  `ev1` varchar(10) NOT NULL,
  `ev2` varchar(10) NOT NULL,
  `slot` varchar(45) NOT NULL,
  `room` varchar(100) NOT NULL,
  `semester` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lec_ev_timetable_psm2`
--

/*!40000 ALTER TABLE `lec_ev_timetable_psm2` DISABLE KEYS */;
INSERT INTO `lec_ev_timetable_psm2` (`ev1`,`ev2`,`slot`,`room`,`semester`) VALUES 
 ('4724','2135','tt0102','17','200820092'),
 ('2135','4724','tt0202','17','200820092'),
 ('2135','','tt0103','17','200820092');
/*!40000 ALTER TABLE `lec_ev_timetable_psm2` ENABLE KEYS */;


--
-- Definition of table `lec_timetable`
--

DROP TABLE IF EXISTS `lec_timetable`;
CREATE TABLE `lec_timetable` (
  `staffNo` varchar(10) NOT NULL,
  `free_period` varchar(6) NOT NULL,
  `semester` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lec_timetable`
--

/*!40000 ALTER TABLE `lec_timetable` DISABLE KEYS */;
INSERT INTO `lec_timetable` (`staffNo`,`free_period`,`semester`) VALUES 
 ('7351','tt0102','200820091'),
 ('4724','tt0102','200820092'),
 ('4724','tt0103','200820092'),
 ('4724','tt0104','200820092'),
 ('4724','tt0105','200820092'),
 ('4724','tt0106','200820092'),
 ('4724','tt0202','200820092'),
 ('4724','tt0203','200820092'),
 ('4724','tt0204','200820092'),
 ('4724','tt0205','200820092'),
 ('4724','tt0206','200820092'),
 ('2135','tt0102','200820092'),
 ('2135','tt0103','200820092'),
 ('2135','tt0104','200820092'),
 ('2135','tt0105','200820092'),
 ('2135','tt0106','200820092'),
 ('2135','tt0107','200820092'),
 ('2135','tt0108','200820092'),
 ('2135','tt0109','200820092'),
 ('2135','tt0110','200820092'),
 ('2135','tt0111','200820092'),
 ('2135','tt0112','200820092'),
 ('2135','tt0202','200820092'),
 ('2135','tt0203','200820092'),
 ('2135','tt0204','200820092'),
 ('2135','tt0205','200820092'),
 ('2135','tt0206','200820092'),
 ('2135','tt0207','200820092'),
 ('2135','tt0208','200820092'),
 ('2135','tt0209','200820092'),
 ('2135','tt0210','200820092'),
 ('2135','tt0211','200820092'),
 ('2135','tt0212','200820092'),
 ('7351','tt0102','200820092'),
 ('7351','tt0103','200820092'),
 ('7351','tt0104','200820092'),
 ('7351','tt0105','200820092'),
 ('7351','tt0106','200820092'),
 ('7351','tt0107','200820092'),
 ('7351','tt0108','200820092'),
 ('7351','tt0109','200820092'),
 ('7351','tt0110','200820092'),
 ('7351','tt0111','200820092'),
 ('7351','tt0112','200820092'),
 ('7351','tt0203','200820092'),
 ('7351','tt0206','200820092'),
 ('7351','tt0208','200820092'),
 ('7351','tt0211','200820092'),
 ('7801','tt0103','200920101'),
 ('7801','tt0104','200920101'),
 ('7801','tt0105','200920101'),
 ('7801','tt0203','200920101'),
 ('7801','tt0204','200920101'),
 ('7801','tt0205','200920101'),
 ('7801','tt0408','200920101'),
 ('7801','tt0409','200920101'),
 ('7801','tt0508','200920101'),
 ('7801','tt0509','200920101'),
 ('7409','tt0108','200920101'),
 ('7409','tt0109','200920101'),
 ('7409','tt0110','200920101'),
 ('7409','tt0403','200920101'),
 ('7409','tt0404','200920101'),
 ('7409','tt0503','200920101'),
 ('7351','tt0202','200920101');
/*!40000 ALTER TABLE `lec_timetable` ENABLE KEYS */;


--
-- Definition of table `lecturer`
--

DROP TABLE IF EXISTS `lecturer`;
CREATE TABLE `lecturer` (
  `lectName` varchar(200) NOT NULL,
  `staffNo` varchar(45) NOT NULL,
  `emailAdd` varchar(100) NOT NULL,
  `phoneNo` varchar(45) NOT NULL,
  `pass` varchar(250) NOT NULL,
  `roomNo` varchar(100) NOT NULL,
  `active` varchar(10) NOT NULL,
  PRIMARY KEY (`staffNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lecturer`
--

/*!40000 ALTER TABLE `lecturer` DISABLE KEYS */;
INSERT INTO `lecturer` (`lectName`,`staffNo`,`emailAdd`,`phoneNo`,`pass`,`roomNo`,`active`) VALUES 
 ('Ito Wasito, Assoc. Prof. Dr.','10054','ito@utm.my','075532225','*E6CC90B878B948C35E92B003C792C46C58C4AF40','D07-447-01','Active'),
 ('Masitah Ghazali, Dr.','10650','masitah@utm.my','075532355','*EA77BE3F668639422CE8F7264D84C828E8D23BFF','N28-306-07','Active'),
 ('Noraniah Mohd Yassin, Assoc. Prof.','1898','noraniah@utm.my','075532346','*980473E727B0DA38595EF73886100331CA187092','N28-305-09 ','Active'),
 ('Mabeni Mapoh','2135','mabeni@utm.my','075532232','*E6CC90B878B948C35E92B003C792C46C58C4AF40','D07-354-01','Active'),
 ('Puteh Saad, Assoc. Prof. Dr.','2157','puteh@utm.my','075532344','*E6CC90B878B948C35E92B003C792C46C58C4AF40','N28-305-06','Active'),
 ('Paridah Samsuri','2586','paridahsamsuri@utm.my','075532042','*BB6008AC74790ADDD33261DC6341E5F8A68AB6B5','N28-306-15','Active'),
 ('Safie Mat Yatim, Assoc. Prof.','4298','safiematyatim@utm.my','075532347','*E6CC90B878B948C35E92B003C792C46C58C4AF40','N28-305-10','Active'),
 ('Abdul Manan Ahmad, Assoc. Prof.','4724','manan@utm.my','075532201','*E6CC90B878B948C35E92B003C792C46C58C4AF40','N28-305-04','Active'),
 ('Norazah Yusof, Assoc. Prof. Dr.','5160','norazah@utm.my','075532344','*E6CC90B878B948C35E92B003C792C46C58C4AF40','N28-305-12','Active'),
 ('Sazali Abd Manaf','5419','sazali@utm.my','075532432','*E6CC90B878B948C35E92B003C792C46C58C4AF40','N28-306-20','Active'),
 ('Nor Bahiah Hj Ahmad','5501','bahiah@utm.my','0127152239','*E6CC90B878B948C35E92B003C792C46C58C4AF40','N28-306-08','Active'),
 ('Safaai Deris, Prof.  Dr.','5975','safaai@utm.my','075532343','*E6CC90B878B948C35E92B003C792C46C58C4AF40','N28-305-05','Active'),
 ('Siti Zaiton Mohd Hashim, Dr.','6749','sitizaiton@utm.my','075532439','*E6CC90B878B948C35E92B003C792C46C58C4AF40','N28-306-18','Active'),
 ('Ismail Mat Amin, Dr.','6838','ismailma@utm.my','075532345','*E6CC90B878B948C35E92B003C792C46C58C4AF40','N28-305-08','Active'),
 ('Mohd Yazid Idris, Dr.','7019','yazid@utm.my','075532309','*E6CC90B878B948C35E92B003C792C46C58C4AF40','N28-306-14 ','Active'),
 ('Dayang Norhayati Abg Jawawi, Dr.','7331','dayang@utm.my','075532354','*41765EDE93B665D63B5B1DF6CAEBB314A3C14EFA','N28-306-06','Active'),
 ('Hishammuddin Asmuni, Dr.','7351','hishammuddin@utm.my','075532353','*E6CC90B878B948C35E92B003C792C46C58C4AF40','N28-306-05','Active'),
 ('Wan Mohd Nasir Wan Kadir, Dr.','7352','wnasir@utm.my','075532348','*A8E5A8A8A6E3764D2CBAC229CB70DE3E8FF5A23F','N28-305-11','Active'),
 ('Ali Selamat, Assoc. Prof. Dr.','7409','aselamat@utm.my','075532222','*C998C369A1E040C9020ECF9CA0D03FFB39C07FD1','D07-449-01','Active'),
 ('Radziah Mohamad, Dr.','7801','radziahm@utm.my','075532013','*E61934A5DCCEE79D62DCA9E5BB324CCDF5F6F745','N28-306-17','Active'),
 ('Zalmiyah Zakaria','7903','zalmiyah@utm.my','075532357','*D37E51C7B77D23C995A7F1403656C1C5B3041737','N28-306-09','Active'),
 ('Roliana Ibrahim Dr','8063','roliana@utm.my','0177213761','*E6CC90B878B948C35E92B003C792C46C58C4AF40','403-04','Active'),
 ('Dr Muhamad Razib Othman','8096','razib.fsksm@gmail.com','075599230','*5E298744272644E27CE8FB0C44694F4567B3449E','BIP-204','Active'),
 ('Pensyarah','PENSYARAH','pensyarah@utm.my','01234567890','*6F7BA323A343A04F40C359F1C02DED1482FF7AC8','n28','Active');
/*!40000 ALTER TABLE `lecturer` ENABLE KEYS */;


--
-- Definition of table `presentation_table`
--

DROP TABLE IF EXISTS `presentation_table`;
CREATE TABLE `presentation_table` (
  `staffNo` varchar(10) NOT NULL,
  `slot` varchar(10) NOT NULL,
  `evaluator` varchar(10) NOT NULL,
  `room` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `presentation_table`
--

/*!40000 ALTER TABLE `presentation_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `presentation_table` ENABLE KEYS */;


--
-- Definition of table `project_evaluation`
--

DROP TABLE IF EXISTS `project_evaluation`;
CREATE TABLE `project_evaluation` (
  `slot` varchar(10) NOT NULL,
  `roomID` varchar(10) NOT NULL,
  `metricNo` varchar(20) NOT NULL,
  `session` varchar(5) NOT NULL,
  `semester` varchar(10) NOT NULL,
  PRIMARY KEY (`metricNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project_evaluation`
--

/*!40000 ALTER TABLE `project_evaluation` DISABLE KEYS */;
INSERT INTO `project_evaluation` (`slot`,`roomID`,`metricNo`,`session`,`semester`) VALUES 
 ('tt0102','17','AC060117','1','200820092');
/*!40000 ALTER TABLE `project_evaluation` ENABLE KEYS */;


--
-- Definition of table `project_evaluation_psm2`
--

DROP TABLE IF EXISTS `project_evaluation_psm2`;
CREATE TABLE `project_evaluation_psm2` (
  `slot` varchar(10) NOT NULL,
  `roomID` varchar(10) NOT NULL,
  `metricNo` varchar(20) NOT NULL,
  `session` varchar(5) NOT NULL,
  `semester` varchar(10) NOT NULL,
  PRIMARY KEY (`metricNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project_evaluation_psm2`
--

/*!40000 ALTER TABLE `project_evaluation_psm2` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_evaluation_psm2` ENABLE KEYS */;


--
-- Definition of table `projectfield`
--

DROP TABLE IF EXISTS `projectfield`;
CREATE TABLE `projectfield` (
  `ID` varchar(20) NOT NULL,
  `proField` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `projectfield`
--

/*!40000 ALTER TABLE `projectfield` DISABLE KEYS */;
INSERT INTO `projectfield` (`ID`,`proField`) VALUES 
 ('SED01','Software Engineering'),
 ('SED02','Computational Intelligent'),
 ('SED03','Expert System'),
 ('SED04','Agent Based Project'),
 ('SED05','Mobile Application');
/*!40000 ALTER TABLE `projectfield` ENABLE KEYS */;


--
-- Definition of table `psm_1`
--

DROP TABLE IF EXISTS `psm_1`;
CREATE TABLE `psm_1` (
  `metricNo` varchar(20) NOT NULL,
  `semester` varchar(45) NOT NULL,
  PRIMARY KEY (`metricNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `psm_1`
--

/*!40000 ALTER TABLE `psm_1` DISABLE KEYS */;
INSERT INTO `psm_1` (`metricNo`,`semester`) VALUES 
 ('ac000000','200820091'),
 ('AC000001','200920101'),
 ('AC060004','200920101'),
 ('AC060022','200920101'),
 ('AC060030','200920101'),
 ('AC060032','200920101'),
 ('AC060038','200920101'),
 ('AC060039','200920101'),
 ('AC060053','200920101'),
 ('AC060056','200920101'),
 ('AC060063','200920101'),
 ('AC060065','200920101'),
 ('AC060071','200920101'),
 ('AC060084','200920101'),
 ('AC060086','200920101'),
 ('AC060091','200920101'),
 ('AC060107','200920101'),
 ('AC060117','200820092'),
 ('AC060119','200820092'),
 ('AC060140','200920101'),
 ('AC060154','200920101'),
 ('AC060161','200920101'),
 ('AC060176','200920101'),
 ('AC060179','200920101'),
 ('AC060214','200920101'),
 ('AC060241','200920101'),
 ('AC060247','200920101'),
 ('AC060261','200920101'),
 ('AC060267','200920101'),
 ('AC060274','200920101'),
 ('AC060289','200920101'),
 ('AC070015','200920101'),
 ('AC070021','200920101'),
 ('AC070041','200920101'),
 ('AC070045','200920101'),
 ('AC070054','200920101'),
 ('AC070055','200920101'),
 ('AC070066','200920101'),
 ('AC070073','200920101'),
 ('AC070074','200920101'),
 ('AC070080','200920101'),
 ('AC070093','200920101'),
 ('AC070095','200820092'),
 ('AC070109','200920101'),
 ('AC070110','200920101'),
 ('AC070111','200920101'),
 ('AC070114','200920101'),
 ('AC070135','200920101'),
 ('AC070137','200920101'),
 ('AC070140','200920101'),
 ('AC070156','200920101'),
 ('AC070163','200920101'),
 ('AC070164','200920101'),
 ('AC070166','200920101'),
 ('AC070193','200920101'),
 ('AC070199','200920101'),
 ('AC070204','200920101'),
 ('AC070209','200920101'),
 ('AC070219','200920101'),
 ('AC070222','200920101'),
 ('AC070229','200920101'),
 ('AC070235','200920101'),
 ('AC070237','200920101'),
 ('AC070238','200920101'),
 ('AC070248','200920101'),
 ('AC070252','200920101'),
 ('AC070258','200920101'),
 ('AC070268','200920101'),
 ('AC070275','200920101'),
 ('AC070277','200920101'),
 ('AC070279','200920101'),
 ('AC070280','200920101'),
 ('AC070295','200920101'),
 ('AC070317','200920101'),
 ('AC070334','200920101'),
 ('AC070335','200920101'),
 ('AC070405','200920101'),
 ('AC070408','200920101'),
 ('AC073052','200920101'),
 ('AC073054','200920101'),
 ('AC073055','200920101'),
 ('AC073061','200920101'),
 ('AC073062','200920101'),
 ('AC073064','200920101'),
 ('AC073066','200920101'),
 ('AC073069','200920101'),
 ('AC073081','200920101'),
 ('AC073084','200920101'),
 ('AC073094','200920101'),
 ('AC073098','200920101'),
 ('AC073109','200920101'),
 ('AC073115','200920101'),
 ('AC073120','200920101'),
 ('AC073125','200920101'),
 ('AC073129','200920101'),
 ('AC080330','200920101'),
 ('AC080331','200920101'),
 ('AC080333','200920101'),
 ('AC080335','200920101'),
 ('AC080336','200920101'),
 ('AC080337','200920101'),
 ('AC080338','200920101'),
 ('AC080340','200920101'),
 ('AC080341','200920101'),
 ('AC080342','200920101'),
 ('AC080344','200920101'),
 ('AC080345','200920101'),
 ('AC080346','200920101'),
 ('AC080348','200920101'),
 ('AC080349','200920101'),
 ('AC080350','200920101'),
 ('AC080352','200920101'),
 ('AC080354','200920101'),
 ('AC080355','200920101'),
 ('AC080432','200920101'),
 ('AC080434','200920101'),
 ('AC080435','200920101'),
 ('AC735110','200920101'),
 ('ac99999','200820091');
/*!40000 ALTER TABLE `psm_1` ENABLE KEYS */;


--
-- Definition of table `psm_2`
--

DROP TABLE IF EXISTS `psm_2`;
CREATE TABLE `psm_2` (
  `metricNo` varchar(20) NOT NULL,
  `semester` varchar(45) NOT NULL,
  PRIMARY KEY (`metricNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `psm_2`
--

/*!40000 ALTER TABLE `psm_2` DISABLE KEYS */;
INSERT INTO `psm_2` (`metricNo`,`semester`) VALUES 
 ('AC060117','200820092'),
 ('ac070095','200820092'),
 ('ac070113','20082009');
/*!40000 ALTER TABLE `psm_2` ENABLE KEYS */;


--
-- Definition of table `quota_lecturer`
--

DROP TABLE IF EXISTS `quota_lecturer`;
CREATE TABLE `quota_lecturer` (
  `ev1` int(10) unsigned DEFAULT NULL,
  `ev2` int(10) unsigned DEFAULT NULL,
  `supervision` int(10) unsigned DEFAULT NULL,
  `semester` varchar(10) NOT NULL DEFAULT '',
  `ev_title` int(10) unsigned DEFAULT NULL,
  `ev1_psm2` int(10) unsigned DEFAULT NULL,
  `ev2_psm2` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`semester`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quota_lecturer`
--

/*!40000 ALTER TABLE `quota_lecturer` DISABLE KEYS */;
INSERT INTO `quota_lecturer` (`ev1`,`ev2`,`supervision`,`semester`,`ev_title`,`ev1_psm2`,`ev2_psm2`) VALUES 
 (11,11,11,'200820092',11,11,11),
 (10,10,15,'200920101',10,10,10);
/*!40000 ALTER TABLE `quota_lecturer` ENABLE KEYS */;


--
-- Definition of table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `studName` varchar(100) NOT NULL,
  `metricNo` varchar(20) NOT NULL,
  `icNo` varchar(12) NOT NULL,
  `emailAdd` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `phoneNo` varchar(45) NOT NULL,
  `semester` varchar(10) NOT NULL,
  PRIMARY KEY (`metricNo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`studName`,`metricNo`,`icNo`,`emailAdd`,`pass`,`phoneNo`,`semester`) VALUES 
 ('Hisham Test','AC000001','720213015579','hishamasmuni@gmail.com','*E6CC90B878B948C35E92B003C792C46C58C4AF40','0167178314','200920101'),
 ('Hayat Shobirin','AC060004','B801354','hayatshobirin@gmail.com','*B699151C812758EA3CB70604BBBAB1B94989B1F5','0167005751','200920101'),
 ('AHMAD MUJAHID UBAIDILLAH BIN ZAKARIA','AC060022','870208115413','puissmainan@yahoo.com','*128E57A972F5AC6D25FC0596CA6CF87DC42D6208','0132768198','200920101'),
 ('Anthony B. Thomas','AC060030','870928527467','numb_side@yahoo.com','*BB08C1EBF91535C0D154085211DD4055BCDE0449','0143199438','200920101'),
 ('Azian Hassan','AC060032','870218065296','azieacher@yahoo.com','*9425C61285AD5389C75B26006DFF4F5A2EEB05F2','0179210217','200920101'),
 ('CHAI LIAN EN','AC060038','860924236401','christemplar2002@yahoo.com','*E6FDA3DD63652DC9B4926D958ABC9AEDEFC30954','0167703076','200920101'),
 ('Cham Wei Lun','AC060039','860429236869','cham2020@yahoo.com','*19E5286C377219C50631903E0D04ADF705A2E381','0167220863','200920101'),
 ('chong chuii khim','AC060053','860322236842','ckmelissa86@hotmail.com','*3FA2450BF4650AB23723EE5109FCB5A49416EE9F','0167036680','200920101'),
 ('Choon Yee Wen','AC060056','860411236684','ewenchoon@gmail.com','*D08690A16A89DED7812111AE9D6F205D94A726E7','0167048691','200920101'),
 ('DACCAINI THANGARAJAH','AC060063','860504235760','daccaini86@gmail.com','*20D246C48C4095C5EE8CCC05D9A6C890B85FF718','0149138990','200920101'),
 ('Elizabeth Chia','AC060065','860316435802','elchia@gmail.com','*20E6832E2FC371C563374F6708E8155FA19D726D','0133363705','200920101'),
 ('FARAH NADIA BAHARUDIN','AC060071','870514565164','nudtz4eva@yahoo.co.uk','*2B3B8D0B99A799AE4AC5DE8FAE241BE4B73F7FDC','0123945880','200920101'),
 ('HOUNG MEE HIE','AC060084','860730525846','irene_5846@yahoo.com','*29DEFEE53E9862D792BF7BF27A9A0687ACFAB93E','0168979566','200920101'),
 ('Ivan Kon Tai Kiong','AC060086','860331526067','ivan.kon@gmail.com','*67D69174CA5E60A73CCE34C9DFC0C66AE752934B','0168971251','200920101'),
 ('kah wun tyng','AC060091','860129085413','jozerffer_86kah@yahoo.com','*F04242EEF88F7481E14FE6E81AF463BB41BCC29B','0166978411','200920101'),
 ('KWONG PEI YEEN','AC060107','860422595164','pearlykwong86@gmail.com','*F04242EEF88F7481E14FE6E81AF463BB41BCC29B','0163593581','200920101'),
 ('Lee Yih Rou','AC060117','860922405072','bluelyrou@hotmail.com','*6D3C9108CD0520D9B51B932439E5F7A3BA38D078','0124273568','200820092'),
 ('MOHD FIKRI BIN YUSOF','AC060140','870618065615','mfikri7@siswa.utm.my','*1D3984AA776EB133392BAEDE9A64B2DB1A6B5364','0129573188','200920101'),
 ('Muhamad Hosni Fariz bin Yahya','AC060154','871030055189','farizyahya@gmail.com','*F2362FD08035899D4B3F66737B6354E351FDEB12','0127711649','200920101'),
 ('MUHD UZAIR BIN MOHD ZAIN','AC060161','870307105245','sifu_star@yahoo.com','*0AE047CB8A9A06D8BD0AC0A995B7E78E2EB89AEC','0172015035','200920101'),
 ('NOOR FAUZANA BT SUBARI@RAHMAT','AC060176','870724235390','merpatihijau87@gmail.com','*851D8C5A72711044B065AA5D41794FD2C3A888B6','0136479883','200920101'),
 ('Noor Shazlina Mohamed','AC060179','870828305090','nolin87nn@gmail.com','*D863BF188E2437F3CB5B884E67940E42C799E4C1','0122918240','200920101'),
 ('Nurul Hamizah binti Badrul Hisham','AC060214','871118146034','nurulhamizah@live.com','*C1F1ED4900FC863500014C9282D1731F3A5FE0C2','0129448521','200920101'),
 ('Siti Khadijah binti Mohamad','AC060241','870512055400','dieja_80s@yahoo.com','*CE6A9C9146EDD08515697FE5571063DFB31B334E','0166677452','200920101'),
 ('SURAYA BINTI RAZIZI','AC060247','860525296212','suraya_aya8605@yahoo.com','*575B2F588A0A0418693507498F85C02F1F62AA46','0132378605','200920101'),
 ('Tay Poh Ling','AC060261','860829236374','pohling86@gmail.com','*1EC47F80515A1093FBE3074A88294BDF4CCFD1C1','0177379838','200920101'),
 ('TING LEE JANG','AC060267','861221525543','luther0923@gmail.com','*034365FE04E0D502AB4A700A65AA7FA9411BF432','0167798550','200920101'),
 ('WONG JUN WEI','AC060274','860128085091','boyejeihp@gmail.com','*12FE418901804B5037A3922F0E16F64D523A2E5A','0125129749','200920101'),
 ('Zati Aqmar Zahari','AC060289','870808035126','xeitiey@yahoo.com','*EE7CA7616013E1112BA133B3396166A67ECF7E77','0135940545','200920101'),
 ('Anuar bin Yunus','AC070015','880203235773','anuaryunus@gmail.com','*36EAD2F8563967A3F91E48AD79AC89BD7906B493','0137318517','200920101'),
 ('AZIZI SYAHMI BIN AMERAN','AC070021','881220015849','GABAN_T6@YAHOO.COM','*E4813C069D7D100B1FC372F558101E1FADEDAE53','0137946757','200920101'),
 ('Chin Wei Ping','AC070041','870926075313','cw_ping@hotmail.com','*336CC158AF9EDB0986B28986AF87704F3D202829','0143196938','200920101'),
 ('Chong Kong Tat','AC070045','870317526721','ktchong317@hotmail.com','*AF25847FA8A4BE6D37A306D95C4B64A0363AE844','0168739922','200920101'),
 ('DAISY AK MULI','AC070054','880709525292','daisy_muli@yahoo.com','*D7A3E95382CDE6D5FAA4194D51F04233BD939AD2','0145873241','200920101'),
 ('Diyana binti Matnor','AC070055','881227135624','daisuke_daisuki382@yahoo.com','*A8F66D0188DA6156E88BB7A05D63AFE6D1D4D350','0198898945','200920101'),
 ('Gan King Yee','AC070066','871214045049','leng_czai@yahoo.com','*AE37B602F8DBC1161043F83610E734261EFD9F15','0127447773','200920101'),
 ('HENG CHUN KEAT','AC070073','871013015193','heng_ck@yahoo.com.sg','*EF0941347872BD937E524030405E0B98E79686C7','0164933415','200920101'),
 ('HILMI HUSAINI BIN AB AZIZ','AC070074','880615115153','mr.hilmihusaini@gmail.com','*33AD1CBEC600BFA68F0A41835D7DD4E559329E63','0148229826','200920101'),
 ('Jimmy Yong Kui Vun','AC070080','870502125495','insomiadreamer@hotmail.com','*1EA5F074C50D0638E8E0212B7AB72A7F7C4F9462','0195823038','200920101'),
 ('Lee Shiuh Dong','AC070093','860907236573','lsd_210studio@hotmail.com','*F20770BC0BAC29BBE2202F828138E7344A0F8FE8','0177088068','200920101'),
 ('Saw Jin Keat','AC070095','861225145723','saw@hotmail.com','*E6CC90B878B948C35E92B003C792C46C58C4AF40','0162217017','200820092'),
 ('Loo Wen Ching','AC070109','871105085586','reb_loo@yahoo.co.uk','*51880A2D02DE522193982BA84AF7281EF68AAB08','0715217887','200920101'),
 ('LOONG MING CHUN','AC070110','870713085235','batistuta87@gmail.com','*B99FE4A7B952203DB7F9DE0D9F3A597590B2C4BF','0165518868','200920101'),
 ('Low Man Hong','AC070111','870701105059','rx_manhong@hotmail.com','*5F37A1888238AC403768F178A50270AB9EDE7C6F','0123357395','200920101'),
 ('Maizatul Akma Binti Zainal Abidin','AC070114','880222235648','amka_mia88@yahoo.com','*E662E61018222F20E3E4CAC72A913E334DA563BE','0177607692','200920101'),
 ('Mohd faiz bin aman','AC070135','880827115147','mohdfaizaman@gmail.com','*EE1048D78262A2325533068C482CD64B4994F120','0173645658','200920101'),
 ('Mohd Firdaus bin Khalid','AC070137','880428265113','cool_shady88@yahoo.com','*A556CB70C553EDCC606A0A51C76459F85A9015E2','0168124094','200920101'),
 ('Mohd Khairul Bin Yusoff','AC070140','88072295397','keyo_max21@yahoo.com','*A28F9DA361254E492E7230F84F975AFA54632BEB','0137318654','200920101'),
 ('MUTHUKUMAR KALIMUTHU','AC070156','870215025387','payyum_puli@yahoo.com','*B23A11EFBB9B1A51A61733D8F06D8548539A6735','0174499821','200920101'),
 ('ng see kiat','AC070163','871125065291','bizzare_wu@hotmail.com','*89053356AEA539E1AE2E25DF02E28D9BB464B01B','0127432219','200920101'),
 ('Ngeaw Kam Wah','AC070164','870725085603','kwngeaw@hotmail.com','*8C3B66457967C094EE0857D215903F67FFFF1174','0125510075','200920101'),
 ('Nicholas Lee Chan Lock','AC070166','871112385077','jiggyless_ziggy@hotmail.com','*7A7EBD8FBA648865873C1A55B20D7B0B3CF1777D','0165026638','200920101'),
 ('Nur Syamimi binti Mohd Izwan Wasandan','AC070193','880310015768','groovey103gal@yahoo.com','*F0102E4E1B917AECA79C1E49F926D9076E21031C','0173297970','200920101'),
 ('Nurul Atikah Binti Masduki','AC070199','880315015206','nurulatikah153@yahoo.com','*CA43FCA5310E88843CB0BA894F0FD118FA550548','0137318513','200920101'),
 ('Nurul Nadzriah binti Abd.Latip','AC070204','880815015018','mentolbulb_naz@yahoo.com','*969DF79C9D900475F2B2360A7C1A25C9C98B0D21','0177397043','200920101'),
 ('Pang Min Lim','AC070209','870917085253','minlim87@yahoo.com','*87FC95E101FD6AF78977638266EF88A7500E5393','0165941862','200920101'),
 ('Rose Sabrina Binti Md Tajuddin','AC070219','880409125676','rosesabrina88@yahoo.com','*A9B0AAD136F8C2B64629D39904840D280B6C1AC9','0168040189','200920101'),
 ('SAHIDATUL FARIZA BTE MAHAMOD SARKONI','AC070222','880109015520','sahidafariza@yahoo.com','*CFF06BAC0C2C2CC2FBFD05AEB404D4DA48629ECD','0137017015','200920101'),
 ('shahirul azlimi b. mohamad','AC070229','880312115885','sam_312@ymail.com','*187252EE6070DB14E724FEA605C918E4455E0FD5','0139759721','200920101'),
 ('Sia Bee Chin','AC070235','881021016128','haiibc@yahoo.com','*6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9','0167821801','200920101'),
 ('Siew Li Meng','AC070237','871113055416','narcissus_lm@hotmail.com','*E12415766A7AC40E60D9F45D6D00284E3DD27DD4','0173037637','200920101'),
 ('SITI AISHAH BTE SAMAD','AC070238','880606235014','sha_ahs0606@yahoo.com','*56401184878789BCFE35D68B59838B29C372D8CF','0137024460','200920101'),
 ('Siva Shangari Pandian','AC070248','870627385020','shankz_2706@yahoo.com','*875766795A9482C92966921256E93E7CAE322DF7','0175373353','200920101'),
 ('subithra devendra','AC070252','870519235500','lyithika_87@yahoo.com','*16BABAE1B3DEDAF65FD56FB385E076B5709B5C32','0167839401','200920101'),
 ('Tan Chee Hou','AC070258','871027435885','tancheehou@hotmail.com','*7440EE26495E45E1EDE80CD63F8B778725D66945','0173951227','200920101'),
 ('Teoh Joo Huat','AC070268','870811355251','sunny_teoh87@hotmail.com','*CD96CC9F7E6D921BD249B3E40082B8D00F26FEE0','0164655433','200920101'),
 ('We Chee Siong','AC070275','871123055209','cswe_87@msn.com','*23AA1D32408ACB244A1749E522DE1B5A6DAECAD1','0176040654','200920101'),
 ('Wong Choung Zhi','AC070277','870630526277','garfieldzhi1987@hotmail.com','*819DF0BABC01ED84DA52BBDAE1976B380F70FEF6','0168528936','200920101'),
 ('Wong Li Hwa','AC070279','870925055484','wong_eva2004@yahoo.com','*9A263F6B65D6B7B3DEB3407DB76626767FE4B3D5','0122581025','200920101'),
 ('Wong Lih Fong','AC070280','870616025847','wyzwong@yahoo.com','*7108EC86F7F3AFEE0FC20F9BF58D7A6E1C18B4D9','0125692480','200920101'),
 ('Elvira Soufyani Rosanty','AC070295','P196480','veera_purpleberry@yahoo.com','*6C189CAB1794DD012ABFEC15CA7E66ED02274056','0177243754','200920101'),
 ('Jerfareza Daviano','AC070317','P633882','jerfareza_d@hotmail.com','*74A55BFB7F65631F4568A906850607D4F9A23362','0167754713','200920101'),
 ('Balwinder Singh Sathar','AC070334','880902085313','balwin.singh@gmail.com','*AC81B57C9F6D1708D8967988781D9B8CE8373377','0175040678','200920101'),
 ('ALAN TAN WAI LOON','AC070335','881102055057','lov_teddy@yahoo.com.sg','*57F862069863A1C43B344982E4416743B7FCBD93','0169168319','200920101'),
 ('Wendy Lim','AC070405','871209235390','wendy_lim_87@yahoo.com','*CEA6F888258FE801879503684CD4571F74F5C0C0','0167927800','200920101'),
 ('LIEW MEE CHEE','AC070408','870227015186','miki.chee@gmail.com','*DFD7B8E6ACB7A10650FB259EDD81F369F6FB7EE7','0127923969','200920101'),
 ('Ahmad Nazif Bin Abdullah','AC073052','860207085575','ahmadnazif@gmail.com','*96023EFB05F8E39DCF85526E542CCCDDCDEBE47C','0124614961','200920101'),
 ('AHMAD SYAHRUL ANUAR BIN SAIDI','AC073054','860105115307','monomods@yahoo.com','*323BFB62AD623488AED8EFA68B4CFE82BB4340C4','0199849274','200920101'),
 ('AHMAD ZAIRI BIN AZHAR','AC073055','851120145665','tali_leher@yahoo.com','*CEE6D4633880FB23BE49A9521108D32CFD732919','0166826007','200920101'),
 ('DZAIROL ADZRIEM BIN DIN','AC073061','861021095075','dzairol_adz86@yahoo.com','*892DACAACE75E5A44F46F3A2D73BAB1C06072D94','0125935549','200920101'),
 ('DZIDATUL AKMA BINTI DZULKAFLI','AC073062','860118435254','akem_akhis@yahoo.com','*168E69A4F8037757D0E5AFA6FED8E855384C2DC2','0129432889','200920101'),
 ('FARHANA BT FAUZI','AC073064','860717386132','miszfana@yahoo.com','*C09B06A3B3CDD2B8B3D539FBE438DD4BEC10C133','0125932664','200920101'),
 ('izain nurfateha binti ruzan','AC073066','860923565174','aienruzan@gmail.com','*E747AEE5CB6B2CA80BDA891FE12838909B4DED07','0193469913','200920101'),
 ('khairiah bt maasom','AC073069','860222035138','yna_mm07@yahoo.com','*4A6F7982DA9641BF54407944583CD519FCFCA44F','0172442869','200920101'),
 ('MOHD FAZLI BIN HASHIM','AC073081','860922236459','fazli.karkun@gmail.com','*3CAC0CD7BBDF931893ADD4DFE6BE8C62FD4897D9','0167200613','200920101'),
 ('MOhd Hafiz Abd Rahim','AC073084','841123085259','dhomhafiz@yahoo.com','*49622B4405349C2B14A46CD501FFFD850601FF3B','0197860823','200920101'),
 ('NILAM NUR BINTI AMIR SJARIF','AC073094','860214565526','nilamnini@gmail.com','*F1BE1018EC697E0BCCC34F68B1B27E120E2E36F3','0172027071','200920101'),
 ('Noraini Binti Mohd Kair','AC073098','850427035570','norai_0427@yahoo.com','*5018C711481E1504184F51D85D9515D47C8EBE7D','0133290127','200920101'),
 ('Nurul Ain','AC073109','860513386704','nurul.ain.ariffin@gmail.com','*EB5E48B9CA6507135D5462668758DE23FF7A5953','0173458352','200920101'),
 ('Saidatul Hafiza Bt Abd Kadir','AC073115','861130435454','fiezakadir@gmail.com','*64255F3DB05CD89381AAAC9E8EEF81B1678EDF8B','0192194103','200920101'),
 ('siti norlizan binti mat yusoff','AC073120','850908016784','liezan_amr85@yahoo.com','*33833F860A9026E05C1D496F74CE0558FED5B582','0177489648','200920101'),
 ('syahirnazifi bin nasaruddin','AC073125','860709566141','sukhoi07@gmail.com','*28468432983F0BCD3F9310A479F88E462985B008','0124354358','200920101'),
 ('Zulfahdlina Binti Jamel','AC073129','861226435256','zuljamel86@gmail.com','*636692A8A8866BCE477CBAA42AA4DA1C5E114A5B','0126895646','200920101'),
 ('Hasnol Ariff bin Hussin','AC080330','871211115697','a_riff87@yahoo.com','*8D596458D5625983F349CDFFB11544200755BC5D','0129008957','200920101'),
 ('JULIA BINTI JUHARI','AC080331','850601065418','jue_hippousmy@yahoo.com','*E6BD3934BF336C3AD89FB04360481865A035A708','0129079014','200920101'),
 ('MOHAMED JOHARI BIN HARITH','AC080333','870706085667','johari.harith@gmail.com','*A663258ADDD0F88E8D7EE5451EF3E9B3A7C32B52','0123889434','200920101'),
 ('Mohd Shahrol Bin Mohamed Nasaruddin','AC080335','871101115469','mshahrol2@gmail.com','*882EAEFBBF5773A705C20883E60AC1EDAC6F30A1','0179636487','200920101'),
 ('Muhamad Bukhairi Bin Samsudin','AC080336','861009295875','bukhairi_mpputm@yahoo.com','*9AAF2CC13688F3F1F905D9D83B64900CEEC8404E','0133532833','200920101'),
 ('NIRMA YUSNANI BINTI MAT YUSOH','AC080337','860817465196','yusnaninirma@yahoo.com','*448519E4822E704DFABBD1A5C14FA500E3C07A62','0137913196','200920101'),
 ('NOOR SHIQIM BINTI MOHD SALLEH','AC080338','871017435224','sparxx7@gmail.com','*F3B6C7937502F2E1FFC0C1804EEBCFC95339EE32','0132222479','200920101'),
 ('Noordiana Binti Mhd Ghazali','AC080340','870208355310','dianekewl@yahoo.com','*2ECCADCD7F24EA34964808C961EEE1B6D8903B98','0132119024','200920101'),
 ('NOORIDAYU BINTI NORDIN','AC080341','870701015424','idayu_cute87@yahoo.com','*FF3736593483E0F33A0D30723EC6B8F2172CDC8F','0127784377','200920101'),
 ('NOR IZZATI BINTI ALI','AC080342','870326105566','pr_izzati@yahoo.com','*F551E3018E88C7C68DF1C8A5C167A5503CFBC569','0173007928','200920101'),
 ('NUR AINI BINTI ABD WAHAB','AC080344','871030145416','mutsumiaini_12@yahoo.com','*A8E694A63F701D97F7A244260494F7E22EF4CB91','0129316874','200920101'),
 ('NUR ARIKAH BINTI BUDIMAN','AC080345','860618115038','miq_rika@yahoo.com','*8746832A9EC5AE020A43B61780302D14ADA28340','0197621415','200920101'),
 ('Nur Azimah Binti Che Husin','AC080346','870303086040','nurazz_encho03@yahoo.com','*9194437561C92EA9D6DEDD31951FE0794159007C','0132222513','200920101'),
 ('NURAZNEEN BINTI YAACOB','AC080348','861230155038','asz986@yahoo.com','*E6CC90B878B948C35E92B003C792C46C58C4AF40','0133531298','200920101'),
 ('Nurul Azlia binti Azizi','AC080349','871024145532','liya.comel@yahoo.com','*6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9','0137750731','200920101'),
 ('NURULJANNAH BTE UMAR','AC080350','870831235548','nurul_firnah87@yahoo.com','*759655F1E57C672D71A0DB0CC05770D42359F1A0','0132734387','200920101'),
 ('Siti Muslihah binti Md Gapar','AC080352','870620045066','ctmus87_cute@yahoo.com.au','*8B2BC25100151BF9683AD3AFBA595EC16E257A6A','0132517480','200920101'),
 ('Zaila Bt Kamisan','AC080354','870407235258','lavindastarz@yahoo.com','*E7E4394D249D5EF770782B477CDA60AA4E02077A','0137342743','200920101'),
 ('ZULKARNAIN BIN AZHAM','AC080355','860410595095','zulkarnain.azham@gmail.com','*AF7BBFCA6035EF3724B90B22AFD10F5DA894500A','0132224189','200920101'),
 ('Mohd Faris Bin Ismail','AC080432','870912146045','mfar1512@gmail.com','*5721D9AC507065AC9D6A1D6DFCF4E04699E0C30F','0129497094','200920101'),
 ('Nor Haslindah Binti Zaini','AC080434','870830045048','haslindah87@gmail.com','*83AAC1FCE34DBED6E1F2517E6E2D9AE263C6B25F','0132222504','200920101'),
 ('SHARIFFAH NORHAFIDA BT SAID HAMID','AC080435','870219295632','hafida_mia@yahoo.com','*2BB7DC877B3CB8B078AC6FFBAD6541E35CB28E7F','0179613989','200920101'),
 ('Hishammuddin Test','AC735110','720213015579','hishamasmuni@gmail.com','*94BDCEBE19083CE2A1F959FD02F964C7AF4CFC29','0167178314','200920101');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;


--
-- Definition of table `supervision_marks_psm1`
--

DROP TABLE IF EXISTS `supervision_marks_psm1`;
CREATE TABLE `supervision_marks_psm1` (
  `metricNo` varchar(20) NOT NULL,
  `gantt` varchar(20) NOT NULL,
  `kebolehan` varchar(20) NOT NULL,
  `daya` varchar(20) NOT NULL,
  `kekerapan` varchar(20) NOT NULL,
  `peningkatan` varchar(20) NOT NULL,
  `keberkesanan` varchar(20) NOT NULL,
  `peranan` varchar(20) NOT NULL,
  `formet` varchar(20) NOT NULL,
  `abstrak` varchar(20) NOT NULL,
  `objektif` varchar(20) NOT NULL,
  `analisis` varchar(20) NOT NULL,
  `kajian` varchar(20) NOT NULL,
  `metodologi` varchar(20) NOT NULL,
  `kesimpulan` varchar(20) NOT NULL,
  `rujukan` varchar(20) NOT NULL,
  `lampiran` varchar(20) NOT NULL,
  `persembahan` varchar(20) NOT NULL,
  `ayat` varchar(20) NOT NULL,
  `gambarajah` varchar(20) NOT NULL,
  `total` varchar(20) NOT NULL,
  `komen` text NOT NULL,
  PRIMARY KEY (`metricNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supervision_marks_psm1`
--

/*!40000 ALTER TABLE `supervision_marks_psm1` DISABLE KEYS */;
INSERT INTO `supervision_marks_psm1` (`metricNo`,`gantt`,`kebolehan`,`daya`,`kekerapan`,`peningkatan`,`keberkesanan`,`peranan`,`formet`,`abstrak`,`objektif`,`analisis`,`kajian`,`metodologi`,`kesimpulan`,`rujukan`,`lampiran`,`persembahan`,`ayat`,`gambarajah`,`total`,`komen`) VALUES 
 ('AC060117','3.00','2.00','2.00','1.00','1.00','1.00','5.00','5.00','3.00','5.00','5.00','5.00','6.00','2.00','1.00','3.00','4.00','4.00','1.80','59.80','   grg\''),
 ('AC070095','3.00','2.00','2.00','1.00','1.00','1.00','5.00','5.00','3.00','5.00','5.00','5.00','6.00','2.00','1.00','3.00','4.00','4.00','2.00','60.00','f');
/*!40000 ALTER TABLE `supervision_marks_psm1` ENABLE KEYS */;


--
-- Definition of table `supervision_marks_psm2`
--

DROP TABLE IF EXISTS `supervision_marks_psm2`;
CREATE TABLE `supervision_marks_psm2` (
  `metricNo` varchar(10) NOT NULL DEFAULT '',
  `panduan` varchar(20) NOT NULL,
  `skop` varchar(20) NOT NULL,
  `teknologi` varchar(20) NOT NULL,
  `komersial` varchar(20) NOT NULL,
  `persembahan` varchar(20) NOT NULL,
  `ayat` varchar(20) NOT NULL,
  `gambarajah` varchar(20) NOT NULL,
  `kajian` varchar(20) NOT NULL,
  `teknik` varchar(20) NOT NULL,
  `fakta` varchar(20) NOT NULL,
  `keterperincian` varchar(20) NOT NULL,
  `total` varchar(20) NOT NULL,
  `komen` text NOT NULL,
  PRIMARY KEY (`metricNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supervision_marks_psm2`
--

/*!40000 ALTER TABLE `supervision_marks_psm2` DISABLE KEYS */;
/*!40000 ALTER TABLE `supervision_marks_psm2` ENABLE KEYS */;


--
-- Definition of table `supervision_phase1_psm2`
--

DROP TABLE IF EXISTS `supervision_phase1_psm2`;
CREATE TABLE `supervision_phase1_psm2` (
  `metricNo` varchar(10) NOT NULL DEFAULT '',
  `gantt` varchar(20) NOT NULL,
  `kebolehan` varchar(20) NOT NULL,
  `daya` varchar(20) NOT NULL,
  `kekerapan` varchar(20) NOT NULL,
  `peningkatan` varchar(20) NOT NULL,
  `keberkesanan` varchar(20) NOT NULL,
  `total` varchar(20) NOT NULL,
  `komen` text,
  PRIMARY KEY (`metricNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supervision_phase1_psm2`
--

/*!40000 ALTER TABLE `supervision_phase1_psm2` DISABLE KEYS */;
/*!40000 ALTER TABLE `supervision_phase1_psm2` ENABLE KEYS */;


--
-- Definition of table `supervision_phase2_psm2`
--

DROP TABLE IF EXISTS `supervision_phase2_psm2`;
CREATE TABLE `supervision_phase2_psm2` (
  `metricNo` varchar(10) NOT NULL DEFAULT '',
  `gantt` varchar(20) NOT NULL,
  `kebolehan` varchar(20) NOT NULL,
  `daya` varchar(20) NOT NULL,
  `kekerapan` varchar(20) NOT NULL,
  `peningkatan` varchar(20) NOT NULL,
  `keberkesanan` varchar(20) NOT NULL,
  `total` varchar(20) NOT NULL,
  `komen` text,
  PRIMARY KEY (`metricNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supervision_phase2_psm2`
--

/*!40000 ALTER TABLE `supervision_phase2_psm2` DISABLE KEYS */;
/*!40000 ALTER TABLE `supervision_phase2_psm2` ENABLE KEYS */;


--
-- Definition of table `supervisor`
--

DROP TABLE IF EXISTS `supervisor`;
CREATE TABLE `supervisor` (
  `staffNo` varchar(50) NOT NULL,
  `metricNo` varchar(20) NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  `semester` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supervisor`
--

/*!40000 ALTER TABLE `supervisor` DISABLE KEYS */;
INSERT INTO `supervisor` (`staffNo`,`metricNo`,`status`,`semester`) VALUES 
 ('7351','AC060117','Approved','200820092'),
 ('7351','AC070095','Approved','200820092'),
 ('6838','AC070163','Approved','200920101'),
 ('6749','AC080434','Approved','200920101'),
 ('7351','AC070280','Approved','200920101'),
 ('7351','AC070268','Approved','200920101'),
 ('6749','AC080346','Approved','200920101'),
 ('7351','AC735110','Approved','200920101'),
 ('7351','AC070237','Approved','200920101'),
 ('7351','AC070235','Approved','200920101'),
 ('7351','AC070405','Approved','200920101'),
 ('10650','AC080344','Approved','200920101'),
 ('2135','AC070277','Approved','200920101'),
 ('7801','AC070248','Approved','200920101'),
 ('2157','AC070279','Approved','200920101'),
 ('6838','AC070238','Approved','200920101'),
 ('7801','AC070252','Approved','200920101'),
 ('2157','AC070335','Approved','200920101'),
 ('7801','AC070054','Approved','200920101'),
 ('6838','AC070222','Approved','200920101'),
 ('2157','AC073129','Approved','200920101'),
 ('7352','AC070015','Approved','200920101'),
 ('7352','AC070140','Approved','200920101'),
 ('7019','AC070074','Approved','200920101'),
 ('10054','AC060154','Approved','200920101'),
 ('7351','AC000001','Approved','200920101'),
 ('2157','AC073081','Approved','200920101'),
 ('2157','AC073098','Approved','200920101'),
 ('10054','AC060261','Approved','200920101'),
 ('10054','AC060056','Approved','200920101'),
 ('7351','AC060022','Approved','200920101'),
 ('6838','AC070164','Approved','200920101'),
 ('5419','AC080331','Approved','200920101'),
 ('2135','AC070166','Approved','200920101'),
 ('10054','AC060274','Approved','200920101'),
 ('10054','AC060030','Approved','200920101'),
 ('7801','AC070045','Approved','200920101'),
 ('7019','AC080336','Approved','200920101'),
 ('6838','AC080352','Approved','200920101'),
 ('7352','AC070229','Approved','200920101'),
 ('5160','AC080355','Approved','200920101'),
 ('2586','AC070204','Approved','200920101'),
 ('2586','AC070055','Approved','200920101'),
 ('5419','AC080350','Approved','200920101'),
 ('2586','AC070295','Approved','200920101'),
 ('10054','AC060038','Approved','200920101'),
 ('5501','AC070080','Approved','200920101'),
 ('4724','AC080345','Approved','200920101'),
 ('7903','AC070275','Approved','200920101'),
 ('6749','AC060065','Approved','200920101'),
 ('2586','AC080337','Approved','200920101'),
 ('10650','AC080340','Approved','200920101'),
 ('8096','AC060084','Approved','200920101'),
 ('6838','AC073094','Approved','200920101'),
 ('7352','AC070135','Approved','200920101'),
 ('7331','AC070021','Approved','200920101'),
 ('6838','AC073062','Approved','200920101'),
 ('10650','AC080342','Approved','200920101'),
 ('7019','AC080335','Approved','200920101'),
 ('2586','AC080435','Approved','200920101'),
 ('7019','AC080330','Approved','200920101'),
 ('7331','AC080333','Approved','200920101'),
 ('10650','AC080348','Approved','200920101'),
 ('7801','AC070109','Approved','200920101'),
 ('7801','AC070156','Approved','200920101'),
 ('1898','AC073052','Approved','200920101'),
 ('5501','AC073055','Approved','200920101'),
 ('6838','AC080341','Approved','200920101'),
 ('6749','AC080349','Approved','200920101'),
 ('7903','AC070066','Approved','200920101'),
 ('7903','AC080432','Approved','200920101'),
 ('7903','AC070209','Approved','200920101'),
 ('7801','AC070111','Approved','200920101'),
 ('5501','AC070041','Approved','200920101'),
 ('4724','AC060004','Approved','200920101'),
 ('6838','AC073109','Approved','200920101'),
 ('10054','AC060086','Approved','200920101'),
 ('10054','AC060267','Approved','200920101'),
 ('1898','AC073069','Approved','200920101'),
 ('7019','AC070137','Approved','200920101'),
 ('6749','AC060107','Approved','200920101'),
 ('6749','AC060063','Approved','200920101'),
 ('6749','AC060091','Approved','200920101'),
 ('10054','AC060039','Approved','200920101'),
 ('5501','AC070110','Approved','200920101'),
 ('8096','AC060176','Approved','200920101'),
 ('5501','AC070093','Approved','200920101'),
 ('10650','AC080354','Approved','200920101'),
 ('8096','AC060214','Approved','200920101'),
 ('4724','AC073125','Approved','200920101'),
 ('6838','AC070193','Approved','200920101'),
 ('7801','AC070334','Approved','200920101'),
 ('7351','AC060071','Approved','200920101'),
 ('8063','AC060179','Approved','200920101'),
 ('8096','AC060161','Approved','200920101'),
 ('7903','AC070258','Approved','200920101'),
 ('8096','AC060032','Approved','200920101'),
 ('8096','AC060289','Approved','200920101'),
 ('8096','AC060241','Approved','200920101'),
 ('8096','AC060053','Approved','200920101'),
 ('4724','AC073084','Approved','200920101'),
 ('2586','AC073120','Approved','200920101'),
 ('2586','AC073115','Approved','200920101'),
 ('2157','AC073066','Approved','200920101'),
 ('8063','AC060247','Approved','200920101'),
 ('7331','AC070199','Approved','200920101'),
 ('7331','AC070219','Approved','200920101'),
 ('5160','AC070073','Approved','200920101'),
 ('6838','AC070114','Approved','200920101'),
 ('6749','AC080338','Approved','200920101');
/*!40000 ALTER TABLE `supervisor` ENABLE KEYS */;


--
-- Definition of table `title`
--

DROP TABLE IF EXISTS `title`;
CREATE TABLE `title` (
  `proTitle` varchar(255) NOT NULL,
  `bgProblem` text NOT NULL,
  `objective` text NOT NULL,
  `scope` text NOT NULL,
  `proType` text NOT NULL,
  `proField` text NOT NULL,
  `softSpecification` text NOT NULL,
  `hardware` text NOT NULL,
  `technology` text NOT NULL,
  `metricNo` varchar(20) NOT NULL,
  `status` varchar(60) NOT NULL,
  `semester` varchar(45) NOT NULL,
  `proID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `evaluator` varchar(45) DEFAULT NULL,
  `comment` text,
  `title_flag` varchar(1) NOT NULL,
  PRIMARY KEY (`proID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `title`
--

/*!40000 ALTER TABLE `title` DISABLE KEYS */;
INSERT INTO `title` (`proTitle`,`bgProblem`,`objective`,`scope`,`proType`,`proField`,`softSpecification`,`hardware`,`technology`,`metricNo`,`status`,`semester`,`proID`,`evaluator`,`comment`,`title_flag`) VALUES 
 ('PSM Sistem','a\r\nb\r\nc\r\nd','1.\r\n2.\r\n3.\r\n','jojojoj','softDev','SED01','   jojjojojo \'\'  ','   jjooj','   jjojojo','AC060117','Conditional Approval (Minor)','200820092',19,'4724','ppp\'\'','Y'),
 ('Web Based conferencing','jfejfijo','jjojjo','jojojoj','softDev','SED02','  jo','fef',' jjjojo','AC070095','Full Approval','200820092',20,'1898','\'\'','Y'),
 ('The Comparative Study Of Genetic Algorithm And Tabu Search For Solving University Course Timetabling Problem','The university course timetabling problem represents a coordination of the lecturer, facility and time resources subjects to certain institutional requirements.  The task  to assign the qualified lecturer to carry each subject in a proper room, such as allocating a lecture hall for a class of large number of students and a pc lab for computer science students. Despite of this, clash-free timetable is always another main requirement in the timetable solution generated. The clash happens when a lecturer being scheduled to give lecture for more than one class at the same time slot or, two subjects are allocated at the same periods of time for students. The above is considered as the hard constraints of the timetabling problem. We also need to take into consideration of the soft constraint, such as to reduce the gap between the classes. By this, students can have a more continuous schedule without spending much time on waiting for their next class.  \r\nMany researches had been done previously but the timetabling problems still exist. Therefore, more researches need to be carried out in order to find a more effective algorithm to solve the university course timetabling problems. In this research project, two approaches will be studied and implemented, which are Genetic Algorithm and Tabu Search. These two approaches will be compared in term of its performance in solving the university course timetabling problem.','i.   To study on Genetic Algorithm and Tabu Search. \r\nii.  To analyze the university timetabling data and represent them using appropriate Genetic Algorithm techniques and Tabu search. \r\niii. To compare between the performance of Genetic Algorithm and Tabu Search.\r\n','i.   The data used is based on a universities course timetabling Benchmark dataset.\r\nii.  Hard constraint: Due to the limitation of the room, the total number of students cannot be exceeded, clash free timetable.\r\niii. Soft constraint: The free time-slot between two classes should be minimized for students.\r\n','research','SED02','Java Programming, NetBeans IDE 6.1, Microsoft Office 2007           ','Compac Preario V3000 Intel(R) Core(TM) 2 Duo CPU T5450 @ 1.66GHz  1.67GHz','Genetic Algorithm, Tabu Search ','AC070237','Pending','200920101',21,NULL,NULL,'Y'),
 ('Online Personal Organizer For FSKSM UTM','Owing to the development of Information Technology, diary usage has been computerized for a better performance to its users. However, the existing systems are still under incomplete or insufficient of its efficiency. Therefore, a complete and better system should be implemented to replace the existing system to fulfill usersâ?? demands. In this case, the new system will be implemented in FSKSM and available for everyone who involved in FSKSM such as students, lecturers and staffs. Scheduling System for lecture room in FSKSM has showed its effective function to everyone and hence this kind of system should be extended for the personal usage of the users. For example, if a student would like to know the schedule of other students or lecturers to determine their free time for an appointment, this system will be helpful to overcome the issue. When you know when everyone is free or busy, scheduling is a snap. In order to accomplish that, an Online Personal Organizer should be designed with plenty of features to support the system to become a reliable organizer for users. \r\nThe system is used for academic purpose so that the users can modify their study or academic timetable in this system just like a diary and post it online for public sharing. It means that users of the system can view the timetable of other users to ensure their daily schedule or free time.  System implements real time data and it means that system will show the date and time when users login and users will be allowed to modify future timetable but not the past. Hence, past schedule will be kept as records for tracing or reference later. Friend list features and reminder feature for certain events based on usersâ?? demands also will be provided for every user as well. In this case, limited accessibility will be assigned to the system. It means that user can choose to categorize certain events as accessible by public, friends only or self only. This system utilizes lots of data management for user or events searching, schedule or free time compare process and filter for certain events. Since the system is a web-based system and internet connection is required to execute this system, a copy of timetable can be downloaded and printable for offline scheduling so that users will know where they are supposed to be even when they don\'t have internet access. There is a communication channel provided for users so that they can send private message to everyone and can send invitations for appointments to other users and automatically scheduling will be assigned by the system to add the event into the timetable if invitation is approved.\r\n','1)	To study the usage of a existing calendar system and its benefit for the users \r\n2)	To design a complete Online Personal Organizer to replace the manual diary or old calendar system\r\n3)	To test the outcome and responses of the users for using the Online Personal Organizer \r\n','-	Users : anyone involved in FSKSM UTM only such as students, lecturers, staffs (precondition : they must register an account first)\r\n-	Privacy protection and data security will be applied in this system\r\n-	It is a web-based system and it means internet connection and browser are required for using the system\r\n','softDev','SED01','NetBeans IDE 6.5, Microsoft Office 2007 (Word, PowerPoint, Excel, Projectâ?¦.), Macromedia Dreamweaver MX 2004, Enterprise Architecture 7.0','Personal Computer / Laptop, Printer','Data Management (search data, filter data, real time data, scheduling), Internet Programming (JSP/HTML/JDBC)','AC070268','Pending','200920101',22,NULL,NULL,'Y'),
 ('SISTEM PENTERJEMAHAN DATA MENTAH RADAR UNTUK BAHAGIAN RADAR, JABATAN METEOROLOGI MALAYSIA','Radar telah digunakan oleh Jabatan Meteorologi Malaysia sejak sekian lama untuk mengesan kedudukan awan hujan dan memberikan amaran ribut. Di Malaysia, terdapat 10 buah stesyen radar meteorologi iaitu 6 di Semenanjung Malaysia, 2 di Sabah dan 2 di Sarawak.\r\nImej dan data mentah(raw data) yang diperoleh daripada pencerapan radar-radar ini boleh digunakan untuk mengira jumlah hujan bagi sesuatu kawasan. Namun data-data ini diterima dalam bentuk kod yang sukar difahami. Kod ini perlu diterjemah secara manual oleh pegawai yang mengendalikan radar tersebut. Untuk menterjemahkan kod-kod ini, pegawai tersebut terpaksa merujuk kepada beberapa jadual dalam bentuk tatasusun 2 dimensi. Cara ini agak memakan masa dan kadang kala pegawai tersebut mungkin boleh melakukan kesilapan semasa menterjemahkan data tersebut.\r\nUntuk mengetahui jumlah taburan hujan bagi sesuatu kawasan pula, pegawai tersebut perlu melihat imej-imej radar. Setakat ini masih belum ada penunjuk digital yang secara automatik dapat menunjukkan nilai taburan hujan yang tepat. Cara yang digunakan adalah dengan merujuk pada imej radar berdasarkan kod warna dan dimasukkan ke dalam aplikasi seperti Microsoft Excel. Selain itu juga, pegawai itu juga perlu menentukan secara manual kedudukan radar terdekat dengan kawasan yang perlu dikira taburan hujannya.\r\n    Data-data yang dicerap oleh radar-radar ini adalah amat penting memandangkan data ini boleh digunakan untuk mengkaji cuaca di Malaysia. Cara manual yang digunakan kini adalah kurang sesuai dengan peredaran masa yang memerlukan teknologi yang pantas, tepat dan efisyen. Oleh itu sistem baru perlu dibangunkan.','1) Mengkaji sistem yang ingin dibangunkan.\r\n2) Mereka bentuk dan membina sistem.\r\n3) Menguji sistem yang telah dibangunkan.','Projek ini dibangunkan untuk Bahagian Radar, Jabatan Meteorologi Malaysia yang berpusat di Ibu Pejabat Jabatan Meteorologi Malaysia Petaling Jaya.','softDev','SED01','  NetBeans IDE',' Komputer',' Java Application\r\n Mysql database','AC080344','Pending','200920101',23,NULL,NULL,'Y'),
 ('Penyelidikan Bagi Mengenalpasti Interaksi Terbaik Antara Golongan Kurang Upaya Dengan Komputer','Kehilangan anggota badan atau lumpuh banyak menghalang seseorang inidividu itu untuk menjalani \r\nkehidupan seharian seperti individu biasa. Individu ini tidak dapat melakukan aktiviti-aktiviti kecergasan\r\nmalah mereka juga tidak dapat berinteraksi dengan persekitaran. Penggunaan komputer pada masa kini\r\nadalah sesuatu yang penting dan digunakan secara meluas memandangkan komputer merupakan salah\r\nsatu peranti yang dapat menghubungkan kita dengan dunia luar. Golongan ini tidak terkecuali untuk\r\nmenggunakannya. Interaksi antara individu ini dengan komputer merangkumi  dari segi pembacaan, \r\npenulisan, mendengar dan bermain permainan video yang ringkas dan mudah.\r\n\r\nOleh itu, kajian ini adalah untuk mengetahui kaedah atau langkah yang terbaik untuk \r\nmembantu golongan orang kurang upaya untuk berinteraksi dengan komputer.\r\n','1.Mengkaji kaedah yang terbaik untuk    \r\n  membantu golongan kurang upaya.\r\n2.Menilai kelebihan dan kekurangan \r\n  kaedah yang sedia ada.\r\n3.Sebagai persediaan untuk PSM II dalam \r\n  membina permodelan dan simulasi. \r\n','1.Projek kajian ini akan hanya mengkaji \r\n  kaedah yang terbaik untuk \r\n  dilaksanakan.\r\n2.Kajian projek ini akan dijalankan di \r\n  Fakulti Sains Komputer dan Sistem \r\n  Maklumat (FSKSM),Universiti Teknologi \r\n  Malaysia','research','SED01','ProModel',' ',' ','AC080340','Pending','200920101',24,NULL,NULL,'Y'),
 ('PEMBANGUNAN PERISIAN KERUSI RODA PINTAR MENGGUNAKAN PENJANAAN KOD RHAPSODY','Setiap pembangunan sistem akan melalui peringkat reka bentuk. Dalam pembinaan perisian kerusi roda pintar, pereka memerlukan sebuah sistem yang mengaplikasikan masa nyata. Permasalahan sistem yang memerlukan masa nyata mestilah memodulkan dahulu sistemnya bagi mendapatkan masa reaksi yang persis seperti perkakasan itu di programkan. Perisian masa nyata haruslah juga selamat dan mampu membuat kawalan yang sejajar. \r\nMaka perisian Rhapsody digunakan bagi melaksanakan peringkat reka bentuk ini. Perisian Rhapsody merupakan peralatan CASE yang membantu menyediakan penjanaan kod untuk memudahkan implementasi di mana perisian ini mampu untuk menjana kod dari rajah reka bentuk yang telah di reka. Perisian Rhapsody juga mempunyai komponen UML Ã¢?? masa nyata bagi mereka bentuk rajah sistem pada perkakasan. Oleh itu, bahasa pengaturcaraan yang paling sesuai adalah bahasa C. Perisian Rhapsody ini sememangnya menyokong bahasa pengaturcaraan C maka sesuai untuk pembangunan perisian kerusi roda pintar ini. Di dalam pembangunan perisian kerusi roda pintar ini perisian Rhapsody dikaji untuk melihat sejauh mana boleh diimplemen terus kepada perkakasan iaitu sebuah kerusi roda pintar. Kerusi roda pintar telah dipilih untuk diimplementasi terus dari penjanaan kod Rhapsody kerana ia mewakili sebuah sistem masa nyata dan menggunakan perisian terbenam. Selain itu juga, kerusi roda pintar ini melibatkan pemodelan dan analisis sistem masa nyata.\r\n','-	Memodulkan keperluan kerusi roda pintar\r\n-	Membuat simulasi ke atas kerusi roda pintar\r\n-	Memprogramkan perisian untuk kerusi roda pintar\r\n-	Implemen kod yang dijana Rhapsody ke atas perkakasan kerusi roda pintar.','-	Untuk menguji kemampuan perisian Rhapsody versi 6.0 dalam pembangunan perisian kerusi roda pintar.\r\n-	Untuk memprogramkan perisian kerusi roda pintar dengan menggunakan bahasa pengaturcaraan C.\r\n-	Untuk membina perisian kerusi roda yang dijana terus menggunakan Rhapsody selepas memodulkannya\r\n','softDev','SED01',' Rhapsody versi 6.0, bahasa pengaturcaraan C ',' kerusi roda pintar','  ','AC070021','Pending','200920101',25,NULL,NULL,'Y'),
 ('Sistem Pengurusan Pemilihan Majlis Perwakilan Pelajar UTM Berasaskan    Teknologi GSM.','Pilihanraya atau pengundian merupakan satu elemen yang sangat penting dalam memilih pemimpin untuk menerajui sesebuah organisasi.Di universiti, pilihanraya dijalankan untuk memilih Perwakilan Pelajar yang akan mewakili pelajar bagi menentukan hala tuju sesebuah organisasi  dan menjaga kebajikan pelajar. Semasa pilihanraya, pelajar akan mengundi di atas sebuah kertas di mana mereka hanya perlu memangkah pada kotak yang di sediakan bagi calon yang ingin mereka undi.Selepas itu,kertas tersebut akan di masukkan ke dalam kotak untuk tujuan keselamatan daripada undi bocor ataupun hilang.Ini merupakan satu masalah yang sering kita dengar iaitu undi rosak di mana ia akan mengurangkan jumlah undian.Untuk mengetahui keputusan pilihanraya pula,pihak pengurusan memerlukan masa yang lama bagi mengetahui pemenang dan peratusan pilihanraya kerana mereka menggunakan kaedah manual untuk mengira undi dan ianya di lakukan berulang kali bagi memperolehi keputusan yang tepat.\r\nSistem ini di bangunkan untuk menyelesaikan masalah-masalah yang dinyatakan di atas yang sering berlaku dalam proses pilihanraya, terutama dalam mengendalikan pengundian, mengumumkan keputusan pilihanraya dan mengeluarkan laporan penuh pilihanraya.Menggunakan sistem ini,penggunaan kertas dan pensil tidak perlu di gunakan lagi kerana pelajar hanya perlu mengundi menggunakan komputer sahaja.Oleh itu,sebarang undi rosak dapat dielakkan dan sekaligus maklumat undian akan di simpan ke dalam sistem dengan selamat.Sistem ini juga akan mengira jumlah undian dengan lebih efisien tanpa perlu menggunakan pegawai yang ramai.Keputusan undian juga boleh diketahui dalam masa yang lebih singkat di mana keputusan akan di hantar menggunakan SMS kepada pihak fakulti,pentadbiran universiti dan pelajar.Bagi mengelakkan ketidakhadiran pelajar untuk mengundi,khidmat SMS akan digunakan bagi memberi amaran kepada pelajar supaya hadir  mengundi.Dengan adanya sistem ini,segala urusan berkenaan dengan proses pilihanraya dapat di laksanakan dengan lancar dan mengurangkan kos peralatan dan khidmat pegawai pilihanraya. \r\n','1.Membangunakn sistem pengundian berasaskan web.\r\n\r\n2.Menggunakan teknologi GSM  untuk menghantar keputusan Pemilihan Majlis Perwakilan Pelajar kepada pihak pentadbiran dan pelajar.\r\n\r\n3.Menyemak status kehadiran pelajar yang mengundi dan pemberian amaran kepada pelajar yang tidak hadir menggunakan SMS.\r\n','1.Sistem ini digunakan oleh pelajar untuk mengundi dan pegawai pilihanraya untuk menguruskan keputusan undian.\r\n\r\n2.Untuk menguruskan Pemilihan Majlis Perwakilan Pelajar dengan lebih sistematik.\r\n\r\n3.Menggunakan bahasa pengaturcaraan java untuk membangunkan sistem ini.\r\n4.Sistem SMS digunakan untuk menghantar keputusan pilihanraya kepada mereka yang berkenaan dengan tepat dan mudah.\r\n\r\n5.Laporan pilihanraya akan dikeluarkan untuk rujukan pihak  yang berkenaan.\r\n','softDev','SED01','Netbean IDE 6.5,MySQL','Komputer,Peranti Mobil,Printer ','Teknologi GSM. ','AC080434','Pending','200920101',26,NULL,NULL,'Y'),
 ('Web-based Operating System','Operating System is an important element in any computer, but it always suffers from viruses and malware attack. It crushes the system and make lost to data inside the computer and sometime will also damage the hardware components. Although nowadays, the computer technology is increasing rapidly, but there are still a problem with data transferring and sharing. Data transferring and sharing through pendrive or thumbdrive seem to be very easy and fast, but there are still problems between it, the data inside pendrive may lost due to improper care like it is get wet, lost, or infected by viruses. The protection of data inside your own operating system become very hard when facing with the problem like hardware crashing, malfunction of operating system and etc. Web-based Operating system can overcome the problems stated above.\r\nWeb-based Operating System is a system which attempt to take userâ??s desktop, files and favorite web applications and combine them into a single web-based platform. User can upload and access their documents from any computer using Internet services. It also allows user to access a completely their operating system (with their familiar interface) from anywhere in the world. So user can have a truly portable desktop and explorer featuring their files and web-based applications. This makes the file transferring and sharing more easy and effective. As all of this takes place from userâ??s web browser, user can access their virtual computer desktop anywhere like Internet cafÃ©, library and even inside friendâ??s house. Since the Web-based Operating System is kind like imaginary operating system, there is nothing like window registry, system process or unclosed port for the target of viruses or malware to attack. Hence, it reduces substantially the chance of data lost cause by virus. The idea of Web-based Operating System is simple - wherever you go, your desktop comes with you.\r\n','-Make a study to the Web-based Operating System and make the analysis to the background of the problem.\r\n-To design and implementation the Web-based Operating System.\r\n-Perform system testing to the Web-based Operating System and fix the errors.\r\n','-System available for all registered members or users.\r\n-Users can enjoy all the applications provided by the system.\r\n-Up to 10GB data storage for each user. \r\n','softDev','SED01','NetBeans IDE 6.5, Enterprise Architect 7.0, Microsoft Office 2007, Macromedia Dreamweaver MX 2004, Mozilla Firefox 3.5','Personal computer/ Laptop','Internet Programming (JSP, JDBC, javascript, HTML), data management(sorting, searching)','AC070280','Pending','200920101',27,NULL,NULL,'Y'),
 ('Information Retrieval Based on Iris','The human iris is the most accurate biometric for use in identification and at the mean time to retrieve information which is stored in a database. However, information retrieval based on iris is still far from perfect. These are based on the following problems:\r\n\r\ni.	Computing information retrieval based on iris requires good-quality iris images. Sometimes, partial occlusion of iris, reflective surface and diminutive target area is few instances blocking the data extraction process. The patterns of the iris are based on the tabular mesh work. It is a problematical work of recognition which causes the analysis of the large array of binary data (20 by 480 bytes). Therefore, the chances that a template being stole is in high risk.\r\n\r\nii.	The security performance is lower due to the large dimension of a template. Hackers and intruders can easily break through the database security system.\r\n','The main goal of this project is to develop a software program, which conducts pattern recognition to retrieve information saved in database. The program should be versatile enough to run through a reasonable dimension of database searching for a correct match of information based on the following objectives:\r\n(i)	A template (Iris) of an individual given, associated with information related can be effectively, efficiently, correctly and fast retrieval. \r\n(ii)	Designing a database of identity information of an individual based on class diagram.\r\n(iii)	Research on suitable indexing technique in database for retrieving and storing information of an individual.\r\n(iv)	Testing and validation through retrieval of the related information\r\nLast but not least, it is also an objective to prepare this project as the basis for any further expansion in the near future, especially application in security or authentication access of control system, like the university laboratory or main offices.\r\n','General Scopes for this project are as below:\r\ni.	Information retrieve is done by a search through a database which is built based on the characterized of iris.\r\nii.	Database from â??The Chinese Academy of Sciences â?? Institute of automation (CASIA) iris image database formatted in Bitmap(*.bmp) which is set to be  320*280.\r\n','research','SED01','Microsoft Word, mySQL','Computer',' Information Retrieval ','AC070279','Pending','200920101',28,NULL,NULL,'Y'),
 ('Kajian keatas perbezaan di antara teknik pengawalan nilai awal pemberat dalam algoritma back propagation ','Standard Backpropagation Algorithm (BP) merupakan algoritma yang digunakan secara secara meluas dalam melatih Rangkaian Neuron (Neural Network) dan ia telah berjaya digunakan dalam banyak aplikasi berbeza. Algoritma ini pada kebiasaannya menggunakan dua parameter pembelajaran iaitu Kadar Pembelajaran, Î± dan juga Faktor Momentum, Î². Walaupun algoritma ini telah dianggap berjaya, namun terdapat beberapa kelemahan dan kekangan yang wujud. Antaranya ialah kewujudan local minima, kadar penumpuan yang perlahan dan juga pengiraan yang kompleks diperlukan pada pembaikan algoritma yang pernah dilakukan sebelum ini. \r\nKelemahan dan kekangan ini wujud disebabkan oleh beberapa perkara yang mempengaruhinya seperti teknik yang digunakan untuk menilai awalkan pemberat,  kadar pembelajaran dan faktor momentum. Dalam kajian ini, teknik rawak yang digunakan untuk menilai awalkan nilai awal pemberat akan dibandingkan dengan beberapa teknik yang lain untuk mengenal pasti perbezaan yang berlaku kepada rangkaian neuron.\r\n','1.	Untuk mengenal pasti perbezaan antara teknik rawak dalam menilai awalkan pemberat dengan beberapa teknik yang lain dalam back propagation algorithm.\r\n2.	Untuk mengenal pasti kesan perbezaan antara teknik rawak dan teknik lain keatas rangkaian neuron (neural network) apabila dilatih oleh back propagation algorithm.\r\n','Projek ini akan menjalankan kajian kesan teknik rawak dalam menilai awalkan pemberat kepada rangkaian neuron dan akan dibandingkan dengan teknik pengawalan nilai awal pemberat yang lain. Eksperimen ini akan menggunakan set data bunga Iris untuk menimplentasikan back propagation algoritma dengan teknik pengawalan nilai awal pemberat yang berbeza.','research','SED02','  Matlab',' Laptop',' Back Propagation Algorithm','AC073081','Pending','200920101',29,NULL,NULL,'Y'),
 ('Sistem Jadual Waktu Akademi Bomba dan Penyelamat Malaysia Wakaf Tapai Marang Terengganu','Akademi Bomba dan Penyelamat Malaysia, Wakaf Tapai di Marang Terengganu merupakan antara pusat latihan yang terbesar di rantau Asia. Pusat latihan yang dibina pada tahun 2000 ini mampu mengendalikan seramai lebih kurang 600 peserta kursus dalam sesuatu masa. Pelatih baru yang memohon untuk berkhidmat dalam profesion kebombaan perlu menghadiri kursus yang ditawarkan di akademi ini bagi melatih kemahiran dan kecekapan untuk menjalankan tugas sebagai anggota bomba.\r\n\r\nDi akademi ini terdapat lima buah pusat pengajian yang menawarkan beberapa kursus mengikut jurusan tertentu. Setiap kursus akan dijalankan dalam tempoh tertentu dan kuliah akan diadakan selama lima hari seminggu. Terdapat lebih kurang 20 buah kelas yang digunakan sebagai bilik kuliah dan setiap peserta kursus perlu menghadiri kuliah mengikut waktu dan kelas yang telah ditetapkan. Seorang penyelia atau jurulatih akan ditugaskan untuk mengendalikan kuliah yang telah disusun mengikut bidang masing-masing. Setiap kursus akan disediakan jadual waktu yang telah dirangka bagi memudahkan dan melancarkan sesi pembelajaran. Jadual ini juga disediakan agar tidak berlakunya pertindihan waktu kuliah dan kekeliruan tenaga pengajar di antara kursus.\r\n\r\nPada masa ini jadual waktu disediakan dengan hanya menggunakan kaedah manual iaitu disusun oleh petugas pusat pengajian masing-masing. Kaedah ini sangat rumit dan banyak menimbulkan kekeliruan dalam menyediakan jadual waktu untuk setiap kursus. Untuk mengatasi masalah ini, pihak pengurusan akademi telah mengusulkan cadangan kepada pihak ICT akademi tersebut supaya membina sebuah sistem yang dapat menyediakan jadual waktu yang lebih sistematik untuk setiap kursus.\r\n\r\nPerbincangan dengan pihak akademi juga telah diadakan untuk mendapatkan beberapa maklumat ringkas sebagai gambaran awal bagi menjalankan projek ini. Pembangunan sistem ini sebagai tugasan bagi Projek Sarjana Muda Satu akan membantu dalam menyiapkan projek ini di samping memenuhi keperluan pihak Akademi Bomba dan Penyelamat Malaysia. \r\n','Objektif projek ini adalah untuk:\r\n1. Mengkaji masalah penyusunan jadual waktu bagi Akademi Bomba dan Penyelamat Malaysia.\r\n2. Membangunkan sebuah sistem berasaskan web yang dinamik bagi menghasilkan jadual waktu yang\r\n    sistematik. \r\n3. Menguji sistem yang ingin dibangunkan ini samada ia telah memenuhi kehendak pengguna dan\r\n    mampu mengatasi masalah-masalah yang telah dikenalpasti.\r\n','Skop untuk projek ini merangkumi beberapa pihak di Akademi Bomba dan Penyelamat Malaysia iaitu:\r\n1. Sistem ini membolehkan petugas pengurusan di akademi menyediakan jadual waktu dengan lebih\r\n    sistematik.\r\n2. Sistem ini membenarkan penyelia atau jurulatih untuk menyemak kelas-kelas yang telah ditugaskan\r\n    kepada mereka.\r\n3. Sistem ini membenarkan peserta kursus untuk menyemak jadual waktu kuliah yang perlu dihadiri.\r\n4. Sistem ini hanya boleh diakses oleh pengguna yang mempunyai rekod di dalam pangkalan data.\r\n','softDev','SED02','  Netbeans 6.5 and MySQL',' Komputer',' Penjadualan','AC080432','Pending','200920101',30,'7351',NULL,'Y'),
 ('Multivariate (GA-Based) Feature Selection Using Double Loop Cross Validation','Microarray data of cancer gene is huge. Hence, there is an urgent need to perform the feature selection of gene in order to identify a relevant subset of genes that contribute to the cancerous disease. Although there are many researchers have proposed several gene selection algorithms, but we are still facing problem to make a fair comparison of the available results.\r\n\r\n	So then, another technique was proposed in this project. The art of multivariate gene selection technique in 9 combination with a range of classifier which are SVM, k-NN and Bayesian will be use to feature select the relevant gene. In this study, there are 5 microarray data will be use. \r\n\r\n	Then, the double loop cross-validation will be use to estimate the prediction error of the classifier. The double loop cross-validation also well- known as nested cross-validation. The reason to use this type of validation method is because it provides an almost unbiased estimate of the true error.','1.	To pre-process 5 microarray cancer datasets.\r\n\r\n2.	To make a comparative analysis of all the result in the aspects of accuracy, classification errors and ROC.\r\n\r\n3.	To propose a most suitable multivariate method to perform the feature selection using double loop cross-validation.','1.	The 5 microarray datasets that will be use in this study are colon cancer dataset, leukemia dataset, brain cancer dataset, lymphoma dataset and breast cancer dataset.\r\n\r\n2.	Focus on preprocess, multivariate feature selection technique with a 9 combination of SVM, k-NN, and Bayesian using double loop cross-validation.','research','SED01','MATLAB','PC or Laptop','Genetic Algorithm and a nested cross-validation.','AC060176','Pending','200920101',31,NULL,NULL,'Y'),
 ('Aplikasi Pengurusan Panggilan Pintar bagi Pelantar Mobil','Telefon selular yang telah menjadi kemestian untuk setiap pengguna di dunia ini bukanlah lagi suatu kehendak, malah ianya dianggap kemestian yang harus ada untuk setiap manusia yang hidup di zaman serba maju ini.\r\n\r\nPerkembangan teknologi perkomputeran menyebabkan teknologi yang ada pada telefon bimbit tidak ketinggalan membangun dengan sungguh berkesan. Telefon bimbit kini menjadi suatu alat yang sentiasa dibawa ke mana-mana untuk urusan peribadi, syarikat dan sebagainya. Pengguna boleh menggunakan telefon bimbit sesuka hati bagi membuat panggilan dan menguruskan data peribadi mereka. \r\n\r\nBagaimanakah jika pengguna menggunakan telefon bimbit prabayar dan mahu mengawal perbelanjaan panggilan tanpa perlu risau akan kos mendadak yang ditanggung akibat penggunaan tanpa had selagi kredit panggilan masih ada, sekiranya pengguna menggunakan plan prabayar? Begitu juga dengan pengguna pascabayar. Bagaimana jika nilai panggilan mereka dapat dikawal tanpa menyebabkan kos yang mendadak akibat panggilan yang dibuat sesuka hati tanpa kawalan? Seharusnya ada suatu system yang bakal mengawal dan menguruskan kredit panggilan ini.\r\n\r\nSistem yang akan saya bangunkan ini akan mengawal penggunaan telefon bimbit mereka bergantung kepada kawalan pengguna sendiri. Mereka akan dapat menetapkan tempoh masa panggilan dan juga dapat menetapkan had kredit akhir serta had penggunaan yang dikehendaki sebelum panggilan diputuskan sebelum kredit kehabisan. Pengguna dapat mengawal perbelanjaan penggunaan kredit harian apabila system diaktifkan pada telefon bimbit dan boleh dinyahaktifkan pada bila-bila masa.\r\n','-Membolehkan pengguna menguruskan penggunaan panggilan yang dibuat melalui telefon bimbit\r\n\r\n-Membolehkan pengguna menggunakan telefon bimbit untuk tujuan panggilan keluar tanpa perlu risau akan kos yang bakal ditanggung.\r\n\r\n-Membolehkan pengguna menjimatkan kos penggunaan telefon bimbit dan kos sara hidup\r\n','-Pengguna telefon bimbit yang berpelantarkan sistem operasi Symbian v9.3\r\n    ->Pengguna telefon bimbit prabayar dan pascabayar.\r\n','softDev','SED01',' -Sistem Operasi Windows XP dan Vista,\r\n-Netbeans IDE 6.7, \r\n-Java SDK 6,\r\n-Carbide C++ 2.0\r\n-Software Development Kit (SDK) for Symbian S60 OS,\r\n-Microsoft Visual Studio .NET,\r\n-Adobe Device Central CS3 & CS4   ','  -Sebuah komputer riba bagi tujuan pembangunan sistem, \r\n\r\n-Sebuah peranti mobil berpelantar Symbian OS v9.3 yang lengkap dengan kredit panggilan dan aktif\r\n',' Symbian C++ Algorithm, Java Mobile Application Micro Edition\r\n','AC073052','Pending','200920101',32,NULL,NULL,'Y'),
 ('Web-based E-Learning System for Pre-school Children','Malaysian Ministry of Education (MOE 2003), department of Preschool curriculum suggests that preschools should implement ICT in teaching and learning process together with computer integration. As computer technology provides interesting and interactive methods of teaching and learning, it has become an important agenda in our preschool education system to produce computer literate generations. But, preschool education software in our national language which is Bahasa Malaysia is very rare and difficult to find. Software for preschool education has been developed in our national language but with a reduction of some learning materials and subjects especially Mathematics, English and Science. Numbers are one of the important knowledge for preschool kids, but the original system does not provide functionality to learn numbers. Preschool kids should be introduced to parts of their body and about animals in science subject. English subject can be introduced to help these kids learn some words in English as preschool kids are required to master the basics of the English language. Also some alteration in uploading or adding new learning materials to the system has to be done as the original system has deficiency in it. Malay version nursery rhymes can be added to the new upgraded system to make it more fun and interesting.','1. To analyze the needs of a preschool learning system and make a good design to upgrade the original software to a more interactive software.\r\n2. To produce a prototype of the system.\r\n3. To test the developed prototype\r\n','1. Preschool kids from 3 to 6 of age are the users of this system with parents or teachers guidance.\r\n2. This system is a web-based system with usage of web-services in certain areas such as password generator and e-mail verification.\r\n3. This system provides tutorials in learning alphabets from A to Z, words for each alphabets in both Malay and English language, numbers, parts of body, animals and some Malay version nursery rhymes for some fun.\r\n4. Some tests will be given to test the understanding of the student and the system will generate a report to display the studentÃ¢??s marks and level of performance.\r\n','softDev','SED01',' Microsoft Visual Studio 2008, .NET Framework, Microsoft SQL Server         2005, Microsoft SQL Server Management Studio Express. Enterprise Architect.  ',' Laptop, Sound Card, Graphic Card, Mouse, Keyboard, Network Card, Speaker, Printer.',' ASP.NET and web-service','AC070248','Pending','200920101',33,NULL,NULL,'Y'),
 ('Comparative Study between Genetic Algorithm and Simulated Annealing in Job Shop Scheduling Problem       			','Scheduling is the allocation of resources overtime in completing a given task. Although many research have been done, this scheduling problem is not yet to be solved as they are different level of complexities in each scheduling problem. In manufacturing process, one of the major problems in scheduling is where the job must be scheduled on a machine with certain constraints. The goal of this scheduling is to specify the schedule for each job and to be executed on time. Many problems may arise if the job is not executed on time. Manufacturing scheduling can be categorized into several types of scheduling such as the Job Shop Scheduling, Shop Floor Scheduling and Finite Capacity Scheduling. In this research project it is mainly focus on the Job Shop scheduling where it is a kind of scheduling system that process n numbers of tasks or jobs on m number of machines. It moves from one job to another job when the previous job is completed. The order of job is differed in terms of processing requirements, materials that are needed, processing times and sequence of a certain process. If the jobs are not properly schedules, the manufacturer will have difficulty to produce their products on time or within the expected time. As the result, the manufacturer may suffer from a great loss. In this research project, the Genetic algorithm and Simulated Annealing are the techniques that will be used in solving Job Shop scheduling problem. In the Genetic Algorithm technique the principal of evolution is applied where it will generate a new solution using the genetic operator such as the cross-over and mutation while the Simulated Annealing technique is actually the idea about the process of cooling and re-crystallization of metals. The aim of this project is to compare the performance of these techniques in finding the best solution for the Job Shop scheduling problem.','a)To study the  Job Shop Scheduling problem.\r\n\r\nb)To study the Genetic Algorithm and Simulated Annealing for solving  Job Shop scheduling problem.\r\n\r\nc)To develop and test the proposed algorithms.\r\n\r\nd)To analyze the performance of  Genetic Algorithm and Simulated Annealing in solving  Job Shop scheduling problem.\r\n','a) Three Benchmark data set namely Benchmark ft06, Benchmark orb07, Benchmark la21 is selected and will be used in this project.\r\n\r\nb) The objective function will be based on the measurement of the makespan of all jobs.\r\n','research','SED02','NetBeans 6.7, Microsoft Office Word 2007','DELL Inspiron 1420 Laptop','Genetic Algorithm, Simulated Annealing','AC070405','Pending','200920101',34,NULL,NULL,'Y'),
 ('Online Form E-Wallet System','The e-wallet is similar to a real wallet where users can keep all their information in it. Similar to a real wallet, users can store all their important cards and information such as credit cards, bank account details, passport details and so on in this e-wallet through online so that they can easily retrieve the information. Online Form E-Wallet System can be used to store information in the e-wallet and thus using that information to apply forms through online by just drag and dropping the information into the forms. This can help the users to save their time as they donâ??t need to write their information such as their name many times in the online forms for each time they fill up a form. They can just drag the information from the e-wallet and drop the information in the space provided in the form. Other than that, the users can also store their information which are hard to remember such as passwords, bank account numbers, passport numbers and so on in the e-wallet, so that they can easily just use that information to fill up the forms by drag and dropping without having to remember the information each time to fill up the online forms.','1. To develop a system that can be used by any users to fill up any online application forms by just drag and drop the information that has been stored by the user.\r\n\r\n2. To develop a system which enable the users of the system to store their important information securely where they can only retrieve their information by using a password.\r\n\r\n3. To develop a prototype of the system.\r\n','1. Develop a system using a component based web application.\r\n\r\n2. Develop a system that can be used by any users who wants to fill up any online application form\r\n','softDev','SED01','Microsoft Window XP operating system,  Microsoft Visual Studio 8.0, MySQLServer, Enterprise Architect 7.0,  Microsoft Office 2007. ','Laptop, mouse, keyboard, printer','ASP. Net ( C# ) ','AC070252','Pending','200920101',35,NULL,NULL,'Y'),
 ('3-Dimensional Protein Viewer for Protein Short Motif Search','Protein Short Motif Search (Protein-SMS) is a web-based application that allows users to submit protein query sequence and secondary structure. At this moment, Protein-SMS does not provide any protein viewer that allows users to view the protein 3-dimensional structure. Therefore, an extended version of a 3-Dimensional Protein Viewer will be included in Protein-SMS webpage. \r\n\r\nCurrently, there are several protein molecule viewers available on the internet like Jmol, RasMol and Pymol. Most of them are open source but however users are required to download in order to use the program. Jmol is one of the popular and widely used 3-Dimensional protein structure viewers available on the internet. It is a free and open source Java based 3D protein molecule viewer. The advantage of Jmol as compared to other protein molecule viewer is that it is available in both, as a web based application where it is included into a webpage or it could be downloaded into a local computer to be used. Hence, some users can opt to use it online rather than saving it on the local machine. In addition, Jmol provides graphical user interface compared to RasMol that involves command line interface in to perform all task. As for Pymol, users are required to pay and subscribe in order to obtain to Pymol. Therefore, this explains why Jmol is chosen for this project. \r\n\r\nHowever, there are some limitations to Jmol functionality compared to other protein viewers. Currently, only one protein can be visualized under Jmol at a time. The function of superimposing several aligned protein structures to be viewed is not available in Jmol. In addition, Jmol does not highlight the region of a particular query sequence within the protein structure. Therefore, this project will develop an improved version of Jmol that provides the service for superimposing multiple aligned protein structures and including highlighting the protein structure region where the matched query sequence resides. This would enable researchers to further study the protein structure. It also allows researchers to make comparison of multiple protein structures that contains the similar query sequence.\r\n','1. To study the current 3-Dimensional Protein Viewer, Jmol. \r\n2. To design and develop Jmol with the ability to superimpose multiple aligned protein structure and highlight the query sequence that matched within the protein secondary structure.\r\n3. To test the developed Jmol by selecting multiple aligned protein structure generated by Protein Short Motif Search.\r\n','1. Design and further develop Jmol with the ability to superimpose multiple aligned protein structures.\r\n2. Highlight the region of the protein secondary structure where the matched query sequence resides.\r\n3. Embed the developed Jmol Protein Structure Viewer into Protein Short Motif Search webpage. \r\n','softDev','SED01','Jmol, Linux/Unix Operating System','Intel Core 2 Duo, 2GB RAM','Java and Java Script, Perl Programming, Multiple Alignment Algorithm','AC060107','Pending','200920101',36,NULL,NULL,'Y'),
 ('PEMBANGUNAN SISTEM PERISIAN BERASASKAN WEB BAGI  PEMBELAJARAN MATEPELAJARAN MATEMATIK UNTUK DARJAH 6','Sistem pengajaran dan pembelajaran bagi matapelajaran matematik yang baik dan efektif adalah dengan adanya perhubungan dua hala diantara para guru yang mengajar dengan para murid (Cockroft,1982). Teknik pembelajaran ini boleh dilakukan melalui penyampaian isi kandungan pelajaran dari guru, pembelajaran antara murid dengan guru serta perbincangan antara para pelajar dengan satu sama lain mengenai sesuatu yang mereka pelajari. Latihan yang lebih banyak serta terperinci yang disertakan dengan langkah kerja penyelesaian yang jelas dan teratur adalah amat penting untuk pemahaman para murid. Dengan itu, bantuan daripada sistem perisian untuk tujuan pembelajaran khursusnya bagi matapelajaran matematik adalah sangat penting bagi memastikan pencapaian yang lebih cemerlang. Terdapat juga laman-laman web yang dibangunkan khursus untuk tujuan pembelajaran misalnya Portal Pendidikan Utusan Malaysia TUTOR. Laman web ini menyediakan pelbagai perkhidmatan yang boleh membantu para pelajar untuk mengakses latihan serta soalan â?? soalan perperiksaan tahun lepas. Laman web ini dapat diakses oleh semua individu tanpa had tidak kira guru mahupun pelajar dari peringkat pra-sekolah hinggalah ke peringkat pra-universiti. Namun begitu, soalan â?? soalan yang ada disediakan oleh laman web ini tidak mempunyai jalan serta langkah penyelesaian yang jelas serta terperinci untuk tujuan pemahaman para pelajar terutamanya bagi matapelajaran matematik. ','1.	Membangunkan satu sistem perisian yang boleh menyediakan satu sudut dimana para guru boleh memuatkan latihan serta nota-nota yang diajar.\r\n2.	Membangunkan satu sistem yang menyediakan ruang dimana para pelajar serta guru dapat berkongsi pendapat serta cadangan mengenai soalan-soalan latihan.\r\n3.	Membangunkan satu sistem pembelajaran yang mengandungi unsur-unsur grafik dan audio bagi menarik minat belajar dikalangan para pelajar disamping membantu pemahaman yang lebih baik.\r\n','1.	Para pelajar diperingkat sekolah rendah khususnya bagi pelajar darjah 6 yang bakal menghadapi UPSR.\r\n2.	Para guru yang mengajar matapelajaran matematik darjah 6.\r\n','softDev','SED01','  : Windows XP, Visual Studio 8.0, Enterprise Architect 7.0, Microsoft Office',' Komputer, papan kekunci, tetikus, pembesar suara, mesin pencetak.',' ASP.net (C#) ','AC070054','Pending','200920101',37,NULL,NULL,'Y'),
 ('Protein-Short Motif Search using hierarchical clustering algorithm','Web-based protein application has been developed rapidly over the years with new methods, algorithms and technologies found. These rapid developments generate massive amount of raw data such as protein structures, protein functions, chemical properties and many more. These data are not properly ordered and grouped. This is due to the current data management is unable to follow the flow of application development. Hence, important information is not discovered and ascertain. Risk of information lost is very high. Besides, data mining are difficult and have to be done manually. Data mining is important to be performed easily and instantly because important information may be used to compare results from experiments which are sometimes volatile. This would bring to inaccurate readings. \r\n\r\nProtein-Short Motif Search or Protein-SMS is an example of a web-based protein application that produces large amount of data without proper classification. Protein-SMS generates results from protein sequence and secondary structure queried by users which will align with information stored in Protein Data Bank (PDB). The information displayed on the result page is insufficient to identify the actual query sequence characteristic of interest and the relation of all the results with the query sequence. Protein-SMS do not properly classify the result according to protein characteristic causes users are unable to predict or deduce the characteristic of protein query sequence. The need to classify the results with protein characteristic is to enable user to predict the protein structure, function and chemical properties of the query sequence without sequencing the whole query sequence. Hence, classification of the result using hierarchical clustering is inevitable. This is because hierarchical clustering implies tree like visualization of the classification which is simple and easy to read. This is suitable for the users to perform data mining. \r\n	\r\nTherefore, this project will develop and implement hierarchical clustering method to differentiate and classify protein motif search result using protein characteristics such as hydrophobicity, acidity, Enzyme Commission (EC) value and others. The goal of this project would to enable users to extract vital protein information as to predict the protein function, characteristics, structure and properties of the query sequence. It also allows researchers to determine the structural of the query sequence through percentage of similarity.','1. To study the current web-based protein motif search application (Protein-SMS).\r\n2. To design and use hierarchical clustering algorithm to properly identify and classify the results from Protein-SMS based on the protein characteristics.\r\n3. To test Protein-SMS with different protein secondary structure and sequence to validate the accuracy of the developed approach.','1. Design a simple coding to manipulate and extract information from each pdb file.\r\n2. Code a hierarchical clustering using k-means algorithm and perl programming language.\r\n3. Retrieve information from the search result to be clustered.\r\n4. Embed the function into Protein-SMS system.','softDev','SED01','Textpad, Ubuntu operating sytem','desktop','Perl and java programming language, hierarchical clustering algorithm','AC060091','Pending','200920101',38,NULL,NULL,'Y'),
 ('WEB BASED PROTEIN 3D VIEWER USING Jmol APPLICATION','PDBsum is a system that allows the researches specialized in biology, chemistry and biochemistry to view the protein molecule in 3 Dimesion (3D) using Jmol which is an open source application. PDBsum is a user interface to the JmolApplet which makes the visualization power to be built into the Jmol java applet and accessible to users who do not have the time to learn the Jmol command language or on embedding Jmol into web pages. In the PDBsum system, the user key in the PDB ID of the protein molecule and the system will search its database and display the protein molecule as a static molecule with its descriptions.  The user may click on the Jmol button and a new tab will be open to display the 3D view of the protein molecule. Right clicking on the protein molecule will display a preference panel of several features such as spin, rotation, adding hydrogen atoms and others. User is able to select their choice on the panel and the protein molecule changes to the selected conformation. \r\n\r\nBasically, PDBsum uses the Jmol as an embedded application is because Jmol application allows protein molecule to be viewed in 3D form. By viewing the protein molecule in 3D form, the researchers are able to have a clear visualization on the orientation on amino acids in protein and the conformation of polypeptide chains and peptide bonds to form a protein structure. In Jmol, the 3D structures of protein can be rotated, moved and zoomed with the mouse.  With the preference panel with the selected features, Jmol allows the 3D view of protein structure to be changed in several ways such including secondary structure residues that are part of beta-sheets or alpha-helices will be colored separately, show water molecules on the protein structure or show the backbone on proteins as cartoon drawings. When using this view it possible to see alpha-helices and beta-sheets. With all these features applicable on 3D view of protein, the researches finds it helpful to do further analysis on the protein structures. \r\n\r\nBesides the benefits of viewing protein in 3D form, there are several problems that have been identified in this PDBsum system. From the user perspectives, they find the system is not too interactive whereby they prefer to have a single click on to display their panel features on the protein molecule. Besides that, the system does not allow user to enter a string of protein sequence and display the results of the query sequence search. Even though Jmol have several features on the preference panel but Jmol application is lack in the function of highlighting the query sequence region on the protein molecule. From the user perspective mainly researches, they would prefer to have a system that able to query protein sequence and display the highlighted query protein sequence on the protein molecule. This is because they will be able to do analysis based on where the highlighted protein sequence is situated in every different protein structure. \r\n\r\nTherefore, this project will develop a system that will have an interactive user interface with drop-down menu of the preference panel features and with a single click on, the user able to view the confirmation changes made on the protein structure. Besides that, the system will enable the user to key in string of protein sequence or to query protein sequence and display the results of a list PDB ID of protein molecules that have the query protein sequence. Furthermore by enhancing the Jmol application, user will be able to view the highlighted region of the query protein sequence on the protein structure in 3D form. \r\n\r\n','1. To study the current system of PDBsum and Jmol application. \r\n\r\n2.To develop a system with interactive user interface and extend the function of Jmol application which enable to view the highlighted region of query protein sequence in 3D view. \r\n\r\n3. To test the performance of the developed web based protein viewer system which uses the Jmol application\r\n','1. To develop a system for the researches who mainly study protein structures.\r\n\r\n2. To develop a web based protein molecule viewer with an interactive user interface.\r\n\r\n3. Able to extend the function of Jmol application to view a highlighted protein region. \r\n','softDev','SED01','Linux operating system, Jmol application, MySQL','Intel Core 2 Duo, 1GB RAM, 50GB HARD DISK, LAN and Internet source,\r\nKeyboard, Mouse, Communication Port, Monitor (Resolution 800 * 600).\r\n','Sliding Window Algorithm for Protein Search Engine, Java, Perl Programming','AC060063','Pending','200920101',39,NULL,NULL,'Y'),
 ('Sistem Diagnosis Penyakit melalui Tapak Tangan','Penggunaan sistem tidak perlu bertemujanji dan melalui proses pemeriksaan kesihatan yang merumitkan disamping boleh menjimatkan masa dan kos untuk bertemu dengan pakar.Tangan merupakan bahagian saraf yang paling hujung dari tubuh manusia. Apa sahaja yang berlaku pada tubuh manusia boleh diketahui melalui tapak tangan. Sistem diagnosis penyakit melalui tapak tangan ini dibangunkan  untuk pengguna mengetahui penyakit yang sedang mereka alami. Sistem ini memudahkan pesakit yang ingin mengenalpasti penyakit yang dihadapi tanpa perlu menjalani pemeriksaan yang rumit dan mengeluarkan kos yang tinggi, tidak memakan masa yang lama hanya semata ingin mengenalpasti penyakit yang dihadapi. Sistem ini memberitahu penyakit yang dialami oleh pesakit dengan memberikan soalan untuk mengetahui keadaan pesakit sedang alami. Mereke hanya perlu memjawab soalan - soalan yang diberikan oleh sistem ini samaada betul ataupun salah tentang keadaan yang dialami mereka oleh sehingga sistem berjaya mengenalpasti penyakit mereka. Pesakit tidak perlu memahami bagaimana sistem diagnosis ini dilaksanakan dan bagaimana system ini mengenalpasti penyakit mereka.	','1.	Membangunkan satu sistem diagnosis berdasarkan \"rule - based\" sistem.\r\n2.	Sistem diagnosis penyakit melalui tapak tangan mengikut kepakaran dari pakar diagnosis tapak tangan.\r\n3.	Memberi pengesahan kemungkinan penyakit - penyakit yang dihadapi melalui beberapa set soalan yang disediakan.\r\n','1.	Mendiagnosis tapak tangan berdasar soalan - soalan yang berkaitan tapak tangan sahaja.\r\n2.	Mengenalpasti sekurang - kurangnya 10 jenis penyakit.\r\n3.	Diagnosis simpton atau tanda -  tanda yang ada pada tapak tangan.\r\n4.	Sistem diagnosis penyakit ini dilaksanakan secara \"stand - alone\" sahaja.\r\n','softDev','SED03',' Perisian	: Prolog\r\n ',' Perkakasan	: Komputer \r\n',' Teknologi/Teknik/Kaedah/Algoritma: \r\nKaedah pendekatan Methodologi Prototaip Peningkatan dan Methodologi Pendekatan Berperingkat.     \r\n \r\n  ','AC080435','Pending','200920101',40,NULL,NULL,'Y'),
 ('A GRID WEB PORTAL FOR MOLECULAR DYNAMICS','According to Wikipedia, grid computing is able to offer a model for solving huge computational problems. It is basically a collection of services such as the ability to access databases, computational facilities and more. These are all based on a distributed computing power that enables performing of large tasks. \r\n\r\nGROMACS is a Linux-based software to perform molecular dynamics simulation of protein molecules. It provides extremely high performance and fast calculation of non-bonded interaction between protein molecules. A protein simulation on GROMACS may take days or sometimes weeks to be completed on a single machine. Hence, setting up GROMACS to run on a few machines on the backend will increase the performance of the protein simulation.\r\n\r\nBesides that, GROMACS, being a Linux-based software uses a Command Line Interface. Due to this, the application is not fully to the advantage of those who are not well versed with Linux especially most scientist and researchers. By putting GROMACS on a grid web portal, it provides a Graphical User Interface that will benefit more scientists and researchers who are more often than not, Windows users. This will in turn escalate their field of research and development. In addition, as GROMACS is implemented into a grid web portal, this will ensure its availability to the masses without the need of GROMACS installed on their machines.  \r\n\r\nThe implementation of the grid web portal requires the need to set up the infrastructures by integrating the various open source grid services available (as listed in Project Requirements). Once the infrastructures are set up, the portlet development may begin. A portlet holds the content of a portal. In this case, it holds the GROMACS application. \r\n','1) To study the protein simulation with GROMACS, a Molecular Dynamics (MD) application.\r\n2) To develop a grid-enabled, second generation web portal. \r\n3) To adapt the GROMACS protein simulation application on the web portal.\r\n','1) To develop a simple grid web portal leveraging the current open source grid services / tools available.\r\n2) The MD application chosen is GROMACS.\r\n3) Infrastructure Ã¢?? integration of grid services\r\n4) Portlet development Ã¢?? simple version of GROMACS application\r\n','softDev','SED01',' Linux OS - CentOS, GROMACS, Gridsphere Portal Framework, Vine Toolkit, Globus Toolkit, LAMP, Adobe Flex SDK, Apache Tomcat Servlet Container ',' Server, desktop',' Technology employed- JSR168 Portlet Specification, Adobe Flex 3.0','AC060065','Pending','200920101',41,NULL,NULL,'Y'),
 ('Sistem Pengurusan dan Penyemakan Rekod Saman Secara Perkhidmatan Pesanan Ringkas (SMS)','Sebelum ini, Kakitangan Unit Keselamatan UTM menguruskan rekod saman secara manual iaitu dengan merekod nama pelajar yang melakukan kesalahan disiplin dengan kaedah memasukkan data ke dalam Microsoft Excel. Kesalahan tersebut diasingkan mengikut jenis kesalahan disiplin dan tarikh saman dikeluarkan. \r\n\r\n	Namun demikian, didapati sistem manual ini adakalanya sukar digunapakai. Ini adalah kerana sistem ini tidak sistematik dan sukar dikemaskini. Keadaan ini sememangnya merumitkan kakitangan unit keselamatan untuk menyemak rekod saman atau bayaran yang telah dibuat oleh pelajar lebih-lebih lagi apabila rekod yang sedia ada terlalu banyak. Selain itu, penggunaan surat saman yang sedia ada juga kurang berkesan. Ada kemungkinan surat saman hilang ataupun rosak.\r\n\r\n	Pelajar yang mempunyai rekod kesalahan, akan membuat bayaran saman di balai keselamatan. Sekiranya pelajar tidak menyelesaikan hutang mereka, keputusan peperiksaan tidak akan dikeluarkan dan berada dalam status berhutang.\r\n','Objektif sistem ini adalah :\r\n1.	Untuk mengkaji sistem yang akan dibangunkan.\r\n2.	Untuk merekabentuk dan membangunkan sistem yang dicadangkan supaya dapat memudahkan proses pengurusan dan pengemaskinian rekod kesalahan pelajar.\r\n3.	Untuk menguji keberkesanan sistem yang dibangunkan.\r\n','Sistem ini diberi nama â??Sistem Pengurusan dan Penyemakan Rekod Saman Secara Perkhidmatan Pesanan Ringkas (SMS)â??. Sistem ini adalah untuk kegunaan Kakitangan Unit Keselamatan UTM terutama kepada pengawal keselamatan yang akan menggunakan sistem ini. Pelajar pula boleh menyemak rekod-rekod saman mereka dengan hanya menggunakan khidmat pesanan ringkas (SMS).\r\n\r\n','softDev','SED05','  Netbean 6.5, MySQL',' Komputer, Mobil, Pengimbas kod bar',' GSM, Java','AC080354','Pending','200920101',42,NULL,NULL,'Y'),
 ('COMPARATIVE STUDY OF REMOTE PROTEIN HOMOLOGY DETECTION BY USING SUPPORT VECTOR MACHINE AND HIDDEN MARKOV MODEL','Remote homology detection refers to the detection of structure homology in evolutionarily related proteins with low sequence similarity. Nowadays, protein homology detection is one of the most intensively researched problems in bioinformatics. Researchers are increasingly depending on computational techniques to classify proteins into functional or structural classes by means of homologies. Most methods can detect homologies at high levels of sequence similarity, while accurately detecting homologies at low levels of sequence similarity (remote homology detection) is still a challenging problem.\r\n\r\n	Many powerful methods and algorithms have been developed for this purpose.   The Smith-Waterman (SW) dynamic programming algorithm was developed in early 1980â??s, and is still used widely today. Some heuristic algorithms, such as BLAST and FASTA trade reduced accuracy for improved efficiency. These methods do not perform well for remote homology detection, because the alignment score falls into a twilight zone when the protein sequences similarity is below 35% at the amino acid level.\r\n\r\n	Later methods challenge this problem by incorporating the family information. These methods are based on a proper representation of protein families and can be split into two groups: generative models and discriminative algorithms. Generative models such as profile hidden Markov model (HMM) provide a probabilistic measure of association between a new sequence and a particular family. It can be trained iteratively in a semi-supervised manner using both positively labeled and unlabeled samples of a particular family by pulling in close homology and adding them to the positive set. The discriminative algorithms such as Support Vector Machines (SVM) provide state-of-the-art performance. In contrast to generative models, the discriminative algorithms focus on learning a combination of the features that discriminate between the families. These algorithms are trained in a supervised manner using both positive and negative samples to establish a discriminative model. The performance of SVM depends on the kernel function, which measures the similarity between any pair of samples.\r\n\r\n	A study on comparison of these two later methods by using different tools needs to be done for remote homology detection and also using SCOP database 1.73.\r\n','1.To study on Support Vector Machine (SVM) and Hidden Markov Model (HMM).\r\n2.To analyze the remote protein homology detection by using SVM and HMM.\r\n3.To develop and test the proposed research. \r\n','1.Implement remote protein homology detection by using Matlab.\r\n2.Dataset SCOP 1.73 will be used as training and testing dataset.\r\n3.Comparison between the result of SVM and HMM.\r\n','research','SED02','Matlab, Perl','Laptop','Machine Learning Language','AC060084','Pending','200920101',43,NULL,NULL,'Y'),
 ('Sistem Pelancongan di Melaka Menggunakan Google Maps API','Teknologi Google Maps API yang diperkenalkan oleh Google membenarkan pengguna membenamkan Google Maps di dalam antara muka web pengguna menggunakan perisian Java Script. Google Maps membantu pengguna dalam menentukan lokasi dan arah yang ingin dituju. Selain itu, Google Maps turut menyediakan segala maklumat yang ingin diperolehi oleh pengguna. Namun, teknologi Google Maps ini tidak dapat di aplikasikan di dalam antara muka web pengguna. Melalui teknologi Google Maps API ini, pengguna dapat menggunakan aplikasi Google Maps melalui antara muka web penngguna itu sendiri.\r\n\r\n\r\nPada masa kini, pelancong yang ingin melancong di negeri Melaka menggunakan peta untuk menuju ke destinasi percutian. Pelancong perlu kerap bertanya arah lokasi yang ingin dituju kepada orang ramai. Risiko untuk sesat adalah tinggi khususnya untuk pelancong asing ekoran daripada masalah komunikasi yang mungkin wujud ketika perjalanan dan amnya kepada pelancong tempatan. Ini menyebabkan masa dan usaha yang tinggi diperlukan untuk sampai ke destinasi. Ada diantara pelancong yang menggunakan khidmat pemandu pelancong untuk percutian mereka menyebabkan kos yang tinggi diperlukan sepanjang percutian. Pelancong perlu mencari informasi-informasi tambahan seperti  tempat penginapan, tempat menjamu selera serta perkhidmatan pengangkutan untuk sampai ke destinasi pelancongan. Ini menyebabkan percutian yang menjanjikan keseronokan terganggu kerana masalah â?? masalah di atas.\r\n\r\n\r\n Melalui sistem yang akan dibangunkan ini, ia  menggunakan teknologi Google Maps API yang digunakan khusus untuk pelancongan di sekitar negeri Melaka. Pengguna boleh mengakses lokasi pelancongan dengan memberitahu arah laluan melalui laman web yang dimuatkan dengan teknologi Google Maps API. Selain itu, pengguna juga boleh mendapatkan maklumat tentang perkhidmatan pengangkutan,  tempat menjamu selera serta perkhidmatan pengangkutan di lokasi pelancongan terlibat. Sistem ini dapat membantu pelancong menjimatkan masa, kos dan usaha mereka sepanjang percutian.\r\n','Sistem Pelancongan Melaka Menggunakan Google Maps API ini mempunyai beberapa objektif yang ingin dicapai, iaitu ;\r\n\r\n\r\n1)	Untuk mengkaji sistem dan kemudahan  yang sedia ada untuk pelancongan di Melaka.\r\n2)	Untuk mereka bentuk dan membangunkan sistem yang menepati kehendak pengguna sistem.\r\n3)	Untuk menguji dan mengaplikasikan sistem yang dibangunkan sama ada ianya berfungsi seperti yang dikehendaki.\r\n','Skop bagi Sistem Pelancongan di Melaka Menggunakan Google Maps API ialah ;\r\n\r\n\r\n\r\n1)	Sasaran pengguna bagi sistem ini adalah kepada pelancong yang ingin melancong di sekitar Bandaraya Melaka dan sambungan internet.\r\n2)	Sistem ini digunakan di sekitar Bandaraya Melaka sebagai satu kemudahan pelancongan.\r\n3)	Tempoh pembangunan sistem adalah sepanjang mengikuti subjek PSM1 dan PSM2.\r\n','softDev','SED01','  JavaScript, ASP.NET',' Komputer riba, Broadband, Mesin pencetak',' Google Maps API, Google Maps, Google Earth','AC080342','Pending','200920101',44,NULL,NULL,'Y'),
 ('List of Engineering Release (LER) Online Booking','Sistem ini dibangunkan untuk menggantikan sistem semasa yang menggunakan kaedah manual. Research drawing yang telah dilengkapkan oleh jurutera akan dihantar kepada CAD Admin. CAD Admin akan request satu nombor iaitu nombor LER yang akan dijana dan diberikan pada setiap research drawing yang dihantar sebagai bukti penghantaran. Nombor LER bagi setiap research drawing adalah berbeza. Nombor LER dijana berdasarkan kepada format nombor daripada Proton.\r\nApabila nombor LER telah diberikan, CAD Admin akan merekodkan semua maklumat Research drawing beserta nombor LER ke dalam fail rekod. \r\nMasalah utama sistem ini ialah nombor list of engineering release (LER) dikeluarkan dan maklumat-maklumat direkodkan dalam fail secara manual. Janaan nombor LER secara manual kurang efisyen kerana CAD Admin perlu request nombor LER terlebih dahulu dan ini akan mengambil masa sebelum nombor LER dikeluarkan. \r\nPencarian maklumat yang telah direkodkan di dalam fail juga menyebabkan pencarian data memerlukan masa yang lama berbanding sistem online.\r\n','1) Mengkaji sistem yang akan dibangunkan. \r\n2) Merekabentuk dan membangunkan sistem. \r\n3) Menguji sistem yang telah dibangunkan.\r\n','1.Sistem ini dibangunkan untuk Bahagian Servis Kejuruteraan Proton yang berpusat di Shah Alam, Selangor.\r\n \r\n2.Sistem ini dibangunkan supaya nombor list of engineering Releasee (LER) dapat dijana secara automatik menggunakan sistem online.\r\n\r\n3.Sistem ini memudahkan CAD Admin mendapatkan nombor LER apabila dijana secara automatik oleh system ini. Selain itu, CAD Admin boleh merekodkan semua maklumat secara online.\r\n','softDev','SED01','  Netbean IDE.  ','  Komputer.','  Aplikasi Java.  ','AC080348','Pending','200920101',45,NULL,NULL,'Y');
INSERT INTO `title` (`proTitle`,`bgProblem`,`objective`,`scope`,`proType`,`proField`,`softSpecification`,`hardware`,`technology`,`metricNo`,`status`,`semester`,`proID`,`evaluator`,`comment`,`title_flag`) VALUES 
 ('Sistem Pengurusan Perniagaan HPA Berasaskan Web dan Aplikasi SMS','Dewasa ini penggunaan internet telah berkembang dengan pesatnya dari semasa ke semasa. Memandangkan HPA merupakan sebuah syarikat MLM yang besar, kemudahan penggunaan internet diperlukan oleh pihak pengurusan stokis HPA bagi melancarkan pengurusan perniagaan HPA tersebut. Oleh itu, bagi membantu pihak pengurusan stokis HPA agar tidak ketinggalan dalam arus teknologi masa kini, satu kajian telah dibuat. Kajian ini dibuat bagi melihat sistem sebenar yang telah digunakan oleh pihak pengurusan stokis HPA. Daripada kajian yang dijalankan, didapati pengurusan di stokis HPA ini masih lagi menggunakan sistem manual. Antaranya adalah proses pendaftaran ahli baru masih lagi menggunakan sistem manual. Hal ini memerlukan pemohon yang berminat untuk menjadi ahli HPA perlu mengisi borang pendaftaran yang disediakan. Ini mengakibatkan pembaziran dari segi wang kerana memerlukan penggunaan kertas yang banyak.\r\n\r\nSelain itu, tempahan  barangan yang dilakukan di stokis juga masih lagi menggunakan sistem manual. Ini mengakibatkan pembaziran masa dan tenaga serta melambatkan proses tempahan tersebut kerana setiap ahli terpaksa berulang alik pergi ke stokis untuk membuat tempahan barangan.\r\n \r\n  Disamping itu, proses merekod mata untuk setiap ahli juga masih lagi menggunakan sistem manual dimana mata yang telah dikumpulkan oleh setiap ahli direkodkan didalam buku. Keadaan ini akan merumitkan pihak pengurusan stokis dan juga mengakibatkan pembaziran kerana memerlukan penggunaan buku yang banyak. Oleh itu, satu sistem baru yang sistematik diperlukan oleh pihak pengurusan stokis HPA supaya segala urusan ini dapat diurus dan dilakukan secara konsisten dan teratur.\r\n','Untuk mencapai matlamat pembangunan sistem ini, terdapat beberapa objektif yang perlu dicapai. Antara objektif yang telah dikenalpasti untuk mencapai matlamat dalam membangunkan sistem ini adalah :\r\n\r\n1.	Untuk menganalisa masalah pengurusan perniagaan yang dihadapi oleh pihak pengurusan stokis HPA supaya dapat mengkaji permasalahan dan kesulitan yang dihadapi.\r\n\r\n2.	Untuk merekabentuk dan membangunkan sistem yang berasaskan web mengikut kesesuaian semua pihak.\r\n\r\n3.	Untuk menguji sistem yang telah siap dibangunkan supaya pengurusan lebih teratur dan sistematik. \r\n','Skop ini ditetapkan bagi memastikan bahawa sistem yang akan disediakan benar-benar memenuhi kehendak pengguna. Berikut merupakan skop yang digariskan bagi sistem ini.\r\n\r\n1.	Sistem pengurusan perniagaan HPA berasaskan web dan applikasi SMS ini menumpukan kepada aktiviti pemantauan setiap ahli yang berada dibawah stokis termasuk menguruskan maklumat ahli yang telah mendaftar,  mata yang telah dikumpulkan oleh setiap ahli, proses tempahan barangan oleh ahli, dan proses pendaftaran ahli baru,. \r\n\r\n2.	Pengguna sistem ini terdiri daripada pihak pengurusan stokis HPA, ahli yang telah mendaftar  dengan HPA dan juga pengguna biasa.\r\n\r\n3.	Proses pemohonan untuk menjadi ahli HPA adalah secara atas talian dimana pemohon perlu mengisi maklumat yang diminta.\r\n\r\n4.	Penggunaan teknologi SMS hanya digunakan apabila ahli yang telah berdaftar dengan HPA ingin memeriksa mata yang telah mereka kumpulkan.\r\n\r\n5.	Sistem yang dibangunkan ini berasaskan web dan aplikasi SMS.\r\n\r\n6.	Proses pembangunan sistem ini akan dijalankan sepanjang PSM1 dan PSM2.\r\n','softDev','SED01','Microsoft Visual Studio 2008, SQL Server  ','Komputer atau laptop, Modem, Telefon Bimbit. ','ASP.Net, Sistem Pesanan Ringkas (SMS) ','AC080331','Pending','200920101',46,NULL,NULL,'Y'),
 ('VEHICLE MANAGEMENT SYSTEM','In Johor, there are many public transport providers which provide taxi or bus services to public like Handal Indah Sdn. Bhd. , Triton, GrassLand and there are many types of public transport service.\r\nIn fact, there are many Johorian have had bad experience when travel with the public transport \r\nespecially public bus. Sometimes, the public bus would broke down on half of the way then the \r\npassengers need to wait for another bus to continue their travel. The driver always neglect the \r\nimportance of the hygiene in the public transport. Moreover, ticket machine in  some short distance bus are broke down and the drivers are not giving tickets to passengers anymore instead of collect \r\nthe money on their own. The lack of regular vehicle maintenance already caused the customer unsatisfied\r\nand the public transport company lost their customers but paid higher maintenance fees. Vehicle \r\nmanagement system is the system that manage a company  fleet or vehicle and it may include a range of \r\nfunctions like manage vehicle details, vehicle maintenance, produce certain report and more. To solve the problem above, a vehicle management system should be able to do vehicle and driver profiling,\r\ntrip profiling, trace the vehicle maintenance data to make sure the vehicle maintenance periodical and \r\nreduce the overall transportation costs. At the end of the month, the system also should produce the \r\nreports regarding vehicle maintenance for the financial purpose.\r\n','1)	To investigate the problem of vehicle managing of public transport company.\r\n2)	To design a vehicle management system to help user manage their vehicle, driver and trip.\r\n3)	To develop a vehicle management system to store their vehicle data, manage the \r\nvehicle maintenance information and produce the vehicle maintenance report.\r\n4)	To test the system performance and availability. \r\n','1)	Develop an vehicle management system that can be used for public transport company in \r\nMalaysia.\r\n2)	Provide high security to secure private company information\r\n3)	Test the system by using sample data from bus company in Johor \r\n','softDev','SED01',' Java Programming, MySQL, Microsoft Office ',' Personal Computer / Laptop',' Database Management (scheduling, filter data)','AC070235','Pending','200920101',47,NULL,NULL,'Y'),
 ('Perbandingan Antara Quick Training Dan Full Training Dalam Rangkaian Neural Radial Basis Function','Kajian ini dilaksanakan untuk mengkaji keberkesanan dua jenis algoritma iaitu algoritma Quick Training dan algoritma Full Training. Melalui kajian ini, perbandingan antara algoritma Quick Training dan Full Training juga dijalankan dengan menggunakan data seperti data bunga Iris dan data penunjuk saham bagi membuktikan bahawa algoritma Full Training adalah lebih baik daripada Quick Training.\r\n\r\nRadial Basis Function (RBF) adalah satu jenis rangkaian neural. Terdapat beberapa variasi algoritma pembelajaran, di antaranya ialah Quick Training (QT) dan Full Training (FT). Literatur mengatakan FT lebih baik daripada QT. Oleh yang demikian, untuk membuktikan penyataan ini, kajian dilakukan dengan menggunakan data bunga Iris dan data penunjuk saham.\r\n','1.)	Untuk mengkaji keberkesanan dua jenis algoritma bagi rangkaian neural Radial Basis Function (RBF) iaitu Quick Training algorithm dan Full Training algorithm.\r\n2.)	Untuk menbanding algoritma Quick Training dan Full Training dengan menggunakan data bunga iris (Iris Flower) dan data penunjuk saham (Stock Market Indicator).\r\n3.)	Untuk membuktikan algoritma Full Training adalah lebih baik daripada algoritma Quick Training.\r\n','Skop bagi kajian ini adalah menggunakan kaedah rangkaian neural iaitu Radial Basis Function (RBF). \r\nData yang digunakan adalah data bunga Iris dan data penunjuk saham.\r\n','research','SED02','  C++',' Komputer peribadi',' Radial Basis Function (RBF)','AC070335','Pending','200920101',48,NULL,NULL,'Y'),
 ('Aplikasi Mobil bagi Perkongsian Video Secara Terus dan Rakaman','Pada hari ini telefon bimbit sudah menjadi suatu keperluan kepada setiap orang. Kewujudan telefon bimbit telah menjadikan ianya suatu kewajipan untuk dimiliki oleh setiap orang. Kini dengan kewujudan telefon bimbit berkamera sudah menjadi suatu kemestian kepada semua orang untuk memilikinya. Hal ini menyebabkan wujudnya pelbagai aplikasi yang dapat memanfaatkan fungsi kamera ini sebaik mungkin. Kehadiran teknologi 3G pada hari ini telah menambah keupayaan seusatu aplikasi pada telefon bimbit untuk menggunapakai teknologi 3G ini sebaik mungkin. Selain itu dengan terdapatnya fungsi WiFi pada telefon bimbit, ianya telah mempermudahkan aplikasi yang sedia ada dan yang akan dibangunkan untuk menggunakan teknologi ini dengan efisien. Sifat telefon bimbit itu sendiri yang mudah dibawa kemana-mana telah mempermudahkan pengguna untuk menggunakan aplikasi pada bila-bila masa.\r\n	Aplikasi pemain video pada telefon bimbit bukan sesuatu yang asing lagi pada masa kini. Aplikasi pemain video ini membaca video dari pelayan dan memainkannya pada telefon bimbit. Antara format yang biasa digunakan adalah format 3GP,MPEG,FLV. Penggunaan teknologi strim video telah membenarkan pengguna melihat video tanpa perlu memuat turun fail video secara penuh ke muatan memori telefon bimbit. \r\n	Teknologi pada hari ini yang semakin menuntut setiap kelompok masyarakat utuk seiring bersama-sama mengikut arus teknologi hari ini. Pada hari ini terdapat pelbagai jenis laman web yang menyediakan perkhidmatan perkongsian video. Seluruh masyarakat di seluruh pelusuk dunia dapat berkongsi video yang menarik serta memberi komen-komen pada video yang dilihat. Permintaan terhadap perkongsian video secara maya ini telah meningkat setiap tahun. Laman-laman web perkongsian video seperti youtube,veoh dan metacafe menjadi suatu fenomena pada masa kini. Namun masih terdapat beberapa kekangan yang dihadapi oleh pengguna untuk berkongsi video yang telah dirakam. Video rakaman perlu dimuat naik ke pelayan web menggunakan komputer peribadi samaada di rumah atau pejabat.\r\n	Gabungan teknologi yang terdapat pada sebuah telefon bimbit dan teknologi perkongsian video di laman web yang sedia ada kini membolehkan suatu pendekatan baru dilaksanakan. Kedua-dua teknologi ini dapat diadaptasikan bersama bagi memenuhi kehendak pengguna yang mengharapkan sesuatu yang lebih baik dalam menghasilkan suatu komuniti perkongsian video yang lebih mudah,cepat dan berkesan.\r\n	Oleh sebab itu, suatu aplikasi mobil yang berasaskan teknologi 3G dan WiFi dimanfaatkan untuk membangunkan sebuah aplikasi mobil yang membenarkan strim video secara terus ke laman web persendirian atau memuat naik video yang telah direkod ke laman-laman web perkongsian video yang sedia ada atau laman web persendirian.  \r\n','1.	Mengkaji aplikasi strim video sedia ada bagi menambah baik fungsi strim video dan menambah fungsi strim video secara terus kepada aplikasi mobil yang dibangunkan.\r\n2.	Merekabentuk dan membangunkan aplikasi mobil perkongsian video secara terus dan video rakaman yang memenuhi keperluan aplikasi.\r\n3.	Membangunkan sebuah laman web yang akan menerima strim video secara terus atau video rakaman daripada telefon bimbit pengguna.\r\n4.	Menjalankan ujian terhadap aplikasi serta laman web yang dibangunkan untuk mengenal pasti samaada aplikasi memenuhi keperluan sistem yang telah disenaraikan.\r\n','\r\n1.	Aplikasi mobil ini digunakan oleh pengguna yang mempunyai telefon bimbit yang dilengkapi dengan teknologi 3G,GPRS dan WiFi.\r\n2.	Pengguna hanya boleh strim satu video secara terus atau memuat naik video rakaman ke laman web pada satu-satu masa.\r\n3.	Aplikasi hanya dibangunkan khas untuk pelantar Symbian 60 V3.\r\n4.	Hanya penguna yang berdaftar sahaja boleh menggunakan servis yang disediakan pada aplikasi mobil.\r\n','softDev','SED05','  Netbean 6.7, J2ME Wireless Toolkit 2.2, Drupal, MySQL',' Nokia Symbian S60 V3',' J2ME, Streaming, 3G, PHP, XML     ','AC080335','Pending','200920101',49,NULL,NULL,'Y'),
 ('Sistem Merekod Kehadiran dan Pengurusan Pelajar di Giat Mara menggunakan Teknologi GSM','     Proses untuk merekod kehadiran dan menguruskan maklumat pelajar di Giat Mara secara manual telah dilakukan sejak awal ditubuhkan institusi tersebut. Menjadi kebiasaan bagi pelajar melaporkan kehadiran dengan menandatangani pada senarai nama yang disediakan. Staf juga memerlukan beberapa fail untuk menyimpan borang maklumat pelajar supaya mudah untuk di kemaskini. Pelbagai kekangan dan masalah yang timbul disebabkan oleh penggunaaan kaedah manual ini. \r\n    	 Pada masa kini, sistem pembelajaran di Giat Mara hampir sama dengan sistem pembelajaran di universiti. Rekod kehadiran merupakan faktor yang penting dalam sistem pengiraan  markah pelajar.Disebabkan perubahan sistem pembelajaran ini, kaedah manual tidak lagi  sesuai digunakan untuk merekod kehadiran. Oleh itu, sistem merekod kehadiran dan pengurusan pelajar di Giat Mara berasaskan web menggunakan teknologi GSM di bangunkan.\r\n     	Dalam sistem ini pelajar akan melaporkan kehadiran dengan hanya mengimbas kad pelajar yang mengandungi kode dengan menggunakan pengimbas barcode.Sistem ini akan merekod kehadiran dan akan mengira peratusan mengikut prestasi kehadiran pelajar. Peratusan kehadiran pelajar akan dimasukkan ke dalam sistem pemarkahan pelajar bagi sesi pembelajaran.Sekiranya pelajar tidak hadir ke kuliah sebanyak 3 kali dalam masa sebulan, mesej peringatan akan di hantar ke telefon bimbit pelajar dan mesej pemberitahuan di hantar ke telefon bimbit penjaga.Dengan cara itu, penjaga dapat mengetahui prestasi anak â?? anak dengan cepat dan mudah.\r\n     	Proses pengurusan pula akan melibatkan pangkalan data untuk menyimpan semua maklumat pelajar lama dan baru. Maklumat pelajar boleh di capai pada bila â?? bila masa sekiranya maklumat perlu di kemaskini.Ini akan memudahkan staf untuk mengurus data yang banyak dan proses akan menjadi lebih konsisten.Pada setiap akhir semester laporan berkenaan pemarkahan dan prestasi pelajar akan di hantar kepada penjaga untuk makluman. \r\n','1.	Menggunakan pengimbas barcode untuk merekod kehadiran pelajar dengan tepat dan konsisten.\r\n2.	Untuk mengesan dan mengira  kehadiran pelajar supaya peratus kehadiran dapat diperolehi dengan mudah.\r\n3.	Menggunakan teknologi GSM untuk menghantar mesej  kepada pelajar dan penjaga dengan mudah.\r\n4.	Membangunkan sistem pendaftaran pelajar secara online.\r\n','1.	Sistem ini akan digunakan oleh pelajar dan staf di Giat Mara.\r\n2.	Sistem ini merupakan sistem berasaskan web .\r\n3.	Penggunaan teknologi GSM untuk penghantaran mesej dari sistem ke mobil.\r\n4.	Penggunaan bahasa java sepenuhnya.\r\n','softDev','SED01',' Netbeans 6.5, MySQL ',' Komputer, Peranti Mobil dan Pengimbas barcode',' Teknologi GSM ','AC080346','Pending','200920101',50,NULL,NULL,'Y'),
 ('Imputing Missing-Values in Microarray DNA Data for Cancer Survival Analysis using K-Nearest Neighbor Method ','Microarrays are a very useful biological resource to study living forms at the molecule level. Microarrays are widely used and in this case, it is used for cancer survival analysis. Microarrays usually have only a few samples with high dimensionality with many missing values. For an analysis to be accurate, we need to fill up these missing values. This research focuses on using K-Nearest Neighbor (KNN) method to fill in these missing values. The performance of this method will be access and compare with other missing data imputing methods. If the problem of missing data is solved, we will obtain better analysis and better diagnosis for the survival of cancer patients.','- To use the KNN method to solve missing-values problem in cancer survival analysis microarray data.\r\n- To evaluate the performance of the propose method with the existing techniques.\r\n','The scope that this research covers is implementing the KNN method to analyze and to fill in the missing values in the microarray data of cancer patient survivability analysis. Data set that will be used for this research will be obtained from journal that has large B-Cell lymphoma data and the software that this research will make use of is Matlab.','research','SED02','Matlab  ','Personal computer running on Windows operating system.','Using K-Nearest Neighbor method','AC060154','Pending','200920101',51,NULL,NULL,'Y'),
 ('PROTEIN 3D VISUALIZATION USING p-TOUCHLIB IN MULTITOUCH ENVIRONMENT ','MULTITOUCH TECHNOLOGY DENOTES A SET OF INTERACTION TECHNIQUES WHICH ALLOW COMPUTER USERS TO CONTROL GRAPHICAL APPLICATIONS WITH SEVERAL FINGERS. MULTI-TOUCH CONSISTS OF A TOUCH SCREEN AS WELL AS SOFTWARE THAT RECOGNIZES MULTIPLE SIMULTANEOUS TOUCH POINTS WHICH RECOGNIZES ONLY ONE TOUCH POINT. THIS EFFECT IS ACHIEVED THROUGH A VARIETY OF MEANS, INCLUDING BUT NOT LIMITED TO: HEAT, FINGER PRESSURE, HIGH CAPTURE RATE CAMERAS, INFRARED LIGHT, OPTIC CAPTURE, TUNED ELECTROMAGNETIC INDUCTION, ULTRASONIC RECEIVERS, TRANSDUCER MICROPHONES, LASER RANGEFINDERS, AND SHADOW CAPTURE. \r\n\r\nWITH THIS PROJECT I WANT TO COMBINE BIOLOGY WITH MULTIOUCH TECHNOLOGY. THE MAIN QUESTION IS: \r\n\r\n1. WHAT IS THE STATE OF THE ART IN INTERACTION WITH MULTI-\r\nTOUCH TABLES AND OTHER TOUCH SCREENS?\r\n2. ARE THERE EXISTING INTERACTION DESIGNS FOR MOLECULE VI-    SUALIZATIONS OR OTHER 3D OBJECTS?\r\n3. WHICH TASKS DO BIOLOGISTS PERFORM WHEN ANALYZING MOLECULE VISUALIZATIONS?\r\n4. HOW CAN THE EXISTING INTERACTIONS ON MULTI-TOUCH TABLES BE USED TO PERFORM THESE TASKS?\r\n','TO STUDY THE DATA INVOLVED AND IDENTIFY ITS REQUIREMENT.\r\nTO DESIGN THE p-TOUCHLIB USING UNIFIED MODELING LANGUAGE\r\nTO DEVELOP THE p-TOUCHLIB TOOLS USING C++  PROGRAMMING \r\nLANGUAGE\r\nTO TEST THE p-TOUCHLIB TOOLS','THE DATA USE IN THIS SYSTEM IS PROTEIN. THE PROTEIN IS TAKEN FROM PDB OR PROTEIN DATA BANK.\r\nTHE TEST FOR THE PROTOTYPE IS DONE BY LECTURER FROM FACULTY OF SCIENCE AND STUDENTS ENROL IN SSG4683 PROTEIN FUNCTION AND STRUCTURE.','softDev','SED01','  TOUCHLIB, RASMOL, WINDOWS.',' COMPUTER,TOUCH PANEL,PROJECTOR,WEBCAM',' MULTITOUCH TECHNOLOGY','AC060161','Pending','200920101',52,NULL,NULL,'Y'),
 ('CluFA (Clustering using Fuzzy c-mean Algorithm) System','Definition of clustering is classification of objects into different groups such that elements of each group share same common features. In gene expression data, it is used to observe simple gene-to-gene similarities so that potential functions of gene can be found. Clustering algorithm is often applied on microarray data to group genes whose similar expression patterns suggest that they maybe co-regulated.\r\n\r\n	There are several example of clustering algorithm such as hierarchical clustering and k-means clustering that is also known as traditional clustering approaches. Nowadays, most of applications on clustering gene expression are using traditional clustering approaches. These traditional clustering approaches generate partitions, in which each gene can be assigned to only one cluster. However, there are cases where proteins, product of genes, are involved in multiple biological processes. In this case if we are using traditional clustering approaches, the result will be inconsistent.\r\n\r\n	The application that I will develop is a web-based application called as CluFA (Clustering using Fuzzy c-means Algorithm) System. To overcome the above problem, I will use GO Fuzzy c-means algorithm as the clustering technique in my application. GO Fuzzy c-means is an extension of Fuzzy c-means with prior biological knowledge. It allows assignment of multiple gene functions. It also incorporate prior biological knowledge so that gene can be associated with more than one biological function and can capturing the actual behavior of genes.\r\n\r\n	Besides that, there are several functionalities that I will include in the system such as:\r\n1)	Visualization of result\r\n2)	Input parameters for user customization\r\n3)	File input / output\r\n4)	Report generation based on some input and generated parameters\r\n','1)	To collect and identify requirements for CLuFA System.\r\n2)	To design CLuFA System using Unified Modeling Language (UML).\r\n3)	To develop CLuFA System using web-based.\r\n4)	To test CLuFA System in testing environment.\r\n','-	Data are retrieved from Eisen and Gasch.\r\n-	Users of this system are researches and students.\r\n-	Functionalities in this system are visualization of result, input parameters for user customization, file input / output and report generated based on some input and generated parameters.\r\n-	Methodologies that will be used in the system are Software Requirements Specifications (SRS), System Develop & Design (SDD) and Validation & Testing (V&T).\r\n-	Technologies that will be used in the system are database MySQL, programming language JAVA and web application Apache.\r\n','softDev','SED01',' NetBean  ',' OS - Windows',' web-based system, database MySQL, programming language JAVA and web application Apache','AC060214','Pending','200920101',53,NULL,NULL,'Y'),
 ('Sistem Navigasi Video Berasaskan Mobil','Media Streaming adalah teknologi yang membenarkan fail video serta audio diterima dam dipaparkan secara serentak oleh pembekal. Ia menggunakan teknologi hybrid di mana proses memuat-turun klip video boleh di tonton ataupun video itu sudah dipaparkan. Streaming video hanya boleh dilihat tetapi tidak boleh memuat-turun video tersebut.\r\n\r\nKini, terdapat beberapa aplikasi telefon bimbit yang menyediakan fungsi yang membolehkan pengguna untuk menonton video tanpa melalui proses memuat-turun klip video itu terlebih dahulu. Walau bagaimanapun,  kesemua aplikasi ini hanya membenarkan pengguna menonton klip video mengikut masa yang ditetapkan, ataupun dengan kata lain, aplikasi ini akan mula strim diawal klip video itu walaupun pengguna pernah menonton video tersebut. Aplikasi sedia ada juga akan strim diawal klip jika berlaku sebarang gangguan terhadap isyarat ataupun talian. Selain daripada itu, masalah yang berkaitan dengan jalur lebar juga akan timbul jika terlalu ramai pengguna mengakses klip video itu pada masa yang sama.\r\n\r\nOleh itu, satu aplikasi baru perlu dibangunkan untuk  menyelesaikan masalah-masalah tersebut. Aplikasi ini bukan sahaja dapat mengurangkan masalah yang berkaitan dengan jalur lebar, tetapi aplikasi ini juga dapat menjimatkan penggunaan stor penyimpanan di dalam telefon bimbit yang digunakan.\r\n','1. Mereka bentuk laman web yang membolehkan proses penyelenggaraan terhadap klip video-klip video yang boleh di strim telefon bimbit.\r\n2. Merekabentuk dan membangunkan aplikasi telefon bimbit yang boleh menyimpan setiap tajuk video yang telah distrimkan oleh pengguna. \r\n3. Melakukan ujian terhadap aplikasi yang telah dibangunkan untuk mengenal pasti kesalahan-kesalahan mungkin terjadi.\r\n\r\n','1.Aplikasi ini hanya boleh digunakan untuk telefon bimbit yang mempunyai teknologi 3G sahaja.\r\n2.Aplikasi ini hanya dapat menyokong klip video yang berjenis mp4, 3gp dan mov sahaja.\r\n3.Penggunaan laman web hanya untuk diakses oleh pentadbir sahaja.\r\n4.Aplikasi ini hanya membenarkan pengguna untuk menstrimkan klip video sahaja.\r\n','softDev','SED05','Netbeans 6.5, J2ME Wireless Toolkit, Helix/Darwin Server','Komputer, Telefon Bimbit 3G',' Java','AC080330','Pending','200920101',54,NULL,NULL,'Y'),
 ('Automatic Speech Recognition Using Artificial Neural Networks','Interaction with machines can be done in several ways. One of them is by speech which is becoming increasingly common used nowadays and is potentially the fastest form of man-machine communication. Speaking rates vary from about 120 to 250 words per minute, slightly faster than skilled typing rates. Speech recognition is the process of converting an acoustic signal, captured by a microphone or a telephone, to a set of words for applications such as commands and control, data entry, and document preparation. The word-based speech recognition technology has also begun to make an impact in the market place. Speech, however, does not need to be learned, and for being the most natural form of human communication, it should be considered in the human use of computers. Speech recognition can be applied in the industrial application, applications for the disabled, or applications in aviation. There are some advantages of man-machine communication by voice:\r\n\r\n1.It leads to faster times for the solution of problems \r\n2.It leaves the hands and eyes free to perform other tasks\r\n3.Unconstrained movement. The speaker could communicate with a computer by voice from any position in a room\r\n\r\nThree methods can be used for speech recognition; Dynamic time warping, Hidden-Markov model, and Artificial Neural Network. In this research, I will focus on the artificial neural network method, is an interconnected group of artificial neurons that uses a mathematical or computational model for information processing based on a connectionistic approach to computation. The advantages of using  this method are the detection time is no more than a few network time constants, and its recognition speed is independent of the number of the words in the vocabulary. So, I will conduct a research of how this artificial neural network could be the problem solving technique for speech recognition.','1.To identify the process of speech recognition using artificial neural network\r\n2.To discover speech quality when using artificial neural network method\r\n3.To identify features affecting the speech quality\r\n4.To discover the result of speech recognition from the data given\r\n','This research is limited to speech pattern for recognition by using artificial neural network method only. ','research','SED02','MATLAB, Microsoft Windows or IBMâ??s OS/2 Warp','microphone, Pentium computer, 16MB of RAM, multimedia card',' Artificial Neural Network','AC070295','Pending','200920101',55,NULL,NULL,'Y'),
 ('Sistem Pembelajaran Bahasa Inggeris untuk pelajar Sijil Pelajaran Malaysia (SPM).','Pada masa kini, penggunaan Bahasa Inggeris dalam kehidupan seharian kita adalah amat penting. Penggunaan Bahasa Inggeris juga kian meningkat kerana Bahasa Inggeris merupakan bahasa pengantaraan dan merupakan bahasa antarabangsa. Oleh sebab itu, penguasaan terhadap bahasa ini adalah amat penting dalam sistem pembelajaran dan sistem komunikasi. Adalah penting bagi para pelajar terutamanya pelajar sekolah menengah untuk menguasai Bahasa Inggeris dan mempraktikkannya di dalam kehidupan seharian mereka. Jadi sistem ini menekankan kepada pembelajaran terhadap pelajar Sijil Pelajaran Malaysia (SPM) dimana tahap pembelajaran Bahasa Inggeris adalah lebih tinggi sedikit berbanding pembelajaran pelajar Penilaian Menengah Rendah(PMR). Wujudnya sistem ini adalah untuk membantu pelajar mempelajari Bahasa Inggeris melalui web.','Berdasarkan kepada pernyataan masalah, maka terdapat beberapa objektif sistem yang perlu dikenalpasti bagi menyokong objektif utama iaitu:\r\n\r\n1.	Untuk membangunkan sistem secara web dengan bertujuan meningkatkan penggunaan Bahasa Inggeris di kalangan pelajar SPM.\r\n\r\n2.	Untuk mengkaji teknik yang akan digunakan untuk membangunkan Sistem Pembelajaran Bahasa Inggeris untuk pelajar SPM.\r\n\r\n3.	Untuk mengenalpasti proses yang akan digunakan dalam membangunkan Sistem Pembelajaran Bahasa Inggeris untuk pelajar SPM.\r\n','Skop bagi sistem ini adalah seperti berikut:\r\n\r\n1.	Sistem ini diwujudkan khas untuk pelajar sekolah menengah yang akan menduduki SPM.\r\n\r\n2.	Sistem ini hanya boleh digunakan di kawasan yang mempunyai kemudahan Internet.\r\n\r\n3.	Memfokuskan hanya kepada pelajar tingkatan 4 dan tingkatan 5 yang akan menduduki SPM.\r\n','softDev','SED01','  Microsoft Visual Studio 2008, MySQL Server',' Komputer, Internet, Pelayan',' ASP.net     ','AC070055','Pending','200920101',56,NULL,NULL,'Y'),
 ('VeSt : Sistem Pengurusan Sticker Kenderaan di Universiti Teknologi Malaysia ','Sebagaimana yang diketahui, Universiti Teknologi Malaysia masih menggunakan sistem pengurusan \r\nsticker kenderaan bagi warganya secara manual. Sistem yang sedia ada amat rumit bagi para pelajar\r\nterutamanya bagi memohon untuk sticker kenderaan bagi kolej masing - masing, di mana ia tidak selaras\r\ndengan sistem permohonan sticker pihak universiti itu sendiri. Para pelajar terpaksa menunggu sehingga\r\npekeliling keluar sebelum dapat memohon sticker kolej, yang mana tarikh sebenar pekeliling tidak\r\ndiketahui. Maka, para pelajar perlu sentiasa pergi ke pejabat kolej masing â?? masing bagi mengetahui\r\nsama ada pekeliling yang berkenaan telah dikeluarkan atau pun tidak. Masalah semakin bertambah\r\ndengan jadual kuliah/ kelas masing â?? masing yang tidak selaras. Ada kalanya para pelajar kesuntukan\r\nmasa untuk berulang alik dari fakulti ke pejabat kolej, di mana masa oerasi pejabat kolej adalah dari 8.00\r\nhingga 4.30 petang. Ada pelajar yang hanya mempunyai masa lapang pada waktu tengahari, tetapi\r\npejabat ditutup pada waktu itu. Bagi pensyarah dan juga staff, mereka juga memohon sticker secara\r\nmanual. Sistem yang akan dibangunkan ini dapat memudahkan lagi proses permohonan sticker menjadi\r\nlebih sistematik. Malah, kelebihan akan diberikan kepada para pelajar bagi pilihan pembayaran sama ada\r\nsecara atas talian(ditolak dari PTPTN atau akaun bank) ataupun terus kepada pihak keselamatan UTM.','Objektif kajian ini adalah untuk:\r\n1- Membangunkan sistem komputer yang sistematik bagi pengurusan sticker kenderaan bagi semua warga UTM, termasuk pelajar, pensyarah dan staff.\r\n2- Mengemaskini pengurusan sistem sticker kenderaan sedia ada kepada kaedah yang lebih efisien.\r\n3- Memudahkan warga UTM untuk membuat permohonan sticker kenderaan  bagi setiap dua semester.\r\n','Skop bagi kajian ini adalah:\r\n1- Kajian ini dilakukan di Universiti Teknologi Malaysia dengan khusus dibangunkan untuk pelajar, staff dan juga pensyarah yang mempunyai kenderaan.\r\n2- Digunakan hanya di dalam kawasan UTM untuk tujuan keselamatan.\r\n3- Fokus utama adalah proses pendaftaran dan pembayaran bagi sticker kenderaan \r\nmasing-masing.\r\n','softDev','SED01','Microsoft Visual Studio 2008, MySQL','Komputer, Pelayan, Internet','ASP.net','AC070204','Pending','200920101',57,NULL,NULL,'Y'),
 ('Drum Learning Software','Music has been part of our daily lives for centuries. Music is built by combining sounds of items which slowly, was developed into a few important instruments to build music such as the guitar, drum, piano, and finally advanced to digital composing. Drum, specifically, is not an easy instrument to play because it involves both our hands and both of our feet to play. Therefore, less people pick up drum as their favourite instrument to learn due to the difficulties. Besides, learning drum can be costly because not many people are qualified to be a professional instructor and due to the number, the cost will be higher compared to the other instruments.\r\nIn todayâ??s world of science and technology, computer has played an important role in music creating and instruments learning. There are various virtual instruments learning software which is created to help those interested to learn about their favourite music instrument such as the guitar in particular. Besides that, technologies such as Java, Extensible Markup Language (XML), Musical Instruments Digital Interface (MIDI) and various more software are created to fulfil the needs for digital music.  \r\nFor those who are interested to learn how to play drums, especially beginners, if a proper virtual drum learning software is created, it will help many of them who wishes to learn drum and it will surely help them to improve themselves. Therefore, if a software such as â??Drum Learning Softwareâ?? is built, will be a big contribution to the music arena.\r\nDrum is a musical instrument which is defined as cylindrical percussion instrument covered at its end(s) with plastic, skin and so on. Learning means knowledge earned or gained by study where study here means by book or by experience. Beginner is defined as a person who has just started to learn something or also known as a trainee or learner.\r\nIn the â??Drum Learning Softwareâ??, a few important details have been identified to help beginners learn the basics of a drum and how to play the drum. Basic tutorial is given to teach them and just with a laptop and some spare time, they will be able to learn some basics before advancing to the real drum set. In addition, this software will have its special characteristic which is to compose drum notes, as well as editing the notes and also a feature of playback of the notes where the notes are converted to WAV sound format.\r\n','The objectives of this study are as below.\r\n1.To build a prototype that enables beginners to learn the basics of drum.\r\n2.To build a prototype for beginners to compose drum notes\r\n3.To build a prototype that converts drum notes of PNG format to XML format.\r\n4.To build a prototype that converts XML format to MIDI format.\r\n','The scope of this study is limited to:\r\n1.The software built is focused on beginner level drum learners and also drum composers.\r\n2.The conversion of drum notes to XML format are limited only to digital notes which come in the format of PNG and not handwritten notes or in any other format.\r\n','softDev','SED01','Netbeans IDE, Enterprise Architecture','Computer & Speakers','Java','AC070334','Pending','200920101',58,NULL,NULL,'Y'),
 ('Web-based Recruitment Process System for the Company HR Group','The problem is the company that wants to build a feature-rich web-based system related to recruitment process for the HR Group. This system is necessary because the company want to save cost from spending a large amount of money to the Recruitment Agency to find the suitable candidates for the company. In addition, this system also makes easier the works of HR group and more systematic to maintain the recruitment works. \r\nThis project is aimed at developing a web-based and central Recruitment Process System for the HR Group for a company. Some features of this system will be creating vacancies, storing Applicants data, Interview process initiation, Scheduling Interviews, Storing Interview results for the applicant and finally Hiring of the applicant. Reports may be required to be generated for the use of HR group.\r\n','1.	To make a system that will be creating vacancies, storing Applicants data, Interview process initiation, Scheduling Interviews, Storing Interview results for the applicant and finally Hiring of the applicant. \r\n2.	To generate reports for the use of HR group.\r\n3.	To make analysis of the operation of recruitment process from a HR Group of a company.\r\n4.	To study the software development process of Analysis, Design, Implementation, Testing, User Interface.\r\n','1.	To use Java technology and SQL database system in Microsoft platform for system development.\r\n2.	This system is developed for HR Groups and interviewer.\r\n3.	This system will generate the report for the HR Group.\r\n','softDev','SED01','  Windows 95/98/XP/Vista with MS-office, MS-SQL server, Oracle database system, Java, ASP, JSP, Servlets, Java Script',' PC with 2 GB hard-disk and 256 MB RAM',' Oracle, Internet (HTML, Java Script, ASP, JSP, Servlets), Web Based/GUI, VB, Java, VC++','AC070110','Pending','200920101',59,NULL,NULL,'Y'),
 ('Sistem Pengurusan Pasukan Latihan Pegawai Simpanan (PALAPES) Berasaskan Web','            Pada awal sesi kemasukan mahasiswa/siswi baru setiap tahun, PALAPES UTM masih menggunakan kaedah-kaedah manual untuk memproses permohonan dan pengambilan kadet-kadet baru, ini melambatkan proses pengambilan kadet. Selain itu, kadet-kadet lama yang menduduki kolej lain selain Kolej 11, sukar memperolehi perkembangan terkini pasukan. Akhir sekali, kadet-kadet pada masa ini hanya menggunakan Friendster dan blog untuk berinteraksi, ini menyebabkan tiada integrasi antara para kadet.  \r\n           Dengan sistem yang dicadangkan, diharapkan proses pengambilan dilaksanakan dengan lebih cepat dan efisien, kadet-kadet dapat memperoleh maklumat terkini di mana-mana , serta menjadi satu platform untuk megintegrasikan para kadet \r\n','-	Membangunkan  sebuah sistem yang dapat membantu pihak pengurusan PALAPES dalam proses pengambilan kadet-kadet baru pada setiap kali pengambilan secara online\r\n-	Membangunkan sebuah sistem yang boleh berfungsi sebagai satu platform untuk kadet-kadet berkongsi pengalaman, ilmu,  \r\n-       Menguji sistem\r\n','-	Pangkalan data hanya untuk kadet selama 3 tahun, iaitu dari memasuki palapes(Junior) sehingga ditauliahkan(Senior).\r\n-	Pengurusan dilakukan mengikut skuad Darat dan Laut secara berasingan serta  peringkat masing- masing kedua-dua skuad.\r\n-	Untuk digunakan di UTM sahaja\r\n','softDev','SED01','  Visual Studio, SQL server.',' C#',' Analisa, reka bentuk, implikasi, â??user interfaceâ??.','AC070156','Pending','200920101',60,NULL,NULL,'Y'),
 ('Informative Gene Selection using Bayesian Model Averaging for Patients Survival Analysis.','A problem with most feature selection algorithms used to produce continuous predictors of patient survival is that they fail to explain the model (a set of selected genes whose regression coefficients haven been calculated for use in predicting survival prognosis) uncertainty. With thousands of genes and only tens to hundreds of samples, it often happens that a number of different models describe the data about equally well. We apply the Bayesian Model Averaging (BMA) method  to select a subset of genes for survival analysis on microarray data. Instead of choosing a single model and proceeding as if the data were actually generated from it, BMA combines the effectiveness of multiple models by taking the weighted average of their posterior distributions. In addition, BMA consistently identifies a small number of predictive genes, and the posterior probabilities of the selected genes and models are available to facilitate an easily interpretable summary of the output.','The objective of my research is \r\ni.	To study the Bayesian Model Averaging as a method for the application of survival analysis.\r\nii.	To compare the performance of Bayesian Model Averaging method with the existing method within experimental approaches. \r\n','i.	Use Bayesian Model Averaging method.\r\nii.	Two cancer datasets: breast cancer and diffuse large B-cell lymphoma (DLBCL) data. \r\n','research','SED02','Matlab','Intel Core 2 Duo Processor','Bayesian Model Averaging','AC060056','Pending','200920101',61,NULL,NULL,'Y'),
 ('Online Adaptive English Test System','In recent years, computer based test(CBT) has become one of altenative way to replace the conventional existing pencil and paper(P&P) test. With CBT various multimedia such as image, audio, and video can be attached to the test question. Moreover, the test question can be reuse or reedit for future test question. The test result of CBT can almost instantly displayed and recorded after the test is done, thus provide a convenient and easy to use test system.\r\nHowever, with the current computer based test system, students are accessing the fixed test materials regardless the level of understanding of the student in the particular subject. Thus, this CBT approach seem to be an imitation of the P&P approach. The only different between these two approach is that CBT present the test in digital with multimedia attachment. In other word, both the CBT and P&P approach are linear based test. \r\n','The objective of this project are as follow:\r\nâ?¢	To developed an Online Adaptive English Test System\r\nâ?¢	To enable teacher or the test maker to make the online test available via online\r\nâ?¢	To enable the students to answer the online test via online\r\nâ?¢	To enable the student to view their test result and progress after taking the test\r\n','The scope of this project are as follow:\r\nThe user of this system should be teacher as a test maker and student . This system allow the test maker to create and modify test and then the available test will be answer by the student.\r\n','softDev','SED01','Netbeans 5.6, MySQL Server, Adobe Photoshop CS2, Web Browser, Enterprise Architect, Macromedia Dreamweaver',' Personal computer with web browser','Java, html, PHP, World Wide Web, ASP.net','AC070080','Pending','200920101',62,NULL,NULL,'Y'),
 ('APLIKASI PEMETAAN GOOGLE DALAM SISTEM LATIHAN INDUSTRI UTM','Lokasi syarikat yang terlibat dengan latihan industri merupakan salah satu aspek yang penting ketika pengguna yang terdiri daripada AJK,  Penyelaras,  Pensyarah dan Pelajar memerlukan maklumat tersebut untuk menjalankan tugas masing - masing.  Permasalahan yang timbul adalah, apabila Sistem Latihan Industri  sedia ada  hanya terhad memberi maklumat secara teks iaitu alamat industri tersebut.  Hanya alamat industri berkenaan sahaja yang diberi apabila pengguna ingin melihat ruang lokasi., sedangkan maklumat berkenaan lokasi yang dimaksudkan adalah lebih terperinci iaitu secara bergrafik jika menggunakan teknik pemetaan google.  Melalui pendekatan ini, lokasi - lokasi tersebut boleh diperincikan lagi dan pengguna akan dapat melihat secara terus dalam talian.\r\n\r\n  Satu usaha telah dijalankan terhadap cara yang dapat memberikan maklumat secara bergrafik berkenaan lokasi industri yang terlibat. Aplikasi pemetaan google boleh digunakan bagi memberi maklumat yang secara grafik  mengenai lokasi Ã¢?? lokasi industri yang terlibat berdasarkan aplikasi yang disediakan. Kebolehupayaan teknik ini menyediakan ruang kepada pengguna menyunting peta akan membantu proses mengemaskini dari semasa ke semasa dan mencapai matlamat untuk menyediakan maklumat yang lebih tepat kepada pengguna yang terlibat dengan latihan industri ini.\r\n','1)  Membangunkan sistem yang mengimplimenkan aplikasi pemetaan google supaya boleh memberi maklumat lokasi industri  yang terlibat secara lebih terperinci.\r\n\r\n2)  Menyediakan antaramuka untuk pengguna yang terdiri daripada Ajk dan Penyelaras Latihan Industri untuk menyunting peta.\r\n','1)  Pembanggunan sistem ini difokuskan untuk Sistem Latihan Industri UTM yang dibangunkan di Universiti Teknologi Malaysia (UTM)\r\n\r\n2)  Fokus maklumat lokasi adalah kepada kedudukan , jalan dan petunjuk.\r\n\r\n3)   Pangkalan data dirujuk pada pangkalan data yang sedia ada dalam Sistem Latihan   Industri UTM.\r\n\r\n4)  Pelajar hanya boleh melihat peta lokasi industri  yang terlibat sahaja\r\n','softDev','SED01','   Oracle dan Adobe Dreamweaver. ','  ','  PHP , javascript dan AJAX.','AC080355','Pending','200920101',63,NULL,NULL,'Y'),
 ('Iterative Bayesian Model Averaging for patients\' survival analysis','Selection of relevant gene for sample classification is common task in most gene expression studies and is one of most challenging issues in the field of microarray data analysis. Besides that, gene expression data normally contains a large of number of genes compared to number of samples.  As the result, researchers try to identify the smallest possible and cost-effective set of gene that can achieves high prediction accuracy.  Most gene selection method has a problem to produce continuous predictors of patients survival is that they fail to account for model uncertainty. The limitation of Bayesian Model Averaging method is incompatible with microarray data which in survival analysis on microarray dataset contains thousands or tens of thousands of genes and only a few dozen samples only and computation become slow if more than 45 variables. Besides that, by using elimination solution to reduce the number of genes down to 30 in Model Averaging (BMA) method, but it is not suitable to use in situation where the number predictive variables is greater than the number of samples. Thus, iterative Bayesian Model Averaging method is implemented which is multivariate procedure to consistently selects a small number of predictor genes also provide greater predictive accuracy than other algorithms. In addition, the Iterative Bayesian Model Averaging algorithm for survival analysis is easy to use and computationally efficient.','To study Iterative Bayesian Model Averaging method for survival analysis on high-dimensional microarray data.\r\n\r\nTo evaluate the performance of Iterative Bayesian Model Averaging method for patientsâ?? survival analysis on high dimensional microarray data.\r\n','By using Iterative Bayesian Model Averaging method to select small number of informative gene for survival analysis in two cancer data.\r\n \r\n','research','SED02',' Matlab  ',' Intel dual core processor',' Iterative Bayesian Model Averaging algorithm','AC060261','Pending','200920101',64,NULL,NULL,'Y'),
 ('SISTEM PENGANALISAAN SOAL SELIDIK LATIHAN PRAKTIKAL','Para pelajar harus menjalani Latihan Praktikal sebagai salah satu kursus wajib sebelum menamatkan pengajian yang mereka ceburi. Setiap kali, ada sahaja laporan dari para pelajar yang sudah menjalani Latihan Praktikal bahawa mereka kerap melakukan kerja â??kerja diluar skop pengajian mereka di universiti.. Ada juga pelajar yang lambat mengemukkan tempat Latihan Praktikal mereka berikutan masih mencari tempat sesuai dengan bidang yang mereka ambil. Untuk mengatasi masalah ini, satu sistem telah dibina untuk membantu para pelajar yang bakal menjalani Latihan Praktikal dalam mencari organisasi-organisasi yang sesuai mengikut bidang pengajian mereka.','Membantu para pelajar yang bakal mengikuti Latihan Praktikal dalam memilih organisasi-organisasi yang bersesuaian mengikut kursus yang mereka ambil, skop kerja yang dilakukan, elaun yang diberikan dan lain-lain lagi.','Pengguna boleh dipecahkan kepada 3 iaitu penyelia Latihan Praktikal, pelajar yang mengikuti Latihan Praktikal, dan organisasi, tempat pelajar tersebut menjalani Latihan Praktikal.\r\n\r\nSetiap pengguna perlu mengisi borang mengenai organisasi tersebut secara online.\r\n\r\nBorang ini akan memberitahu tentang latar belakang organisasi tersebut.\r\n\r\nPara pelajar yang bakal menjalani Latihan Praktikal, boleh mendapatkan maklumat syarikat berdasarkan maklumat yang dimasukkan tadi.\r\n','softDev','SED01','Microsoft Windows XP Professional, PHP, ORACLE 7, Microsoft Internet Explorer, Adobea Dreamweaver CS3, Adobe Photoshop CS2, Microsoft Office 2007, Microsoft Project Profesional','Intel Pentium III 1GHz, Hard disk 20 GB, RAM 256 MB, Monitor 16 bit warna dengan paparan resolusi 800x600, CD ROM Imation 52x, mouse, keybord, and modem',' search engine','AC073055','Pending','200920101',65,NULL,NULL,'Y'),
 ('Sistem Pilihan Raya UTM Secara Atas Talian','Pilihan raya kampus UTM skudai adalah penting bagi semua mahasiswa UTM, dimana wakil pelajar akan dipilih melalui pilihan raya tersebut. Pilihan raya kampus yang dijalankan di UTM adalah secara tradisional iaitu undian adalah sekeping kertas yang dicetak calon-calon perwakil pelajar, dan mahasiswa akan menandakan calon yang ingin dipilih dengan tanda X dan dibuangkan ke dalam kotak hitam.\r\n          Cara tradisional adalah tidak cekap dan kertas yang digunakan juga merupakan satu kos yang besar dalam pilihan raya dan tidak mengamalkan sifat mengelakan kesan rumah hijau. Disamping itu, cara menandakan calon tanpa symbol X dan dengan pencil juga akan dianggap sebagai undian buangan yang akan mengakibatkan  keputusan sebenar pilihan raya adalah tidak tepat.Selain itu pengiraan undian dengan cara tradisional juga boleh mengakibatkan kesalahan dalan mengira undian. Statistik keputusan ini tidak mengambarkan keputusan yang tepat dan akan terpilihnya wakil yang tidak sepatutnya. Dengan sistem dibinakan, masalah tersebut boleh diatasikan.\r\n           Dengan adanya system ini, prosess pilihan raya akan dijalankan dengan lancar dan memberi kesenangan kepada pegundi dan penyelaras pilihan raya. Keputusan akan diperolehi dangan lebih cepat berbanding dengan cara tradisional.\r\n','Objektif bagi projek ini adalah berikut :\r\n-	Untuk membangunkan antara muka grafik pengguna (GUI) yang senang digunakan dan megelakan undian buangan.\r\n-	Untuk menrekodkan data-data undian dengan lebih berkesan dimana undian akan disimpankan dalam pangkalan data.\r\n-	Untuk menganalisiskan dan mengirakan undian.\r\n-	Untuk menghasilkan gambaran grafik statistik keputusan pilihan raya.\r\n','Sistem ini akan digunakan dalam pilihan raya kampus UTM sahaja. Kajian akan dijalankan di UTM untuk mendapatkan maklumat . Pengumpulan maklumat akan dijalankan dalam tempoh masa satu bulan di kampus UTM. ','softDev','SED01','   Microsoft Project, Microsoft Office Word, Microsoft Visual Studio, \r\n  Enterprise Architect, MySQL.\r\n ','  Komputer',' ASP.NET,SQLServer ','AC070045','Pending','200920101',66,NULL,NULL,'Y'),
 ('Sistem Pengurusan Pekerja untuk Syarikat Kecil dan Sederhana','Kebanyakan syarikat kecil dan sederhana yang ada sekarang masih menggunakan kertas atau fail untuk merekodkan maklumat pekerja. Jika majikan mahu mencari salah satu maklumat pekerja, mereka perlu mencari fail-fail yang simpan dalam laci atau almari. Cara penyimpanan ini mengambil masa untuk mencari fail pekerja. Maka, Sistem Pengurusan Pekerja untuk Syarikat Kecil dan Sederhana (SPPSKS) direka untuk menyelesaikan masalah ini. SPPSKS merupakan satu sistem yang dapat memudahkan kerja terutamanya jabatan kemanusiaan di dalam suatu syarikat kecil dan sederhana. Sistem ini dibina dengan mempunyai fungsi asas yang diperlukan oleh jabatan kemanusiaan dalam satu syarikat kecil dan sederhana. Oleh kerana bagi syarikat yang kecil dan sederhana tidak memerlukan fungsi yang terlalu banyak dan rumit jika berbanding dengan sistem pengurusan pekerja yang digunakan oleh syarikat besar. Maka, sistem ini adalah senang dan mudah untuk majikan syarikat gunakan untuk menyimpan maklumat dan menjalankan urusan pekerja. SPPSKS berfungsi menyimpan segala maklumat pekerja dalam satu syarikat ke dalam pangkalan data. Maklumat disimpan termasuk maklumat peribadi, kebajikan, masa bekerja, kesalahan, tempat atau peristiwa kecederaan dan juga pendapatan pekerja. SPPSKS memudahkan majikan mencari maklumat-maklumat pekerja dengan senang dimana perlukan ID pekerja dan nama pekerja sahaja. Dengan adanya SPPSKS, masa majikan syarikat mencari maklumat pekerja dapat dijimatkan dan dapat merekodkan maklumat pekerja dengan lebih sistematik. Keselamatan segala maklumat yang disimpan dengan menggunakan SPPSKS adalah dijamin dan hanya orang yang mempunyai kata laluan sistem sahaja yang berhak melihat dan mengubah maklumat pekerja. Fungsi keselamatan ini dapat manjamin keperibadian pekerja daripada terdedah dan elakkan daripada salahgunaan oleh pihak yang berniat.','1)  Merekodkan segala maklumat tentang pekerjaan yang dibuat oleh setiap pekerja dalam satu syarikat. \r\n2)  Mengimpan semua maklumat pekerja dalam satu tempat.\r\n3)  Mendapatkan maklumat dengan lebih mudah, cepat dan tepat.\r\n4)  Memastikan maklumat pekerja dapat disimpan dengan lebih selamat daripada terdedah.\r\n','Penggunaan perisian ini menumpu kepada syarikat kecil atau sederhana. Projek ini akan mencari syarikat kecil atau sederhana yang ada di Taman Universiti, Skudai Johor untuk mengumpulkan maklumat. Syarikat yang ditemukan diandaikan sebagai pengguna yang akan guna sistem ini selepas dibina. Maka, segala keperluan asas Sistem Pengurusan Pekerja untuk Syarikat Kecil dan Sederhana adalah berdasarkan syarikat yang ditemukan.','softDev','SED01',' Microsoft Project, Microsoft Office Word, Microsoft Visual Studio, Enterprise  Architect, MySQL  ',' Komputer',' C#.net, Sql server   ','AC070111','Pending','200920101',67,NULL,NULL,'Y'),
 ('TigerTrans Pte Ltd Web Portal','Web portal provides information from multiple sources in a same site. Web portal gives a company or an organization an opportunity to provide a consistent presentation using access control and procedures for various applications which usually consist of different entities. In this day and age, most of the people would value fast and easy search for information and in obtaining the information as well. They prefer getting information from the comfort of their home or office without having to go out to look for the information. With this web portal, the public user could access the company information without having to drop by the premise of the company. Besides, the public user could compare foreign exchange rates and have access to the lists of quotations from the company. The private users of the system are the staffs of the company and some of them are the administrative staffs of the company. The staff could access to the information and update or edit their private information as well as the company information. They could also update and see the changes being made to the calendar in real time and to apply for leave online. Currently the company manages their information manually and hence with this web portal, the company is able to manage and maintain their information easily.','1)	To build a web portal with dynamic content which all private users can access to it.\r\n2)	To build a prototype of the system and to test it.\r\n3)	To provide facilities for the private users to perform leave application and updating of the calendar.\r\n','1)	Security in the system is not the utmost important as anyone on the internet can access to all the information in the web portal except for the private information of the company.\r\n2)	Only the staffs of the company can login to the system.\r\n3)	The public user cannot edit the company information in the site.\r\n','softDev','SED01','  Microsoft Windows XP operating system, Internet Explorer 7, Visual   Studio 2008, Enterprise Architect, MySQLServer',' Pentium 4 processor, 1GB RAM, 2GB hard disk, colour monitor, modem with minimum speed of 54.6 kbps, mouse and keyboard',' ASP.NET, C#','AC070109','Pending','200920101',68,NULL,NULL,'Y'),
 ('Pangkalan Data Penerbitan Malaysiana (MyPD)','Sejak 1990-an, gerakan pembangunan penerbitan ilmiah secara muafakat apabila Jawatankuasa Penerbitan Pangajian Tinggi (PEPET) ditubuhkan.Namun begitu, sumber dan modal penerbitan ilmiah di Malaysia adalah kecil dan tidak bersepadu.Terdapat beberapa cadangan untuk memperbaiki situasi sebegini, misalnya pembentukan konsortium pemasaran bersepadu yang akan dikongsi secara bersama oleh pernerbit-pernerbit university pada tahun 2003 telah pun menemui jalan buntu.\r\n\r\n Oleh kerana platform yang mengetengahkan penerbitan tempatan tidak dilakukan, maka kualiti penerbitan tempatan sukar untuk dipertingkatkan kerana ia tidak dirujuk dan kandungannya tidak diperbahaskan dan diperkembangkan. \r\n\r\nMasalah-masalah seperti yang dibincang  diatas telah kami mengaji , meneliti dan bercadang untuk membangunkan sebuah aplikasi pangkalan data penerbitan Malaysiana (MyPD). pangkalan data penerbitan Malaysiana (MyPD)adalah satu sistem berasaskan web yang membolehkan hasil penyelidikan diterbitkan dan dirujuk secara dalam talian. \r\n\r\nAplikasi pangkalan data penerbitan Malaysianana (MyPD) akan mempunyai ciri-ciri seperti berikut: \r\n-	Carian dan imbasan (browse) sumber - mempunyai fungsi yang membolehkan pengguna membuat carian sumber secara cepat, termaju atau pakar serta mengimbas judul penerbitan. \r\n-	Sumber hangat - mempunyai fungsi yang membolehkan pengguna melihat senarai sumber yang terbaru, yang paling banyak dimuat turun dan yang paling banyak dipetik.\r\n-	Pratoton sumber - mempunyai fungsi yang membenarkan pengguna melihat abstrak dan garis kasar sumber. \r\n-	Paparan dan cetakan sumber - mempunyai fungsi yang membolehkan pengguna melihat keseluruhan kandungan sumber dalam Portable Document Format (PDF) dan mencetaknya. \r\n-	Emel sumber - mempunyai fungsi yang membolehkan pengguna mengemel sumber kepada penerima yang tertentu.\r\n-	Belian sumber - mempunyai fungsi troli beli-belah (shopping cart) yang membolehkan pengguna membuat belian sumber secara dalam talian\r\n-	Sumber berkaitan - mempunyai fungsi yang membolehkan pengguna melihat senarai sumber berkaitan bagi sesuatu sumber. \r\n-	Petikan(citation) - mempunyai fungsi yang membolehkan pengguna melihat senarai petikan bagi sesuatu sumber berdasarkan kepada maklumat yang disediakan oleh Google Scholar (http://scholar.google.com.my) atau SCOPUS (http://www.scopus.com) \r\n-	Notifikasi sumber - mempunyai fungsi yang membolehkan pengguna menerima emel yang memaklumkan kepada mereka setiap terbitan baru .\r\n-	Notifikasi petikan- mempunyai fungsi yang membolehkan pengguna menerima emel yang memaklumkan kepada mereka setiap petikan baru yang dibuat terhadap penerbitan yang dihasilkan oleh mereka.\r\n\r\nSatu pangkalan data penerbitan amatlah perlu dibangunkan supaya boleh dijadikan sebagai strategi bagi menjayakan hasrat negara untuk menjadi negara maju yang kaya dengan penerbitan ilmiah sebagai bahan pengajaran dan rujukan. \r\n','1.	Mengumpul dan mengenalpasti keperluan sistem aplikasi MyPD.\r\n2.	Merekabentuk aplikasi MyPD menggunakan Unified Modeling Language (UML)\r\n3.	Membangunkan aplikasi MyPD yang berasaskan web.\r\n4.	Menguji aplikasi MyPD di dalam persekitaran pengujian.\r\n','-	Sumber MyPD merangkumi semua jenis penerbitan berbentuk buku, journal, monograf, laporan teknikal dan thesis yang diterbitkan oleh Universiti Teknologi Malaysia(UTM) dan yang berkaitan dengan kajian hayat(Life science). Bahan-bahan ini akan disimpan dalam bentuk salinan eletronik.\r\n\r\n-	Aktiviti MyPD merangkumi pendokumentasian seperti pengkatalogan, pengkelasan, pengindeksan dan penambahan maklumat serta perkhidmatan sepert carian dan belian bahan pemetikan, pemberitahuan serta pengiklanan. Aktiviti-aktiviti ini akan dilaksanakan malalui antara muka MyPD.\r\n\r\n-	Bahan-bahan yang taerdapat dalam simpanan MyPD akan dikategorikan kepada: \r\nI.	Koleksi terbuka iaitu bahan yang keseluruhan kandungannya boleh dipapar oleh pelayar selain boleh dimuat turun secara percuma dan tanpa sebarang sekatan\r\nII.	Koleksi tertutp iaitu bahan yang hanya sinopsisnya sahaja boleh dipapar oleh pelayar tetapi keseluruhan kandungannya boleh dimuat turun dengan harga tertentu.\r\n\r\n \r\n-	MyPD akan dibangunkan dengan menggunakan teknologi-teknologi seperti berikut:\r\nI.	Teknologi berasaskan web supaya semua penerbitan tempatan boleh dicapai secara dalam talian menggunakan palayar web seperti Microsoft Internet Explorer dan Mozilla.\r\nII.	Sistem ini berasaskan web dan dibangunkan menggunakan bahasa pengaturcaraan JSP dan menggunakan pangkalan data MySQL\r\nIII.	Sistem ini mempunyai 3 proses metodologi. \r\n	- Spesifikasi Keperluan Sistem (SRS),\r\n	- Pembangunan dan Reka Bentuk Sistem (SDD), \r\n	- Pengujian dan Pengesahan Sistem (V&T)\r\n','softDev','SED01','     Dreamweaver CS3   ','    OS window','  Merupakan sistem berasaskan web. Perisian Web Aplikasi Tomcat, Bahasa Pengaturcaraan Java/JSP, Pangkalan DataMySQL dan juga JReport sebagai perisian menjana laporan.     ','AC060053','Pending','200920101',69,NULL,NULL,'Y'),
 ('Analisis Taburan Populasi Herpetofauna di Semenanjung Malaysia Menggunakan Aplikasi Google Maps ','Laman web www.amphibia.my menyenaraikan semua jenis spesis amphibia dan reptilia. Setiap spesis pula dinyatakan nama saintifik, nama tempatan, tempat boleh dijumpai, sejarah kehidupan, status pemeliharaan, taburan populasi, dan ciri-ciri fizikal.\r\n\r\n	Dari laman web ini tidak dapat dimuat turun data tentang setiap spesis Herpetofauna. Di samping itu, laman web ini tidak menunjukkan taburan populasi Herpetofauna secara visual yang dapat memudahkan ahli biologi membuat rujukan.\r\n\r\n	Oleh itu, tujuan projek ini dicadangkan adalah untuk membina laman web baru yang hanya akan melibatkan semua jenis Herpetofauna. Laman web yang dibina akan dimasukkan rajah peta semenanjung Malaysia yang akan menggambarkan taburan populasi Herpetofauna dengan menggunakan aplikasi Google Maps. Aplikasi ini akan menggunakan data Herpetofauna berdasarkan titik latitud dan longitud dimana spesis tersebut boleh ditemui.\r\n\r\n	Data dan rumus untutk mengira index taburan populasi Herpetofauna akan diperolehi dari Dr. Shahir Shamsir bin Omar iaitu pensyarah yang mencadangkan tajuk projek ini. Selain itu, laman web yang dibina boleh memuat turun data tentang setiap jenis Herpetofauna untuk memudahkan ahli biologi membuat rujukan.\r\n','- Mengenalpasti kelemahan di laman web yang sedia ada.\r\n- Mencipta laman web baru untuk mengatasi kelemahan laman web sedia ada.\r\n- Membina sistem baru yang lebih mudah dan boleh digunakan oleh pengguna. \r\n','- Digunakan oleh ahli biologi untuk memanipulasi data berkaitan taburan populasi Herpetofauna di setiap negeri di semenanjung Malaysia.\r\n- Sistem yang dibangunkan adalah berdasarkan pembangunan web dan pengurusan pangkalan data.\r\n','softDev','SED01','Adobe Dreamweaver CS4, MySQL(xampp).','Komputer','PHP (Hypertext Preprocessor), Google Maps. ','AC060179','Pending','200920101',70,NULL,NULL,'Y'),
 ('Sistem Tempahan Gelanggang Dan Peralatan Sukan Kompleks Sukan Universiti Teknologi Malaysia (UTM) Berasaskan Web Dan Sistem Pesanan Ringkas','Sistem tempahan gelanggang dan peralatan sukan di Kompleks Sukan UTM pada masa ini dijalankan secara manual. Sistem manual ini didapati tidak sistematik dan kurang berkesan kerana warga UTM atau orang awam yang ingin menempah gelanggang atau peralatan sukan perlu ke kompleks sukan tersebut untuk mengisi borang secara manual. Keadaan ini menunjukkan sistem manual ini tidak efisien kerana pengguna yang tinggal berjauhan dari UTM atau Johor umpamanya perlu membazir tenaga, kos dan masa untuk ke kompleks sukan. \r\n\r\nSelain daripada itu, sistem manual ini juga menimbulkan masalah di mana pengguna sukar untuk mendapatkan maklumat mengenai status tempahan peralatan sukan atau gelanggang di kompleks sukan ini. Jadi, mereka tidak dapat mengenalpasti terlebih dahulu gelanggang atau peralatan yang masih boleh digunakan dan belum ditempah oleh pengguna lain sebelum mereka membuat tempahan.\r\n\r\nMasalah seterusnya yang dihadapi apabila menggunakan sistem manual ialah kebarangkalian pertindihan aktiviti atau tempahan dalam suatu masa berlaku adalah tinggi. Selain itu, risiko kehilangan data adalah tinggi kerana cara simpanan yang digunakan secara manual kurang selamat. Hal ini juga tidak sesuai bagi menguruskan data yang bertambah dari semasa ke semasa.\r\n\r\nMasalah lain yang dihadapi ialah sistem pengurusan rekod pinjaman dan pemulangan peralatan sukan secara manual ini sukar untuk dikemaskini dan masalah yang timbul seperti kerosakan atau kehilangan peralatan sukar untuk dikenalpasti.','i. Membangunkan sebuah sistem tempahan gelanggang dan peralatan sukan berasaskan web dan menggunakan khidmat sistem pesanan ringkas.\r\n\r\nii. Mengurangkan risiko kehilangan data dan pertindihan masa. \r\n\r\niii. Memudahkan pengguna membuat tempahan dan kakitangan Kompleks Sukan menguruskan tempahan tersebut.\r\n\r\niv. Membantu kakitangan Kompleks Sukan menguruskan inventori peralatan sukan.\r\n\r\nv. Membolehkan pengguna melihat lokasi gelanggang sebelum membuat tempahan melalui web dan membolehkan pengguna mendapatkan maklumat gelanggang dan peralatan sukan melalui sistem pesanan ringkas.\r\n','i. Sistem yang dibangunkan berasaskan web dan menggunakan khidmat sistem pesanan ringkas.\r\n\r\nii. Pengguna sistem terdiri daripada kakitangan Kompleks Sukan UTM dan pegguna (warga UTM dan orang awam).\r\n\r\na. Kakitangan: menguruskan dan mengemaskini data bagi proses tempahan gelanggang dan peralatan sukan.\r\n\r\nb. Pengguna: membuat tempahan gelanggang dan peralatan sukan.\r\n\r\niii. Sistem yang dibangunkan hanya mengururuskan tempahan gelanggang dan peralatan serta menguruskan  inventori perlatan sukan.\r\n','softDev','SED01','Microsoft Visual Studio 2008, Enterprise Architecture, MySQL','Komputer dan pelayan','ASP.Net     ','AC070193','Pending','200920101',71,NULL,NULL,'Y'),
 ('Sistem Pengurusan Maklumat Berpusat Klinik Pergigian Tun Sri Lanang, Klinik Pergigian Ayer Molek, Dan Klinik Pergigian Ujung Pasir Berasaskan Web Servis','Klinik Pergigian Tun Sri Lanang merupakan sebuah klinik pergigian utama yang memantau dua buah klinik pergigian yang lain di negeri Melaka iaitu Klinik Pergigian Ayer Molek dan Klinik Pergigian Ujung Pasir. Klinik Pergigian Tun Sri Lanang akan mengumpul maklumat-maklumat dari klinik-klinik di bawah pemantauannya dari semasa ke semasa. \r\n\r\nPengurusan maklumat secara manual digunakan bagi menguruskan maklumat-maklumat staf dan pesakit di klinik-klinik pergigian ini. Kaedah ini menyebabkan pengurusan dari segi pengumpulan dan penyimpanan maklumat adalah tidak cekap, kurang berkesan dan sukar dikendalikan. Ini kerana, bagi mengumpulkan maklumat-maklumat yang diperlukan, staf dari klinik pergigian di bawah pemantauan Klinik Pergigian Tun Sri Lanang perlu menghantar maklumat yang dikumpulkan secara manual ke Klinik Pergigian Tun Sri Lanang. Kaedah ini dilihat sebagai kurang efektif dan tidak sistematik. \r\n\r\nSelain itu, risiko kehilangan maklumat adalah tinggi disebabkan oleh cara penyimpanan maklumat secara manual. Disamping itu, maklumat tentang pergigian seperti cara penjagaan gigi dan kaedah rawatan yang disediakan di klinik-klinik tersebut adalah terhad dan penyampaian maklumat tentang pergigian kepada para pesakit tidak dapat disampaikan secara langsung.\r\n','\r\n1.	Membangunkan sistem pengurusan maklumat secara berpusat untuk pekerja dan pesakit berasaskan web.\r\n2.	Mewujudkan sebuah sistem perantara yang membolehkan perkongsian maklumat antara klinik-klinik yang terlibat.\r\n3.	Menyalurkan maklumat tentang pergigian dengan lebih meluas dan terperinci kepada pengguna.\r\n4.	Membolehkan pengguna membuat temujanji bagi mendapatkan rawatan di klinik pergigian yang terpilih.\r\n\r\n','1.	Sistem yang dibangunkan berasaskan web servis.\r\n2.	Pengguna sistem terdiri daripada kakitangan dan pesakit KlinikPergigian Tun Sri Lanang, Klinik Pergigian Ayer Molek, , dan Klinik Pergigian Ujung Pasir.\r\na.	Kakitangan : memasukkan, melihat, mengemaskini, memadam, dan menambah maklumat yang terdapat dalam sistem. \r\nb.	Pesakit : melihat maklumat tentang pergigian seperti penjagaan gigi yang terdapat dalam sistem\r\n','softDev','SED01','MySQL  ','Komputer dan pelayan. ','ASP.Net','AC070238','Pending','200920101',72,NULL,NULL,'Y'),
 ('Gene Selection Using Support Vector Machine for Patient Cancer Survival Analysis','DNA microarray technology allow scientists and researchers to examine the expression of thousands of genes at once. It has been increasingly used to determine and identify genes that are active, hyperactive or silent in normal and cancerous tissue. \r\n\r\nApplying survival analysis to microarray data is to determine a highly predictive model of patientsâ?? time to event using small number of selected genes. To achieve high prediction accuracy on patient cancer survival analysis, microarray data classification method  is an important issue. \r\n\r\nGene selection method is important during analysis and evaluation of the cancer  dataset. A lots of classification algorithms have been discovered and widely used by scientists and researchers in their experiment. For instance, the support vector machine based on recursive feature elimination has been used for genes selection for cancer classification and yield better classification performances and are more biologically relevant to cancer.','1.To study and analyze on the support vector machine in gene selection for patient cancer survival analysis.\r\n\r\n2.To evaluate and benchmarking the result of propose approach with existing techniques.','1.This work will focus on the support vector machine algorithm in gene selection of microarray data.\r\n\r\n2.The dataset we use is diffuse large B-cell lymphoma(DLBCL) data.\r\n\r\n3.The result of experiment will be shown in p-value using Kaplan-Meier graph.\r\n','research','SED02','MATLAB',' Laptop, scanner','Support Vector Machine method of Recursive Feature Elimination(RFE)     ','AC060274','Pending','200920101',73,NULL,NULL,'Y');
INSERT INTO `title` (`proTitle`,`bgProblem`,`objective`,`scope`,`proType`,`proField`,`softSpecification`,`hardware`,`technology`,`metricNo`,`status`,`semester`,`proID`,`evaluator`,`comment`,`title_flag`) VALUES 
 ('Sistem Pengurusan Jabatan Keselamatan UTM Berasaskan Web menggunakan Pesanan Ringkas (SMS)','Setiap organisasi besar yang sangat penting seperti Universiti Teknologi Malaysia (UTM) mestilah mempunyai dan memiliki pecahan jabatan-jabatan yang lain. Setiap jabatan telah ditetapkan corak dan cara kerja masing-masing. Di Jabatan Keselamatan sendiri haruslah mempunyai corak pengurusan yang sistematik dan berkesan supaya organisasi UTM tidak dianggap sebuah organisasi yang ketinggalan zaman dalam bidang pengurusan. Tetapi timbulnya masalah di Jabatan Keselamatan adalah kerana sistem pengurusannya masih lagi menggunakan sistem manual yang menyusahkan dan agak ketinggalan zaman.\r\n\r\nDiantara sistem yang masih menggunakan sistem manual adalah permohonan pelekat kenderaan bagi pelajar dan staff. Pelajar dan staff dikehendaki mengisi borang yang yang mana borang tersebut hanya boleh didapati di bangunan Jabatan Keselamatan atau di kolej masing-masing. Bagi pelajar proses mendapatkan pelekat tersebut juga mengambil masa yang agak lama dan bergantung kepada persetujuan pengetua kolej. Selain itu, sistem sedia ada tidak menyediakan kemudahan untuk menyemak saman dan akan menyukarkan pelajar di kemudian hari. Sebelum ini jika pelajar di saman, pegawai keselamatan hanya menyerahkan surat saman yang agak kecil dimana ia mudah untuk hilang jika tidak di simpan di tempat yang betul. \r\n\r\nBagi pembayaran saman pula hanya boleh di buat di Pejabat Bendahari. Hal ini menyebabkan pelajar terpaksa berurusan dengan pihak Pejabat Bendahari pula. Setiap saman yang dikeluarkan memerlukan pelajar membayar sebanyak RM25. Bagi pelajar yang pertama kalinya di saman, mereka boleh membuat rayuan. Tetapi rayuan tersebut perlu dibuat dalam bentuk surat dan dihantar sendiri ke bangunan Jabatan Keselamatan. Maka melalui sistem laman web yang akan dibangunkan dapatlah mengatasi sedikit sebanyak kesulitan yang di alami.','Setiap projek atau sistem yang dibangunkan haruslah mempunyai objektif bagi penghasilan sebuah sistem yang jelas dan memenuhi kehendak pelanggan. Diantara objektifnya adalah seperti berikut:\r\n\r\n1.Untuk menganalisa dan mengkaji sistem sedia ada yang digunakan sekarang oleh pihak pengurusan jabatan keselamatan.\r\n\r\n2.Untuk membangunkan dan merekabentuk sebuah sistem baru yang lebih sistematik dan berasakan web dan sistem pesanan ringkas (SMS) bagi memudahkan pihak pengurusan.\r\n\r\n3.Untuk menguji sama ada sistem yang baru dibangunkan ini boleh mencapai dan menyelesaikan masalah-masalah sistem sedia ada.','Sebelum membangunkan sesebuah sistem, pembangun sistem perlu menetapkan had dan kekangan sistem yang dibangunkan yang mana ia menjadi syarat dalam menetukan projek atau sistem tersebut dapat dibangunkan dengan jayanya. Antara skopnya adalah seperti berikut:\r\n\r\n1.Sistem ini hanya tertumpu pada pengurusan Jabatan Keselamatan di UTM sahaja.\r\n\r\n2.Sistem ini boleh digunakan oleh pelajar UTM, staff dan pihak pengurusan Jabatan Keselamatan yang berdaftar sahaja.\r\n\r\n3.Tempoh membangunkan sistem ini adalah sepanjang mengikuti subjek PSM 1 dan PSM 2 di UTM.\r\n\r\n4.Sistem ini juga boleh menghantar dan menerima pesanan ringkas (SMS) bagi pemberitahuan membayar saman pada pelajar yang gagal membayar saman pada masa yang ditetapkan dan semakan saman juga boleh dilakukan melalui pesanan ringkas.','softDev','SED01','ASP.Net, MySQL','Laptop atau Komputer Peribadi, Mesin Pencetak dan Internet','JavaServer Pages(JSP), Apache, dan Short Messaging Service (SMS)','AC080341','Pending','200920101',74,NULL,NULL,'Y'),
 ('Sistem Capaian Maklumat Herba berdasarkan Gambar dan Nama','1. Ramai Golongan dewasa dan remaja tidak mengenali jenis atau rupa herba.\r\n2. Sistem maklumat herba kebanyakkan hanya    memaparkan maklumat khasiat herba tanpa gambarnya atau sebaliknya.','1. Mengkaji dan menganalisa masalah ini yang sedia ada.\r\n2. Membangunkan Sistem capaian Maklumat tentang herba berdasarkan gambar dan nama.','1. Golongan remaja dan dewasa\r\n2. Pengkaji atau pengamal herba','softDev','SED01','  Java bean, JSP, Mysql',' Komputer riba,',' -','AC073098','Pending','200920101',75,NULL,NULL,'Y'),
 ('Sistem Pengesanan Pencerobohan Internet melalui Laman Web','Serangan siber merupakan salah satu isu yang hangat diperdebatkan buat masa ini. Ia melibatkan semua sistem dan juga mampu menganggu ekonomi serta imej dunia. Pendekatan dunia tanpa sempadan mendedahkan aplikasi internet kepada bahaya pencerobohan. Isu seperti web defacement, pencurian maklumat sensitive, denial of service , dan sebagainya sebenarnya mendatangkan imej buruk dan mewujudkan masalah yang besar kepada sesuatu agensi. Untuk mengurangkan serangan tersebut satu aplikasi perlu di bangunkan bagi mengesan peringkat awal serangan sebelum berlakunya insiden. Mekanisma bagi memantau trafik rangkaian dan juga memantau aktiviti yang meragukan perlu bagi memberi amaran awal kepada pentadbir sistem dan rangkaian.\r\n\r\nDengan membangunkan web ini, pengguna laman web ini boleh memantau trafik rangkaian dan memantau aktiviti yang meragukan dan dapat mengambil langkah keselamatan untuk mengelakkan mereka diceroboh oleh penggodam atau sebarang serangan sebelum berlakunya insiden. Kes  sistem diceroboh juga dapat dikurangkan kerana pengguna dapat mengambil tindakan lebih pantas daripada penggodam.\r\nLaman web ini diaplikasi dengan mengguna Snort sebagai enjin untuk sistem ini,bahasa PHP sebagai bahasa untuk membangunkan web dan MySql sebagai pangkalan data. Untuk menggunakan laman web ini, pelayar web perlu mendaftarkan diri kedalam web server ini sebagai pengguna. Untuk mengisi borang pengguna, pengguna perlu mengisi maklumat mereka seperti alamat IP,username,kata laluan dan emel. Setelah mereka telah mendaftarkan diri kedalam laman web ini,mereka boleh â??loginâ?? kedalam sistem sebagai pengguna dan mereka boleh memantau trafik rangkaian mereka dan meningkatkan keselamatan mereka.\r\n','â?¢	Memantau aktiviti yang meragukan perlu bagi memberi amaran awal kepada pentadbir sistem dan rangkaian.\r\nâ?¢	Mengurangkan kadar serangan dan berlakunya insiden keatas rangkaian sistem.\r\nâ?¢	Meningkatkan kadar keselamatan rangkaian komputer.\r\n','â?¢	Skop projek ini hanya akan mengesan sebarang aktiviti rangkaian yang meragukan dan memberi amaran kepada individu yang terlibat menggunakan medium web.','softDev','SED01','  Snort Engine,PHP,MySql',' Laptop',' ','AC070137','Pending','200920101',76,NULL,NULL,'Y'),
 ('PEMBANGUNAN APLIKASI ANTARAMUKA PERMAINAN LEGO   ','Perkembangan pesat bidang teknologi di seluruh dunia telah menyebabkan banyak aplikasi teknologi wujud seperti permainan video,  peralatan telekomunikasi yang canggih seperti telefon bimbit, komputer riba dan sebagainya. Lambakan aplikasi teknologi seperti permainan video yang terkenal di kalangan kanak-kanak khususnya telah menyebabkan banyak implikasi yang tidak sihat kerana kebanyakan permainan video yang terdapat di pasaran memaparkan aksi-aksi merbahaya dan ganas yang mana tidak sesuai untuk usia mentah mereka seperti pergaduhan, penggunaan senjata serta adegan pembunuhan walaupun secara maya. Ini secara langsung akan mempengaruhi perkembangan minda dan otak kanak-kanak dan akan menyebabkan mereka memilih jalan yang tidak sihat kelak apabila meningkat dewasa dan akan mengakibatkan masa depan mereka gelap. \r\n	Oleh yang demikian, langkah positif telah diambil oleh sesetengah pihak dengan mengeluarkan produk alatan permainan berasaskan robotik. Salah satu alatan permainan berasakan robotik adalah lego. Lego adalah sejenis alat permainan bongkah(bricks) plastik kecil yang terkenal di dunia khususnya bagi golongan kanak-kanak. Bongkah-bongkah ini akan disusun sehingga boleh membentuk  beberapa jenis model yang sedia ada seperti model kereta, kereta api, bangunan, kapal terbang, kapal angkasa, robot, dan sebagainya daripada binaan mudah hingga kepada binaan yang lebih kompleks. Permainan lego membolehkan kanak-kanak bermain mengikut daya kreativiti mereka. Oleh yang demikian, muncul pula permainan pembinaan bongkah-bongkah(bricks) plastik kecil ini secara maya dan didigitalkan secara kreatif bagi memudahkan golongan kanak-kanak ini bermain. \r\n       Pembangunan aplikasi antaramuka permainan lego bagi kanak-kanak yang akan dibangunkan adalah salah satu jalan penyelesaian kepada masalah lambakan permainan video yang mengandungi elemen ganas dan tidak sesuai untuk usia mereka.  Aplikasi ini berbeza daripada aplikasi antaramuka yang terdapat sebelum ini dengan aplikasi yang akan dibangunkan menerapkan suasana persekitaran grafik yang lebih menarik yang akan digemari oleh kanak-kanak pada tahap usia mereka iaitu lima hingga tujuh tahun. Berbeza dengan aplikasi yang telah sedia ada yang mana menyediakan binaan yang lebih rumit dan kompleks, aplikasi yang akan dibangunkan ini adalah tidak kompleks serta mudah dan sesuai dengan tahap kecekapan golongan kanak-kanak.\r\n	Diharapkan agar aplikasi antaramuka ini dapat memberikan manfaat kepada kanak-kanak agar mereka tidak terleka dan terjebak ke dalam permainan video yang mengandungi elemen tidak sepatutnya di samping dapat meningkatkan daya kreativiti mereka serta memberi pendedahan awal kepada mereka tentang asas pengaturcaraan yang banyak digunakan dalam aplikasi teknologi pada zaman yang semakin mencabar ini.\r\n   \r\n','1.	Mengajar dan memberi pendedahan awal kepada kanak-kanak tentang asas pengaturcaraan sesuai dengan usia mereka.\r\n2.	Mendedahkan persekitaran pembelajaran kanak-kanak dengan aktiviti pembelajaran berasaskan maya yang menyeronokkan dan dapat meningkatkan daya kreativiti mereka. \r\n3.	Memberi kemudahan dan kelengkapan kepada kanak-kanak dalam menerokai bidang robotik dan sebagainya dalam bentuk maya sesuai dengan usia mereka.\r\n4.	Mampu menghasilkan antaramuka permainan lego ini dengan baik, dan dapat menarik minat dan perhatian golongan kanak-kanak.\r\n\r\n','1.	 Pembangunan antaramuka ini dibina dengan menggunakan C sebagai    \r\nbahasa pengaturcaraan serta mengaplikasikan penggunaan Adobe\r\nFlash untuk mendigitalkan dan memaparkan pembinaan serta   \r\npergerakan bongkah-bongkah plastik kec(bricks) secara maya.  \r\n2.	 Selain itu, penggunaan perisian Adobe Flash bagi membina rekabentuk \r\nantaramuka aplikasi ini agar kelihatan lebih menarik.\r\n3.	 Sasaran pengguna bagi aplikasi ini adalah:\r\n a). Kanak-kanak(usia antara 5-7 tahun) : mereka bentuk, menyusun,  \r\nmembina bongkah-bongkah lego secara maya, mengawal pergerakan  \r\nbongkah-bongkah lego\r\n\r\n','softDev','SED01','  Adobe Flash, Bahasa Pengaturcaraan C',' Komputer Riba/komputer peribadi',' ','AC070199','Pending','200920101',77,NULL,NULL,'Y'),
 ('Integration of quiz and question modules on Moodle system with the Studentâ??s performance evaluation system.','Firstly, the current elearning system is using the Moodle system. There are many modules in the Moodle system. For example, enrollment module, authentication module, and themes module, etc. Among the modules, the quiz and question modules are used to construct the quizzes to test the studentâ??s performance.\r\n\r\nHowever, the current system evaluates the student performance is based on the score only.  This evaluation technique is not very accurate, because there are three more other factors that can influence the score. For example, the time taken to finish the quiz, the number of attempts made by the student and the feedback or help used by the student.\r\n\r\nBesides, the studentâ??s performance evaluation system is being developed by one of the post-graduate students in FSKSM, UTM. This system needs the inputs, which are generated from the Moodle system. If the input data used by the studentâ??s performance evaluation system are taken from raw data, then the system will become heavy and can lower the performance.\r\n\r\nTherefore, an intermediate system is needed between Moodle system and studentâ??s performance evaluation system. It is to collect the raw data from Moodle system, analyse and process each attribute (scores, time, attempt, feedback), finally produces the input data for studentâ??s performance evaluation system.\r\n','â?¢To study and analyze the structure of the elearning Moodle system for the quiz and question modules.\r\n\r\nâ?¢To study and analyze the structure of the studentâ??s performance evaluation system.\r\n\r\nâ?¢To develop an intermediate system to access the raw data in quiz and question modules, then to obtain the pre-processed data for studentâ??s performance evaluation system.\r\n\r\nâ?¢To test the output of the system.\r\n','This system is developed for the students in FSKSM, those who take the OOP subject, in UTM Skudai. \r\n\r\nThis system is focusing on the quiz and question modules.\r\n\r\nThis system is developed based on the technologies used by the Moodle system and studentâ??s performance evaluation system. For example, the PHP and mySQL programming languages.\r\n','softDev','SED01','  WinSCP, mySQL',' computer, server.',' PHP, Moodle 1.9, module quiz, module question','AC070073','Pending','200920101',78,NULL,NULL,'Y'),
 ('Virtual Vending Machine (Mesin Vending Tiruan)','Vending machine is a convenient way for both the entrepreneur and also the user. User can get the item on the vending machine anytime as long as the machine is working and the entrepreneur can earn their profit without much hard work. However, it is quite normal for us to see that the machine have error or the coin case is full(coin can\'t be inserted or will drop). Sometimes, the items have been out of stock for days without refilling by the management team. To decrease the incident from happening too frequently, this system will record all the data of the item including the amount of item and also the amount of the coin or money inside the machine. \r\nThis system allows management team to get to know whether they need to refill the item or collecting the money without needing to check the machine according to the schedule. There will be a system on the vending machine that will send the data to the server system. \r\nThe server system is create to observe the data on the vending machine, so that management team donÃ¢??t need to check the vending machine. Server system will manage the data send from virtual system. So, management team just have to get the information on the server system and go for the vending machine that need maintenance. \r\nThis system is created for further implementation into the real vending machine for all kind of user. It is use for business purpose so that the maintenance team can reduce the hard work and increase their efficiency towards the maintenance of the vending machine. \r\n','1)	To study the current vending machine\'s system. \r\n2)	To design a virtual vending machine with server at elsewhere that manage the data of virtual vending machine.\r\n3)	To test a virtual machine for further implementation into real vending machine.\r\n','-Users : tester for further implementation into real vending machine\r\n-virtual system should be able to save data and send the data to the server.\r\n-server should be able to manage the data send by virtual vending machine.\r\n','softDev','SED01',' Microsoft Office 2007 (Word, PowerPoint, Excel), Enterprise Architecture 7.0, JDK 1.6, visual studio. ',' Personal Computers / Laptops, LAN cables, hubs.',' Data Management (search data, edit data, real time data), Object-Oriented Programming(Java,Visual Studio)','AC070277','Pending','200920101',79,NULL,NULL,'Y'),
 ('Sistem Pengurusan  Kandungan Pembelajaran dan Aktiviti Kor Sukarelawan  ','Sistem pengurusan kandungan pembelajaran dan aktiviti dalam organisasi Kor Sukarelawan Polis (SUKSIS) UTM  pada masa kini masih lagi  menggunakan sistem manua1. Penyebaran dan penyimpanan maklumat secara manual didapati sukar untuk dikendali. Berikut merupakan masalah-masalah yang dihadapi : \r\n\r\ni.	Segala nota-nota pembelajaran masih lagi disebarkan dalam bentuk cetakan di atas kertas (hardcopy). Ini akan menyebabkan berlakunya pembaziran dari segi masa, tenaga dan kos yang agak tinggi bagi pentadbir SUKSIS dalam menyediakan peralatan pencetakan dan mengalami permasalahan ruang dalam pemgumpulan dan penyimpanan nota-nota tersebut. Di samping itu, risiko untuk kehilangan segala kandungan pembelajaran juga \r\n\r\nadalah tinggi. Oleh itu, satu sistem yang mudah dan bersistematik akan dibangunkan di mana segala nota-nota pembelajaran boleh disimpan dan disebarkan kepada pelatih dalam bentuk cetakan secara elektronik (softcopy).\r\n\r\nii.	Setiap minggu pelatih Kor Sukarelawan Polis (SUKSIS) akan menjalankan aktiviti yang berbeza. Ketua pelatih dikehendaki datang ke pejabat SUKSIS untuk mendapatkan maklumat mengenai aktiviti yang akan dijalankan pada minggu tersebut dan kemudianya akan disebarkan kepada pelatih-pelatih yang lain. Situasi ini menjadi sukar apabila terdapat perubahan atau pertukaran mengenai aktiviti. Oleh itu, sistem ini dapat menyelesaikan masalah tersebut dengan menggunakan teknologi sistem pesanan ringkas (SMS). Jurulatih ataupun staff perlu mengemaskini aktiviti  yang bakal dilaksanakan pada minggu tersebut di dalam sistem dan kemudian menyebarkannya kepada semua pelatih atau memilih orang-orang tertentu sahaja untuk menerima maklumat tersebut terus melalui sistem pesanan ringkas(SMS). Selain itu, pelatih dan jurulatih juga boleh menyemak aktiviti yang akan diadakan pada minggu tersebut juga melalui teknologi SMS.\r\n\r\niii.	Pelatih-pelatih Kor SUKSIS UTM pada masa kini tinggal di kolej-kolej yang berlainan. Ini memyebabkan mereka jarang berhubung. Oleh itu, sistem ini membolehkan pelatih mahupun jurulatih berinteraksi sesama mereka agar dapat mengeratkan lagi hubungan antara pelatih mahupun jurulatih terutamanya bagi pelatih yang baru mendaftar.\r\n\r\n','(1)	Untuk menganalisa sistem sedia ada yang digunakan sekarang oleh pentadbir SUKSIS UTM.\r\n(2)	Untuk membangunkan sebuah sistem pengurusan kandungan pembelajaran dan aktiviti SUKSIS UTM berasaskan web dan teknologi SMS yang lebih mudah dan  bersistematik.\r\n(3)	Untuk membangunkan sistem yang membolehkan pelatih dan jurulatih berinteraksi sesama mereka.\r\n(4)	Untuk menguji sistem yang dicadangkan.\r\n','(1)	Sistem ini hanya tertumpu kepada pengurusan kandungan pembelajaran dan aktiviti SUKSIS UTM.\r\n(2)	Teknologi SMS hanya digunakan dalam proses penyebaran serta penyemakkan aktiviti mingguan bagi pelatih dan jurulatih SUKSIS UTM sahaja.\r\n(3)	Sistem ini hanya membenarkan pelatih dan jurulatih SUKSIS UTM yang telah berdaftar sahaja untuk berinteraksi sesama mereka.\r\n(4)	Sistem ini hanya boleh digunakan oleh pelatih dan jurulatih SUKSIS UTM yang telah berdaftar sahaja.\r\n(5)	Tempoh membangunkan sistem ini adalah sepanjang mengikuti subjek PSM1 dan PSM11 di UTM.\r\n','softDev','SED01','ASP.net, MySQL (pangkalan data)','Komputer, modem dan telefon bimbit ','JSP (bahasa pengaturcaraan), Apache(server), J2ME','AC080350','Pending','200920101',80,NULL,NULL,'Y'),
 ('FSKSM Information Kiosk','New student intake is held every year and we have a lot of new students who are still blur on things joining our faculty. They need guidance especially in direction through out the faculty. Although our faculty is not very huge in size but one might be searching for a room be it lecture halls, labs or lecturersâ?? room which they might not know the location. Sometimes even the seniors might be searching for rooms that they might not have been to before.\r\n	This is when a guidance system comes in handy. The FSKSM Information Kiosk  will do the job perfectly. This system will store information of the location of the rooms available for access in the faculty building. Besides showing the location of the room, it will also show brief descriptions of the purpose of the building and the contents.\r\n	Besides that, this system would also store lecturerâ??s information such as their email, cellphone number, room extension etc so that students can reach them easily. These information is especially helpful when students are unable to find their lecturers and might not have access to the internet. Not only the lecturerâ??s information can be stored, the information of the technicians in charge of certain rooms or labs could also be stored in this kiosk for easy access.\r\n	However, this system is for further implementation and to be embedded into a real kiosk machine for real-life demonstration. ','1.	To study similar systems\r\n2.	To design a system that can be used in FSKSM\r\n3.	To test the virtual system for further implementation.\r\n','1.	The user of this system would be any visitor to the faculty.\r\n2.	The system would be used in FSKSM.','softDev','SED01','  Microsoft Office, Enterprise Architect',' Personal Computer / Laptop',' OOP','AC070166','Pending','200920101',81,NULL,NULL,'Y'),
 (': E-Pembelajaran  Berasaskan Multi Video Streaming','Streaming sebenarnya adalah proses pengiriman data terus-menerus yang dilakukan secara broadcast melalui Internet untuk diperlihatkan oleh aplikasi streaming pada computer pelanggan. Paket-paket data yang dikirimkan telah dimamapatkan untuk memudahkan pengirimannya melalui Internet.Mengapa disebut streaming? Stream berasal dari bahasa Inggeris yang bermaksud sungai. Proses streaming boleh diibaratkan seperti aliran air di sungai yang tak pernah putus kecuali jika sumber mata airnya mengering. Seperti aliran air di sungai, aliran data streaming dilakukan tanpa ada gangguan dan dilakukan secara berterusan sehingga datanya habis, bermaksud telah selesai dihantar dan diperlihatkan dalam komputer.sebelum ini, sebelum teknologi streaming semaju ini, kita perlu memuat turun file streaming sampai tamat ke dalam komputer untuk  menonton atau mendengarya.\r\n\r\nKini terdapat banyak laman web yang memuatkan teknologi streaming ini bagi tujuan untuk menonton video tanpa memuat turun kedalam komputer ,namun kebanyakan hanya mempunyai  satu sumber streaming pada satu masa. Jika terdapat  aplikasi streaming menerima 2 paket data dalam satu masa untuk diperlihatkan , masalah yang berlaku adalah saat 2 video yang di strim dilihat tidak berlaku serentak, maka saat salah satu video mungkin lebih laju berbanding yang satu lagi. Jika maklumat pada kedua dua video tersebut adalah berkaitan maka penyampaian maklumat tidak dapat dilakukan dengan berkesan. Dengan itu satu mekanisma kawalan keserentakan terhadap multi video strim tersebut perlu dilaksanakan bagi mengawal masa main terhadap multi video strim. Dengan ini dilihat multi video stream berada dalam keadaan  saling bergantungan antara satu sama lain terutama apabila salah satu video yang distream dianjakkan masa main kehadapan maka video yang lain mestilah menerima paket data yang berkaitan pada masa yang sama.   \r\n','\r\n\r\nI.	Menganalisis  penggunaan video strim didalam sesebuah sistem berasaskan web  sebagai  salah satu medan  penyampaian maklumat .\r\nII.	Membina sebuah sistem berasaskan web yang  menyokong beberapa video strim  dalam satu masa.\r\nIII.	Membuat kawalan keserentakan terhadap dua  video yang di strim dalam suatu masa tertentu .\r\nIV.	Membuat kawalan serentak mengikut  masa terhadap multi video strim apabila pengguna menggerakkan  kehadapan terhadap masa  salah satu video.\r\nV.	Menjalankan ujian terhadap sistem yang dibina samada memenuhi keperluan yang telah disediakan atau sebaliknya.\r\n','\r\nI.	Aplikasi ini hanya boleh menyokong klip video yang berjenis mp4, 3gp dan mov sahaja.\r\nII.	Melibatkan penggunaan Helix/Darwin Server untuk penyimpanan kandungan video.\r\nIII.	Sistem ini membolehkan admin untuk memuat naik multi fail video yang berkaitan dan menyeragamkan fail tersebut dengan nama yang sesuai bagi tujuan keserentakan masa semasa strim.  \r\nIV.	Sistem ini boleh mengawal masa multi video strim sentiasa dalam keadaan serentak.\r\n','softDev','SED01','NetBeans 6.5,Helix/Darwins Server,Adobe Dreamweaver CS3,MySQL  \r\nAdministrator\r\n','computer,server ','Streaming','AC080336','Pending','200920101',82,NULL,NULL,'Y'),
 ('Recycle Materials Purchase and Sale System for Jaya Hijau Enterprise','  Today, recycle industry is a much more imminent important growing sector not only in Malaysia but also around the world. Supported by world governments and organisation to improve, these industries are built to reduce the impact of increasing rubbish over the environment. The industries are making only simple steps to achieve this great ambition, to reuse every material that is reusable from the rubbish that we have created. The materials could be range from single A4 size paper or aluminium cans to large vessel like cars or even large ships like aircraft carriers.\r\n  These items are to be collected and processed to become a new form of itself if not to other form. For example like the papers, it will be smashed up to become pulps and treated before it is made to papers again. On the other hand, the recycle item like plastics and steels need to be clean first before it is melted to make other item again. With this ingenious process, the world is now will produce less rubbish where actually the rubbish that produced everyday is on a worrying level.\r\n  Like other recycle industries, Jaya Hijau Enterprise is specialising in collecting recyclable papers and plastics. The process of purchasing and selling of the material involve weighing activity. The price of the material is following the countryâ??s market price. Jaya Hijau Enterprise is still using a conventional method which is rather slow. Therefore, in order to support the large growing number of customer and more efficient data management, a new system is to be developed to answer the challenge.\r\n  The system will help a lot in improving the company service with the implementation of new hardware and software through the development of this system. The company will benefit much from this system as it will reduce large amount of tedious work and more accurate data managing method.\r\n','The objective for the system is as below:-\r\ni)	To develop a computer system based on bar code technology in the weighing process.\r\nii)	To create a fast and accurate money calculating system.\r\niii)	To create a management system that is able to store, process business information and generate detail report for the management.\r\niv)	The ability to supply buy-sell information and live coverage to the management.\r\n','The scope for this project is:-\r\ni)	The system developed includes the purchase and sale for the recycle items.\r\nii)	This system is to be handled by the staffs of Jaya Hijau Enterprise.\r\niii)	This system does not impose tight security on the weighing process done by general worker.\r\n','softDev','SED01','Java, JSP, MySQL and software that associated with hardware ','Computer, electronic weighing scale, bar code reader, printer and CCTV','Internet Technology, Bar Code','AC070164','Pending','200920101',83,NULL,NULL,'Y'),
 ('Sistem Pengurusan Kolej Kediaman Menggunakan Teknologi  RFID','Sistem pengurusan kolej kediaman di Universiti Teknologi Malaysia pada masa kini masih lagi  \r\nmenggunakan kaedah manual. Sebagai contoh ketika di awal semester, jika para pelajar sampai ke kolej kediaman pada waktu malam mereka tidak dapat masuk ke bilik sendiri kerana kunci bilik mereka berada di pejabat kolej kediaman yang mana hanya boleh di ambil ketika waktu pejabat sahaja. \r\n\r\nSelain itu, penggunaan kunci juga melibatkan banyak masalah. Hal ini kerana, kunci mudah untuk dipenduakan di mana â?? mana kedai kunci. Sebagai contoh, apabila kunci telah dipenduakan kejadian kecurian boleh berlaku kerana mereka dapat memasuki bilik tersebut dengan lebih mudah. Ini menunjukkan tahap keselamatan sistem manual masih lagi lemah.\r\n\r\n\r\nIbu bapa tidak dapat menjejak pergerakan anak mereka dalam kolej kediaman. Sistem manual sekarang tidak menyediakan fungsi untuk mengetahui pergerakkan anak â?? anak mereka. Oleh itu, masalah sosial yang teruk semakin meningkat di kalangan para pelajar. \r\n\r\nMasalah hutang kolej kediaman juga merupakan masalah yang amat payah untuk di selesaikan. Kebanyakkan pelajar mengambil mudah hal ini kerana sistem sedia ada tidak mengenakan tindakkan yang tegas terhadap mereka. Jika mereka tidak membayar hutang mereka masih lagi dapat masuk ke bilik masing â?? masing. \r\n\r\nOleh itu, masalah ini dapat diatasi dengan pengunaan teknologi RFID. Sebagai contoh meletakkan tag RFID ke dalam matrik kad pelajar. Jika mereka tiba di kolej kediaman pada lewat malam mereka akan dapat terus masuk ke bilik tanpa perlu pergi ke pejabat kolej kediaman lagi. Selain itu, ibu bapa juga dapat menjejaki pergerakan anak â?? anak mereka di kolej kediaman kerana apabila mereka mengimbas kad tersebut, satu data telah di hantar ke pengkalan data yangg menunjukkan anak â?? anak mereka keluar dan masuk kolej kediaman. Masalah hutang juga akan dapat di selesaikan kerana pelajar akan membayar hutang tersebut untuk memasuki bilik mereka masing â?? masing.  \r\n','Tujuan utama sistem ini dibangunkan adalah untuk membolehkan pengurusan kolej kediaman menjalankan operasi dengan lebih cekap dan berkesan. Antara objektif projek  ini ialah: \r\n1.    Mengkaji sistem pengurusan kolej kediaman yang sedia ada.\r\n2.    Membangunkan speksifikasi keperluan dan reka bentuk untuk pengurusan kolej kediaman\r\n3.    Membangunkan dan menguji sistem pengurusan asrama yang menggunakan teknologi RFID.        \r\n','Di antara skop yang telah digariskan dalam pembangunan sistem ini adalah seperti berikut:\r\n1.  Sistem ini digunakan oleh para pelajar, ibu bapa, staff pengurusan kolej kediaman dan penolong \r\n     pengurus asrama. \r\n2.  Sistem ini dibangunkan menggunakan teknologi RFID yang di masukkan dalam matrik kad pelajar    \r\n     untuk memudahkan para pelajar memasuki bilik masing-masing.\r\n3.  Fungsi ini membolehkan sistem di kawal secara automatik dan mempunyai banyak lagi kelebihan. \r\n','softDev','SED01','  Microsoft Visual Studio 2008, Enterprise Architecture',' RFID Reader, RFID tag',' ASP.NET    ','AC070140','Pending','200920101',84,NULL,NULL,'Y'),
 ('Web Application of Tutorial for Data Structure and Algorithm','Sistem pendidikan tradisional berasaskan \'give and take\' di mana pelajar (\'take\') menerima ilmu pengetahuannya terus daripada pensyarahnya (\'give\'). Jadi dalam sistem pendidikan tradisional, pensyarah memainkan peranan yang aktif dalam pengajaran manakala pelajar secara pasif menerima pengetahuan itu. \r\n\r\nDalam pengajaran, pensyarah dikehendaki menyediakan sumber kuliah yang mencukupi demi menjamin segala ilmu pengetahuannya dapat disampaikan kepada pelajar. Namun hal ini tidak menjamin pelajar dapat menerima ilmu pengetahuan tersebut dengan sepenuhnya. Jadi, pensyarah kadang kala terpaksa melakukan pengujian terhadap pelajar demi memastikan mereka mengikut pelajaran. Kerja ini memakan masa.\r\n\r\nPada masa yang sama, kebanyakan pelajar menghadapi masalah dalam memanipulasikan ilmu pengetahuan yang diperoleh. Pelajar biasanya menerima ilmu pengetahuan terus daripada pensyarah dan jarang berfikir terhadap pengetahuan tersebut. Mereka hanya akan memerlukan pengetahuan \r\ntersebut apabila adanya masalah yang memerlukan pengetahuan mereka untuk menyelesaikannya. Soalan yang mendalam dan kompleks dapat memaksa mereka berfikir dan mencari penyelesaian dengan memanipulasikan pengetahuan yang diperolehi. Kadang kala juga dapat memaksa mereka menjadi berdikari untuk mencari pengetahuan yang baru bagi mengatasi masalah.\r\n\r\nDi samping itu, pelajar memerlukan latihan dan pratikal untuk menguji tahap pengetahuan mereka. Melalui keputusan latihan dan pratikal, mereka dapat tahu kebolehan mereka sekarang dan berapa lagi mereka kena berusaha untuk mencapai keperluan syllabus.\r\n','1. Membangunkan aplikasi tutorial  online yang boleh melakukan sesetengah kerja secara automatik, dan kerja yang lain mengikut arahan pengguna.\r\n\r\n2. Menghasilkan aplikasi tutorial online yang mengambil kira gaya pembelajaran pelajar.\r\n\r\n3. Menghasilkan aplikasi tutorial online yang mampu menganalisis keputusan yang diperolehi dari pelajar, memproses, dan menghasilkan analisa.\r\n\r\n4. Menghasilkan aplikasi tutorial online yang mempu memperolehi analisa secara sistematik dan teratur.\r\n','1. Dibangunkan dengan mengandungi informasi yang dicatatkan dalam syllabus Struktur Data dan Algoritma.\r\n\r\n2. Dikendalikan kepada pensyarah yang terlibat dalam pengajaran subjek Struktur Data dan Algoritma, serta pelajar yang mendaftar subjek tersebut.\r\n ','softDev','SED01','   MySQL, NetBeans IDE 6.7   ','   Computer','   Java Programming, Java Script','AC070041','Pending','200920101',85,NULL,NULL,'Y'),
 ('UTM Guiding System','Most of the visitors or UTM students are not sure about the geography of buildings or locations in area of Universiti Teknologi Malaysia (UTM) especially for the newcomers. Every year UTM newcomers face the problem of finding the place-to-go in UTM. The information in the map is insufficient for them. They always get lost or late for their appointment.\r\n	The map information provide in this UTM guiding system will give the full information of the location or place in UTM. For example, user pick a location in the map, the system will display the whole information of the location. The information provided includes the building picture, the brief description, and so on. This kind of information is useful for the newcomers.\r\n	Optimal path or shortest path service is also provided in this system. This service will largely reduce the time for travelling. Besides that, optimal path way can make sure the user arrive the destination according to the right path. This situation can also avoid user arrive in wrong place.\r\n	The system main objective is to guide the vehicles across a road-network to their respective destinations. The visitors or students can benefit from the system as the system can show the optimal path to their destination.\r\n','- To guide the student or visitor in UTM.\r\n- To search all paths to the destination in UTM.\r\n- To show the shortest or optimal path for the users to the destination and save time of traveling.\r\n- To introduce the significant places in UTM.\r\n','- Location of the project: UTM.\r\n- User involved: All the visitor and student in UTM.\r\n- It is a web-based system and it means internet connection and browser are required for using the system.\r\n','softDev','SED02','Enterprise Architecture 7.0, Adobe Photoshop CS3, Adobe Dreamweaver,\r\nNetBeans IDE 6.5\r\n','Personal Computer / Laptop, Digital camera','Ant algorithm , Object-Oriented Programming(Java, Visual Studio), Internet Programming','AC070209','Pending','200920101',86,NULL,NULL,'Y'),
 ('Online Tourism Guiding System',' Tourism is one of the industries around the world. It is capable of generating huge revenue. As we know, Malaysia Government has embarked in promoting Malaysia as an ideal tourist destination to local and foreign travelers. The creation of Tourism Ministry and Tourism Development Cooperation are some of the steps taken by the government. Private sectors such as travel agencies also play their role by promoting travel package and many promotions from time to time. \r\n\r\n	In other hand, Malaysia faces many competitors in this industry, especially from neighboring countries. With so many tourists visiting each year, it is desirable to make their sightseeing in Malaysia more convenient. An online Tourism guiding system would be useful to attract local tourists and foreigners as well.\r\n\r\n	Today, online service is a suitable ways to publicize Malaysia to all over the world because nowadays internet service is common. The Online Tourism Guiding System assists the potential tourist all over the world in planning their visit to Malaysia. Besides this, many attractive tourism destination can be founded because this System allow people to introduce tourism destination that are still not yet being explore. Thus, Online Tourism Guiding System is the tool to help government to promote Malaysia as a tourist destination\r\n','i)	To develop a web based online tourism guiding system that allow user to view information on selected tourist destination.\r\n\r\nii)	To enhance the existing systems and eliminate the limitations.\r\n\r\niii)	To develop an artificial intelligence system that help user choose their tourist destination based on their interest.\r\n','i)	Location: This tourism guiding system coverage Malaysia area only.\r\n\r\nii)	User: Those who wish to find the most suitable tourist destination for their journey.\r\n     Those who wish to share their journey experience.\r\n     Those who wish to promote their company.\r\n\r\niii)	This is a web-based system and required internet connection to view the system content.\r\n','softDev','SED03','  Adobe Photoshop CS4, Dreamweaver, Enterprise Architecture, NetBean 6.5',' Laptop',' Internet Programming, Artificial intelligence algorithm','AC070275','Pending','200920101',87,NULL,NULL,'Y'),
 ('Online Hotel Reservation Management System','Industri hotel adalah berkait rapat dengan industri pelancongan dan fungsi utamanya ialah membekalkan tempat kediaman yang bersifat sementara kepada pengunjung-pengunjung. Disebabkan dasar negara kita yang menggalakkan pembangunan industri pelancongan dan pelaburan daripada pelabur-pelabur asing, maka industri hotel juga telah menjadi semakin penting. Untuk bersaing dengan hotel-hotel yang lain, sesebuah hotel perlu memastikan perkhidmatan mereka adalah terbaik. Walaubagaimanapun terdapat sebilangan hotel yang masih menggunakkan kaedah manually untuk mengurus operasi hotel mereka dan pengurusan manually ini telah membawa beberapa masalah. Antara masalahnya ialah:\r\n1.	Kekurangan promosi tentang hotel tersebut\r\n2.	Susah untuk menyimpan record pelanggan \r\n3.	Proses penempahan bilik yang menyusahkan \r\n4.	Susah untuk menghasilkan laporan kewangan\r\n','1.	Untuk menganalisasi masalah sistem lama tersebut dan membangunkan satu sistem yang baru untuk menyelesaikan masalah tersebut\r\n2.	Menguji samada sistem baru ini dapat menyelesaikan masalah-masalah sistem lama tersebut.\r\n','1.	Sistem pengurusan hotel ini akan berasaskan web dan membekalkan perkhidmatan bagi pelanggan untuk membuat tempahan bilik atau mencari maklumat tentang hotel tersebut melalui internet.\r\n2.	Selain itu, sistem pengurusan hotel ini juga membolehkan pekerja mengawal operasi hotel tersebut dengan lebih lancar dan sistematik.\r\n','softDev','SED01','  MySQL, NetBean, Enterprise Architecture ',' Laptop',' ','AC070258','Pending','200920101',88,NULL,NULL,'Y'),
 ('Face Tracking System','Image analysis for human faces has been an active research topic in image processing, computer vision and psychology. Specific researches areas include face detection, face tracking, face recognition, face animation, etc. In this paper, we focus on face tracking that can serve as a front end to other facial image analysis tasks, such as face recognition, face expression analysis, gaze tracking and lip-reading. Face tracking is different from face detection in that face tracking uses temporal correlation to locate human faces by using webcam, instead of detecting them in each frame independently. With temporal information, we can narrow down the search range significantly and thus make real-time tracking possible. \r\n\r\nRecently they have been a lot of research efforts in face tracking and however, seldom of this algorithms deal with multiple faces, especially in live webcam, effectively. In this project, we propose a multiple face tracking algorithm based on constraining the speed and size changes of the faces.\r\n','1)	To study the current single face tracking system. \r\n2)	To design a face tracking system that can deal with multiple faces. \r\n3)	To test a face tracking system for further implementation that can serve as a tracking system for nowadays digital camera.\r\n','â?¢	Users should be the person who in front of the webcam to let the system tracking their faces.\r\nâ?¢	System should be able to track more than one face if there is more than one face captured by webcam.\r\nâ?¢	System should be able to track the face that had a clear view without occlude by anything. \r\n','softDev','SED02','Enterprise Architecture, microsoft office, java development kit(JDK), Netbean 6.5',' laptop',' Artificial intelligence algorithm','AC070066','Pending','200920101',89,NULL,NULL,'Y'),
 ('Pembangunan Sistem Aplikasi e-COST','Lembaga Minyak Sawit Malaysia (MPOB) telah pun menjalankan kajian dan penyediaan laporan berkaitan dengan kos pengeluaran minyak sawit sejak beberapa tahun yang lepas. Kajian tersebut dijalankan dengan menggunakan borang soal selidik yang diemelkan kepada setiap responden kilang buah sawit dan estet sawit sahaja. \r\n\r\nWalaubagaimanapun, tidak kesemua borang soal selidik itu dijawab dan dihantar semula kepada pihak MPOB. Ini secara tidak langsung menjadikan hasil kajian ini tidak efisyen.\r\n\r\nSelain dari itu, borang soal selidik yang telah diisi mungkin mempunyai data yang tidak tepat (noisy data) dan sukar untuk melakukan pembetulan data. Ini seterusnya melambatkan dan menyukarkan kelancaran proses penganalisan data. \r\n\r\nSetelah meneliti setiap masalah yang timbul, kami bercadang untuk membangunkan  sebuah aplikasi e-COST yang merupakan sebuah sistem berasaskan web bagi menyokong proses kerja yang dilaksanakan oleh Bahagian Ekonomi dan Pembangunan Industri MPOB dalam menjalankan kajian dan penyediaan laporan berkaitan dengan kos pengeluaran minyak sawit. \r\n\r\nAplikasi e-COST akan mempunyai 6 modul seperti berikut :-\r\n1.	Modul Profil dan Pendaftaran- maklumat responden akan dikumpulkan secara automatik apabila mereka mendaftar ke dalam aplikasi. MPOB dan responden lain boleh juga mengubah maklumat tertentu secara online. \r\n2.	Modul Kajian Pengeluaran- membolehkan responden estet sawit dan kilang sawit mengisi maklumat kajian kos pengeluaran secara online.\r\n3.	Modul Pra-Pemprosesan Data- membolehkan staf MPOB membuat penganalisan terhadap data-data kajian yang diperolehi menggunakan kaedah statistik.\r\n4.	Modul Laporan Kajian- menjana semua jenis laporan (suku tahunan, setengah tahunan dan tahunan) dalam bentuk statistik dan juga grafik.\r\n5.	Modul Sistem Maklumat Eksekutif- sebagai alat bantu bagi membolehkan pihak pengurusan MPOB memantau dan membuat keputusan terhadap penurunan atau kenaikan kos pengeluaran minyak sawit. \r\n6.	Modul Konfigurasi dan Pentadbiran- membolehkan pentadbir aplikasi menyelenggara maklumat am, menentukan access level setiap pengguna dan memantau setiap transaksi yang dilaksanakan oleh pengguna aplikasi.\r\nAplikasi e-COST yang dibangunkan akan membantu pihak MPOB dari aspek mengenalpasti atribut\r\n-atribut yang memberi  impak dan kesan terhadap kos pengeluaran minyak sawit melalui kajian yang akan dilaksanakan secara paperless dan online yang dapat menyediakan laporan yang lebih kerap dan juga berperanan sebagai sistem amaran dan notifikasi.\r\n','1.	Mengumpul dan mengenalpasti keperluan sistem aplikasi e-COST.\r\n2.	Merekabentuk aplikasi e-COST menggunakan Unified Modeling Language (UML)\r\n3.	Membangunkan aplikasi e-COST menggunakan open-source dan ianya berasaskan web.\r\n4.	Menguji aplikasi e-COST di dalam persekitaran pengujian.\r\n','1.	Sumber data adalah berkenaan dengan  kos pengeluaran minyak sawit dari ladang dan juga dari kilang sawit. \r\n2.	Penggunanya terdiri daripada responden kilang sawit dan ladang sawit. Tugas mereka adalah mengisi borang soal selidik secara online. Selain itu, petugas dari Bahagian Ekonomi dan Pembangunan Industri MPOB akan menganalisis kesemua maklumat soal selidik tersebut. \r\n3.	Hasil akhir yang dijana oleh aplikasi e-COST ini ialah maklumat berkenaan dengan kos pengeluaran minyak sawit. Hasilnya boleh dilihat dalam bentuk jadual dan juga graf.\r\n4.	Sistem ini berasaskan open-source sepenuhnya dan dibangunkan menggunakan bahasa pengaturcaraan PHP dan menggunakan pangkalan data MySQL . \r\n5.	Sistem ini merangkumi modul-modul seperti profil dan pendaftaran, kajian pengeluaran, pra-pemprosesan data, laporan kajian, sistem maklumat eksekutif dan juga konfigurasi dan pentadbiran. \r\n6.	Sistem ini mempunyai 3 proses metodologi. Pertama: Spesifikasi Keperluan Sistem (SRS), Kedua: Pembangunan dan Reka Bentuk Sistem (SDD), Ketiga: Pengujian dan Pengesahan Sistem (V&T). Ianya bagi memastikan aplikasi e-COST dapat dilaksanakan secara modular, berperingkat dan cepat supaya ianya lebih fleksibel, rendah risiko, mudah diimplimentasi dan diselenggara mengikut acuan yang dikehendaki oleh pihak MPOB.\r\n','softDev','SED01','  Dreamweaver CS3, SPSS',' Sistem pengoperasian Windows XP Home',' Merupakan sistem berasaskan web. Perisian Web Aplikasi Apache, Bahasa Pengaturcaraan PHP, Pangkalan DataMySQL dan juga PHP Report Maker sebagai perisian menjana laporan.     ','AC060241','Pending','200920101',90,NULL,NULL,'Y'),
 ('Sistem E-Pembelajaran diagnosis penyakit melalui tapak tangan','Jika dibandingkan dengan teknik pengajaran dan pembelajaran secara tradisional (secara bersemuka antara pelajar dan tenaga pengajar), sesungguhnya teknik pembelajaran elektronik adalah cara / kaedah yang sesuai untuk melengkapi pendidikan dalam suatu tempoh yang lama yang mana ia telah menunjukkan peningkatan yang besar dalam sektor teknologi maklumat.  \r\n\r\nTeknik pengajaran dan pembelajaran secara tradisional kadangkala boleh mendatangkan masalah kepada mereka yang ingin mempelajari dan memahami tentang penyakit tertentu melalui diagnosis tapak tangan. Ini kerana mereka perlu menghadirkan diri dalam setiap kelas yang diadakan mengikut jadual yang telah ditetapkan. Di samping perlu mengeluarkan kos yuran pembelajaran dan kos perjalanan serta melibatkan kekangan masa untuk sesi pembelajaran.\r\n \r\nSistem E-Pembelajaran diagnosis penyakit melalui tapak tangan ini dibangunkan untuk memberi pendedahan serta mengatasi masalah yang dihadapi oleh mereka yang ingin mempelajari serta memahami tentang diagnosis penyakit melalui tapak tangan dengan lebih cepat kerana sistem ini boleh dicapai pada bila-bila masa tanpa perlu menghadiri sebarang kelas secara manual. Sistem ini juga dapat membantu pengguna menjimatkan masa dan kos serta tidak memerlukan pengaturcara atau orang teknikal untuk melakukan sebarang proses kemaskini.\r\n','1.	Untuk menganalisa dan mengkaji teknologi pembelajaran yang digunakan dalam sistem agar pembangunan dapat berjalan lancar.\r\n\r\n2.	Untuk merekabentuk dan membangunkan sistem yang berasaskan pembelajaran elektronik mengikut kesesuaian semua pihak.\r\n\r\n3.	Untuk menguji sistem yang telah dibangunkan supaya pengurusan lebih teratur dan sistematik.  \r\n','1.	Sistem ini dibangunkan berasaskan pembelajaran elektronik.\r\n\r\n2.	Pengguna sistem adalah sesiapa sahaja yang ingin mengetahui, mempelajari serta memahami tentang penyakit tertentu yang boleh dikenalpasti melalui kaedah diagnosis tapak tangan.\r\n','softDev','SED01','  Java',' Windows XP/98,Windows Vista, My SQL, Server, Internet ',' Teknik pembelajaran diagnosis tapak tangan secara elektronik (E-Pembelajaran)     ','AC080337','Pending','200920101',91,NULL,NULL,'Y'),
 ('Penjadualan Bus di UTM Menggunakan Teknologi RFID dan GSM',' Sebelum ini,ketibaan bas tidak tepat pada waktu untuk mengambil pelajar dari kolej ke fakulti dan sabaliknya.Pelajar-pelajar mengambil masa yang lama untuk menunggu bas.Walaupun bas mempunyai sistem tersendiri secara manual,tetapi masa ketibaan bas tidak tepat pada waktunya.Pelajar banyak membuang masa menuggu kehadiran bas di perhentian bas.\r\n\r\n Sudah semestinya semua pelajar tidak mahu membuang masa mereka semata-mata untuk menunggu bas.Apabila keadaan cuaca yang kurang baik , keadaan ini menyukarkan pelajar untuk menunggu bas.\r\n\r\n Dengan adanya sistem ini, ia dapat memudahkan pelajar untuk menaiki bas mengikut masa yang tepat.Projek ini akan membangunkan satu sistem menggunakan RFID untuk mengesan lokasi bas dua perhentian bas sebelumnya.Pesanan SMS akan dihantar kepada pelajar sebagai rujukan kepada pelajar dimana lokasi bas.Pelajar haruslah mendaftakan diri dipejabat kolej untuk mendapat pesanan SMS tersebut.\r\n','1.Sistem ini akan dibangunkan menggunakan RFID untuk mengesan kedudukan bas.\r\n2.Sistem ini akan menggunakan teknologi GSM untuk mendapat maklumat ketibaan bas.\r\n3.Pengujian sistem yang telah dibangunan.\r\n','1.RFID akan diletakkan dua perhentian bas sebelumnya.\r\n2.RFID tag akan diletakkan di nombor pendaftaran kenderaan \r\n3.Mengunakan  GSM  untuk menghantar maklumat kepada pelajar.\r\n4.Mengunakan  JAVA.\r\n','softDev','SED01','Java ,MYSQL','RFID tag','Teknologi GSM','AC080349','Pending','200920101',92,NULL,NULL,'Y'),
 ('SISTEM PENGURUSAN MAKLUMAT, PENILAIAN DAN     LOGISTIK PELATIH KOR SUKSIS UNIVERSITI TEKNOLOGI   MALAYSIA BERASASKAN WEB DAN SMS','Kor SUKSIS adalah singkatan bagi Kor Sukarelawan Polis Siswa dan Siswi. Kor SUKSIS UTM adalah di bawah pemantauan Pusat Kokurikulum Universiti Teknologi Malaysia.\r\n\r\n             Sistem pengurusan maklumat Kor SUKSIS Universiti Teknologi Malaysia pada masa kini dijalankan secara manual. Tiada sistem penyimpanan maklumat berkomputer digunakan. Pengumpulan dan penyimpanan maklumat secara manual didapati sukar untuk dikendali.\r\n             Masalah lain yang di hadapi adalah masalah kesukaran capaian dan carian maklumat pelatih-pelatih Kor SUKSIS UTM. Hal ini kerana setiap maklumat disimpan secara manual dalam folder biasa dan berasingan dengan maklumat-maklumat lain yang berkaitan.\r\n             Selain itu, sistem manual yang digunakan untuk menilai prestasi pelatih pada masa ini tidak jelas dan ianya menimbulkan masalah kepada pagawai untuk menilai dan kepada pelatih untuk mengetahui status penilaian mereka. \r\n             Masalah lain ialah risiko kehilangan data yang tinggi kerana cara simpanannya secara folder biasa di mana ianya tidak sesuai dengan jumlah pelatih yang semakin bertambah. Penggunaan Microsoft Excel dan Microsoft Word untuk penyimpanan data yang banyak adalah tidak praktikal dan tidak sistematik.\r\n','Dalam membangunkan sistem ini, beberapa objektif telah digarisi iaitu:\r\ni.	Membangunkan satu sistem pengurusan berkomputer dan menggunakan khidmat sistem pesanan ringkas untuk pelatih-pelatih Kor SUKSIS UTM.\r\nii.	Memudahkan pegawai-pegawai Kor SUKSIS UTM untuk mencari maklumat dan menilai prestasi pelatih-pelatih.\r\niii.	Memudahkan pelatih-pelatih Kor SUKSIS untuk meyemak status penilaian menggunakan khidmat SMS.\r\niv.	Mengurangkan risiko kehilangan data pelatih-pelatih Kor SUKSIS UTM.\r\nv.	Membolehkan sistem penyimpanan data dilakukan dengan lebih berkesan dan sistematik.\r\n','Antara skop yang menjadi landasan bagi pembangunan sistem ini adalah:\r\ni.	Sistem yang dibangunkan berasaskan web dan menggunakan khidmat sistem pesanan ringkas.\r\nii.	Pengguna sistem terdiri daripada pegawai dan pelatih Kor SUKSIS UTM.\r\na.	Pegawai  	: melihat semua data dan maklumat yang disediakan dalam sistem, memberi kelulusan penilaian prestasi, memasukkan dan mengemaskini data dan maklumat, menjana testimonial untuk pelatih.\r\nb.	Pelatih	: melihat data dan maklumat yang disediakan dalam sistem (terhad kepada data dan maklumat tertentu sahaja), mengemaskini maklumat (terhad kepada data dan maklumat tertentu sahaja).\r\niii.	Sistem ini hanya menguruskan maklumat asas, maklumat penilaian dan maklumat logistik pelatih-pelatih Kor SUKSIS UTM.\r\niv.	Sistem yang dibangunkan mengikut sistem yang ditetapkan oleh pihak pengurusan.\r\n','softDev','SED01','Microsoft Visual Studio 2008, Enterprise Architechture, Windows Xp, Microsoft Word 2007\r\n\r\n','Komputer riba',' ASP.Net','AC070222','Pending','200920101',93,NULL,NULL,'Y'),
 ('PENGECAMAN IRIS','Kemajuan IT yang semakin berkembang pada masa kini sehingga menyebabkan aplikasi keselamatan menghadapi pelbagai ancaman pencerobohan. Keselamatan sebuah sistem akan terancam apabila ada penceroboh yang berjaya memasuki sistem tersebut dengan menggunkan kod pengecaman pengguna yang digunakan untuk sesebuah sistem yang dibangunkan. Antara kod pengecaman pengguna yang digunakan bagi sesebuah sistem adalah seperti pin nombor, kod rahsia, kad pengenalan dan lain-lain. Penggunaan kesemua kod pengecaman ini sagat mudah dicuri dengan penggunaan teknologi yang semakin canggih sekarang. Dengan ini, sesebuah sistem akan dapat diceroboh dan akan berlaku kecurian maklumat atau kehilangan barangan yang berharga. \r\nPengacaman iris adalah satu cara yang dapat dijadikan alternatif bagi menukarkan kod pengecaman pengguna seperti yang disebut di atas supaya menjadikan keselamatan sesebuah sistem itu lebih terjamin. Ini adalah kerana iris mempuyai ciri yang unik yang membolehkan aplikasi keselamatan mengesan sama ada pengguna itu adalah pengguna yang betul dan berhak menggunakan sesebuah sistem itu. Teknik pengecaman pengguna menggunakan pengecaman iris ini sangat berkesan kerana setiap manusia mempunya corak iris yang berlainan walaupun mereka adalah adik beradik kembar. Ini kerana iris mempunyai corak yang sangat unik yang dapat membezakan setiap manusia. \r\n','1- Untuk mengkaji tentang proses pengecaman iris.\r\n2- Untuk membezakan antara dua iris yang berlainan.\r\n3- Untuk mengkaji pengecaman iris menggunakan metodologi Artificial Immune System (AIS).\r\n','1- Pengecaman iris ini akan menggunakan metodologi yang terdapat dalam Artificial Immune System.(AIS)\r\n2- Teknik jarak Hamming digunakan bagi mengira perbezaan antara dua iris.\r\n\r\n','research','SED02','Matlab R2009a','Komputer riba','Artificial Immune System (AIS)    ','AC073129','Pending','200920101',94,NULL,NULL,'Y'),
 ('Sistem Pengurusan Transaksi bagi 210studio T-Print','Sistem yang digunakan oleh 210studio T-print sistem manual yang merekodkan transaksi secara manual. Sistem ini tidak ada fungsi untuk menyimpan hasil-hasil grafik komisen dalam simpanan. Ini telah meningkatkan rsiko hasil grafik yang lebih kurang sama atau sama untuk pelanggan yang berlainan. Sistem ini juga tidak menjana resit untuk pelanggan atas pembelian â??printâ?? dari 210studio T-print. Bukti pembelian/ pembayaran hanya dicatat di dalam buku yang berada pada staf 210studio. \r\n	Bagi mengatasi masalah-masalah yang dihadapi, suatu sistem pengurusan akan dibangunkan untuk membentuk pengurusan 210studio T-print lebih bersistematik dan teratur. Dengan sistem dibangunkan, hasil grafik yang direka atas komisen akan disimpan sebagai rujukan grafik agar hasil grafik sama atau lebih kurang sama tidak berlaku. Selain daripada hasil grafik berkomisen, terdapat juga hasil grafik yang biasa yang akan dipaparkan untuk ditempah oleh pelanggan. Resit rasmi akan dijanakan bagi setiap hasil grafik berkomisen dan transaksi akan direkodkan di dalam pangkalan data\r\n\r\nSistem yang bakal dibangunkan akan mempunyai fungsi-fungsi tambahan seperti ruang untuk berbincang dan memberi komen bagi mereka yang menghantar \"print\" mereka ke atas laman web ini. Selain itu, sistem pengurusan ini akan memberi peluang kepada mereka yang mempunyai impian untuk menerbit jenama yang tersendiri dan menunjukkannya kepada orang lain. ','1. Memahami dan menganalisis sistem yang digunakan serta merancangkan sebuah sistem pengurusan untuk mengatasi masalah yang dihadapi oleh sistem tersebut.\r\n\r\n2. Menyediakan ruang untuk pemminat-peminat seni bagi membicang dan menukar informasi tentang \"print\" atau bidang-bidang seni yang lain.\r\n\r\n3. Menghasilkan sebuah sistem pengurusan yang dapat menguruskan transaksi-transaksi yang dijalankan dan menyimpankan \"print\" yang telah dijual dalam database sebagai rujukan.\r\n\r\n4. Mengujikan sistem yang dibangunkan.','1. Sistem pengurusan ini akan digunakan oleh staf-staf 210 studio T-print.\r\n\r\n2. Laman web yang dibangunkan akan digunakan oleh staf di 210 studio serta pengguna-pengguna yang mendaftarkan diri sebagai ahli.\r\n\r\n3. Kekangan yang bakal dihadapi ialah kekurangan pengetahuan tentang bidang tersebut. Ianya menyebabkan salah faham keperluan sistem mudah berlaku.','softDev','SED01','netbean IDE6.5, mySQL, Dreamweaver','komputer','java programing, java script','AC070093','Pending','200920101',95,NULL,NULL,'Y'),
 ('Pangkalan data Kepelbagaian Biologi Paya Bakau ','Paya bakau merupakan spesis tumbuhan yang hidup diantara lautan dan daratan menjadikan hutan yang amat bernilai dan menjadi rebutan. Keunikan ekosistem paya bakau ini telah menarik minat dan membuka mata para penyelidik dari seluruh negeri untuk mengkaji jenis tumbuhan ini dengan lebih mendalam untuk dimuatkan dalam bidang penyelidikan di Malaysia. \r\n\r\nOleh kerana kesedaran mengenai keunikan paya bakau masih dalam peringkat awal dan penyelidikan terhadapnya masih belum menyeluruh, maka sistem pangkalan data paya bakau yang sedia ada masih belum mencukupi dan hanyalah memaparkan mengenai ciri-ciri asas tumbuhan tersebut dan tidak terdapat modul-modul yang interaktif di dalamnya. Oleh itu, kami mengambil inisiatif ini untuk mengumpul segala jenis maklumat mengenai paya bakau untuk dimuatkan di dalam Pangkalan Data Kepelbagaian Biologi Paya Bakau yang akan kami bangunkan dengan menampilkan pelbagai fungsi yang lebih menarik dan kandungan yang lebih mendalam. Tumpuan utama sistem pangkalan data ini adalah kepada kumpulan penyelidik juga kepada sesiapa yang berminat mengetahui dengan lebih lanjut mengenai paya bakau bagi mendapatkan data-data dengan cara yang lebih efektif dan mendalam daripada sebelumnya.\r\n\r\nDiantara modul-modul yang akan dimuatkan di dalam pangkalan data kepelbagaian biologi paya bakau ini ialah:\r\n\r\ni.Carian dan imbasan(browse) sumber â?? mempunyai fungsi yang membolehkan pengguna membuat carian sumber secara tepat, termaju atau pakar serta mengimbas judul penerbitan.\r\n\r\nii.Sumber hangat â?? sumber dimana terdapat artikel yang terkini serta paling banyak di cari.\r\n\r\niii.Pratonton sumber â?? fungsi yang membolehkan pengguna melihat secara umum jurnal.\r\n\r\niv.Paparan dan cetakan sumber â?? fungsi yang membolehkan pengguna melihat secara keseluruhan kandungan sumber dalam Portable Document Format(PDF).\r\n\r\nv.Emel sumber â?? fungsi yang membolehkan pengguna untuk menghantar emel kepada pengguna yang lain.\r\n\r\nvi.Petikan (citation) sumber â?? mempunyai fungsi yang membolehkan pengguna melihat senarai petikan bagi sesuatu sumber berdasarkan kepada maklumat yang disediakan oleh Google Scholar (http://scholar.google.com.my) atau SCOPUS (http://www.scopus.com).\r\n\r\nvii.Notifikasi sumber â?? membolehkan pengguna menerima maklumat terbaru melalui emel.\r\n\r\nDengan adanya sistem pangkalan data kepelbagaian biologi paya bakau ini diharap dapat membantu para penyelidik dan pengguna yang lain untuk mengetahui maklumat yang lebih tepat, terkini dan lebih efektif.\r\n','1.Untuk mengumpul dan mengenalpasti keperluan sistem pangkalan data kepelbagaian biologi paya bakau.\r\n\r\n2.Mereka bentuk sistem pangkalan data kepelbagaian biologi paya bakau menggunakan UML(Unified Modeling Language)\r\n\r\n3.Membangunkan sistem kepelbagaian biologi paya bakau menggunakan open source dan berasaskan web.\r\n\r\n4.Untuk menguji sistem dalam persekitaran pengujian.\r\n','1.Data diambil daripada Pusat Penyelidik Ekosistem Marin, Universiti Kebangsaan Malaysia (EKOMAR UKM ) yang dikaji oleh kumpulan penyelidikan mereka dan juga daripada kesemua pangkalan data yang sedia ada dalam internet.\r\n\r\n2.Pangkalan data ini mempunyai modul carian dan imbasan(browse) sumber, sumber hangat, pratonton sumber, paparan dan cetakan sumber, emel sumber, petikan (citation) sumber dan notifikasi sumber.\r\n\r\n3.Hasil akhir sistem pangkalan data ini merupakan maklumat mengenai paya bakau.\r\n\r\n4.Metodologi yang terdapat dalam pangkalan data  ini boleh dikategorikan kepada tiga iaitu Spesifikasi Keperluan Sistem, Pembangunan dan Mereka Bentuk Sistem dan juga Pengujian dan Pengesahan Sistem.\r\n\r\n5.Pangkalan data ini dibangunkan menggunakan teknologi bersasakan web, menggunakan pangkalan data MySQL, bahasa pengaturcaraan PHP dan Apache sebagai web aplikasi.\r\n','softDev','SED01','Dreamweaver CS3','Sistem Operasi Windows XP','Bersaskan web, Pangkalan data MySQL, bahasa pengaturcaraan PHP dan Apache sebagai web aplikasi.','AC060289','Pending','200920101',96,NULL,NULL,'Y'),
 ('Pangkalan Data Biodiversiti Informatik Untuk Tumbuhan Herba di Malaysia','Pada masa kini, kajian dan penyelidikan berkaitan tumbuhan herba giat dijalankan samada untuk diaplikasi dalam bidang perubatan mahupun kecantikan.  Tumbuhan herba banyak terdapat di Malaysia dan kegunaannya juga amat bermanfaat bagi pengguna. \r\n      Masalah yang dihadapi oleh penyelidik adalah sumber maklumat yang tidak mencukupi. Setelah membuat rujukan mengenai laman web tumbuhan herba yang terdapat di Malaysia, kami dapati maklumat yang disediakan adalah terhad. Terdapat laman web yang hanya memfokuskan kepada ciri-ciri tumbuhan herba sahaja manakala terdapat juga laman web yang hanya membincangkan kegunaan tumbuhan herba dalam bidang perubatan.\r\n      Selain itu, fungsi-fungsi yang terdapat dalam laman web sedia ada adalah sangat terhad dan tidak interaktif. Contohnya mereka hanya dapat melihat abstrak dan garis kasar maklumat berkaitan tumbuhan herba tanpa memaparkan sumber data yang diperolehi seperti jurnal mahupun buku.\r\n      Oleh itu, tujuan projek ini dijalankan adalah untuk memperkasa pengumpulan maklumat melalui penubuhan sebuah sistem pangkalan data tumbuhan herba di Malaysia yang membolehkan hasil penyelidikan mengenai tumbuhan herba di Malaysia diterbitkan dan dirujuk secara dalam talian.\r\n      Bagi sistem pangkalan data yang bakal dibangunkan ini, terdapat beberapa modul  dan ciri-ciri yang akan digunakan. Antara modul-modul tersebut adalah:\r\n-	Modul  Profil dan Pendaftaran â?? melalui modul ini, terdapat 3 peringkat pengguna yang berbeza iaitu pentadbir pangkalan data yang berfungsi menguruskan setiap informasi data dan pengguna. Pengguna kedua ialah pengguna yang berdaftar seperti penyelidik di mana mereka dapat menyiarkan jurnal mereka ke dalam pangkalan data ini. Seterusnya pengguna terakhir ialah pengguna yang tidak berdaftar yang hanya ingin mengetahui maklumat mengenai tumbuhan herba.\r\n-	Modul Carian dan Imbasan Maklumat â??  modul ini membolehkan pengguna membuat aplikasi carian maklumat mengenai tumbuhan herba dengan mudah dan cepat menggunakan kata kunci dan juga menyenaraikan kesemua jenis tumbuhan herba mengikut spesis dan taksonomi.\r\n-	Modul Pratonton Maklumat â?? Modul ini bertujuan untuk membenarkan pengguna melihat maklumat mengenai tumbuhan herba secara abstrak.\r\n-	Modul Paparan dan Cetakan Maklumat â?? dapat mencetak pelbagai jenis maklumat sama ada maklumat mengenai tumbuhan herba dalam bentuk Portable Document Format (PDF) ataupun dalam bentuk imej.\r\n\r\n\r\n\r\n-	Modul Emel Maklumat â?? berfungsi untuk membolehkan pengguna mengemel maklumat kepada penerima.\r\n-	Modul Petikan Maklumat â?? modul ini membenarkan pengguna melihat senarai petikan atau jurnal bagi sesuatu sumber berdasarkan maklumat sama ada melalui Google Scholar atau lain-lain.\r\n-	Modul Notifikasi Maklumat â?? melalui modul ini, pentadbir akan menghantar notifikasi terbaru mengenai maklumat atau artikel tumbuhan herba kepada pengguna melalui penghantaran emel.\r\n-	Modul Sumber Hangat â?? berfungsi menyenaraikan sumber maklumat terbaru, paling banyak dimuat turun dan dijadikan rujukan.  \r\n      Dengan adanya sistem pangkalan data tumbuhan herba ini, ia dapat memudahkan proses mengumpul maklumat-maklumat yang berkaitan tumbuhan herba di Malaysia. Sistem yang bakal dibina ini juga bakal menjadi sumber rujukan untuk pengajaran, pembelajaran, penyelidikan dan penulisan serta menyediakan perkhidmatan maklumat yang berkualiti dalam pelbagai bentuk seiring dengan perkembangan teknologi terkini.\r\n','1.	Untuk mengumpul dan mengenalpasti sistem pangkalan data biodiversiti informatik untuk tumbuhan herba di Malaysia.\r\n2.	Untuk mereka bentuk sistem pangkalan data biodiversiti informatik menggunakan UML (Unified Modeling Language).\r\n3.	Untuk membangunkan sistem pangkalan data biodiversiti informatik  menggunakan open source dan berasaskan web.\r\n4.	Untuk menguji sistem pangkalan data dalam persekitaran pengujian.\r\n','1.	Sumber data bagi tumbuhan herba di Malaysia adalah diperolehi daripada pangkalan data yang terdapat dalam internet mengenai penyelidikan bagi tumbuhan herba.\r\n2.	Fungsi-fungsi yang terdapat dalam sistem ini adalah carian dan imbasan maklumat, paparan dan cetakan, notifikasi emel, emel data kepada pengguna, petikan maklumat, sumber maklumat dan juga sumber hangat.\r\n3.	Melalui sistem ini, hasil akhir yang boleh diperolehi adalah maklumat yang lengkap mengenai tumbuhan herba yang terdapat di Malaysia.\r\n4.	Metodologi yang terdapat di dalam sistem ini boleh dikategorikan kepada tiga iaitu Spesifikasi Keperluan Sistem, Pembangunan dan Mereka Bentuk Sistem dan juga Pengujian dan Pengesahan Sistem.\r\n5.	Teknologi yang digunakan untuk membangunkan sistem ini adalah menggunakan pangkalan data MySQL. Bahasa pengaturcaraan pula menggunakan PHP manakala Apache adalah sebagai web aplikasi.\r\n6.	Pengguna bagi sistem pangkalan data ini adalah penyelidik dalam bidang tumbuhan herba dan pengguna yang inginkan maklumat bagi tumbuhan herba.\r\n','softDev','SED01','Dremweaver CS3','OS â?? Windows','Berasaskan web, pangkalan data MySQL, bahasa pengaturcaraan PHP dan web   aplikasi Apache','AC060032','Pending','200920101',97,NULL,NULL,'Y'),
 ('Imputing Microarray DNA Data Using Bayesian Principle Component Analysis (BPCA) for Patient Survival Analysis.','    Microarray data analysis has been applied in studies over a broad range of biological disciplines including cancer classification by class discovery and prediction, identification of the unknown effects of a specific therapy, identification of genes relevant to a certain diagnosis or therapy and cancer prognosis. Gene Expression microarray experiments, usually in the form of large matrix, can generate datasets with missing expression values. These missing values can significantly affect subsequent statistical analysis and machine learning algorithms. Moreover, many algorithms for gene expression analysis require a complete matrix of gene array values as input. For example, methods such as K-Means Clustering and Hierarchical Clustering are not robust to missing data and may lose effectiveness with missing values. \r\n    Therefore, a method for imputing missing data is needed to minimize the effect of incomplete datasets on experimental analysis. Hence, an estimation method for missing values which is based on Bayesian Principle Component Analysis (BPCA) is introduced to handle the problem found in patient Survival Analysis. Although the methodology that a probabilistic model and latent variables are estimated simultaneously within the framework of Bayes inference is not new in principle, actual BPCA implementation that makes it possible to estimate arbitrary missing variables is new in terms of statistical methodology. BPCA method will be able to provide accurate and convenient estimation for missing values in patient Survival Analysis.','-To study and analyze the imputation of microarray DNA data using BPCA for patient Survival Analysis.\r\n\r\n-To implement Bayesian Principle Component Analysis (BPCA) impute method.\r\n\r\n-To evaluate the performance of BPCA with the existing imputation technique.','-Implement BPCA missing value estimator using Matlab.\r\n\r\n-The research is carried out using the cancer datasets from the internet and journal.\r\n\r\n-The dataset used in research is diffuse large B-cell lymphoma (DLBCL) data.\r\n\r\n-The estimated missing values are shown through experimental analysis.\r\n','research','SED02','Matlab','Laptop','Bayesian Principle Component Analysis (BPCA)','AC060267','Pending','200920101',98,NULL,NULL,'Y');
INSERT INTO `title` (`proTitle`,`bgProblem`,`objective`,`scope`,`proType`,`proField`,`softSpecification`,`hardware`,`technology`,`metricNo`,`status`,`semester`,`proID`,`evaluator`,`comment`,`title_flag`) VALUES 
 ('Online Company Store Management System.','The traditional method to record small-scale company storage is using paper. Nowadays, most of these companies have improved and using computer to record storage data. This does not prevent the company from losing the data stored. It is because all of the data is saving in the computer and a backup after some time interval. This kind of management system is not synchronizing to storage condition. Client cannot check the company storage condition with the system through online.\r\n\r\nWith the Online Company Store Management System, the changes of store and update of database is synchronized. All data can be checked and controlled through online. Client must have an Internet access via computer, hand phone, PDA or other devices to check storage condition. It is more convenient and efficient for the client and the company to manage company store.\r\n','1.	To build a database that record information of items in company store.\r\n2.	To develop web pages that can access to database and update data in database.\r\n','1.	The scope of the project is to develop an online storage management system that enables data to be record and retrieve back so that client using the system is capable of predicting the items in storage are enough for successive month sales. \r\n2.	This project also provides a simple and convenient way for store checking and auditing.\r\n\r\n','softDev','SED01','Microsoft SQL, web browser, Enterprise Architect, NetBeans 6.5.','  laptop',' ','AC070163','Pending','200920101',99,NULL,NULL,'Y');
/*!40000 ALTER TABLE `title` ENABLE KEYS */;


--
-- Definition of table `users_login`
--

DROP TABLE IF EXISTS `users_login`;
CREATE TABLE `users_login` (
  `psw` varchar(50) NOT NULL,
  `userID` varchar(20) NOT NULL,
  `usertype` int(11) DEFAULT NULL,
  PRIMARY KEY (`userID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_login`
--

/*!40000 ALTER TABLE `users_login` DISABLE KEYS */;
INSERT INTO `users_login` (`psw`,`userID`,`usertype`) VALUES 
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','10054',2),
 ('*EA77BE3F668639422CE8F7264D84C828E8D23BFF','10650',2),
 ('*980473E727B0DA38595EF73886100331CA187092','1898',2),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','2135',2),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','2157',2),
 ('*BB6008AC74790ADDD33261DC6341E5F8A68AB6B5','2586',2),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','4298',2),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','4724',2),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','5160',2),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','5419',2),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','5501',2),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','5975',2),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','6749',2),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','6838',2),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','7019',2),
 ('*41765EDE93B665D63B5B1DF6CAEBB314A3C14EFA','7331',2),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','7351',2),
 ('*A8E5A8A8A6E3764D2CBAC229CB70DE3E8FF5A23F','7352',2),
 ('*C998C369A1E040C9020ECF9CA0D03FFB39C07FD1','7409',2),
 ('*E61934A5DCCEE79D62DCA9E5BB324CCDF5F6F745','7801',2),
 ('*D37E51C7B77D23C995A7F1403656C1C5B3041737','7903',2),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','8063',2),
 ('*5E298744272644E27CE8FB0C44694F4567B3449E','8096',2),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','AC000001',1),
 ('*B699151C812758EA3CB70604BBBAB1B94989B1F5','AC060004',1),
 ('*128E57A972F5AC6D25FC0596CA6CF87DC42D6208','AC060022',1),
 ('*BB08C1EBF91535C0D154085211DD4055BCDE0449','AC060030',1),
 ('*9425C61285AD5389C75B26006DFF4F5A2EEB05F2','AC060032',1),
 ('*E6FDA3DD63652DC9B4926D958ABC9AEDEFC30954','AC060038',1),
 ('*19E5286C377219C50631903E0D04ADF705A2E381','AC060039',1),
 ('*3FA2450BF4650AB23723EE5109FCB5A49416EE9F','AC060053',1),
 ('*D08690A16A89DED7812111AE9D6F205D94A726E7','AC060056',1),
 ('*20D246C48C4095C5EE8CCC05D9A6C890B85FF718','AC060063',1),
 ('*20E6832E2FC371C563374F6708E8155FA19D726D','AC060065',1),
 ('*2B3B8D0B99A799AE4AC5DE8FAE241BE4B73F7FDC','AC060071',1),
 ('*29DEFEE53E9862D792BF7BF27A9A0687ACFAB93E','AC060084',1),
 ('*67D69174CA5E60A73CCE34C9DFC0C66AE752934B','AC060086',1),
 ('*F04242EEF88F7481E14FE6E81AF463BB41BCC29B','AC060091',1),
 ('*F04242EEF88F7481E14FE6E81AF463BB41BCC29B','AC060107',1),
 ('*6D3C9108CD0520D9B51B932439E5F7A3BA38D078','AC060117',1),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','AC060119',1),
 ('*1D3984AA776EB133392BAEDE9A64B2DB1A6B5364','AC060140',1),
 ('*F2362FD08035899D4B3F66737B6354E351FDEB12','AC060154',1),
 ('*0AE047CB8A9A06D8BD0AC0A995B7E78E2EB89AEC','AC060161',1),
 ('*851D8C5A72711044B065AA5D41794FD2C3A888B6','AC060176',1),
 ('*D863BF188E2437F3CB5B884E67940E42C799E4C1','AC060179',1),
 ('*C1F1ED4900FC863500014C9282D1731F3A5FE0C2','AC060214',1),
 ('*CE6A9C9146EDD08515697FE5571063DFB31B334E','AC060241',1),
 ('*575B2F588A0A0418693507498F85C02F1F62AA46','AC060247',1),
 ('*1EC47F80515A1093FBE3074A88294BDF4CCFD1C1','AC060261',1),
 ('*034365FE04E0D502AB4A700A65AA7FA9411BF432','AC060267',1),
 ('*12FE418901804B5037A3922F0E16F64D523A2E5A','AC060274',1),
 ('*EE7CA7616013E1112BA133B3396166A67ECF7E77','AC060289',1),
 ('*36EAD2F8563967A3F91E48AD79AC89BD7906B493','AC070015',1),
 ('*E4813C069D7D100B1FC372F558101E1FADEDAE53','AC070021',1),
 ('*336CC158AF9EDB0986B28986AF87704F3D202829','AC070041',1),
 ('*AF25847FA8A4BE6D37A306D95C4B64A0363AE844','AC070045',1),
 ('*D7A3E95382CDE6D5FAA4194D51F04233BD939AD2','AC070054',1),
 ('*A8F66D0188DA6156E88BB7A05D63AFE6D1D4D350','AC070055',1),
 ('*AE37B602F8DBC1161043F83610E734261EFD9F15','AC070066',1),
 ('*EF0941347872BD937E524030405E0B98E79686C7','AC070073',1),
 ('*33AD1CBEC600BFA68F0A41835D7DD4E559329E63','AC070074',1),
 ('*1EA5F074C50D0638E8E0212B7AB72A7F7C4F9462','AC070080',1),
 ('*F20770BC0BAC29BBE2202F828138E7344A0F8FE8','AC070093',1),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','AC070095',1),
 ('*51880A2D02DE522193982BA84AF7281EF68AAB08','AC070109',1),
 ('*B99FE4A7B952203DB7F9DE0D9F3A597590B2C4BF','AC070110',1),
 ('*5F37A1888238AC403768F178A50270AB9EDE7C6F','AC070111',1),
 ('*E662E61018222F20E3E4CAC72A913E334DA563BE','AC070114',1),
 ('*EE1048D78262A2325533068C482CD64B4994F120','AC070135',1),
 ('*A556CB70C553EDCC606A0A51C76459F85A9015E2','AC070137',1),
 ('*A28F9DA361254E492E7230F84F975AFA54632BEB','AC070140',1),
 ('*B23A11EFBB9B1A51A61733D8F06D8548539A6735','AC070156',1),
 ('*89053356AEA539E1AE2E25DF02E28D9BB464B01B','AC070163',1),
 ('*8C3B66457967C094EE0857D215903F67FFFF1174','AC070164',1),
 ('*7A7EBD8FBA648865873C1A55B20D7B0B3CF1777D','AC070166',1),
 ('*F0102E4E1B917AECA79C1E49F926D9076E21031C','AC070193',1),
 ('*CA43FCA5310E88843CB0BA894F0FD118FA550548','AC070199',1),
 ('*969DF79C9D900475F2B2360A7C1A25C9C98B0D21','AC070204',1),
 ('*87FC95E101FD6AF78977638266EF88A7500E5393','AC070209',1),
 ('*A9B0AAD136F8C2B64629D39904840D280B6C1AC9','AC070219',1),
 ('*CFF06BAC0C2C2CC2FBFD05AEB404D4DA48629ECD','AC070222',1),
 ('*187252EE6070DB14E724FEA605C918E4455E0FD5','AC070229',1),
 ('*6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9','AC070235',1),
 ('*E12415766A7AC40E60D9F45D6D00284E3DD27DD4','AC070237',1),
 ('*56401184878789BCFE35D68B59838B29C372D8CF','AC070238',1),
 ('*875766795A9482C92966921256E93E7CAE322DF7','AC070248',1),
 ('*16BABAE1B3DEDAF65FD56FB385E076B5709B5C32','AC070252',1),
 ('*7440EE26495E45E1EDE80CD63F8B778725D66945','AC070258',1),
 ('*CD96CC9F7E6D921BD249B3E40082B8D00F26FEE0','AC070268',1),
 ('*23AA1D32408ACB244A1749E522DE1B5A6DAECAD1','AC070275',1),
 ('*819DF0BABC01ED84DA52BBDAE1976B380F70FEF6','AC070277',1),
 ('*9A263F6B65D6B7B3DEB3407DB76626767FE4B3D5','AC070279',1),
 ('*7108EC86F7F3AFEE0FC20F9BF58D7A6E1C18B4D9','AC070280',1),
 ('*6C189CAB1794DD012ABFEC15CA7E66ED02274056','AC070295',1),
 ('*74A55BFB7F65631F4568A906850607D4F9A23362','AC070317',1),
 ('*AC81B57C9F6D1708D8967988781D9B8CE8373377','AC070334',1),
 ('*57F862069863A1C43B344982E4416743B7FCBD93','AC070335',1),
 ('*CEA6F888258FE801879503684CD4571F74F5C0C0','AC070405',1),
 ('*DFD7B8E6ACB7A10650FB259EDD81F369F6FB7EE7','AC070408',1),
 ('*96023EFB05F8E39DCF85526E542CCCDDCDEBE47C','AC073052',1),
 ('*323BFB62AD623488AED8EFA68B4CFE82BB4340C4','AC073054',1),
 ('*CEE6D4633880FB23BE49A9521108D32CFD732919','AC073055',1),
 ('*892DACAACE75E5A44F46F3A2D73BAB1C06072D94','AC073061',1),
 ('*168E69A4F8037757D0E5AFA6FED8E855384C2DC2','AC073062',1),
 ('*C09B06A3B3CDD2B8B3D539FBE438DD4BEC10C133','AC073064',1),
 ('*E747AEE5CB6B2CA80BDA891FE12838909B4DED07','AC073066',1),
 ('*4A6F7982DA9641BF54407944583CD519FCFCA44F','AC073069',1),
 ('*3CAC0CD7BBDF931893ADD4DFE6BE8C62FD4897D9','AC073081',1),
 ('*49622B4405349C2B14A46CD501FFFD850601FF3B','AC073084',1),
 ('*F1BE1018EC697E0BCCC34F68B1B27E120E2E36F3','AC073094',1),
 ('*5018C711481E1504184F51D85D9515D47C8EBE7D','AC073098',1),
 ('*EB5E48B9CA6507135D5462668758DE23FF7A5953','AC073109',1),
 ('*64255F3DB05CD89381AAAC9E8EEF81B1678EDF8B','AC073115',1),
 ('*33833F860A9026E05C1D496F74CE0558FED5B582','AC073120',1),
 ('*28468432983F0BCD3F9310A479F88E462985B008','AC073125',1),
 ('*636692A8A8866BCE477CBAA42AA4DA1C5E114A5B','AC073129',1),
 ('*8D596458D5625983F349CDFFB11544200755BC5D','AC080330',1),
 ('*E6BD3934BF336C3AD89FB04360481865A035A708','AC080331',1),
 ('*A663258ADDD0F88E8D7EE5451EF3E9B3A7C32B52','AC080333',1),
 ('*882EAEFBBF5773A705C20883E60AC1EDAC6F30A1','AC080335',1),
 ('*9AAF2CC13688F3F1F905D9D83B64900CEEC8404E','AC080336',1),
 ('*448519E4822E704DFABBD1A5C14FA500E3C07A62','AC080337',1),
 ('*F3B6C7937502F2E1FFC0C1804EEBCFC95339EE32','AC080338',1),
 ('*2ECCADCD7F24EA34964808C961EEE1B6D8903B98','AC080340',1),
 ('*FF3736593483E0F33A0D30723EC6B8F2172CDC8F','AC080341',1),
 ('*F551E3018E88C7C68DF1C8A5C167A5503CFBC569','AC080342',1),
 ('*A8E694A63F701D97F7A244260494F7E22EF4CB91','AC080344',1),
 ('*8746832A9EC5AE020A43B61780302D14ADA28340','AC080345',1),
 ('*9194437561C92EA9D6DEDD31951FE0794159007C','AC080346',1),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','AC080348',1),
 ('*6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9','AC080349',1),
 ('*759655F1E57C672D71A0DB0CC05770D42359F1A0','AC080350',1),
 ('*8B2BC25100151BF9683AD3AFBA595EC16E257A6A','AC080352',1),
 ('*E7E4394D249D5EF770782B477CDA60AA4E02077A','AC080354',1),
 ('*AF7BBFCA6035EF3724B90B22AFD10F5DA894500A','AC080355',1),
 ('*5721D9AC507065AC9D6A1D6DFCF4E04699E0C30F','AC080432',1),
 ('*83AAC1FCE34DBED6E1F2517E6E2D9AE263C6B25F','AC080434',1),
 ('*2BB7DC877B3CB8B078AC6FFBAD6541E35CB28E7F','AC080435',1),
 ('*94BDCEBE19083CE2A1F959FD02F964C7AF4CFC29','AC735110',1),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','admin',3),
 ('*832EB84CB764129D05D498ED9CA7E5CE9B8F83EB','BBB',2),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','PENSYARAH',2);
/*!40000 ALTER TABLE `users_login` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
