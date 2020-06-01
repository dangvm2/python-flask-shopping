CREATE DATABASE  IF NOT EXISTS `dbShopOnline` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `dbShopOnline`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: dbShopOnline
-- ------------------------------------------------------
-- Server version	5.7.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tblCategory`
--

DROP TABLE IF EXISTS `tblCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblCategory` (
  `CategoryCode` tinyint(1) unsigned NOT NULL,
  `CategoryName` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`CategoryCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblCategory`
--

LOCK TABLES `tblCategory` WRITE;
/*!40000 ALTER TABLE `tblCategory` DISABLE KEYS */;
INSERT INTO `tblCategory` VALUES (1,'Tất cả sản phẩm'),(2,'Sữa chua'),(3,'Bánh Flan'),(4,'Kim chi & dưa muối');
/*!40000 ALTER TABLE `tblCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblOrdersDetails`
--

DROP TABLE IF EXISTS `tblOrdersDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblOrdersDetails` (
  `id` bigint(20) NOT NULL,
  `LineNum` int(11) NOT NULL,
  `ItemCode` bigint(20) NOT NULL,
  `ItemName` varchar(200) CHARACTER SET utf8 NOT NULL,
  `Price` decimal(19,6) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `DiscountPrice` decimal(19,6) NOT NULL,
  `TotalPrice` decimal(19,6) NOT NULL,
  `ImgUrl` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `Description` varchar(300) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblOrdersDetails`
--

