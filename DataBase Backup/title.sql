DROP TABLE IF EXISTS `yihrou`.`title`;
CREATE TABLE  `yihrou`.`title` (
  
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

  PRIMARY KEY (`metricNo`)
) 
ENGINE=InnoDB DEFAULT CHARSET=latin1;