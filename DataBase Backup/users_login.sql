DROP TABLE IF EXISTS `yihrou`.`users_login`;
CREATE TABLE  `yihrou`.`users_login` 
(
  `psw` varchar(50) NOT NULL,

  `userID` varchar(20) NOT NULL,

  `usertype` int(11) DEFAULT NULL,

  PRIMARY KEY (`userID`) USING BTREE
)
 ENGINE=InnoDB DEFAULT CHARSET=latin1;