LOCK TABLES `tblOrdersDetails` WRITE;
/*!40000 ALTER TABLE `tblOrdersDetails` DISABLE KEYS */;
INSERT INTO `tblOrdersDetails` VALUES (1,0,3,'Kim chi cải thảo',120000.000000,2,0.000000,240000.000000,'../static/images/kimchi-1.jpg','Kim chi lên men kiểu Hàn Quốc, ăn kèm với bữa ăn hằng ngày giúp kích thích hệ tiêu hóa.'),(1,1,2,'Sữa chua lên men',6000.000000,1,0.000000,6000.000000,'../static/images/yogurt-1.jpg','Sản phẩm sữa chua lên men tự nhiên rất tốt cho hệ tiêu hóa, đặc biệt là trẻ nhỏ.'),(2,0,3,'Kim chi cải thảo',120000.000000,2,0.000000,240000.000000,'../static/images/kimchi-1.jpg','Kim chi lên men kiểu Hàn Quốc, ăn kèm với bữa ăn hằng ngày giúp kích thích hệ tiêu hóa.'),(2,1,2,'Sữa chua lên men',6000.000000,1,0.000000,6000.000000,'../static/images/yogurt-1.jpg','Sản phẩm sữa chua lên men tự nhiên rất tốt cho hệ tiêu hóa, đặc biệt là trẻ nhỏ.'),(3,0,3,'Kim chi cải thảo',120000.000000,5,0.000000,600000.000000,'../static/images/kimchi-1.jpg','Kim chi lên men kiểu Hàn Quốc, ăn kèm với bữa ăn hằng ngày giúp kích thích hệ tiêu hóa.'),(3,1,2,'Sữa chua lên men',6000.000000,1,0.000000,6000.000000,'../static/images/yogurt-1.jpg','Sản phẩm sữa chua lên men tự nhiên rất tốt cho hệ tiêu hóa, đặc biệt là trẻ nhỏ.'),(3,2,4,'Dưa muối',80000.000000,5,0.000000,400000.000000,'../static/images/duamuoi-1.jpg','Dưa muối ăn kèm với bữa ăn hằng ngày giúp kích thích hệ tiêu hóa.'),(3,3,5,'Dưa giá',80000.000000,3,0.000000,240000.000000,'../static/images/duagia-1.jpg','Dưa giá ăn kèm với bữa ăn hằng ngày giúp kích thích hệ tiêu hóa.'),(4,0,3,'Kim chi cải thảo',120000.000000,5,0.000000,600000.000000,'../static/images/kimchi-1.jpg','Kim chi lên men kiểu Hàn Quốc, ăn kèm với bữa ăn hằng ngày giúp kích thích hệ tiêu hóa.'),(5,0,3,'Kim chi cải thảo',120000.000000,5,0.000000,600000.000000,'../static/images/kimchi-1.jpg','Kim chi lên men kiểu Hàn Quốc, ăn kèm với bữa ăn hằng ngày giúp kích thích hệ tiêu hóa.'),(6,0,3,'Kim chi cải thảo',120000.000000,1,0.000000,120000.000000,'../static/images/kimchi-1.jpg','Kim chi lên men kiểu Hàn Quốc, ăn kèm với bữa ăn hằng ngày giúp kích thích hệ tiêu hóa.'),(6,1,2,'Sữa chua lên men',6000.000000,1,0.000000,6000.000000,'../static/images/yogurt-1.jpg','Sản phẩm sữa chua lên men tự nhiên rất tốt cho hệ tiêu hóa, đặc biệt là trẻ nhỏ.'),(7,0,3,'Kim chi cải thảo',120000.000000,1,0.000000,120000.000000,'../static/images/kimchi-1.jpg','Kim chi lên men kiểu Hàn Quốc, ăn kèm với bữa ăn hằng ngày giúp kích thích hệ tiêu hóa.'),(8,0,3,'Kim chi cải thảo',120000.000000,1,0.000000,120000.000000,'../static/images/kimchi-1.jpg','Kim chi lên men kiểu Hàn Quốc, ăn kèm với bữa ăn hằng ngày giúp kích thích hệ tiêu hóa.'),(9,0,3,'Kim chi cải thảo',120000.000000,1,0.000000,120000.000000,'../static/images/kimchi-1.jpg','Kim chi lên men kiểu Hàn Quốc, ăn kèm với bữa ăn hằng ngày giúp kích thích hệ tiêu hóa.'),(10,0,3,'Kim chi cải thảo',120000.000000,1,0.000000,120000.000000,'../static/images/kimchi-1.jpg','Kim chi lên men kiểu Hàn Quốc, ăn kèm với bữa ăn hằng ngày giúp kích thích hệ tiêu hóa.'),(11,0,4,'Dưa muối',80000.000000,1,0.000000,80000.000000,'../static/images/duamuoi-1.jpg','Dưa muối ăn kèm với bữa ăn hằng ngày giúp kích thích hệ tiêu hóa.'),(12,0,3,'Kim chi cải thảo',120000.000000,1,0.000000,120000.000000,'../static/images/kimchi-1.jpg','Kim chi lên men kiểu Hàn Quốc, ăn kèm với bữa ăn hằng ngày giúp kích thích hệ tiêu hóa.'),(13,0,2,'Sữa chua lên men',6000.000000,1,0.000000,6000.000000,'../static/images/yogurt-1.jpg','Sản phẩm sữa chua lên men tự nhiên rất tốt cho hệ tiêu hóa, đặc biệt là trẻ nhỏ.'),(14,0,3,'Kim chi cải thảo',120000.000000,1,0.000000,120000.000000,'../static/images/kimchi-1.jpg','Kim chi lên men kiểu Hàn Quốc, ăn kèm với bữa ăn hằng ngày giúp kích thích hệ tiêu hóa.'),(15,0,2,'Sữa chua lên men',6000.000000,8,0.000000,48000.000000,'../static/images/yogurt-1.jpg','Sản phẩm sữa chua lên men tự nhiên rất tốt cho hệ tiêu hóa, đặc biệt là trẻ nhỏ.'),(15,1,4,'Dưa muối',80000.000000,4,0.000000,80000.000000,'../static/images/duamuoi-1.jpg','Dưa muối ăn kèm với bữa ăn hằng ngày giúp kích thích hệ tiêu hóa.'),(16,0,1,'Bánh Flan',6000.000000,1,0.000000,6000.000000,'../static/images/flan-1.jpg','Sản phẩm bánh Flan chế biến từ sữa tươi và trứng gà mang đến lợi ích rất tốt cho sức khỏe.'),(17,0,2,'Sữa chua lên men',6000.000000,8,0.000000,48000.000000,'../static/images/yogurt-1.jpg','Sản phẩm sữa chua lên men tự nhiên rất tốt cho hệ tiêu hóa, đặc biệt là trẻ nhỏ.'),(18,0,2,'Sữa chua lên men',6000.000000,1,0.000000,6000.000000,'../static/images/yogurt-1.jpg','Sản phẩm sữa chua lên men tự nhiên rất tốt cho hệ tiêu hóa, đặc biệt là trẻ nhỏ.'),(19,0,2,'Sữa chua lên men',6000.000000,1,0.000000,6000.000000,'../static/images/yogurt-1.jpg','Sản phẩm sữa chua lên men tự nhiên rất tốt cho hệ tiêu hóa, đặc biệt là trẻ nhỏ.'),(20,0,1,'Bánh Flan',6000.000000,1,0.000000,6000.000000,'../static/images/flan-1.jpg','Sản phẩm bánh Flan chế biến từ sữa tươi và trứng gà mang đến lợi ích rất tốt cho sức khỏe.'),(21,0,1,'Bánh Flan',6000.000000,1,0.000000,6000.000000,'../static/images/flan-1.jpg','Sản phẩm bánh Flan chế biến từ sữa tươi và trứng gà mang đến lợi ích rất tốt cho sức khỏe.'),(22,0,1,'Bánh Flan',6000.000000,1,0.000000,6000.000000,'../static/images/flan-1.jpg','Sản phẩm bánh Flan chế biến từ sữa tươi và trứng gà mang đến lợi ích rất tốt cho sức khỏe.'),(23,0,3,'Kim chi cải thảo',120000.000000,1,0.000000,120000.000000,'../static/images/kimchi-1.jpg','Kim chi lên men kiểu Hàn Quốc, ăn kèm với bữa ăn hằng ngày giúp kích thích hệ tiêu hóa.'),(24,0,1,'Bánh Flan',6000.000000,1,0.000000,6000.000000,'../static/images/flan-1.jpg','Sản phẩm bánh Flan chế biến từ sữa tươi và trứng gà mang đến lợi ích rất tốt cho sức khỏe.'),(25,0,3,'Kim chi cải thảo',120000.000000,1,0.000000,120000.000000,'../static/images/kimchi-1.jpg','Kim chi lên men kiểu Hàn Quốc, ăn kèm với bữa ăn hằng ngày giúp kích thích hệ tiêu hóa.'),(26,0,3,'Kim chi cải thảo',120000.000000,1,0.000000,120000.000000,'../static/images/kimchi-1.jpg','Kim chi lên men kiểu Hàn Quốc, ăn kèm với bữa ăn hằng ngày giúp kích thích hệ tiêu hóa.'),(27,0,1,'Bánh Flan',6000.000000,1,0.000000,6000.000000,'../static/images/flan-1.jpg','Sản phẩm bánh Flan chế biến từ sữa tươi và trứng gà mang đến lợi ích rất tốt cho sức khỏe.');
/*!40000 ALTER TABLE `tblOrdersDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblOrdersHeader`
--

DROP TABLE IF EXISTS `tblOrdersHeader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblOrdersHeader` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `OrderStatus` char(1) NOT NULL,
  `CreateDateTime` datetime NOT NULL,
  `Address` varchar(250) CHARACTER SET utf8 NOT NULL,
  `CustomerName` varchar(250) CHARACTER SET utf8 NOT NULL,
  `CustomerPhone` varchar(20) CHARACTER SET utf8 NOT NULL,
  `Remark` varchar(250) CHARACTER SET utf8 NOT NULL,
  `TotalPrice` decimal(19,6) NOT NULL,
  `DiscountPrice` decimal(19,6) NOT NULL,
  `TotalFinalPrice` decimal(19,6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblOrdersHeader`
--

LOCK TABLES `tblOrdersHeader` WRITE;
/*!40000 ALTER TABLE `tblOrdersHeader` DISABLE KEYS */;
INSERT INTO `tblOrdersHeader` VALUES (1,'1','2019-08-21 14:06:39','abc','dang','09123','ko co',126000.000000,0.000000,246000.000000),(2,'1','2019-08-21 14:24:40','','','','',246000.000000,0.000000,246000.000000),(3,'1','2019-08-22 08:53:39','sad','ád','sad','',1246000.000000,0.000000,1246000.000000),(4,'1','2019-08-22 09:46:06','sad','sad','sad','',600000.000000,0.000000,600000.000000),(5,'1','2019-08-22 09:55:59','sadsadsadasd','asd','214214','',600000.000000,0.000000,600000.000000),(6,'1','2019-08-22 10:04:36','dsad','sadas','sadsa','',126000.000000,0.000000,126000.000000),(7,'1','2019-08-22 10:09:17','saf','sad','saf','',120000.000000,0.000000,120000.000000),(8,'1','2019-08-22 10:15:19','sad','sad','asd','',120000.000000,0.000000,120000.000000),(9,'1','2019-08-22 10:15:43','sd','sda','sad','',120000.000000,0.000000,120000.000000),(10,'1','2019-08-22 10:18:43','s','s','s','',120000.000000,0.000000,120000.000000),(11,'1','2019-08-22 10:20:36','sà','ád','à','',80000.000000,0.000000,80000.000000),(12,'1','2019-08-22 10:23:14','a','a','a','',120000.000000,0.000000,120000.000000),(13,'1','2019-08-22 10:23:42','a','a','a','',6000.000000,0.000000,6000.000000),(14,'1','2019-08-22 10:25:10','ád','a','d','',120000.000000,0.000000,120000.000000),(15,'1','2019-08-23 13:24:41','TAN BINH','abc','938844861','',128000.000000,0.000000,128000.000000),(16,'1','2019-08-23 13:26:42','TAN BINH','dang','938844861','',6000.000000,0.000000,6000.000000),(17,'1','2019-08-23 13:27:05','TAN BINH','sad','938844861','',48000.000000,0.000000,48000.000000),(18,'1','2019-08-23 13:29:28','TAN BINH','hdj','938844861','',6000.000000,0.000000,6000.000000),(19,'1','2019-08-23 13:29:53','As','sadas','as','',6000.000000,0.000000,6000.000000),(20,'1','2019-08-23 13:30:29','TAN BINH','jjd','938844861','',6000.000000,0.000000,6000.000000),(21,'1','2019-08-23 13:33:08','hfjfjd','jd','jd','',6000.000000,0.000000,6000.000000),(22,'1','2019-08-23 13:35:54','hd','hdjd','hd','',6000.000000,0.000000,6000.000000),(23,'1','2019-08-23 13:38:15','sad','sad','sad','',120000.000000,0.000000,120000.000000),(24,'1','2019-08-23 13:38:57','kf','kdk','kf','',6000.000000,0.000000,6000.000000),(25,'1','2019-08-23 13:44:34','saf','sad','saf','',120000.000000,0.000000,120000.000000),(26,'1','2019-08-23 13:45:08','sad','sad','sad','',120000.000000,0.000000,120000.000000),(27,'1','2019-08-23 13:46:11','ndnd','jdj','kdjj','',6000.000000,0.000000,6000.000000);
/*!40000 ALTER TABLE `tblOrdersHeader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblProducts`
--

DROP TABLE IF EXISTS `tblProducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblProducts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ItemName` varchar(200) CHARACTER SET utf8 NOT NULL,
  `Price` decimal(19,6) NOT NULL,
  `PriceAfterDiscount` decimal(19,6) DEFAULT NULL,
  `DiscountPercent` smallint(6) DEFAULT NULL,
  `UnitName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `StatusCode` varchar(10) DEFAULT NULL,
  `ImgUrl` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `Description` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `CategoryCode` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblProducts`
--

LOCK TABLES `tblProducts` WRITE;
/*!40000 ALTER TABLE `tblProducts` DISABLE KEYS */;
INSERT INTO `tblProducts` VALUES (1,'Bánh Flan',6000.000000,6000.000000,0,'hủ','1','../static/images/flan-1.jpg','Sản phẩm bánh Flan chế biến từ sữa tươi và trứng gà mang đến lợi ích rất tốt cho sức khỏe.',3),(2,'Sữa chua lên men',8000.000000,6000.000000,30,'hủ','1','../static/images/yogurt-1.jpg','Sản phẩm sữa chua lên men tự nhiên rất tốt cho hệ tiêu hóa, đặc biệt là trẻ nhỏ.',2),(3,'Kim chi cải thảo',120000.000000,120000.000000,0,'kg','1','../static/images/kimchi-1.jpg','Kim chi lên men kiểu Hàn Quốc, ăn kèm với bữa ăn hằng ngày giúp kích thích hệ tiêu hóa.',4),(4,'Dưa muối',80000.000000,80000.000000,0,'kg','1','../static/images/duamuoi-1.jpg','Dưa muối ăn kèm với bữa ăn hằng ngày giúp kích thích hệ tiêu hóa.',4),(5,'Dưa giá',100000.000000,80000.000000,20,'kg','1','../static/images/duagia-1.jpg','Dưa giá ăn kèm với bữa ăn hằng ngày giúp kích thích hệ tiêu hóa.',4);
/*!40000 ALTER TABLE `tblProducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblSubscribers`
--

DROP TABLE IF EXISTS `tblSubscribers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblSubscribers` (
  `Email` varchar(50) NOT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `Status` char(1) DEFAULT NULL,
  PRIMARY KEY (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblSubscribers`
--

LOCK TABLES `tblSubscribers` WRITE;
/*!40000 ALTER TABLE `tblSubscribers` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblSubscribers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'dbShopOnline'
--
/*!50003 DROP PROCEDURE IF EXISTS `spCreateOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`guestShopOnline`@`%` PROCEDURE `spCreateOrder`(
	json_header json
    , json_details json
)
BEGIN

	DECLARE `json_items` BIGINT UNSIGNED DEFAULT JSON_LENGTH(json_details);
    DECLARE `_index` BIGINT UNSIGNED DEFAULT 0;
    declare idAutoGen bigint;
    
	#header
   insert into tblOrdersHeader 
		(OrderStatus, CreateDateTime, Address, CustomerName, CustomerPhone, Remark, TotalPrice, DiscountPrice, TotalFinalPrice)
   select 
		json_extract(json_header, '$.OrderStatus')
        #, STR_TO_DATE(json_extract(@json_header, '$.CreateDateTime'),'%Y%m%d')
        , now()
        , JSON_UNQUOTE(json_extract(json_header, '$.Address'))
        , JSON_UNQUOTE(json_extract(json_header, '$.CustomerName'))
        , JSON_UNQUOTE(json_extract(json_header, '$.CustomerPhone'))
        , JSON_UNQUOTE(json_extract(json_header, '$.Remark'))
        , json_extract(json_header, '$.TotalPrice')
        , json_extract(json_header, '$.DiscountPrice')
        , json_extract(json_header, '$.TotalFinalPrice');
        
	set idAutoGen = LAST_INSERT_ID();
        
	#details
    WHILE `_index` < `json_items` DO
    
		INSERT INTO tblOrdersDetails 
			(id, LineNum, ItemCode, ItemName, Price, Quantity, DiscountPrice, TotalPrice, ImgUrl, Description)
		select 
			idAutoGen
            , JSON_EXTRACT(json_details, CONCAT('$[', `_index`, '].LineNum'))
            , JSON_EXTRACT(json_details, CONCAT('$[', `_index`, '].ItemCode'))
            , JSON_UNQUOTE(JSON_EXTRACT(json_details, CONCAT('$[', `_index`, '].ItemName')))
            , JSON_EXTRACT(json_details, CONCAT('$[', `_index`, '].Price'))
            , JSON_EXTRACT(json_details, CONCAT('$[', `_index`, '].Quantity'))
            , JSON_EXTRACT(json_details, CONCAT('$[', `_index`, '].DiscountPrice'))
            , JSON_EXTRACT(json_details, CONCAT('$[', `_index`, '].TotalPrice'))
            , JSON_UNQUOTE(JSON_EXTRACT(json_details, CONCAT('$[', `_index`, '].ImgUrl')))
            , JSON_UNQUOTE(JSON_EXTRACT(json_details, CONCAT('$[', `_index`, '].Description')));
        
		SET `_index` := `_index` + 1;
    END WHILE;
    
SELECT 1 AS result;
	
   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spCreateSubscriber` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`guestShopOnline`@`%` PROCEDURE `spCreateSubscriber`(
	CusEmail VARCHAR(50)
)
BEGIN


	declare checkExists bool;
	
    set checkExists = (select exists(select Email from tblSubscribers where Email = UPPER(CusEmail)));

	if checkExists = 1 then
		
        select 0 result, 'Email này đã được đăng ký theo dõi.';
        
	else 
    
		INSERT INTO `dbShopOnline`.`tblSubscribers`
			(
			`Email`,
			`CreateDate`,
			`Status`
			)
		value 
			(
			UPPER(CusEmail),
			now(),
			'1'
            );
            
		select 1 result, 'Bạn đã đăng ký theo dõi thành công!';
            
	end if;
/*
	if (select exists (select email from tblSubscribers where email = Email)) = 1 then
    
		select 0 result, 'Email này đã được đăng ký theo dõi.';
	
    else
    
		INSERT INTO `dbShopOnline`.`tblSubscribers`
			(
			`Email`,
			`CreateDate`,
			`Status`
			)
		value 
			(
			UPPER(Email),
			now(),
			'1'
            )
		from `dbShopOnline`.`tblSubscribers`;
		
		select 1 result, 'Bạn đã đăng ký theo dõi thành công!';
        
    end if;
    
*/
	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetAllProducts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`guestShopOnline`@`%` PROCEDURE `spGetAllProducts`()
