-- MySQL dump 10.13  Distrib 8.0.40, for macos14 (arm64)
--
-- Host: 127.0.0.1    Database: fashion_bi
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `clothing_categories`
--

DROP TABLE IF EXISTS `clothing_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clothing_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL,
  `base_price` decimal(10,2) NOT NULL,
  `production_quantity` int NOT NULL DEFAULT '1000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clothing_categories`
--

LOCK TABLES `clothing_categories` WRITE;
/*!40000 ALTER TABLE `clothing_categories` DISABLE KEYS */;
INSERT INTO `clothing_categories` VALUES (1,'Socks',9.99,1000),(2,'Hats',19.99,1000),(3,'Coats',89.99,1000),(4,'T-Shirts',29.99,1000),(5,'Pants',59.99,1000);
/*!40000 ALTER TABLE `clothing_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DateDim`
--

DROP TABLE IF EXISTS `DateDim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DateDim` (
  `DateID` int NOT NULL AUTO_INCREMENT,
  `Year` int DEFAULT NULL,
  `Quarter` varchar(2) DEFAULT NULL,
  `Month` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`DateID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DateDim`
--

LOCK TABLES `DateDim` WRITE;
/*!40000 ALTER TABLE `DateDim` DISABLE KEYS */;
INSERT INTO `DateDim` VALUES (1,2023,'Q1','January'),(2,2023,'Q1','February'),(3,2023,'Q1','March'),(4,2023,'Q2','April'),(5,2023,'Q2','May'),(6,2023,'Q2','June'),(7,2023,'Q3','July'),(8,2023,'Q3','August'),(9,2023,'Q3','September'),(10,2023,'Q4','October'),(11,2023,'Q4','November'),(12,2023,'Q4','December'),(13,2022,'Q1','January'),(14,2022,'Q1','February'),(15,2022,'Q1','March'),(16,2022,'Q2','April'),(17,2022,'Q2','May'),(18,2022,'Q2','June'),(19,2022,'Q3','July'),(20,2022,'Q3','August'),(21,2022,'Q3','September'),(22,2022,'Q4','October'),(23,2022,'Q4','November'),(24,2022,'Q4','December');
/*!40000 ALTER TABLE `DateDim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rating` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,'good','2024-11-20 16:32:50'),(2,'good','2024-11-20 16:32:50'),(3,'good','2024-11-20 16:32:50'),(4,'good','2024-11-20 16:32:50'),(5,'good','2024-11-20 16:32:50'),(6,'good','2024-11-20 16:32:50'),(7,'good','2024-11-20 16:32:50'),(8,'good','2024-11-20 16:32:50'),(9,'good','2024-11-20 16:32:50'),(10,'good','2024-11-20 16:32:50'),(11,'medium','2024-11-20 16:32:50'),(12,'medium','2024-11-20 16:32:50'),(13,'medium','2024-11-20 16:32:50'),(14,'medium','2024-11-20 16:32:50'),(15,'medium','2024-11-20 16:32:50'),(16,'medium','2024-11-20 16:32:50'),(17,'medium','2024-11-20 16:32:50'),(18,'medium','2024-11-20 16:32:50'),(19,'medium','2024-11-20 16:32:50'),(20,'medium','2024-11-20 16:32:50'),(21,'bad','2024-11-20 16:32:50'),(22,'bad','2024-11-20 16:32:50'),(23,'bad','2024-11-20 16:32:50'),(24,'bad','2024-11-20 16:32:50'),(25,'bad','2024-11-20 16:32:50'),(26,'good','2024-11-20 16:32:50'),(27,'good','2024-11-20 16:32:50'),(28,'good','2024-11-20 16:32:50'),(29,'good','2024-11-20 16:32:50'),(30,'good','2024-11-20 16:32:50'),(31,'medium','2024-11-20 16:32:50'),(32,'medium','2024-11-20 16:32:50'),(33,'medium','2024-11-20 16:32:50'),(34,'medium','2024-11-20 16:32:50'),(35,'medium','2024-11-20 16:32:50'),(36,'bad','2024-11-20 16:32:50'),(37,'bad','2024-11-20 16:32:50'),(38,'bad','2024-11-20 16:32:50'),(39,'bad','2024-11-20 16:32:50'),(40,'bad','2024-11-20 16:32:50'),(41,'good','2024-11-20 16:32:50'),(42,'good','2024-11-20 16:32:50'),(43,'good','2024-11-20 16:32:50'),(44,'good','2024-11-20 16:32:50'),(45,'good','2024-11-20 16:32:50'),(46,'medium','2024-11-20 16:32:50'),(47,'medium','2024-11-20 16:32:50'),(48,'medium','2024-11-20 16:32:50'),(49,'good','2024-11-20 16:32:50'),(50,'good','2024-11-20 16:32:50'),(51,'bad','2024-11-20 16:32:50'),(52,'bad','2024-11-20 16:32:50'),(53,'medium','2024-11-20 16:32:50'),(54,'medium','2024-11-20 16:32:50'),(55,'good','2024-11-20 16:32:50'),(56,'good','2024-11-20 16:32:55'),(57,'good','2024-11-20 16:32:55'),(58,'good','2024-11-20 16:32:55'),(59,'good','2024-11-20 16:32:55'),(60,'good','2024-11-20 16:32:55'),(61,'good','2024-11-20 16:32:55'),(62,'good','2024-11-20 16:32:55'),(63,'good','2024-11-20 16:32:55'),(64,'good','2024-11-20 16:32:55'),(65,'good','2024-11-20 16:32:55'),(66,'medium','2024-11-20 16:32:55'),(67,'medium','2024-11-20 16:32:55'),(68,'medium','2024-11-20 16:32:55'),(69,'medium','2024-11-20 16:32:55'),(70,'medium','2024-11-20 16:32:55'),(71,'medium','2024-11-20 16:32:55'),(72,'medium','2024-11-20 16:32:55'),(73,'medium','2024-11-20 16:32:55'),(74,'medium','2024-11-20 16:32:55'),(75,'medium','2024-11-20 16:32:55'),(76,'bad','2024-11-20 16:32:55'),(77,'bad','2024-11-20 16:32:55'),(78,'bad','2024-11-20 16:32:55'),(79,'bad','2024-11-20 16:32:55'),(80,'bad','2024-11-20 16:32:55'),(81,'good','2024-11-20 16:32:55'),(82,'good','2024-11-20 16:32:55'),(83,'good','2024-11-20 16:32:55'),(84,'good','2024-11-20 16:32:55'),(85,'good','2024-11-20 16:32:55'),(86,'medium','2024-11-20 16:32:55'),(87,'medium','2024-11-20 16:32:55'),(88,'medium','2024-11-20 16:32:55'),(89,'medium','2024-11-20 16:32:55'),(90,'medium','2024-11-20 16:32:55'),(91,'bad','2024-11-20 16:32:55'),(92,'bad','2024-11-20 16:32:55'),(93,'bad','2024-11-20 16:32:55'),(94,'bad','2024-11-20 16:32:55'),(95,'bad','2024-11-20 16:32:55'),(96,'good','2024-11-20 16:32:55'),(97,'good','2024-11-20 16:32:55'),(98,'good','2024-11-20 16:32:55'),(99,'good','2024-11-20 16:32:55'),(100,'good','2024-11-20 16:32:55'),(101,'medium','2024-11-20 16:32:55'),(102,'medium','2024-11-20 16:32:55'),(103,'medium','2024-11-20 16:32:55'),(104,'good','2024-11-20 16:32:55'),(105,'good','2024-11-20 16:32:55'),(106,'bad','2024-11-20 16:32:55'),(107,'bad','2024-11-20 16:32:55'),(108,'medium','2024-11-20 16:32:55'),(109,'medium','2024-11-20 16:32:55'),(110,'good','2024-11-20 16:32:55');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HistoricalSales`
--

DROP TABLE IF EXISTS `HistoricalSales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HistoricalSales` (
  `HistoricalID` int NOT NULL AUTO_INCREMENT,
  `ProductID` int DEFAULT NULL,
  `RegionID` int DEFAULT NULL,
  `DateID` int DEFAULT NULL,
  `PY_SellingRevenue` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`HistoricalID`),
  KEY `ProductID` (`ProductID`),
  KEY `RegionID` (`RegionID`),
  KEY `DateID` (`DateID`),
  CONSTRAINT `historicalsales_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`),
  CONSTRAINT `historicalsales_ibfk_2` FOREIGN KEY (`RegionID`) REFERENCES `Region` (`RegionID`),
  CONSTRAINT `historicalsales_ibfk_3` FOREIGN KEY (`DateID`) REFERENCES `DateDim` (`DateID`)
) ENGINE=InnoDB AUTO_INCREMENT=337 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HistoricalSales`
--

LOCK TABLES `HistoricalSales` WRITE;
/*!40000 ALTER TABLE `HistoricalSales` DISABLE KEYS */;
INSERT INTO `HistoricalSales` VALUES (1,3,2,20,11996.39),(2,9,5,14,20690.73),(3,5,7,21,20473.70),(4,6,6,22,19885.98),(5,8,4,14,39360.01),(6,9,8,21,21087.83),(7,4,2,19,43456.81),(8,7,1,24,17101.40),(9,4,5,15,34772.57),(10,3,8,18,38244.39),(11,4,7,16,31022.93),(12,4,2,22,28917.76),(13,5,1,14,28026.85),(14,9,8,19,34402.48),(15,7,8,19,21188.74),(16,1,2,23,49280.68),(17,1,7,15,46698.29),(18,10,9,19,18628.36),(19,10,5,18,43032.69),(20,6,1,24,39959.51),(21,10,2,15,9039.20),(22,2,2,15,44108.75),(23,4,9,13,9086.33),(24,6,1,17,13353.09),(25,10,4,24,1906.59),(26,10,6,13,6194.04),(27,4,3,19,5359.98),(28,6,7,15,48164.13),(29,10,6,14,4614.68),(30,10,6,20,37552.40),(31,5,7,22,34527.38),(32,3,10,14,22009.14),(33,8,2,21,15292.10),(34,3,10,15,46996.33),(35,1,10,23,13931.27),(36,2,10,15,29623.23),(37,5,8,22,36754.00),(38,8,7,16,41148.93),(39,1,7,15,25110.49),(40,8,6,22,34954.98),(41,8,10,22,36976.24),(42,7,9,21,29541.52),(43,10,8,15,40442.13),(44,10,2,15,20580.81),(45,3,10,16,37309.07),(46,6,9,19,13528.50),(47,8,10,22,13001.78),(48,10,10,24,29777.53),(49,3,9,18,22327.04),(50,10,10,21,16944.85),(51,3,7,22,1630.75),(52,10,10,23,35776.38),(53,4,5,18,39102.59),(54,4,7,22,11329.26),(55,3,5,18,6104.98),(56,10,5,22,16867.64),(57,8,4,19,5902.44),(58,9,3,21,13190.87),(59,4,4,22,44273.13),(60,3,4,23,13379.44),(61,6,5,14,34590.03),(62,8,10,14,46569.01),(63,6,3,23,31855.01),(64,5,9,16,4681.05),(65,5,2,17,44978.78),(66,3,7,16,36375.54),(67,3,6,18,43687.62),(68,10,5,16,47062.94),(69,8,3,24,42247.71),(70,1,3,15,45679.50),(71,2,8,18,41022.12),(72,10,7,19,33609.88),(73,6,3,14,37887.89),(74,6,8,14,34123.48),(75,10,10,14,8533.02),(76,1,9,22,17122.84),(77,9,5,13,28073.42),(78,1,5,21,32382.59),(79,2,7,17,25004.39),(80,6,5,16,3205.59),(81,2,6,20,24528.06),(82,1,9,22,2888.84),(83,1,10,17,29909.65),(84,1,3,17,9175.74),(85,4,1,20,30730.89),(86,2,5,19,38982.78),(87,8,6,17,10650.00),(88,4,9,23,19269.31),(89,10,8,20,22080.45),(90,10,4,17,49205.42),(91,8,8,15,34712.19),(92,2,5,13,44738.89),(93,6,10,24,25117.47),(94,5,8,20,34904.85),(95,5,6,21,19062.37),(96,9,6,22,48519.48),(97,10,4,22,26346.47),(98,8,3,19,41422.96),(99,10,6,18,47211.16),(100,5,3,20,1706.78),(101,3,9,14,15499.04),(102,1,7,20,7208.31),(103,10,6,13,39514.36),(104,3,7,18,33240.99),(105,5,10,19,34746.05),(106,3,7,15,40961.72),(107,9,2,16,42020.09),(108,5,4,14,6367.23),(109,4,5,18,17006.01),(110,8,3,16,17297.12),(111,10,7,22,44030.59),(112,4,8,17,10243.66),(113,9,1,23,17826.61),(114,4,2,14,36145.33),(115,6,6,17,7405.24),(116,2,8,13,3820.89),(117,1,4,17,18076.24),(118,1,10,17,38842.08),(119,2,4,14,40590.38),(120,5,6,14,43935.78),(121,2,5,16,30508.74),(122,8,2,20,4803.07),(123,6,1,15,12623.06),(124,9,1,20,16912.23),(125,2,6,21,13854.57),(126,5,2,22,43776.12),(127,6,8,22,22521.02),(128,8,2,20,25739.27),(129,6,8,22,23633.38),(130,6,1,24,11452.93),(131,9,7,20,40940.87),(132,9,9,21,2229.04),(133,7,7,22,43606.12),(134,4,6,22,9245.64),(135,4,10,20,28535.37),(136,6,3,19,13514.98),(137,7,4,21,41692.96),(138,9,7,15,11549.11),(139,5,7,24,28708.67),(140,1,8,20,27083.70),(141,4,8,22,2555.21),(142,1,9,20,25858.50),(143,9,9,15,33257.33),(144,6,6,16,28388.85),(145,3,10,21,18600.59),(146,7,4,14,28562.63),(147,10,2,17,37682.07),(148,10,10,15,34192.08),(149,5,5,21,2729.59),(150,10,4,24,42915.01),(151,5,4,14,46878.72),(152,9,1,17,10620.00),(153,9,5,22,43591.82),(154,4,2,20,7278.80),(155,10,6,18,34634.67),(156,2,5,14,46216.04),(157,2,9,17,35369.67),(158,2,6,20,12702.87),(159,9,4,17,1306.06),(160,4,4,15,5048.21),(161,6,4,21,12254.30),(162,7,3,19,18659.07),(163,3,3,24,30941.72),(164,4,10,19,20991.15),(165,9,6,14,47952.37),(166,10,6,17,49136.05),(167,3,2,20,11996.39),(168,9,5,14,20690.73),(169,5,7,21,20473.70),(170,6,6,22,19885.98),(171,8,4,14,39360.01),(172,9,8,21,21087.83),(173,4,2,19,43456.81),(174,7,1,24,17101.40),(175,4,5,15,34772.57),(176,1,5,15,15860.22),(177,9,9,16,34837.82),(178,7,1,19,13807.67),(179,1,10,20,31950.35),(180,8,3,23,42150.41),(181,1,2,23,49280.68),(182,6,10,13,42142.95),(183,8,6,20,35934.59),(184,2,1,20,4324.90),(185,3,6,23,45164.39),(186,10,5,18,43032.69),(187,6,1,24,39959.51),(188,6,2,23,24220.07),(189,8,8,20,27315.02),(190,9,2,13,20458.13),(191,9,2,16,31536.68),(192,4,3,19,5359.98),(193,6,7,15,48164.13),(194,10,6,20,37552.40),(195,8,2,21,15292.10),(196,6,4,19,41248.77),(197,5,7,22,36988.01),(198,10,7,15,29076.97),(199,3,10,15,46996.33),(200,5,8,22,36754.00),(201,7,9,21,29541.52),(202,10,8,15,40442.13),(203,1,1,13,40960.61),(204,9,6,18,7266.53),(205,5,5,14,26161.98),(206,6,9,19,13528.50),(207,8,10,22,13001.78),(208,10,10,24,29777.53),(209,3,9,18,22327.04),(210,10,10,21,16944.85),(211,4,7,23,5388.19),(212,6,3,23,12560.83),(213,2,10,18,32944.51),(214,2,4,17,19683.69),(215,4,6,22,20368.55),(216,3,8,21,44723.76),(217,3,4,23,13379.44),(218,8,6,16,33047.87),(219,5,4,16,7664.42),(220,6,5,14,34590.03),(221,3,4,23,21984.60),(222,10,4,14,41262.73),(223,7,2,20,38971.02),(224,7,6,15,48515.75),(225,7,4,14,25596.30),(226,10,2,21,1644.88),(227,2,6,21,30910.93),(228,7,10,24,12041.29),(229,3,7,16,36375.54),(230,3,5,20,40351.65),(231,7,9,20,34033.89),(232,6,5,22,34919.99),(233,8,3,17,21655.72),(234,1,10,21,19925.07),(235,1,5,23,46805.51),(236,10,1,23,37182.16),(237,1,1,19,43478.38),(238,2,3,13,6892.72),(239,6,3,14,37887.89),(240,6,8,14,34123.48),(241,10,10,14,8533.02),(242,1,9,22,17122.84),(243,9,5,13,28073.42),(244,9,4,18,2165.71),(245,3,9,13,37978.65),(246,9,10,23,48764.06),(247,1,8,21,38266.18),(248,6,5,16,3205.59),(249,9,8,17,3689.67),(250,9,5,14,20690.73),(251,5,7,21,20473.70),(252,6,6,22,19885.98),(253,8,4,14,39360.01),(254,9,8,21,21087.83),(255,4,2,19,43456.81),(256,7,1,24,17101.40),(257,4,5,15,34772.57),(258,1,5,15,15860.22),(259,9,9,16,34837.82),(260,5,8,22,31127.56),(261,7,4,16,46542.49),(262,3,8,18,38244.39),(263,4,7,16,31022.93),(264,4,2,22,28917.76),(265,5,1,14,28026.85),(266,9,8,19,34402.48),(267,7,8,19,21188.74),(268,3,6,23,45164.39),(269,5,2,21,8117.34),(270,10,2,15,9039.20),(271,2,2,15,44108.75),(272,4,9,13,9086.33),(273,6,1,17,13353.09),(274,5,10,22,25524.75),(275,6,1,21,33473.35),(276,6,7,15,48164.13),(277,8,4,19,21331.13),(278,7,4,15,48871.35),(279,5,7,22,34527.38),(280,7,10,20,37287.75),(281,6,4,20,11567.44),(282,6,4,19,41248.77),(283,5,7,22,36988.01),(284,5,3,17,3196.26),(285,10,8,15,40442.13),(286,1,1,13,40960.61),(287,3,10,20,13826.34),(288,10,2,15,20580.81),(289,3,10,16,37309.07),(290,9,6,18,7266.53),(291,5,5,14,26161.98),(292,6,9,19,13528.50),(293,3,7,22,1630.75),(294,2,4,17,19683.69),(295,9,4,16,39304.36),(296,9,7,24,39982.55),(297,3,5,18,6104.98),(298,10,5,22,16867.64),(299,8,4,19,5902.44),(300,9,3,21,13190.87),(301,4,4,22,44273.13),(302,3,4,23,13379.44),(303,8,6,16,33047.87),(304,10,2,24,32551.57),(305,6,3,23,31855.01),(306,7,6,15,48515.75),(307,7,4,14,25596.30),(308,10,10,24,29777.53),(309,3,9,18,22327.04),(310,10,10,21,16944.85),(311,4,7,23,5388.19),(312,6,3,23,12560.83),(313,3,7,22,1630.75),(314,10,10,23,35776.38),(315,1,3,16,30126.88),(316,2,10,18,32944.51),(317,4,5,18,39102.59),(318,10,5,23,39651.19),(319,2,10,21,15516.96),(320,1,9,19,19889.72),(321,4,6,22,20368.55),(322,3,8,21,44723.76),(323,9,7,24,39982.55),(324,3,5,18,6104.98),(325,10,5,22,16867.64),(326,8,4,19,5902.44),(327,5,4,16,7664.42),(328,5,5,14,11194.08),(329,10,2,24,32551.57),(330,5,9,16,4681.05),(331,5,2,17,44978.78),(332,7,2,20,38971.02),(333,10,2,21,1644.88),(334,5,4,22,1470.24),(335,3,3,22,33173.72),(336,2,6,21,30910.93);
/*!40000 ALTER TABLE `HistoricalSales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product` (
  `ProductID` int NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(100) DEFAULT NULL,
  `Category` varchar(100) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES (1,'Socks','Clothing',5.00),(2,'Hats','Clothing',15.00),(3,'Jackets','Clothing',60.00),(4,'T-Shirts','Clothing',20.00),(5,'Pants','Clothing',40.00),(6,'Scarves','Clothing',10.00),(7,'Gloves','Clothing',8.00),(8,'Sweaters','Clothing',50.00),(9,'Shorts','Clothing',25.00),(10,'Belts','Clothing',12.00);
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Region`
--

DROP TABLE IF EXISTS `Region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Region` (
  `RegionID` int NOT NULL AUTO_INCREMENT,
  `Country` varchar(100) DEFAULT NULL,
  `RegionName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`RegionID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Region`
--

LOCK TABLES `Region` WRITE;
/*!40000 ALTER TABLE `Region` DISABLE KEYS */;
INSERT INTO `Region` VALUES (1,'USA','North America'),(2,'Canada','North America'),(3,'UK','Europe'),(4,'Germany','Europe'),(5,'China','Asia'),(6,'Japan','Asia'),(7,'Australia','Oceania'),(8,'Brazil','South America'),(9,'South Africa','Africa'),(10,'India','Asia');
/*!40000 ALTER TABLE `Region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sales`
--

DROP TABLE IF EXISTS `Sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sales` (
  `SalesID` int NOT NULL AUTO_INCREMENT,
  `ProductID` int DEFAULT NULL,
  `RegionID` int DEFAULT NULL,
  `DateID` int DEFAULT NULL,
  `SellingRevenue` decimal(10,2) DEFAULT NULL,
  `SellingNumber` int DEFAULT NULL,
  `GrossMargin` decimal(10,2) DEFAULT NULL,
  `GrossProfitRate` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`SalesID`),
  KEY `ProductID` (`ProductID`),
  KEY `RegionID` (`RegionID`),
  KEY `DateID` (`DateID`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`),
  CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`RegionID`) REFERENCES `Region` (`RegionID`),
  CONSTRAINT `sales_ibfk_3` FOREIGN KEY (`DateID`) REFERENCES `DateDim` (`DateID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sales`
--

LOCK TABLES `Sales` WRITE;
/*!40000 ALTER TABLE `Sales` DISABLE KEYS */;
INSERT INTO `Sales` VALUES (1,1,1,1,5000.00,1000,2500.00,50.00),(2,2,2,2,7500.00,500,3750.00,50.00),(3,3,3,3,18000.00,300,9000.00,50.00),(4,4,4,4,24000.00,1200,12000.00,50.00),(5,5,5,5,38000.00,950,19000.00,50.00),(6,6,6,6,7800.00,780,3900.00,50.00),(7,7,7,7,5360.00,670,2680.00,50.00),(8,8,8,8,21500.00,430,10750.00,50.00),(9,9,9,9,20500.00,820,10250.00,50.00),(10,10,10,10,10800.00,900,5400.00,50.00);
/*!40000 ALTER TABLE `Sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_data`
--

DROP TABLE IF EXISTS `sales_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `category_id` int NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `country` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `sales_data_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `clothing_categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_data`
--

LOCK TABLES `sales_data` WRITE;
/*!40000 ALTER TABLE `sales_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'muji','123456');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-21  9:29:05