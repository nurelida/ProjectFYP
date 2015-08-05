DROP TABLE IF EXISTS `yihrou`.`expertisefield`;
CREATE TABLE  `yihrou`.`expertisefield` 
(
  `staffNo` varchar(50) NOT NULL,
  
`expertised` varchar(100) NOT NULL,

  `description` text NOT NULL,

  `expertised_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,

  PRIMARY KEY (`expertised_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;