BEGIN
   
   
	select id,
					`ItemName`,
					Round(`Price`,0) Price,
					Round(`PriceAfterDiscount`,0) PriceAfterDiscount,
					`DiscountPercent`,
					`UnitName`,
					`StatusCode`,
					`ImgUrl`,
					`Description` from tblProducts;
   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetProductDetail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`guestShopOnline`@`%` PROCEDURE `spGetProductDetail`(
	itemCode BIGINT
)
BEGIN

	SELECT 
		`ItemName`,
		`PriceAfterDiscount` AS Price,
		`UnitName`,
		`ImgUrl`,
		`Description`
	FROM `tblProducts` WHERE  id = itemCode AND StatusCode = 1;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSearchProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`guestShopOnline`@`%` PROCEDURE `spSearchProduct`(
	keyword nvarchar(200)
    , recordPerPage tinyint
    , categoryID tinyint
)
BEGIN

	SET @row_number = 1; 
    SET @countRow = 0;
    
	SELECT 
		/*(@row_number:=@row_number + 1) AS record,*/
        case when @countRow < recordPerPage then (@row_number) else (@row_number:=@row_number + 1) end PageIndex,
        case when @countRow < recordPerPage then @countRow:= @countRow + 1 else @countRow:= 1 end IndexInPage,
        
        `tblProducts`.`id`,
		`tblProducts`.`ItemName`,
		`tblProducts`.`Price`,
		`tblProducts`.`PriceAfterDiscount`,
		`tblProducts`.`DiscountPercent`,
		`tblProducts`.`UnitName`,
		`tblProducts`.`StatusCode`,
		`tblProducts`.`ImgUrl`,
		`tblProducts`.`Description`,
        `tblProducts`.`CategoryCode`
	FROM `dbShopOnline`.`tblProducts`
    where ItemName like CONCAT('%', keyword, '%')
    and (categoryID = 1 OR CategoryCode = categoryID);
    
    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetAllCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`guestShopOnline`@`%` PROCEDURE `sp_GetAllCategory`()
BEGIN
		select CategoryCode, CategoryName from `tblCategory`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-01 11:35:48
