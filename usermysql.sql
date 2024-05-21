SELECT * FROM demo.employee11;CREATE TABLE `employee11` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `Department` varchar(50) DEFAULT NULL,
  `HireDate` varchar(15) DEFAULT NULL,
  `Salary` varchar(100) DEFAULT NULL,
  `Password` varchar(45) NOT NULL,
  `DOB` varchar(15) DEFAULT NULL,
  `Gender` varchar(6) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `About` varchar(200) DEFAULT NULL,
  `leaves` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


CREATE TABLE `dailywork` (
  `id` varchar(5) DEFAULT NULL,
  `work` varchar(500) DEFAULT NULL,
  `data` varchar(12) DEFAULT NULL,
  `day` varchar(12) DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  `empname` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


insert into employee11(FirstName,LastName,Email,PhoneNumber,Department,HireDate,Salary,Password,DOB,Gender,Address,About)values("Ramakanta","Gahan","ramakantagahan8458@outlook.com","7751975616",
"IT","15022024",EncryptStringWithoutKey("35500"),EncryptStringWithoutKey("Tiku@8458"),"30-05-1999","male","Odisha","I am a Software Developer at ICME-NCDIR")