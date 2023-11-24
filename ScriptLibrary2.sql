CREATE DATABASE  IF NOT EXISTS `Library`;
USE `Library`;


DROP TABLE IF EXISTS `Authors`;

CREATE TABLE `Authors` (
  `AuthorID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `Nationality` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`AuthorID`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


LOCK TABLES `Authors` WRITE;

INSERT INTO `Authors` VALUES (1,'Charles Dickens','English'),(2,'Julio Verne','French'),(4,'James S. A. Corey','USA'),(5,'Julio Verne','French'),(6,'H. G. Wells','English'),(7,'Philip K. Dick','American'),(8,'H. P Lovecraft','American'),(9,'Ray Bradbury','American'),(10,'Ursula K. Le Guin','American'),(11,'Arthur C. Clarke','English'),(12,'Isaac Asimov','American'),(13,'Richard Matheson','American'),(14,'Alfred Bester','American'),(15,'Frank Herbert','American'),(16,'William Gibson','American'),(17,'Octavia E. Butler','American'),(18,'Dan Simmons','American'),(19,'Stanislaw Lem','Polish'),(20,'Robert Sheckley','American'),(21,'Kim Stanley Robinson','American'),(22,'Margaret Atwood','Canadian'),(23,'J. G Ballard','English'),(24,'Ann Leckie','American'),(25,'Miguel de Cervantes','Spanish'),(26,'Marcel Proust','French'),(27,'Homero','Greek'),(28,'Franz Kafka','Czech'),(29,'León Tolstói','Russian'),(30,'Herman Melville','American'),(31,'Antón Chéjov','Russian'),(32,'Jorge Luis Borges','Argentinian'),(33,'Federico García Lorca','Spanish'),(34,'Fiódor Dostoievski','Russian'),(35,'Thomas Mann','German'),(36,'Juan Rulfo','Mexican'),(37,'James Joyce','Irish'),(38,'William Faulkner','American'),(39,'Gustave Flaubert','French');

UNLOCK TABLES;



DROP TABLE IF EXISTS `Books`;

CREATE TABLE `Books` (
  `BookID` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(100) DEFAULT NULL,
  `PublicationYear` int DEFAULT NULL,
  `AuthorID` int DEFAULT NULL,
  PRIMARY KEY (`BookID`),
  KEY `Books_ibfk_1` (`AuthorID`),
  CONSTRAINT `Books_ibfk_1` FOREIGN KEY (`AuthorID`) REFERENCES `Authors` (`AuthorID`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


LOCK TABLES `Books` WRITE;

INSERT INTO `Books` VALUES (1,'Oliver Twist',1839,1),(2,'Cuentos de Navidad',1843,1),(3,'La vuelta al mundo en 80 dias',1864,2),(5,'La isla misteriosa',1974,2),(6,'El despertar del Leviatán ',2011,4),(7,'El despertar del Leviatán ',2011,4),(8,'La gerra de Caliban',2012,NULL),(9,'La Puerta de Abadón',2013,NULL),(30,'Journey to the Center of the Earth',1864,2),(31,'The Time Machine',1895,6),(32,'Do Androids Dream of Electric Sheep?',1968,7),(33,'The Call of Cthulhu',1928,8),(34,'Fahrenheit 451',1953,9),(35,'The Left Hand of Darkness',1969,10),(36,'2001: A Space Odyssey',1968,11),(37,'Foundation',1951,12),(38,'I Am Legend',1954,13),(39,'The Demolished Man',1952,14),(40,'Dune',1965,15),(41,'Neuromancer',1984,16),(42,'Kindred',1979,17),(43,'Hyperion',1989,18),(44,'Solaris',1961,19),(45,'The Hitchhiker\'s Guide to the Galaxy',1979,20),(46,'The Dispossessed',1974,21),(47,'The Handmaid\'s Tale',1985,22),(48,'High-Rise',1975,23),(49,'Ancillary Justice',2013,24);

UNLOCK TABLES;



DROP TABLE IF EXISTS `AuthorDetails`;

CREATE TABLE `AuthorDetails` (
  `AuthorDetailsID` int NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `wikipedia` varchar(255) DEFAULT NULL,
  `awards` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`AuthorDetailsID`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `AuthorDetails_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `Authors` (`AuthorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


LOCK TABLES `AuthorDetails` WRITE;


UNLOCK TABLES;

DROP TABLE IF EXISTS `Categories`;

CREATE TABLE `Categories` (
  `CategoryID` int NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


LOCK TABLES `Categories` WRITE;

INSERT INTO `Categories` VALUES (1,'Novel'),(2,'Science Fiction'),(3,'History'),(4,'Mystery'),(5,'Fantasy');

UNLOCK TABLES;



DROP TABLE IF EXISTS `Books_Categories`;

CREATE TABLE `Books_Categories` (
  `BookID` int NOT NULL,
  `CategoryID` int NOT NULL,
  PRIMARY KEY (`BookID`,`CategoryID`),
  KEY `CategoryID` (`CategoryID`),
  CONSTRAINT `Books_Categories_ibfk_1` FOREIGN KEY (`BookID`) REFERENCES `Books` (`BookID`),
  CONSTRAINT `Books_Categories_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `Categories` (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


LOCK TABLES `Books_Categories` WRITE;

UNLOCK TABLES;






