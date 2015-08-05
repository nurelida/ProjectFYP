DROP TABLE IF EXISTS `finalyearproject`.`projectfield`;
CREATE TABLE  `finalyearproject`.`projectfield` (
  `ID` varchar(20) NOT NULL,
  `proField` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;