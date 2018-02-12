CREATE DATABASE  IF NOT EXISTS `MLB_NATIONAL_LEAGUE_CENTRAL` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `MLB_NATIONAL_LEAGUE_CENTRAL`;

DROP TABLE IF EXISTS `Manager`;
CREATE TABLE `Manager` (
  `manager_first_name` varchar(15) NOT NULL,
  `manager_last_name` varchar(15) NOT NULL,
  `team_name` varchar(45),
  `start_year` numeric(4,0),
  `win_percentage` decimal(3,3),
  PRIMARY KEY (`manager_first_name`),
  foreign key (`team_name`) references Team(`team_name`)
  
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `Manager` VALUES 
	('Joe','Maddon','Chicago Cubs',2015,0.568),
	('Craig','Counsell','Milwaukee Brewers',2015,0.531),
	('Mike','Mathey','St. Louis Cardinals',2012,0.512),
	('Clint','Hurdle','Pittsburgh Pirates',2011,0.463),
	('Bryan','Price','Cincinnati Reds',2014,0.420);
