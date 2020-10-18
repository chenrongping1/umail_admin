-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: newapp
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `banner`
--

DROP TABLE IF EXISTS `banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banner` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT '轮播图id',
  `title` varchar(50) NOT NULL COMMENT '轮播图标题',
  `img` varchar(255) NOT NULL COMMENT '轮播图图片地址',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='轮播图表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner`
--

LOCK TABLES `banner` WRITE;
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
INSERT INTO `banner` VALUES (1,'lun1','/uploads/banner/e5b58320-d20c-11ea-be39-212a38807521.jpg',1),(2,'lun2','/uploads/banner/e2deef60-d581-11ea-9a8a-2b73d33dd399.jpg',1),(3,'3','/uploads/banner/e72c5080-d581-11ea-9a8a-2b73d33dd399.jpg',1),(4,'4','/uploads/banner/ed3b85e0-d581-11ea-9a8a-2b73d33dd399.webp',1),(5,'5','/uploads/banner/f0d21a20-d581-11ea-9a8a-2b73d33dd399.webp',1),(6,'7','/uploads/banner/f4bcc1d0-d581-11ea-9a8a-2b73d33dd399.webp',1);
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '购物车主键',
  `uid` varchar(50) NOT NULL COMMENT '用户id',
  `goodsid` int NOT NULL COMMENT '商品编号',
  `num` tinyint NOT NULL COMMENT '数量',
  `status` tinyint(1) NOT NULL COMMENT '选中状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uid` (`uid`,`goodsid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='购物车表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (4,'df64e090-d641-11ea-9a11-358a1b0f30dc',8,1,1),(6,'df64e090-d641-11ea-9a11-358a1b0f30dc',7,1,1),(7,'df64e090-d641-11ea-9a11-358a1b0f30dc',15,1,1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT '分类编号',
  `pid` smallint unsigned NOT NULL COMMENT '上级分类编号',
  `catename` varchar(50) NOT NULL COMMENT '分类名称',
  `img` varchar(255) NOT NULL COMMENT '分类图片',
  `status` tinyint unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (12,0,'家用电器','null',1),(13,0,'数码','null',1),(14,0,'办公','null',1),(15,0,'服装','null',1),(16,0,'美妆','null',1),(17,0,'运动','null',1),(19,12,'电视','/uploads/category/a08f5140-d56d-11ea-9a8a-2b73d33dd399.jpg',1),(20,12,'空调','/uploads/category/c7050d10-d56d-11ea-9a8a-2b73d33dd399.jpg',1),(21,12,'洗衣机','/uploads/category/cc5c3d10-d56d-11ea-9a8a-2b73d33dd399.jpg',1),(22,12,'冰箱','/uploads/category/d151c510-d56d-11ea-9a8a-2b73d33dd399.jpg',1),(23,13,'数码相机','/uploads/category/f84dc7e0-d56d-11ea-9a8a-2b73d33dd399.jpg',1),(24,13,'耳机','/uploads/category/ff9ecc10-d56d-11ea-9a8a-2b73d33dd399.jpg',1),(25,12,'智能手环','/uploads/category/0739f8a0-d56e-11ea-9a8a-2b73d33dd399.jpg',1),(26,14,'笔记本','/uploads/category/267804a0-d56e-11ea-9a8a-2b73d33dd399.jpg',1),(27,14,'显示器','/uploads/category/2bc4ad50-d56e-11ea-9a8a-2b73d33dd399.jpg',1),(28,14,'投影仪','/uploads/category/351726d0-d56e-11ea-9a8a-2b73d33dd399.jpg',1),(29,14,'键盘','/uploads/category/0d9eee20-d579-11ea-9a8a-2b73d33dd399.jpg',1),(30,15,'女装','/uploads/category/3e94ce00-d579-11ea-9a8a-2b73d33dd399.jpg',1),(31,15,'男装','/uploads/category/46675e40-d579-11ea-9a8a-2b73d33dd399.jpg',1),(32,16,'护肤','/uploads/category/5ba52490-d579-11ea-9a8a-2b73d33dd399.jpg',1),(33,16,'彩妆','/uploads/category/6ca233f0-d579-11ea-9a8a-2b73d33dd399.jpg',1),(34,17,'室内运动','/uploads/category/8eee4340-d579-11ea-9a8a-2b73d33dd399.jpg',1),(35,17,'山地车','/uploads/category/9774ba30-d579-11ea-9a8a-2b73d33dd399.jpg',1);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '商品编号',
  `first_cateid` smallint unsigned NOT NULL COMMENT '一级分类编号',
  `second_cateid` smallint NOT NULL COMMENT '二级分类编号',
  `goodsname` varchar(100) NOT NULL COMMENT '商品名称',
  `price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `market_price` decimal(10,2) NOT NULL COMMENT '市场价格',
  `img` varchar(255) NOT NULL COMMENT '商品图片',
  `description` text COMMENT '商品描述',
  `specsid` int NOT NULL COMMENT '规格id',
  `specsattr` varchar(255) NOT NULL COMMENT '规则属性值',
  `isnew` tinyint(1) NOT NULL COMMENT '是否新品1是2不是',
  `ishot` tinyint(1) NOT NULL COMMENT '是否热卖1是2不是',
  `status` tinyint(1) NOT NULL COMMENT '状态1启用2禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (3,17,35,'菲斯顿山地自行车',338.00,668.00,'/uploads/311b5fc0-d57c-11ea-9a8a-2b73d33dd399.jpg','<p><img src=\"http://img13.360buyimg.com/imgzone/jfs/t1/148102/11/4210/931957/5f23c044Ed8e8702f/6868edae10041bc6.jpg\" style=\"max-width:100%;\"><img src=\"http://img30.360buyimg.com/popWareDetail/jfs/t1/141025/32/4060/181497/5f1f88b0Ec7d82ca6/426bfa0e53e1a5de.jpg\" style=\"max-width: 100%;\"><img src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1/98929/35/16784/334224/5e7ef809Edd41ab2c/1c9f0c6f05ae24b7.png\" style=\"max-width: 100%;\"><br></p>',31,'[\"黑红\",\"白红\",\"白蓝\"]',1,1,1),(4,17,34,'佑美跑步机',1999.00,2399.00,'/uploads/d53e1ca0-d57c-11ea-9a8a-2b73d33dd399.jpg','<p><img src=\"https://img30.360buyimg.com/sku/jfs/t1/145453/35/4133/80099/5f227603Ebad056e3/c9e1669be78bd88a.jpg\" style=\"max-width:100%;\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t1/119567/40/11726/142420/5f1bcbe3Ef8f85a2f/a7a90cab74bfba6d.jpg\" style=\"max-width: 100%;\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t1/148429/31/3559/772555/5f19600bE7f76d745/fb0af8a3284aa922.jpg\" style=\"max-width: 100%;\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t1/143694/5/3620/206184/5f19600aEb9ad3fa0/c0db4fedb3e23fc2.jpg\" style=\"max-width: 100%;\"><br></p>',30,'[\"生态\",\"彩屏\"]',1,1,1),(5,16,32,'美白祛斑霜',78.00,108.00,'/uploads/39b2f840-d57d-11ea-9a8a-2b73d33dd399.jpg','<p><img src=\"http://img30.360buyimg.com/popWareDetail/jfs/t1/120162/30/5735/146470/5ef563b1Ec0f88f25/919d66d3a44e2fce.gif\" style=\"max-width:100%;\"><img src=\"http://img30.360buyimg.com/popWareDetail/jfs/t1/122488/37/5634/259799/5ef563b1Ec3281e4b/5ee513da5999ffc1.gif\" style=\"max-width: 100%;\"><img src=\"http://img30.360buyimg.com/popWareDetail/jfs/t1/138835/26/1504/293678/5ef563b2Ee58dee92/9926be53649fae20.gif\" style=\"max-width: 100%;\"><img src=\"http://img30.360buyimg.com/popWareDetail/jfs/t1/108739/39/12960/110873/5e9d118bEa914ef2f/3216a5b187a2e993.jpg\" style=\"max-width: 100%;\"><br></p>',29,'[\"15L\",\"30L\",\"45L\"]',1,1,1),(6,16,33,'迷尚魅力',99.00,159.00,'/uploads/9efa3f10-d57d-11ea-9a8a-2b73d33dd399.jpg','<p><img src=\"http://img30.360buyimg.com/sku/jfs/t1/148725/30/2623/219917/5f083ca8Ea911c5d3/3886ae20f5cd6222.jpg\" style=\"max-width:100%;\"><br></p>',29,'[\"15L\",\"30L\",\"45L\"]',1,1,1),(7,15,30,'爱路丝女装',39.00,59.00,'/uploads/f7a3b1f0-d57d-11ea-9a8a-2b73d33dd399.jpg','<p><img src=\"http://img30.360buyimg.com/popWaterMark/jfs/t2086/30/2520420327/329583/bf2047f9/56e110fcN292b928a.jpg\" style=\"max-width:100%;\"><img src=\"http://img30.360buyimg.com/popWaterMark/jfs/t3856/262/2141761178/265359/a210341f/58a5341cN74fe6c31.jpg\" style=\"max-width: 100%;\"><img src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1/86201/39/16533/132434/5e7da625E3e86f5a5/dcc0a87a432a5cf9.jpg\" style=\"max-width: 100%;\"><br></p>',28,'[\"S\",\"M\",\"L\",\"XL\"]',1,1,1),(8,15,31,'雪豹秋日牛皮男装',368.00,468.00,'/uploads/35f389d0-d57e-11ea-9a8a-2b73d33dd399.jpg','<p><img src=\"http://img30.360buyimg.com/popWaterMark/jfs/t27652/150/148759023/308814/9f1f4c/5b878d5eN43aac7c7.jpg\" style=\"max-width:100%;\"><img src=\"https://img10.360buyimg.com/popWaterMark/jfs/t1/14572/33/2825/257382/5c21b77eEf7ee308d/f4128b9cda492a45.jpg\" style=\"max-width: 100%;\"><img src=\"http://img30.360buyimg.com/popWaterMark/jfs/t24790/162/1077740957/187355/2e973421/5b878d5eN9b5c0d5e.jpg\" style=\"max-width: 100%;\"><img src=\"http://img30.360buyimg.com/popWaterMark/jfs/t24403/343/2615799608/200505/a21b0d81/5b878d5eNc1c97acb.jpg\" style=\"max-width: 100%;\"><br></p>',28,'[\"M\",\"L\",\"XL\",\"XXL\"]',1,1,1),(9,14,26,'联想笔记本',3999.00,4999.00,'/uploads/a45411b0-d57e-11ea-9a8a-2b73d33dd399.jpg','<p><img src=\"https://img10.360buyimg.com/imgzone/jfs/t1/120960/28/6102/294771/5efea004Edca451c4/9b069147b86e8b04.jpg\" style=\"max-width:100%;\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t1/111385/4/11458/159734/5efea031Ee3c461ae/f20249db9b8bf79b.jpg\" style=\"max-width: 100%;\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t1/136316/11/6054/364348/5f27bbc0Ec1029e91/6ec4e9430f4f2fb7.jpg\" style=\"max-width: 100%;\"><br></p>',25,'[\"13.3\",\"14\",\"15.6\"]',1,1,1),(10,14,27,'AOC',599.00,699.00,'/uploads/e76ff090-d57e-11ea-9a8a-2b73d33dd399.jpg','<p><img src=\"http://img10.360buyimg.com/imgzone/jfs/t1/133553/35/4380/227689/5f117e5cEd605e6f9/13cb463d20c7be5a.jpg\" style=\"max-width:100%;\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t1/132166/2/5804/320839/5f2766b4E28abc1fc/704a39825919d9f6.jpg\" style=\"max-width: 100%;\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t1/127952/11/8287/399348/5f2766b5E4d0bdeee/596b519a18d5be2a.jpg\" style=\"max-width: 100%;\"><br></p>',26,'[\"23.8\",\"27\",\"34\"]',1,1,1),(11,14,28,'机米',3999.00,4999.00,'/uploads/406fc0d0-d57f-11ea-9a8a-2b73d33dd399.jpg','<p><img src=\"https://img30.360buyimg.com/jgsq-productsoa/jfs/t1/143994/1/4226/147096/5f23c022Ee9524512/5e7e7b3aaea2c20d.jpg\" style=\"max-width:100%;\"><img src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1/34063/10/4259/164431/5cb6c0e8E779ab7f5/fcd3ef9bbedfd5c3.jpg\" style=\"max-width: 100%;\"><img src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1/35182/35/1350/113592/5cb6c114E66256dab/192ce54b7c3b2c4c.jpg\" style=\"max-width: 100%;\"><img src=\"http://img30.360buyimg.com/popWaterMark/jfs/t27010/290/1358142770/166643/c25ebb5d/5bc6e6e9Nf20b545e.jpg\" style=\"max-width: 100%;\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t1/76101/24/9876/455275/5d7850f4Ed6a63d18/ae35fcd74e0d5513.jpg\" style=\"max-width: 100%;\"><br></p>',27,'[\"01X\",\"H3\",\"Z8X\"]',1,1,1),(12,14,29,'前行者',69.90,99.00,'/uploads/8ff0d770-d57f-11ea-9a8a-2b73d33dd399.jpg','<p><img src=\"https://img30.360buyimg.com/sku/jfs/t1/118213/6/12391/176709/5f0ec626Eec9c307d/b23c41b62d478ce3.jpg\" style=\"max-width:100%;\"><img src=\"http://img30.360buyimg.com/popWareDetail/jfs/t1/118722/15/11513/175214/5efd536cEb6c34323/ac04c767216d863e.jpg\" style=\"max-width: 100%;\"><img src=\"https://img10.360buyimg.com/popWaterMark/jfs/t1/2861/11/5846/369250/5ba0eabfE54659a83/c9eaf24688cfa1e5.jpg\" style=\"max-width: 100%;\"><img src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1/4571/10/4124/330765/5b9b7266E19b7f40e/2bcc4dd024905e33.jpg\" style=\"max-width: 100%;\"><br></p>',31,'[\"黑红\",\"黑蓝\",\"白红\",\"白蓝\"]',1,1,1),(13,13,23,'佳能',3990.00,4099.00,'/uploads/d9351900-d57f-11ea-9a8a-2b73d33dd399.jpg','<p><img src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1/57318/29/6386/103278/5d412e8aE6ffd1ccc/e4bd448155c20e58.jpg\" style=\"max-width:100%;\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t1/123898/38/4473/135311/5ee09eebEcce8312b/fe4675ed9980d53d.jpg\" style=\"max-width: 100%;\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t1/143013/1/380/81487/5ee09eeaE9878a68b/9a54183ebdb56fbb.jpg\" style=\"max-width: 100%;\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t1/119991/8/4708/121947/5ee09eeaE96a1b738/765265d957949454.jpg\" style=\"max-width: 100%;\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t1/134047/17/1931/74668/5ee09eeaE1f001a05/3210467993220400.jpg\" style=\"max-width: 100%;\"><br></p>',23,'[\"G3X\",\"G5X\",\"G5X mark\"]',1,1,1),(14,13,24,'蓝牙耳机',1099.00,1199.00,'/uploads/03835410-d580-11ea-9a8a-2b73d33dd399.jpg','<p><img src=\"https://img11.360buyimg.com/cms/jfs/t1/93267/10/5921/130567/5df0657fEcaa67e54/edbd3fca52bd6784.jpg\" style=\"max-width:100%;\"><img src=\"https://img12.360buyimg.com/cms/jfs/t1/87237/38/973/1713314/5db72bb8E3ef84ced/01587e901af36baf.png\" style=\"max-width: 100%;\"><img src=\"https://img12.360buyimg.com/cms/jfs/t1/87237/38/973/1713314/5db72bb8E3ef84ced/01587e901af36baf.png\" style=\"max-width: 100%;\"><br></p>',24,'[\"公开版\",\"care版\"]',1,1,1),(15,12,19,'vih超清4K电视',15999.00,17999.00,'/uploads/755b0150-d580-11ea-9a8a-2b73d33dd399.jpg','<p><img src=\"https://img10.360buyimg.com/imgzone/jfs/t1/140131/38/3245/799521/5f12a391Eb317a1ba/64e59c04031460b3.jpg\" style=\"max-width:100%;\"><img src=\"http://img11.360buyimg.com/imgzone/jfs/t1/106205/12/15577/166911/5e7316abEe56f9f16/d73d6d525ef6f252.jpg\" style=\"max-width: 100%;\"><img src=\"http://img12.360buyimg.com/imgzone/jfs/t1/99076/33/15378/87078/5e7316abE96074c18/097b1a62e3c2a936.jpg\" style=\"max-width: 100%;\"><br></p>',19,'[\"55E9F\",\"55E8D\",\"55E75F\",\"X55F\"]',1,1,1),(16,12,20,'云米',2999.00,3999.00,'/uploads/fd0d2a10-d580-11ea-9a8a-2b73d33dd399.jpg','<p><img src=\"https://img30.360buyimg.com/sku/jfs/t1/125895/34/8600/165795/5f27be51Ee0c93fe4/6974938ab049a0d8.jpg\" style=\"max-width:100%;\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t1/122772/16/7014/319315/5f0d587cE1329e5ca/969a4e1d39a81581.jpg\" style=\"max-width: 100%;\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t1/134193/36/4512/130477/5f0d587bEe88c0e0a/19589547f158dcd7.jpg\" style=\"max-width: 100%;\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t1/119428/25/10981/68642/5f0d587bEb460f611/0515a431c008c1da.jpg\" style=\"max-width: 100%;\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t1/118756/39/12274/252312/5f0d587eE59676ca5/51e99f774f69309e.jpg\" style=\"max-width: 100%;\"><br></p>',20,'[\"1匹\",\"1.5匹\"]',1,1,1),(17,12,21,'海尔',699.00,799.00,'/uploads/476c0360-d581-11ea-9a8a-2b73d33dd399.jpg','<p><img src=\"https://img30.360buyimg.com/sku/jfs/t1/147369/35/4219/169356/5f244a63E0337e27e/48008aa0d0688436.gif\" style=\"max-width:100%;\"><img src=\"https://img30.360buyimg.com/sku/jfs/t1/113053/25/13058/238788/5f18249fEf0a588a4/25606cc7df1b1c40.jpg\" style=\"max-width: 100%;\"><br></p>',21,'[\"10kg滚筒\",\"3.3KG滚轮\",\"10kg直驱洗\"]',1,1,1),(18,12,22,'海信冰箱',4999.00,5999.00,'/uploads/adcb70f0-d581-11ea-9a8a-2b73d33dd399.jpg','<p><img src=\"https://img30.360buyimg.com/sku/jfs/t1/116379/28/11827/91913/5f041019Eedb73cc0/c001d7af279dbf3b.jpg\" style=\"max-width:100%;\"><img src=\"https://img30.360buyimg.com/sku/jfs/t1/116379/28/11827/91913/5f041019Eedb73cc0/c001d7af279dbf3b.jpg\" style=\"max-width: 100%;\"><img src=\"https://img30.360buyimg.com/sku/jfs/t1/116379/28/11827/91913/5f041019Eedb73cc0/c001d7af279dbf3b.jpg\" style=\"max-width: 100%;\"><br></p>',22,'[\"510升\",\"480升\",\"328升\"]',1,1,1),(19,12,19,'红星王牌',2999.00,3299.00,'/uploads/d56804f0-d6ff-11ea-95a0-d90ce2a5635a.jpg','<p><img src=\"https://img.alicdn.com/imgextra/i2/2894485574/O1CN01U2n2s11r2wGFDG6uG_!!2894485574.jpg\" style=\"max-width:100%;\"><img src=\"https://img.alicdn.com/imgextra/i3/2894485574/O1CN01sCessa1r2wEiX3lC5_!!2894485574.jpg\" style=\"max-width: 100%;\"><img src=\"https://img.alicdn.com/imgextra/i3/2894485574/O1CN01sCessa1r2wEiX3lC5_!!2894485574.jpg\" style=\"max-width: 100%;\"><br></p>',19,'[\"55E9F\",\"55E8D\",\"55E75F\",\"X55F\"]',1,1,1),(20,12,19,'海信视听',559.00,669.00,'/uploads/0d248350-d700-11ea-95a0-d90ce2a5635a.png','<p><img src=\"https://img.alicdn.com/imgextra/i2/3337042766/O1CN01hCMzWz1WIs7SdU9R3_!!3337042766.jpg\" style=\"max-width:100%;\"><img src=\"https://img.alicdn.com/imgextra/i1/3337042766/O1CN01MwkRPs1WIs7U70yDx_!!3337042766.jpg\" style=\"max-width: 100%;\"><img src=\"https://img.alicdn.com/imgextra/i3/3337042766/O1CN01AIExoB1WIs7Uin1Zy_!!3337042766.jpg\" style=\"max-width: 100%;\"><img src=\"https://img.alicdn.com/imgextra/i3/3337042766/O1CN01IZDLHX1WIs7VlpKN5_!!3337042766.jpg\" style=\"max-width: 100%;\"><br></p>',19,'[\"55E9F\",\"55E8D\"]',1,1,1),(21,12,19,'aa',22.00,22.00,'/uploads/03a82750-0fae-11eb-b083-4d8017f192ac.jpg','<p>114</p>',19,'[\"55E9F\"]',1,1,1);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) NOT NULL COMMENT '用户编号',
  `phone` char(11) NOT NULL COMMENT '手机号',
  `nickname` varchar(50) NOT NULL COMMENT '昵称',
  `password` char(32) NOT NULL COMMENT '密码',
  `randstr` char(5) NOT NULL COMMENT '密码随机串',
  `addtime` char(13) NOT NULL COMMENT '注册时间',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (11,'bd1798c0-d641-11ea-9a11-358a1b0f30dc','1','1','68be6b439760e518a7982b55cfe6961b','7fExU','1596538842188',1),(12,'d66939a0-d641-11ea-9a11-358a1b0f30dc','2','2','aab734558ed376dbc1cf6df12a24e9fb','saBxc','1596538884666',1),(13,'df64e090-d641-11ea-9a11-358a1b0f30dc','123','123','e75e1458cc427c480fbf0c7301a79c2c','HCEWc','1596538899737',1),(14,'67f13da0-d6fb-11ea-95a0-d90ce2a5635a','','','12e21235bae564b57500b715aee15c2f','RgWvN','1596618585723',1),(15,'6ceb7930-d6fe-11ea-95a0-d90ce2a5635a','1234','1234','8707e10d1334b47e8103185c6480c48e','x8mOX','1596619882563',1),(16,'ebafbd00-d706-11ea-95a0-d90ce2a5635a','12345','12345','73c8cb3326c3e9ac62361130ab6f7c4f','fcpYQ','1596623531216',1);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单编号',
  `pid` smallint NOT NULL COMMENT '上级菜单编号',
  `title` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(100) NOT NULL COMMENT '菜单图标',
  `type` tinyint(1) NOT NULL COMMENT '菜单类型1目录2菜单',
  `url` varchar(100) NOT NULL COMMENT '菜单地址',
  `status` tinyint(1) NOT NULL COMMENT '菜单状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='后台菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (7,0,'系统设置','el-icon-setting',1,'',1),(8,7,'菜单管理','',2,'/menu',1),(9,7,'角色管理','',2,'/role',1),(10,7,'管理员管理','',2,'/manager',1),(11,0,'商城管理','el-icon-s-help',1,'',1),(12,11,'商品分类','',2,'/type',1),(13,11,'商品规格','',2,'/specs',1),(14,11,'商品管理','',2,'/product',1),(15,11,'会员管理','',2,'/member',1),(16,11,'轮播图管理','',2,'/banner',1),(17,11,'秒杀活动','',2,'/seckill',1);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `rolename` varchar(100) NOT NULL COMMENT '角色名称',
  `menus` varchar(255) NOT NULL COMMENT '菜单权限 存放的是菜单编号，用逗号隔开',
  `status` tinyint(1) NOT NULL COMMENT '角色状态1正常2禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='后台用户角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (11,'超级管理员','[7,8,9,10,11,12,13,14,15,16,17]',1),(12,'客服','[11,12,13,14,15,16,17]',1);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seckill`
--

DROP TABLE IF EXISTS `seckill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seckill` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '秒杀表id',
  `title` varchar(100) NOT NULL COMMENT '活动名称',
  `begintime` char(13) NOT NULL COMMENT '秒杀开始时间',
  `endtime` char(13) NOT NULL COMMENT '秒杀结束时间',
  `first_cateid` smallint NOT NULL COMMENT '商品一级分类编号',
  `second_cateid` smallint NOT NULL COMMENT '商品二级分类编号',
  `goodsid` int NOT NULL COMMENT '商品编号',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='限时秒杀活动表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seckill`
--

LOCK TABLES `seckill` WRITE;
/*!40000 ALTER TABLE `seckill` DISABLE KEYS */;
INSERT INTO `seckill` VALUES (1,'七夕','1595174400000','1598371200000',17,35,3,1),(2,'中秋','1602259200000','1631116800000',17,35,3,1),(3,'秒杀','1596470400000','1596556800000',17,35,3,1),(4,'双十一','1601827200000','1604505600000',12,20,16,1),(7,'双十二','1602777600000','1605196800000',13,24,14,1),(8,'双十三','1602000000000','1605110400000',15,30,7,1),(9,'www','1604073600000','1606147200000',12,19,19,1);
/*!40000 ALTER TABLE `seckill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specs`
--

DROP TABLE IF EXISTS `specs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '规格id',
  `specsname` varchar(50) NOT NULL COMMENT '规格名称',
  `status` tinyint(1) NOT NULL COMMENT '规格状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品规格表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specs`
--

LOCK TABLES `specs` WRITE;
/*!40000 ALTER TABLE `specs` DISABLE KEYS */;
INSERT INTO `specs` VALUES (19,'显示屏',1),(20,'匹数',1),(21,'滚筒系列',1),(22,'冰箱容量',1),(23,'相机款式',1),(24,'耳机类型',1),(25,'电脑尺寸',1),(26,'显示器尺寸',1),(27,'投影类型',1),(28,'服装类型',1),(29,'美妆容量',1),(30,'跑步机类型',1),(31,'颜色',1);
/*!40000 ALTER TABLE `specs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specs_attr`
--

DROP TABLE IF EXISTS `specs_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specs_attr` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '规格项编号',
  `specsid` int NOT NULL COMMENT '规格的specsid',
  `specsval` varchar(50) NOT NULL COMMENT '规格值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品规格明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specs_attr`
--

LOCK TABLES `specs_attr` WRITE;
/*!40000 ALTER TABLE `specs_attr` DISABLE KEYS */;
INSERT INTO `specs_attr` VALUES (45,19,'[\"55E9F\"'),(46,19,'\"55E8D\"'),(47,19,'\"55E75F\"'),(48,19,'\"X55F\"]'),(49,20,'[\"1匹\"'),(50,20,'\"1.5匹\"]'),(51,21,'[\"10kg滚筒\"'),(52,21,'\"3.3KG滚轮\"'),(53,21,'\"10kg直驱洗\"]'),(54,22,'[\"510升\"'),(55,22,'\"480升\"'),(56,22,'\"328升\"]'),(57,23,'[\"G3X\"'),(58,23,'\"G5X\"'),(59,23,'\"G5X mark\"]'),(60,24,'[\"公开版\"'),(61,24,'\"care版\"]'),(62,25,'[\"13.3\"'),(63,25,'\"14\"'),(64,25,'\"15.6\"]'),(65,26,'[\"23.8\"'),(66,26,'\"27\"'),(67,26,'\"34\"]'),(68,27,'[\"01X\"'),(69,27,'\"H3\"'),(70,27,'\"Z8X\"]'),(71,28,'[\"S\"'),(72,28,'\"M\"'),(73,28,'\"L\"'),(74,28,'\"XL\"'),(75,28,'\"XXL\"]'),(76,29,'[\"15L\"'),(77,29,'\"30L\"'),(78,29,'\"45L\"]'),(79,30,'[\"彩屏\"'),(80,30,'\"生态\"]'),(81,31,'[\"黑红\"'),(82,31,'\"黑蓝\"'),(83,31,'\"白红\"'),(84,31,'\"白蓝\"]');
/*!40000 ALTER TABLE `specs_attr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT '住建',
  `uid` varchar(50) NOT NULL COMMENT '管理员编号',
  `roleid` smallint NOT NULL COMMENT '角色编号',
  `username` varchar(30) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `randstr` char(5) NOT NULL COMMENT '随机加密串',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uid` (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='后台管理员用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (13,'702db610-0edc-11eb-b766-1b4dc68057e6',11,'admin','5ea89b13fb4dd5bfbfcb6d093bfbf093','iSem2',1),(14,'746f3050-0edc-11eb-b766-1b4dc68057e6',12,'kefu','340ed9b854e2a41c347489f07d715d4d','Tscds',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-18 19:24:51
