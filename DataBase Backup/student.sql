DROP TABLE IF EXISTS `yihrou`.`student`;
CREATE TABLE  `yihrou`.`student` 
(
  `studName` varchar(100) DEFAULT NULL,

  `metricNo` varchar(20) NOT NULL,

  `icNo` varchar(12) DEFAULT NULL,

  `emailAdd` varchar(50) DEFAULT NULL,

  `pass` varchar(50) DEFAULT NULL,

  `phoneNo` varchar(45) NOT NULL,

  PRIMARY KEY (`metricNo`) USING BTREE
)
 ENGINE=InnoDB DEFAULT CHARSET=latin1;