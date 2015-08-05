-- phpMyAdmin SQL Dump
-- version 2.11.4
-- http://www.phpmyadmin.net
--
-- Host: s155.eatj.com:3307
-- Generation Time: Mar 08, 2009 at 10:59 PM
-- Server version: 5.0.67
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `yihrou`
--
CREATE DATABASE `yihrou` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `yihrou`;

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

CREATE TABLE IF NOT EXISTS `announcement` (
  `annID` int(10) unsigned NOT NULL auto_increment,
  `annTitle` varchar(255) NOT NULL,
  `annDesc` text NOT NULL,
  `annShow` varchar(45) NOT NULL,
  PRIMARY KEY  (`annID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `announcement`
--

INSERT INTO `announcement` (`annID`, `annTitle`, `annDesc`, `annShow`) VALUES
(12, 'PSM 2 Phase 1 Evaluation', 'To all PSM 2 student please make sure that your project already complete 40%.', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `expertisefield`
--

CREATE TABLE IF NOT EXISTS `expertisefield` (
  `staffNo` varchar(50) NOT NULL,
  `expertised` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `expertised_ID` int(10) unsigned NOT NULL auto_increment,
  PRIMARY KEY  (`expertised_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `expertisefield`
--

INSERT INTO `expertisefield` (`staffNo`, `expertised`, `description`, `expertised_ID`) VALUES
('rou', 'SED01', 'Software engineering r you sure.', 23),
('rou', 'SED02', 'Computational Intellignet.', 24),
('haha', 'SED01', 'Mobile Application', 25),
('haha', 'SED02', 'Genetic Algorithm', 26),
('S001', 'SED01', 'Timetabling, genetic algorithm.', 27),
('S001', 'SED02', 'Expert system', 28),
('S002', 'SED02', 'Expert System.', 29),
('S003', 'SED01', 'Web application', 30);

-- --------------------------------------------------------

--
-- Table structure for table `lecturer`
--

CREATE TABLE IF NOT EXISTS `lecturer` (
  `lectName` varchar(200) NOT NULL,
  `staffNo` varchar(45) NOT NULL,
  `emailAdd` varchar(100) NOT NULL,
  `phoneNo` varchar(45) NOT NULL,
  `pass` varchar(250) NOT NULL,
  PRIMARY KEY  (`staffNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lecturer`
--

INSERT INTO `lecturer` (`lectName`, `staffNo`, `emailAdd`, `phoneNo`, `pass`) VALUES
('Hishammuddin Asmuni', 'S001', 'hisham@utm.my', '012345678', '*FD571203974BA9AFE270FE62151AE967ECA5E0AA'),
('Abdul Manan', 'S002', 'tcljenny230@hotmail.com', '0168848602', '*FD571203974BA9AFE270FE62151AE967ECA5E0AA'),
('Sazali', 'S003', 'sazali@utm.my', '0123456789', '*FD571203974BA9AFE270FE62151AE967ECA5E0AA');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `studName` varchar(100) default NULL,
  `metricNo` varchar(20) NOT NULL,
  `icNo` varchar(12) default NULL,
  `emailAdd` varchar(50) default NULL,
  `pass` varchar(50) default NULL,
  `phoneNo` varchar(45) NOT NULL,
  PRIMARY KEY  (`metricNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`studName`, `metricNo`, `icNo`, `emailAdd`, `pass`, `phoneNo`) VALUES
('Jenny Tu Chui Ling', 'AC060089', '860219525558', 'tcljenny230@hotmail.com', '*6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9', '0168848602'),
('Khor Poan Sim', 'AC060099', '860101352113', 'sernj21@gmail.com', '*D823A7445649647A15C6E6D8507BE39DC65F4005', '0124972113'),
('Koo Nyuk Kin', 'AC060102', '861021237088', 'yukij21@gmail.com', '*6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9', '0127700778'),
('Kwan Lai Pheng', 'AC060106', '850521075288', 'abc@abc.com', '*6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9', '0134232524545'),
('Lee Yih Rou', 'AC060117', '220986', 'bluelyrou@hotmail.com', '*0E403DBF68CE48BEF547A081C6A121FA3AA2FC27', '0124273568'),
('Saw Jin Keat', 'BC060095', '1111111', 'abc@hotmail.com', '*FD571203974BA9AFE270FE62151AE967ECA5E0AA', '11111');

-- --------------------------------------------------------

--
-- Table structure for table `supervisor`
--

CREATE TABLE IF NOT EXISTS `supervisor` (
  `staffNo` varchar(50) NOT NULL,
  `metricNo` varchar(20) NOT NULL,
  `status` varchar(50) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supervisor`
--

INSERT INTO `supervisor` (`staffNo`, `metricNo`, `status`) VALUES
('S001', 'AC060089', 'Approve'),
('S002', 'AC060099', 'Pending'),
('S001', 'AC060117', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `title`
--

CREATE TABLE IF NOT EXISTS `title` (
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
  PRIMARY KEY  (`metricNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `title`
--

INSERT INTO `title` (`proTitle`, `bgProblem`, `objective`, `scope`, `proType`, `proField`, `softSpecification`, `hardware`, `technology`, `metricNo`, `status`) VALUES
('a', 'b', 'c', 'd', 'softDev', 'SED01', '   e ', '  f', '  g', 'AC060116', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `users_login`
--

CREATE TABLE IF NOT EXISTS `users_login` (
  `psw` varchar(50) NOT NULL,
  `userID` varchar(20) NOT NULL,
  `usertype` int(11) default NULL,
  PRIMARY KEY  (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_login`
--

INSERT INTO `users_login` (`psw`, `userID`, `usertype`) VALUES
('*E6CC90B878B948C35E92B003C792C46C58C4AF40', 'AC060089', 1),
('*E6CC90B878B948C35E92B003C792C46C58C4AF40', 'AC060099', 1),
('*E6CC90B878B948C35E92B003C792C46C58C4AF40', 'AC060102', 1),
('*E6CC90B878B948C35E92B003C792C46C58C4AF40', 'AC060106', 1),
('*E6CC90B878B948C35E92B003C792C46C58C4AF40', 'AC060117', 1),
('*E6CC90B878B948C35E92B003C792C46C58C4AF40', 'admin', 3),
('*E6CC90B878B948C35E92B003C792C46C58C4AF40', 'BC060095', 1),
('*FD571203974BA9AFE270FE62151AE967ECA5E0AA', 'S001', 2),
('*E6CC90B878B948C35E92B003C792C46C58C4AF40', 'S002', 2),
('*FD571203974BA9AFE270FE62151AE967ECA5E0AA', 'S003', 2),
('*E6CC90B878B948C35E92B003C792C46C58C4AF40', 'yrou', 2);
