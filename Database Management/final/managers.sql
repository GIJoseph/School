CREATE DATABASE  IF NOT EXISTS `MLB_NATIONAL_LEAGUE_CENTRAL` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `MLB_NATIONAL_LEAGUE_CENTRAL`;

DROP TABLE IF EXISTS `Manager`;
CREATE TABLE `Manager` (
  `manager_first_name` varchar(15) NOT NULL,
  `manager_last_name` varchar(15) NOT NULL,
  `team_name` varchar(45),
  `start_year` numeric(4,0),
  `win_percentage` decimal(1,3),
  PRIMARY KEY (`manager_first_name`),
  foreign key (`manager_last_name`) ,
  foreign key (`team_name`) references Team(`team_name`)
  
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Team` WRITE;
INSERT INTO `Team` VALUES 
	('Joe','Maddon','Chicago Cubs',,0.568),
	('Craig','Counsell','Milwaukee Brewers',,0.531),
	('Mike','Matheyny','St. Louis Cardinals',,0.512),
	('Clint','Hurdle','Pittsburgh Pirates',,0.463),
	('Bryan','Price','Cincinnati Reds',,0.420);
UNLOCK TABLES;