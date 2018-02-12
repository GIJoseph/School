CREATE DATABASE  IF NOT EXISTS `MLB_NATIONAL_LEAGUE_CENTRAL` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `MLB_NATIONAL_LEAGUE_CENTRAL`;

DROP TABLE IF EXISTS `Team`;
CREATE TABLE `Team` (
  `team_name` varchar(45) NOT NULL,
  `stadium` varchar(45),
  `manager_first_name` varchar(15),
  `manager_last_name` varchar(15),
  `wins` numeric(3,0),
  `losses` numeric(3,0),
  `total_salary_cap` numeric(10,0),
  `world_series_wins` numeric(3,0),
  `win_percentage` decimal(3,3),
  PRIMARY KEY (`team_name`)/*
  foreign key (`stadium`) references Stadium(stadium_name)
 /* foreign key (`manager_first_name`) references Manager(`manager_first_name`),
  foreign key (`manager_last_name`) references Manager(`manager_last_name`)*/
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `Team` VALUES 
	('Chicago Cubs','Wrigley Field','Joe','Maddon', 92, 70, 182400336, 3, 0.568),
	('Milwaukee Brewers','Miller Park','Craig','Counsell', 86, 76, 83488679, 1, 0.531),
	('St. Louis Cardinals','Busch Stadium','Mike','Matheny', 83, 79, 149454185, 11, 0.512),
	('Pittsburgh Pirates','PNC Park','Clint','Hurdle', 75, 87, 109840330 , 5, 0.463),
	('Cincinnati Reds','Great American Ball Park','Bryan','Price',68 ,94 , 115323803 , 5, 0.420);
