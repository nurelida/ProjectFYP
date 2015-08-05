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
--  Definition of table `announcement`
--

DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement` (
  `annID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `annTitle` varchar(255) NOT NULL,
  `annDesc` text NOT NULL,
  `annShow` varchar(45) NOT NULL,
  PRIMARY KEY (`annID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `announcement`
--

/*!40000 ALTER TABLE `announcement` DISABLE KEYS */;
INSERT INTO `announcement` (`annID`,`annTitle`,`annDesc`,`annShow`) VALUES 
 (3,'PSM Presentaion Seminar','Seminar Place: CICT D07','N'),
 (9,'PSM','Pre test','Y'),
 (11,'PSM 121','ABCEDEEEEE','Y');
/*!40000 ALTER TABLE `announcement` ENABLE KEYS */;


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
/*!40000 ALTER TABLE `engapply` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `expertisefield`
--

/*!40000 ALTER TABLE `expertisefield` DISABLE KEYS */;
INSERT INTO `expertisefield` (`staffNo`,`expertised`,`description`,`expertised_ID`) VALUES 
 ('S001','SED01','Web developement, sheduling system.',27),
 ('S002','SED03','stupid system',28),
 ('S004','SED03','Component based software engineering',30),
 ('S002','SED01','sfefef',31),
 ('S002','SED02','qqqqqq',32),
 ('S004','SED02','fefef',33);
/*!40000 ALTER TABLE `expertisefield` ENABLE KEYS */;


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
  PRIMARY KEY (`staffNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lecturer`
--

/*!40000 ALTER TABLE `lecturer` DISABLE KEYS */;
INSERT INTO `lecturer` (`lectName`,`staffNo`,`emailAdd`,`phoneNo`,`pass`,`roomNo`) VALUES 
 ('Abd Manan Ahmad','S002','manan@hotmail.com','012345678893','*A4B6157319038724E3560894F7F932C8886EBFCF','2'),
 ('Ali Selamat','S003','ali@hotmail.com','0123456789','*E6CC90B878B948C35E92B003C792C46C58C4AF40','22'),
 ('Dayang Norhayati Abang','S004','dayang@hotmail.com','0123456789','*E6CC90B878B948C35E92B003C792C46C58C4AF40','222'),
 ('Hishammuddin Asmuni','S006','hisham@ytmlmy.com','0123456789','*FD571203974BA9AFE270FE62151AE967ECA5E0AA','444'),
 ('Raziah','S008','a@hotma.ocm','1','*FD571203974BA9AFE270FE62151AE967ECA5E0AA','n28123'),
 ('Lee Yih Rou','S009','abc@hotmail.com','09','*FD571203974BA9AFE270FE62151AE967ECA5E0AA','N28 123'),
 ('Yrou','S010','1@hotmai.com','1','*A4B6157319038724E3560894F7F932C8886EBFCF','111');
/*!40000 ALTER TABLE `lecturer` ENABLE KEYS */;


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
 ('SED05','Mobile Application'),
 ('SED06','Web Development');
/*!40000 ALTER TABLE `projectfield` ENABLE KEYS */;


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
  PRIMARY KEY (`semester`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quota_lecturer`
--

/*!40000 ALTER TABLE `quota_lecturer` DISABLE KEYS */;
INSERT INTO `quota_lecturer` (`ev1`,`ev2`,`supervision`,`semester`,`ev_title`) VALUES 
 (5,5,5,'200820092',5);
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
 ('Kwan Lai Pheng','AC060106','850521075288','lpkwan@hotmail.com','*E9D057131C22A0D76B4AAD2C61655BDFA706E637','0164972445','200820092'),
 ('Lee Yih Rou','AC060117','860922406072','bluelyrou@hotmail.com','*E6CC90B878B948C35E92B003C792C46C58C4AF40','0124263568','200820092'),
 ('Siew Huey Ing','AC060237','850701135436','angeline_hi@hotmail.com','*31D2CAC6513D1CD15CA1512E7131DC3D8ADAC778','0168729270','200820092'),
 ('Sim Hiew Moi','AC060286','860817355288','sim@hotmail.com','*FD571203974BA9AFE270FE62151AE967ECA5E0AA','01685576411','200820092'),
 ('Yihnin','AC070123','1111','yihnin@hotmail.com','*E6CC90B878B948C35E92B003C792C46C58C4AF40','111','200820092'),
 ('Stupid','AC080080','111','1@hotma.com','*E6CC90B878B948C35E92B003C792C46C58C4AF40','111','200820092'),
 ('Yihnin','AC123456','11','a@hotmail.com','*832EB84CB764129D05D498ED9CA7E5CE9B8F83EB','11','200820092'),
 ('Saw Jin Keat','BC070095','861124097899','sawjk@hotmail.com','*E6CC90B878B948C35E92B003C792C46C58C4AF40','0172217017','200820092');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;


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
 ('S004','AC060106','Pending','200820092');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `title`
--

/*!40000 ALTER TABLE `title` DISABLE KEYS */;
INSERT INTO `title` (`proTitle`,`bgProblem`,`objective`,`scope`,`proType`,`proField`,`softSpecification`,`hardware`,`technology`,`metricNo`,`status`,`semester`,`proID`,`evaluator`,`comment`,`title_flag`) VALUES 
 ('a','b','c','d','research','SED04','   e ','  f','  g','AC060117','Pending','200820092',13,NULL,NULL,'Y');
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
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','AC060106',1),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','AC060117',1),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','AC060237',1),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','AC060286',1),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','AC070123',1),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','AC080080',1),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','AC123456',1),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','admin',3),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','BC070095',1),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','S002',2),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','S003',2),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','S004',2),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','S006',2),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','S007',2),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','S008',2),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','S009',2),
 ('*E6CC90B878B948C35E92B003C792C46C58C4AF40','S010',2);
/*!40000 ALTER TABLE `users_login` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
