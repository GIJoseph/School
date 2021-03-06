CREATE DATABASE  IF NOT EXISTS `MLB_NATIONAL_LEAGUE_CENTRAL`;
USE `MLB_NATIONAL_LEAGUE_CENTRAL`;

DROP TABLE IF EXISTS `Player`;

CREATE TABLE `Player` (
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(15) NOT NULL,
  `jersey_number` numeric(2,0) NOT NULL,
  `position` varchar(2) ,
  `salary` numeric(10,0),
  `starting_year` numeric(4,0),
  `birth_year` numeric(4,0) NOT NULL,
  `team_name` varchar(15) NOT NULL,
  
  
  
  PRIMARY KEY (`first_name`,`last_name`,`jersey_number`,`team_name`),
  
  foreign key (`team_name`) references Team(team_name),
) 


INSERT INTO `prereq` VALUES 
/*  Chicago Cubs */
	('Dillon','Maples',36,'P',0,2012,1992,'Chicago Cubs'),
	('Pedro','Strop',46,'P',5500000,2003,1985,'Chicago Cubs'),
	('Kyle','Hendricks',28,'P',760500,2011,1989,'Chicago Cubs'),
	('Jon','Lester',34,'P',25000000,2002,1984,'Chicago Cubs'),
	('Hector','Rondon',56,'P',5800000,2006,,'Chicago Cubs'),
	('Mike','Montgomery',38,'P',0,2008,1989,'Chicago Cubs'),
	('Justin','Grimm',52,'P',1825000,2011,1988,'Chicago Cubs'),
	('Rob','Zastryzny',29,'P',0,2013,1992,'Chicago Cubs'),
	('Eddie','Butler',33,'P',0,2012,1991,'Chicago Cubs'),
	('Justin','Wilson',37,'P',0,2009,1987,'Chicago Cubs'),
	('Jen-Ho','Tseng',39,'P',0,2014,1994,'Chicago Cubs'),
	('Carl','Edwards',6,'P',556000,2012,1991,'Chicago Cubs'),
	('Jose','Quintana',62,'P',7000000,2006,1989,'Chicago Cubs'),
	('Addison','Russell',27,'SS',644000,2012,1994,'Chicago Cubs'),
	('Kyle','Schwarber',12,'OF',565500,2014,1993,'Chicago Cubs'),
	('Mark','Zagunis',21,'OF',0,2014,1993,'Chicago Cubs'),
	('Anthony','Rizzo',44,'1B',7000000,2007,1989,'Chicago Cubs'),
	('Albert','Almora',5,'OF',552000,2012,1994,'Chicago Cubs'),
	('Javier','Baez',9,'2B',609000,2011,1992,'Chicago Cubs'),
	('Kris','Bryant',17,'3B',1050000,2013,1992,'Chicago Cubs'),
	('Victor','Caratini',20,'C',0,2013,1993,'Chicago Cubs'),
	('Willson','Contreras',40,'C',544400,2009,1992,'Chicago Cubs'),
	('Taylor','Davis',43,'2B',0,2011,1989,'Chicago Cubs'),
	('Ian','Happ',8,'OF',0,2013,1994,'Chicago Cubs'),
	('Jason','Heyward',22,'OF',28166667,2015,1989,'Chicago Cubs'),
	('Tommy','LaStella',2,'2B',0,2011,1989,'Chicago Cubs'),
	('Ben','Zobrist',18,'2B',16500000,2004,1981,'Chicago Cubs'),
	
	/*  Milwaukee Brewers */
	('Brandon','Woodruff',53,'P',0,2014,1993,'Milwaukee Brewers'),
	('Jeremy','Jeffress',32,'P',0,2006,1987,'Milwaukee Brewers'),
	('Taylor','Jungmann',26,'P',537600,2012,1989,'Milwaukee Brewers'),
	('Corey','Knebel',46,'P',538900,2013,1991,'Milwaukee Brewers'),
	('Jimmy','Nelson',52,'P',547000,2010,1989,'Milwaukee Brewers'),
	('Brent','Suter',35,'P',0,2012,1989,'Milwaukee Brewers'),
	('Wei-Chung','Wang',58,'P',0,2013,1992,'Milwaukee Brewers'),
	('Aaron','Wilkerson',56,'P',0,2013,1989,'Milwaukee Brewers'),
	('Taylor','Williams',45,'P',0,2013,1991,'Milwaukee Brewers'),
	('Jared','Hughes',48,'P',950000,2006,1985,'Milwaukee Brewers'),
	('Josh','Hader',71,'P',0,2012,1994,'Milwaukee Brewers'),
	('Junior','Guerra',41,'P',546200,2003,1985,'Milwaukee Brewers'),
	('Oliver','Drake',51,'P',538000,2008,1987,'Milwaukee Brewers'),
	('Zach','Davies',27,'P',546200,2012,1993,'Milwaukee Brewers'),
	('Chase','Anderson',57,'P',2450000,2009,1987,'Milwaukee Brewers'),
	('Jacob','Barnes',50,'P',537700,2011,1990,'Milwaukee Brewers'),
	('Eric','Thames',7,'2B',4000000,2009,1986,'Milwaukee Brewers'),
	('Jonathan','Villar',5,'3B',554500,2008,1991,'Milwaukee Brewers'),
	('Stephen','Vogt',12,'C',2965000,2007,1984,'Milwaukee Brewers'),
	('Jett','Bandy',47,'C',539800,2011,1990,'Milwaukee Brewers'),
	('Orlando','Arcia',3,'SS',538100,2011,1994,'Milwaukee Brewers'),
	('Ryan','Braun',8,'OF',20000000,2005,1983,'Milwaukee Brewers'),	
	('Andrew','Susac',13,'C',537400,2012,1990,'Milwaukee Brewers'),
	('Eric','Sogard',18,'SS',0,2007,1986,'Milwaukee Brewers'),
	('Travis','Shaw',21,'3B',544400,2012,1990,'Milwaukee Brewers'),
	('Domingo','Santana',16,'OF',542200,2009,1992,'Milwaukee Brewers'),
	('Manny','Pina',9,'C',538200,2005,1987,'Milwaukee Brewers'),
	('Brett','Phillips',33,'OF',0,2012,1994,'Milwaukee Brewers'),
	('Hernan','Perez',14,'OF',545700,2008,1994,'Milwaukee Brewers'),
	('Keon','Broxton',23,'OF',541200,2009,1990,'Milwaukee Brewers'),
	('Jesus','Aguilar',24,'1B',536000,2008,1990,'Milwaukee Brewers'),
	
	/*  St. Louis Cardinals */
	('Sandy','Alcantara',56,'P',0,2014,1995,'St. Louis Cardinals'),
	('Tyler','Lyons',70,'P',0,2011,1988,'St. Louis Cardinals'),
	('Carlos','Martinez',18,'P',3700000,2010,1991,'St. Louis Cardinals'),
	('Alex','Reyes',61,'P',0,2013,1994,'St. Louis Cardinals'),
	('Ryan','Sherriff',65,'P',0,2011,1990,'St. Louis Cardinals'),
	('Sam','Tuivailala',64,'P',536500,2010,1992,'St. Louis Cardinals'),
	('Michael','Wacha',52,'P',2775000,2012,1991,'St. Louis Cardinals'),
	('Adam','Wainwright',50,'P',19500000,2000,1981,'St. Louis Cardinals'),
	('Luke','Weaver',62,'P',0,2014,1993,'St. Louis Cardinals'),
	('Rowan','Wick',72,'P',0,2012,1992,'St. Louis Cardinals'),
	('Josh','Lucas',77,'P',0,2010,1990,'St. Louis Cardinals'),
	('Matthew','Bowman',67,'P',546600,2012,1991,'St. Louis Cardinals'),
	('John','Brebbia',60,'P',0,2011,1990,'St. Louis Cardinals'),
	('John','Gant',53,'P',536600,2011,1992,'St. Louis Cardinals'),
	('Brett','Cecil',27,'P',7750000,2007,1986,'St. Louis Cardinals'),
	('Jack','Flaherty',32,'P',0,2014,1995,'St. Louis Cardinals'),
	('Randal','Grichuk',15,'OF',557200,2009,1991,'St. Louis Cardinals'),
	('Breyvic','Valera',41,'2B',0,2010,1992,'St. Louis Cardinals'),
	('Luke','Voit',40,'1B',0,2013,1991,'St. Louis Cardinals'),
	('Matt','Carpenter',13,'1B',10000000,2009,1985,'St. Louis Cardinals'),
	('Harrison','Bader',48,'OF',0,2015,1994,'St. Louis Cardinals'),
	('Magneuris','Sierra',43,'OF',0,2013,1996,'St. Louis Cardinals'),	
	('Paul','DeJong',11,'SS',0,2015,1993,'St. Louis Cardinals'),
	('Aledmys','Diaz',36,'SS',2500000,2007,1990,'St. Louis Cardinals'),
	('Jedd','Gyorko',3,'3B',6000000,2010,1988,'St. Louis Cardinals'),
	('Carson','Kelly',30,'C',0,2012,1994,'St. Louis Cardinals'),
	('Greg','Garcia',35,'3B',,2010,1989,'St. Louis Cardinals'),
	('Dexter','Fowler',25,'OF',16500000,2005,1986,'St. Louis Cardinals'),
	('Jose','Martinez',58,'1B',535000,2006,1988,'St. Louis Cardinals'),
	('Yadier','Molina',4,'C',14000000,2001,1982,'St. Louis Cardinals'),
	('Tommy','Pham',28,'OF',0,2006,1988,'St. Louis Cardinals'),
	('Stephen','Piscotty',55,'OF',1333333,2012,1991,'St. Louis Cardinals'),
	('Kolten','Wong',16,'2B',2500000,2011,1990,'St. Louis Cardinals'),
	
	
	/*  Pittsburgh Pirates */
	('Johnny','Barbato',51,'P',0,2011,1992,'Pittsburgh Pirates'),
	('Chad','Kuhl',39,'P',550000,2013,1992,'Pittsburgh Pirates'),
	('Jack','Leathersich',52,'P',0,2011,1990,'Pittsburgh Pirates'),
	('Trevor','Williams',57,'P',544000,2013,1992,'Pittsburgh Pirates'),
	('Dovydas','Neverauskas',66,'P',00,2010,1993,'Pittsburgh Pirates'),
	('Ivan','Nova',46,'P',7666000,2006,1987,'Pittsburgh Pirates'),
	('Felipe','Rivero',73,'P',564500,2009,1991,'Pittsburgh Pirates'),
	('Angel','Sanchez',59,'P',0,2011,1989,'Pittsburgh Pirates'),
	('Edgar','Santana',37,'P',0,2014,1991,'Pittsburgh Pirates'),
	('A.J.','Schugel',31,'P',0,2010,1989,'Pittsburgh Pirates'),
	('Jameson','Taillon',50,'P',555000,2011,1991,'Pittsburgh Pirates'),
	('George','Kontos',70,'P',0,2006,1985,'Pittsburgh Pirates'),
	('Nick','Kingham',49,'P',0,2010,1991,'Pittsburgh Pirates'),
	('Daniel','Hudson',41,'P',5500000,2008,1987,'Pittsburgh Pirates'),
	('Gerrit','Cole',45,'P',3750000,2011,1990,'Pittsburgh Pirates'),
	('Tyler','Glasnow',24,'P',541000,2012,1993,'Pittsburgh Pirates'),
	('Steven','Brault',43,'P',0,2013,1992,'Pittsburgh Pirates'),
	('Sean','Rodriguez',3,'OF',5750000,2003,1985,'Pittsburgh Pirates'),
	('Francisco','Cervelli',29,'C',9000000,2005,1986,'Pittsburgh Pirates'),
	('Jacob','Stallings',58,'C',0,2012,1989,'Pittsburgh Pirates'),
	('Chris','Stewart',19,'C',1400000,2002,1982,'Pittsburgh Pirates'),
	('Christopher','Bostick',63,'OF',0,2011,1993,'Pittsburgh Pirates'),	
	('Josh','Bell',55,'1B',549000,2012,1992,'Pittsburgh Pirates'),
	('Elias','Diaz',32,'C',0,2009,1990,'Pittsburgh Pirates'),
	('Gregory','Polanco',25,'OF',1600000,2009,1991,'Pittsburgh Pirates'),
	('Jose','Osuna',36,'OF',0,2010,1992,'Pittsburgh Pirates'),
	('Josh','Harrison',5,'2B',7750000,2008,1987,'Pittsburgh Pirates'),
	('Jordan','Luplow',47,'OF',0,2014,1993,'Pittsburgh Pirates'),
	('Andrew','McCutchen',22,'OF',14000000,2005,1986,'Pittsburgh Pirates'),
	('Jordy','Mercer',10,'SS',4325000,2008,1986,'Pittsburgh Pirates'),
	('Max','Moroff',62,'2B',0,2012,1993,'Pittsburgh Pirates'),
	('David','Freese',23,'3B',6350000,2006,1983,'Pittsburgh Pirates'),
	('Gift','Ngoepe',61,'2B',0,2009,1990,'Pittsburgh Pirates'),
	('Adam','Frazier',26,'OF',549500,2013,1991,'Pittsburgh Pirates'),
	('Starling','Marte',6,'OF',5333333,2007,1988,'Pittsburgh Pirates'),
	
	/*  Cincinnati Reds */
	('Tim','Adleman',46,'P',0,2010,1987,'Cincinnati Reds'),
	('Raisel','Iglesias',26,'P',4214286,2010,1990,'Cincinnati Reds'),
	('Michael','Lorenzen',21,'P',555000,2013,1992,'Cincinnati Reds'),
	('Tyler','Mahle',30,'P',0,2013,1994,'Cincinnati Reds'),
	('Keury','Mella',36,'P',0,2012,1993,'Cincinnati Reds'),
	('Wandy','Peralta',53,'P',535000,2010,1991,'Cincinnati Reds'),
	('Cody','Reed',25,'P',537000,2013,1993,'Cincinnati Reds'),
	('Sal','Romano',47,'P',0,2012,1993,'Cincinnati Reds'),
	('Kevin','Shackelford',41,'P',0,2010,1989,'Cincinnati Reds'),
	('Jackson','Stephens',62,'P',0,2012,1994,'Cincinnati Reds'),
	('Robert','Stephenson',55,'P',535000,2012,1993,'Cincinnati Reds'),
	('Ariel','Hernandez',63,'P',0,2009,1992,'Cincinnati Reds'),
	('Austin','Brice',40,'P',535000,2020,1992,'Cincinnati Reds'),
	('Luis','Castillo',58,'P',0,2012,1992,'Cincinnati Reds'),
	('Amir','Garrett',50,'P',0,2012,1992,'Cincinnati Reds'),
	('Brandon','Finnegan',29,'P',567000,2014,1993,'Cincinnati Reds'),
	('Rookie','Davis',54,'P',535000,2012,1993,'Cincinnati Reds'),
	('Homer','Bailey',34,'P',19000000,2004,1986,'Cincinnati Reds'),
	('Tucker','Barnhart',16,'C',575000,2009,1991,'Cincinnati Reds'),
	('Eugenio','Suarez',7,'3B',595000,2009,1991,'Cincinnati Reds'),	
	('Stuart','Turner',32,'C',535000,2013,1991,'Cincinnati Reds'),
	('Joey','Votto',19,'1B',22000000,2002,1983,'Cincinnati Reds'),
	('Scooter','Gennett',4,'2B',0,2010,1990,'Cincinnati Reds'),
	('Scott','Schebler',43,'OF'540000,,2010,1990,'Cincinnati Reds'),
	('Jose','Peraza',9,'2B',540000,2011,1994,'Cincinnati Reds'),
	('Devin','Mesoraco',39,'C',7325000,2007,1988,'Cincinnati Reds'),
	('Adam','Duvall',23,'OF',577000,2010,1988,'Cincinnati Reds'),
	('Phil','Ervin',27,'OF',0,2013,1992,'Cincinnati Reds'),
	('Billy','Hamilton',6,'OF',2625000,2009,1990,'Cincinnati Reds'),
	('Jesse','Winker',33,'OF',0,2012,1993,'Cincinnati Reds'),
	('Zach','Cozart',2,'SS',5325000,2012,1993,'Cincinnati Reds'),
	
	
;
