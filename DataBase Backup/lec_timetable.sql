DROP TABLE IF EXISTS `lec_timetable`;
CREATE TABLE `lec_timetable` 
(
  `staffNo` varchar(10) NOT NULL,
  `free_period` varchar(6) NOT NULL
)
 ENGINE=InnoDB DEFAULT CHARSET=latin1;