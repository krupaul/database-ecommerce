CREATE DATABASE  IF NOT EXISTS `ecom` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ecom`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ecom
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `addressID` int NOT NULL,
  `flatno` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `zipcode` varchar(45) DEFAULT NULL,
  `buyerID` int DEFAULT NULL,
  PRIMARY KEY (`addressID`),
  UNIQUE KEY `addressID_UNIQUE` (`addressID`),
  KEY `buyerID_idx` (`buyerID`),
  CONSTRAINT `fk buyerID` FOREIGN KEY (`buyerID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (7001,'1','Sydney','E1F1',1001),(7002,'2','Halifax','C1D1',1002),(7003,'3','Toronto','E1F1',1003),(7004,'4','Montreal','G1H1',1004),(7005,'5','Vancover','I1J1',1001),(7006,'6','waterford','L1M1',1005),(7007,'7','glacebay','N1O1',1006);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buyerorder`
--

DROP TABLE IF EXISTS `buyerorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buyerorder` (
  `orderID` int NOT NULL,
  `buyerID` int DEFAULT NULL,
  `orderdate` date DEFAULT NULL,
  `orderamount` int DEFAULT NULL,
  `addressID` int DEFAULT NULL,
  PRIMARY KEY (`orderID`),
  UNIQUE KEY `orderID_UNIQUE` (`orderID`),
  KEY `userID_idx` (`buyerID`),
  KEY `addressID_idx` (`addressID`),
  CONSTRAINT `addressID` FOREIGN KEY (`addressID`) REFERENCES `address` (`addressID`),
  CONSTRAINT `userid` FOREIGN KEY (`buyerID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyerorder`
--

LOCK TABLES `buyerorder` WRITE;
/*!40000 ALTER TABLE `buyerorder` DISABLE KEYS */;
INSERT INTO `buyerorder` VALUES (2001,1001,'2022-01-01',2000,7001),(2002,1002,'2022-02-02',1500,7002),(2003,1003,'2022-03-03',1000,7003),(2004,1001,'2022-04-04',2000,7005),(2005,1002,'2022-05-05',1500,7002),(2006,1003,'2022-06-06',1000,7003),(2007,1006,'2022-07-07',500,7007);
/*!40000 ALTER TABLE `buyerorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `eventID` int NOT NULL AUTO_INCREMENT,
  `returnID` int DEFAULT NULL,
  `buyerID` int DEFAULT NULL,
  `itemcondition` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`eventID`),
  UNIQUE KEY `eventID_UNIQUE` (`eventID`),
  KEY `returnID_idx` (`returnID`),
  CONSTRAINT `returnID` FOREIGN KEY (`returnID`) REFERENCES `returnproduct` (`returnID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (6121,4001,1003,'bad'),(6122,4002,1003,'bad'),(6123,4003,1001,'bad'),(6124,4005,1002,'bad'),(6125,4006,1003,'bad'),(6126,4007,1002,'bad'),(6127,4008,1001,'bad');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `productID` int NOT NULL,
  `productname` varchar(45) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `orderID` int DEFAULT NULL,
  `sellerID` int DEFAULT NULL,
  PRIMARY KEY (`productID`),
  UNIQUE KEY `idproduct_UNIQUE` (`productID`),
  KEY `orderID_idx` (`orderID`),
  KEY `sellerID_idx` (`sellerID`),
  CONSTRAINT `orderID` FOREIGN KEY (`orderID`) REFERENCES `buyerorder` (`orderID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sellerID` FOREIGN KEY (`sellerID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (3001,'Apple Macbook',2000,2001,1004),(3002,'Asus g15',1500,2002,1004),(3003,'Lenova ideapad',1000,2003,1004),(3004,'Apple Macbook',2000,2003,1005),(3005,'Asus g15',1500,2004,1004),(3006,'Lenova ideapad',1000,2005,1004),(3007,'Apple Macbook',2000,2006,1005),(3008,'Asus g15',1500,2006,1005),(3009,'Asus g15',1500,2007,1005);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `query1`
--

DROP TABLE IF EXISTS `query1`;
/*!50001 DROP VIEW IF EXISTS `query1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `query1` AS SELECT 
 1 AS `name`,
 1 AS `productname`,
 1 AS `itemcondition`,
 1 AS `zipcode`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `query2`
--

DROP TABLE IF EXISTS `query2`;
/*!50001 DROP VIEW IF EXISTS `query2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `query2` AS SELECT 
 1 AS `productname`,
 1 AS `refunddate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `query3`
--

DROP TABLE IF EXISTS `query3`;
/*!50001 DROP VIEW IF EXISTS `query3`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `query3` AS SELECT 
 1 AS `buyerID`,
 1 AS `name`,
 1 AS `risktype`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `refund`
--

DROP TABLE IF EXISTS `refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refund` (
  `refundID` int NOT NULL,
  `returnID` int DEFAULT NULL,
  `refunddate` date DEFAULT NULL,
  `refundamount` int DEFAULT NULL,
  `buyerID` int DEFAULT NULL,
  PRIMARY KEY (`refundID`),
  UNIQUE KEY `refundID_UNIQUE` (`refundID`),
  KEY `userID_idx` (`buyerID`),
  KEY `returnproductID_idx` (`returnID`),
  CONSTRAINT `customerID` FOREIGN KEY (`buyerID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `returnproductID` FOREIGN KEY (`returnID`) REFERENCES `returnproduct` (`returnID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund`
--

LOCK TABLES `refund` WRITE;
/*!40000 ALTER TABLE `refund` DISABLE KEYS */;
INSERT INTO `refund` VALUES (5001,4001,'2022-04-04',1000,1003),(5002,4002,'2022-05-05',2000,1003),(5003,4003,'2022-06-06',1500,1001),(5004,4004,'2022-07-07',1000,1002),(5005,4005,'2022-08-08',1500,1002),(5006,4006,'2022-09-09',1500,1003),(5007,4007,'2022-10-10',1000,1002),(5008,4008,'2022-11-11',2000,1001);
/*!40000 ALTER TABLE `refund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `returnproduct`
--

DROP TABLE IF EXISTS `returnproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `returnproduct` (
  `returnID` int NOT NULL,
  `buyerID` int DEFAULT NULL,
  `itemcondition` varchar(45) DEFAULT NULL,
  `productID` int DEFAULT NULL,
  PRIMARY KEY (`returnID`),
  UNIQUE KEY `returnID_UNIQUE` (`returnID`),
  KEY `userID_idx` (`buyerID`),
  KEY `productID_idx` (`productID`),
  CONSTRAINT `buyerID` FOREIGN KEY (`buyerID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `productID` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `returnproduct`
--

LOCK TABLES `returnproduct` WRITE;
/*!40000 ALTER TABLE `returnproduct` DISABLE KEYS */;
INSERT INTO `returnproduct` VALUES (4001,1003,'bad',3003),(4002,1003,'bad',3004),(4003,1001,'bad',3005),(4004,1002,'good',3006),(4005,1002,'bad',3002),(4006,1003,'bad',3008),(4007,1002,'bad',3006),(4008,1001,'bad',3001);
/*!40000 ALTER TABLE `returnproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risk`
--

DROP TABLE IF EXISTS `risk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `risk` (
  `riskID` int NOT NULL AUTO_INCREMENT,
  `eventID` int DEFAULT NULL,
  `risktype` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`riskID`),
  UNIQUE KEY `riskID_UNIQUE` (`riskID`),
  KEY `eventID_idx` (`eventID`),
  CONSTRAINT `eventID` FOREIGN KEY (`eventID`) REFERENCES `event` (`eventID`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risk`
--

LOCK TABLES `risk` WRITE;
/*!40000 ALTER TABLE `risk` DISABLE KEYS */;
INSERT INTO `risk` VALUES (134,6121,'high risk'),(135,6122,'high risk'),(136,6123,'high risk'),(137,6124,'high risk'),(138,6125,'high risk'),(139,6126,'high risk'),(140,6127,'high risk');
/*!40000 ALTER TABLE `risk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userID` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `isbuyer` int DEFAULT NULL,
  `isseller` int DEFAULT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `userID_UNIQUE` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1001,'Krupaul','krupaul@gmail.com','7382769603','7382769603',6,NULL),(1002,'Sai','vsk@gmail.com','9029029020','9029029020',6,5),(1003,'Animon','koshy@gmail.com','9022099020','9022099020',6,5),(1004,'Vishnu','Vishnu@gmail.com','9020920920','9020920920',6,5),(1005,'Raghav','raghav@gmail.com','4312378907','4312378907',NULL,5),(1006,'Sandeep','sunny@gmail.com','9020290929','9020290929',6,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `query1`
--

/*!50001 DROP VIEW IF EXISTS `query1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `query1` AS select `u`.`name` AS `name`,`p`.`productname` AS `productname`,`r`.`itemcondition` AS `itemcondition`,`a`.`zipcode` AS `zipcode` from (((`user` `u` join `returnproduct` `r` on((`u`.`userID` = `r`.`buyerID`))) join `product` `p` on((`p`.`productID` = `r`.`productID`))) join `address` `a` on((`a`.`buyerID` = `u`.`userID`))) where ((`r`.`itemcondition` like 'bad') and (`a`.`zipcode` = 'E1F1')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `query2`
--

/*!50001 DROP VIEW IF EXISTS `query2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `query2` AS select `p`.`productname` AS `productname`,`f`.`refunddate` AS `refunddate` from ((`product` `p` join `returnproduct` `r` on((`p`.`productID` = `r`.`productID`))) join `refund` `f` on((`f`.`returnID` = `r`.`returnID`))) where (`f`.`refunddate` between '2022-06-01' and '2022-08-31') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `query3`
--

/*!50001 DROP VIEW IF EXISTS `query3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `query3` AS select `r`.`buyerID` AS `buyerID`,`u`.`name` AS `name`,`i`.`risktype` AS `risktype` from (((`event` `e` join `risk` `i` on((`i`.`eventID` = `e`.`eventID`))) join `returnproduct` `r` on((`r`.`returnID` = `e`.`returnID`))) join `user` `u` on((`r`.`buyerID` = `u`.`userID`))) group by `r`.`buyerID` having (count(`r`.`buyerID`) >= 3) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-23 20:57:06
