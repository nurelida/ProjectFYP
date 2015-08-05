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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `announcement`
--

/*!40000 ALTER TABLE `announcement` DISABLE KEYS */;
INSERT INTO `announcement` (`annID`,`annTitle`,`annDesc`,`annShow`) VALUES 
 (3,'PSM Presentaion Seminar\'s','Seminar Place: CICT D07\'s','Y'),
 (9,'PSM','Good Luck to all presentors.','Y');
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
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;

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
 ('7351','SED02','Planning and schedulling\'s',39),
 ('7351','SED01','Web based software developement',40),
 ('6838','SED01','Web based application',41),
 ('6838','SED03','',42),
 ('10054','SED02','Data/ Text mining',43),
 ('2135','SED01','Web Development',44),
 ('7019','SED01','Real Time Software',45),
 ('5809','SED02','Computational Peteomic, computation genomic',46),
 ('1898','SED01','Computer science education/ elearning',47),
 ('1898','SED03','Expert System',48),
 ('5160','SED01','Intelligent System, elearning algorithm',49),
 ('S008','SED01','Intelligent learning system',50),
 ('S009','SED01','Web development',51),
 ('2157','SED02','Fuzzy logic, neural network, genetic algorithm',52),
 ('S010','SED01','Agent oriented software engineering',53),
 ('1234','SED01','Software engineering',54),
 ('1234','SED02','Genetic algorithm, case base reasoning, neural network, support vector machine',55),
 ('4298','SED01','Software engineering',56),
 ('S011','SED01','Web based System',57),
 ('6749','SED01','Software engineering',58),
 ('6749','SED02','Soft computing, techniques and applications',59),
 ('7352','SED01','Software design / architechture',60),
 ('4724','SED01','\'',62);
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
 ('7351','tt0211','200820092');
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
 ('Ito Wasito','10054','ito@utm.my','075532225','*E6CC90B878B948C35E92B003C792C46C58C4AF40','D07-447-01','Active'),
 ('Safaai Deris','1234','safaai@utm.my','075532343','*E6CC90B878B948C35E92B003C792C46C58C4AF40','N28-305-05','Active'),
 ('Noraniah Mohd Yassin','1898','noraniah@utm.my','075532346','*E6CC90B878B948C35E92B003C792C46C58C4AF40','N28-305-09 ','Active'),
 ('Mabeni Mapoh','2135','mabeni@utm.my','075532232','*E6CC90B878B948C35E92B003C792C46C58C4AF40','D07-354-01','Active'),
 ('Puteh Saad','2157','puteh@utm.my','075532344','*E6CC90B878B948C35E92B003C792C46C58C4AF40','N28-305-06','Active'),
 ('Safie Mat Yatim','4298','safiematyatim@utm.my','075532347','*E6CC90B878B948C35E92B003C792C46C58C4AF40','N28-305-10','Active'),
 ('Abdul Manan Ahmad','4724','manan@utm.my','075532201','*E6CC90B878B948C35E92B003C792C46C58C4AF40','N28-305-04','Active'),
 ('Norazah Yusof','5160','norazah@utm.my','075532344','*E6CC90B878B948C35E92B003C792C46C58C4AF40','N28-305-12','Active'),
 ('Muhammad Razib Othman','5809','razib@utm.my','075532258','*E6CC90B878B948C35E92B003C792C46C58C4AF40','N28-306-04 ','Active'),
 ('Siti Zaiton Mohd Hashim','6749','sitizaiton@utm.my','075532439','*E6CC90B878B948C35E92B003C792C46C58C4AF40','N28-306-18','Active'),
 ('Ismail Mat Amin','6838','ismailma@utm.my','075532345','*E6CC90B878B948C35E92B003C792C46C58C4AF40','N28-305-08','Active'),
 ('Mohd Yazid Idris','7019','yazid@utm.my','075532309','*E6CC90B878B948C35E92B003C792C46C58C4AF40','N28-306-14 ','Active'),
 ('Dayang Norhayati Abg Jawawi','7331','dayang@utm.my','075532354','*E6CC90B878B948C35E92B003C792C46C58C4AF40','N28-306-06','Active'),
 ('Hishammuddin Asmuni','7351','hishammuddin@utm.my','075532353','*E6CC90B878B948C35E92B003C792C46C58C4AF40','N28-306-05','Active'),
 ('Wan Mohd Nasir Wan Kadir','7352','wnasir@utm.my','075532348','*E6CC90B878B948C35E92B003C792C46C58C4AF40','N28-305-11','Active'),
 ('Pensyarah','PENSYARAH','pensyarah@utm.my','01234567890','*6F7BA323A343A04F40C359F1C02DED1482FF7AC8','n28','Active'),
 ('Norbahiah Ahmad','S008','bahiah@utm.my','012345678','*E6CC90B878B948C35E92B003C792C46C58C4AF40','-','Active'),
 ('Paridah Samsuri','S009','paridah@fsksm.utm.my','075532042','*E6CC90B878B948C35E92B003C792C46C58C4AF40','N28-306-15','Active'),
 ('Radziah Mohamad','S010','radziahm@utm.my','075532013','*E6CC90B878B948C35E92B003C792C46C58C4AF40','N28-306-17','Active'),
 ('Sazali Abd Manaf','S011','sazali@utm.my','075532432','*E6CC90B878B948C35E92B003C792C46C58C4AF40','N28-306-20','Active');
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
 ('AC060117','200820092'),
 ('AC060119','200820092'),
 ('AC070095','200820092'),
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
 (11,11,11,'200820092',11,11,11);
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
 ('Lee Yih Rou','AC060117','860922405072','bluelyrou@hotmail.com','*6D3C9108CD0520D9B51B932439E5F7A3BA38D078','0124273568','200820092'),
 ('Ong','AC060119','11111111','abc@hotmail.com','*832EB84CB764129D05D498ED9CA7E5CE9B8F83EB','11111','200820092'),
 ('Saw Jin Keat','AC070095','861225145723','saw@hotmail.com','*E6CC90B878B948C35E92B003C792C46C58C4AF40','0162217017','200820092');
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
 ('7351','AC070095','Approved','200820092');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `title`
