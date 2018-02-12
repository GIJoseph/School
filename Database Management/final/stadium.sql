CREATE DATABASE  IF NOT EXISTS `MLB_NATIONAL_LEAGUE_CENTRAL` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `MLB_NATIONAL_LEAGUE_CENTRAL`;

DROP TABLE IF EXISTS `Stadium`;
CREATE TABLE `Stadium` (
  `stadium_name` varchar(15) NOT NULL,
  `num_of_seats` numeric(6,0),
  `avg_ticket_price` decimal(3,2),
  `year_opened` numeric(4,0),
  `state` varchar(2),
  `team_name` varchar(45),
    
  PRIMARY KEY (`stadium_name`),
  foreign key (`team_name`) references Team(team_name)
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



LOCK TABLES `Team` WRITE;
INSERT INTO `Team` VALUES 
	('Wrigley Field',41268,118.00,1914,'IL','Chicago Cubs'),
    ('Miller Park',41900,80.00,2000,'WI','Milwaukee Brewers'),
    ('Busch Stadium',45538,83.55,1964,'MO','St. Louis Cardinals'),
    ('PNC Park',38362,20.00,2001,'PA','Pittsburgh Pirates'),
    ('Great American Ball Park',42319,83.00,2003,'OH','Cincinnati Reds')
UNLOCK TABLES;