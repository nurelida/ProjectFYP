DROP TABLE IF EXISTS `yihrou`.`announcement`;
CREATE TABLE  `yihrou`.`announcement` 
(
`annID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  
`annTitle` varchar(255) NOT NULL,
 
 `annDesc` text NOT NULL,
  
`annShow` varchar(45) NOT NULL,
  
PRIMARY KEY (`annID`)
) 
ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;