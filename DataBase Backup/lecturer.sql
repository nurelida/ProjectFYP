DROP TABLE IF EXISTS `yihrou`.`lecturer`;
CREATE TABLE  `yihrou`.`lecturer` 
(
  `lectName` varchar(200) NOT NULL,

  `staffNo` varchar(45) NOT NULL,

  `emailAdd` varchar(100) NOT NULL,

  `phoneNo` varchar(45) NOT NULL,

  `pass` varchar(250) NOT NULL,

  PRIMARY KEY (`staffNo`)
) 
ENGINE=InnoDB DEFAULT CHARSET=latin1;