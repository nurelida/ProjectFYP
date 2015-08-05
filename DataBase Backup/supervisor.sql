DROP TABLE IF EXISTS `yihrou`.`supervisor`;
CREATE TABLE  `yihrou`.`supervisor` 
(
  `staffNo` varchar(50) NOT NULL,

  `metricNo` varchar(20) NOT NULL,

  `status` varchar(50) DEFAULT NULL
)
 ENGINE=InnoDB DEFAULT CHARSET=latin1;