--

/*!40000 ALTER TABLE `title` DISABLE KEYS */;
INSERT INTO `title` (`proTitle`,`bgProblem`,`objective`,`scope`,`proType`,`proField`,`softSpecification`,`hardware`,`technology`,`metricNo`,`status`,`semester`,`proID`,`evaluator`,`comment`,`title_flag`) VALUES 
 ('PSM Sistem','a\r\nb\r\nc\r\nd','1.\r\n2.\r\n3.\r\n','jojojoj','softDev','SED01','   jojjojojo \'\'  ','   jjooj','   jjojojo','AC060117','Conditional Approval (Minor)','200820092',19,'10054','ppp\'\'','Y'),
 ('Web Based conferencing','jfejfijo','jjojjo','jojojoj','softDev','SED02','  jo','fef',' jjjojo','AC070095','Full Approval','200820092',20,'7351','\'\'','Y');
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
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','1234',2),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','1898',2),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','2135',2),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','2157',2),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','4298',2),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','4724',2),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','5160',2),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','5809',2),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','6749',2),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','6838',2),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','7019',2),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','7331',2),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','7351',2),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','7352',2),
 ('*6D3C9108CD0520D9B51B932439E5F7A3BA38D078','AC060117',1),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','AC060119',1),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','AC070095',1),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','admin',3),
 ('*832EB84CB764129D05D498ED9CA7E5CE9B8F83EB','BBB',2),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','PENSYARAH',2),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','S008',2),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','S009',2),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','S010',2),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','S011',2);
/*!40000 ALTER TABLE `users_login` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
