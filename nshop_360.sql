-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: localhost    Database: nshop_xiao360_c
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `nc_cms_article`
--

DROP TABLE IF EXISTS `nc_cms_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nc_cms_article` (
  `article_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章编号',
  `title` varchar(50) NOT NULL COMMENT '文章标题',
  `class_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章分类编号',
  `short_title` varchar(50) NOT NULL DEFAULT '' COMMENT '文章短标题',
  `source` varchar(50) NOT NULL DEFAULT '' COMMENT '文章来源',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '文章来源链接',
  `author` varchar(50) NOT NULL COMMENT '文章作者',
  `summary` varchar(140) NOT NULL DEFAULT '' COMMENT '文章摘要',
  `content` text NOT NULL COMMENT '文章正文',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '文章标题图片',
  `keyword` varchar(255) NOT NULL DEFAULT '' COMMENT '文章关键字',
  `article_id_array` varchar(255) NOT NULL DEFAULT '' COMMENT '相关文章',
  `click` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章点击量',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '文章排序0-255',
  `commend_flag` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '文章推荐标志0-未推荐，1-已推荐',
  `comment_flag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '文章是否允许评论1-允许，0-不允许',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0-草稿、1-待审核、2-已发布、-1-回收站',
  `attachment_path` text NOT NULL COMMENT '文章附件路径',
  `tag` varchar(255) NOT NULL DEFAULT '' COMMENT '文章标签',
  `comment_count` int(10) unsigned NOT NULL COMMENT '文章评论数',
  `share_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章分享数',
  `publisher_name` varchar(50) NOT NULL COMMENT '发布者用户名 ',
  `uid` int(10) unsigned NOT NULL COMMENT '发布者编号',
  `last_comment_time` int(11) DEFAULT '0' COMMENT '最新评论时间',
  `public_time` int(11) DEFAULT '0' COMMENT '发布时间',
  `create_time` int(11) DEFAULT '0' COMMENT '文章发布时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '文章修改时间',
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=6553 COMMENT='CMS文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nc_cms_article`
--

LOCK TABLES `nc_cms_article` WRITE;
/*!40000 ALTER TABLE `nc_cms_article` DISABLE KEYS */;
INSERT INTO `nc_cms_article` VALUES (1,'第一篇新闻',1,'短标题','','','admin','文章摘要','<p>文章内容</p>','','','',0,0,0,0,2,'','',0,0,'1',1,0,1544156298,1544156298,1544498884),(2,'第二篇新闻',2,'','','','admin','','<p>文章内容</p>','','','',0,1,0,0,2,'','',0,0,'1',1,0,1544169168,1544169168,1544498891);
/*!40000 ALTER TABLE `nc_cms_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nc_cms_article_class`
--

DROP TABLE IF EXISTS `nc_cms_article_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nc_cms_article_class` (
  `class_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类编号 ',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '上级分类',
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1170 COMMENT='cms文章分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nc_cms_article_class`
--

LOCK TABLES `nc_cms_article_class` WRITE;
/*!40000 ALTER TABLE `nc_cms_article_class` DISABLE KEYS */;
INSERT INTO `nc_cms_article_class` VALUES (1,0,'公司新闻',0),(2,0,'行业新闻',1);
/*!40000 ALTER TABLE `nc_cms_article_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nc_cms_comment`
--

DROP TABLE IF EXISTS `nc_cms_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nc_cms_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论编号',
  `text` varchar(2000) NOT NULL COMMENT '评论内容',
  `uid` int(10) unsigned NOT NULL COMMENT '评论人编号',
  `quote_comment_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论引用',
  `up` int(10) unsigned NOT NULL COMMENT '点赞数量',
  `comment_time` int(10) unsigned NOT NULL COMMENT '评论时间',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='CMS评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nc_cms_comment`
--

LOCK TABLES `nc_cms_comment` WRITE;
/*!40000 ALTER TABLE `nc_cms_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `nc_cms_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nc_cms_topic`
--

DROP TABLE IF EXISTS `nc_cms_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nc_cms_topic` (
  `topic_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '专题编号',
  `instance_id` int(10) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `title` varchar(255) NOT NULL COMMENT '专题标题',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '专题封面',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '专题状态  0草稿  1发布',
  `content` text NOT NULL COMMENT '专题内容',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='专题';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nc_cms_topic`
--

LOCK TABLES `nc_cms_topic` WRITE;
/*!40000 ALTER TABLE `nc_cms_topic` DISABLE KEYS */;
INSERT INTO `nc_cms_topic` VALUES (1,0,'专题一','upload/common/1544169278.jpg',1,'<p>专题一内容</p>',1544169287,0);
/*!40000 ALTER TABLE `nc_cms_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_account`
--

DROP TABLE IF EXISTS `ns_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_account` (
  `account_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '账户ID',
  `account_profit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台的总营业额',
  `account_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台资金总余额',
  `account_return` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台利润总额',
  `account_deposit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '保证金总额',
  `account_order` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商城订单总额',
  `account_withdraw` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商城提现总额',
  `account_shop` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺总余额',
  `account_shop_withdraw` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺总提现',
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='商城资金统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_account`
--

LOCK TABLES `ns_account` WRITE;
/*!40000 ALTER TABLE `ns_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_account_assistant_records`
--

DROP TABLE IF EXISTS `ns_account_assistant_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_account_assistant_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `serial_no` varchar(50) NOT NULL DEFAULT '' COMMENT '流水号',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '对应金额',
  `account_type` tinyint(1) NOT NULL COMMENT '账户类型',
  `type_alis_id` int(11) NOT NULL COMMENT '关联ID',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='招商员支付记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_account_assistant_records`
--

LOCK TABLES `ns_account_assistant_records` WRITE;
/*!40000 ALTER TABLE `ns_account_assistant_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_account_assistant_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_account_order_records`
--

DROP TABLE IF EXISTS `ns_account_order_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_account_order_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `serial_no` varchar(50) NOT NULL DEFAULT '' COMMENT '流水号',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '对应金额',
  `account_type` tinyint(1) NOT NULL COMMENT '账户类型',
  `type_alis_id` int(11) NOT NULL COMMENT '关联ID',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='金额账户记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_account_order_records`
--

LOCK TABLES `ns_account_order_records` WRITE;
/*!40000 ALTER TABLE `ns_account_order_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_account_order_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_account_period`
--

DROP TABLE IF EXISTS `ns_account_period`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_account_period` (
  `period_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '账户ID',
  `period_year` int(10) NOT NULL COMMENT '账期年份',
  `period_month` int(10) NOT NULL COMMENT '账期月份',
  `account_profit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账期总营业额',
  `account_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账期总发生余额',
  `account_return` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账期利润总额',
  `account_deposit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账期保证金总额',
  `account_order` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账期订单总额',
  `account_withdraw` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账期店铺提现总额',
  `account_shop` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账期店铺总发生额',
  `account_shop_withdraw` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账期店铺总提现额',
  `start_time` int(11) DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) DEFAULT '0' COMMENT '结束时间',
  PRIMARY KEY (`period_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='商城账期结算表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_account_period`
--

LOCK TABLES `ns_account_period` WRITE;
/*!40000 ALTER TABLE `ns_account_period` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_account_period` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_account_records`
--

DROP TABLE IF EXISTS `ns_account_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_account_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '对应金额',
  `account_type` tinyint(1) NOT NULL COMMENT '账户类型',
  `type_alis_id` int(11) NOT NULL COMMENT '关联ID',
  `is_display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `is_calculate` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否参与计算',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1092 COMMENT='金额账户记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_account_records`
--

LOCK TABLES `ns_account_records` WRITE;
/*!40000 ALTER TABLE `ns_account_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_account_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_account_return_records`
--

DROP TABLE IF EXISTS `ns_account_return_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_account_return_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `return_type` int(11) NOT NULL DEFAULT '0' COMMENT '提成类型',
  `type_alis_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联id',
  `is_display` int(11) NOT NULL DEFAULT '0' COMMENT '是否显示',
  `is_calculate` int(11) NOT NULL DEFAULT '0' COMMENT '是否计算',
  `remark` varchar(255) NOT NULL DEFAULT '0' COMMENT '备注',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=910 COMMENT='平台的利润的记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_account_return_records`
--

LOCK TABLES `ns_account_return_records` WRITE;
/*!40000 ALTER TABLE `ns_account_return_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_account_return_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_account_withdraw_records`
--

DROP TABLE IF EXISTS `ns_account_withdraw_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_account_withdraw_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `serial_no` varchar(50) NOT NULL DEFAULT '' COMMENT '流水号',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '对应金额',
  `account_type` tinyint(1) NOT NULL COMMENT '账户类型',
  `type_alis_id` int(11) NOT NULL COMMENT '关联ID',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='金额账户记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_account_withdraw_records`
--

LOCK TABLES `ns_account_withdraw_records` WRITE;
/*!40000 ALTER TABLE `ns_account_withdraw_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_account_withdraw_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_account_withdraw_user_records`
--

DROP TABLE IF EXISTS `ns_account_withdraw_user_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_account_withdraw_user_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `serial_no` varchar(50) NOT NULL DEFAULT '' COMMENT '流水号',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '对应金额',
  `account_type` tinyint(1) NOT NULL COMMENT '账户类型',
  `type_alis_id` int(11) NOT NULL COMMENT '关联ID',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员提现记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_account_withdraw_user_records`
--

LOCK TABLES `ns_account_withdraw_user_records` WRITE;
/*!40000 ALTER TABLE `ns_account_withdraw_user_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_account_withdraw_user_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_attribute`
--

DROP TABLE IF EXISTS `ns_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_attribute` (
  `attr_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品属性ID',
  `attr_name` varchar(255) NOT NULL DEFAULT '' COMMENT '属性名称',
  `is_use` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否使用',
  `spec_id_array` varchar(255) NOT NULL DEFAULT '' COMMENT '关联规格',
  `sort` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`attr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='商品相关属性';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_attribute`
--

LOCK TABLES `ns_attribute` WRITE;
/*!40000 ALTER TABLE `ns_attribute` DISABLE KEYS */;
INSERT INTO `ns_attribute` VALUES (1,'书籍',1,'1',1,1543999075,1543999097);
/*!40000 ALTER TABLE `ns_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_attribute_value`
--

DROP TABLE IF EXISTS `ns_attribute_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_attribute_value` (
  `attr_value_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性值ID',
  `attr_value_name` varchar(50) NOT NULL DEFAULT '' COMMENT '属性值名称',
  `attr_id` int(11) NOT NULL COMMENT '属性ID',
  `value` varchar(1000) NOT NULL DEFAULT '' COMMENT '属性对应相关数据',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '属性对应输入类型1.直接2.单选3.多选',
  `sort` int(11) NOT NULL DEFAULT '1999' COMMENT '排序号',
  `is_search` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否使用',
  PRIMARY KEY (`attr_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096 COMMENT='商品属性值';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_attribute_value`
--

LOCK TABLES `ns_attribute_value` WRITE;
/*!40000 ALTER TABLE `ns_attribute_value` DISABLE KEYS */;
INSERT INTO `ns_attribute_value` VALUES (1,'名称',1,'',1,1,1),(2,'价格',1,'',1,2,1);
/*!40000 ALTER TABLE `ns_attribute_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_cart`
--

DROP TABLE IF EXISTS `ns_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车id',
  `buyer_id` int(11) NOT NULL DEFAULT '0' COMMENT '买家id',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `shop_name` varchar(100) NOT NULL DEFAULT '' COMMENT '店铺名称',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_name` varchar(200) NOT NULL COMMENT '商品名称',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品的skuid',
  `sku_name` varchar(200) NOT NULL DEFAULT '' COMMENT '商品的sku名称',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `num` smallint(5) NOT NULL DEFAULT '1' COMMENT '购买商品数量',
  `goods_picture` int(11) NOT NULL DEFAULT '0' COMMENT '商品图片',
  `bl_id` mediumint(8) NOT NULL DEFAULT '0' COMMENT '组合套装ID',
  PRIMARY KEY (`cart_id`),
  KEY `member_id` (`buyer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1170 COMMENT='购物车表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_cart`
--

LOCK TABLES `ns_cart` WRITE;
/*!40000 ALTER TABLE `ns_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_click_fabulous`
--

DROP TABLE IF EXISTS `ns_click_fabulous`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_click_fabulous` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `shop_id` int(11) NOT NULL COMMENT '店铺id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `create_time` int(11) DEFAULT '0' COMMENT '点赞时间',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '点赞状态 0 未点赞 1 点赞',
  `number` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='商品点赞记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_click_fabulous`
--

LOCK TABLES `ns_click_fabulous` WRITE;
/*!40000 ALTER TABLE `ns_click_fabulous` DISABLE KEYS */;
INSERT INTO `ns_click_fabulous` VALUES (1,3073,0,3,1544134156,1,0.00),(2,3073,0,1,1544176884,1,0.00),(3,3073,0,4,1544309237,1,1.00);
/*!40000 ALTER TABLE `ns_click_fabulous` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_consult`
--

DROP TABLE IF EXISTS `ns_consult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_consult` (
  `consult_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '咨询编号',
  `goods_id` int(11) unsigned DEFAULT '0' COMMENT '商品编号',
  `goods_name` varchar(100) NOT NULL COMMENT '商品名称',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '咨询发布者会员编号(0：游客)',
  `member_name` varchar(100) NOT NULL DEFAULT '' COMMENT '会员名称',
  `shop_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '店铺编号',
  `shop_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `ct_id` int(10) unsigned NOT NULL COMMENT '咨询类型',
  `consult_content` varchar(255) NOT NULL DEFAULT '' COMMENT '咨询内容',
  `consult_reply` varchar(255) NOT NULL DEFAULT '' COMMENT '咨询回复内容',
  `isanonymous` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0表示不匿名 1表示匿名',
  `consult_addtime` int(11) DEFAULT '0' COMMENT '咨询发布时间',
  `consult_reply_time` int(11) DEFAULT '0' COMMENT '咨询回复时间',
  PRIMARY KEY (`consult_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1638 COMMENT='咨询类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_consult`
--

LOCK TABLES `ns_consult` WRITE;
/*!40000 ALTER TABLE `ns_consult` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_consult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_consult_type`
--

DROP TABLE IF EXISTS `ns_consult_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_consult_type` (
  `ct_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '咨询类型id',
  `ct_name` varchar(50) NOT NULL DEFAULT '' COMMENT '咨询类型名称',
  `ct_introduce` text NOT NULL COMMENT '咨询类型详细介绍',
  `ct_sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`ct_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='咨询类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_consult_type`
--

LOCK TABLES `ns_consult_type` WRITE;
/*!40000 ALTER TABLE `ns_consult_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_consult_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_coupon`
--

DROP TABLE IF EXISTS `ns_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '优惠券id',
  `coupon_type_id` int(11) NOT NULL COMMENT '优惠券类型id',
  `shop_id` int(11) NOT NULL COMMENT '店铺Id',
  `coupon_code` varchar(255) NOT NULL DEFAULT '' COMMENT '优惠券编码',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '领用人',
  `use_order_id` int(11) NOT NULL DEFAULT '0' COMMENT '优惠券使用订单id',
  `create_order_id` int(11) NOT NULL DEFAULT '0' COMMENT '创建订单id(优惠券只有是完成订单发放的优惠券时才有值)',
  `money` decimal(10,2) NOT NULL COMMENT '面额',
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '优惠券状态 0未领用 1已领用（未使用） 2已使用 3已过期',
  `get_type` int(11) NOT NULL DEFAULT '0' COMMENT '获取方式1订单2.首页领取',
  `fetch_time` int(11) DEFAULT '0' COMMENT '领取时间',
  `use_time` int(11) DEFAULT '0' COMMENT '使用时间',
  `start_time` int(11) DEFAULT '0' COMMENT '有效期开始时间',
  `end_time` int(11) DEFAULT '0' COMMENT '有效期结束时间',
  PRIMARY KEY (`coupon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=148 COMMENT='优惠券表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_coupon`
--

LOCK TABLES `ns_coupon` WRITE;
/*!40000 ALTER TABLE `ns_coupon` DISABLE KEYS */;
INSERT INTO `ns_coupon` VALUES (1,1,0,'1544241680384',3073,0,0,20.00,1,2,1544241721,0,1544241659,1546228863),(2,1,0,'1544241680641',0,0,0,20.00,0,0,0,0,1544241659,1546228863),(3,1,0,'1544241680720',0,0,0,20.00,0,0,0,0,1544241659,1546228863),(4,1,0,'1544241680785',0,0,0,20.00,0,0,0,0,1544241659,1546228863),(5,1,0,'1544241680480',0,0,0,20.00,0,0,0,0,1544241659,1546228863),(6,1,0,'1544241680575',0,0,0,20.00,0,0,0,0,1544241659,1546228863),(7,1,0,'1544241680717',0,0,0,20.00,0,0,0,0,1544241659,1546228863),(8,1,0,'1544241680475',0,0,0,20.00,0,0,0,0,1544241659,1546228863),(9,1,0,'1544241680918',0,0,0,20.00,0,0,0,0,1544241659,1546228863),(10,1,0,'1544241680258',0,0,0,20.00,0,0,0,0,1544241659,1546228863),(11,2,0,'1544241815928',3073,0,0,50.00,1,3,1544254862,0,1544241808,1546229010),(12,2,0,'1544241815998',0,0,0,50.00,0,0,0,0,1544241808,1546229010),(13,2,0,'1544241815830',0,0,0,50.00,0,0,0,0,1544241808,1546229010),(14,2,0,'1544241815642',0,0,0,50.00,0,0,0,0,1544241808,1546229010),(15,2,0,'1544241815395',0,0,0,50.00,0,0,0,0,1544241808,1546229010),(16,2,0,'1544241815318',0,0,0,50.00,0,0,0,0,1544241808,1546229010),(17,2,0,'1544241815866',0,0,0,50.00,0,0,0,0,1544241808,1546229010),(18,2,0,'1544241815525',0,0,0,50.00,0,0,0,0,1544241808,1546229010),(19,2,0,'1544241815693',0,0,0,50.00,0,0,0,0,1544241808,1546229010),(20,2,0,'1544241815937',0,0,0,50.00,0,0,0,0,1544241808,1546229010),(21,3,0,'1544255330548',3073,0,0,2.00,1,3,1544255367,0,1544255321,1546242523),(22,3,0,'1544255330199',0,0,0,2.00,0,0,0,0,1544255321,1546242523),(23,3,0,'1544255330753',0,0,0,2.00,0,0,0,0,1544255321,1546242523),(24,3,0,'1544255330353',0,0,0,2.00,0,0,0,0,1544255321,1546242523),(25,3,0,'1544255330503',0,0,0,2.00,0,0,0,0,1544255321,1546242523),(26,3,0,'1544255330417',0,0,0,2.00,0,0,0,0,1544255321,1546242523),(27,3,0,'1544255330823',0,0,0,2.00,0,0,0,0,1544255321,1546242523),(28,3,0,'1544255330537',0,0,0,2.00,0,0,0,0,1544255321,1546242523),(29,3,0,'1544255330272',0,0,0,2.00,0,0,0,0,1544255321,1546242523),(30,3,0,'1544255330826',0,0,0,2.00,0,0,0,0,1544255321,1546242523);
/*!40000 ALTER TABLE `ns_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_coupon_goods`
--

DROP TABLE IF EXISTS `ns_coupon_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_coupon_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_type_id` int(11) NOT NULL COMMENT '优惠券类型id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=606 COMMENT='优惠券使用商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_coupon_goods`
--

LOCK TABLES `ns_coupon_goods` WRITE;
/*!40000 ALTER TABLE `ns_coupon_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_coupon_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_coupon_type`
--

DROP TABLE IF EXISTS `ns_coupon_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_coupon_type` (
  `coupon_type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '优惠券类型Id',
  `shop_id` int(11) NOT NULL DEFAULT '1' COMMENT '店铺ID',
  `coupon_name` varchar(50) NOT NULL DEFAULT '' COMMENT '优惠券名称',
  `money` decimal(10,2) NOT NULL COMMENT '发放面额',
  `count` int(11) NOT NULL COMMENT '发放数量',
  `max_fetch` int(11) NOT NULL DEFAULT '0' COMMENT '每人最大领取个数 0无限制',
  `at_least` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '满多少元使用 0代表无限制',
  `need_user_level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '领取人会员等级',
  `range_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '使用范围0部分产品使用 1全场产品使用',
  `is_show` int(11) NOT NULL DEFAULT '0' COMMENT '是否允许首页显示0不显示1显示',
  `start_time` int(11) DEFAULT '0' COMMENT '有效日期开始时间',
  `end_time` int(11) DEFAULT '0' COMMENT '有效日期结束时间',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`coupon_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1365 COMMENT='优惠券类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_coupon_type`
--

LOCK TABLES `ns_coupon_type` WRITE;
/*!40000 ALTER TABLE `ns_coupon_type` DISABLE KEYS */;
INSERT INTO `ns_coupon_type` VALUES (1,0,'20元商城通用券',20.00,10,1,200.00,0,1,0,1544241659,1546228863,0,0),(2,0,'50元商城通用券',50.00,10,1,500.00,0,1,0,1544241808,1546229010,0,0),(3,0,'2元商城通用券',2.00,10,1,20.00,0,1,0,1544255321,1546242523,0,0);
/*!40000 ALTER TABLE `ns_coupon_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_express_company`
--

DROP TABLE IF EXISTS `ns_express_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_express_company` (
  `co_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表序号',
  `shop_id` int(11) NOT NULL COMMENT '商铺id',
  `company_name` varchar(50) NOT NULL DEFAULT '' COMMENT '物流公司名称',
  `express_no` varchar(20) NOT NULL DEFAULT '' COMMENT '物流编号',
  `is_enabled` int(11) NOT NULL DEFAULT '1' COMMENT '使用状态',
  `image` varchar(255) DEFAULT '' COMMENT '物流公司模版图片',
  `phone` varchar(50) NOT NULL DEFAULT '' COMMENT '联系电话',
  `orders` int(11) DEFAULT NULL,
  `express_logo` varchar(255) DEFAULT '' COMMENT '公司logo',
  `is_default` int(11) NOT NULL DEFAULT '0' COMMENT '是否设置为默认 0未设置 1 默认',
  PRIMARY KEY (`co_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=420 COMMENT='物流公司';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_express_company`
--

LOCK TABLES `ns_express_company` WRITE;
/*!40000 ALTER TABLE `ns_express_company` DISABLE KEYS */;
INSERT INTO `ns_express_company` VALUES (1,0,'顺丰快递','123456789',1,'','',0,'',1);
/*!40000 ALTER TABLE `ns_express_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_express_shipping`
--

DROP TABLE IF EXISTS `ns_express_shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_express_shipping` (
  `sid` int(11) NOT NULL AUTO_INCREMENT COMMENT '运单模版id',
  `shop_id` int(11) NOT NULL COMMENT '店铺id',
  `template_name` varchar(255) NOT NULL DEFAULT '' COMMENT '模版名称',
  `co_id` int(11) NOT NULL DEFAULT '0' COMMENT '物流公司 id',
  `size_type` smallint(6) NOT NULL DEFAULT '1' COMMENT '尺寸类型 1像素px  2毫米mm',
  `width` smallint(6) NOT NULL DEFAULT '0' COMMENT '宽度',
  `height` smallint(6) NOT NULL DEFAULT '0' COMMENT '长度',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '快递单图片',
  PRIMARY KEY (`sid`),
  KEY `IDX_express_shipping_co_id` (`co_id`),
  KEY `IDX_express_shipping_shopId` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=5461 COMMENT='运单模板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_express_shipping`
--

LOCK TABLES `ns_express_shipping` WRITE;
/*!40000 ALTER TABLE `ns_express_shipping` DISABLE KEYS */;
INSERT INTO `ns_express_shipping` VALUES (1,0,'顺丰快递',1,1,0,0,'');
/*!40000 ALTER TABLE `ns_express_shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_express_shipping_items`
--

DROP TABLE IF EXISTS `ns_express_shipping_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_express_shipping_items` (
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '运单模版id',
  `field_name` varchar(30) NOT NULL COMMENT '字段名称',
  `field_display_name` varchar(255) NOT NULL COMMENT '打印项名称',
  `is_print` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否打印',
  `x` int(11) NOT NULL DEFAULT '0' COMMENT 'x',
  `y` int(11) NOT NULL DEFAULT '0' COMMENT 'y',
  PRIMARY KEY (`sid`,`field_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=420 COMMENT='物流模板打印项';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_express_shipping_items`
--

LOCK TABLES `ns_express_shipping_items` WRITE;
/*!40000 ALTER TABLE `ns_express_shipping_items` DISABLE KEYS */;
INSERT INTO `ns_express_shipping_items` VALUES (1,'A1','订单编号',1,10,11),(1,'A10','收件人邮编',1,10,86),(1,'A11','货到付款物流编号',1,10,286),(1,'A12','代收金额',1,10,186),(1,'A13','备注',1,10,311),(1,'A2','发件人公司',1,10,36),(1,'A3','发件人地址',1,10,136),(1,'A4','发件人姓名',1,10,111),(1,'A5','发件人电话',1,10,211),(1,'A6','发件人邮编',1,10,236),(1,'A7','收件人地址',1,10,261),(1,'A8','收件人姓名',1,10,61),(1,'A9','收件人电话',1,10,161);
/*!40000 ALTER TABLE `ns_express_shipping_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_express_shipping_items_library`
--

DROP TABLE IF EXISTS `ns_express_shipping_items_library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_express_shipping_items_library` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '物流模版打印项库ID',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `field_name` varchar(50) NOT NULL COMMENT '字段名',
  `field_display_name` varchar(50) NOT NULL COMMENT '字段显示名',
  `is_enabled` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否启用',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1260 COMMENT='物流模版打印项库';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_express_shipping_items_library`
--

LOCK TABLES `ns_express_shipping_items_library` WRITE;
/*!40000 ALTER TABLE `ns_express_shipping_items_library` DISABLE KEYS */;
INSERT INTO `ns_express_shipping_items_library` VALUES (1,0,'A1','订单编号',''),(2,0,'A2','发件人公司',''),(3,0,'A8','收件人姓名',''),(4,0,'A10','收件人邮编',''),(5,0,'A4','发件人姓名',''),(6,0,'A3','发件人地址',''),(7,0,'A9','收件人电话',''),(8,0,'A12','代收金额',''),(9,0,'A5','发件人电话',''),(10,0,'A6','发件人邮编',''),(11,0,'A7','收件人地址',''),(12,0,'A11','货到付款物流编号',''),(13,0,'A13','备注','');
/*!40000 ALTER TABLE `ns_express_shipping_items_library` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_gift_grant_records`
--

DROP TABLE IF EXISTS `ns_gift_grant_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_gift_grant_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gift_id` int(11) NOT NULL COMMENT '赠送活动ID',
  `goods_id` int(11) NOT NULL COMMENT '赠送商品ID',
  `goods_name` varchar(50) NOT NULL DEFAULT '' COMMENT '赠送商品名称',
  `goods_img` varchar(255) NOT NULL DEFAULT '' COMMENT '赠送商品图片',
  `num` int(11) NOT NULL DEFAULT '1' COMMENT '赠送数量',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '发放方式',
  `type_id` int(11) NOT NULL DEFAULT '0' COMMENT '发放相关ID',
  `memo` text NOT NULL COMMENT '备注',
  `create_time` int(11) DEFAULT '0' COMMENT '赠送时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='赠品发放记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_gift_grant_records`
--

LOCK TABLES `ns_gift_grant_records` WRITE;
/*!40000 ALTER TABLE `ns_gift_grant_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_gift_grant_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_goods`
--

DROP TABLE IF EXISTS `ns_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_goods` (
  `goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品id(SKU)',
  `goods_name` varchar(50) NOT NULL DEFAULT '' COMMENT '商品名称',
  `shop_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '店铺id',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品分类id',
  `category_id_1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '一级分类id',
  `category_id_2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '二级分类id',
  `category_id_3` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '三级分类id',
  `brand_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '品牌id',
  `group_id_array` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺分类id 首尾用,隔开',
  `promotion_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '促销类型 0无促销，1团购，2限时折扣',
  `promote_id` int(11) NOT NULL DEFAULT '0' COMMENT '促销活动ID',
  `goods_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '实物或虚拟商品标志 1实物商品 0 虚拟商品 2 F码商品',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `price` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '商品原价格',
  `promotion_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品促销价格',
  `cost_price` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '成本价',
  `point_exchange_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '积分兑换类型 0 非积分兑换 1 只能积分兑换 ',
  `point_exchange` int(11) NOT NULL DEFAULT '0' COMMENT '积分兑换',
  `give_point` int(11) NOT NULL DEFAULT '0' COMMENT '购买商品赠送积分',
  `is_member_discount` int(1) NOT NULL DEFAULT '0' COMMENT '参与会员折扣',
  `shipping_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费 0为免运费',
  `shipping_fee_id` int(11) NOT NULL DEFAULT '0' COMMENT '售卖区域id 物流模板id  ns_order_shipping_fee 表id',
  `stock` int(10) NOT NULL DEFAULT '0' COMMENT '商品库存',
  `max_buy` int(11) NOT NULL DEFAULT '0' COMMENT '限购 0 不限购',
  `clicks` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品点击数量',
  `min_stock_alarm` int(11) NOT NULL DEFAULT '0' COMMENT '库存预警值',
  `sales` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '销售数量',
  `collects` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数量',
  `star` tinyint(3) unsigned NOT NULL DEFAULT '5' COMMENT '好评星级',
  `evaluates` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评价数',
  `shares` int(11) NOT NULL DEFAULT '0' COMMENT '分享数',
  `province_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '一级地区id',
  `city_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '二级地区id',
  `picture` int(11) NOT NULL DEFAULT '0' COMMENT '商品主图',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '商品关键词',
  `introduction` varchar(255) NOT NULL DEFAULT '' COMMENT '商品简介，促销语',
  `description` text NOT NULL COMMENT '商品详情',
  `QRcode` varchar(255) NOT NULL DEFAULT '' COMMENT '商品二维码',
  `code` varchar(50) NOT NULL DEFAULT '' COMMENT '商家编号',
  `is_stock_visible` int(1) NOT NULL DEFAULT '0' COMMENT '页面不显示库存',
  `is_hot` int(1) NOT NULL DEFAULT '0' COMMENT '是否热销商品',
  `is_recommend` int(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `is_new` int(1) NOT NULL DEFAULT '0' COMMENT '是否新品',
  `is_pre_sale` int(11) DEFAULT '0',
  `is_bill` int(1) NOT NULL DEFAULT '0' COMMENT '是否开具增值税发票 1是，0否',
  `state` tinyint(3) NOT NULL DEFAULT '1' COMMENT '商品状态 0下架，1正常，10违规（禁售）',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `img_id_array` varchar(1000) DEFAULT NULL COMMENT '商品图片序列',
  `sku_img_array` varchar(1000) DEFAULT NULL COMMENT '商品sku应用图片列表  属性,属性值，图片ID',
  `match_point` float(10,2) DEFAULT NULL COMMENT '实物与描述相符（根据评价计算）',
  `match_ratio` float(10,2) DEFAULT NULL COMMENT '实物与描述相符（根据评价计算）百分比',
  `real_sales` int(10) NOT NULL DEFAULT '0' COMMENT '实际销量',
  `goods_attribute_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品类型',
  `goods_spec_format` text NOT NULL COMMENT '商品规格',
  `goods_weight` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '商品重量',
  `goods_volume` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '商品体积',
  `shipping_fee_type` int(11) NOT NULL DEFAULT '1' COMMENT '计价方式1.重量2.体积3.计件',
  `extend_category_id` varchar(255) DEFAULT NULL,
  `extend_category_id_1` varchar(255) DEFAULT NULL,
  `extend_category_id_2` varchar(255) DEFAULT NULL,
  `extend_category_id_3` varchar(255) DEFAULT NULL,
  `supplier_id` int(11) NOT NULL DEFAULT '0' COMMENT '供货商id',
  `sale_date` int(11) DEFAULT '0' COMMENT '上下架时间',
  `create_time` int(11) DEFAULT '0' COMMENT '商品添加时间',
  `update_time` int(11) DEFAULT '0' COMMENT '商品编辑时间',
  `min_buy` int(11) NOT NULL DEFAULT '0' COMMENT '最少买几件',
  PRIMARY KEY (`goods_id`),
  KEY `UK_ns_goods_brand_id` (`brand_id`),
  KEY `UK_ns_goods_category_id` (`category_id`),
  KEY `UK_ns_goods_category_id_1` (`category_id_1`),
  KEY `UK_ns_goods_category_id_2` (`category_id_2`),
  KEY `UK_ns_goods_category_id_3` (`category_id_3`),
  KEY `UK_ns_goods_extend_category_id` (`extend_category_id`),
  KEY `UK_ns_goods_extend_category_id_1` (`extend_category_id_1`),
  KEY `UK_ns_goods_extend_category_id_2` (`extend_category_id_2`),
  KEY `UK_ns_goods_extend_category_id_3` (`extend_category_id_3`),
  KEY `UK_ns_goods_goods_attribute_id` (`goods_attribute_id`),
  KEY `UK_ns_goods_group_id_array` (`group_id_array`),
  KEY `UK_ns_goods_promotion_price` (`promotion_price`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16554 COMMENT='商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_goods`
--

LOCK TABLES `ns_goods` WRITE;
/*!40000 ALTER TABLE `ns_goods` DISABLE KEYS */;
INSERT INTO `ns_goods` VALUES (1,'72色粉笔',0,1,1,0,0,0,'',0,0,1,0.00,30.00,30.00,0.00,0,0,0,0,0.00,0,1000,0,0,30,1,0,0,0,0,19,199,6,'','','<p>72色粉笔</p>','upload/goods_qrcode/goods_qrcode_1.png','',1,0,0,0,0,0,1,0,'6','',NULL,NULL,1,1,'[]',0.00,0.00,3,'','','','',0,1543999356,1543999356,1544255961,0),(2,'斯玛特笔帘',0,1,1,0,0,0,'',0,0,1,0.00,30.00,30.00,0.00,0,0,0,0,0.00,0,998,5,0,30,4,0,0,0,0,0,0,4,'笔','','<p>商品描述</p>','upload/goods_qrcode/goods_qrcode_2.png','',1,0,0,0,0,0,1,0,'4','',NULL,NULL,4,1,'[]',0.00,0.00,3,'','','','',0,1544087845,1544087845,1544255974,1),(3,'斯玛特玩偶',0,3,3,0,0,0,'',0,0,1,0.00,40.00,40.00,0.00,0,0,0,0,0.00,0,1000,0,0,10,1,0,0,0,0,0,0,7,'','','<p>斯玛特玩偶</p>','upload/goods_qrcode/goods_qrcode_3.png','',1,0,0,0,0,0,1,0,'7','',NULL,NULL,1,1,'[]',0.00,0.00,3,'','','','',0,1544088213,1544088213,0,0),(4,'小丑拼图',0,2,2,0,0,0,'',0,0,1,0.00,5.00,5.00,0.00,0,0,0,0,0.00,0,1000,0,0,10,2,0,0,0,0,19,199,8,'','','<p>小丑拼图</p>','upload/goods_qrcode/goods_qrcode_4.png','',1,0,0,0,0,0,1,0,'8','',NULL,NULL,2,1,'[]',0.00,0.00,3,'','','','',0,1544088525,1544088525,0,0),(5,'颜料套装',0,4,4,0,0,0,'',0,0,1,0.00,288.00,288.00,0.00,0,0,0,0,0.00,0,998,0,0,10,2,0,0,0,0,19,199,9,'','','<p>颜料盘</p>','upload/goods_qrcode/goods_qrcode_5.png','',1,0,0,0,0,0,1,0,'9','',NULL,NULL,2,1,'[]',0.00,0.00,3,'','','','',0,1544088837,1544088837,0,0);
/*!40000 ALTER TABLE `ns_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_goods_attribute`
--

DROP TABLE IF EXISTS `ns_goods_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_goods_attribute` (
  `attr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `attr_value_id` int(11) NOT NULL COMMENT '属性值id',
  `attr_value` varchar(255) NOT NULL DEFAULT '' COMMENT '属性值名称',
  `attr_value_name` varchar(255) NOT NULL DEFAULT '' COMMENT '属性值对应数据值',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`attr_id`),
  KEY `UK_ns_goods_attribute_attr_value_id` (`attr_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=315 COMMENT='商品属性表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_goods_attribute`
--

LOCK TABLES `ns_goods_attribute` WRITE;
/*!40000 ALTER TABLE `ns_goods_attribute` DISABLE KEYS */;
INSERT INTO `ns_goods_attribute` VALUES (9,3,0,1,'名称','',1,1544088213),(10,3,0,2,'价格','',2,1544088213),(11,4,0,1,'名称','',1,1544088525),(12,4,0,2,'价格','',2,1544088525),(15,5,0,1,'名称','',1,1544088837),(16,5,0,2,'价格','',2,1544088837),(17,1,0,1,'名称','小号',1,1544255961),(18,1,0,2,'价格','30',2,1544255961),(19,2,0,1,'名称','',1,1544255974),(20,2,0,2,'价格','',2,1544255974);
/*!40000 ALTER TABLE `ns_goods_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_goods_attribute_deleted`
--

DROP TABLE IF EXISTS `ns_goods_attribute_deleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_goods_attribute_deleted` (
  `attr_id` int(10) NOT NULL,
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `attr_value_id` int(11) NOT NULL COMMENT '属性值id',
  `attr_value` varchar(255) NOT NULL DEFAULT '' COMMENT '属性值名称',
  `attr_value_name` varchar(255) NOT NULL DEFAULT '' COMMENT '属性值对应数据值',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=315 COMMENT='商品属性回收站表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_goods_attribute_deleted`
--

LOCK TABLES `ns_goods_attribute_deleted` WRITE;
/*!40000 ALTER TABLE `ns_goods_attribute_deleted` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_goods_attribute_deleted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_goods_attribute_value`
--

DROP TABLE IF EXISTS `ns_goods_attribute_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_goods_attribute_value` (
  `attr_value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品属性值ID',
  `attr_id` int(11) NOT NULL COMMENT '商品属性ID',
  `attr_value` varchar(255) NOT NULL DEFAULT '' COMMENT '值名称',
  `is_visible` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否可视',
  `sort` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT '0',
  PRIMARY KEY (`attr_value_id`),
  KEY `IDX_category_propvalues_c_pId` (`attr_id`),
  KEY `IDX_category_propvalues_orders` (`sort`),
  KEY `IDX_category_propvalues_value` (`attr_value`),
  KEY `UK_ns_goods_attribute_value_attr_value_id` (`attr_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1092 COMMENT='商品规格值模版表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_goods_attribute_value`
--

LOCK TABLES `ns_goods_attribute_value` WRITE;
/*!40000 ALTER TABLE `ns_goods_attribute_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_goods_attribute_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_goods_brand`
--

DROP TABLE IF EXISTS `ns_goods_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_goods_brand` (
  `brand_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `brand_name` varchar(100) NOT NULL COMMENT '品牌名称',
  `brand_initial` varchar(1) NOT NULL COMMENT '品牌首字母',
  `brand_pic` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `brand_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐，0为否，1为是，默认为0',
  `sort` int(11) DEFAULT NULL,
  `brand_category_name` varchar(50) NOT NULL DEFAULT '' COMMENT '类别名称',
  `category_id_array` varchar(1000) NOT NULL DEFAULT '' COMMENT '所属分类id组',
  `brand_ads` varchar(255) NOT NULL DEFAULT '' COMMENT '品牌推荐广告',
  `category_name` varchar(50) NOT NULL DEFAULT '' COMMENT '品牌所属分类名称',
  `category_id_1` int(11) NOT NULL DEFAULT '0' COMMENT '一级分类ID',
  `category_id_2` int(11) NOT NULL DEFAULT '0' COMMENT '二级分类ID',
  `category_id_3` int(11) NOT NULL DEFAULT '0' COMMENT '三级分类ID',
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1024 COMMENT='品牌表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_goods_brand`
--

LOCK TABLES `ns_goods_brand` WRITE;
/*!40000 ALTER TABLE `ns_goods_brand` DISABLE KEYS */;
INSERT INTO `ns_goods_brand` VALUES (1,0,'斯玛特','S','',1,1,'','','','儿童书籍',1,0,0);
/*!40000 ALTER TABLE `ns_goods_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_goods_category`
--

DROP TABLE IF EXISTS `ns_goods_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_goods_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL DEFAULT '',
  `short_name` varchar(50) NOT NULL DEFAULT '' COMMENT '商品分类简称 ',
  `pid` int(11) NOT NULL DEFAULT '0',
  `level` tinyint(4) NOT NULL DEFAULT '0',
  `is_visible` int(11) NOT NULL DEFAULT '1' COMMENT '是否显示  1 显示 0 不显示',
  `attr_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联商品类型ID',
  `attr_name` varchar(255) NOT NULL DEFAULT '' COMMENT '关联类型名称',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `sort` int(11) DEFAULT NULL,
  `category_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '商品分类图片',
  `category_icon` varchar(255) NOT NULL DEFAULT '' COMMENT '分类图标',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=244 COMMENT='商品分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_goods_category`
--

LOCK TABLES `ns_goods_category` WRITE;
/*!40000 ALTER TABLE `ns_goods_category` DISABLE KEYS */;
INSERT INTO `ns_goods_category` VALUES (1,'必备耗材','必备耗材',0,1,1,1,'书籍','玩具','',1,'upload/goods_category/1544087359.jpg','upload/goods_category/1544152500.png'),(2,'节日礼品','节日礼品',0,1,1,1,'书籍','','',2,'upload/goods_category/1544087369.jpg','upload/goods_category/1544152525.png'),(3,'宣传物料','宣传物料',0,1,1,1,'书籍','','',3,'upload/goods_category/1544087379.jpg','upload/goods_category/1544152533.png'),(4,'衍生品','衍生品',0,1,1,1,'书籍','','',4,'upload/goods_category/1544087394.jpg','upload/goods_category/1544152544.png');
/*!40000 ALTER TABLE `ns_goods_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_goods_category_block`
--

DROP TABLE IF EXISTS `ns_goods_category_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_goods_category_block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '实例id',
  `category_name` varchar(50) NOT NULL DEFAULT '' COMMENT '分类名称',
  `category_id` int(11) NOT NULL DEFAULT '0' COMMENT '分类id',
  `category_alias` varchar(50) NOT NULL DEFAULT '' COMMENT '分类别名',
  `color` varchar(255) DEFAULT '#FFFFFF' COMMENT '颜色',
  `is_show` int(11) NOT NULL DEFAULT '1' COMMENT '是否显示 1显示 0 不显示',
  `is_show_lower_category` int(11) NOT NULL DEFAULT '0' COMMENT '是否显示下级分类',
  `is_show_brand` int(11) NOT NULL DEFAULT '0' COMMENT '是否显示品牌',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `ad_picture` varchar(255) NOT NULL DEFAULT '' COMMENT '广告图  {["title":"","subtitle":"","picture":"","url":"","background":""]}',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `short_name` varchar(255) DEFAULT '' COMMENT '分类简称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='商品分类楼层表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_goods_category_block`
--

LOCK TABLES `ns_goods_category_block` WRITE;
/*!40000 ALTER TABLE `ns_goods_category_block` DISABLE KEYS */;
INSERT INTO `ns_goods_category_block` VALUES (3,0,'必备耗材',1,'必备耗材','#00ff00',1,0,0,0,'',1543999021,1544152503,'必备耗材'),(4,0,'节日礼品',2,'节日礼品','#00ff00',1,0,0,0,'',1544082763,1544152526,'节日礼品'),(5,0,'宣传物料',3,'宣传物料','#00ff00',1,0,0,0,'',1544082796,1544152535,'宣传物料'),(6,0,'衍生品',4,'衍生品','#00ff00',1,0,0,0,'',1544082841,1544152545,'衍生品');
/*!40000 ALTER TABLE `ns_goods_category_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_goods_comment`
--

DROP TABLE IF EXISTS `ns_goods_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_goods_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `shop_id` int(11) NOT NULL COMMENT '店铺id',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `create_time` int(11) DEFAULT '0' COMMENT '评论创建时间',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '评论状态 0未评论 1已评论',
  `number` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='商品评论送积分记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_goods_comment`
--

LOCK TABLES `ns_goods_comment` WRITE;
/*!40000 ALTER TABLE `ns_goods_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_goods_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_goods_deleted`
--

DROP TABLE IF EXISTS `ns_goods_deleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_goods_deleted` (
  `goods_id` int(10) NOT NULL DEFAULT '0' COMMENT '商品id(SKU)',
  `goods_name` varchar(50) NOT NULL DEFAULT '' COMMENT '商品名称',
  `shop_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '店铺id',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品分类id',
  `category_id_1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '一级分类id',
  `category_id_2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '二级分类id',
  `category_id_3` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '三级分类id',
  `brand_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '品牌id',
  `group_id_array` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺分类id 首尾用,隔开',
  `promotion_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '促销类型 0无促销，1团购，2限时折扣',
  `promote_id` int(11) NOT NULL DEFAULT '0' COMMENT '促销活动ID',
  `goods_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '实物或虚拟商品标志 1实物商品 0 虚拟商品 2 F码商品',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `price` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '商品原价格',
  `promotion_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品促销价格',
  `cost_price` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '成本价',
  `point_exchange_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '积分兑换类型 0 非积分兑换 1 只能积分兑换 ',
  `point_exchange` int(11) NOT NULL DEFAULT '0' COMMENT '积分兑换',
  `give_point` int(11) NOT NULL DEFAULT '0' COMMENT '购买商品赠送积分',
  `is_member_discount` int(1) NOT NULL DEFAULT '0' COMMENT '参与会员折扣',
  `shipping_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费 0为免运费',
  `shipping_fee_id` int(11) NOT NULL DEFAULT '0' COMMENT '售卖区域id 物流模板id  ns_order_shipping_fee 表id',
  `stock` int(10) NOT NULL DEFAULT '0' COMMENT '商品库存',
  `max_buy` int(11) NOT NULL DEFAULT '0' COMMENT '限购 0 不限购',
  `clicks` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品点击数量',
  `min_stock_alarm` int(11) NOT NULL DEFAULT '0' COMMENT '库存预警值',
  `sales` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '销售数量',
  `collects` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数量',
  `star` tinyint(3) unsigned NOT NULL DEFAULT '5' COMMENT '好评星级',
  `evaluates` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评价数',
  `shares` int(11) NOT NULL DEFAULT '0' COMMENT '分享数',
  `province_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '一级地区id',
  `city_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '二级地区id',
  `picture` int(11) NOT NULL DEFAULT '0' COMMENT '商品主图',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '商品关键词',
  `introduction` varchar(255) NOT NULL DEFAULT '' COMMENT '商品简介，促销语',
  `description` text NOT NULL COMMENT '商品详情',
  `QRcode` varchar(255) NOT NULL DEFAULT '' COMMENT '商品二维码',
  `code` varchar(50) NOT NULL DEFAULT '' COMMENT '商家编号',
  `is_stock_visible` int(1) NOT NULL DEFAULT '0' COMMENT '页面不显示库存',
  `is_hot` int(1) NOT NULL DEFAULT '0' COMMENT '是否热销商品',
  `is_recommend` int(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `is_new` int(1) NOT NULL DEFAULT '0' COMMENT '是否新品',
  `is_pre_sale` int(1) NOT NULL DEFAULT '0' COMMENT '是否预售',
  `is_bill` int(1) NOT NULL DEFAULT '0' COMMENT '是否开具增值税发票 1是，0否',
  `state` tinyint(3) NOT NULL DEFAULT '1' COMMENT '商品状态 0下架，1正常，10违规（禁售）',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `img_id_array` varchar(1000) DEFAULT NULL COMMENT '商品图片序列',
  `sku_img_array` varchar(1000) DEFAULT NULL COMMENT '商品sku应用图片列表  属性,属性值，图片ID',
  `match_point` float(10,2) DEFAULT NULL COMMENT '实物与描述相符（根据评价计算）',
  `match_ratio` float(10,2) DEFAULT NULL COMMENT '实物与描述相符（根据评价计算）百分比',
  `real_sales` int(10) NOT NULL DEFAULT '0' COMMENT '实际销量',
  `goods_attribute_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品类型',
  `goods_spec_format` text NOT NULL COMMENT '商品规格',
  `goods_weight` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '商品重量',
  `goods_volume` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '商品体积',
  `shipping_fee_type` int(11) NOT NULL DEFAULT '1' COMMENT '计价方式1.重量2.体积3.计件',
  `extend_category_id` varchar(255) DEFAULT NULL,
  `extend_category_id_1` varchar(255) DEFAULT NULL,
  `extend_category_id_2` varchar(255) DEFAULT NULL,
  `extend_category_id_3` varchar(255) DEFAULT NULL,
  `supplier_id` int(11) NOT NULL DEFAULT '0' COMMENT '供货商id',
  `sale_date` int(11) DEFAULT '0' COMMENT '上下架时间',
  `create_time` int(11) DEFAULT '0' COMMENT '商品添加时间',
  `update_time` int(11) DEFAULT '0' COMMENT '商品编辑时间',
  `min_buy` int(11) NOT NULL DEFAULT '0' COMMENT '最少买几件'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='商品回收站表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_goods_deleted`
--

LOCK TABLES `ns_goods_deleted` WRITE;
/*!40000 ALTER TABLE `ns_goods_deleted` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_goods_deleted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_goods_evaluate`
--

DROP TABLE IF EXISTS `ns_goods_evaluate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_goods_evaluate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评价ID',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `order_no` bigint(20) unsigned NOT NULL COMMENT '订单编号',
  `order_goods_id` int(11) NOT NULL COMMENT '订单项ID',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `goods_name` varchar(100) NOT NULL COMMENT '商品名称',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `goods_image` varchar(255) NOT NULL DEFAULT '' COMMENT '商品图片',
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `shop_name` varchar(100) NOT NULL COMMENT '店铺名称',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '评价内容',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '评价图片',
  `explain_first` varchar(255) NOT NULL DEFAULT '' COMMENT '解释内容',
  `member_name` varchar(100) NOT NULL DEFAULT '' COMMENT '评价人名称',
  `uid` int(11) NOT NULL COMMENT '评价人编号',
  `is_anonymous` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0表示不是 1表示是匿名评价',
  `scores` tinyint(1) NOT NULL COMMENT '1-5分',
  `again_content` varchar(255) NOT NULL DEFAULT '' COMMENT '追加评价内容',
  `again_image` varchar(255) NOT NULL DEFAULT '' COMMENT '追加评价图片',
  `again_explain` varchar(255) NOT NULL DEFAULT '' COMMENT '追加解释内容',
  `explain_type` int(11) DEFAULT '0' COMMENT '1好评2中评3差评',
  `is_show` int(1) DEFAULT '1' COMMENT '1显示 0隐藏',
  `addtime` int(11) DEFAULT '0' COMMENT '评价时间',
  `again_addtime` int(11) DEFAULT '0' COMMENT '追加评价时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1489 COMMENT='商品评价表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_goods_evaluate`
--

LOCK TABLES `ns_goods_evaluate` WRITE;
/*!40000 ALTER TABLE `ns_goods_evaluate` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_goods_evaluate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_goods_group`
--

DROP TABLE IF EXISTS `ns_goods_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_goods_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `group_name` varchar(50) NOT NULL DEFAULT '' COMMENT '分类名称',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '上级id 最多2级',
  `level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '级别',
  `is_visible` int(1) NOT NULL DEFAULT '1' COMMENT '是否可视',
  `group_pic` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=160 COMMENT='商品本店分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_goods_group`
--

LOCK TABLES `ns_goods_group` WRITE;
/*!40000 ALTER TABLE `ns_goods_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_goods_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_goods_sku`
--

DROP TABLE IF EXISTS `ns_goods_sku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_goods_sku` (
  `sku_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表序号',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品编号',
  `sku_name` varchar(500) NOT NULL DEFAULT '' COMMENT 'SKU名称',
  `attr_value_items` varchar(255) NOT NULL DEFAULT '' COMMENT '属性和属性值 id串 attribute + attribute value 表ID分号分隔',
  `attr_value_items_format` varchar(500) NOT NULL DEFAULT '' COMMENT '属性和属性值id串组合json格式',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `promote_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '促销价格',
  `cost_price` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '成本价',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存',
  `picture` int(11) NOT NULL DEFAULT '0' COMMENT '如果是第一个sku编码, 可以加图片',
  `code` varchar(255) NOT NULL DEFAULT '' COMMENT '商家编码',
  `QRcode` varchar(255) NOT NULL DEFAULT '' COMMENT '商品二维码',
  `create_date` int(11) DEFAULT '0' COMMENT '创建时间',
  `update_date` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=481 COMMENT='商品skui规格价格库存信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_goods_sku`
--

LOCK TABLES `ns_goods_sku` WRITE;
/*!40000 ALTER TABLE `ns_goods_sku` DISABLE KEYS */;
INSERT INTO `ns_goods_sku` VALUES (1,1,'','','',0.00,30.00,30.00,0.00,1000,0,'','',1543999356,1544255961),(2,2,'','','',0.00,30.00,30.00,0.00,998,0,'','',1544087845,1544255974),(3,3,'','','',0.00,40.00,40.00,0.00,1000,0,'','',1544088213,0),(4,4,'','','',0.00,5.00,5.00,0.00,1000,0,'','',1544088525,0),(5,5,'','','',0.00,288.00,288.00,0.00,998,0,'','',1544088837,0);
/*!40000 ALTER TABLE `ns_goods_sku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_goods_sku_deleted`
--

DROP TABLE IF EXISTS `ns_goods_sku_deleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_goods_sku_deleted` (
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '表序号',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品编号',
  `sku_name` varchar(500) NOT NULL DEFAULT '' COMMENT 'SKU名称',
  `attr_value_items` varchar(255) NOT NULL DEFAULT '' COMMENT '属性和属性值 id串 attribute + attribute value 表ID分号分隔',
  `attr_value_items_format` varchar(500) NOT NULL DEFAULT '' COMMENT '属性和属性值id串组合json格式',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `promote_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '促销价格',
  `cost_price` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '成本价',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存',
  `picture` int(11) NOT NULL DEFAULT '0' COMMENT '如果是第一个sku编码, 可以加图片',
  `code` varchar(255) NOT NULL DEFAULT '' COMMENT '商家编码',
  `QRcode` varchar(255) NOT NULL DEFAULT '' COMMENT '商品二维码',
  `create_date` int(11) DEFAULT '0' COMMENT '创建时间',
  `update_date` int(11) DEFAULT '0' COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1638 COMMENT='商品skui规格价格库存信息回收站表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_goods_sku_deleted`
--

LOCK TABLES `ns_goods_sku_deleted` WRITE;
/*!40000 ALTER TABLE `ns_goods_sku_deleted` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_goods_sku_deleted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_goods_sku_picture`
--

DROP TABLE IF EXISTS `ns_goods_sku_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_goods_sku_picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `spec_id` int(11) NOT NULL DEFAULT '0' COMMENT '主规格id',
  `spec_value_id` int(11) NOT NULL DEFAULT '0' COMMENT '规格值id',
  `sku_img_array` varchar(1000) NOT NULL DEFAULT '' COMMENT '图片id 多个用逗号隔开',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品sku多图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_goods_sku_picture`
--

LOCK TABLES `ns_goods_sku_picture` WRITE;
/*!40000 ALTER TABLE `ns_goods_sku_picture` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_goods_sku_picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_goods_sku_picture_delete`
--

DROP TABLE IF EXISTS `ns_goods_sku_picture_delete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_goods_sku_picture_delete` (
  `id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `spec_id` int(11) NOT NULL DEFAULT '0' COMMENT '主规格id',
  `spec_value_id` int(11) NOT NULL DEFAULT '0' COMMENT '规格值id',
  `sku_img_array` varchar(1000) NOT NULL DEFAULT '' COMMENT '图片id 多个用逗号隔开',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096 COMMENT='商品sku多图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_goods_sku_picture_delete`
--

LOCK TABLES `ns_goods_sku_picture_delete` WRITE;
/*!40000 ALTER TABLE `ns_goods_sku_picture_delete` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_goods_sku_picture_delete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_goods_spec`
--

DROP TABLE IF EXISTS `ns_goods_spec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_goods_spec` (
  `spec_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '属性ID',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `spec_name` varchar(255) NOT NULL DEFAULT '' COMMENT '属性名称',
  `is_visible` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可视',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `show_type` int(11) NOT NULL DEFAULT '1' COMMENT '展示方式 1 文字 2 颜色 3 图片',
  `create_time` int(11) DEFAULT '0' COMMENT '创建日期',
  `is_screen` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否参与筛选 0 不参与 1 参与',
  PRIMARY KEY (`spec_id`),
  KEY `IDX_category_props_categoryId` (`shop_id`),
  KEY `IDX_category_props_orders` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=3276 COMMENT='商品属性（规格）表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_goods_spec`
--

LOCK TABLES `ns_goods_spec` WRITE;
/*!40000 ALTER TABLE `ns_goods_spec` DISABLE KEYS */;
INSERT INTO `ns_goods_spec` VALUES (1,0,'长',1,0,1,1544087716,0);
/*!40000 ALTER TABLE `ns_goods_spec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_goods_spec_value`
--

DROP TABLE IF EXISTS `ns_goods_spec_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_goods_spec_value` (
  `spec_value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品属性值ID',
  `spec_id` int(11) NOT NULL COMMENT '商品属性ID',
  `spec_value_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品属性值名称',
  `spec_value_data` varchar(255) NOT NULL DEFAULT '' COMMENT '商品属性值数据',
  `is_visible` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可视',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) DEFAULT '0',
  PRIMARY KEY (`spec_value_id`),
  KEY `IDX_category_propvalues_c_pId` (`spec_id`),
  KEY `IDX_category_propvalues_orders` (`sort`),
  KEY `IDX_category_propvalues_value` (`spec_value_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1092 COMMENT='商品规格值模版表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_goods_spec_value`
--

LOCK TABLES `ns_goods_spec_value` WRITE;
/*!40000 ALTER TABLE `ns_goods_spec_value` DISABLE KEYS */;
INSERT INTO `ns_goods_spec_value` VALUES (1,1,'120cm','',1,0,1544087780);
/*!40000 ALTER TABLE `ns_goods_spec_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_member`
--

DROP TABLE IF EXISTS `ns_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_member` (
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `member_name` varchar(50) NOT NULL DEFAULT '' COMMENT '前台用户名',
  `member_level` int(11) NOT NULL DEFAULT '47' COMMENT '会员等级',
  `memo` varchar(1000) DEFAULT NULL COMMENT '备注',
  `reg_time` int(11) DEFAULT '0' COMMENT '注册时间',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=147 COMMENT='前台用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_member`
--

LOCK TABLES `ns_member` WRITE;
/*!40000 ALTER TABLE `ns_member` DISABLE KEYS */;
INSERT INTO `ns_member` VALUES (1,'admin',47,'',2017),(3073,'xushuqing',51,NULL,1544000816),(3074,'zhouhaiyun',47,NULL,1544001195),(3075,'xusq',47,NULL,1544003427),(3078,'zhy',47,NULL,1544005031),(3348,'任卉洁',47,'江苏无锡滨湖海岸城中心',1544233687),(3349,'斯玛特扬州广陵区中集文昌中心',47,'江苏扬州广陵中集文昌商业中心',1544233687),(3350,'江苏南京建邺奥体中心',47,'江苏南京建邺奥体中心',1544233687),(3351,'广东惠州四季商业中心',47,'广东惠州四季商业中心',1544233687),(3352,'甘肃庆阳西峰中心',47,'甘肃庆阳西峰中心',1544233687),(3353,'阿拉尔管理员',47,'新疆阿拉尔领先商业街中心',1544233687),(3354,'吴文勤',47,'安徽黄山屯溪玉屏府中心',1544233687),(3355,'辽宁铁岭银州中心',47,'辽宁铁岭银州中心',1544233687),(3356,'吉林四平公主岭岭西紫金星城中心',47,'吉林四平公主岭岭西紫金星城中心',1544233687),(3357,'山东曲阜星光天地中心',47,'山东曲阜星光天地中心',1544233687),(3358,'山东菏泽曹县中心',47,'山东菏泽曹县中心',1544233687),(3359,'山东菏泽定陶中心',47,'山东菏泽定陶中心',1544233687),(3360,'贵州贵阳小河缤纷中心',47,'贵州贵阳小河缤纷中心',1544233687),(3361,'贵州贵阳云岩586中心',47,'贵州贵阳云岩586中心',1544233687),(3362,'贵阳金融城恒大中央公园中心',47,'贵阳金融城恒大中央公园中心',1544233687),(3363,'天津南开天拖美坪园中心',47,'天津南开天拖美坪园中心',1544233687),(3364,'张菁',47,'湖北武汉青山奥山世纪城中心',1544233687),(3365,'湖北武汉洪山泛悦坊都会中心',47,'湖北武汉洪山泛悦坊都会中心',1544233687),(3366,'青海西宁城西万达中心',47,'青海西宁城西万达中心',1544233687),(3367,'Kitty',47,'陕西西安长安大学城中心',1544233687),(3368,'河北邢台隆尧中心',47,'河北邢台隆尧中心',1544233687),(3369,'河北保定满城惠友中心',47,'河北保定满城惠友中心',1544233687),(3370,'湖南长沙雨花丰升德润中心',47,'湖南长沙雨花丰升德润中心',1544233688),(3371,'浙江嘉兴桐乡吾悦广场中心',47,'浙江嘉兴桐乡吾悦广场中心',1544233688),(3372,'浙江嘉兴嘉善中心',47,'浙江嘉兴嘉善中心',1544233688),(3373,'浙江金华兰溪溪西',47,'浙江金华兰溪溪西',1544233688),(3374,'浙江宁波慈溪中心',47,'浙江宁波慈溪中心',1544233688),(3375,'浙江绍兴柯桥中心',47,'浙江绍兴柯桥中心',1544233688),(3376,'四川成都简阳万安山峰中心',47,'四川成都简阳万安山峰中心',1544233688),(3377,'河南郑州郑东新区中心',47,'河南郑州郑东新区中心',1544233688),(3378,'河南安阳景诗雅苑中心 ',47,'河南安阳景诗雅苑中心 ',1544233688),(3379,'马培军',47,'河南许昌长葛伊顿公馆中心',1544233688),(3380,'韩老师',47,'广西省柳州河东中心',1544233688),(3381,'江西萍乡莲花富丽花苑中心',47,'江西萍乡莲花富丽花苑中心',1544233688),(3382,'重庆渝中中心',47,'重庆渝中中心',1544233688),(3383,'广西南宁江南中心',47,'广西南宁江南中心',1544233688),(3384,'河南长葛中心',47,'河南长葛中心',1544233688),(3385,'桂仪锋',47,'江西九江铜锣湾中心',1544233688),(3386,'江苏常州武进御城中心',47,'江苏常州武进御城中心',1544233688),(3387,'冯丹丹',47,'吉林通化东昌区丽景中心',1544233688),(3388,'湖南怀化鹤城锦绣五溪广场中心',47,'湖南怀化鹤城锦绣五溪广场中心',1544233689),(3389,'郭新民',47,' 河北承德双桥德汇大厦中心',1544233689),(3390,'河北邯郸永年时代广场中心',47,'河北邯郸永年时代广场中心',1544233689),(3391,'河北承德平泉中心',47,'河北承德平泉中心',1544233689),(3392,'河北保定定州实验高中中心',47,'河北保定定州实验高中中心',1544233689),(3393,'浙江温州龙湾中心',47,'浙江温州龙湾中心',1544233689),(3394,'浙江绍兴上虞大通购物广场',47,'浙江绍兴上虞大通购物广场',1544233689),(3395,'浙江金华东阳银泰城中心',47,'浙江金华东阳银泰城中心',1544233689),(3396,'浙江温州鹿城中心',47,'浙江温州鹿城中心',1544233689),(3397,'河北唐山曹妃甸中心',47,'河北唐山曹妃甸中心',1544233689),(3398,'北京良乡北潞园中心',47,'北京良乡北潞园中心',1544233689),(3399,'江西南昌象湖新城中心 ',47,'江西南昌象湖新城中心 ',1544233689),(3400,'河南驻马店驿城CBD中心',47,'河南驻马店驿城CBD中心',1544233689),(3401,'耿康',47,'河北邯郸丛台连城中心',1544233689),(3402,'江苏常州溧阳万达广场中心',47,'江苏常州溧阳万达广场中心',1544233689),(3403,'辽宁阜新海州和平路中心',47,'辽宁阜新海州和平路中心',1544233689),(3404,'内蒙古赤峰红山万达广场中心',47,'内蒙古赤峰红山万达广场中心',1544233689),(3405,' 安徽蚌埠固镇中心',47,' 安徽蚌埠固镇中心',1544233689),(3406,'河北邢台巨鹿中心',47,'河北邢台巨鹿中心',1544233689),(3407,'河北张家口张北新世纪中心',47,'河北张家口张北新世纪中心',1544233689),(3408,'湖南衡阳耒阳金阳路中心',47,'湖南衡阳耒阳金阳路中心',1544233689),(3409,'山东济宁微山中心',47,'山东济宁微山中心',1544233690),(3410,'山东临沂平邑中心',47,'山东临沂平邑中心',1544233690),(3411,'北京海淀万柳中心',47,'北京海淀万柳碧水云天中心',1544233690),(3412,'河南洛阳宜阳锦花中心 ',47,'河南洛阳宜阳锦花中心 ',1544233690),(3413,'河南商丘睢阳中心',47,'河南商丘睢阳中心',1544233690),(3414,'河南焦作王府井中心',47,'河南焦作王府井中心',1544233690),(3415,'河南开封开元广场中心',47,'河南开封开元广场中心',1544233690),(3416,'福建泉州石狮中心',47,'福建泉州石狮中心',1544233690),(3417,'万隽',47,'四川乐山市中区美加中心',1544233690),(3418,'黄丽君',47,'福建福州晋安中心',1544233690),(3419,'高礼燕',47,'山东临沂临沭中心',1544233690),(3420,'河北石家庄长安阿尔卡迪亚中心',47,'河北石家庄长安阿尔卡迪亚中心',1544233690),(3421,'河北衡水冀州都会城中心',47,'河北衡水冀州都会城中心',1544233690),(3422,' 尤晓玉',47,'河北唐山滦南正通中心',1544233690),(3423,'山东临沂沂水中心',47,'山东临沂沂水中心',1544233690),(3424,'山东聊城东昌府鸿顺中心',47,'山东聊城东昌府鸿顺中心',1544233690),(3425,'山东青岛胶州香港花园中心',47,'山东青岛胶州香港花园中心',1544233690),(3426,'山东菏泽单县中心',47,'山东菏泽单县中心',1544233690),(3427,'山东东营广饶中心',47,'山东东营广饶中心',1544233690),(3428,'张伟',47,'山东东营万达中心',1544233690),(3429,'天津津南首创中心',47,'天津津南首创中心',1544233690),(3430,'云南保山腾冲腾越中心',47,'云南保山腾冲腾越中心',1544233690),(3431,' 河南漯河会展中心',47,' 河南漯河会展中心',1544233690),(3432,'山西阳泉盂县中心',47,'山西阳泉盂县中心',1544233690),(3433,'福建厦门湖里301中心',47,'福建厦门湖里宝龙一城中心',1544233690),(3434,'宁夏银川贺兰中心',47,'宁夏银川贺兰中心',1544233690),(3435,'安徽合肥蜀山天h中心',47,'安徽合肥蜀山中心',1544233691),(3436,'安徽芜湖鸠江公园大道中心',47,'安徽芜湖鸠江公园大道中心',1544233691),(3437,'江苏镇江润州美的城中心',47,'江苏镇江润州美的城中心',1544233691),(3438,'江苏扬州邗江万达中心',47,'江苏扬州邗江万达中心',1544233691),(3439,'上海闵行龙柏中心',47,'上海闵行龙柏中心',1544233691),(3440,'吉林吉林丰满水韵名城中心',47,'吉林吉林丰满水韵名城中心',1544233691),(3441,'内蒙古通辽科尔沁中心',47,'内蒙古通辽科尔沁中心',1544233691),(3442,'宁夏银川兴庆中心',47,'宁夏银川兴庆中心',1544233691),(3443,'广东佛山顺德乐从中心  ',47,'广东佛山顺德乐从中心  ',1544233691),(3444,'广东深圳南山蛇口海上世界中心',47,'广东深圳南山蛇口海上世界中心',1544233691),(3445,'广东东莞厚街',47,'广东东莞厚街',1544233691),(3446,'天津津南首创中心',47,'天津津南首创中心',1544233691),(3447,'园长',47,'黑龙江哈尔滨松北万达中心',1544233691),(3448,'山东淄博临淄凤凰城中心',47,'山东淄博临淄凤凰城中心',1544233691),(3449,'辽宁朝阳双塔天盛嘉苑中心',47,'辽宁朝阳双塔天盛嘉苑中心',1544233691),(3450,'123123',47,'123123',1544233691),(3451,'福建厦门翔安泰禾中心',47,'福建厦门翔安泰禾中心',1544233691),(3452,'广东韶关武江太阳城中心',47,'广东韶关武江太阳城中心',1544233691),(3453,'广东韶关浈江凤凰城中心',47,'广东韶关浈江凤凰城中心',1544233691),(3454,'山东青岛莱西香港路中心',47,'山东青岛莱西香港路中心',1544233691),(3455,'天津武清荔隆中心',47,'天津武清荔隆中心',1544233691),(3456,'天津河西田园商业广场中心',47,'天津河西田园商业广场中心',1544233691),(3457,'天津武清创意米兰中心',47,'天津武清创意米兰中心',1544233691),(3458,'张琴',47,'上海宝山宝龙广场中心',1544233692),(3459,'云南红河弥勒中心',47,'云南红河弥勒中心',1544233692),(3460,'天津塘沽金水畔广场中心',47,'天津塘沽金水畔广场中心',1544233692),(3461,'安徽合肥巢湖华邦书香里中心',47,'安徽合肥巢湖华邦书香里中心',1544233692),(3462,'河南信阳浉河中心  ',47,'河南信阳浉河中心  ',1544233692),(3463,'上海浦东新区惠南中心',47,'上海浦东新区惠南中心',1544233692),(3464,'辽宁锦州太和万达中心',47,'辽宁锦州太和万达中心',1544233692),(3465,'河南南阳宛城华鑫商务中心',47,'河南南阳宛城华鑫商务中心',1544233692),(3466,'陕西咸阳秦都玉景台中心',47,'陕西咸阳秦都玉景台中心',1544233692),(3467,'河北唐山玉田县中心',47,'河北唐山玉田县中心',1544233692),(3468,'河北沧州黄骅中捷友谊广场中心',47,'河北沧州黄骅中捷友谊广场中心',1544233692),(3469,'河北衡水安平中心',47,'河北衡水安平中心',1544233692),(3470,'河北衡水武邑县中心',47,'河北衡水武邑县中心',1544233692),(3471,'河北石家庄裕华中心',47,'河北石家庄裕华中心',1544233692),(3472,'河北唐山路北汇金中心',47,'河北唐山路北汇金中心',1544233692),(3473,'河南济源济中心',47,'河南济源济中心',1544233692),(3474,'江苏宜兴官林尚岛豪庭中心',47,'江苏宜兴官林尚岛豪庭中心',1544233692),(3475,'陕西安康汉滨金坊国际中心',47,'陕西安康汉滨金坊国际中心',1544233693),(3476,'上海浦东新区博硕创意园中心',47,'上海浦东新区博硕创意园中心',1544233693),(3477,'吉林长春高新富强天玺中心',47,'吉林长春高新富强天玺中心',1544233693),(3478,'江苏南京栖霞万达中心',47,'江苏南京栖霞万达中心',1544233693),(3479,'李实',47,'江苏宿迁宿城区中远现代城中心',1544233693),(3480,'宁夏银川吉泰润园中心',47,'宁夏银川吉泰润园中心',1544233693),(3481,'shizhi01',47,NULL,1544235945),(3482,'shizhi02',47,NULL,1544236302),(3484,'shizhi05',47,NULL,1544237240),(3485,'shizhi06',47,NULL,1544237334),(3486,'miaohua',47,NULL,1544513701);
/*!40000 ALTER TABLE `ns_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_member_account`
--

DROP TABLE IF EXISTS `ns_member_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_member_account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '会员uid',
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `point` int(11) NOT NULL DEFAULT '0' COMMENT '会员积分',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '购物币',
  `member_cunsum` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '会员消费',
  `member_sum_point` int(11) NOT NULL DEFAULT '0' COMMENT '会员累计积分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=3276 COMMENT='会员账户统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_member_account`
--

LOCK TABLES `ns_member_account` WRITE;
/*!40000 ALTER TABLE `ns_member_account` DISABLE KEYS */;
INSERT INTO `ns_member_account` VALUES (1,3073,0,1,0.00,0,0.00,1);
/*!40000 ALTER TABLE `ns_member_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_member_account_records`
--

DROP TABLE IF EXISTS `ns_member_account_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_member_account_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `account_type` int(11) NOT NULL DEFAULT '1' COMMENT '账户类型1.积分2.余额3.购物币',
  `sign` smallint(6) NOT NULL DEFAULT '1' COMMENT '正负号',
  `number` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '数量',
  `from_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '产生方式1.商城订单2.订单退还3.兑换4.充值5.签到6.分享7.注册8.提现9提现退还',
  `data_id` int(11) NOT NULL DEFAULT '0' COMMENT '相关表的数据ID',
  `text` varchar(255) NOT NULL DEFAULT '' COMMENT '数据相关内容描述文本',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=108 COMMENT='会员流水账表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_member_account_records`
--

LOCK TABLES `ns_member_account_records` WRITE;
/*!40000 ALTER TABLE `ns_member_account_records` DISABLE KEYS */;
INSERT INTO `ns_member_account_records` VALUES (1,3073,0,1,1,0.00,19,0,'点赞赠送积分',1544134156),(2,3073,0,1,1,0.00,19,0,'点赞赠送积分',1544176884),(3,3073,0,1,1,1.00,19,0,'点赞赠送积分',1544309237);
/*!40000 ALTER TABLE `ns_member_account_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_member_balance_withdraw`
--

DROP TABLE IF EXISTS `ns_member_balance_withdraw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_member_balance_withdraw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL COMMENT '店铺编号',
  `withdraw_no` varchar(255) NOT NULL DEFAULT '' COMMENT '提现流水号',
  `uid` int(11) NOT NULL COMMENT '会员id',
  `bank_name` varchar(50) NOT NULL COMMENT '提现银行名称',
  `account_number` varchar(50) NOT NULL COMMENT '提现银行账号',
  `realname` varchar(10) NOT NULL COMMENT '提现账户姓名',
  `mobile` varchar(20) NOT NULL COMMENT '手机',
  `cash` decimal(10,2) NOT NULL COMMENT '提现金额',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '当前状态 0已申请(等待处理) 1已同意 -1 已拒绝',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `ask_for_date` int(11) DEFAULT '0' COMMENT '提现日期',
  `payment_date` int(11) DEFAULT '0' COMMENT '到账日期',
  `modify_date` int(11) DEFAULT '0' COMMENT '修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096 COMMENT='会员余额提现记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_member_balance_withdraw`
--

LOCK TABLES `ns_member_balance_withdraw` WRITE;
/*!40000 ALTER TABLE `ns_member_balance_withdraw` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_member_balance_withdraw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_member_bank_account`
--

DROP TABLE IF EXISTS `ns_member_bank_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_member_bank_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '会员id',
  `bank_type` varchar(50) NOT NULL DEFAULT '1' COMMENT '账号类型 1银行卡2支付宝',
  `branch_bank_name` varchar(50) DEFAULT NULL COMMENT '支行信息',
  `realname` varchar(50) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `account_number` varchar(50) NOT NULL DEFAULT '' COMMENT '银行账号',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `is_default` int(11) NOT NULL DEFAULT '0' COMMENT '是否默认账号',
  `create_date` int(11) DEFAULT '0' COMMENT '创建日期',
  `modify_date` int(11) DEFAULT '0' COMMENT '修改日期',
  PRIMARY KEY (`id`),
  KEY `IDX_member_bank_account_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='会员提现账号';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_member_bank_account`
--

LOCK TABLES `ns_member_bank_account` WRITE;
/*!40000 ALTER TABLE `ns_member_bank_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_member_bank_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_member_express_address`
--

DROP TABLE IF EXISTS `ns_member_express_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_member_express_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '会员基本资料表ID',
  `consigner` varchar(255) NOT NULL DEFAULT '' COMMENT '收件人',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机',
  `phone` varchar(20) NOT NULL DEFAULT '' COMMENT '固定电话',
  `province` int(11) NOT NULL DEFAULT '0' COMMENT '省',
  `city` int(11) NOT NULL DEFAULT '0' COMMENT '市',
  `district` int(11) NOT NULL DEFAULT '0' COMMENT '区县',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `zip_code` varchar(6) NOT NULL DEFAULT '' COMMENT '邮编',
  `alias` varchar(50) NOT NULL DEFAULT '' COMMENT '地址别名',
  `is_default` int(11) NOT NULL DEFAULT '0' COMMENT '默认收货地址',
  PRIMARY KEY (`id`),
  KEY `IDX_member_express_address_uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2340 COMMENT='会员收货地址管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_member_express_address`
--

LOCK TABLES `ns_member_express_address` WRITE;
/*!40000 ALTER TABLE `ns_member_express_address` DISABLE KEYS */;
INSERT INTO `ns_member_express_address` VALUES (1,3073,'徐舒青','17727750995','',19,199,1769,'清水河街道10a05','','',0),(2,3073,'周海云','18270717192','',19,199,1770,'景新花园','','',1),(3,3215,'史智','18071575136','',19,199,1772,'1111','','',1);
/*!40000 ALTER TABLE `ns_member_express_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_member_favorites`
--

DROP TABLE IF EXISTS `ns_member_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_member_favorites` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `fav_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品或店铺ID',
  `fav_type` varchar(20) NOT NULL DEFAULT 'goods' COMMENT '类型:goods为商品,shop为店铺,默认为商品',
  `shop_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `shop_name` varchar(20) NOT NULL DEFAULT '' COMMENT '店铺名称',
  `shop_logo` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺logo',
  `goods_name` varchar(50) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_image` varchar(300) DEFAULT NULL,
  `log_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品收藏时价格',
  `log_msg` varchar(1000) NOT NULL DEFAULT '' COMMENT '收藏备注',
  `fav_time` int(11) DEFAULT '0' COMMENT '收藏时间',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_member_favorites`
--

LOCK TABLES `ns_member_favorites` WRITE;
/*!40000 ALTER TABLE `ns_member_favorites` DISABLE KEYS */;
INSERT INTO `ns_member_favorites` VALUES (1,3073,2,'goods',0,'斯玛特商场','upload/common/1543908623.png','斯玛特笔帘','upload/goods/20181206/fd8fe76eada28a96964b322ab562f6a83.jpg',30.00,'斯玛特笔帘',1544089996);
/*!40000 ALTER TABLE `ns_member_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_member_gift`
--

DROP TABLE IF EXISTS `ns_member_gift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_member_gift` (
  `gift_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) NOT NULL COMMENT '会员ID',
  `promotion_gift_id` int(11) NOT NULL COMMENT '赠品活动ID',
  `goods_id` int(11) NOT NULL COMMENT '赠品ID',
  `goods_name` varchar(255) NOT NULL DEFAULT '' COMMENT '赠品名称',
  `goods_picture` int(11) NOT NULL DEFAULT '0' COMMENT '赠品图片',
  `num` int(11) NOT NULL DEFAULT '1' COMMENT '赠品数量',
  `get_type` int(11) NOT NULL DEFAULT '1' COMMENT '获取方式',
  `get_type_id` int(11) NOT NULL COMMENT '获取方式对应ID',
  `desc` text NOT NULL COMMENT '说明',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`gift_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员赠品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_member_gift`
--

LOCK TABLES `ns_member_gift` WRITE;
/*!40000 ALTER TABLE `ns_member_gift` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_member_gift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_member_level`
--

DROP TABLE IF EXISTS `ns_member_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_member_level` (
  `level_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '等级ID',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `level_name` varchar(50) NOT NULL DEFAULT '' COMMENT '等级名称',
  `min_integral` int(11) NOT NULL DEFAULT '0' COMMENT '累计积分',
  `goods_discount` decimal(3,2) NOT NULL DEFAULT '1.00' COMMENT '折扣率',
  `desc` varchar(1000) NOT NULL DEFAULT '' COMMENT '等级描述',
  `is_default` int(11) NOT NULL DEFAULT '0' COMMENT '是否是默认',
  `quota` int(11) NOT NULL DEFAULT '0' COMMENT '消费额度',
  `upgrade` int(11) NOT NULL COMMENT '升级条件  1.累计积分 2.消费额度 3.同时满足',
  `relation` int(11) NOT NULL DEFAULT '1' COMMENT '1.或 2. 且',
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='会员等级';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_member_level`
--

LOCK TABLES `ns_member_level` WRITE;
/*!40000 ALTER TABLE `ns_member_level` DISABLE KEYS */;
INSERT INTO `ns_member_level` VALUES (47,0,'普通会员',0,1.00,'',1,0,0,2),(48,0,'铜牌会员',0,0.95,'',0,1999,2,1),(49,0,'银牌会员',0,0.90,'',0,9999,2,1),(50,0,'金牌会员',0,0.85,'',0,29999,2,1),(51,0,'砖石会员',0,0.80,'',0,30000,2,1);
/*!40000 ALTER TABLE `ns_member_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_member_recharge`
--

DROP TABLE IF EXISTS `ns_member_recharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_member_recharge` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recharge_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '支付金额',
  `uid` varchar(255) NOT NULL COMMENT '用户uid',
  `out_trade_no` varchar(255) NOT NULL DEFAULT '' COMMENT '支付流水号',
  `create_time` varchar(255) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `is_pay` varchar(255) NOT NULL DEFAULT '0' COMMENT '是否支付',
  `status` varchar(255) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='会员充值余额记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_member_recharge`
--

LOCK TABLES `ns_member_recharge` WRITE;
/*!40000 ALTER TABLE `ns_member_recharge` DISABLE KEYS */;
INSERT INTO `ns_member_recharge` VALUES (1,1000.00,'3073','1544513804','0','0','0');
/*!40000 ALTER TABLE `ns_member_recharge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_notice`
--

DROP TABLE IF EXISTS `ns_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告id',
  `notice_title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `notice_content` text NOT NULL COMMENT '公告内容',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='店铺公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_notice`
--

LOCK TABLES `ns_notice` WRITE;
/*!40000 ALTER TABLE `ns_notice` DISABLE KEYS */;
INSERT INTO `ns_notice` VALUES (1,'2018年双12大促','&lt;p&gt;2018年双12大促&lt;/p&gt;&lt;p&gt;2018年双12大促&lt;/p&gt;&lt;p&gt;2018年双12大促&lt;/p&gt;',0,0,1544170366,0),(2,'首页公告二','&lt;p&gt;首页公告二&lt;/p&gt;',0,1,1544261546,0);
/*!40000 ALTER TABLE `ns_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_offpay_area`
--

DROP TABLE IF EXISTS `ns_offpay_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_offpay_area` (
  `shop_id` int(11) DEFAULT NULL COMMENT '店铺Id',
  `province_id` text COMMENT '省Id组合',
  `city_id` text COMMENT '市Id组合',
  `district_id` text COMMENT '县Id组合'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='货到付款支持地区表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_offpay_area`
--

LOCK TABLES `ns_offpay_area` WRITE;
/*!40000 ALTER TABLE `ns_offpay_area` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_offpay_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_order`
--

DROP TABLE IF EXISTS `ns_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_no` varchar(255) DEFAULT '' COMMENT '订单编号',
  `out_trade_no` varchar(100) NOT NULL DEFAULT '0' COMMENT '外部交易号',
  `order_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '订单类型',
  `payment_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '支付类型。取值范围：\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nWEIXIN (微信自有支付)\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nWEIXIN_DAIXIAO (微信代销支付)\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nALIPAY (支付宝支付)',
  `shipping_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '订单配送方式',
  `order_from` varchar(255) NOT NULL DEFAULT '' COMMENT '订单来源',
  `buyer_id` int(11) NOT NULL COMMENT '买家id',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '买家会员名称',
  `buyer_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '买家ip',
  `buyer_message` varchar(255) NOT NULL DEFAULT '' COMMENT '买家附言',
  `buyer_invoice` varchar(255) NOT NULL DEFAULT '' COMMENT '买家发票信息',
  `receiver_mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '收货人的手机号码',
  `receiver_province` int(11) NOT NULL COMMENT '收货人所在省',
  `receiver_city` int(11) NOT NULL COMMENT '收货人所在城市',
  `receiver_district` int(11) NOT NULL COMMENT '收货人所在街道',
  `receiver_address` varchar(255) NOT NULL DEFAULT '' COMMENT '收货人详细地址',
  `receiver_zip` varchar(6) NOT NULL DEFAULT '' COMMENT '收货人邮编',
  `receiver_name` varchar(50) NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `shop_id` int(11) NOT NULL COMMENT '卖家店铺id',
  `shop_name` varchar(100) NOT NULL DEFAULT '' COMMENT '卖家店铺名称',
  `seller_star` tinyint(4) NOT NULL DEFAULT '0' COMMENT '卖家对订单的标注星标',
  `seller_memo` varchar(255) NOT NULL DEFAULT '' COMMENT '卖家对订单的备注',
  `consign_time_adjust` int(11) NOT NULL DEFAULT '0' COMMENT '卖家延迟发货时间',
  `goods_money` decimal(19,2) NOT NULL COMMENT '商品总价',
  `order_money` decimal(10,2) NOT NULL COMMENT '订单总价',
  `point` int(11) NOT NULL COMMENT '订单消耗积分',
  `point_money` decimal(10,2) NOT NULL COMMENT '订单消耗积分抵多少钱',
  `coupon_money` decimal(10,2) NOT NULL COMMENT '订单代金券支付金额',
  `coupon_id` int(11) NOT NULL COMMENT '订单代金券id',
  `user_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单余额支付金额',
  `user_platform_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '用户平台余额支付',
  `promotion_money` decimal(10,2) NOT NULL COMMENT '订单优惠活动金额',
  `shipping_money` decimal(10,2) NOT NULL COMMENT '订单运费',
  `pay_money` decimal(10,2) NOT NULL COMMENT '订单实付金额',
  `refund_money` decimal(10,2) NOT NULL COMMENT '订单退款金额',
  `coin_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '购物币金额',
  `give_point` int(11) NOT NULL COMMENT '订单赠送积分',
  `give_coin` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单成功之后返购物币',
  `order_status` tinyint(4) NOT NULL COMMENT '订单状态',
  `pay_status` tinyint(4) NOT NULL COMMENT '订单付款状态',
  `shipping_status` tinyint(4) NOT NULL COMMENT '订单配送状态',
  `review_status` tinyint(4) NOT NULL COMMENT '订单评价状态',
  `feedback_status` tinyint(4) NOT NULL COMMENT '订单维权状态',
  `is_evaluate` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否评价 0为未评价 1为已评价 2为已追评',
  `tax_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `shipping_company_id` int(11) NOT NULL DEFAULT '0' COMMENT '配送物流公司ID',
  `give_point_type` int(11) NOT NULL DEFAULT '1' COMMENT '积分返还类型 1 订单完成  2 订单收货 3  支付订单',
  `pay_time` int(11) DEFAULT '0' COMMENT '订单付款时间',
  `shipping_time` int(11) DEFAULT '0' COMMENT '买家要求配送时间',
  `sign_time` int(11) DEFAULT '0' COMMENT '买家签收时间',
  `consign_time` int(11) DEFAULT '0' COMMENT '卖家发货时间',
  `create_time` int(11) DEFAULT '0' COMMENT '订单创建时间',
  `finish_time` int(11) DEFAULT '0' COMMENT '订单完成时间',
  `is_deleted` int(1) NOT NULL DEFAULT '0' COMMENT '订单是否已删除',
  `operator_type` int(1) NOT NULL DEFAULT '0' COMMENT '操作人类型  1店铺  2用户',
  `operator_id` int(11) NOT NULL DEFAULT '0' COMMENT '操作人id',
  `refund_balance_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单退款余额',
  PRIMARY KEY (`order_id`),
  KEY `UK_ns_order_buyer_id` (`buyer_id`),
  KEY `UK_ns_order_order_no` (`order_no`),
  KEY `UK_ns_order_pay_status` (`pay_status`),
  KEY `UK_ns_order_status` (`order_status`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=440 COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_order`
--

LOCK TABLES `ns_order` WRITE;
/*!40000 ALTER TABLE `ns_order` DISABLE KEYS */;
INSERT INTO `ns_order` VALUES (1,'201812070000001','154415551890071000',1,0,1,'2',3073,'xusq','1','','','18270717192',19,199,1770,'景新花园','','周海云',0,'斯玛特商场',0,'',0,70.00,70.00,0,0.00,0.00,0,0.00,0.00,0.00,0.00,70.00,0.00,0.00,0,0.00,5,0,0,0,0,0,0.00,1,1,0,0,0,0,1544154667,0,0,0,0,0.00),(2,'201812070000002','154418121143081000',1,0,1,'2',3073,'xusq','1','','','18270717192',19,199,1770,'景新花园','','周海云',0,'斯玛特商场',0,'',0,35.00,35.00,0,0.00,0.00,0,0.00,0.00,0.00,0.00,35.00,0.00,0.00,0,0.00,5,0,0,0,0,0,0.00,1,1,0,0,0,0,1544181211,0,0,0,0,0.00),(3,'201812080000001','154423955448211000',1,0,1,'3',3215,'斯玛特加盟商','1','','','18071575136',19,199,1772,'1111','','史智',0,'斯玛特加盟商电商系统',0,'',0,30.00,30.00,0,0.00,0.00,0,0.00,0.00,0.00,0.00,30.00,0.00,0.00,0,0.00,5,0,0,0,0,0,0.00,1,1,0,0,0,0,1544239554,0,0,0,0,0.00),(4,'201812080000002','154425506592521000',1,0,1,'2',3073,'xusq','1','','','18270717192',19,199,1770,'景新花园','','周海云',0,'斯玛特加盟商电商系统',0,'',0,5.00,5.00,0,0.00,0.00,0,0.00,0.00,0.00,0.00,5.00,0.00,0.00,0,0.00,5,0,0,0,0,0,0.00,1,1,0,0,0,0,1544239915,0,0,0,0,0.00),(5,'201812110000001','154451366431431000',1,0,1,'3',3073,'xusq','1','','','18270717192',19,199,1770,'景新花园','','周海云',0,'斯玛特加盟商电商系统',0,'',0,636.00,636.00,0,0.00,0.00,0,0.00,0.00,0.00,0.00,636.00,0.00,0.00,0,0.00,0,0,0,0,0,0,0.00,1,1,0,0,0,0,1544513605,0,0,0,0,0.00);
/*!40000 ALTER TABLE `ns_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_order_action`
--

DROP TABLE IF EXISTS `ns_order_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_order_action` (
  `action_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '动作id',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `action` varchar(255) NOT NULL DEFAULT '' COMMENT '动作内容',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '操作人id',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '操作人',
  `order_status` int(11) NOT NULL COMMENT '订单大状态',
  `order_status_text` varchar(255) NOT NULL DEFAULT '' COMMENT '订单状态名称',
  `action_time` int(11) DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`action_id`)
) ENGINE=MEMORY AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1706 COMMENT='订单操作表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_order_action`
--

LOCK TABLES `ns_order_action` WRITE;
/*!40000 ALTER TABLE `ns_order_action` DISABLE KEYS */;
INSERT INTO `ns_order_action` VALUES (1,1,'创建订单',3073,'xusq',0,'待付款',1544154667),(2,1,'交易关闭',0,'system',5,'已关闭',1544162498),(3,2,'创建订单',3073,'xusq',0,'待付款',1544181212),(4,3,'创建订单',3215,'斯玛特加盟商',0,'待付款',1544239554),(5,4,'创建订单',3073,'xusq',0,'待付款',1544239915),(6,2,'交易关闭',0,'system',5,'已关闭',1544440038),(7,3,'交易关闭',0,'system',5,'已关闭',1544490896),(8,4,'交易关闭',0,'system',5,'已关闭',1544490896),(9,5,'创建订单',3073,'xusq',0,'待付款',1544513605);
/*!40000 ALTER TABLE `ns_order_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_order_goods`
--

DROP TABLE IF EXISTS `ns_order_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_order_goods` (
  `order_goods_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单项ID',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `sku_id` int(11) NOT NULL COMMENT 'skuID',
  `sku_name` varchar(50) NOT NULL COMMENT 'sku名称',
  `price` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `cost_price` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '商品成本价',
  `num` varchar(255) NOT NULL DEFAULT '0' COMMENT '购买数量',
  `adjust_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '调整金额',
  `goods_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品总价',
  `goods_picture` int(11) NOT NULL DEFAULT '0' COMMENT '商品图片',
  `shop_id` int(11) NOT NULL DEFAULT '1' COMMENT '店铺ID',
  `buyer_id` int(11) NOT NULL DEFAULT '0' COMMENT '购买人ID',
  `point_exchange_type` int(11) NOT NULL DEFAULT '0' COMMENT '积分兑换类型0.非积分兑换1.积分兑换',
  `goods_type` varchar(255) NOT NULL DEFAULT '1' COMMENT '商品类型',
  `promotion_id` int(11) NOT NULL DEFAULT '0' COMMENT '促销ID',
  `promotion_type_id` int(11) NOT NULL DEFAULT '0' COMMENT '促销类型',
  `order_type` int(11) NOT NULL DEFAULT '1' COMMENT '订单类型',
  `order_status` int(11) NOT NULL DEFAULT '0' COMMENT '订单状态',
  `give_point` int(11) NOT NULL DEFAULT '0' COMMENT '积分数量',
  `shipping_status` int(11) NOT NULL DEFAULT '0' COMMENT '物流状态',
  `refund_type` int(11) NOT NULL DEFAULT '1' COMMENT '退款方式',
  `refund_require_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `refund_reason` varchar(255) NOT NULL DEFAULT '' COMMENT '退款原因',
  `refund_shipping_code` varchar(255) NOT NULL DEFAULT '' COMMENT '退款物流单号',
  `refund_shipping_company` varchar(255) NOT NULL DEFAULT '0' COMMENT '退款物流公司名称',
  `refund_real_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实际退款金额',
  `refund_status` int(1) NOT NULL DEFAULT '0' COMMENT '退款状态',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `is_evaluate` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否评价 0为未评价 1为已评价 2为已追评',
  `refund_time` int(11) DEFAULT '0' COMMENT '退款时间',
  `refund_balance_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单退款余额',
  `tmp_express_company` varchar(255) NOT NULL DEFAULT '' COMMENT '批量打印时添加的临时物流公司',
  `tmp_express_company_id` int(11) NOT NULL DEFAULT '0' COMMENT '批量打印时添加的临时物流公司id',
  `tmp_express_no` varchar(50) NOT NULL DEFAULT '' COMMENT '批量打印时添加的临时订单编号',
  PRIMARY KEY (`order_goods_id`),
  KEY `UK_ns_order_goods_buyer_id` (`buyer_id`),
  KEY `UK_ns_order_goods_goods_id` (`goods_id`),
  KEY `UK_ns_order_goods_order_id` (`order_id`),
  KEY `UK_ns_order_goods_promotion_id` (`promotion_id`),
  KEY `UK_ns_order_goods_sku_id` (`sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=289 COMMENT='订单商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_order_goods`
--

LOCK TABLES `ns_order_goods` WRITE;
/*!40000 ALTER TABLE `ns_order_goods` DISABLE KEYS */;
INSERT INTO `ns_order_goods` VALUES (1,1,3,'斯玛特玩偶',3,'',40.00,0.00,'1',0.00,40.00,7,0,3073,0,'1',0,0,1,0,0,0,1,0.00,'','','0',0.00,0,'',0,0,0.00,'',0,''),(2,1,2,'斯玛特笔帘',2,'',30.00,0.00,'1',0.00,30.00,4,0,3073,0,'1',0,0,1,0,0,0,1,0.00,'','','0',0.00,0,'',0,0,0.00,'',0,''),(3,2,4,'小丑拼图',4,'',5.00,0.00,'1',0.00,5.00,8,0,3073,0,'1',0,0,1,0,0,0,1,0.00,'','','0',0.00,0,'',0,0,0.00,'',0,''),(4,2,2,'斯玛特笔帘',2,'',30.00,0.00,'1',0.00,30.00,4,0,3073,0,'1',0,0,1,0,0,0,1,0.00,'','','0',0.00,0,'',0,0,0.00,'',0,''),(5,3,1,'72色粉笔',1,'',30.00,0.00,'1',0.00,30.00,6,0,3215,0,'1',0,0,1,0,0,0,1,0.00,'','','0',0.00,0,'',0,0,0.00,'',0,''),(6,4,4,'小丑拼图',4,'',5.00,0.00,'1',0.00,5.00,8,0,3073,0,'1',0,0,1,0,0,0,1,0.00,'','','0',0.00,0,'',0,0,0.00,'',0,''),(7,5,2,'斯玛特笔帘',2,'',30.00,0.00,'2',0.00,60.00,4,0,3073,0,'1',0,0,1,0,0,0,1,0.00,'','','0',0.00,0,'',0,0,0.00,'',0,''),(8,5,5,'颜料套装',5,'',288.00,0.00,'2',0.00,576.00,9,0,3073,0,'1',0,0,1,0,0,0,1,0.00,'','','0',0.00,0,'',0,0,0.00,'',0,'');
/*!40000 ALTER TABLE `ns_order_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_order_goods_express`
--

DROP TABLE IF EXISTS `ns_order_goods_express`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_order_goods_express` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `order_goods_id_array` varchar(255) NOT NULL COMMENT '订单项商品组合列表',
  `express_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包裹名称  （包裹- 1 包裹 - 2）',
  `shipping_type` tinyint(4) NOT NULL COMMENT '发货方式1 需要物流 0无需物流',
  `express_company_id` int(11) NOT NULL COMMENT '快递公司id',
  `express_company` varchar(255) NOT NULL DEFAULT '' COMMENT '物流公司名称',
  `express_no` varchar(50) NOT NULL COMMENT '运单编号',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `user_name` varchar(50) NOT NULL COMMENT '用户名',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `shipping_time` int(11) DEFAULT '0' COMMENT '发货时间',
  PRIMARY KEY (`id`),
  KEY `UK_ns_order_goods_express_order_goods_id_array` (`order_goods_id_array`),
  KEY `UK_ns_order_goods_express_order_id` (`order_id`),
  KEY `UK_ns_order_goods_express_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=606 COMMENT='商品订单物流信息表（多次发货）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_order_goods_express`
--

LOCK TABLES `ns_order_goods_express` WRITE;
/*!40000 ALTER TABLE `ns_order_goods_express` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_order_goods_express` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_order_goods_promotion_details`
--

DROP TABLE IF EXISTS `ns_order_goods_promotion_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_order_goods_promotion_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `sku_id` int(11) NOT NULL COMMENT '商品skuid',
  `promotion_type` varbinary(255) NOT NULL COMMENT '优惠类型规则ID（满减对应规则）',
  `promotion_id` int(11) NOT NULL COMMENT '优惠ID',
  `discount_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '优惠的金额，单位：元，精确到小数点后两位',
  `used_time` int(11) DEFAULT '0' COMMENT '使用时间',
  PRIMARY KEY (`id`),
  KEY `IDX_ns_order_goods_promotion_d_order_id` (`order_id`),
  KEY `IDX_ns_order_goods_promotion_d_promotion_id` (`promotion_id`),
  KEY `IDX_ns_order_goods_promotion_d_promotion_type` (`promotion_type`),
  KEY `IDX_ns_order_goods_promotion_d_sku_id` (`sku_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='订单商品优惠详情';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_order_goods_promotion_details`
--

LOCK TABLES `ns_order_goods_promotion_details` WRITE;
/*!40000 ALTER TABLE `ns_order_goods_promotion_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_order_goods_promotion_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_order_payment`
--

DROP TABLE IF EXISTS `ns_order_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_order_payment` (
  `out_trade_no` varchar(30) NOT NULL COMMENT '支付单编号',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '执行支付的相关店铺ID（0平台）',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '订单类型1.商城订单2.交易商支付',
  `type_alis_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单类型关联ID',
  `pay_body` varchar(255) NOT NULL DEFAULT '' COMMENT '订单支付简介',
  `pay_detail` varchar(1000) NOT NULL DEFAULT '' COMMENT '订单支付详情',
  `pay_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '支付金额',
  `pay_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '支付状态',
  `pay_type` int(11) NOT NULL DEFAULT '1' COMMENT '支付方式',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `pay_time` int(11) DEFAULT '0' COMMENT '支付时间',
  `trade_no` varchar(30) NOT NULL DEFAULT '' COMMENT '交易号，支付宝退款用，微信传入空',
  KEY `IDX_ns_order_payment_out_trade_no` (`out_trade_no`),
  KEY `IDX_ns_order_payment_pay_status` (`pay_status`),
  KEY `IDX_ns_order_payment_pay_type` (`pay_type`),
  KEY `IDX_ns_order_payment_shop_id` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=963 COMMENT='订单支付表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_order_payment`
--

LOCK TABLES `ns_order_payment` WRITE;
/*!40000 ALTER TABLE `ns_order_payment` DISABLE KEYS */;
INSERT INTO `ns_order_payment` VALUES ('154415551890071000',0,1,1,'斯玛特商场订单','斯玛特商场订单',70.00,0,1,1544154667,0,''),('154418121143081000',0,1,2,'斯玛特商场订单','斯玛特商场订单',35.00,0,1,1544181211,0,''),('154423955448211000',0,1,3,'斯玛特加盟商电商系统订单','斯玛特加盟商电商系统订单',30.00,0,1,1544239554,0,''),('154425506592521000',0,1,4,'斯玛特加盟商电商系统订单','斯玛特加盟商电商系统订单',5.00,0,1,1544239915,0,''),('154451366431431000',0,1,5,'斯玛特加盟商电商系统订单','斯玛特加盟商电商系统订单',636.00,0,1,1544513605,0,''),('154451379521901000',0,4,1,'余额充值','用户通知余额',1000.00,0,1,1544513804,0,'');
/*!40000 ALTER TABLE `ns_order_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_order_pickup`
--

DROP TABLE IF EXISTS `ns_order_pickup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_order_pickup` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `name` varchar(255) NOT NULL COMMENT '自提点名称',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '自提点地址',
  `contact` varchar(255) NOT NULL DEFAULT '' COMMENT '联系人',
  `phone` varchar(255) NOT NULL DEFAULT '' COMMENT '联系电话',
  `city_id` int(11) NOT NULL COMMENT '市ID',
  `province_id` int(11) NOT NULL COMMENT '省ID',
  `district_id` int(11) NOT NULL COMMENT '区县ID',
  `supplier_id` int(11) NOT NULL DEFAULT '0' COMMENT '供应门店ID',
  `longitude` varchar(255) NOT NULL DEFAULT '' COMMENT '经度',
  `latitude` varchar(255) NOT NULL DEFAULT '' COMMENT '维度',
  `buyer_name` varchar(50) NOT NULL DEFAULT '' COMMENT '提货人姓名',
  `buyer_mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '提货人电话',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '提货备注信息',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='订单自提点管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_order_pickup`
--

LOCK TABLES `ns_order_pickup` WRITE;
/*!40000 ALTER TABLE `ns_order_pickup` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_order_pickup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_order_promotion_details`
--

DROP TABLE IF EXISTS `ns_order_promotion_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_order_promotion_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `promotion_type_id` int(11) NOT NULL COMMENT '优惠类型规则ID（满减对应规则）',
  `promotion_id` int(11) NOT NULL COMMENT '优惠ID',
  `promotion_type` varchar(255) NOT NULL COMMENT '优惠类型',
  `promotion_name` varchar(50) NOT NULL COMMENT '该优惠活动的名称',
  `promotion_condition` varchar(255) NOT NULL DEFAULT '' COMMENT '优惠使用条件说明',
  `discount_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '优惠的金额，单位：元，精确到小数点后两位',
  `used_time` int(11) DEFAULT '0' COMMENT '使用时间',
  PRIMARY KEY (`id`),
  KEY `UK_ns_order_promotion_details_order_id` (`order_id`),
  KEY `UK_ns_order_promotion_details_promotion_id` (`promotion_id`),
  KEY `UK_ns_order_promotion_details_promotion_type` (`promotion_type`),
  KEY `UK_ns_order_promotion_details_promotion_type_id` (`promotion_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=364 COMMENT='订单优惠详情';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_order_promotion_details`
--

LOCK TABLES `ns_order_promotion_details` WRITE;
/*!40000 ALTER TABLE `ns_order_promotion_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_order_promotion_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_order_refund`
--

DROP TABLE IF EXISTS `ns_order_refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_order_refund` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_goods_id` int(11) NOT NULL COMMENT '订单商品表id',
  `refund_status` varchar(255) NOT NULL COMMENT '操作状态\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n流程状态(refund_status)	状态名称(refund_status_name)	操作时间\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n1	买家申请	发起了退款申请,等待卖家处理\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n2	等待买家退货	卖家已同意退款申请,等待买家退货\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n3	等待卖家确认收货	买家已退货,等待卖家确认收货\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n4	等待卖家确认退款	卖家同意退款\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n0	退款已成功	卖家退款给买家，本次维权结束\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n-1	退款已拒绝	卖家拒绝本次退款，本次维权结束\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n-2	退款已关闭	主动撤销退款，退款关闭\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n-3	退款申请不通过	拒绝了本次退款申请,等待买家修改\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
  `action` varchar(255) NOT NULL COMMENT '退款操作内容描述',
  `action_way` tinyint(4) NOT NULL DEFAULT '0' COMMENT '操作方 1 买家 2 卖家',
  `action_userid` varchar(255) NOT NULL DEFAULT '0' COMMENT '操作人id',
  `action_username` varchar(255) NOT NULL DEFAULT '' COMMENT '操作人姓名',
  `action_time` int(11) DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=108 COMMENT='订单商品退货退款操作表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_order_refund`
--

LOCK TABLES `ns_order_refund` WRITE;
/*!40000 ALTER TABLE `ns_order_refund` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_order_refund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_order_refund_account_records`
--

DROP TABLE IF EXISTS `ns_order_refund_account_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_order_refund_account_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `order_goods_id` int(11) NOT NULL COMMENT '订单项id',
  `refund_trade_no` varchar(55) NOT NULL COMMENT '退款交易号',
  `refund_money` decimal(10,2) NOT NULL COMMENT '退款金额',
  `refund_way` int(11) NOT NULL COMMENT '退款方式（1：微信，2：支付宝，10：线下）',
  `buyer_id` int(11) NOT NULL COMMENT '买家id',
  `refund_time` int(11) NOT NULL COMMENT '退款时间',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单退款账户记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_order_refund_account_records`
--

LOCK TABLES `ns_order_refund_account_records` WRITE;
/*!40000 ALTER TABLE `ns_order_refund_account_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_order_refund_account_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_order_shipping_fee`
--

DROP TABLE IF EXISTS `ns_order_shipping_fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_order_shipping_fee` (
  `shipping_fee_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '运费模板ID',
  `shipping_fee_name` varchar(30) NOT NULL DEFAULT '' COMMENT '运费模板名称',
  `is_default` int(11) NOT NULL DEFAULT '0' COMMENT '是否是默认模板',
  `co_id` int(11) NOT NULL DEFAULT '0' COMMENT '物流公司ID',
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `province_id_array` text NOT NULL COMMENT '省ID组',
  `city_id_array` text NOT NULL COMMENT '市ID组',
  `weight_is_use` int(11) NOT NULL DEFAULT '1' COMMENT '是否启用重量运费',
  `weight_snum` decimal(8,2) NOT NULL DEFAULT '1.00' COMMENT '首重',
  `weight_sprice` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '首重运费',
  `weight_xnum` decimal(8,2) NOT NULL DEFAULT '1.00' COMMENT '续重',
  `weight_xprice` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '续重运费',
  `volume_is_use` int(11) NOT NULL DEFAULT '1' COMMENT '是否启用体积计算运费',
  `volume_snum` decimal(8,2) NOT NULL DEFAULT '1.00' COMMENT '首体积量',
  `volume_sprice` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '首体积运费',
  `volume_xnum` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '续体积量',
  `volume_xprice` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '续体积运费',
  `bynum_is_use` int(11) NOT NULL DEFAULT '1' COMMENT '是否启用计件方式运费',
  `bynum_snum` int(11) NOT NULL DEFAULT '0' COMMENT '首件',
  `bynum_sprice` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '首件运费',
  `bynum_xnum` int(11) NOT NULL DEFAULT '1' COMMENT '续件',
  `bynum_xprice` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '续件运费',
  `create_time` int(11) DEFAULT '0' COMMENT '创建日期',
  `update_time` int(11) DEFAULT '0' COMMENT '最后更新时间',
  `district_id_array` text COMMENT '区县ID组',
  PRIMARY KEY (`shipping_fee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='运费模板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_order_shipping_fee`
--

LOCK TABLES `ns_order_shipping_fee` WRITE;
/*!40000 ALTER TABLE `ns_order_shipping_fee` DISABLE KEYS */;
INSERT INTO `ns_order_shipping_fee` VALUES (1,'模板1',1,1,0,'','',1,0.00,0.00,0.00,0.00,1,0.00,0.00,0.00,0.00,1,1,10.00,1,5.00,1544093739,0,'');
/*!40000 ALTER TABLE `ns_order_shipping_fee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_order_shop_return`
--

DROP TABLE IF EXISTS `ns_order_shop_return`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_order_shop_return` (
  `shop_id` int(11) NOT NULL,
  `shop_address` varchar(255) NOT NULL DEFAULT '' COMMENT '商家地址',
  `seller_name` varchar(50) NOT NULL DEFAULT '' COMMENT '收件人',
  `seller_mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '收件人手机号',
  `seller_zipcode` varchar(20) NOT NULL DEFAULT '' COMMENT '邮编',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='店铺退货设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_order_shop_return`
--

LOCK TABLES `ns_order_shop_return` WRITE;
/*!40000 ALTER TABLE `ns_order_shop_return` DISABLE KEYS */;
INSERT INTO `ns_order_shop_return` VALUES (0,'','','','',1544093847,0);
/*!40000 ALTER TABLE `ns_order_shop_return` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_pickup_point`
--

DROP TABLE IF EXISTS `ns_pickup_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_pickup_point` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `name` varchar(255) NOT NULL COMMENT '自提点名称',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '自提点地址',
  `contact` varchar(255) NOT NULL DEFAULT '' COMMENT '联系人',
  `phone` varchar(255) NOT NULL DEFAULT '' COMMENT '联系电话',
  `city_id` int(11) NOT NULL COMMENT '市ID',
  `province_id` int(11) NOT NULL COMMENT '省ID',
  `district_id` int(11) NOT NULL COMMENT '区县ID',
  `supplier_id` int(11) NOT NULL DEFAULT '0' COMMENT '供应门店ID',
  `longitude` varchar(255) NOT NULL DEFAULT '' COMMENT '经度',
  `latitude` varchar(255) NOT NULL DEFAULT '' COMMENT '维度',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096 COMMENT='自提点管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_pickup_point`
--

LOCK TABLES `ns_pickup_point` WRITE;
/*!40000 ALTER TABLE `ns_pickup_point` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_pickup_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_platform_adv`
--

DROP TABLE IF EXISTS `ns_platform_adv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_platform_adv` (
  `adv_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告自增标识编号',
  `ap_id` mediumint(8) unsigned NOT NULL COMMENT '广告位id',
  `adv_title` varchar(255) NOT NULL DEFAULT '' COMMENT '广告内容描述',
  `adv_url` text,
  `adv_image` varchar(1000) NOT NULL DEFAULT '' COMMENT '广告内容图片',
  `slide_sort` int(11) DEFAULT NULL,
  `click_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '广告点击率',
  `background` varchar(255) NOT NULL DEFAULT '#FFFFFF' COMMENT '背景色',
  PRIMARY KEY (`adv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1170 COMMENT='广告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_platform_adv`
--

LOCK TABLES `ns_platform_adv` WRITE;
/*!40000 ALTER TABLE `ns_platform_adv` DISABLE KEYS */;
INSERT INTO `ns_platform_adv` VALUES (1,1105,'广告二','javascript:;','upload/image_collection/1544155982.jpg',1,0,'#000000'),(2,1105,'广告二','javascript:;','upload/image_collection/1544155970.jpg',2,0,'#000000'),(3,1105,'广告三','javascript:;','upload/image_collection/1544156002.jpg',3,0,'#000000'),(5,1053,'广告一','javascript:;','upload/image_collection/1544242810.png',0,0,'#000000'),(6,1053,'广告二','javascript:;','upload/image_collection/1544242833.png',1,0,'#000000'),(7,1053,'广告三','javascript:;','upload/image_collection/1544242856.png',2,0,'#000000');
/*!40000 ALTER TABLE `ns_platform_adv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_platform_adv_position`
--

DROP TABLE IF EXISTS `ns_platform_adv_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_platform_adv_position` (
  `ap_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告位置id',
  `ap_name` varchar(100) NOT NULL COMMENT '广告位置名',
  `ap_intro` varchar(255) NOT NULL COMMENT '广告位简介',
  `ap_class` smallint(1) unsigned NOT NULL COMMENT '广告类别：0图片1文字2幻灯3Flash',
  `ap_display` smallint(1) unsigned NOT NULL COMMENT '广告展示方式：0幻灯片1多广告展示2单广告展示',
  `is_use` smallint(1) unsigned NOT NULL COMMENT '广告位是否启用：0不启用1启用',
  `ap_height` int(10) NOT NULL COMMENT '广告位高度',
  `ap_width` int(10) NOT NULL COMMENT '广告位宽度',
  `ap_price` int(10) NOT NULL DEFAULT '0' COMMENT '广告位单价',
  `adv_num` int(10) NOT NULL DEFAULT '0' COMMENT '拥有的广告数',
  `click_num` int(10) NOT NULL DEFAULT '0' COMMENT '广告位点击率',
  `default_content` varchar(300) DEFAULT NULL,
  `ap_background_color` varchar(50) NOT NULL DEFAULT '#FFFFFF' COMMENT '广告位背景色 默认白色',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '广告位所在位置类型   1 pc端  2 手机端',
  `instance_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `is_del` int(11) DEFAULT '0',
  PRIMARY KEY (`ap_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1166 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1489 COMMENT='广告位表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_platform_adv_position`
--

LOCK TABLES `ns_platform_adv_position` WRITE;
/*!40000 ALTER TABLE `ns_platform_adv_position` DISABLE KEYS */;
INSERT INTO `ns_platform_adv_position` VALUES (1051,'商城首页最顶部广告位','商城首页最顶部广告位',0,2,0,1000,1000,0,0,0,'','#000000',1,0,1),(1052,'商城首页logo右侧小广告','商城首页logo右侧小广告',0,2,0,90,170,0,0,0,'public/static/images/default_img_url/shouyelogo.png','#FFFFFF',1,0,1),(1053,'商城首页滚动图广告位','商城首页滚动图广告位',0,0,1,500,1920,0,0,0,'upload/image_collection/1544242770.png','#ffffff',1,0,1),(1054,'商城首页中部推荐广告位','商城首页中部推荐广告位（140*242）',0,2,0,140,242,0,0,0,'','',1,0,1),(1056,'商城限时折扣轮播广告位','商城限时折扣轮播广告位',0,2,0,443,1903,0,0,0,'public/static/images/default_img_url/xianshizhekou.png','#FFFFFF',1,0,1),(1075,'商城品牌专区轮播广告位','商城品牌专区轮播广告位',0,0,0,443,1210,0,0,0,'public/static/images/default_img_url/pinpaizhuanqu.png','#000000',1,0,1),(1076,'商城积分中心轮播广告位','商城积分中心轮播广告位',0,2,0,320,910,0,0,0,'public/static/images/default_img_url/jifenzhongxin.jpg','#000000',1,0,1),(1102,'商城积分中心中部广告位','商城积分中心中部广告位',0,2,0,60,1210,0,0,0,'public/static/images/default_img_url/jifenzhongxinzhongbu.jpg','#000000',1,0,1),(1103,'商城登录页面轮播广告位','商城登录页面轮播广告位',0,0,0,0,0,0,0,0,'','',1,0,1),(1105,'手机端首页轮播广告位','手机端首页轮播广告位',0,1,1,175,320,0,0,0,'upload/image_collection/1544091433.png','#000000',2,0,1),(1152,'手机端会员中心广告位','手机端会员中心广告位',0,2,0,100,750,0,0,0,'public/static/images/default_img_url/waphuiyuanzhongxin.png','',2,0,1),(1162,'手机端品牌专区广告位','品牌专区广告',0,2,0,192,720,0,0,0,'public/static/images/default_img_url/wappinpaizhuanqu.png','',2,0,1),(1163,'手机端限时折扣专区广告位','限时折扣专区广告位',0,2,0,130,720,0,0,0,'public/static/images/default_img_url/wapxianshizhekou.png','',2,0,1),(1164,'手机端首页商城热卖广告位','手机端商城热卖',0,2,0,100,100,0,0,0,'public/static/images/default_img_url/wapshangchengremai.png','#000000',2,0,1),(1165,'手机端积分中心广告位','积分中心广告位',0,2,0,100,100,0,0,0,'public/static/images/default_img_url/wapjifenzhongxin.png','#000000',2,0,1);
/*!40000 ALTER TABLE `ns_platform_adv_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_platform_block`
--

DROP TABLE IF EXISTS `ns_platform_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_platform_block` (
  `block_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_display` smallint(4) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `block_color` varchar(255) NOT NULL COMMENT '颜色风格',
  `sort` int(11) DEFAULT NULL,
  `block_name` varchar(50) NOT NULL DEFAULT '' COMMENT '板块名称',
  `block_short_name` varchar(50) DEFAULT NULL COMMENT '板块简称',
  `recommend_ad_image_name` varchar(50) NOT NULL DEFAULT '' COMMENT '推荐单图广告位名称',
  `recommend_ad_image` int(11) NOT NULL DEFAULT '0' COMMENT '推荐单图广告位',
  `recommend_ad_slide_name` varchar(50) NOT NULL DEFAULT '' COMMENT '推荐幻灯广告位名称',
  `recommend_ad_slide` int(11) NOT NULL COMMENT '推荐幻灯广告位',
  `recommend_ad_images_name` varchar(255) NOT NULL DEFAULT '0' COMMENT '推荐多图广告位名称',
  `recommend_ad_images` int(11) NOT NULL DEFAULT '0' COMMENT '推荐多图广告位',
  `recommend_brands` varchar(255) NOT NULL DEFAULT '' COMMENT '推荐品牌',
  `recommend_categorys` varchar(255) NOT NULL DEFAULT '' COMMENT '推荐商品分类',
  `recommend_goods_category_name_1` varchar(50) NOT NULL DEFAULT '' COMMENT '推荐分类商品别名',
  `recommend_goods_category_1` int(11) NOT NULL DEFAULT '0' COMMENT '推荐显示商品分类',
  `recommend_goods_category_name_2` varchar(50) NOT NULL DEFAULT '' COMMENT '推荐分类商品别名',
  `recommend_goods_category_2` int(11) NOT NULL DEFAULT '0' COMMENT '推荐显示商品分类',
  `recommend_goods_category_name_3` varchar(50) NOT NULL DEFAULT '' COMMENT '推荐分类商品别名',
  `recommend_goods_category_3` int(11) NOT NULL DEFAULT '0' COMMENT '推荐显示商品分类',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `block_data` longtext COMMENT '板块数据',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2340 COMMENT='首页促销板块';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_platform_block`
--

LOCK TABLES `ns_platform_block` WRITE;
/*!40000 ALTER TABLE `ns_platform_block` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_platform_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_platform_goods_recommend`
--

DROP TABLE IF EXISTS `ns_platform_goods_recommend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_platform_goods_recommend` (
  `recommend_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_id` int(11) NOT NULL COMMENT '推荐商品ID',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '推荐状态',
  `class_id` int(11) NOT NULL DEFAULT '1' COMMENT '推荐类型',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`recommend_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=442 COMMENT='平台商品推荐';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_platform_goods_recommend`
--

LOCK TABLES `ns_platform_goods_recommend` WRITE;
/*!40000 ALTER TABLE `ns_platform_goods_recommend` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_platform_goods_recommend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_platform_goods_recommend_class`
--

DROP TABLE IF EXISTS `ns_platform_goods_recommend_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_platform_goods_recommend_class` (
  `class_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `class_name` varchar(50) NOT NULL DEFAULT '' COMMENT '类型名称',
  `class_type` int(11) NOT NULL DEFAULT '1' COMMENT '推荐模块1.系统固有模块2.平台增加模块',
  `is_use` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否使用',
  `sort` int(11) NOT NULL DEFAULT '255' COMMENT '排序号',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `show_type` int(11) NOT NULL DEFAULT '0' COMMENT '展示类型  0电脑端  1手机端',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2340 COMMENT='店铺商品推荐类别';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_platform_goods_recommend_class`
--

LOCK TABLES `ns_platform_goods_recommend_class` WRITE;
/*!40000 ALTER TABLE `ns_platform_goods_recommend_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_platform_goods_recommend_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_platform_help_class`
--

DROP TABLE IF EXISTS `ns_platform_help_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_platform_help_class` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '1.帮助类别2.会员协议类别3.开店协议类别',
  `class_name` varchar(50) NOT NULL DEFAULT '' COMMENT '类型名称',
  `parent_class_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级ID',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序号',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096 COMMENT='平台说明类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_platform_help_class`
--

LOCK TABLES `ns_platform_help_class` WRITE;
/*!40000 ALTER TABLE `ns_platform_help_class` DISABLE KEYS */;
INSERT INTO `ns_platform_help_class` VALUES (1,1,'新手上路',0,1),(2,1,'配送与支付',0,2),(3,1,'会员中心',0,3),(4,1,'服务保证',0,4),(5,1,'联系我们',0,5);
/*!40000 ALTER TABLE `ns_platform_help_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_platform_help_document`
--

DROP TABLE IF EXISTS `ns_platform_help_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_platform_help_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `uid` int(11) NOT NULL COMMENT '最后修改人ID',
  `class_id` int(11) NOT NULL COMMENT '所属说明类型ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '主题',
  `link_url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序号',
  `content` text NOT NULL COMMENT '内容',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modufy_time` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1489 COMMENT='平台说明内容';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_platform_help_document`
--

LOCK TABLES `ns_platform_help_document` WRITE;
/*!40000 ALTER TABLE `ns_platform_help_document` DISABLE KEYS */;
INSERT INTO `ns_platform_help_document` VALUES (1,1,1,'购物流程','',0,'','',0,1544155834),(2,2,2,'支付方式说明','',5,'<p>支付方式说明</p>','',0,1493810155),(3,87,3,'售后流程','',1,'','',0,1499240296),(5,2,3,'资金管理','',6,'<p>资金管理</p>','',0,1493964639),(6,2,3,'我的收藏','',7,'<p>我的收藏</p>','',0,1493809215),(7,2,2,'货到付款区域','',3,'<p>货到付款区域</p>','',1487559901,1493810113),(8,2,2,'配送支付智能查询','',4,'<p>配送支付智能查询</p>','',1487559942,1493810133),(9,2,4,'退换货原则','',9,'<p>退换货原则</p>','',1487560238,1493809406),(10,2,4,'售后服务保证','',9,'<p>售后服务保证</p>','',1487560263,1493809427),(11,2,4,'产品质量保证','',10,'<p>产品质量保证</p>','',1487560296,1493809443),(12,2,5,'网站故障报告','',11,'<p>网站故障报告</p>','',1487560338,1493809546),(13,87,13,'订购方式','',2,'','',1493206148,1498469763),(14,1,3,'我的订单','',8,'<p>我的订单</p>','',1493809066,1497102958),(15,2,5,'选机咨询','',12,'<p>选机咨询</p>','',1493809482,1493809565),(16,2,5,'投诉与建议','',13,'<p>投诉与建议</p>','',1493809511,1493964721),(17,87,6,'用户注册协议','',0,'<p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Microsoft Yahei&quot;, &quot;Lucida Grande&quot;, Verdana, Lucida, Helvetica, Arial, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);\">牛酷商城用户注册协议本协议是您与牛酷商城网站（简称&quot;本站&quot;）所有者（以下简称为&quot;牛酷商城&quot;）之间就牛酷商城网站服务等相关事宜所订立的契约，请您仔细阅读本注册协议，您点击&quot;同意并继续&quot;按钮后，本协议即构成对双方有约束力的法律文件。第1条 本站服务条款的确认和接纳1.1本站的各项电子服务的所有权和运作权归牛酷商城所有。用户同意所有注册协议条款并完成注册程序，才能成为本站的正式用户。用户确认：本协议条款是处理双方权利义务的契约，始终有效，法律另有强制性规定或双方另有特别约定的，依其规定。1.2用户点击同意本协议的，即视为用户确认自己具有享受本站服务、下单购物等相应的权利能力和行为能力，能够独立承担法律责任。1.3如果您在18周岁以下，您只能在父母或监护人的监护参与下才能使用本站。第2条 本站服务2.1牛酷商城通过互联网依法为用户提供互联网信息等服务，用户在完全同意本协议及本站规定的情况下，方有权使用本站的相关服务。2.2用户必须自行准备如下设备和承担如下开支：（1）上网设备，包括并不限于电脑或者其他上网终端、调制解调器及其他必备的上网装置；（2）上网开支，包括并不限于网络接入费、上网设备租用费、手机流量费等。第3条 用户信息3.1用户应自行诚信向本站提供注册资料，用户同意其提供的注册资料真实、准确、完整、合法有效，用户注册资料如有变动的，应及时更新其注册资料。如果用户提供的注册资料不合法、不真实、不准确、不详尽的，用户需承担因此引起的相应责任及后果，并且牛酷商城保留终止用户使用牛酷商城各项服务的权利。3.2用户在本站进行浏览、下单购物等活动时，涉及用户真实姓名/名称、通信地址、联系电话、电子邮箱等隐私信息的，本站将予以严格保密，除非得到用户的授权或法律另有规定，本站不会向外界披露用户隐私信息。第4条 用户依法言行义务本协议依据国家相关法律法规规章制定，用户同意严格遵守以下义务：（1）不得传输或发表：煽动抗拒、破坏宪法和法律、行政法规实施的言论，煽动颠覆国家政权，推翻社会主义制度的言论，煽动分裂国家、破坏国家统一的的言论，煽动民族仇恨、民族歧视、破坏民族团结的言论；（2）从中国大陆向境外传输资料信息时必须符合中国有关法规；第5条 其他5.1牛酷商城网站所有者是指在政府部门依法许可或备案的牛酷商城网站经营主体。5.2您点击本协议下方的&quot;同意并继续&quot;按钮即视为您完全接受本协议，在点击之前请您再次确认已知悉并完全理解本协议的全部内容。</span></p>','',1499325553,1499325616);
/*!40000 ALTER TABLE `ns_platform_help_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_platform_link`
--

DROP TABLE IF EXISTS `ns_platform_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_platform_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引id',
  `link_title` varchar(100) NOT NULL COMMENT '标题',
  `link_url` varchar(100) NOT NULL COMMENT '链接',
  `link_pic` varchar(100) NOT NULL COMMENT '图片',
  `link_sort` int(11) DEFAULT NULL,
  `is_blank` int(11) NOT NULL DEFAULT '1' COMMENT '是否新窗口打开 1.是 2.否',
  `is_show` int(11) NOT NULL DEFAULT '1' COMMENT '是否显示 1.是 2.否',
  PRIMARY KEY (`link_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=50 COMMENT='友情链接表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_platform_link`
--

LOCK TABLES `ns_platform_link` WRITE;
/*!40000 ALTER TABLE `ns_platform_link` DISABLE KEYS */;
INSERT INTO `ns_platform_link` VALUES (1,'百度','http://www.baidu.com','upload/common/1544170305.jpg',0,1,1);
/*!40000 ALTER TABLE `ns_platform_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_point_config`
--

DROP TABLE IF EXISTS `ns_point_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_point_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `is_open` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否启动',
  `convert_rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '1积分对应金额',
  `desc` text NOT NULL COMMENT '积分说明',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='积分设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_point_config`
--

LOCK TABLES `ns_point_config` WRITE;
/*!40000 ALTER TABLE `ns_point_config` DISABLE KEYS */;
INSERT INTO `ns_point_config` VALUES (1,0,0,0.01,'',1544134197,1544513898);
/*!40000 ALTER TABLE `ns_point_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_promotion_bundling`
--

DROP TABLE IF EXISTS `ns_promotion_bundling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_promotion_bundling` (
  `bl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组合ID',
  `bl_name` varchar(50) NOT NULL COMMENT '组合名称',
  `shop_id` int(11) NOT NULL COMMENT '店铺id',
  `shop_name` varchar(100) NOT NULL COMMENT '店铺名称',
  `bl_price` decimal(10,2) NOT NULL COMMENT '商品组合价格',
  `shipping_fee_type` tinyint(1) NOT NULL COMMENT '运费承担方式 1卖家承担运费 2买家承担运费',
  `shipping_fee` decimal(10,2) NOT NULL COMMENT '运费',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '组合状态 0-关闭/1-开启',
  PRIMARY KEY (`bl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组合销售活动表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_promotion_bundling`
--

LOCK TABLES `ns_promotion_bundling` WRITE;
/*!40000 ALTER TABLE `ns_promotion_bundling` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_promotion_bundling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_promotion_bundling_goods`
--

DROP TABLE IF EXISTS `ns_promotion_bundling_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_promotion_bundling_goods` (
  `bl_goods_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组合商品id',
  `bl_id` int(11) NOT NULL COMMENT '组合id',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_picture` varchar(100) NOT NULL COMMENT '商品图片',
  `bl_goods_price` decimal(10,2) NOT NULL COMMENT '商品组合价格',
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`bl_goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组合销售活动商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_promotion_bundling_goods`
--

LOCK TABLES `ns_promotion_bundling_goods` WRITE;
/*!40000 ALTER TABLE `ns_promotion_bundling_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_promotion_bundling_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_promotion_discount`
--

DROP TABLE IF EXISTS `ns_promotion_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_promotion_discount` (
  `discount_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shop_id` int(11) NOT NULL DEFAULT '1' COMMENT '店铺ID',
  `shop_name` varchar(50) NOT NULL DEFAULT '' COMMENT '店铺名称',
  `discount_name` varchar(255) NOT NULL DEFAULT '' COMMENT '活动名称',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '活动状态(0-未发布/1-正常/3-关闭/4-结束)',
  `remark` text NOT NULL COMMENT '备注',
  `start_time` int(11) DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) DEFAULT '0' COMMENT '结束时间',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`discount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096 COMMENT='限时折扣';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_promotion_discount`
--

LOCK TABLES `ns_promotion_discount` WRITE;
/*!40000 ALTER TABLE `ns_promotion_discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_promotion_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_promotion_discount_goods`
--

DROP TABLE IF EXISTS `ns_promotion_discount_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_promotion_discount_goods` (
  `discount_goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `discount_id` int(11) NOT NULL COMMENT '对应活动',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `discount` decimal(10,2) NOT NULL COMMENT '活动折扣或者减现信息',
  `goods_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_picture` int(11) NOT NULL COMMENT '商品图片',
  `start_time` int(11) DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) DEFAULT '0' COMMENT '结束时间',
  PRIMARY KEY (`discount_goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=712 COMMENT='限时折扣商品列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_promotion_discount_goods`
--

LOCK TABLES `ns_promotion_discount_goods` WRITE;
/*!40000 ALTER TABLE `ns_promotion_discount_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_promotion_discount_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_promotion_full_mail`
--

DROP TABLE IF EXISTS `ns_promotion_full_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_promotion_full_mail` (
  `mail_id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `is_open` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否开启 0未开启 1已开启',
  `full_mail_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '包邮所需订单金额',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '更新时间',
  `no_mail_province_id_array` text NOT NULL COMMENT '不包邮省id组',
  `no_mail_city_id_array` text NOT NULL COMMENT '不包邮市id组',
  PRIMARY KEY (`mail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='满额包邮';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_promotion_full_mail`
--

LOCK TABLES `ns_promotion_full_mail` WRITE;
/*!40000 ALTER TABLE `ns_promotion_full_mail` DISABLE KEYS */;
INSERT INTO `ns_promotion_full_mail` VALUES (1,0,0,0.00,1543999356,0,'','');
/*!40000 ALTER TABLE `ns_promotion_full_mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_promotion_gift`
--

DROP TABLE IF EXISTS `ns_promotion_gift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_promotion_gift` (
  `gift_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '赠品活动id ',
  `days` int(10) unsigned NOT NULL COMMENT '领取有效期(多少天)',
  `max_num` varchar(50) NOT NULL COMMENT '领取限制(次/人 (0表示不限领取次数))',
  `shop_id` varchar(100) NOT NULL COMMENT '店铺id',
  `gift_name` varchar(255) NOT NULL COMMENT '赠品活动名称',
  `start_time` int(11) DEFAULT '0' COMMENT '赠品有效期开始时间',
  `end_time` int(11) DEFAULT '0' COMMENT '赠品有效期结束时间',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`gift_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='赠品活动表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_promotion_gift`
--

LOCK TABLES `ns_promotion_gift` WRITE;
/*!40000 ALTER TABLE `ns_promotion_gift` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_promotion_gift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_promotion_gift_goods`
--

DROP TABLE IF EXISTS `ns_promotion_gift_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_promotion_gift_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id ',
  `gift_id` int(10) unsigned NOT NULL COMMENT '赠品id ',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_picture` varchar(100) NOT NULL COMMENT '商品图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='商品赠品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_promotion_gift_goods`
--

LOCK TABLES `ns_promotion_gift_goods` WRITE;
/*!40000 ALTER TABLE `ns_promotion_gift_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_promotion_gift_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_promotion_mansong`
--

DROP TABLE IF EXISTS `ns_promotion_mansong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_promotion_mansong` (
  `mansong_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '满送活动编号',
  `mansong_name` varchar(50) NOT NULL COMMENT '活动名称',
  `shop_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `shop_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `status` tinyint(1) unsigned NOT NULL COMMENT '活动状态(0-未发布/1-正常/3-关闭/4-结束)',
  `remark` varchar(200) NOT NULL COMMENT '备注',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1.普通优惠  2.多级优惠',
  `range_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1全部商品 0部分商品',
  `start_time` int(11) DEFAULT '0' COMMENT '活动开始时间',
  `end_time` int(11) DEFAULT '0' COMMENT '活动结束时间',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`mansong_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1638 COMMENT='满就送活动表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_promotion_mansong`
--

LOCK TABLES `ns_promotion_mansong` WRITE;
/*!40000 ALTER TABLE `ns_promotion_mansong` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_promotion_mansong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_promotion_mansong_goods`
--

DROP TABLE IF EXISTS `ns_promotion_mansong_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_promotion_mansong_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `mansong_id` int(11) NOT NULL COMMENT '满减送ID',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `goods_name` varchar(50) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_picture` varchar(255) NOT NULL DEFAULT '' COMMENT '商品图片',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '活动状态',
  `start_time` int(11) DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) DEFAULT '0' COMMENT '结束时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1489 COMMENT='满减送商品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_promotion_mansong_goods`
--

LOCK TABLES `ns_promotion_mansong_goods` WRITE;
/*!40000 ALTER TABLE `ns_promotion_mansong_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_promotion_mansong_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_promotion_mansong_rule`
--

DROP TABLE IF EXISTS `ns_promotion_mansong_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_promotion_mansong_rule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则编号',
  `mansong_id` int(10) unsigned NOT NULL COMMENT '活动编号',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '级别价格(满多少)',
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '减现金优惠金额（减多少金额）',
  `free_shipping` tinyint(4) NOT NULL DEFAULT '0' COMMENT '免邮费',
  `give_point` int(11) NOT NULL DEFAULT '0' COMMENT '送积分数量（0表示不送）',
  `give_coupon` int(11) NOT NULL DEFAULT '0' COMMENT '送优惠券的id（0表示不送）',
  `gift_id` int(11) NOT NULL COMMENT '礼品(赠品)id',
  PRIMARY KEY (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1170 COMMENT='满就送活动规则表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_promotion_mansong_rule`
--

LOCK TABLES `ns_promotion_mansong_rule` WRITE;
/*!40000 ALTER TABLE `ns_promotion_mansong_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_promotion_mansong_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_reward_rule`
--

DROP TABLE IF EXISTS `ns_reward_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_reward_rule` (
  `shop_id` int(10) unsigned NOT NULL,
  `sign_point` int(11) NOT NULL DEFAULT '0' COMMENT '签到送积分',
  `share_point` int(11) NOT NULL DEFAULT '0' COMMENT '分享送积分',
  `reg_member_self_point` int(11) NOT NULL DEFAULT '0' COMMENT '注册会员 自己获得的积分',
  `reg_member_one_point` int(11) NOT NULL DEFAULT '0' COMMENT '注册会员 上级获得的积分',
  `reg_member_two_point` int(11) NOT NULL DEFAULT '0' COMMENT '注册会员 上上级获得的积分',
  `reg_member_three_point` int(11) NOT NULL DEFAULT '0' COMMENT '注册会员 上上上级获得的积分',
  `reg_promoter_self_point` int(11) NOT NULL DEFAULT '0' COMMENT '成为推广员 自己获得的积分',
  `reg_promoter_one_point` int(11) NOT NULL DEFAULT '0' COMMENT '成为推广员 上级获得的积分',
  `reg_promoter_two_point` int(11) NOT NULL DEFAULT '0' COMMENT '成为推广员 上上级获得的积分',
  `reg_promoter_three_point` int(11) NOT NULL DEFAULT '0' COMMENT '成为推广员 上上上级获得的积分',
  `reg_partner_self_point` int(11) NOT NULL DEFAULT '0' COMMENT '成为股东 自己获得的积分',
  `reg_partner_one_point` int(11) NOT NULL DEFAULT '0' COMMENT '成为股东 上级获得的积分',
  `reg_partner_two_point` int(11) NOT NULL DEFAULT '0' COMMENT '成为股东 上上级获得的积分',
  `reg_partner_three_point` int(11) NOT NULL DEFAULT '0' COMMENT '成为股东 上上上级获得的积分',
  `into_store_coupon` int(11) NOT NULL DEFAULT '0' COMMENT '进店领用优惠券  存入优惠券id(coupon_id)',
  `share_coupon` int(11) NOT NULL DEFAULT '0' COMMENT '分享领用优惠券  存入优惠券id(coupon_id)',
  `click_point` int(11) NOT NULL DEFAULT '0' COMMENT '点赞送积分',
  `comment_point` int(11) NOT NULL DEFAULT '0' COMMENT '评论送积分',
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='奖励规则表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_reward_rule`
--

LOCK TABLES `ns_reward_rule` WRITE;
/*!40000 ALTER TABLE `ns_reward_rule` DISABLE KEYS */;
INSERT INTO `ns_reward_rule` VALUES (0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1);
/*!40000 ALTER TABLE `ns_reward_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_shop`
--

DROP TABLE IF EXISTS `ns_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_shop` (
  `shop_id` int(11) NOT NULL COMMENT '店铺索引id',
  `shop_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `shop_type` int(11) NOT NULL COMMENT '店铺类型等级',
  `uid` int(11) NOT NULL COMMENT '会员id',
  `shop_group_id` int(11) NOT NULL COMMENT '店铺分类',
  `shop_company_name` varchar(50) DEFAULT NULL COMMENT '店铺公司名称',
  `province_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '店铺所在省份ID',
  `city_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '店铺所在市ID',
  `shop_address` varchar(100) NOT NULL DEFAULT '' COMMENT '详细地区',
  `shop_zip` varchar(10) NOT NULL DEFAULT '' COMMENT '邮政编码',
  `shop_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '店铺状态，0关闭，1开启，2审核中',
  `shop_close_info` varchar(255) DEFAULT NULL COMMENT '店铺关闭原因',
  `shop_sort` int(11) NOT NULL DEFAULT '0' COMMENT '店铺排序',
  `shop_logo` varchar(255) DEFAULT NULL COMMENT '店铺logo',
  `shop_banner` varchar(255) DEFAULT NULL COMMENT '店铺横幅',
  `shop_avatar` varchar(150) DEFAULT NULL COMMENT '店铺头像',
  `shop_keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺seo关键字',
  `shop_description` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺seo描述',
  `shop_qq` varchar(50) DEFAULT NULL COMMENT 'QQ',
  `shop_ww` varchar(50) DEFAULT NULL COMMENT '阿里旺旺',
  `shop_phone` varchar(20) DEFAULT NULL COMMENT '商家电话',
  `shop_domain` varchar(50) DEFAULT NULL COMMENT '店铺二级域名',
  `shop_domain_times` tinyint(1) unsigned DEFAULT '0' COMMENT '二级域名修改次数',
  `shop_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐，0为否，1为是，默认为0',
  `shop_credit` int(10) NOT NULL DEFAULT '0' COMMENT '店铺信用',
  `shop_desccredit` float NOT NULL DEFAULT '0' COMMENT '描述相符度分数',
  `shop_servicecredit` float NOT NULL DEFAULT '0' COMMENT '服务态度分数',
  `shop_deliverycredit` float NOT NULL DEFAULT '0' COMMENT '发货速度分数',
  `shop_collect` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺收藏数量',
  `shop_stamp` varchar(200) DEFAULT NULL COMMENT '店铺印章',
  `shop_printdesc` varchar(500) DEFAULT NULL COMMENT '打印订单页面下方说明文字',
  `shop_sales` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺销售额（不计算退款）',
  `shop_account` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺账户余额',
  `shop_cash` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺可提现金额',
  `shop_workingtime` varchar(100) DEFAULT NULL COMMENT '工作时间',
  `live_store_name` varchar(255) DEFAULT NULL COMMENT '商铺名称',
  `live_store_address` varchar(255) DEFAULT NULL COMMENT '商家地址',
  `live_store_tel` varchar(255) DEFAULT NULL COMMENT '商铺电话',
  `live_store_bus` varchar(255) DEFAULT NULL COMMENT '公交线路',
  `shop_vrcode_prefix` char(3) DEFAULT NULL COMMENT '商家兑换码前缀',
  `store_qtian` tinyint(1) DEFAULT '0' COMMENT '7天退换',
  `shop_zhping` tinyint(1) DEFAULT '0' COMMENT '正品保障',
  `shop_erxiaoshi` tinyint(1) DEFAULT '0' COMMENT '两小时发货',
  `shop_tuihuo` tinyint(1) DEFAULT '0' COMMENT '退货承诺',
  `shop_shiyong` tinyint(1) DEFAULT '0' COMMENT '试用中心',
  `shop_shiti` tinyint(1) DEFAULT '0' COMMENT '实体验证',
  `shop_xiaoxie` tinyint(1) DEFAULT '0' COMMENT '消协保证',
  `shop_huodaofk` tinyint(1) DEFAULT '0' COMMENT '货到付款',
  `shop_free_time` varchar(10) DEFAULT NULL COMMENT '商家配送时间',
  `shop_region` varchar(50) DEFAULT NULL COMMENT '店铺默认配送区域',
  `recommend_uid` int(11) NOT NULL DEFAULT '0' COMMENT '推荐招商员用户id',
  `shop_qrcode` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺公众号',
  `shop_create_time` int(11) DEFAULT '0' COMMENT '店铺时间',
  `shop_end_time` int(11) DEFAULT '0' COMMENT '店铺关闭时间',
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='店铺数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_shop`
--

LOCK TABLES `ns_shop` WRITE;
/*!40000 ALTER TABLE `ns_shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_shop_ad`
--

DROP TABLE IF EXISTS `ns_shop_ad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_shop_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `ad_image` varchar(255) NOT NULL DEFAULT '' COMMENT '广告图片',
  `link_url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `type` int(1) NOT NULL DEFAULT '0' COMMENT '类型 0 -- pc端  1-- 手机端 ',
  `background` varchar(255) NOT NULL DEFAULT '#FFFFFF' COMMENT '背景色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=5461 COMMENT='店铺广告设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_shop_ad`
--

LOCK TABLES `ns_shop_ad` WRITE;
/*!40000 ALTER TABLE `ns_shop_ad` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_shop_ad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_shop_coin_records`
--

DROP TABLE IF EXISTS `ns_shop_coin_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_shop_coin_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `num` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '购物币数量',
  `account_type` int(11) NOT NULL DEFAULT '1' COMMENT '增加或减少类型',
  `type_alis_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联ID',
  `is_display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `text` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺购物币记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_shop_coin_records`
--

LOCK TABLES `ns_shop_coin_records` WRITE;
/*!40000 ALTER TABLE `ns_shop_coin_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_shop_coin_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_shop_express_address`
--

DROP TABLE IF EXISTS `ns_shop_express_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_shop_express_address` (
  `express_address_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '物流地址id',
  `shop_id` int(11) NOT NULL COMMENT '商铺id',
  `contact` varchar(100) NOT NULL DEFAULT '' COMMENT '联系人',
  `mobile` varchar(50) NOT NULL DEFAULT '' COMMENT '手机',
  `phone` varchar(50) NOT NULL DEFAULT '' COMMENT '电话',
  `company_name` varchar(100) NOT NULL DEFAULT '' COMMENT '公司名称',
  `province` smallint(6) NOT NULL DEFAULT '0' COMMENT '所在地省',
  `city` smallint(6) NOT NULL DEFAULT '0' COMMENT '所在地市',
  `district` smallint(6) NOT NULL DEFAULT '0' COMMENT '所在地区县',
  `zipcode` varchar(6) NOT NULL DEFAULT '' COMMENT '邮编',
  `address` varchar(100) NOT NULL DEFAULT '' COMMENT '详细地址',
  `is_consigner` tinyint(2) NOT NULL DEFAULT '0' COMMENT '发货地址标记',
  `is_receiver` tinyint(2) NOT NULL DEFAULT '0' COMMENT '收货地址标记',
  `create_date` int(11) DEFAULT '0' COMMENT '创建日期',
  `modify_date` int(11) DEFAULT '0' COMMENT '修改日期',
  PRIMARY KEY (`express_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1092 COMMENT='物流地址';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_shop_express_address`
--

LOCK TABLES `ns_shop_express_address` WRITE;
/*!40000 ALTER TABLE `ns_shop_express_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_shop_express_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_shop_group`
--

DROP TABLE IF EXISTS `ns_shop_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_shop_group` (
  `shop_group_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分组ID',
  `group_name` varchar(50) NOT NULL DEFAULT '' COMMENT '分组名称',
  `group_sort` int(11) NOT NULL DEFAULT '1' COMMENT '分组排序号',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`shop_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2730 COMMENT='店铺分组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_shop_group`
--

LOCK TABLES `ns_shop_group` WRITE;
/*!40000 ALTER TABLE `ns_shop_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_shop_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_shop_navigation`
--

DROP TABLE IF EXISTS `ns_shop_navigation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_shop_navigation` (
  `nav_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `nav_title` varchar(255) NOT NULL DEFAULT '' COMMENT '导航名称',
  `nav_url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `type` int(11) NOT NULL DEFAULT '3' COMMENT '纵向所在位置1.头部2.中部3底部',
  `sort` int(11) NOT NULL COMMENT '排序号',
  `align` int(11) NOT NULL DEFAULT '1' COMMENT '横向所在位置1 左  2  右',
  `nav_type` int(11) DEFAULT '1',
  `is_blank` int(11) DEFAULT '0',
  `template_name` varchar(255) DEFAULT '',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`nav_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1489 COMMENT='店铺导航管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_shop_navigation`
--

LOCK TABLES `ns_shop_navigation` WRITE;
/*!40000 ALTER TABLE `ns_shop_navigation` DISABLE KEYS */;
INSERT INTO `ns_shop_navigation` VALUES (2,0,'首页','/index',1,0,0,0,0,'首页',1544258764,1544258784),(4,0,'新闻中心','/cms/articlelist',1,5,0,0,0,'新闻中心',1544259153,1544259153),(5,0,'帮助中心','/helpcenter/index',1,6,0,0,0,'帮助中心',1544259574,1544262878),(6,0,'必备耗材','http://nshop.xiao360.com/index.php?s=/goods/goodslist&amp;category_id=1',1,1,0,1,0,'',1544259800,1544259833),(7,0,'节日礼品','http://nshop.xiao360.com/index.php?s=/goods/goodslist&amp;category_id=2',1,2,0,1,0,'',1544259868,1544259868),(8,0,'宣传物料','http://nshop.xiao360.com/index.php?s=/goods/goodslist&amp;category_id=3',1,3,0,1,0,'',1544259893,1544259893),(9,0,'衍生品','http://nshop.xiao360.com/index.php?s=/goods/goodslist&amp;category_id=4',1,4,0,1,0,'',1544259917,1544259917);
/*!40000 ALTER TABLE `ns_shop_navigation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_shop_navigation_template`
--

DROP TABLE IF EXISTS `ns_shop_navigation_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_shop_navigation_template` (
  `template_id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(50) NOT NULL DEFAULT '' COMMENT '模板名称',
  `template_url` varchar(255) NOT NULL DEFAULT '' COMMENT '访问路径',
  `is_use` int(11) NOT NULL DEFAULT '1' COMMENT '是否有效',
  `use_type` int(11) NOT NULL COMMENT '1 shop端 0wap端',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=5461 COMMENT='导航 的 系统默认模板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_shop_navigation_template`
--

LOCK TABLES `ns_shop_navigation_template` WRITE;
/*!40000 ALTER TABLE `ns_shop_navigation_template` DISABLE KEYS */;
INSERT INTO `ns_shop_navigation_template` VALUES (1,'首页','/index',1,1,1497706628),(2,'限时折扣','/index/discount',1,1,1497706628),(3,'品牌列表','/goods/brandlist',1,1,1497706628),(4,'积分中心','/goods/integralcenter',1,1,1500717235),(5,'新闻中心','/cms/articlelist',1,1,1500717235),(6,'帮助中心','/helpcenter/index',1,1,1500717235);
/*!40000 ALTER TABLE `ns_shop_navigation_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_shop_order_account_records`
--

DROP TABLE IF EXISTS `ns_shop_order_account_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_shop_order_account_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `order_no` varchar(255) NOT NULL DEFAULT '' COMMENT '订单编号',
  `order_goods_id` int(11) NOT NULL COMMENT '订单项ID',
  `goods_pay_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单项实际支付金额',
  `rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品平台佣金比率',
  `shop_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺获取金额',
  `platform_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台获取金额',
  `is_refund` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否产生退款',
  `refund_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实际退款金额',
  `shop_refund_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺扣减余额',
  `platform_refund_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台扣减余额',
  `is_issue` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否已经结算',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=655 COMMENT='店铺针对订单的金额分配';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_shop_order_account_records`
--

LOCK TABLES `ns_shop_order_account_records` WRITE;
/*!40000 ALTER TABLE `ns_shop_order_account_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_shop_order_account_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_shop_weixin_share`
--

DROP TABLE IF EXISTS `ns_shop_weixin_share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_shop_weixin_share` (
  `shop_id` int(11) NOT NULL,
  `goods_param_1` varchar(255) NOT NULL DEFAULT '' COMMENT '商品分享价格标示',
  `goods_param_2` varchar(255) NOT NULL DEFAULT '' COMMENT '商品分享内容',
  `shop_param_1` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺分享标题',
  `shop_param_2` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺分享主题',
  `shop_param_3` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺分享内容',
  `qrcode_param_1` varchar(255) NOT NULL DEFAULT '' COMMENT '二维码分享主题',
  `qrcode_param_2` varchar(255) NOT NULL DEFAULT '' COMMENT '二维码分享内容',
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='店铺分享内容设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_shop_weixin_share`
--

LOCK TABLES `ns_shop_weixin_share` WRITE;
/*!40000 ALTER TABLE `ns_shop_weixin_share` DISABLE KEYS */;
INSERT INTO `ns_shop_weixin_share` VALUES (0,'','','','','','','');
/*!40000 ALTER TABLE `ns_shop_weixin_share` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_supplier`
--

DROP TABLE IF EXISTS `ns_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_supplier` (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `supplier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '供货商名称',
  `desc` varchar(1000) NOT NULL DEFAULT '' COMMENT '供货商描述',
  `linkman_tel` varchar(255) NOT NULL DEFAULT '' COMMENT '联系人电话',
  `linkman_name` varchar(50) NOT NULL DEFAULT '' COMMENT '联系人姓名',
  `linkman_address` varchar(255) NOT NULL DEFAULT '' COMMENT '联系人地址',
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供货商表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_supplier`
--

LOCK TABLES `ns_supplier` WRITE;
/*!40000 ALTER TABLE `ns_supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_addons`
--

DROP TABLE IF EXISTS `sys_addons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  `has_addonslist` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有插件列表',
  `content` text NOT NULL COMMENT '详情',
  `config_hook` varchar(255) NOT NULL DEFAULT '' COMMENT '自定义配置文件钩子',
  `create_time` int(11) DEFAULT '0' COMMENT '安装时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='插件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_addons`
--

LOCK TABLES `sys_addons` WRITE;
/*!40000 ALTER TABLE `sys_addons` DISABLE KEYS */;
INSERT INTO `sys_addons` VALUES (2,'wxtemplatemsg','微信模板消息','微信模板消息',1,'[]','niushop','1.0',0,0,'','wxtemplatemsg',1544154260);
/*!40000 ALTER TABLE `sys_addons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_addons_weixin_template_msg`
--

DROP TABLE IF EXISTS `sys_addons_weixin_template_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_addons_weixin_template_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `instance_id` int(11) NOT NULL COMMENT '店铺id（单店版为0）',
  `template_no` varchar(55) NOT NULL COMMENT '模版编号',
  `template_id` varbinary(55) DEFAULT NULL COMMENT '微信模板消息的ID',
  `title` varchar(100) NOT NULL COMMENT '模版标题',
  `is_enable` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `headtext` varchar(255) NOT NULL COMMENT '头部文字',
  `bottomtext` varchar(255) NOT NULL COMMENT '底部文字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096 COMMENT='微信实例消息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_addons_weixin_template_msg`
--

LOCK TABLES `sys_addons_weixin_template_msg` WRITE;
/*!40000 ALTER TABLE `sys_addons_weixin_template_msg` DISABLE KEYS */;
INSERT INTO `sys_addons_weixin_template_msg` VALUES (1,0,'OPENTM203347141','','会员注册成功通知',1,'恭喜，您已成功注册为会员！','恭喜，您已成为会员，您将享受会员所有权利！'),(2,0,'OPENTM200444240','','订单提交成功通知',1,'亲！您已成功创建订单，点击进入完成付款。','感谢您的支持，我们将为您提供更好的服务。'),(3,0,'OPENTM201541214','','订单发货通知',1,'亲，你的订单已发货','请关注订单,注意查收'),(4,0,'OPENTM200444326','','订单付款成功通知',1,'亲！您的订单已成功付款。',''),(5,0,'OPENTM207103254','','退款申请',1,'您已申请退款，我们将尽快处理您提交的退款申请。您可以在“退换货”中查看退款进度','如您的退款有疑问，请联系我们的客服人员，帮助您解决处理！'),(6,0,'OPENTM205986235','','退款结果通知',1,'亲，您的退款已处理。','如您还有疑问，请与客服人员联系。'),(7,0,'OPENTM207292959','','提现申请提醒',1,'亲，您的提现申请已提交','我们将在1到3个工作日内处理完毕，请耐心等待。'),(8,0,'OPENTM207292959','','提现审核结果通知',1,'亲，您提现申请已通过','我们将在1到3个工作日内处理完毕，请耐心等待。'),(9,0,'OPENTM409846856','','申请通过通知',1,'您的推广员申请已经通过','如您还有疑问，请与客服人员联系。'),(10,0,'OPENTM409846856','','下级申请通过通知',1,'您的下级推广员申请已经通过','如您还有疑问，请与客服人员联系。'),(11,0,'OPENTM409846856','','下下级申请通过通知',1,'您的下下级推广员申请已经通过','如您还有疑问，请与客服人员联系。'),(12,0,'OPENTM201010537','','本店分销订单提成通知',1,'亲，您已成功分销出一笔订单，继续努力哦',''),(13,0,'OPENTM201010537','','下级分店分销订单提成通知',1,'亲，您的下级推广员成功分销出一笔订单，继续努力哦',''),(14,0,'OPENTM201010537','','下下级分店分销订单提成通知',1,'亲，您的下下级推广员成功分销出一笔订单，继续努力哦','');
/*!40000 ALTER TABLE `sys_addons_weixin_template_msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_album_class`
--

DROP TABLE IF EXISTS `sys_album_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_album_class` (
  `album_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '相册id',
  `shop_id` int(10) NOT NULL DEFAULT '1' COMMENT '店铺id',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '上级相册ID',
  `album_name` varchar(100) NOT NULL COMMENT '相册名称',
  `album_cover` varchar(255) NOT NULL DEFAULT '' COMMENT '相册封面',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为默认相册,1代表默认',
  `sort` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`album_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='相册表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_album_class`
--

LOCK TABLES `sys_album_class` WRITE;
/*!40000 ALTER TABLE `sys_album_class` DISABLE KEYS */;
INSERT INTO `sys_album_class` VALUES (30,0,0,'默认相册','0',1,1,1497064831),(31,0,0,'书籍商品图片','',0,1,1543999560);
/*!40000 ALTER TABLE `sys_album_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_album_picture`
--

DROP TABLE IF EXISTS `sys_album_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_album_picture` (
  `pic_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '相册图片表id',
  `shop_id` int(10) unsigned DEFAULT '1' COMMENT '所属实例id',
  `album_id` int(10) unsigned NOT NULL COMMENT '相册id',
  `is_wide` int(11) NOT NULL DEFAULT '0' COMMENT '是否宽屏',
  `pic_name` varchar(100) NOT NULL COMMENT '图片名称',
  `pic_tag` varchar(255) NOT NULL DEFAULT '' COMMENT '图片标签',
  `pic_cover` varchar(255) NOT NULL COMMENT '原图图片路径',
  `pic_size` varchar(255) NOT NULL COMMENT '原图大小',
  `pic_spec` varchar(100) NOT NULL COMMENT '原图规格',
  `pic_cover_big` varchar(255) NOT NULL DEFAULT '' COMMENT '大图路径',
  `pic_size_big` varchar(255) NOT NULL DEFAULT '0' COMMENT '大图大小',
  `pic_spec_big` varchar(100) NOT NULL DEFAULT '' COMMENT '大图规格',
  `pic_cover_mid` varchar(255) NOT NULL DEFAULT '' COMMENT '中图路径',
  `pic_size_mid` varchar(255) NOT NULL DEFAULT '0' COMMENT '中图大小',
  `pic_spec_mid` varchar(100) NOT NULL DEFAULT '' COMMENT '中图规格',
  `pic_cover_small` varchar(255) NOT NULL DEFAULT '' COMMENT '小图路径',
  `pic_size_small` varchar(255) NOT NULL DEFAULT '0' COMMENT '小图大小',
  `pic_spec_small` varchar(255) NOT NULL DEFAULT '' COMMENT '小图规格',
  `pic_cover_micro` varchar(255) NOT NULL DEFAULT '' COMMENT '微图路径',
  `pic_size_micro` varchar(255) NOT NULL DEFAULT '0' COMMENT '微图大小',
  `pic_spec_micro` varchar(255) NOT NULL DEFAULT '' COMMENT '微图规格',
  `upload_time` int(11) DEFAULT '0' COMMENT '图片上传时间',
  `upload_type` int(11) DEFAULT '1' COMMENT '图片外链',
  `domain` varchar(255) DEFAULT '' COMMENT '图片外链',
  `bucket` varchar(255) DEFAULT '' COMMENT '存储空间名称',
  PRIMARY KEY (`pic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=204 COMMENT='相册图片表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_album_picture`
--

LOCK TABLES `sys_album_picture` WRITE;
/*!40000 ALTER TABLE `sys_album_picture` DISABLE KEYS */;
INSERT INTO `sys_album_picture` VALUES (1,0,30,0,'login1543999312','login','upload/goods/20181205/9c6f1c006b731509cf75d857e9d1638d.png','750,363','750,363','upload/goods/20181205/68020b4d396691a1e5dc804c74e626271.png','700,700','700,700','upload/goods/20181205/68020b4d396691a1e5dc804c74e626272.png','360,360','360,360','upload/goods/20181205/68020b4d396691a1e5dc804c74e626273.png','240,240','240,240','upload/goods/20181205/68020b4d396691a1e5dc804c74e626274.png','60,60','60,60',1543999317,1,'',''),(2,0,31,0,'login1543999570','login','upload/goods/20181205/25222047d51fc8f6de5cc068d5c861e3.png','750,363','750,363','upload/goods/20181205/7295f7742d44847130d6425696a2c4581.png','700,700','700,700','upload/goods/20181205/7295f7742d44847130d6425696a2c4582.png','360,360','360,360','upload/goods/20181205/7295f7742d44847130d6425696a2c4583.png','240,240','240,240','upload/goods/20181205/7295f7742d44847130d6425696a2c4584.png','60,60','60,60',1543999575,1,'',''),(3,0,30,0,'login1543999584','login','upload/goods/20181205/40211fda0640f4aaa5e1a125c0d2cbb6.png','750,363','750,363','upload/goods/20181205/2f885537ec267758dca9d98f3ff60bcb1.png','700,700','700,700','upload/goods/20181205/2f885537ec267758dca9d98f3ff60bcb2.png','360,360','360,360','upload/goods/20181205/2f885537ec267758dca9d98f3ff60bcb3.png','240,240','240,240','upload/goods/20181205/2f885537ec267758dca9d98f3ff60bcb4.png','60,60','60,60',1543999588,1,'',''),(4,0,30,0,'bl1544087790','bl','upload/goods/20181206/c0cdfd1e67ddd977e7589766d77d5e9d.jpg','500,432','500,432','upload/goods/20181206/fd8fe76eada28a96964b322ab562f6a81.jpg','700,700','700,700','upload/goods/20181206/fd8fe76eada28a96964b322ab562f6a82.jpg','360,360','360,360','upload/goods/20181206/fd8fe76eada28a96964b322ab562f6a83.jpg','240,240','240,240','upload/goods/20181206/fd8fe76eada28a96964b322ab562f6a84.jpg','60,60','60,60',1544087792,1,'',''),(5,0,30,0,'bl1544087922','bl','upload/goods/20181206/37f5952c3914b8572a5807e5d34d685d.jpg','500,432','500,432','upload/goods/20181206/63e2ced3d53192fd181777713a6542fd1.jpg','700,700','700,700','upload/goods/20181206/63e2ced3d53192fd181777713a6542fd2.jpg','360,360','360,360','upload/goods/20181206/63e2ced3d53192fd181777713a6542fd3.jpg','240,240','240,240','upload/goods/20181206/63e2ced3d53192fd181777713a6542fd4.jpg','60,60','60,60',1544087925,1,'',''),(6,0,30,0,'fb1544087931','fb','upload/goods/20181206/d03bb13279de84da24d4d32d3d8c4c1a.jpg','500,432','500,432','upload/goods/20181206/976e31c70357c6b012163f3179c846391.jpg','700,700','700,700','upload/goods/20181206/976e31c70357c6b012163f3179c846392.jpg','360,360','360,360','upload/goods/20181206/976e31c70357c6b012163f3179c846393.jpg','240,240','240,240','upload/goods/20181206/976e31c70357c6b012163f3179c846394.jpg','60,60','60,60',1544087933,1,'',''),(7,0,30,0,'wo1544088193','wo','upload/goods/20181206/e329fb34593096c07fd183dc0e8bead6.jpg','500,380','500,380','upload/goods/20181206/ff8415ab502c981867380d97a2d08e791.jpg','700,700','700,700','upload/goods/20181206/ff8415ab502c981867380d97a2d08e792.jpg','360,360','360,360','upload/goods/20181206/ff8415ab502c981867380d97a2d08e793.jpg','240,240','240,240','upload/goods/20181206/ff8415ab502c981867380d97a2d08e794.jpg','60,60','60,60',1544088198,1,'',''),(8,0,30,0,'pt1544088505','pt','upload/goods/20181206/6e1d349d7ff69f1f012486f6f811f235.jpg','1280,960','1280,960','upload/goods/20181206/d5347234b5d9bd8b7e4faaffb816ca9e1.jpg','700,700','700,700','upload/goods/20181206/d5347234b5d9bd8b7e4faaffb816ca9e2.jpg','360,360','360,360','upload/goods/20181206/d5347234b5d9bd8b7e4faaffb816ca9e3.jpg','240,240','240,240','upload/goods/20181206/d5347234b5d9bd8b7e4faaffb816ca9e4.jpg','60,60','60,60',1544088510,1,'',''),(9,0,30,0,'ylp1544088823','ylp','upload/goods/20181206/b2273a979b3b3437ae62e16ff7325c4b.jpg','226,180','226,180','upload/goods/20181206/695dc5f94cdcb1675f61b1eeccd24f021.jpg','700,700','700,700','upload/goods/20181206/695dc5f94cdcb1675f61b1eeccd24f022.jpg','360,360','360,360','upload/goods/20181206/695dc5f94cdcb1675f61b1eeccd24f023.jpg','240,240','240,240','upload/goods/20181206/695dc5f94cdcb1675f61b1eeccd24f024.jpg','60,60','60,60',1544088824,1,'','');
/*!40000 ALTER TABLE `sys_album_picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_area`
--

DROP TABLE IF EXISTS `sys_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_area` (
  `area_id` int(11) NOT NULL AUTO_INCREMENT,
  `area_name` varchar(50) NOT NULL DEFAULT '',
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`area_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2048 COMMENT='全部区域表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_area`
--

LOCK TABLES `sys_area` WRITE;
/*!40000 ALTER TABLE `sys_area` DISABLE KEYS */;
INSERT INTO `sys_area` VALUES (1,'华东',0),(2,'华北',0),(3,'华南',0),(4,'华中',0),(5,'东北',0),(6,'西北',0),(7,'西南',0),(8,'港澳台',0);
/*!40000 ALTER TABLE `sys_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_city`
--

DROP TABLE IF EXISTS `sys_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `province_id` int(11) NOT NULL DEFAULT '0',
  `city_name` varchar(255) NOT NULL DEFAULT '',
  `zipcode` varchar(6) NOT NULL DEFAULT '',
  `sort` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`city_id`),
  KEY `IDX_g_city_CityName` (`city_name`)
) ENGINE=InnoDB AUTO_INCREMENT=346 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=135;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_city`
--

LOCK TABLES `sys_city` WRITE;
/*!40000 ALTER TABLE `sys_city` DISABLE KEYS */;
INSERT INTO `sys_city` VALUES (1,1,'北京市','100000',1),(2,2,'天津市','100000',0),(3,3,'石家庄市','050000',0),(4,3,'唐山市','063000',0),(5,3,'秦皇岛市','066000',0),(6,3,'邯郸市','056000',0),(7,3,'邢台市','054000',0),(8,3,'保定市','071000',0),(9,3,'张家口市','075000',0),(10,3,'承德市','067000',0),(11,3,'沧州市','061000',0),(12,3,'廊坊市','065000',0),(13,3,'衡水市','053000',0),(14,4,'太原市','030000',0),(15,4,'大同市','037000',0),(16,4,'阳泉市','045000',0),(17,4,'长治市','046000',0),(18,4,'晋城市','048000',0),(19,4,'朔州市','036000',0),(20,4,'晋中市','030600',0),(21,4,'运城市','044000',0),(22,4,'忻州市','034000',0),(23,4,'临汾市','041000',0),(24,4,'吕梁市','030500',0),(25,5,'呼和浩特市','010000',0),(26,5,'包头市','014000',0),(27,5,'乌海市','016000',0),(28,5,'赤峰市','024000',0),(29,5,'通辽市','028000',0),(30,5,'鄂尔多斯市','010300',0),(31,5,'呼伦贝尔市','021000',0),(32,5,'巴彦淖尔市','014400',0),(33,5,'乌兰察布市','011800',0),(34,5,'兴安盟','137500',0),(35,5,'锡林郭勒盟','011100',0),(36,5,'阿拉善盟','016000',0),(37,6,'沈阳市','110000',0),(38,6,'大连市','116000',0),(39,6,'鞍山市','114000',0),(40,6,'抚顺市','113000',0),(41,6,'本溪市','117000',0),(42,6,'丹东市','118000',0),(43,6,'锦州市','121000',0),(44,6,'营口市','115000',0),(45,6,'阜新市','123000',0),(46,6,'辽阳市','111000',0),(47,6,'盘锦市','124000',0),(48,6,'铁岭市','112000',0),(49,6,'朝阳市','122000',0),(50,6,'葫芦岛市','125000',0),(51,7,'长春市','130000',0),(52,7,'吉林市','132000',0),(53,7,'四平市','136000',0),(54,7,'辽源市','136200',0),(55,7,'通化市','134000',0),(56,7,'白山市','134300',0),(57,7,'松原市','131100',0),(58,7,'白城市','137000',0),(59,7,'延边朝鲜族自治州','133000',0),(60,8,'哈尔滨市','150000',0),(61,8,'齐齐哈尔市','161000',0),(62,8,'鸡西市','158100',0),(63,8,'鹤岗市','154100',0),(64,8,'双鸭山市','155100',0),(65,8,'大庆市','163000',0),(66,8,'伊春市','152300',0),(67,8,'佳木斯市','154000',0),(68,8,'七台河市','154600',0),(69,8,'牡丹江市','157000',0),(70,8,'黑河市','164300',0),(71,8,'绥化市','152000',0),(72,8,'大兴安岭地区','165000',0),(73,9,'上海市','200000',0),(74,10,'南京市','210000',0),(75,10,'无锡市','214000',0),(76,10,'徐州市','221000',0),(77,10,'常州市','213000',0),(78,10,'苏州市','215000',0),(79,10,'南通市','226000',0),(80,10,'连云港市','222000',0),(81,10,'淮安市','223200',0),(82,10,'盐城市','224000',0),(83,10,'扬州市','225000',0),(84,10,'镇江市','212000',0),(85,10,'泰州市','225300',0),(86,10,'宿迁市','223800',0),(87,11,'杭州市','310000',0),(88,11,'宁波市','315000',0),(89,11,'温州市','325000',0),(90,11,'嘉兴市','314000',0),(91,11,'湖州市','313000',0),(92,11,'绍兴市','312000',0),(93,11,'金华市','321000',0),(94,11,'衢州市','324000',0),(95,11,'舟山市','316000',0),(96,11,'台州市','318000',0),(97,11,'丽水市','323000',0),(98,12,'合肥市','230000',0),(99,12,'芜湖市','241000',0),(100,12,'蚌埠市','233000',0),(101,12,'淮南市','232000',0),(102,12,'马鞍山市','243000',0),(103,12,'淮北市','235000',0),(104,12,'铜陵市','244000',0),(105,12,'安庆市','246000',0),(106,12,'黄山市','242700',0),(107,12,'滁州市','239000',0),(108,12,'阜阳市','236100',0),(109,12,'宿州市','234100',0),(110,12,'巢湖市','238000',0),(111,12,'六安市','237000',0),(112,12,'亳州市','236800',0),(113,12,'池州市','247100',0),(114,12,'宣城市','366000',0),(115,13,'福州市','350000',0),(116,13,'厦门市','361000',0),(117,13,'莆田市','351100',0),(118,13,'三明市','365000',0),(119,13,'泉州市','362000',0),(120,13,'漳州市','363000',0),(121,13,'南平市','353000',0),(122,13,'龙岩市','364000',0),(123,13,'宁德市','352100',0),(124,14,'南昌市','330000',0),(125,14,'景德镇市','333000',0),(126,14,'萍乡市','337000',0),(127,14,'九江市','332000',0),(128,14,'新余市','338000',0),(129,14,'鹰潭市','335000',0),(130,14,'赣州市','341000',0),(131,14,'吉安市','343000',0),(132,14,'宜春市','336000',0),(133,14,'抚州市','332900',0),(134,14,'上饶市','334000',0),(135,15,'济南市','250000',0),(136,15,'青岛市','266000',0),(137,15,'淄博市','255000',0),(138,15,'枣庄市','277100',0),(139,15,'东营市','257000',0),(140,15,'烟台市','264000',0),(141,15,'潍坊市','261000',0),(142,15,'济宁市','272100',0),(143,15,'泰安市','271000',0),(144,15,'威海市','265700',0),(145,15,'日照市','276800',0),(146,15,'莱芜市','271100',0),(147,15,'临沂市','276000',0),(148,15,'德州市','253000',0),(149,15,'聊城市','252000',0),(150,15,'滨州市','256600',0),(151,15,'荷泽市','255000',0),(152,16,'郑州市','450000',0),(153,16,'开封市','475000',0),(154,16,'洛阳市','471000',0),(155,16,'平顶山市','467000',0),(156,16,'安阳市','454900',0),(157,16,'鹤壁市','456600',0),(158,16,'新乡市','453000',0),(159,16,'焦作市','454100',0),(160,16,'濮阳市','457000',0),(161,16,'许昌市','461000',0),(162,16,'漯河市','462000',0),(163,16,'三门峡市','472000',0),(164,16,'南阳市','473000',0),(165,16,'商丘市','476000',0),(166,16,'信阳市','464000',0),(167,16,'周口市','466000',0),(168,16,'驻马店市','463000',0),(169,17,'武汉市','430000',0),(170,17,'黄石市','435000',0),(171,17,'十堰市','442000',0),(172,17,'宜昌市','443000',0),(173,17,'襄樊市','441000',0),(174,17,'鄂州市','436000',0),(175,17,'荆门市','448000',0),(176,17,'孝感市','432100',0),(177,17,'荆州市','434000',0),(178,17,'黄冈市','438000',0),(179,17,'咸宁市','437000',0),(180,17,'随州市','441300',0),(181,17,'恩施土家族苗族自治州','445000',0),(182,17,'神农架','442400',0),(183,18,'长沙市','410000',0),(184,18,'株洲市','412000',0),(185,18,'湘潭市','411100',0),(186,18,'衡阳市','421000',0),(187,18,'邵阳市','422000',0),(188,18,'岳阳市','414000',0),(189,18,'常德市','415000',0),(190,18,'张家界市','427000',0),(191,18,'益阳市','413000',0),(192,18,'郴州市','423000',0),(193,18,'永州市','425000',0),(194,18,'怀化市','418000',0),(195,18,'娄底市','417000',0),(196,18,'湘西土家族苗族自治州','416000',0),(197,19,'广州市','510000',0),(198,19,'韶关市','521000',0),(199,19,'深圳市','518000',0),(200,19,'珠海市','519000',0),(201,19,'汕头市','515000',0),(202,19,'佛山市','528000',0),(203,19,'江门市','529000',0),(204,19,'湛江市','524000',0),(205,19,'茂名市','525000',0),(206,19,'肇庆市','526000',0),(207,19,'惠州市','516000',0),(208,19,'梅州市','514000',0),(209,19,'汕尾市','516600',1),(210,19,'河源市','517000',0),(211,19,'阳江市','529500',0),(212,19,'清远市','511500',0),(213,19,'东莞市','511700',0),(214,19,'中山市','528400',0),(215,19,'潮州市','515600',0),(216,19,'揭阳市','522000',0),(217,19,'云浮市','527300',0),(218,20,'南宁市','530000',0),(219,20,'柳州市','545000',0),(220,20,'桂林市','541000',0),(221,20,'梧州市','543000',0),(222,20,'北海市','536000',0),(223,20,'防城港市','538000',0),(224,20,'钦州市','535000',0),(225,20,'贵港市','537100',0),(226,20,'玉林市','537000',0),(227,20,'百色市','533000',0),(228,20,'贺州市','542800',0),(229,20,'河池市','547000',0),(230,20,'来宾市','546100',0),(231,20,'崇左市','532200',0),(232,21,'海口市','570000',0),(233,21,'三亚市','572000',0),(234,22,'重庆市','400000',0),(235,23,'成都市','610000',0),(236,23,'自贡市','643000',0),(237,23,'攀枝花市','617000',0),(238,23,'泸州市','646100',0),(239,23,'德阳市','618000',0),(240,23,'绵阳市','621000',0),(241,23,'广元市','628000',0),(242,23,'遂宁市','629000',0),(243,23,'内江市','641000',0),(244,23,'乐山市','614000',0),(245,23,'南充市','637000',0),(246,23,'眉山市','612100',0),(247,23,'宜宾市','644000',0),(248,23,'广安市','638000',0),(249,23,'达州市','635000',0),(250,23,'雅安市','625000',0),(251,23,'巴中市','635500',0),(252,23,'资阳市','641300',0),(253,23,'阿坝藏族羌族自治州','624600',0),(254,23,'甘孜藏族自治州','626000',0),(255,23,'凉山彝族自治州','615000',0),(256,24,'贵阳市','55000',0),(257,24,'六盘水市','553000',0),(258,24,'遵义市','563000',0),(259,24,'安顺市','561000',0),(260,24,'铜仁地区','554300',0),(261,24,'黔西南布依族苗族自治州','551500',0),(262,24,'毕节地区','551700',0),(263,24,'黔东南苗族侗族自治州','551500',0),(264,24,'黔南布依族苗族自治州','550100',0),(265,25,'昆明市','650000',0),(266,25,'曲靖市','655000',0),(267,25,'玉溪市','653100',0),(268,25,'保山市','678000',0),(269,25,'昭通市','657000',0),(270,25,'丽江市','674100',0),(271,25,'思茅市','665000',0),(272,25,'临沧市','677000',0),(273,25,'楚雄彝族自治州','675000',0),(274,25,'红河哈尼族彝族自治州','654400',0),(275,25,'文山壮族苗族自治州','663000',0),(276,25,'西双版纳傣族自治州','666200',0),(277,25,'大理白族自治州','671000',0),(278,25,'德宏傣族景颇族自治州','678400',0),(279,25,'怒江傈僳族自治州','671400',0),(280,25,'迪庆藏族自治州','674400',0),(281,26,'拉萨市','850000',0),(282,26,'昌都地区','854000',0),(283,26,'山南地区','856000',0),(284,26,'日喀则地区','857000',0),(285,26,'那曲地区','852000',0),(286,26,'阿里地区','859100',0),(287,26,'林芝地区','860100',0),(288,27,'西安市','710000',0),(289,27,'铜川市','727000',0),(290,27,'宝鸡市','721000',0),(291,27,'咸阳市','712000',0),(292,27,'渭南市','714000',0),(293,27,'延安市','716000',0),(294,27,'汉中市','723000',0),(295,27,'榆林市','719000',0),(296,27,'安康市','725000',0),(297,27,'商洛市','711500',0),(298,28,'兰州市','730000',0),(299,28,'嘉峪关市','735100',0),(300,28,'金昌市','737100',0),(301,28,'白银市','730900',0),(302,28,'天水市','741000',0),(303,28,'武威市','733000',0),(304,28,'张掖市','734000',0),(305,28,'平凉市','744000',0),(306,28,'酒泉市','735000',0),(307,28,'庆阳市','744500',0),(308,28,'定西市','743000',0),(309,28,'陇南市','742100',0),(310,28,'临夏回族自治州','731100',0),(311,28,'甘南藏族自治州','747000',0),(312,29,'西宁市','810000',0),(313,29,'海东地区','810600',0),(314,29,'海北藏族自治州','810300',0),(315,29,'黄南藏族自治州','811300',0),(316,29,'海南藏族自治州','813000',0),(317,29,'果洛藏族自治州','814000',0),(318,29,'玉树藏族自治州','815000',0),(319,29,'海西蒙古族藏族自治州','817000',0),(320,30,'银川市','750000',0),(321,30,'石嘴山市','753000',0),(322,30,'吴忠市','751100',0),(323,30,'固原市','756000',0),(324,30,'中卫市','751700',0),(325,31,'乌鲁木齐市','830000',0),(326,31,'克拉玛依市','834000',0),(327,31,'吐鲁番地区','838000',0),(328,31,'哈密地区','839000',0),(329,31,'昌吉回族自治州','831100',0),(330,31,'博尔塔拉蒙古自治州','833400',0),(331,31,'巴音郭楞蒙古自治州','841000',0),(332,31,'阿克苏地区','843000',0),(333,31,'克孜勒苏柯尔克孜自治州','835600',0),(334,31,'喀什地区','844000',0),(335,31,'和田地区','848000',0),(336,31,'伊犁哈萨克自治州','833200',0),(337,31,'塔城地区','834700',0),(338,31,'阿勒泰地区','836500',0),(339,31,'石河子市','832000',0),(340,31,'阿拉尔市','843300',0),(341,31,'图木舒克市','843900',0),(342,31,'五家渠市','831300',0),(343,32,'香港特别行政区','000000',0),(344,33,'澳门特别行政区','000000',0),(345,34,'台湾省','000000',0);
/*!40000 ALTER TABLE `sys_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `instance_id` int(11) NOT NULL DEFAULT '1' COMMENT '实例ID',
  `key` varchar(255) NOT NULL DEFAULT '' COMMENT '配置项WCHAT,QQ,WPAY,ALIPAY...',
  `value` varchar(1000) NOT NULL DEFAULT '' COMMENT '配置值json',
  `desc` varchar(1000) NOT NULL DEFAULT '' COMMENT '描述',
  `is_use` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否启用 1启用 0不启用',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=963 COMMENT='第三方配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (12,0,'USERNOTICE','','',1,1487830081,1497102938),(13,0,'HOTKEY','[\"72\\u8272\\u7c89\\u7b14\",\"\\u65af\\u739b\\u7279\\u7b14\\u5e18\",\"\\u5c0f\\u4e11\\u62fc\\u56fe\"]','',1,1487831749,1544170123),(14,0,'DEFAULTKEY','\"72\\u8272\\u7c89\\u7b14\"','',1,1487831788,1544170035),(17,0,'QQLOGIN','{\"APP_KEY\":\"\",\"APP_SECRET\":\"\",\"AUTHORIZE\":\"http:\\/\\/b2c1.01.niushop.com.cn\",\"CALLBACK\":\"http:\\/\\/b2c1.01.niushop.com.cn\\/wap\\/login\\/callback\"}','qq',0,1488350925,1544070682),(18,0,'WCHAT','{\"APP_KEY\":\"\",\"APP_SECRET\":\"\",\"AUTHORIZE\":\"http:\\/\\/b2c1.01.niushop.com.cn\",\"CALLBACK\":\"http:\\/\\/b2c1.01.niushop.com.cn\\/wap\\/Login\\/callback\"}','微信',0,1488350947,1544070680),(21,0,'ALIPAY','{\"ali_partnerid\":\"\",\"ali_seller\":\"\",\"ali_key\":\"\"}','',1,1488442697,1544155272),(22,0,'EMAILMESSAGE','{\"email_host\":\"smtp.163.com\",\"email_port\":\"465\",\"email_addr\":\"\",\"email_id\":\"\",\"email_pass\":\"\"}','',1,1488524450,1544239813),(125,0,'WPAY','{\"appid\":\"\",\"appkey\":\"\",\"mch_id\":\"\",\"mch_key\":\"\"}','',1,1497087123,1544155289),(127,0,'SHOPWCHAT','{\"appid\":\"\",\"appsecret\":\"\"}','',1,1497088090,1498736290),(137,0,'REGISTERANDVISIT','{\"is_register\":\"1\",\"register_info\":\"plain\",\"name_keyword\":\"admin\",\"pwd_len\":\"6\",\"pwd_complexity\":\"\",\"is_requiretel\":\"0\",\"terms_of_service\":\"\"}','',1,1499310581,1544241434),(138,0,'SERVICE_ADDR','{\"service_addr\":\"\"}','美洽客服链接地址设置',0,1542638209,0),(144,0,'USE_PC_TEMPLATE','blue','当前使用的PC端模板文件夹',1,1544169488,1544169488),(146,0,'UPLOAD_TYPE','1','上传方式 1 本地  2 七牛',1,1543476260,0),(147,0,'QINIU_CONFIG','{\"Accesskey\":\"\",\"Secretkey\":\"\",\"Bucket\":\"\",\"QiniuUrl\":\"\"}','七牛云存储参数配置',1,1543476260,0),(153,0,'X360','{\"host\":\"smtjy\",\"apikey\":\"XUSHUQING_API_KEY\"}','校360配置',1,1543904241,1544062144),(154,0,'UI','{\"icon\":\"upload\\/common\\/1544153672.ico\",\"logo\":\"upload\\/common\\/1544001940.png\",\"banner\":\"upload\\/common\\/1544068552.png\",\"reg\":\"upload\\/common\\/1544152017.png\",\"member\":\"upload\\/common\\/1544078973.png\",\"pclogin\":\"upload\\/common\\/1544235759.png\",\"pcreg\":\"upload\\/common\\/1544235767.png\",\"adminlogin\":\"upload\\/common\\/1544235774.png\",\"adminlogo\":\"upload\\/common\\/1544235778.png\"}','界面配置',1,1543914069,1544235780),(155,0,'COPYRIGHT','{\"copyright_logo\":\"upload\\/common\\/1544061902.png\",\"copyright_link\":\"http:\\/\\/www.smtjy.com\",\"copyright_desc\":\"pro.x360 \\u00a9 2017 Powered by Lantel\",\"copyright_companyname\":\"\\u65af\\u739b\\u7279\\u52a0\\u76df\\u5546\\u7535\\u5546\\u7cfb\\u7edf\",\"bot\":\"upload\\/common\\/1544068296.png\"}','版权配置',1,1543917863,1544068297),(169,0,'IMG_THUMB','{\"thumb_type\":\"3\",\"upload_size\":\"0\",\"upload_ext\":\"gif,jpg,jpeg,bmp,png\"}','thumb_type(缩略)  3 居中裁剪 2 缩放后填充 4 左上角裁剪 5 右下角裁剪 6 固定尺寸缩放',1,1543998613,0),(170,0,'REGISTER_INTEGRAL','1','注册送积分',1,1544001195,1544257054),(171,0,'SIGN_INTEGRAL','1','签到送积分',1,1544001195,1544257054),(172,0,'SHARE_INTEGRAL','1','分享送积分',1,1544001195,1544257054),(174,0,'USE_WAP_TEMPLATE','default','当前使用的手机端模板文件夹',1,1544091455,1544091465),(175,0,'IS_RECOMMEND','{\"is_recommend\":\"\"}','首页商城促销版块显示设置',0,1544091455,0),(176,0,'IS_CATEGORY','{\"is_category\":\"\"}','首页商品分类是否显示设置',0,1544091455,0),(177,0,'ORDER_AUTO_DELIVERY','14','订单多长时间自动完成',1,1544093555,1544168959),(178,0,'ORDER_BALANCE_PAY','0','是否开启余额支付',1,1544093555,1544168959),(179,0,'ORDER_DELIVERY_COMPLETE_TIME','0','收货后多长时间自动完成',1,1544093555,1544168960),(180,0,'ORDER_SHOW_BUY_RECORD','1','是否显示购买记录',1,1544093555,1544168960),(181,0,'ORDER_INVOICE_TAX','0','发票税率',1,1544093555,1544168960),(182,0,'ORDER_INVOICE_CONTENT','','发票内容',1,1544093555,1544168960),(183,0,'ORDER_DELIVERY_PAY','0','是否开启货到付款',1,1544093555,1544168960),(184,0,'ORDER_BUY_CLOSE_TIME','3600','订单自动关闭时间',1,1544093555,1544168960),(185,0,'BUYER_SELF_LIFTING','0','是否开启买家自提',1,1544093555,1544168960),(186,0,'ORDER_SELLER_DISPATCHING','1','是否开启商家配送',1,1544093555,1544168960),(187,0,'ORDER_IS_LOGISTICS','1','是否允许选择物流',1,1544093555,1544168960),(188,0,'SHOPPING_BACK_POINTS','1','购物返积分设置',1,1544093555,1544168960),(189,0,'WITHDRAW_BALANCE','{\"withdraw_cash_min\":0,\"withdraw_multiple\":0,\"withdraw_poundage\":0,\"withdraw_message\":\"\"}','会员余额提现设置',0,1544093867,0),(190,0,'SEO_TITLE','斯玛特加盟商电商平台','标题附加字',1,1544146299,1544146390),(191,0,'SEO_META','斯玛特加盟商电商平台','商城关键词',1,1544146299,1544146390),(192,0,'SEO_DESC','斯玛特加盟商电商平台','关键词描述',1,1544146299,1544146390),(193,0,'SEO_OTHER','斯玛特加盟商电商平台','其他页头信息',1,1544146299,1544146390),(194,0,'LOGINVERIFYCODE','{\"platform\":0,\"admin\":\"0\",\"pc\":\"1\"}','',1,1544146757,1544146852),(195,0,'ORDER_EXPRESS_MESSAGE','{\"appid\":\"XUSHUIQNG_APP_ID\",\"appkey\":\"XUSHUIQNG_APP_KEY\",\"back_url\":\"http:\\/\\/www.baidu.com\"}','物流跟踪配置信息',0,1544147038,1544147101);
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_custom_template`
--

DROP TABLE IF EXISTS `sys_custom_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_custom_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `template_name` varchar(250) DEFAULT NULL COMMENT '自定义模板名称（暂时预留）',
  `template_data` text NOT NULL COMMENT '模板数据（JSON格式）',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间戳',
  `modify_time` int(11) DEFAULT NULL COMMENT '修改时间戳',
  `is_enable` int(11) NOT NULL DEFAULT '0' COMMENT '是否启用 0 不启用 1 启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='手机端自定义模板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_custom_template`
--

LOCK TABLES `sys_custom_template` WRITE;
/*!40000 ALTER TABLE `sys_custom_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_custom_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_district`
--

DROP TABLE IF EXISTS `sys_district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_district` (
  `district_id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) DEFAULT '0',
  `district_name` varchar(255) NOT NULL DEFAULT '',
  `sort` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`district_id`),
  KEY `IDX_g_district_DistrictName` (`district_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2870 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=50;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_district`
--

LOCK TABLES `sys_district` WRITE;
/*!40000 ALTER TABLE `sys_district` DISABLE KEYS */;
INSERT INTO `sys_district` VALUES (1,1,'东城区',0),(2,1,'西城区',0),(3,1,'崇文区',0),(4,1,'宣武区',0),(5,1,'朝阳区',0),(6,1,'丰台区',0),(7,1,'石景山区',0),(8,1,'海淀区',0),(9,1,'门头沟区',0),(10,1,'房山区',0),(11,1,'通州区',0),(12,1,'顺义区',0),(13,1,'昌平区',0),(14,1,'大兴区',0),(15,1,'怀柔区',0),(16,1,'平谷区',0),(17,1,'密云县',0),(18,1,'延庆县',0),(19,2,'和平区',0),(20,2,'河东区',0),(21,2,'河西区',0),(22,2,'南开区',0),(23,2,'河北区',0),(24,2,'红桥区',0),(25,2,'塘沽区',0),(26,2,'汉沽区',0),(27,2,'大港区',0),(28,2,'东丽区',0),(29,2,'西青区',0),(30,2,'津南区',0),(31,2,'北辰区',0),(32,2,'武清区',0),(33,2,'宝坻区',0),(34,2,'宁河县',0),(35,2,'静海县',0),(36,2,'蓟县',0),(37,3,'长安区',0),(38,3,'桥东区',0),(39,3,'桥西区',0),(40,3,'新华区',0),(41,3,'井陉矿区',0),(42,3,'裕华区',0),(43,3,'井陉县',0),(44,3,'正定县',0),(45,3,'栾城县',0),(46,3,'行唐县',0),(47,3,'灵寿县',0),(48,3,'高邑县',0),(49,3,'深泽县',0),(50,3,'赞皇县',0),(51,3,'无极县',0),(52,3,'平山县',0),(53,3,'元氏县',0),(54,3,'赵县',0),(55,3,'辛集市',0),(56,3,'藁城市',0),(57,3,'晋州市',0),(58,3,'新乐市',0),(59,3,'鹿泉市',0),(60,4,'路南区',0),(61,4,'路北区',0),(62,4,'古冶区',0),(63,4,'开平区',0),(64,4,'丰南区',0),(65,4,'丰润区',0),(66,4,'滦县',0),(67,4,'滦南县',0),(68,4,'乐亭县',0),(69,4,'迁西县',0),(70,4,'玉田县',0),(71,4,'唐海县',0),(72,4,'遵化市',0),(73,4,'迁安市',0),(74,5,'海港区',0),(75,5,'山海关区',0),(76,5,'北戴河区',0),(77,5,'青龙满族自治县',0),(78,5,'昌黎县',0),(79,5,'抚宁县',0),(80,5,'卢龙县',0),(81,6,'邯山区',0),(82,6,'丛台区',0),(83,6,'复兴区',0),(84,6,'峰峰矿区',0),(85,6,'邯郸县',0),(86,6,'临漳县',0),(87,6,'成安县',0),(88,6,'大名县',0),(89,6,'涉县',0),(90,6,'磁县',0),(91,6,'肥乡县',0),(92,6,'永年县',0),(93,6,'邱县',0),(94,6,'鸡泽县',0),(95,6,'广平县',0),(96,6,'馆陶县',0),(97,6,'魏县',0),(98,6,'曲周县',0),(99,6,'武安市',0),(100,7,'桥东区',0),(101,7,'桥西区',0),(102,7,'邢台县',0),(103,7,'临城县',0),(104,7,'内丘县',0),(105,7,'柏乡县',0),(106,7,'隆尧县',0),(107,7,'任县',0),(108,7,'南和县',0),(109,7,'宁晋县',0),(110,7,'巨鹿县',0),(111,7,'新河县',0),(112,7,'广宗县',0),(113,7,'平乡县',0),(114,7,'威县',0),(115,7,'清河县',0),(116,7,'临西县',0),(117,7,'南宫市',0),(118,7,'沙河市',0),(119,8,'新市区',0),(120,8,'北市区',0),(121,8,'南市区',0),(122,8,'满城县',0),(123,8,'清苑县',0),(124,8,'涞水县',0),(125,8,'阜平县',0),(126,8,'徐水县',0),(127,8,'定兴县',0),(128,8,'唐县',0),(129,8,'高阳县',0),(130,8,'容城县',0),(131,8,'涞源县',0),(132,8,'望都县',0),(133,8,'安新县',0),(134,8,'易县',0),(135,8,'曲阳县',0),(136,8,'蠡县',0),(137,8,'顺平县',0),(138,8,'博野县',0),(139,8,'雄县',0),(140,8,'涿州市',0),(141,8,'定州市',0),(142,8,'安国市',0),(143,8,'高碑店市',0),(144,9,'桥东区',0),(145,9,'桥西区',0),(146,9,'宣化区',0),(147,9,'下花园区',0),(148,9,'宣化县',0),(149,9,'张北县',0),(150,9,'康保县',0),(151,9,'沽源县',0),(152,9,'尚义县',0),(153,9,'蔚县',0),(154,9,'阳原县',0),(155,9,'怀安县',0),(156,9,'万全县',0),(157,9,'怀来县',0),(158,9,'涿鹿县',0),(159,9,'赤城县',0),(160,9,'崇礼县',0),(161,10,'双桥区',0),(162,10,'双滦区',0),(163,10,'鹰手营子矿区',0),(164,10,'承德县',0),(165,10,'兴隆县',0),(166,10,'平泉县',0),(167,10,'滦平县',0),(168,10,'隆化县',0),(169,10,'丰宁满族自治县',0),(170,10,'宽城满族自治县',0),(171,10,'围场满族蒙古族自治县',0),(172,11,'新华区',0),(173,11,'运河区',0),(174,11,'沧县',0),(175,11,'青县',0),(176,11,'东光县',0),(177,11,'海兴县',0),(178,11,'盐山县',0),(179,11,'肃宁县',0),(180,11,'南皮县',0),(181,11,'吴桥县',0),(182,11,'献县',0),(183,11,'孟村回族自治县',0),(184,11,'泊头市',0),(185,11,'任丘市',0),(186,11,'黄骅市',0),(187,11,'河间市',0),(188,12,'安次区',0),(189,12,'广阳区',0),(190,12,'固安县',0),(191,12,'永清县',0),(192,12,'香河县',0),(193,12,'大城县',0),(194,12,'文安县',0),(195,12,'大厂回族自治县',0),(196,12,'霸州市',0),(197,12,'三河市',0),(198,13,'桃城区',0),(199,13,'枣强县',0),(200,13,'武邑县',0),(201,13,'武强县',0),(202,13,'饶阳县',0),(203,13,'安平县',0),(204,13,'故城县',0),(205,13,'景县',0),(206,13,'阜城县',0),(207,13,'冀州市',0),(208,13,'深州市',0),(209,14,'小店区',0),(210,14,'迎泽区',0),(211,14,'杏花岭区',0),(212,14,'尖草坪区',0),(213,14,'万柏林区',0),(214,14,'晋源区',0),(215,14,'清徐县',0),(216,14,'阳曲县',0),(217,14,'娄烦县',0),(218,14,'古交市',0),(219,15,'城区',0),(220,15,'矿区',0),(221,15,'南郊区',0),(222,15,'新荣区',0),(223,15,'阳高县',0),(224,15,'天镇县',0),(225,15,'广灵县',0),(226,15,'灵丘县',0),(227,15,'浑源县',0),(228,15,'左云县',0),(229,15,'大同县',0),(230,16,'城区',0),(231,16,'矿区',0),(232,16,'郊区',0),(233,16,'平定县',0),(234,16,'盂县',0),(235,17,'城区',0),(236,17,'郊区',0),(237,17,'长治县',0),(238,17,'襄垣县',0),(239,17,'屯留县',0),(240,17,'平顺县',0),(241,17,'黎城县',0),(242,17,'壶关县',0),(243,17,'长子县',0),(244,17,'武乡县',0),(245,17,'沁县',0),(246,17,'沁源县',0),(247,17,'潞城市',0),(248,18,'城区',0),(249,18,'沁水县',0),(250,18,'阳城县',0),(251,18,'陵川县',0),(252,18,'泽州县',0),(253,18,'高平市',0),(254,19,'朔城区',0),(255,19,'平鲁区',0),(256,19,'山阴县',0),(257,19,'应县',0),(258,19,'右玉县',0),(259,19,'怀仁县',0),(260,20,'榆次区',0),(261,20,'榆社县',0),(262,20,'左权县',0),(263,20,'和顺县',0),(264,20,'昔阳县',0),(265,20,'寿阳县',0),(266,20,'太谷县',0),(267,20,'祁县',0),(268,20,'平遥县',0),(269,20,'灵石县',0),(270,20,'介休市',0),(271,21,'盐湖区',0),(272,21,'临猗县',0),(273,21,'万荣县',0),(274,21,'闻喜县',0),(275,21,'稷山县',0),(276,21,'新绛县',0),(277,21,'绛县',0),(278,21,'垣曲县',0),(279,21,'夏县',0),(280,21,'平陆县',0),(281,21,'芮城县',0),(282,21,'永济市',0),(283,21,'河津市',0),(284,22,'忻府区',0),(285,22,'定襄县',0),(286,22,'五台县',0),(287,22,'代县',0),(288,22,'繁峙县',0),(289,22,'宁武县',0),(290,22,'静乐县',0),(291,22,'神池县',0),(292,22,'五寨县',0),(293,22,'岢岚县',0),(294,22,'河曲县',0),(295,22,'保德县',0),(296,22,'偏关县',0),(297,22,'原平市',0),(298,23,'尧都区',0),(299,23,'曲沃县',0),(300,23,'翼城县',0),(301,23,'襄汾县',0),(302,23,'洪洞县',0),(303,23,'古县',0),(304,23,'安泽县',0),(305,23,'浮山县',0),(306,23,'吉县',0),(307,23,'乡宁县',0),(308,23,'大宁县',0),(309,23,'隰县',0),(310,23,'永和县',0),(311,23,'蒲县',0),(312,23,'汾西县',0),(313,23,'侯马市',0),(314,23,'霍州市',0),(315,24,'离石区',0),(316,24,'文水县',0),(317,24,'交城县',0),(318,24,'兴县',0),(319,24,'临县',0),(320,24,'柳林县',0),(321,24,'石楼县',0),(322,24,'岚县',0),(323,24,'方山县',0),(324,24,'中阳县',0),(325,24,'交口县',0),(326,24,'孝义市',0),(327,24,'汾阳市',0),(328,25,'新城区',0),(329,25,'回民区',0),(330,25,'玉泉区',0),(331,25,'赛罕区',0),(332,25,'土默特左旗',0),(333,25,'托克托县',0),(334,25,'和林格尔县',0),(335,25,'清水河县',0),(336,25,'武川县',0),(337,26,'东河区',0),(338,26,'昆都仑区',0),(339,26,'青山区',0),(340,26,'石拐区',0),(341,26,'白云矿区',0),(342,26,'九原区',0),(343,26,'土默特右旗',0),(344,26,'固阳县',0),(345,26,'达尔罕茂明安联合旗',0),(346,27,'海勃湾区',0),(347,27,'海南区',0),(348,27,'乌达区',0),(349,28,'红山区',0),(350,28,'元宝山区',0),(351,28,'松山区',0),(352,28,'阿鲁科尔沁旗',0),(353,28,'巴林左旗',0),(354,28,'巴林右旗',0),(355,28,'林西县',0),(356,28,'克什克腾旗',0),(357,28,'翁牛特旗',0),(358,28,'喀喇沁旗',0),(359,28,'宁城县',0),(360,28,'敖汉旗',0),(361,29,'科尔沁区',0),(362,29,'科尔沁左翼中旗',0),(363,29,'科尔沁左翼后旗',0),(364,29,'开鲁县',0),(365,29,'库伦旗',0),(366,29,'奈曼旗',0),(367,29,'扎鲁特旗',0),(368,29,'霍林郭勒市',0),(369,30,'东胜区',0),(370,30,'达拉特旗',0),(371,30,'准格尔旗',0),(372,30,'鄂托克前旗',0),(373,30,'鄂托克旗',0),(374,30,'杭锦旗',0),(375,30,'乌审旗',0),(376,30,'伊金霍洛旗',0),(377,31,'海拉尔区',0),(378,31,'阿荣旗',0),(379,31,'莫力达瓦达斡尔族自治旗',0),(380,31,'鄂伦春自治旗',0),(381,31,'鄂温克族自治旗',0),(382,31,'陈巴尔虎旗',0),(383,31,'新巴尔虎左旗',0),(384,31,'新巴尔虎右旗',0),(385,31,'满洲里市',0),(386,31,'牙克石市',0),(387,31,'扎兰屯市',0),(388,31,'额尔古纳市',0),(389,31,'根河市',0),(390,32,'临河区',0),(391,32,'五原县',0),(392,32,'磴口县',0),(393,32,'乌拉特前旗',0),(394,32,'乌拉特中旗',0),(395,32,'乌拉特后旗',0),(396,32,'杭锦后旗',0),(397,33,'集宁区',0),(398,33,'卓资县',0),(399,33,'化德县',0),(400,33,'商都县',0),(401,33,'兴和县',0),(402,33,'凉城县',0),(403,33,'察哈尔右翼前旗',0),(404,33,'察哈尔右翼中旗',0),(405,33,'察哈尔右翼后旗',0),(406,33,'四子王旗',0),(407,33,'丰镇市',0),(408,34,'乌兰浩特市',0),(409,34,'阿尔山市',0),(410,34,'科尔沁右翼前旗',0),(411,34,'科尔沁右翼中旗',0),(412,34,'扎赉特旗',0),(413,34,'突泉县',0),(414,35,'二连浩特市',0),(415,35,'锡林浩特市',0),(416,35,'阿巴嘎旗',0),(417,35,'苏尼特左旗',0),(418,35,'苏尼特右旗',0),(419,35,'东乌珠穆沁旗',0),(420,35,'西乌珠穆沁旗',0),(421,35,'太仆寺旗',0),(422,35,'镶黄旗',0),(423,35,'正镶白旗',0),(424,35,'正蓝旗',0),(425,35,'多伦县',0),(426,36,'阿拉善左旗',0),(427,36,'阿拉善右旗',0),(428,36,'额济纳旗',0),(429,37,'和平区',0),(430,37,'沈河区',0),(431,37,'大东区',0),(432,37,'皇姑区',0),(433,37,'铁西区',0),(434,37,'苏家屯区',0),(435,37,'东陵区',0),(436,37,'新城子区',0),(437,37,'于洪区',0),(438,37,'辽中县',0),(439,37,'康平县',0),(440,37,'法库县',0),(441,37,'新民市',0),(442,38,'中山区',0),(443,38,'西岗区',0),(444,38,'沙河口区',0),(445,38,'甘井子区',0),(446,38,'旅顺口区',0),(447,38,'金州区',0),(448,38,'长海县',0),(449,38,'瓦房店市',0),(450,38,'普兰店市',0),(451,38,'庄河市',0),(452,39,'铁东区',0),(453,39,'铁西区',0),(454,39,'立山区',0),(455,39,'千山区',0),(456,39,'台安县',0),(457,39,'岫岩满族自治县',0),(458,39,'海城市',0),(459,40,'新抚区',0),(460,40,'东洲区',0),(461,40,'望花区',0),(462,40,'顺城区',0),(463,40,'抚顺县',0),(464,40,'新宾满族自治县',0),(465,40,'清原满族自治县',0),(466,41,'平山区',0),(467,41,'溪湖区',0),(468,41,'明山区',0),(469,41,'南芬区',0),(470,41,'本溪满族自治县',0),(471,41,'桓仁满族自治县',0),(472,42,'元宝区',0),(473,42,'振兴区',0),(474,42,'振安区',0),(475,42,'宽甸满族自治县',0),(476,42,'东港市',0),(477,42,'凤城市',0),(478,43,'古塔区',0),(479,43,'凌河区',0),(480,43,'太和区',0),(481,43,'黑山县',0),(482,43,'义县',0),(483,43,'凌海市',0),(484,43,'北宁市',0),(485,44,'站前区',0),(486,44,'西市区',0),(487,44,'鲅鱼圈区',0),(488,44,'老边区',0),(489,44,'盖州市',0),(490,44,'大石桥市',0),(491,45,'海州区',0),(492,45,'新邱区',0),(493,45,'太平区',0),(494,45,'清河门区',0),(495,45,'细河区',0),(496,45,'阜新蒙古族自治县',0),(497,45,'彰武县',0),(498,46,'白塔区',0),(499,46,'文圣区',0),(500,46,'宏伟区',0),(501,46,'弓长岭区',0),(502,46,'太子河区',0),(503,46,'辽阳县',0),(504,46,'灯塔市',0),(505,47,'双台子区',0),(506,47,'兴隆台区',0),(507,47,'大洼县',0),(508,47,'盘山县',0),(509,48,'银州区',0),(510,48,'清河区',0),(511,48,'铁岭县',0),(512,48,'西丰县',0),(513,48,'昌图县',0),(514,48,'调兵山市',0),(515,48,'开原市',0),(516,49,'双塔区',0),(517,49,'龙城区',0),(518,49,'朝阳县',0),(519,49,'建平县',0),(520,49,'喀喇沁左翼蒙古族自治县',0),(521,49,'北票市',0),(522,49,'凌源市',0),(523,50,'连山区',0),(524,50,'龙港区',0),(525,50,'南票区',0),(526,50,'绥中县',0),(527,50,'建昌县',0),(528,50,'兴城市',0),(529,51,'南关区',0),(530,51,'宽城区',0),(531,51,'朝阳区',0),(532,51,'二道区',0),(533,51,'绿园区',0),(534,51,'双阳区',0),(535,51,'农安县',0),(536,51,'九台市',0),(537,51,'榆树市',0),(538,51,'德惠市',0),(539,52,'昌邑区',0),(540,52,'龙潭区',0),(541,52,'船营区',0),(542,52,'丰满区',0),(543,52,'永吉县',0),(544,52,'蛟河市',0),(545,52,'桦甸市',0),(546,52,'舒兰市',0),(547,52,'磐石市',0),(548,53,'铁西区',0),(549,53,'铁东区',0),(550,53,'梨树县',0),(551,53,'伊通满族自治县',0),(552,53,'公主岭市',0),(553,53,'双辽市',0),(554,54,'龙山区',0),(555,54,'西安区',0),(556,54,'东丰县',0),(557,54,'东辽县',0),(558,55,'东昌区',0),(559,55,'二道江区',0),(560,55,'通化县',0),(561,55,'辉南县',0),(562,55,'柳河县',0),(563,55,'梅河口市',0),(564,55,'集安市',0),(565,56,'八道江区',0),(566,56,'抚松县',0),(567,56,'靖宇县',0),(568,56,'长白朝鲜族自治县',0),(569,56,'江源县',0),(570,56,'临江市',0),(571,57,'宁江区',0),(572,57,'前郭尔罗斯蒙古族自治县',0),(573,57,'长岭县',0),(574,57,'乾安县',0),(575,57,'扶余县',0),(576,58,'洮北区',0),(577,58,'镇赉县',0),(578,58,'通榆县',0),(579,58,'洮南市',0),(580,58,'大安市',0),(581,59,'延吉市',0),(582,59,'图们市',0),(583,59,'敦化市',0),(584,59,'珲春市',0),(585,59,'龙井市',0),(586,59,'和龙市',0),(587,59,'汪清县',0),(588,59,'安图县',0),(589,60,'道里区',0),(590,60,'南岗区',0),(591,60,'道外区',0),(592,60,'香坊区',0),(593,60,'动力区',0),(594,60,'平房区',0),(595,60,'松北区',0),(596,60,'呼兰区',0),(597,60,'依兰县',0),(598,60,'方正县',0),(599,60,'宾县',0),(600,60,'巴彦县',0),(601,60,'木兰县',0),(602,60,'通河县',0),(603,60,'延寿县',0),(604,60,'阿城市',0),(605,60,'双城市',0),(606,60,'尚志市',0),(607,60,'五常市',0),(608,61,'龙沙区',0),(609,61,'建华区',0),(610,61,'铁锋区',0),(611,61,'昂昂溪区',0),(612,61,'富拉尔基区',0),(613,61,'碾子山区',0),(614,61,'梅里斯达斡尔族区',0),(615,61,'龙江县',0),(616,61,'依安县',0),(617,61,'泰来县',0),(618,61,'甘南县',0),(619,61,'富裕县',0),(620,61,'克山县',0),(621,61,'克东县',0),(622,61,'拜泉县',0),(623,61,'讷河市',0),(624,62,'鸡冠区',0),(625,62,'恒山区',0),(626,62,'滴道区',0),(627,62,'梨树区',0),(628,62,'城子河区',0),(629,62,'麻山区',0),(630,62,'鸡东县',0),(631,62,'虎林市',0),(632,62,'密山市',0),(633,63,'向阳区',0),(634,63,'工农区',0),(635,63,'南山区',0),(636,63,'兴安区',0),(637,63,'东山区',0),(638,63,'兴山区',0),(639,63,'萝北县',0),(640,63,'绥滨县',0),(641,64,'尖山区',0),(642,64,'岭东区',0),(643,64,'四方台区',0),(644,64,'宝山区',0),(645,64,'集贤县',0),(646,64,'友谊县',0),(647,64,'宝清县',0),(648,64,'饶河县',0),(649,65,'萨尔图区',0),(650,65,'龙凤区',0),(651,65,'让胡路区',0),(652,65,'红岗区',0),(653,65,'大同区',0),(654,65,'肇州县',0),(655,65,'肇源县',0),(656,65,'林甸县',0),(657,65,'杜尔伯特蒙古族自治县',0),(658,66,'伊春区',0),(659,66,'南岔区',0),(660,66,'友好区',0),(661,66,'西林区',0),(662,66,'翠峦区',0),(663,66,'新青区',0),(664,66,'美溪区',0),(665,66,'金山屯区',0),(666,66,'五营区',0),(667,66,'乌马河区',0),(668,66,'汤旺河区',0),(669,66,'带岭区',0),(670,66,'乌伊岭区',0),(671,66,'红星区',0),(672,66,'上甘岭区',0),(673,66,'嘉荫县',0),(674,66,'铁力市',0),(675,67,'永红区',0),(676,67,'向阳区',0),(677,67,'前进区',0),(678,67,'东风区',0),(679,67,'郊区',0),(680,67,'桦南县',0),(681,67,'桦川县',0),(682,67,'汤原县',0),(683,67,'抚远县',0),(684,67,'同江市',0),(685,67,'富锦市',0),(686,68,'新兴区',0),(687,68,'桃山区',0),(688,68,'茄子河区',0),(689,68,'勃利县',0),(690,69,'东安区',0),(691,69,'阳明区',0),(692,69,'爱民区',0),(693,69,'西安区',0),(694,69,'东宁县',0),(695,69,'林口县',0),(696,69,'绥芬河市',0),(697,69,'海林市',0),(698,69,'宁安市',0),(699,69,'穆棱市',0),(700,70,'爱辉区',0),(701,70,'嫩江县',0),(702,70,'逊克县',0),(703,70,'孙吴县',0),(704,70,'北安市',0),(705,70,'五大连池市',0),(706,71,'北林区',0),(707,71,'望奎县',0),(708,71,'兰西县',0),(709,71,'青冈县',0),(710,71,'庆安县',0),(711,71,'明水县',0),(712,71,'绥棱县',0),(713,71,'安达市',0),(714,71,'肇东市',0),(715,71,'海伦市',0),(716,72,'呼玛县',0),(717,72,'塔河县',0),(718,72,'漠河县',0),(719,73,'黄浦区',0),(720,73,'卢湾区',0),(721,73,'徐汇区',0),(722,73,'长宁区',0),(723,73,'静安区',0),(724,73,'普陀区',0),(725,73,'闸北区',0),(726,73,'虹口区',0),(727,73,'杨浦区',0),(728,73,'闵行区',0),(729,73,'宝山区',0),(730,73,'嘉定区',0),(731,73,'浦东新区',0),(732,73,'金山区',0),(733,73,'松江区',0),(734,73,'青浦区',0),(735,73,'南汇区',0),(736,73,'奉贤区',0),(737,73,'崇明县',0),(738,74,'玄武区',0),(739,74,'白下区',0),(740,74,'秦淮区',0),(741,74,'建邺区',0),(742,74,'鼓楼区',0),(743,74,'下关区',0),(744,74,'浦口区',0),(745,74,'栖霞区',0),(746,74,'雨花台区',0),(747,74,'江宁区',0),(748,74,'六合区',0),(749,74,'溧水县',0),(750,74,'高淳县',0),(751,75,'崇安区',0),(752,75,'南长区',0),(753,75,'北塘区',0),(754,75,'锡山区',0),(755,75,'惠山区',0),(756,75,'滨湖区',0),(757,75,'江阴市',0),(758,75,'宜兴市',0),(759,76,'鼓楼区',0),(760,76,'云龙区',0),(761,76,'九里区',0),(762,76,'贾汪区',0),(763,76,'泉山区',0),(764,76,'丰县',0),(765,76,'沛县',0),(766,76,'铜山县',0),(767,76,'睢宁县',0),(768,76,'新沂市',0),(769,76,'邳州市',0),(770,77,'天宁区',0),(771,77,'钟楼区',0),(772,77,'戚墅堰区',0),(773,77,'新北区',0),(774,77,'武进区',0),(775,77,'溧阳市',0),(776,77,'金坛市',0),(777,78,'沧浪区',0),(778,78,'平江区',0),(779,78,'金阊区',0),(780,78,'虎丘区',0),(781,78,'吴中区',0),(782,78,'相城区',0),(783,78,'常熟市',0),(784,78,'张家港市',0),(785,78,'昆山市',0),(786,78,'吴江市',0),(787,78,'太仓市',0),(788,79,'崇川区',0),(789,79,'港闸区',0),(790,79,'海安县',0),(791,79,'如东县',0),(792,79,'启东市',0),(793,79,'如皋市',0),(794,79,'通州市',0),(795,79,'海门市',0),(796,80,'连云区',0),(797,80,'新浦区',0),(798,80,'海州区',0),(799,80,'赣榆县',0),(800,80,'东海县',0),(801,80,'灌云县',0),(802,80,'灌南县',0),(803,81,'清河区',0),(804,81,'楚州区',0),(805,81,'淮阴区',0),(806,81,'清浦区',0),(807,81,'涟水县',0),(808,81,'洪泽县',0),(809,81,'盱眙县',0),(810,81,'金湖县',0),(811,82,'亭湖区',0),(812,82,'盐都区',0),(813,82,'响水县',0),(814,82,'滨海县',0),(815,82,'阜宁县',0),(816,82,'射阳县',0),(817,82,'建湖县',0),(818,82,'东台市',0),(819,82,'大丰市',0),(820,83,'广陵区',0),(821,83,'邗江区',0),(822,83,'维扬区',0),(823,83,'宝应县',0),(824,83,'仪征市',0),(825,83,'高邮市',0),(826,83,'江都市',0),(827,84,'京口区',0),(828,84,'润州区',0),(829,84,'丹徒区',0),(830,84,'丹阳市',0),(831,84,'扬中市',0),(832,84,'句容市',0),(833,85,'海陵区',0),(834,85,'高港区',0),(835,85,'兴化市',0),(836,85,'靖江市',0),(837,85,'泰兴市',0),(838,85,'姜堰市',0),(839,86,'宿城区',0),(840,86,'宿豫区',0),(841,86,'沭阳县',0),(842,86,'泗阳县',0),(843,86,'泗洪县',0),(844,87,'上城区',0),(845,87,'下城区',0),(846,87,'江干区',0),(847,87,'拱墅区',0),(848,87,'西湖区',0),(849,87,'滨江区',0),(850,87,'萧山区',0),(851,87,'余杭区',0),(852,87,'桐庐县',0),(853,87,'淳安县',0),(854,87,'建德市',0),(855,87,'富阳市',0),(856,87,'临安市',0),(857,88,'海曙区',0),(858,88,'江东区',0),(859,88,'江北区',0),(860,88,'北仑区',0),(861,88,'镇海区',0),(862,88,'鄞州区',0),(863,88,'象山县',0),(864,88,'宁海县',0),(865,88,'余姚市',0),(866,88,'慈溪市',0),(867,88,'奉化市',0),(868,89,'鹿城区',0),(869,89,'龙湾区',0),(870,89,'瓯海区',0),(871,89,'洞头县',0),(872,89,'永嘉县',0),(873,89,'平阳县',0),(874,89,'苍南县',0),(875,89,'文成县',0),(876,89,'泰顺县',0),(877,89,'瑞安市',0),(878,89,'乐清市',0),(879,90,'秀城区',0),(880,90,'秀洲区',0),(881,90,'嘉善县',0),(882,90,'海盐县',0),(883,90,'海宁市',0),(884,90,'平湖市',0),(885,90,'桐乡市',0),(886,91,'吴兴区',0),(887,91,'南浔区',0),(888,91,'德清县',0),(889,91,'长兴县',0),(890,91,'安吉县',0),(891,92,'越城区',0),(892,92,'绍兴县',0),(893,92,'新昌县',0),(894,92,'诸暨市',0),(895,92,'上虞市',0),(896,92,'嵊州市',0),(897,93,'婺城区',0),(898,93,'金东区',0),(899,93,'武义县',0),(900,93,'浦江县',0),(901,93,'磐安县',0),(902,93,'兰溪市',0),(903,93,'义乌市',0),(904,93,'东阳市',0),(905,93,'永康市',0),(906,94,'柯城区',0),(907,94,'衢江区',0),(908,94,'常山县',0),(909,94,'开化县',0),(910,94,'龙游县',0),(911,94,'江山市',0),(912,95,'定海区',0),(913,95,'普陀区',0),(914,95,'岱山县',0),(915,95,'嵊泗县',0),(916,96,'椒江区',0),(917,96,'黄岩区',0),(918,96,'路桥区',0),(919,96,'玉环县',0),(920,96,'三门县',0),(921,96,'天台县',0),(922,96,'仙居县',0),(923,96,'温岭市',0),(924,96,'临海市',0),(925,97,'莲都区',0),(926,97,'青田县',0),(927,97,'缙云县',0),(928,97,'遂昌县',0),(929,97,'松阳县',0),(930,97,'云和县',0),(931,97,'庆元县',0),(932,97,'景宁畲族自治县',0),(933,97,'龙泉市',0),(934,98,'瑶海区',0),(935,98,'庐阳区',0),(936,98,'蜀山区',0),(937,98,'包河区',0),(938,98,'长丰县',0),(939,98,'肥东县',0),(940,98,'肥西县',0),(941,99,'镜湖区',0),(942,99,'马塘区',0),(943,99,'新芜区',0),(944,99,'鸠江区',0),(945,99,'芜湖县',0),(946,99,'繁昌县',0),(947,99,'南陵县',0),(948,100,'龙子湖区',0),(949,100,'蚌山区',0),(950,100,'禹会区',0),(951,100,'淮上区',0),(952,100,'怀远县',0),(953,100,'五河县',0),(954,100,'固镇县',0),(955,101,'大通区',0),(956,101,'田家庵区',0),(957,101,'谢家集区',0),(958,101,'八公山区',0),(959,101,'潘集区',0),(960,101,'凤台县',0),(961,102,'金家庄区',0),(962,102,'花山区',0),(963,102,'雨山区',0),(964,102,'当涂县',0),(965,103,'杜集区',0),(966,103,'相山区',0),(967,103,'烈山区',0),(968,103,'濉溪县',0),(969,104,'铜官山区',0),(970,104,'狮子山区',0),(971,104,'郊区',0),(972,104,'铜陵县',0),(973,105,'迎江区',0),(974,105,'大观区',0),(975,105,'郊区',0),(976,105,'怀宁县',0),(977,105,'枞阳县',0),(978,105,'潜山县',0),(979,105,'太湖县',0),(980,105,'宿松县',0),(981,105,'望江县',0),(982,105,'岳西县',0),(983,105,'桐城市',0),(984,106,'屯溪区',0),(985,106,'黄山区',0),(986,106,'徽州区',0),(987,106,'歙县',0),(988,106,'休宁县',0),(989,106,'黟县',0),(990,106,'祁门县',0),(991,107,'琅琊区',0),(992,107,'南谯区',0),(993,107,'来安县',0),(994,107,'全椒县',0),(995,107,'定远县',0),(996,107,'凤阳县',0),(997,107,'天长市',0),(998,107,'明光市',0),(999,108,'颍州区',0),(1000,108,'颍东区',0),(1001,108,'颍泉区',0),(1002,108,'临泉县',0),(1003,108,'太和县',0),(1004,108,'阜南县',0),(1005,108,'颍上县',0),(1006,108,'界首市',0),(1007,109,'埇桥区',0),(1008,109,'砀山县',0),(1009,109,'萧县',0),(1010,109,'灵璧县',0),(1011,109,'泗县',0),(1012,110,'居巢区',0),(1013,110,'庐江县',0),(1014,110,'无为县',0),(1015,110,'含山县',0),(1016,110,'和县',0),(1017,111,'金安区',0),(1018,111,'裕安区',0),(1019,111,'寿县',0),(1020,111,'霍邱县',0),(1021,111,'舒城县',0),(1022,111,'金寨县',0),(1023,111,'霍山县',0),(1024,112,'谯城区',0),(1025,112,'涡阳县',0),(1026,112,'蒙城县',0),(1027,112,'利辛县',0),(1028,113,'贵池区',0),(1029,113,'东至县',0),(1030,113,'石台县',0),(1031,113,'青阳县',0),(1032,114,'宣州区',0),(1033,114,'郎溪县',0),(1034,114,'广德县',0),(1035,114,'泾县',0),(1036,114,'绩溪县',0),(1037,114,'旌德县',0),(1038,114,'宁国市',0),(1039,115,'鼓楼区',0),(1040,115,'台江区',0),(1041,115,'仓山区',0),(1042,115,'马尾区',0),(1043,115,'晋安区',0),(1044,115,'闽侯县',0),(1045,115,'连江县',0),(1046,115,'罗源县',0),(1047,115,'闽清县',0),(1048,115,'永泰县',0),(1049,115,'平潭县',0),(1050,115,'福清市',0),(1051,115,'长乐市',0),(1052,116,'思明区',0),(1053,116,'海沧区',0),(1054,116,'湖里区',0),(1055,116,'集美区',0),(1056,116,'同安区',0),(1057,116,'翔安区',0),(1058,117,'城厢区',0),(1059,117,'涵江区',0),(1060,117,'荔城区',0),(1061,117,'秀屿区',0),(1062,117,'仙游县',0),(1063,118,'梅列区',0),(1064,118,'三元区',0),(1065,118,'明溪县',0),(1066,118,'清流县',0),(1067,118,'宁化县',0),(1068,118,'大田县',0),(1069,118,'尤溪县',0),(1070,118,'沙县',0),(1071,118,'将乐县',0),(1072,118,'泰宁县',0),(1073,118,'建宁县',0),(1074,118,'永安市',0),(1075,119,'鲤城区',0),(1076,119,'丰泽区',0),(1077,119,'洛江区',0),(1078,119,'泉港区',0),(1079,119,'惠安县',0),(1080,119,'安溪县',0),(1081,119,'永春县',0),(1082,119,'德化县',0),(1083,119,'金门县',0),(1084,119,'石狮市',0),(1085,119,'晋江市',0),(1086,119,'南安市',0),(1087,120,'芗城区',0),(1088,120,'龙文区',0),(1089,120,'云霄县',0),(1090,120,'漳浦县',0),(1091,120,'诏安县',0),(1092,120,'长泰县',0),(1093,120,'东山县',0),(1094,120,'南靖县',0),(1095,120,'平和县',0),(1096,120,'华安县',0),(1097,120,'龙海市',0),(1098,121,'延平区',0),(1099,121,'顺昌县',0),(1100,121,'浦城县',0),(1101,121,'光泽县',0),(1102,121,'松溪县',0),(1103,121,'政和县',0),(1104,121,'邵武市',0),(1105,121,'武夷山市',0),(1106,121,'建瓯市',0),(1107,121,'建阳市',0),(1108,122,'新罗区',0),(1109,122,'长汀县',0),(1110,122,'永定县',0),(1111,122,'上杭县',0),(1112,122,'武平县',0),(1113,122,'连城县',0),(1114,122,'漳平市',0),(1115,123,'蕉城区',0),(1116,123,'霞浦县',0),(1117,123,'古田县',0),(1118,123,'屏南县',0),(1119,123,'寿宁县',0),(1120,123,'周宁县',0),(1121,123,'柘荣县',0),(1122,123,'福安市',0),(1123,123,'福鼎市',0),(1124,124,'东湖区',0),(1125,124,'西湖区',0),(1126,124,'青云谱区',0),(1127,124,'湾里区',0),(1128,124,'青山湖区',0),(1129,124,'南昌县',0),(1130,124,'新建县',0),(1131,124,'安义县',0),(1132,124,'进贤县',0),(1133,125,'昌江区',0),(1134,125,'珠山区',0),(1135,125,'浮梁县',0),(1136,125,'乐平市',0),(1137,126,'安源区',0),(1138,126,'湘东区',0),(1139,126,'莲花县',0),(1140,126,'上栗县',0),(1141,126,'芦溪县',0),(1142,127,'庐山区',0),(1143,127,'浔阳区',0),(1144,127,'九江县',0),(1145,127,'武宁县',0),(1146,127,'修水县',0),(1147,127,'永修县',0),(1148,127,'德安县',0),(1149,127,'星子县',0),(1150,127,'都昌县',0),(1151,127,'湖口县',0),(1152,127,'彭泽县',0),(1153,127,'瑞昌市',0),(1154,128,'渝水区',0),(1155,128,'分宜县',0),(1156,129,'月湖区',0),(1157,129,'余江县',0),(1158,129,'贵溪市',0),(1159,130,'章贡区',0),(1160,130,'赣县',0),(1161,130,'信丰县',0),(1162,130,'大余县',0),(1163,130,'上犹县',0),(1164,130,'崇义县',0),(1165,130,'安远县',0),(1166,130,'龙南县',0),(1167,130,'定南县',0),(1168,130,'全南县',0),(1169,130,'宁都县',0),(1170,130,'于都县',0),(1171,130,'兴国县',0),(1172,130,'会昌县',0),(1173,130,'寻乌县',0),(1174,130,'石城县',0),(1175,130,'瑞金市',0),(1176,130,'南康市',0),(1177,131,'吉州区',0),(1178,131,'青原区',0),(1179,131,'吉安县',0),(1180,131,'吉水县',0),(1181,131,'峡江县',0),(1182,131,'新干县',0),(1183,131,'永丰县',0),(1184,131,'泰和县',0),(1185,131,'遂川县',0),(1186,131,'万安县',0),(1187,131,'安福县',0),(1188,131,'永新县',0),(1189,131,'井冈山市',0),(1190,132,'袁州区',0),(1191,132,'奉新县',0),(1192,132,'万载县',0),(1193,132,'上高县',0),(1194,132,'宜丰县',0),(1195,132,'靖安县',0),(1196,132,'铜鼓县',0),(1197,132,'丰城市',0),(1198,132,'樟树市',0),(1199,132,'高安市',0),(1200,133,'临川区',0),(1201,133,'南城县',0),(1202,133,'黎川县',0),(1203,133,'南丰县',0),(1204,133,'崇仁县',0),(1205,133,'乐安县',0),(1206,133,'宜黄县',0),(1207,133,'金溪县',0),(1208,133,'资溪县',0),(1209,133,'东乡县',0),(1210,133,'广昌县',0),(1211,134,'信州区',0),(1212,134,'上饶县',0),(1213,134,'广丰县',0),(1214,134,'玉山县',0),(1215,134,'铅山县',0),(1216,134,'横峰县',0),(1217,134,'弋阳县',0),(1218,134,'余干县',0),(1219,134,'鄱阳县',0),(1220,134,'万年县',0),(1221,134,'婺源县',0),(1222,134,'德兴市',0),(1223,135,'历下区',0),(1224,135,'市中区',0),(1225,135,'槐荫区',0),(1226,135,'天桥区',0),(1227,135,'历城区',0),(1228,135,'长清区',0),(1229,135,'平阴县',0),(1230,135,'济阳县',0),(1231,135,'商河县',0),(1232,135,'章丘市',0),(1233,136,'市南区',0),(1234,136,'市北区',0),(1235,136,'四方区',0),(1236,136,'黄岛区',0),(1237,136,'崂山区',0),(1238,136,'李沧区',0),(1239,136,'城阳区',0),(1240,136,'胶州市',0),(1241,136,'即墨市',0),(1242,136,'平度市',0),(1243,136,'胶南市',0),(1244,136,'莱西市',0),(1245,137,'淄川区',0),(1246,137,'张店区',0),(1247,137,'博山区',0),(1248,137,'临淄区',0),(1249,137,'周村区',0),(1250,137,'桓台县',0),(1251,137,'高青县',0),(1252,137,'沂源县',0),(1253,138,'市中区',0),(1254,138,'薛城区',0),(1255,138,'峄城区',0),(1256,138,'台儿庄区',0),(1257,138,'山亭区',0),(1258,138,'滕州市',0),(1259,139,'东营区',0),(1260,139,'河口区',0),(1261,139,'垦利县',0),(1262,139,'利津县',0),(1263,139,'广饶县',0),(1264,140,'芝罘区',0),(1265,140,'福山区',0),(1266,140,'牟平区',0),(1267,140,'莱山区',0),(1268,140,'长岛县',0),(1269,140,'龙口市',0),(1270,140,'莱阳市',0),(1271,140,'莱州市',0),(1272,140,'蓬莱市',0),(1273,140,'招远市',0),(1274,140,'栖霞市',0),(1275,140,'海阳市',0),(1276,141,'潍城区',0),(1277,141,'寒亭区',0),(1278,141,'坊子区',0),(1279,141,'奎文区',0),(1280,141,'临朐县',0),(1281,141,'昌乐县',0),(1282,141,'青州市',0),(1283,141,'诸城市',0),(1284,141,'寿光市',0),(1285,141,'安丘市',0),(1286,141,'高密市',0),(1287,141,'昌邑市',0),(1288,142,'市中区',0),(1289,142,'任城区',0),(1290,142,'微山县',0),(1291,142,'鱼台县',0),(1292,142,'金乡县',0),(1293,142,'嘉祥县',0),(1294,142,'汶上县',0),(1295,142,'泗水县',0),(1296,142,'梁山县',0),(1297,142,'曲阜市',0),(1298,142,'兖州市',0),(1299,142,'邹城市',0),(1300,143,'泰山区',0),(1301,143,'岱岳区',0),(1302,143,'宁阳县',0),(1303,143,'东平县',0),(1304,143,'新泰市',0),(1305,143,'肥城市',0),(1306,144,'环翠区',0),(1307,144,'文登市',0),(1308,144,'荣成市',0),(1309,144,'乳山市',0),(1310,145,'东港区',0),(1311,145,'岚山区',0),(1312,145,'五莲县',0),(1313,145,'莒县',0),(1314,146,'莱城区',0),(1315,146,'钢城区',0),(1316,147,'兰山区',0),(1317,147,'罗庄区',0),(1318,147,'河东区',0),(1319,147,'沂南县',0),(1320,147,'郯城县',0),(1321,147,'沂水县',0),(1322,147,'苍山县',0),(1323,147,'费县',0),(1324,147,'平邑县',0),(1325,147,'莒南县',0),(1326,147,'蒙阴县',0),(1327,147,'临沭县',0),(1328,148,'德城区',0),(1329,148,'陵县',0),(1330,148,'宁津县',0),(1331,148,'庆云县',0),(1332,148,'临邑县',0),(1333,148,'齐河县',0),(1334,148,'平原县',0),(1335,148,'夏津县',0),(1336,148,'武城县',0),(1337,148,'乐陵市',0),(1338,148,'禹城市',0),(1339,149,'东昌府区',0),(1340,149,'阳谷县',0),(1341,149,'莘县',0),(1342,149,'茌平县',0),(1343,149,'东阿县',0),(1344,149,'冠县',0),(1345,149,'高唐县',0),(1346,149,'临清市',0),(1347,150,'滨城区',0),(1348,150,'惠民县',0),(1349,150,'阳信县',0),(1350,150,'无棣县',0),(1351,150,'沾化县',0),(1352,150,'博兴县',0),(1353,150,'邹平县',0),(1354,151,'牡丹区',0),(1355,151,'曹县',0),(1356,151,'单县',0),(1357,151,'成武县',0),(1358,151,'巨野县',0),(1359,151,'郓城县',0),(1360,151,'鄄城县',0),(1361,151,'定陶县',0),(1362,151,'东明县',0),(1363,152,'中原区',0),(1364,152,'二七区',0),(1365,152,'管城回族区',0),(1366,152,'金水区',0),(1367,152,'上街区',0),(1368,152,'惠济区',0),(1369,152,'中牟县',0),(1370,152,'巩义市',0),(1371,152,'荥阳市',0),(1372,152,'新密市',0),(1373,152,'新郑市',0),(1374,152,'登封市',0),(1375,153,'龙亭区',0),(1376,153,'顺河回族区',0),(1377,153,'鼓楼区',0),(1378,153,'南关区',0),(1379,153,'郊区',0),(1380,153,'杞县',0),(1381,153,'通许县',0),(1382,153,'尉氏县',0),(1383,153,'开封县',0),(1384,153,'兰考县',0),(1385,154,'老城区',0),(1386,154,'西工区',0),(1387,154,'廛河回族区',0),(1388,154,'涧西区',0),(1389,154,'吉利区',0),(1390,154,'洛龙区',0),(1391,154,'孟津县',0),(1392,154,'新安县',0),(1393,154,'栾川县',0),(1394,154,'嵩县',0),(1395,154,'汝阳县',0),(1396,154,'宜阳县',0),(1397,154,'洛宁县',0),(1398,154,'伊川县',0),(1399,154,'偃师市',0),(1400,155,'新华区',0),(1401,155,'卫东区',0),(1402,155,'石龙区',0),(1403,155,'湛河区',0),(1404,155,'宝丰县',0),(1405,155,'叶县',0),(1406,155,'鲁山县',0),(1407,155,'郏县',0),(1408,155,'舞钢市',0),(1409,155,'汝州市',0),(1410,156,'文峰区',0),(1411,156,'北关区',0),(1412,156,'殷都区',0),(1413,156,'龙安区',0),(1414,156,'安阳县',0),(1415,156,'汤阴县',0),(1416,156,'滑县',0),(1417,156,'内黄县',0),(1418,156,'林州市',0),(1419,157,'鹤山区',0),(1420,157,'山城区',0),(1421,157,'淇滨区',0),(1422,157,'浚县',0),(1423,157,'淇县',0),(1424,158,'红旗区',0),(1425,158,'卫滨区',0),(1426,158,'凤泉区',0),(1427,158,'牧野区',0),(1428,158,'新乡县',0),(1429,158,'获嘉县',0),(1430,158,'原阳县',0),(1431,158,'延津县',0),(1432,158,'封丘县',0),(1433,158,'长垣县',0),(1434,158,'卫辉市',0),(1435,158,'辉县市',0),(1436,159,'解放区',0),(1437,159,'中站区',0),(1438,159,'马村区',0),(1439,159,'山阳区',0),(1440,159,'修武县',0),(1441,159,'博爱县',0),(1442,159,'武陟县',0),(1443,159,'温县',0),(1444,159,'济源市',0),(1445,159,'沁阳市',0),(1446,159,'孟州市',0),(1447,160,'华龙区',0),(1448,160,'清丰县',0),(1449,160,'南乐县',0),(1450,160,'范县',0),(1451,160,'台前县',0),(1452,160,'濮阳县',0),(1453,161,'魏都区',0),(1454,161,'许昌县',0),(1455,161,'鄢陵县',0),(1456,161,'襄城县',0),(1457,161,'禹州市',0),(1458,161,'长葛市',0),(1459,162,'源汇区',0),(1460,162,'郾城区',0),(1461,162,'召陵区',0),(1462,162,'舞阳县',0),(1463,162,'临颍县',0),(1464,163,'市辖区',0),(1465,163,'湖滨区',0),(1466,163,'渑池县',0),(1467,163,'陕县',0),(1468,163,'卢氏县',0),(1469,163,'义马市',0),(1470,163,'灵宝市',0),(1471,164,'宛城区',0),(1472,164,'卧龙区',0),(1473,164,'南召县',0),(1474,164,'方城县',0),(1475,164,'西峡县',0),(1476,164,'镇平县',0),(1477,164,'内乡县',0),(1478,164,'淅川县',0),(1479,164,'社旗县',0),(1480,164,'唐河县',0),(1481,164,'新野县',0),(1482,164,'桐柏县',0),(1483,164,'邓州市',0),(1484,165,'梁园区',0),(1485,165,'睢阳区',0),(1486,165,'民权县',0),(1487,165,'睢县',0),(1488,165,'宁陵县',0),(1489,165,'柘城县',0),(1490,165,'虞城县',0),(1491,165,'夏邑县',0),(1492,165,'永城市',0),(1493,166,'浉河区',0),(1494,166,'平桥区',0),(1495,166,'罗山县',0),(1496,166,'光山县',0),(1497,166,'新县',0),(1498,166,'商城县',0),(1499,166,'固始县',0),(1500,166,'潢川县',0),(1501,166,'淮滨县',0),(1502,166,'息县',0),(1503,167,'川汇区',0),(1504,167,'扶沟县',0),(1505,167,'西华县',0),(1506,167,'商水县',0),(1507,167,'沈丘县',0),(1508,167,'郸城县',0),(1509,167,'淮阳县',0),(1510,167,'太康县',0),(1511,167,'鹿邑县',0),(1512,167,'项城市',0),(1513,168,'驿城区',0),(1514,168,'西平县',0),(1515,168,'上蔡县',0),(1516,168,'平舆县',0),(1517,168,'正阳县',0),(1518,168,'确山县',0),(1519,168,'泌阳县',0),(1520,168,'汝南县',0),(1521,168,'遂平县',0),(1522,168,'新蔡县',0),(1523,169,'江岸区',0),(1524,169,'江汉区',0),(1525,169,'硚口区',0),(1526,169,'汉阳区',0),(1527,169,'武昌区',0),(1528,169,'青山区',0),(1529,169,'洪山区',0),(1530,169,'东西湖区',0),(1531,169,'汉南区',0),(1532,169,'蔡甸区',0),(1533,169,'江夏区',0),(1534,169,'黄陂区',0),(1535,169,'新洲区',0),(1536,170,'黄石港区',0),(1537,170,'西塞山区',0),(1538,170,'下陆区',0),(1539,170,'铁山区',0),(1540,170,'阳新县',0),(1541,170,'大冶市',0),(1542,171,'茅箭区',0),(1543,171,'张湾区',0),(1544,171,'郧县',0),(1545,171,'郧西县',0),(1546,171,'竹山县',0),(1547,171,'竹溪县',0),(1548,171,'房县',0),(1549,171,'丹江口市',0),(1550,172,'西陵区',0),(1551,172,'伍家岗区',0),(1552,172,'点军区',0),(1553,172,'猇亭区',0),(1554,172,'夷陵区',0),(1555,172,'远安县',0),(1556,172,'兴山县',0),(1557,172,'秭归县',0),(1558,172,'长阳土家族自治县',0),(1559,172,'五峰土家族自治县',0),(1560,172,'宜都市',0),(1561,172,'当阳市',0),(1562,172,'枝江市',0),(1563,173,'襄城区',0),(1564,173,'樊城区',0),(1565,173,'襄阳区',0),(1566,173,'南漳县',0),(1567,173,'谷城县',0),(1568,173,'保康县',0),(1569,173,'老河口市',0),(1570,173,'枣阳市',0),(1571,173,'宜城市',0),(1572,174,'梁子湖区',0),(1573,174,'华容区',0),(1574,174,'鄂城区',0),(1575,175,'东宝区',0),(1576,175,'掇刀区',0),(1577,175,'京山县',0),(1578,175,'沙洋县',0),(1579,175,'钟祥市',0),(1580,176,'孝南区',0),(1581,176,'孝昌县',0),(1582,176,'大悟县',0),(1583,176,'云梦县',0),(1584,176,'应城市',0),(1585,176,'安陆市',0),(1586,176,'汉川市',0),(1587,177,'沙市区',0),(1588,177,'荆州区',0),(1589,177,'公安县',0),(1590,177,'监利县',0),(1591,177,'江陵县',0),(1592,177,'石首市',0),(1593,177,'洪湖市',0),(1594,177,'松滋市',0),(1595,178,'黄州区',0),(1596,178,'团风县',0),(1597,178,'红安县',0),(1598,178,'罗田县',0),(1599,178,'英山县',0),(1600,178,'浠水县',0),(1601,178,'蕲春县',0),(1602,178,'黄梅县',0),(1603,178,'麻城市',0),(1604,178,'武穴市',0),(1605,179,'咸安区',0),(1606,179,'嘉鱼县',0),(1607,179,'通城县',0),(1608,179,'崇阳县',0),(1609,179,'通山县',0),(1610,179,'赤壁市',0),(1611,180,'曾都区',0),(1612,180,'广水市',0),(1613,181,'恩施市',0),(1614,181,'利川市',0),(1615,181,'建始县',0),(1616,181,'巴东县',0),(1617,181,'宣恩县',0),(1618,181,'咸丰县',0),(1619,181,'来凤县',0),(1620,181,'鹤峰县',0),(1621,182,'仙桃市',0),(1622,182,'潜江市',0),(1623,182,'天门市',0),(1624,182,'神农架林区',0),(1625,183,'芙蓉区',0),(1626,183,'天心区',0),(1627,183,'岳麓区',0),(1628,183,'开福区',0),(1629,183,'雨花区',0),(1630,183,'长沙县',0),(1631,183,'望城县',0),(1632,183,'宁乡县',0),(1633,183,'浏阳市',0),(1634,184,'荷塘区',0),(1635,184,'芦淞区',0),(1636,184,'石峰区',0),(1637,184,'天元区',0),(1638,184,'株洲县',0),(1639,184,'攸县',0),(1640,184,'茶陵县',0),(1641,184,'炎陵县',0),(1642,184,'醴陵市',0),(1643,185,'雨湖区',0),(1644,185,'岳塘区',0),(1645,185,'湘潭县',0),(1646,185,'湘乡市',0),(1647,185,'韶山市',0),(1648,186,'珠晖区',0),(1649,186,'雁峰区',0),(1650,186,'石鼓区',0),(1651,186,'蒸湘区',0),(1652,186,'南岳区',0),(1653,186,'衡阳县',0),(1654,186,'衡南县',0),(1655,186,'衡山县',0),(1656,186,'衡东县',0),(1657,186,'祁东县',0),(1658,186,'耒阳市',0),(1659,186,'常宁市',0),(1660,187,'双清区',0),(1661,187,'大祥区',0),(1662,187,'北塔区',0),(1663,187,'邵东县',0),(1664,187,'新邵县',0),(1665,187,'邵阳县',0),(1666,187,'隆回县',0),(1667,187,'洞口县',0),(1668,187,'绥宁县',0),(1669,187,'新宁县',0),(1670,187,'城步苗族自治县',0),(1671,187,'武冈市',0),(1672,188,'岳阳楼区',0),(1673,188,'云溪区',0),(1674,188,'君山区',0),(1675,188,'岳阳县',0),(1676,188,'华容县',0),(1677,188,'湘阴县',0),(1678,188,'平江县',0),(1679,188,'汨罗市',0),(1680,188,'临湘市',0),(1681,189,'武陵区',0),(1682,189,'鼎城区',0),(1683,189,'安乡县',0),(1684,189,'汉寿县',0),(1685,189,'澧县',0),(1686,189,'临澧县',0),(1687,189,'桃源县',0),(1688,189,'石门县',0),(1689,189,'津市市',0),(1690,190,'永定区',0),(1691,190,'武陵源区',0),(1692,190,'慈利县',0),(1693,190,'桑植县',0),(1694,191,'资阳区',0),(1695,191,'赫山区',0),(1696,191,'南县',0),(1697,191,'桃江县',0),(1698,191,'安化县',0),(1699,191,'沅江市',0),(1700,192,'北湖区',0),(1701,192,'苏仙区',0),(1702,192,'桂阳县',0),(1703,192,'宜章县',0),(1704,192,'永兴县',0),(1705,192,'嘉禾县',0),(1706,192,'临武县',0),(1707,192,'汝城县',0),(1708,192,'桂东县',0),(1709,192,'安仁县',0),(1710,192,'资兴市',0),(1711,193,'芝山区',0),(1712,193,'冷水滩区',0),(1713,193,'祁阳县',0),(1714,193,'东安县',0),(1715,193,'双牌县',0),(1716,193,'道县',0),(1717,193,'江永县',0),(1718,193,'宁远县',0),(1719,193,'蓝山县',0),(1720,193,'新田县',0),(1721,193,'江华瑶族自治县',0),(1722,194,'鹤城区',0),(1723,194,'中方县',0),(1724,194,'沅陵县',0),(1725,194,'辰溪县',0),(1726,194,'溆浦县',0),(1727,194,'会同县',0),(1728,194,'麻阳苗族自治县',0),(1729,194,'新晃侗族自治县',0),(1730,194,'芷江侗族自治县',0),(1731,194,'靖州苗族侗族自治县',0),(1732,194,'通道侗族自治县',0),(1733,194,'洪江市',0),(1734,195,'娄星区',0),(1735,195,'双峰县',0),(1736,195,'新化县',0),(1737,195,'冷水江市',0),(1738,195,'涟源市',0),(1739,196,'吉首市',0),(1740,196,'泸溪县',0),(1741,196,'凤凰县',0),(1742,196,'花垣县',0),(1743,196,'保靖县',0),(1744,196,'古丈县',0),(1745,196,'永顺县',0),(1746,196,'龙山县',0),(1747,197,'东山区',0),(1748,197,'荔湾区',0),(1749,197,'越秀区',0),(1750,197,'海珠区',0),(1751,197,'天河区',0),(1752,197,'芳村区',0),(1753,197,'白云区',0),(1754,197,'黄埔区',0),(1755,197,'番禺区',0),(1756,197,'花都区',0),(1757,197,'增城市',0),(1759,198,'武江区',0),(1760,198,'浈江区',0),(1761,198,'曲江区',0),(1762,198,'始兴县',0),(1763,198,'仁化县',0),(1764,198,'翁源县',0),(1765,198,'乳源瑶族自治县',0),(1766,198,'新丰县',0),(1767,198,'乐昌市',0),(1768,198,'南雄市',0),(1769,199,'罗湖区',0),(1770,199,'福田区',0),(1771,199,'南山区',0),(1772,199,'宝安区',0),(1773,199,'龙岗区',0),(1774,199,'盐田区',0),(1775,200,'香洲区',0),(1776,200,'斗门区',0),(1777,200,'金湾区',0),(1778,201,'龙湖区',0),(1779,201,'金平区',0),(1780,201,'濠江区',0),(1781,201,'潮阳区',0),(1782,201,'潮南区',0),(1783,201,'澄海区',0),(1784,201,'南澳县',0),(1785,202,'禅城区',0),(1786,202,'南海区',0),(1787,202,'顺德区',0),(1788,202,'三水区',0),(1789,202,'高明区',0),(1790,203,'蓬江区',0),(1791,203,'江海区',0),(1792,203,'新会区',0),(1793,203,'台山市',0),(1794,203,'开平市',0),(1795,203,'鹤山市',0),(1796,203,'恩平市',0),(1797,204,'赤坎区',0),(1798,204,'霞山区',0),(1799,204,'坡头区',0),(1800,204,'麻章区',0),(1801,204,'遂溪县',0),(1802,204,'徐闻县',0),(1803,204,'廉江市',0),(1804,204,'雷州市',0),(1805,204,'吴川市',0),(1806,205,'茂南区',0),(1807,205,'茂港区',0),(1808,205,'电白县',0),(1809,205,'高州市',0),(1810,205,'化州市',0),(1811,205,'信宜市',0),(1812,206,'端州区',0),(1813,206,'鼎湖区',0),(1814,206,'广宁县',0),(1815,206,'怀集县',0),(1816,206,'封开县',0),(1817,206,'德庆县',0),(1818,206,'高要市',0),(1819,206,'四会市',0),(1820,207,'惠城区',0),(1821,207,'惠阳区',0),(1822,207,'博罗县',0),(1823,207,'惠东县',0),(1824,207,'龙门县',0),(1825,208,'梅江区',0),(1826,208,'梅县',0),(1827,208,'大埔县',0),(1828,208,'丰顺县',0),(1829,208,'五华县',0),(1830,208,'平远县',0),(1831,208,'蕉岭县',0),(1832,208,'兴宁市',0),(1833,209,'城区',0),(1834,209,'海丰县',0),(1835,209,'陆河县',0),(1836,209,'陆丰市',0),(1837,210,'源城区',0),(1838,210,'紫金县',0),(1839,210,'龙川县',0),(1840,210,'连平县',0),(1841,210,'和平县',0),(1842,210,'东源县',0),(1843,211,'江城区',0),(1844,211,'阳西县',0),(1845,211,'阳东县',0),(1846,211,'阳春市',0),(1847,212,'清城区',0),(1848,212,'佛冈县',0),(1849,212,'阳山县',0),(1850,212,'连山壮族瑶族自治县',0),(1851,212,'连南瑶族自治县',0),(1852,212,'清新县',0),(1853,212,'英德市',0),(1854,212,'连州市',0),(1855,215,'湘桥区',0),(1856,215,'潮安县',0),(1857,215,'饶平县',0),(1858,216,'榕城区',0),(1859,216,'揭东县',0),(1860,216,'揭西县',0),(1861,216,'惠来县',0),(1862,216,'普宁市',0),(1863,217,'云城区',0),(1864,217,'新兴县',0),(1865,217,'郁南县',0),(1866,217,'云安县',0),(1867,217,'罗定市',0),(1868,218,'兴宁区',0),(1869,218,'青秀区',0),(1870,218,'江南区',0),(1871,218,'西乡塘区',0),(1872,218,'良庆区',0),(1873,218,'邕宁区',0),(1874,218,'武鸣县',0),(1875,218,'隆安县',0),(1876,218,'马山县',0),(1877,218,'上林县',0),(1878,218,'宾阳县',0),(1879,218,'横县',0),(1880,219,'城中区',0),(1881,219,'鱼峰区',0),(1882,219,'柳南区',0),(1883,219,'柳北区',0),(1884,219,'柳江县',0),(1885,219,'柳城县',0),(1886,219,'鹿寨县',0),(1887,219,'融安县',0),(1888,219,'融水苗族自治县',0),(1889,219,'三江侗族自治县',0),(1890,220,'秀峰区',0),(1891,220,'叠彩区',0),(1892,220,'象山区',0),(1893,220,'七星区',0),(1894,220,'雁山区',0),(1895,220,'阳朔县',0),(1896,220,'临桂县',0),(1897,220,'灵川县',0),(1898,220,'全州县',0),(1899,220,'兴安县',0),(1900,220,'永福县',0),(1901,220,'灌阳县',0),(1902,220,'龙胜各族自治县',0),(1903,220,'资源县',0),(1904,220,'平乐县',0),(1905,220,'荔蒲县',0),(1906,220,'恭城瑶族自治县',0),(1907,221,'万秀区',0),(1908,221,'蝶山区',0),(1909,221,'长洲区',0),(1910,221,'苍梧县',0),(1911,221,'藤县',0),(1912,221,'蒙山县',0),(1913,221,'岑溪市',0),(1914,222,'海城区',0),(1915,222,'银海区',0),(1916,222,'铁山港区',0),(1917,222,'合浦县',0),(1918,223,'港口区',0),(1919,223,'防城区',0),(1920,223,'上思县',0),(1921,223,'东兴市',0),(1922,224,'钦南区',0),(1923,224,'钦北区',0),(1924,224,'灵山县',0),(1925,224,'浦北县',0),(1926,225,'港北区',0),(1927,225,'港南区',0),(1928,225,'覃塘区',0),(1929,225,'平南县',0),(1930,225,'桂平市',0),(1931,226,'玉州区',0),(1932,226,'容县',0),(1933,226,'陆川县',0),(1934,226,'博白县',0),(1935,226,'兴业县',0),(1936,226,'北流市',0),(1937,227,'右江区',0),(1938,227,'田阳县',0),(1939,227,'田东县',0),(1940,227,'平果县',0),(1941,227,'德保县',0),(1942,227,'靖西县',0),(1943,227,'那坡县',0),(1944,227,'凌云县',0),(1945,227,'乐业县',0),(1946,227,'田林县',0),(1947,227,'西林县',0),(1948,227,'隆林各族自治县',0),(1949,228,'八步区',0),(1950,228,'昭平县',0),(1951,228,'钟山县',0),(1952,228,'富川瑶族自治县',0),(1953,229,'金城江区',0),(1954,229,'南丹县',0),(1955,229,'天峨县',0),(1956,229,'凤山县',0),(1957,229,'东兰县',0),(1958,229,'罗城仫佬族自治县',0),(1959,229,'环江毛南族自治县',0),(1960,229,'巴马瑶族自治县',0),(1961,229,'都安瑶族自治县',0),(1962,229,'大化瑶族自治县',0),(1963,229,'宜州市',0),(1964,230,'兴宾区',0),(1965,230,'忻城县',0),(1966,230,'象州县',0),(1967,230,'武宣县',0),(1968,230,'金秀瑶族自治县',0),(1969,230,'合山市',0),(1970,231,'江洲区',0),(1971,231,'扶绥县',0),(1972,231,'宁明县',0),(1973,231,'龙州县',0),(1974,231,'大新县',0),(1975,231,'天等县',0),(1976,231,'凭祥市',0),(1977,232,'秀英区',0),(1978,232,'龙华区',0),(1979,232,'琼山区',0),(1980,232,'美兰区',0),(1981,233,'五指山市',0),(1982,233,'琼海市',0),(1983,233,'儋州市',0),(1984,233,'文昌市',0),(1985,233,'万宁市',0),(1986,233,'东方市',0),(1987,233,'定安县',0),(1988,233,'屯昌县',0),(1989,233,'澄迈县',0),(1990,233,'临高县',0),(1991,233,'白沙黎族自治县',0),(1992,233,'昌江黎族自治县',0),(1993,233,'乐东黎族自治县',0),(1994,233,'陵水黎族自治县',0),(1995,233,'保亭黎族苗族自治县',0),(1996,233,'琼中黎族苗族自治县',0),(1997,233,'西沙群岛',0),(1998,233,'南沙群岛',0),(1999,233,'中沙群岛的岛礁及其海域',0),(2000,234,'万州区',0),(2001,234,'涪陵区',0),(2002,234,'渝中区',0),(2003,234,'大渡口区',0),(2004,234,'江北区',0),(2005,234,'沙坪坝区',0),(2006,234,'九龙坡区',0),(2007,234,'南岸区',0),(2008,234,'北碚区',0),(2009,234,'万盛区',0),(2010,234,'双桥区',0),(2011,234,'渝北区',0),(2012,234,'巴南区',0),(2013,234,'黔江区',0),(2014,234,'长寿区',0),(2015,234,'綦江县',0),(2016,234,'潼南县',0),(2017,234,'铜梁县',0),(2018,234,'大足县',0),(2019,234,'荣昌县',0),(2020,234,'璧山县',0),(2021,234,'梁平县',0),(2022,234,'城口县',0),(2023,234,'丰都县',0),(2024,234,'垫江县',0),(2025,234,'武隆县',0),(2026,234,'忠县',0),(2027,234,'开县',0),(2028,234,'云阳县',0),(2029,234,'奉节县',0),(2030,234,'巫山县',0),(2031,234,'巫溪县',0),(2032,234,'石柱土家族自治县',0),(2033,234,'秀山土家族苗族自治县',0),(2034,234,'酉阳土家族苗族自治县',0),(2035,234,'彭水苗族土家族自治县',0),(2036,234,'江津市',0),(2037,234,'合川市',0),(2038,234,'永川市',0),(2039,234,'南川市',0),(2040,235,'锦江区',0),(2041,235,'青羊区',0),(2042,235,'金牛区',0),(2043,235,'武侯区',0),(2044,235,'成华区',0),(2045,235,'龙泉驿区',0),(2046,235,'青白江区',0),(2047,235,'新都区',0),(2048,235,'温江区',0),(2049,235,'金堂县',0),(2050,235,'双流县',0),(2051,235,'郫县',0),(2052,235,'大邑县',0),(2053,235,'蒲江县',0),(2054,235,'新津县',0),(2055,235,'都江堰市',0),(2056,235,'彭州市',0),(2057,235,'邛崃市',0),(2058,235,'崇州市',0),(2059,236,'自流井区',0),(2060,236,'贡井区',0),(2061,236,'大安区',0),(2062,236,'沿滩区',0),(2063,236,'荣县',0),(2064,236,'富顺县',0),(2065,237,'东区',0),(2066,237,'西区',0),(2067,237,'仁和区',0),(2068,237,'米易县',0),(2069,237,'盐边县',0),(2070,238,'江阳区',0),(2071,238,'纳溪区',0),(2072,238,'龙马潭区',0),(2073,238,'泸县',0),(2074,238,'合江县',0),(2075,238,'叙永县',0),(2076,238,'古蔺县',0),(2077,239,'旌阳区',0),(2078,239,'中江县',0),(2079,239,'罗江县',0),(2080,239,'广汉市',0),(2081,239,'什邡市',0),(2082,239,'绵竹市',0),(2083,240,'涪城区',0),(2084,240,'游仙区',0),(2085,240,'三台县',0),(2086,240,'盐亭县',0),(2087,240,'安县',0),(2088,240,'梓潼县',0),(2089,240,'北川羌族自治县',0),(2090,240,'平武县',0),(2091,240,'江油市',0),(2092,241,'市中区',0),(2093,241,'元坝区',0),(2094,241,'朝天区',0),(2095,241,'旺苍县',0),(2096,241,'青川县',0),(2097,241,'剑阁县',0),(2098,241,'苍溪县',0),(2099,242,'船山区',0),(2100,242,'安居区',0),(2101,242,'蓬溪县',0),(2102,242,'射洪县',0),(2103,242,'大英县',0),(2104,243,'市中区',0),(2105,243,'东兴区',0),(2106,243,'威远县',0),(2107,243,'资中县',0),(2108,243,'隆昌县',0),(2109,244,'市中区',0),(2110,244,'沙湾区',0),(2111,244,'五通桥区',0),(2112,244,'金口河区',0),(2113,244,'犍为县',0),(2114,244,'井研县',0),(2115,244,'夹江县',0),(2116,244,'沐川县',0),(2117,244,'峨边彝族自治县',0),(2118,244,'马边彝族自治县',0),(2119,244,'峨眉山市',0),(2120,245,'顺庆区',0),(2121,245,'高坪区',0),(2122,245,'嘉陵区',0),(2123,245,'南部县',0),(2124,245,'营山县',0),(2125,245,'蓬安县',0),(2126,245,'仪陇县',0),(2127,245,'西充县',0),(2128,245,'阆中市',0),(2129,246,'东坡区',0),(2130,246,'仁寿县',0),(2131,246,'彭山县',0),(2132,246,'洪雅县',0),(2133,246,'丹棱县',0),(2134,246,'青神县',0),(2135,247,'翠屏区',0),(2136,247,'宜宾县',0),(2137,247,'南溪县',0),(2138,247,'江安县',0),(2139,247,'长宁县',0),(2140,247,'高县',0),(2141,247,'珙县',0),(2142,247,'筠连县',0),(2143,247,'兴文县',0),(2144,247,'屏山县',0),(2145,248,'广安区',0),(2146,248,'岳池县',0),(2147,248,'武胜县',0),(2148,248,'邻水县',0),(2149,248,'华蓥市',0),(2150,249,'通川区',0),(2151,249,'达县',0),(2152,249,'宣汉县',0),(2153,249,'开江县',0),(2154,249,'大竹县',0),(2155,249,'渠县',0),(2156,249,'万源市',0),(2157,250,'雨城区',0),(2158,250,'名山县',0),(2159,250,'荥经县',0),(2160,250,'汉源县',0),(2161,250,'石棉县',0),(2162,250,'天全县',0),(2163,250,'芦山县',0),(2164,250,'宝兴县',0),(2165,251,'巴州区',0),(2166,251,'通江县',0),(2167,251,'南江县',0),(2168,251,'平昌县',0),(2169,252,'雁江区',0),(2170,252,'安岳县',0),(2171,252,'乐至县',0),(2172,252,'简阳市',0),(2173,253,'汶川县',0),(2174,253,'理县',0),(2175,253,'茂县',0),(2176,253,'松潘县',0),(2177,253,'九寨沟县',0),(2178,253,'金川县',0),(2179,253,'小金县',0),(2180,253,'黑水县',0),(2181,253,'马尔康县',0),(2182,253,'壤塘县',0),(2183,253,'阿坝县',0),(2184,253,'若尔盖县',0),(2185,253,'红原县',0),(2186,254,'康定县',0),(2187,254,'泸定县',0),(2188,254,'丹巴县',0),(2189,254,'九龙县',0),(2190,254,'雅江县',0),(2191,254,'道孚县',0),(2192,254,'炉霍县',0),(2193,254,'甘孜县',0),(2194,254,'新龙县',0),(2195,254,'德格县',0),(2196,254,'白玉县',0),(2197,254,'石渠县',0),(2198,254,'色达县',0),(2199,254,'理塘县',0),(2200,254,'巴塘县',0),(2201,254,'乡城县',0),(2202,254,'稻城县',0),(2203,254,'得荣县',0),(2204,255,'西昌市',0),(2205,255,'木里藏族自治县',0),(2206,255,'盐源县',0),(2207,255,'德昌县',0),(2208,255,'会理县',0),(2209,255,'会东县',0),(2210,255,'宁南县',0),(2211,255,'普格县',0),(2212,255,'布拖县',0),(2213,255,'金阳县',0),(2214,255,'昭觉县',0),(2215,255,'喜德县',0),(2216,255,'冕宁县',0),(2217,255,'越西县',0),(2218,255,'甘洛县',0),(2219,255,'美姑县',0),(2220,255,'雷波县',0),(2221,256,'南明区',0),(2222,256,'云岩区',0),(2223,256,'花溪区',0),(2224,256,'乌当区',0),(2225,256,'白云区',0),(2226,256,'小河区',0),(2227,256,'开阳县',0),(2228,256,'息烽县',0),(2229,256,'修文县',0),(2230,256,'清镇市',0),(2231,257,'钟山区',0),(2232,257,'六枝特区',0),(2233,257,'水城县',0),(2234,257,'盘县',0),(2235,258,'红花岗区',0),(2236,258,'汇川区',0),(2237,258,'遵义县',0),(2238,258,'桐梓县',0),(2239,258,'绥阳县',0),(2240,258,'正安县',0),(2241,258,'道真仡佬族苗族自治县',0),(2242,258,'务川仡佬族苗族自治县',0),(2243,258,'凤冈县',0),(2244,258,'湄潭县',0),(2245,258,'余庆县',0),(2246,258,'习水县',0),(2247,258,'赤水市',0),(2248,258,'仁怀市',0),(2249,259,'西秀区',0),(2250,259,'平坝县',0),(2251,259,'普定县',0),(2252,259,'镇宁布依族苗族自治县',0),(2253,259,'关岭布依族苗族自治县',0),(2254,259,'紫云苗族布依族自治县',0),(2255,260,'铜仁市',0),(2256,260,'江口县',0),(2257,260,'玉屏侗族自治县',0),(2258,260,'石阡县',0),(2259,260,'思南县',0),(2260,260,'印江土家族苗族自治县',0),(2261,260,'德江县',0),(2262,260,'沿河土家族自治县',0),(2263,260,'松桃苗族自治县',0),(2264,260,'万山特区',0),(2265,261,'兴义市',0),(2266,261,'兴仁县',0),(2267,261,'普安县',0),(2268,261,'晴隆县',0),(2269,261,'贞丰县',0),(2270,261,'望谟县',0),(2271,261,'册亨县',0),(2272,261,'安龙县',0),(2273,262,'毕节市',0),(2274,262,'大方县',0),(2275,262,'黔西县',0),(2276,262,'金沙县',0),(2277,262,'织金县',0),(2278,262,'纳雍县',0),(2279,262,'威宁彝族回族苗族自治县',0),(2280,262,'赫章县',0),(2281,263,'凯里市',0),(2282,263,'黄平县',0),(2283,263,'施秉县',0),(2284,263,'三穗县',0),(2285,263,'镇远县',0),(2286,263,'岑巩县',0),(2287,263,'天柱县',0),(2288,263,'锦屏县',0),(2289,263,'剑河县',0),(2290,263,'台江县',0),(2291,263,'黎平县',0),(2292,263,'榕江县',0),(2293,263,'从江县',0),(2294,263,'雷山县',0),(2295,263,'麻江县',0),(2296,263,'丹寨县',0),(2297,264,'都匀市',0),(2298,264,'福泉市',0),(2299,264,'荔波县',0),(2300,264,'贵定县',0),(2301,264,'瓮安县',0),(2302,264,'独山县',0),(2303,264,'平塘县',0),(2304,264,'罗甸县',0),(2305,264,'长顺县',0),(2306,264,'龙里县',0),(2307,264,'惠水县',0),(2308,264,'三都水族自治县',0),(2309,265,'五华区',0),(2310,265,'盘龙区',0),(2311,265,'官渡区',0),(2312,265,'西山区',0),(2313,265,'东川区',0),(2314,265,'呈贡县',0),(2315,265,'晋宁县',0),(2316,265,'富民县',0),(2317,265,'宜良县',0),(2318,265,'石林彝族自治县',0),(2319,265,'嵩明县',0),(2320,265,'禄劝彝族苗族自治县',0),(2321,265,'寻甸回族彝族自治县',0),(2322,265,'安宁市',0),(2323,266,'麒麟区',0),(2324,266,'马龙县',0),(2325,266,'陆良县',0),(2326,266,'师宗县',0),(2327,266,'罗平县',0),(2328,266,'富源县',0),(2329,266,'会泽县',0),(2330,266,'沾益县',0),(2331,266,'宣威市',0),(2332,267,'红塔区',0),(2333,267,'江川县',0),(2334,267,'澄江县',0),(2335,267,'通海县',0),(2336,267,'华宁县',0),(2337,267,'易门县',0),(2338,267,'峨山彝族自治县',0),(2339,267,'新平彝族傣族自治县',0),(2340,267,'元江哈尼族彝族傣族自治县',0),(2341,268,'隆阳区',0),(2342,268,'施甸县',0),(2343,268,'腾冲县',0),(2344,268,'龙陵县',0),(2345,268,'昌宁县',0),(2346,269,'昭阳区',0),(2347,269,'鲁甸县',0),(2348,269,'巧家县',0),(2349,269,'盐津县',0),(2350,269,'大关县',0),(2351,269,'永善县',0),(2352,269,'绥江县',0),(2353,269,'镇雄县',0),(2354,269,'彝良县',0),(2355,269,'威信县',0),(2356,269,'水富县',0),(2357,270,'古城区',0),(2358,270,'玉龙纳西族自治县',0),(2359,270,'永胜县',0),(2360,270,'华坪县',0),(2361,270,'宁蒗彝族自治县',0),(2362,271,'翠云区',0),(2363,271,'普洱哈尼族彝族自治县',0),(2364,271,'墨江哈尼族自治县',0),(2365,271,'景东彝族自治县',0),(2366,271,'景谷傣族彝族自治县',0),(2367,271,'镇沅彝族哈尼族拉祜族自治县',0),(2368,271,'江城哈尼族彝族自治县',0),(2369,271,'孟连傣族拉祜族佤族自治县',0),(2370,271,'澜沧拉祜族自治县',0),(2371,271,'西盟佤族自治县',0),(2372,272,'临翔区',0),(2373,272,'凤庆县',0),(2374,272,'云县',0),(2375,272,'永德县',0),(2376,272,'镇康县',0),(2377,272,'双江拉祜族佤族布朗族傣族自治县',0),(2378,272,'耿马傣族佤族自治县',0),(2379,272,'沧源佤族自治县',0),(2380,273,'楚雄市',0),(2381,273,'双柏县',0),(2382,273,'牟定县',0),(2383,273,'南华县',0),(2384,273,'姚安县',0),(2385,273,'大姚县',0),(2386,273,'永仁县',0),(2387,273,'元谋县',0),(2388,273,'武定县',0),(2389,273,'禄丰县',0),(2390,274,'个旧市',0),(2391,274,'开远市',0),(2392,274,'蒙自县',0),(2393,274,'屏边苗族自治县',0),(2394,274,'建水县',0),(2395,274,'石屏县',0),(2396,274,'弥勒县',0),(2397,274,'泸西县',0),(2398,274,'元阳县',0),(2399,274,'红河县',0),(2400,274,'金平苗族瑶族傣族自治县',0),(2401,274,'绿春县',0),(2402,274,'河口瑶族自治县',0),(2403,275,'文山县',0),(2404,275,'砚山县',0),(2405,275,'西畴县',0),(2406,275,'麻栗坡县',0),(2407,275,'马关县',0),(2408,275,'丘北县',0),(2409,275,'广南县',0),(2410,275,'富宁县',0),(2411,276,'景洪市',0),(2412,276,'勐海县',0),(2413,276,'勐腊县',0),(2414,277,'大理市',0),(2415,277,'漾濞彝族自治县',0),(2416,277,'祥云县',0),(2417,277,'宾川县',0),(2418,277,'弥渡县',0),(2419,277,'南涧彝族自治县',0),(2420,277,'巍山彝族回族自治县',0),(2421,277,'永平县',0),(2422,277,'云龙县',0),(2423,277,'洱源县',0),(2424,277,'剑川县',0),(2425,277,'鹤庆县',0),(2426,278,'瑞丽市',0),(2427,278,'潞西市',0),(2428,278,'梁河县',0),(2429,278,'盈江县',0),(2430,278,'陇川县',0),(2431,279,'泸水县',0),(2432,279,'福贡县',0),(2433,279,'贡山独龙族怒族自治县',0),(2434,279,'兰坪白族普米族自治县',0),(2435,280,'香格里拉县',0),(2436,280,'德钦县',0),(2437,280,'维西傈僳族自治县',0),(2438,281,'城关区',0),(2439,281,'林周县',0),(2440,281,'当雄县',0),(2441,281,'尼木县',0),(2442,281,'曲水县',0),(2443,281,'堆龙德庆县',0),(2444,281,'达孜县',0),(2445,281,'墨竹工卡县',0),(2446,282,'昌都县',0),(2447,282,'江达县',0),(2448,282,'贡觉县',0),(2449,282,'类乌齐县',0),(2450,282,'丁青县',0),(2451,282,'察雅县',0),(2452,282,'八宿县',0),(2453,282,'左贡县',0),(2454,282,'芒康县',0),(2455,282,'洛隆县',0),(2456,282,'边坝县',0),(2457,283,'乃东县',0),(2458,283,'扎囊县',0),(2459,283,'贡嘎县',0),(2460,283,'桑日县',0),(2461,283,'琼结县',0),(2462,283,'曲松县',0),(2463,283,'措美县',0),(2464,283,'洛扎县',0),(2465,283,'加查县',0),(2466,283,'隆子县',0),(2467,283,'错那县',0),(2468,283,'浪卡子县',0),(2469,284,'日喀则市',0),(2470,284,'南木林县',0),(2471,284,'江孜县',0),(2472,284,'定日县',0),(2473,284,'萨迦县',0),(2474,284,'拉孜县',0),(2475,284,'昂仁县',0),(2476,284,'谢通门县',0),(2477,284,'白朗县',0),(2478,284,'仁布县',0),(2479,284,'康马县',0),(2480,284,'定结县',0),(2481,284,'仲巴县',0),(2482,284,'亚东县',0),(2483,284,'吉隆县',0),(2484,284,'聂拉木县',0),(2485,284,'萨嘎县',0),(2486,284,'岗巴县',0),(2487,285,'那曲县',0),(2488,285,'嘉黎县',0),(2489,285,'比如县',0),(2490,285,'聂荣县',0),(2491,285,'安多县',0),(2492,285,'申扎县',0),(2493,285,'索县',0),(2494,285,'班戈县',0),(2495,285,'巴青县',0),(2496,285,'尼玛县',0),(2497,286,'普兰县',0),(2498,286,'札达县',0),(2499,286,'噶尔县',0),(2500,286,'日土县',0),(2501,286,'革吉县',0),(2502,286,'改则县',0),(2503,286,'措勤县',0),(2504,287,'林芝县',0),(2505,287,'工布江达县',0),(2506,287,'米林县',0),(2507,287,'墨脱县',0),(2508,287,'波密县',0),(2509,287,'察隅县',0),(2510,287,'朗县',0),(2511,288,'新城区',0),(2512,288,'碑林区',0),(2513,288,'莲湖区',0),(2514,288,'灞桥区',0),(2515,288,'未央区',0),(2516,288,'雁塔区',0),(2517,288,'阎良区',0),(2518,288,'临潼区',0),(2519,288,'长安区',0),(2520,288,'蓝田县',0),(2521,288,'周至县',0),(2522,288,'户县',0),(2523,288,'高陵县',0),(2524,289,'王益区',0),(2525,289,'印台区',0),(2526,289,'耀州区',0),(2527,289,'宜君县',0),(2528,290,'渭滨区',0),(2529,290,'金台区',0),(2530,290,'陈仓区',0),(2531,290,'凤翔县',0),(2532,290,'岐山县',0),(2533,290,'扶风县',0),(2534,290,'眉县',0),(2535,290,'陇县',0),(2536,290,'千阳县',0),(2537,290,'麟游县',0),(2538,290,'凤县',0),(2539,290,'太白县',0),(2540,291,'秦都区',0),(2541,291,'杨凌区',0),(2542,291,'渭城区',0),(2543,291,'三原县',0),(2544,291,'泾阳县',0),(2545,291,'乾县',0),(2546,291,'礼泉县',0),(2547,291,'永寿县',0),(2548,291,'彬县',0),(2549,291,'长武县',0),(2550,291,'旬邑县',0),(2551,291,'淳化县',0),(2552,291,'武功县',0),(2553,291,'兴平市',0),(2554,292,'临渭区',0),(2555,292,'华县',0),(2556,292,'潼关县',0),(2557,292,'大荔县',0),(2558,292,'合阳县',0),(2559,292,'澄城县',0),(2560,292,'蒲城县',0),(2561,292,'白水县',0),(2562,292,'富平县',0),(2563,292,'韩城市',0),(2564,292,'华阴市',0),(2565,293,'宝塔区',0),(2566,293,'延长县',0),(2567,293,'延川县',0),(2568,293,'子长县',0),(2569,293,'安塞县',0),(2570,293,'志丹县',0),(2571,293,'吴旗县',0),(2572,293,'甘泉县',0),(2573,293,'富县',0),(2574,293,'洛川县',0),(2575,293,'宜川县',0),(2576,293,'黄龙县',0),(2577,293,'黄陵县',0),(2578,294,'汉台区',0),(2579,294,'南郑县',0),(2580,294,'城固县',0),(2581,294,'洋县',0),(2582,294,'西乡县',0),(2583,294,'勉县',0),(2584,294,'宁强县',0),(2585,294,'略阳县',0),(2586,294,'镇巴县',0),(2587,294,'留坝县',0),(2588,294,'佛坪县',0),(2589,295,'榆阳区',0),(2590,295,'神木县',0),(2591,295,'府谷县',0),(2592,295,'横山县',0),(2593,295,'靖边县',0),(2594,295,'定边县',0),(2595,295,'绥德县',0),(2596,295,'米脂县',0),(2597,295,'佳县',0),(2598,295,'吴堡县',0),(2599,295,'清涧县',0),(2600,295,'子洲县',0),(2601,296,'汉滨区',0),(2602,296,'汉阴县',0),(2603,296,'石泉县',0),(2604,296,'宁陕县',0),(2605,296,'紫阳县',0),(2606,296,'岚皋县',0),(2607,296,'平利县',0),(2608,296,'镇坪县',0),(2609,296,'旬阳县',0),(2610,296,'白河县',0),(2611,297,'商州区',0),(2612,297,'洛南县',0),(2613,297,'丹凤县',0),(2614,297,'商南县',0),(2615,297,'山阳县',0),(2616,297,'镇安县',0),(2617,297,'柞水县',0),(2618,298,'城关区',0),(2619,298,'七里河区',0),(2620,298,'西固区',0),(2621,298,'安宁区',0),(2622,298,'红古区',0),(2623,298,'永登县',0),(2624,298,'皋兰县',0),(2625,298,'榆中县',0),(2626,300,'金川区',0),(2627,300,'永昌县',0),(2628,301,'白银区',0),(2629,301,'平川区',0),(2630,301,'靖远县',0),(2631,301,'会宁县',0),(2632,301,'景泰县',0),(2633,302,'秦城区',0),(2634,302,'北道区',0),(2635,302,'清水县',0),(2636,302,'秦安县',0),(2637,302,'甘谷县',0),(2638,302,'武山县',0),(2639,302,'张家川回族自治县',0),(2640,303,'凉州区',0),(2641,303,'民勤县',0),(2642,303,'古浪县',0),(2643,303,'天祝藏族自治县',0),(2644,304,'甘州区',0),(2645,304,'肃南裕固族自治县',0),(2646,304,'民乐县',0),(2647,304,'临泽县',0),(2648,304,'高台县',0),(2649,304,'山丹县',0),(2650,305,'崆峒区',0),(2651,305,'泾川县',0),(2652,305,'灵台县',0),(2653,305,'崇信县',0),(2654,305,'华亭县',0),(2655,305,'庄浪县',0),(2656,305,'静宁县',0),(2657,306,'肃州区',0),(2658,306,'金塔县',0),(2659,306,'安西县',0),(2660,306,'肃北蒙古族自治县',0),(2661,306,'阿克塞哈萨克族自治县',0),(2662,306,'玉门市',0),(2663,306,'敦煌市',0),(2664,307,'西峰区',0),(2665,307,'庆城县',0),(2666,307,'环县',0),(2667,307,'华池县',0),(2668,307,'合水县',0),(2669,307,'正宁县',0),(2670,307,'宁县',0),(2671,307,'镇原县',0),(2672,308,'安定区',0),(2673,308,'通渭县',0),(2674,308,'陇西县',0),(2675,308,'渭源县',0),(2676,308,'临洮县',0),(2677,308,'漳县',0),(2678,308,'岷县',0),(2679,309,'武都区',0),(2680,309,'成县',0),(2681,309,'文县',0),(2682,309,'宕昌县',0),(2683,309,'康县',0),(2684,309,'西和县',0),(2685,309,'礼县',0),(2686,309,'徽县',0),(2687,309,'两当县',0),(2688,310,'临夏市',0),(2689,310,'临夏县',0),(2690,310,'康乐县',0),(2691,310,'永靖县',0),(2692,310,'广河县',0),(2693,310,'和政县',0),(2694,310,'东乡族自治县',0),(2695,310,'积石山保安族东乡族撒拉族自治县',0),(2696,311,'合作市',0),(2697,311,'临潭县',0),(2698,311,'卓尼县',0),(2699,311,'舟曲县',0),(2700,311,'迭部县',0),(2701,311,'玛曲县',0),(2702,311,'碌曲县',0),(2703,311,'夏河县',0),(2704,312,'城东区',0),(2705,312,'城中区',0),(2706,312,'城西区',0),(2707,312,'城北区',0),(2708,312,'大通回族土族自治县',0),(2709,312,'湟中县',0),(2710,312,'湟源县',0),(2711,313,'平安县',0),(2712,313,'民和回族土族自治县',0),(2713,313,'乐都县',0),(2714,313,'互助土族自治县',0),(2715,313,'化隆回族自治县',0),(2716,313,'循化撒拉族自治县',0),(2717,314,'门源回族自治县',0),(2718,314,'祁连县',0),(2719,314,'海晏县',0),(2720,314,'刚察县',0),(2721,315,'同仁县',0),(2722,315,'尖扎县',0),(2723,315,'泽库县',0),(2724,315,'河南蒙古族自治县',0),(2725,316,'共和县',0),(2726,316,'同德县',0),(2727,316,'贵德县',0),(2728,316,'兴海县',0),(2729,316,'贵南县',0),(2730,317,'玛沁县',0),(2731,317,'班玛县',0),(2732,317,'甘德县',0),(2733,317,'达日县',0),(2734,317,'久治县',0),(2735,317,'玛多县',0),(2736,318,'玉树县',0),(2737,318,'杂多县',0),(2738,318,'称多县',0),(2739,318,'治多县',0),(2740,318,'囊谦县',0),(2741,318,'曲麻莱县',0),(2742,319,'格尔木市',0),(2743,319,'德令哈市',0),(2744,319,'乌兰县',0),(2745,319,'都兰县',0),(2746,319,'天峻县',0),(2747,320,'兴庆区',0),(2748,320,'西夏区',0),(2749,320,'金凤区',0),(2750,320,'永宁县',0),(2751,320,'贺兰县',0),(2752,320,'灵武市',0),(2753,321,'大武口区',0),(2754,321,'惠农区',0),(2755,321,'平罗县',0),(2756,322,'利通区',0),(2757,322,'盐池县',0),(2758,322,'同心县',0),(2759,322,'青铜峡市',0),(2760,323,'原州区',0),(2761,323,'西吉县',0),(2762,323,'隆德县',0),(2763,323,'泾源县',0),(2764,323,'彭阳县',0),(2765,324,'沙坡头区',0),(2766,324,'中宁县',0),(2767,324,'海原县',0),(2768,325,'天山区',0),(2769,325,'沙依巴克区',0),(2770,325,'新市区',0),(2771,325,'水磨沟区',0),(2772,325,'头屯河区',0),(2773,325,'达坂城区',0),(2774,325,'东山区',0),(2775,325,'乌鲁木齐县',0),(2776,326,'独山子区',0),(2777,326,'克拉玛依区',0),(2778,326,'白碱滩区',0),(2779,326,'乌尔禾区',0),(2780,327,'吐鲁番市',0),(2781,327,'鄯善县',0),(2782,327,'托克逊县',0),(2783,328,'哈密市',0),(2784,328,'巴里坤哈萨克自治县',0),(2785,328,'伊吾县',0),(2786,329,'昌吉市',0),(2787,329,'阜康市',0),(2788,329,'米泉市',0),(2789,329,'呼图壁县',0),(2790,329,'玛纳斯县',0),(2791,329,'奇台县',0),(2792,329,'吉木萨尔县',0),(2793,329,'木垒哈萨克自治县',0),(2794,330,'博乐市',0),(2795,330,'精河县',0),(2796,330,'温泉县',0),(2797,331,'库尔勒市',0),(2798,331,'轮台县',0),(2799,331,'尉犁县',0),(2800,331,'若羌县',0),(2801,331,'且末县',0),(2802,331,'焉耆回族自治县',0),(2803,331,'和静县',0),(2804,331,'和硕县',0),(2805,331,'博湖县',0),(2806,332,'阿克苏市',0),(2807,332,'温宿县',0),(2808,332,'库车县',0),(2809,332,'沙雅县',0),(2810,332,'新和县',0),(2811,332,'拜城县',0),(2812,332,'乌什县',0),(2813,332,'阿瓦提县',0),(2814,332,'柯坪县',0),(2815,333,'阿图什市',0),(2816,333,'阿克陶县',0),(2817,333,'阿合奇县',0),(2818,333,'乌恰县',0),(2819,334,'喀什市',0),(2820,334,'疏附县',0),(2821,334,'疏勒县',0),(2822,334,'英吉沙县',0),(2823,334,'泽普县',0),(2824,334,'莎车县',0),(2825,334,'叶城县',0),(2826,334,'麦盖提县',0),(2827,334,'岳普湖县',0),(2828,334,'伽师县',0),(2829,334,'巴楚县',0),(2830,334,'塔什库尔干塔吉克自治县',0),(2831,335,'和田市',0),(2832,335,'和田县',0),(2833,335,'墨玉县',0),(2834,335,'皮山县',0),(2835,335,'洛浦县',0),(2836,335,'策勒县',0),(2837,335,'于田县',0),(2838,335,'民丰县',0),(2839,336,'伊宁市',0),(2840,336,'奎屯市',0),(2841,336,'伊宁县',0),(2842,336,'察布查尔锡伯自治县',0),(2843,336,'霍城县',0),(2844,336,'巩留县',0),(2845,336,'新源县',0),(2846,336,'昭苏县',0),(2847,336,'特克斯县',0),(2848,336,'尼勒克县',0),(2849,337,'塔城市',0),(2850,337,'乌苏市',0),(2851,337,'额敏县',0),(2852,337,'沙湾县',0),(2853,337,'托里县',0),(2854,337,'裕民县',0),(2855,337,'和布克赛尔蒙古自治县',0),(2856,338,'阿勒泰市',0),(2857,338,'布尔津县',0),(2858,338,'富蕴县',0),(2859,338,'福海县',0),(2860,338,'哈巴河县',0),(2861,338,'青河县',0),(2862,338,'吉木乃县',0),(2867,352,'宛平县',1),(2868,352,'111111',5),(2869,345,'台北',2);
/*!40000 ALTER TABLE `sys_district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_hooks`
--

DROP TABLE IF EXISTS `sys_hooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型  1 视图 2 控制器',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  `status` tinyint(2) DEFAULT '1',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=65;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_hooks`
--

LOCK TABLES `sys_hooks` WRITE;
/*!40000 ALTER TABLE `sys_hooks` DISABLE KEYS */;
INSERT INTO `sys_hooks` VALUES (23,'login','第三方登录',1,'Oauthlogin',1,1499327900),(24,'sms','短信',1,'sms',1,1499487808),(26,'wxtemplatemsg','微信模板消息设置',1,'wxtemplatemsg',1,1500013768),(27,'orderCreateSuccess','订单创建成功',2,'wxtemplatemsg',1,1500025515),(29,'orderDeliverySuccess','订单发货成功',2,'wxtemplatemsg',1,1500448695),(30,'orderPaySuccess','订单付款成功',2,'wxtemplatemsg',1,1500448963),(31,'orderRefundApplyCreateSuccess','订单申请退款创建成功',2,'wxtemplatemsg',1,1500449386),(32,'orderRefundSuccess','订单退款成功',2,'wxtemplatemsg',1,1500450437),(33,'userWithdrawApplyCreateSuccess','会员提现申请创建成功',2,'wxtemplatemsg',1,1500450601),(34,'userLoginSuccess','用户登陆成功',2,'',1,1500619318),(35,'userAddSuccess','基础用户添加成功后',2,'',1,1500619587),(36,'memberRegisterSuccess','会员注册成功',2,'',1,1500619688),(37,'memberLevelSaveSuccess','会员等级保存成功',2,'',1,1500620008),(38,'memberWithdrawApplyCreateSuccess','会员提现申请创建成功',2,'wxtemplatemsg',1,1500620146),(39,'memberWithdrawAuditAgree','会员提现审核通过',2,'wxtemplatemsg',1,1500620297),(40,'goodsSaveSuccess','商品保存成功',2,'',1,1500620784),(41,'goodsSaveBefore','商品保存之前',2,'',1,1500620803),(42,'goodsDeleteBefore','商品删除之前',2,'',1,1500621085),(43,'goodsDeleteSuccess','商品删除成功',2,'',1,1500621109),(44,'goodsOnlineSuccess','商品上架成功',2,'',1,1500621131),(45,'goodsOfflineSuccess','商品下架成功',2,'',1,1500621142),(55,'goodsCategorySaveSuccess','商品分类保存成功',2,'',1,1500621379),(56,'goodsCategoryDeleteSuccess','商品分类删除成功',2,'',1,1500621397),(57,'goodsBrandSaveSuccess','商品品牌保存成功',2,'',1,1500621414),(58,'goodsBrandDeleteSuccess','商品品牌删除成功',2,'',1,1500621428),(59,'goodsGroupSaveSuccess','商品分组保存成功',2,'',1,1500621441),(60,'goodsGroupDeleteSuccess','商品分组删除成功',2,'',1,1500621455),(61,'goodsSpecSaveSuccess','商品规格保存成功',2,'',1,1500621470),(62,'goodsSpecDeleteSuccess','商品规格删除成功',2,'',1,1500621483),(63,'goodsAttributeSaveSuccess','商品类型保存成功',2,'',1,1500621495),(64,'goodsAttributeDeleteSuccess','商品类型删除成功',2,'',1,1500621506);
/*!40000 ALTER TABLE `sys_hooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_instance`
--

DROP TABLE IF EXISTS `sys_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_instance` (
  `instance_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `instance_name` varchar(50) NOT NULL DEFAULT '' COMMENT '实例名',
  `instance_typeid` int(11) NOT NULL DEFAULT '2' COMMENT '实例类型ID',
  `qrcode` varchar(255) NOT NULL DEFAULT '' COMMENT '实例二维码',
  `remark` text COMMENT '实例简介',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`instance_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1365 COMMENT='系统实例表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_instance`
--

LOCK TABLES `sys_instance` WRITE;
/*!40000 ALTER TABLE `sys_instance` DISABLE KEYS */;
INSERT INTO `sys_instance` VALUES (19,'Niushop开源商城',1,'','\'\'',1477541018);
/*!40000 ALTER TABLE `sys_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_instance_type`
--

DROP TABLE IF EXISTS `sys_instance_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_instance_type` (
  `instance_typeid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '实例类型ID',
  `type_name` varchar(50) NOT NULL DEFAULT '' COMMENT '实例类型名称',
  `type_module_array` text NOT NULL COMMENT '实例类型权限',
  `type_desc` text NOT NULL COMMENT '实例类型说明',
  `type_sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序号',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`instance_typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='实例类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_instance_type`
--

LOCK TABLES `sys_instance_type` WRITE;
/*!40000 ALTER TABLE `sys_instance_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_instance_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_module`
--

DROP TABLE IF EXISTS `sys_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_module` (
  `module_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模块ID',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT '模块标题',
  `module` varchar(255) NOT NULL DEFAULT 'admin' COMMENT '项目名',
  `controller` varchar(255) NOT NULL DEFAULT '' COMMENT '控制器名',
  `method` varchar(255) NOT NULL DEFAULT '' COMMENT '方法名',
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '上级模块ID',
  `level` int(11) NOT NULL DEFAULT '1' COMMENT '深度等级',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `is_menu` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是菜单',
  `is_dev` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `desc` text COMMENT '模块描述',
  `module_picture` varchar(255) NOT NULL DEFAULT '' COMMENT '模块图片',
  `icon_class` varchar(255) NOT NULL DEFAULT '' COMMENT '矢量图class',
  `is_control_auth` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否控制权限',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0',
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10087 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=606 COMMENT='系统模块表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_module`
--

LOCK TABLES `sys_module` WRITE;
/*!40000 ALTER TABLE `sys_module` DISABLE KEYS */;
INSERT INTO `sys_module` VALUES (120,'系统','admin','system','modulelist',0,1,'system/modulelist',1,0,999,'\'\'','','',1,1477454152,1477794717),(121,'模块列表','admin','system','modulelist',120,2,'system/modulelist',1,0,2,'\'\'','','',1,0,NULL),(122,'添加模块','admin','system','addmodule',121,3,'system/addmodule',0,0,1,'添加模块','','',1,0,1479976597),(123,'修改模块','admin','system','editmodule',121,3,'system/editmodule',0,0,2,'修改模块','','',1,0,1479976646),(126,'用户','admin','auth','userlist',0,1,'auth/userlist',1,0,10,'','','',1,0,1484650663),(127,'用户列表','admin','auth','userlist',126,2,'auth/userlist',1,0,0,NULL,'','',1,0,NULL),(128,'用户组列表','admin','auth','authgrouplist',126,2,'auth/authgrouplist',1,0,0,'用户组','','',1,0,1479976919),(129,'删除模块','admin','system','delmodule',121,3,'system/delmodule',0,0,0,'模块列表','','',1,1477618350,1479976723),(133,'添加用户组','admin','auth','addusergroup',128,3,'auth/addusergroup',0,0,2,'用户组','','',1,1477628544,1479977008),(137,'会员','admin','member','memberlist',0,1,'member/memberlist',1,0,4,'','','',1,1477994717,1493206725),(139,'相册管理','admin','system','albumlist',149,2,'system/albumlist',1,0,10,'相册管理','','',1,1478158094,1496819610),(144,'编辑用户','admin','auth','edituser',127,3,'auth/edituser',0,0,5,'用户','','',1,1478837447,1479976963),(145,'会员列表','admin','member','memberlist',137,2,'member/memberlist',1,0,1,'','','',1,1478846113,1478846203),(149,'商品','admin','goods','goodslist',0,1,'goods/goodslist',1,0,1,'商品模块','','',1,1479268148,1493973167),(150,'商品列表','admin','goods','goodslist',149,2,'goods/goodslist',1,0,1,'商品列表','','',0,1479268236,1491898725),(151,'商品发布','admin','goods','addgoods',149,2,'goods/addgoods',1,0,2,'商品发布','','',1,1479268307,NULL),(169,'图片管理','admin','system','albumpicturelist',139,3,'system/albumpicturelist',0,0,5,'sfgsdf','','',1,1479464708,1479976790),(170,'添加运费模板','admin','express','transportationadd',164,3,'express/transportationadd',0,0,1,'添加运费模板','','',1,1479700610,1484894376),(171,'商品标签','admin','goods','goodsgrouplist',149,2,'goods/goodsgrouplist',1,0,3,'商品分组','','',1,1479873298,1479960182),(172,'添加商品标签','admin','goods','addgoodsgroup',171,3,'goods/addgoodsgroup',0,0,6,'添加商品分组','','',1,1479873424,1479960243),(176,'运费模板修改','admin','express','transportationedit',164,3,'express/transportationedit',0,0,6,'sd','','',1,1480040625,NULL),(179,'营销','admin','promotion','coupontypelist',0,1,'promotion/coupontypelist',1,0,3,'优惠券类型列表','','',1,1480491652,1480491725),(180,'优惠券','admin','promotion','coupontypelist',179,2,'promotion/coupontypelist',1,0,1,'优惠券类型列表','','',1,1480491846,NULL),(184,'订单','admin','order','orderlist',0,1,'order/orderlist',1,0,2,'订单列表','','',1,1480563137,NULL),(185,'订单列表','admin','order','orderlist',184,2,'order/orderlist',1,0,1,'订单列表','','',1,1480563210,NULL),(186,'添加优惠券','admin','promotion','addcoupontype',180,3,'promotion/addcoupontype',1,0,2,'添加优惠券类型','','',1,1480573171,NULL),(187,'修改优惠券','admin','promotion','updatecoupontype',180,3,'promotion/updatecoupontype',1,0,3,'修改优惠券类型','','',1,1480904943,NULL),(189,'物流公司','admin','express','expresscompany',529,3,'express/expresscompany',0,0,60,'物流公司','','',1,1481254866,1484894344),(190,'订单详情','admin','order','orderdetail',185,3,'order/orderdetail',0,0,1,'订单详情','','',1,1481258173,NULL),(191,'添加物流公司','admin','express','addexpresscompany',529,3,'express/addexpresscompany',1,0,1,'添加物流公司','','',1,1481267828,NULL),(192,'物流公司修改','admin','express','updateexpresscompany',529,3,'express/updateexpresscompany',1,0,2,'物流公司修改排序','','',1,1481271808,NULL),(194,'退款详情','admin','order','orderrefunddetail',185,3,'order/orderrefunddetail',0,0,2,'退款详情','','',1,1481872074,NULL),(195,'赠品','admin','promotion','giftlist',179,2,'promotion/giftlist',0,0,3,'','','',1,1482113074,1494215988),(196,'添加赠品','admin','promotion','addgift',195,3,'promotion/addgift',1,0,0,'添加赠品','','',1,1482113664,1482117539),(197,'修改赠品','admin','promotion','updategift',195,3,'promotion/updategift',1,0,0,'修改赠品','','',1,1482113715,1482117558),(198,'满减送','admin','promotion','mansonglist',179,2,'promotion/mansonglist',1,0,4,'满减送','','',1,1482138580,1482138597),(199,'添加满减满送','admin','promotion','addmansong',198,3,'promotion/addmansong',1,0,0,'满减送','','',1,1482140311,NULL),(200,'编辑满减送','admin','promotion','updatemansong',198,3,'promotion/updatemansong',1,0,1,'编辑满减送','','',1,1482907059,NULL),(201,'限时折扣','admin','promotion','getdiscountlist',179,2,'promotion/getdiscountlist',1,0,5,'限时折扣','','',1,1483949283,NULL),(202,'添加限时折扣','admin','promotion','adddiscount',201,3,'promotion/adddiscount',1,0,0,'添加限时折扣','','',1,1483951104,NULL),(203,'修改限时折扣','admin','promotion','updatediscount',201,3,'promotion/updatediscount',1,0,1,'修改限时折扣','','',1,1483951151,1483958451),(210,'修改商品标签','admin','goods','updategoodsgroup',171,3,'goods/updategoodsgroup',0,0,2,'修改商品分组','','',1,1484120298,1484125917),(218,'设置','admin','config','webconfig',0,1,'config/webconfig',1,0,11,'店铺设置','','',1,1484617355,1493348177),(221,'支付配置','admin','config','paymentconfig',218,2,'config/paymentconfig',1,0,40,'支付配置','\'\'','',1,1484623427,1496820428),(334,'咨询管理','admin','saleservice','consultlist',149,2,'saleservice/consultlist',1,0,8,'咨询管理，未回复咨询，已回复咨询','','',1,1488875702,1496392553),(335,'微信','admin','wchat','config',0,1,'wchat/config',1,0,8,'微信','','',1,1488945338,1493015492),(336,'公众号管理','admin','wchat','config',335,2,'wchat/config',1,0,1,'公众号管理','','',1,1488945416,NULL),(339,'微信菜单管理','admin','wchat','menu',335,2,'wchat/menu',1,0,2,'微信菜单管理','','',1,1489046481,NULL),(340,'推广二维码管理','admin','wchat','weixinqrcodetemplate',335,2,'wchat/weixinqrcodetemplate',1,0,3,'推广二维码管理','','',1,1489046596,1490153341),(341,'回复设置','admin','wchat','replayconfig',335,2,'wchat/replayconfig',1,0,4,'','','',1,1489046662,NULL),(342,'消息素材管理','admin','wchat','materialmessage',335,2,'wchat/materialmessage',1,0,6,'','','',1,1489046731,NULL),(343,'分享内容设置','admin','wchat','shareconfig',335,2,'wchat/shareconfig',1,0,7,'','','',1,1489046804,NULL),(358,'自定义推广二维码','admin','wchat','qrcode',340,3,'wchat/qrcode',0,0,1,'自定义二维码','','',1,1490153257,1490153278),(359,'添加回复','admin','wchat','addorupdatekeyreplay',341,3,'wchat/addorupdatekeyreplay',1,0,1,'','','',1,1490236498,NULL),(360,'添加用户','admin','auth','adduser',127,3,'auth/adduser',0,0,1,'添加用户','','',1,1490236731,NULL),(361,'一键关注设置','admin','wchat','onekeysubscribe',335,2,'wchat/onekeysubscribe',0,0,6,'一键关注设置','','',1,1490318979,1496386363),(381,'广告位','admin','system','shopadvpositionlist',477,2,'system/shopadvpositionlist',1,0,9,'广告位设置','','',1,1490774263,1496320676),(382,'广告管理','admin','system','shopadvlist',381,3,'system/shopadvlist',0,0,0,'广告管理','','',1,1490785255,NULL),(383,'添加广告位','admin','system','addshopadvposition',381,3,'system/addshopadvposition',0,0,0,'添加广告位','','',1,1490835009,NULL),(387,'广告位编辑','admin','system','updateshopadvposition',381,3,'system/updateshopadvposition',1,0,0,'广告位编辑','','',1,1490851266,NULL),(388,'添加广告','admin','system','addshopadv',381,3,'system/addshopadv',0,0,0,'添加广告','','',1,1490854140,NULL),(389,'广告编辑','admin','system','updateshopadv',381,3,'system/updateshopadv',0,0,0,'','','',1,1490857038,NULL),(390,'促销版块','admin','system','goodsrecommendclass',10004,3,'system/goodsrecommendclass',0,0,10,'促销版块管理','','',1,1490861814,1496320694),(392,'首页楼层','admin','system','blocklist',10004,3,'system/blocklist',0,0,11,'','','',1,1490947012,1496320711),(394,'添加楼层','admin','system','addblock',10004,3,'system/addblock',0,0,0,'','','',1,1490948318,NULL),(395,'楼层编辑','admin','system','updateblock',10004,3,'system/updateblock',0,0,0,'','','',1,1490948388,1490952538),(398,'个人资料','admin','auth','userdetail',126,2,'auth/userdetail',1,0,0,'个人资料','','',0,1491029995,1494298490),(403,'销售排行','admin','account','shopgoodssalesrank',409,2,'account/shopgoodssalesrank',1,0,9,'商品销售排行','','',1,1491040090,1496819701),(405,'商品销售统计','admin','account','shopgoodsaccountlist',403,3,'account/shopgoodsaccountlist',0,0,6,'商品销售统计','','',1,1491042742,NULL),(409,'资产','admin','account','shopsalesaccount',0,1,'account/shopsalesaccount',1,0,7,'资产','','',1,1493281488,1493974412),(418,'网站设置','admin','config','webconfig',528,3,'config/webconfig',0,0,2,'','','',1,1492755047,NULL),(419,'商品分类','admin','goods','goodscategorylist',149,2,'goods/goodscategorylist',1,0,2,'商品分类','','',1,1492755701,NULL),(420,'添加商品分类','admin','goods','addgoodscategory',419,3,'goods/addgoodscategory',1,0,2,'添加商品分类','','',1,1492755811,1492755828),(421,'修改商品分类','admin','goods','updategoodscategory',419,3,'goods/updategoodscategory',1,0,1,'修改商品分类','','',1,1492755920,NULL),(422,'删除商品分类','admin','goods','deletegoodscategory',419,3,'goods/deletegoodscategory',1,0,2,'删除商品分类','','',1,1492755973,NULL),(423,'商品品牌','admin','goods','goodsbrandlist',149,2,'goods/goodsbrandlist',1,0,3,'商品品牌列表','','',1,1492756038,NULL),(424,'添加商品品牌','admin','goods','addgoodsbrand',423,3,'goods/addgoodsbrand',1,0,1,'添加商品品牌','','',1,1492756096,NULL),(425,'修改商品品牌','admin','goods','updategoodsbrand',423,3,'goods/updategoodsbrand',1,0,4,'修改商品品牌','','',1,1492756169,NULL),(427,'导航管理','admin','config','shopnavigationlist',10004,3,'config/shopnavigationlist',0,0,1,'导航','','',1,1492761752,1496320733),(428,'添加导航','admin','config','addshopnavigation',10004,3,'config/addshopnavigation',1,0,2,'添加导航','','',0,1492761909,NULL),(429,'修改导航','admin','config','updateshopnavigation',10004,3,'config/updateshopnavigation',1,0,3,'修改导航','','',0,1492762515,NULL),(430,'友情链接','admin','config','linklist',10004,3,'config/linklist',0,0,13,'友情链接','','',1,1492765269,1496320750),(431,'文章管理','admin','cms','articlelist',477,2,'cms/articlelist',1,0,18,'Cms系统','','',1,1492782512,1492782619),(432,'文章列表','admin','cms','articlelist',431,3,'cms/articlelist',0,0,1,'文章列表','','',1,1492782808,1492782837),(433,'文章分类','admin','cms','articleclasslist',431,3,'cms/articleclasslist',0,0,2,'文章列表','','',1,1492782934,1492782952),(434,'评论列表','admin','cms','commentarticle',431,2,'cms/commentarticle',0,0,3,'评论列表','','',1,1492782991,1497084797),(435,'搜索设置','admin','config','searchconfig',10004,3,'config/searchconfig',0,0,14,'搜索设置','','',1,1493187802,1496321601),(436,'添加友情链接','admin','config','addlink',10004,3,'config/addlink',0,0,1,'添加友情链接','','',1,1493190273,1493190306),(437,'编辑友情链接','admin','config','updatelink',10004,3,'config/updatelink',0,0,2,'编辑友情链接','','',1,1493192018,NULL),(438,'验证码设置','admin','config','codeconfig',528,3,'config/codeconfig',0,0,15,'验证码设置','','',1,1493192505,1493192978),(439,'通知系统','admin','config','notifyindex',218,2,'config/notifyindex',1,0,30,'messageConfig','','',1,1493194795,1496722814),(440,'帮助类型','admin','config','helpclass',530,3,'config/helpclass',0,0,10,'帮助类型','','',1,1493199934,1496320786),(441,'帮助内容','admin','config','helpdocument',530,3,'config/helpdocument',0,0,18,'帮助内容','','',1,1493201598,1496320803),(442,'添加帮助类型','admin','config','addhelpclass',530,3,'config/addhelpclass',0,0,1,'添加帮助类型','','',1,1493201673,NULL),(443,'修改帮助内容','admin','config','updatedocument',530,3,'config/updatedocument',0,0,2,'updateDocument.html','','',1,1493203409,NULL),(444,'添加帮助内容','admin','config','adddocument',530,3,'config/adddocument',0,0,2,'aaddDocument','','',1,1493205866,NULL),(445,'首页公告','admin','config','usernotice',10004,3,'config/usernotice',0,0,20,'userNotice','','',1,1493206256,1496321121),(446,'积分管理','admin','promotion','pointconfig',179,2,'promotion/pointconfig',1,0,1,'1','','',1,1493206530,1496894015),(447,'粉丝列表','admin','member','weixinfanslist',137,2,'member/weixinfanslist',1,0,2,'粉丝列表','','',1,1493278702,NULL),(450,'修改消息素材','admin','wchat','updatemedia',342,3,'wchat/updatemedia',1,0,1,'','','',1,1493282078,1493282297),(451,'添加消息素材','admin','wchat','addmedia',342,3,'wchat/addmedia',1,0,1,'','','',1,1493282371,NULL),(452,'添加文章','admin','cms','addarticle',431,3,'cms/addarticle',0,0,4,'','','',1,1493287571,1493289825),(454,'销售统计','admin','account','orderaccountcount',409,2,'account/orderaccountcount',0,0,6,'','','',1,1493289961,1493981704),(455,'修改文章','admin','cms','updatearticle',431,3,'cms/updatearticle',0,0,2,'','','',1,1493343780,NULL),(456,'第三方登录','admin','config','partylogin',218,2,'config/partylogin',1,0,20,'','','',1,1493347646,1496903436),(457,'销售明细','admin','account','orderrecordslist',454,3,'account/orderrecordslist',0,0,2,'','','',1,1493705080,1493705419),(459,'销售概况','admin','account','shopsalesaccount',409,2,'account/shopsalesaccount',1,0,1,'','','',1,1493776001,1493974321),(460,'热卖商品','admin','account','bestsellergoods',463,3,'account/bestsellergoods',0,0,1,'','','',1,1493867120,1493972190),(461,'同行热卖','admin','account','shopgoodsgroupsalecount',409,2,'account/shopgoodsgroupsalecount',1,0,4,'','','',1,1493946658,1493950999),(462,'运营报告','admin','account','shopreport',409,2,'account/shopreport',1,0,5,'','','',1,1493947412,NULL),(463,'商品分析','admin','account','shopgoodssaleslist',409,2,'account/shopgoodssaleslist',1,0,2,'','','',1,1493949799,NULL),(467,'首页','admin','index','index',0,1,'index/index',1,0,0,'','','',0,1494485612,1497071676),(469,'满额包邮','admin','promotion','fullshipping',179,2,'promotion/fullshipping',1,0,6,'满额包邮设置','','',1,1494928162,NULL),(471,'商家地址','admin','order','returnsetting',529,3,'order/returnsetting',0,0,70,'退货设置','','',1,1496215760,1496216046),(472,'添加或修改','admin','order','addreturn',529,3,'order/addreturn',1,0,1,'添加退货','','',1,1496215892,1496216067),(474,'首页公告','admin','config','updatenotice',10005,3,'config/updatenotice',0,0,15,'公告','','',1,1496291567,1496320766),(477,'网站','admin','config','shopnavigationlist',0,1,'config/shopnavigationlist',1,0,9,'导航管理','','',1,1496303515,1496821512),(478,'商品评价','admin','goods','goodscomment',149,2,'goods/goodscomment',1,0,8,'','','',1,1496310914,NULL),(479,'商品规格','admin','goods','goodsspeclist',149,2,'goods/goodsspeclist',1,0,6,'商品规格','','',1,1496314078,1496368479),(480,'添加商品规格','admin','goods','addgoodsspec',479,3,'goods/addgoodsspec',0,0,1,'','','',1,1496368895,NULL),(481,'修改商品规格','admin','goods','updategoodsspec',479,3,'goods/updategoodsspec',0,0,0,'','','',1,1496386955,NULL),(482,'商品类型','admin','goods','attributelist',149,2,'goods/attributelist',1,0,7,'','','',1,1496392434,1496392497),(484,'添加商品类型','admin','goods','addattributeservice',482,3,'goods/addattributeservice',0,0,0,'','','',1,1496395497,1496457873),(485,'修改商品类型','admin','goods','updategoodsattribute',482,3,'goods/updategoodsattribute',0,0,0,'','','',1,1496396084,NULL),(486,'地区管理','admin','config','areamanagement',529,3,'config/areamanagement',0,0,50,'','','',1,1496452390,NULL),(487,'模板编辑','admin','express','expresstemplate',529,3,'express/expresstemplate',0,0,0,'','','',1,1496459993,NULL),(488,'会员等级','admin','member','memberlevellist',137,2,'member/memberlevellist',1,0,3,'会员等级','','',1,1496462360,NULL),(489,'添加等级','admin','member','addmemberlevel',488,3,'member/addmemberlevel',1,0,1,'添加等级','','',1,1496483895,NULL),(490,'修改等级','admin','member','updatememberlevel',488,3,'member/updatememberlevel',1,0,0,'修改等级','','',1,1496483933,1496485692),(491,'专题列表','admin','cms','topiclist',477,2,'cms/topiclist',1,0,19,'专题列表','','',1,1496630179,1496632713),(492,'添加专题','admin','cms','addtopic',491,3,'cms/addtopic',1,0,1,'添加专题','','',1,1496630640,1496632753),(493,'修改专题','admin','cms','updatetopic',491,3,'cms/updatetopic',1,0,2,'修改专题','','',1,1496630696,1496632781),(494,'购物设置','admin','config','shopset',528,3,'config/shopset',0,0,44,'购物设置','','',1,1496716845,1496717062),(495,'邮件设置','admin','config','messageconfig',439,3,'config/messageconfig',0,0,0,'','','',1,1496731597,NULL),(496,'短信设置','admin','config','messageconfig',439,3,'config/messageconfig',0,0,0,'','','',1,1496731636,NULL),(497,'会员积分明细','admin','member','pointdetail',145,3,'member/pointdetail',0,0,0,'','','',1,1496739472,NULL),(498,'会员余额明细','admin','member','accountdetail',145,3,'member/accountdetail',0,0,0,'','','',1,1496744512,NULL),(499,'seo设置','admin','config','seoconfig',528,3,'config/seoconfig',0,0,2,'seo设置','','',1,1496750885,1496751054),(501,'微信支付','admin','config','payconfig',221,3,'config/payconfig',1,0,1,'微信支付','','',1,1496821450,NULL),(502,'支付宝支付','admin','config','payaliconfig',221,3,'config/payaliconfig',1,0,2,'支付宝支付','','',1,1496821780,NULL),(503,'会员提现设置','admin','config','memberwithdrawsetting',218,2,'config/memberwithdrawsetting',1,0,45,'会员提现设置','','',1,1496821934,1496822222),(504,'会员提现','admin','member','usercommissionwithdrawlist',137,2,'member/usercommissionwithdrawlist',1,0,4,'会员提现','','',1,1496822171,1496822242),(506,'模板管理','admin','config','notifytemplate',439,3,'config/notifytemplate',0,0,0,'','','',1,1496886539,1496974268),(507,'积分设置','admin','promotion','integral',446,3,'promotion/integral',1,0,0,'积分奖励','','',1,1496896166,NULL),(508,'积分奖励','admin','promotion','integral',446,3,'promotion/integral',1,0,0,'积分奖励','','',1,1496896201,NULL),(509,'积分管理','admin','member','pointlist',137,2,'member/pointlist',1,0,5,'','','',1,1496906007,1496906222),(510,'余额管理','admin','member','accountlist',137,2,'member/accountlist',1,0,6,'','','',1,1496906142,1496906242),(512,'微信登录','admin','config','loginconfig',456,3,'config/loginconfig',1,0,2,'微信登录','','',1,1496907149,1496907569),(513,'qq登录','admin','config','loginconfig',456,3,'config/loginconfig',1,0,1,'qq登录','','',1,1496907238,1496907552),(515,'欢迎页','admin','index','index',467,2,'index/index',1,0,0,'欢迎页','','',0,1496979062,NULL),(517,'商品回收站','admin','goods','recycle',149,2,'goods/recyclelist',1,0,11,'','','',1,1497445996,1497445996),(518,'回收站列表','admin','goods','recyclelist',517,3,'goods/recyclelist',0,0,0,'','','',1,1497445996,1497445996),(519,'货到付款地区管理','admin','config','distributionareamanagement',529,3,'config/distributionareamanagement',0,0,24,'','','',1,1497706614,1497706614),(520,'自提点管理','admin','shop','pickuppointlist',529,3,'shop/pickuppointlist',0,0,80,'','','',1,1498135759,1498135759),(521,'添加自提点','admin','shop','addpickuppoint',529,3,'shop/addpickuppoint',0,0,0,'','','',1,1498135759,1498135759),(522,'修改自提点','admin','shop','updatepickuppoint',529,3,'shop/updatepickuppoint',0,0,0,'','','',1,1498135759,1498135759),(523,'物流跟踪设置','admin','config','expressmessage',528,3,'config/expressmessage',0,0,47,'','','',1,1498198990,1498198990),(524,'在线更新','admin','upgrade','onlineupdate',10000,2,'upgrade/onlineupdate',1,0,30,'','','',1,1498733102,1498733102),(525,'运费模板列表','admin','express','freighttemplatelist',529,3,'express/freighttemplatelist',0,0,0,'','','',1,1498733102,1498733102),(526,'编辑运费模板','admin','express','freighttemplateedit',529,3,'express/freighttemplateedit',0,0,2,'','','',1,1498733102,1498733102),(527,'注册与访问','admin','config','registerAndVisit',218,2,'config/registerandvisit',1,0,10,'','','',1,1498874511,1498874511),(528,'基础设置','admin','config','webconfig',218,2,'config/webconfig',1,0,0,'','','',1,1499343015,1499343015),(529,'物流配送','admin','express','expresscompany',218,2,'express/expresscompany',1,0,60,'','','',1,1499343015,1499343015),(530,'站点帮助','admin','config','helpclass',477,2,'config/helpdocument',1,0,17,'','','',1,1499343015,1499343015),(10000,'X360云','admin','upgrade','onlineupdate',0,1,'upgrade/onlineupdate',0,0,100,'','','',1,1499343016,1544154350),(10001,'供货商','admin','member','supplierlist',149,2,'member/supplierlist',1,0,7,'','','',1,1499853120,1499853120),(10002,'添加供货商','admin','member','addsupplier',10001,3,'member/addsupplier',1,0,0,'','','',1,1499853120,1499853120),(10003,'修改供货商','admin','member','updatesupplier',10001,3,'member/updatesupplier',1,0,1,'','','',1,1499853120,1499853120),(10004,'电脑端','admin','config','shopnavigationlist',477,2,'config/shopnavigationlist',1,0,0,'','','',1,1500608761,1500608761),(10005,'手机端','admin','config','fixedtemplate',477,2,'config/fixedtemplate',1,0,1,'','','',1,1500608765,1500608765),(10006,'促销版块','admin','system','goodsrecommendclassmobile',10005,3,'system/goodsrecommendclassmobile',0,0,20,'','','',1,1500608766,1500608766),(10007,'授权信息','admin','upgrade','devolutioninfo',10000,2,'upgrade/devolutioninfo',1,0,40,'','','',1,1500608776,1500608776),(10008,'扩展','admin','extend','addonslist',0,1,'extend/addonslist',1,0,50,NULL,'','',1,1500632812,1500632818),(10009,'插件管理','admin','extend','addonslist',10008,2,'extend/addonslist',1,0,0,'','','',1,1500633040,NULL),(10010,'钩子管理','admin','extend','hookslist',10008,2,'extend/hookslist',1,0,1,'','','',1,1500633096,NULL),(10011,'插件列表','admin','extend','pluginlist',10008,2,'extend/pluginlist',0,0,3,'','','',1,1500633141,NULL),(10012,'添加钩子','admin','extend','addhooks',10010,3,'extend/addhooks',1,0,0,'','','',1,1500633268,NULL),(10013,'修改钩子','admin','extend','updatehooks',10010,3,'extend/updatehooks',1,0,0,'','','',1,1500633326,NULL),(10014,'插件配置','admin','extend','pluginconfig',10008,2,'extend/pluginconfig',0,0,4,'','','',1,1500633368,NULL),(10015,'插件配置','admin','extend','addonsconfig',10008,2,'extend/addonsconfig',0,0,5,'','','',1,1500633398,NULL),(10016,'自提点运费','admin','shop','pickuppointfreight',529,3,'shop/pickuppointfreight',1,0,4,'','','',1,1501809931,1501809931),(10017,'版权设置','admin','config','copyrightinfo',528,3,'config/copyrightinfo',0,0,8,'','','',1,1501810329,1501810329),(10018,'手机模板','admin','config','waptemplate',10005,3,'config/waptemplate',0,0,3,'','','',1,1501923272,1501923272),(10019,'客服设置','admin','config','customservice',218,2,'config/customservice',1,0,70,'','','',1,1502539867,1502539867),(10021,'固定模板','admin','config','fixedtemplate',10005,3,'config/fixedtemplate',1,0,1,'','','',1,1502539867,1502539867),(10022,'附件上传','admin','config','uploadtype',218,2,'config/uploadtype',1,0,10,NULL,'','',1,0,0),(10023,'商品楼层','admin','system','goodscategoryblock',477,2,'system/goodscategoryblock',1,0,10,NULL,'','',1,0,0),(10024,'模板','admin','config','pctemplate',10004,3,'config/pctemplate',1,0,1,'','','',1,1504697788,1504697788),(10075,'商家通知','admin','config','businessnotifytemplate',439,3,'config/businessnotifytemplate',0,0,0,'','','',1,1505870490,0),(10076,'原路退款配置','admin','config','originalroadrefundsetting',218,2,'config/originalroadrefundsetting',1,0,41,'','','',1,1507881605,0),(10077,'数据库管理','admin','dbdatabase','databaselist',218,2,'dbdatabase/databaselist',1,0,0,'','','',1,1506132536,0),(10078,'数据库恢复','admin','dbdatabase','importdatalist',10077,3,'dbdatabase/importdatalist',0,0,0,'','','',1,1506132758,0),(10079,'SQL执行与导入','admin','dbdatabase','sqlfilequery',10077,3,'dbdatabase/sqlfilequery',0,0,0,'','','',1,1506132811,0),(10080,'添加首页公告','admin','config','addhomenotice',10004,3,'config/addhomenotice',0,0,0,'','','',1,1508152805,0),(10081,'公告编辑','admin','config','updatehomenotice',10004,3,'config/updatehomenotice',0,0,0,'','','',1,1508208576,0),(10082,'图片设置','admin','config','pictureuploadsetting',218,2,'config/pictureuploadsetting',1,0,4,'','','',1,1508152805,0),(10083,'系统更新','admin','upgrade','upgradePatch',524,3,'upgrade/upgradepatch',0,0,0,'','','',1,1508572839,0),(10084,'校360设置','admin','config','x360Config',528,3,'config/x360Config',0,0,6,NULL,'','',1,1492755047,0),(10085,'界面设置','admin','config','uiConfig',528,3,'config/uiConfig',0,0,6,NULL,'','',1,1492755047,0),(10086,'模板消息设置','admin','wchat','addonmenu',335,2,'wchat/menu_wchat?addons=wxtemplatemsg',1,0,7,'模板消息插件菜单','','',1,1544154259,0);
/*!40000 ALTER TABLE `sys_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shopid` int(11) NOT NULL COMMENT '店铺ID（单店版为0）',
  `notice_message` varchar(255) DEFAULT '' COMMENT '公告内容',
  `is_enable` tinyint(1) DEFAULT '0' COMMENT '是否启用（0：隐藏，1：显示）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='网站公告';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (7,0,'今天大促销，所有商品半价',0);
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice_template`
--

DROP TABLE IF EXISTS `sys_notice_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_notice_template` (
  `template_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '模板id',
  `template_type` varchar(50) NOT NULL DEFAULT '' COMMENT '模板类型',
  `instance_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `template_code` varchar(50) NOT NULL DEFAULT '' COMMENT '模板编号',
  `template_title` varchar(50) NOT NULL DEFAULT '' COMMENT '模板编号',
  `template_content` text NOT NULL COMMENT '模板名称',
  `sign_name` varchar(50) NOT NULL DEFAULT '' COMMENT '签名',
  `is_enable` int(11) NOT NULL DEFAULT '0' COMMENT '是否开启',
  `modify_time` int(11) DEFAULT '0' COMMENT '更新时间',
  `notify_type` varchar(255) NOT NULL DEFAULT '' COMMENT '通知人类型',
  `notification_mode` text NOT NULL COMMENT '通知方式',
  PRIMARY KEY (`template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1170 COMMENT='通知模版设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice_template`
--

LOCK TABLES `sys_notice_template` WRITE;
/*!40000 ALTER TABLE `sys_notice_template` DISABLE KEYS */;
INSERT INTO `sys_notice_template` VALUES (1,'email',0,'after_register','','','',0,1544239842,'user',''),(2,'email',0,'register_validate','','','',0,1544239842,'user',''),(3,'email',0,'recharge_success','','','',0,1544239842,'user',''),(4,'email',0,'confirm_order','','','',0,1544239842,'user',''),(5,'email',0,'pay_success','','','',0,1544239842,'user',''),(6,'email',0,'create_order','下单成功','<p>{商场名称}</p><p>{用户名称}</p><p>{主订单号}</p><p>{订单金额}</p><p>{商品金额}</p>','',1,1544239842,'user',''),(7,'email',0,'order_deliver','','','',0,1544239842,'user',''),(8,'email',0,'forgot_password','','','',0,1544239842,'user',''),(9,'email',0,'bind_email','','','',0,1544239842,'user','');
/*!40000 ALTER TABLE `sys_notice_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice_template_item`
--

DROP TABLE IF EXISTS `sys_notice_template_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_notice_template_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(50) NOT NULL DEFAULT '' COMMENT '项名称',
  `show_name` varchar(50) NOT NULL DEFAULT '' COMMENT '显示名称',
  `replace_name` varchar(50) NOT NULL DEFAULT '' COMMENT '替换字段名字',
  `type_ids` varchar(255) NOT NULL COMMENT '关联type类型',
  `order` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1820 COMMENT='通知模板项';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice_template_item`
--

LOCK TABLES `sys_notice_template_item` WRITE;
/*!40000 ALTER TABLE `sys_notice_template_item` DISABLE KEYS */;
INSERT INTO `sys_notice_template_item` VALUES (1,'商场名称','{商场名称}','shopname','after_register,recharge_success,create_order,pay_success,confirm_order,order_deliver,order_remind,refund_order',0),(2,'用户名称','{用户名称}','username','after_register,recharge_success,create_order,pay_success,confirm_order,order_deliver,bind_mobile,bind_email,order_remind,refund_order',1),(5,'商品名称','{商品名称}','goodsname','order_deliver',4),(6,'商品规格','{商品规格}','goodssku','order_deliver',5),(7,'主订单号','{主订单号}','orderno','create_order,pay_success,confirm_order,order_deliver,order_remind,refund_order',6),(8,'订单金额','{订单金额}','ordermoney','create_order,pay_success,confirm_order,order_deliver,order_remind,refund_order',7),(9,'商品金额','{商品金额}','goodsmoney','create_order,pay_success,order_deliver',8),(10,'验证码','{验证码}','number','register_validate,forgot_password,bind_mobile,bind_email',9),(11,'充值金额','{充值金额}','rechargemoney','recharge_success',0),(12,'物流公司','{物流公司}','expresscompany','order_deliver',0),(13,'快递编号','{快递编号}','expressno','order_deliver',0);
/*!40000 ALTER TABLE `sys_notice_template_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice_template_type`
--

DROP TABLE IF EXISTS `sys_notice_template_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_notice_template_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(50) NOT NULL DEFAULT '' COMMENT '模板名称',
  `template_code` varchar(50) NOT NULL DEFAULT '' COMMENT '模板编号',
  `template_type` varchar(50) NOT NULL DEFAULT '' COMMENT '模板类型',
  `notify_type` varchar(255) NOT NULL DEFAULT '' COMMENT '通知人类型',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2340 COMMENT='通知模板类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice_template_type`
--

LOCK TABLES `sys_notice_template_type` WRITE;
/*!40000 ALTER TABLE `sys_notice_template_type` DISABLE KEYS */;
INSERT INTO `sys_notice_template_type` VALUES (1,'注册成功','after_register','all','user'),(2,'注册验证','register_validate','all','user'),(3,'充值成功','recharge_success','all','user'),(4,'确认订单','confirm_order','all','user'),(5,'付款成功','pay_success','all','user'),(6,'下单成功','create_order','all','user'),(7,'订单发货','order_deliver','all','user'),(8,'找回密码','forgot_password','all','user'),(9,'手机绑定','bind_mobile','sms','user'),(10,'邮箱绑定','bind_email','email','user'),(11,'退款订单','refund_order','all','business'),(12,'订单提醒','order_remind','all','business'),(13,'充值成功','recharge_success','all','business');
/*!40000 ALTER TABLE `sys_notice_template_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_province`
--

DROP TABLE IF EXISTS `sys_province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_province` (
  `province_id` int(11) NOT NULL AUTO_INCREMENT,
  `area_id` tinyint(4) NOT NULL DEFAULT '0',
  `province_name` varchar(255) NOT NULL DEFAULT '',
  `sort` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`province_id`),
  KEY `IDX_g_province_ProvinceName` (`province_name`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=481;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_province`
--

LOCK TABLES `sys_province` WRITE;
/*!40000 ALTER TABLE `sys_province` DISABLE KEYS */;
INSERT INTO `sys_province` VALUES (1,2,'北京市',1),(2,2,'天津市',0),(3,2,'河北省',0),(4,2,'山西省',0),(5,2,'内蒙古自治区',0),(6,5,'辽宁省',0),(7,5,'吉林省',0),(8,5,'黑龙江省',0),(9,1,'上海市',0),(10,1,'江苏省',0),(11,1,'浙江省',0),(12,1,'安徽省',0),(13,3,'福建省',0),(14,1,'江西省',0),(15,2,'山东省',0),(16,4,'河南省',0),(17,4,'湖北省',0),(18,4,'湖南省',0),(19,3,'广东省',0),(20,3,'广西壮族自治区',0),(21,3,'海南省',0),(22,7,'重庆市',0),(23,7,'四川省',0),(24,7,'贵州省',0),(25,7,'云南省',0),(26,7,'西藏自治区',0),(27,6,'陕西省',0),(28,6,'甘肃省',0),(29,6,'青海省',0),(30,6,'宁夏回族自治区',0),(31,6,'新疆维吾尔自治区',0),(32,8,'香港特别行政区',0),(33,8,'澳门特别行政区',0),(34,8,'台湾省',0);
/*!40000 ALTER TABLE `sys_province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_url_route`
--

DROP TABLE IF EXISTS `sys_url_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_url_route` (
  `routeid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rule` varchar(255) NOT NULL DEFAULT '' COMMENT '伪静态路由规则',
  `route` varchar(255) NOT NULL DEFAULT '' COMMENT '路由地址',
  `is_open` int(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `is_system` int(1) NOT NULL DEFAULT '0' COMMENT '是否是系统默认',
  `route_model` tinyint(4) NOT NULL DEFAULT '1' COMMENT '配置伪静态使用的模块1.shop2.wap3.admin',
  `remark` text NOT NULL COMMENT '简介',
  PRIMARY KEY (`routeid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2340 COMMENT='系统伪静态路由';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_url_route`
--

LOCK TABLES `sys_url_route` WRITE;
/*!40000 ALTER TABLE `sys_url_route` DISABLE KEYS */;
INSERT INTO `sys_url_route` VALUES (1,'goods','shop/goods/goodsinfo',1,1,1,''),(2,'list','shop/goods/goodslist',1,1,1,''),(3,'brands','shop/goods/brandlist',1,1,1,''),(4,'integralcenter','shop/goods/integralcenter',1,1,1,''),(5,'discount','shop/index/discount',1,1,1,''),(7,'membercenter','shop/member/index',1,0,1,''),(8,'article','shop/cms/articleclassinfo',1,1,1,'文章详情');
/*!40000 ALTER TABLE `sys_url_route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `instance_id` int(11) NOT NULL DEFAULT '0' COMMENT '实例信息',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `group_id` int(11) NOT NULL DEFAULT '0' COMMENT '权限组id',
  `user_password` varchar(255) NOT NULL DEFAULT '' COMMENT '用户密码（MD5）',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态  用户状态默认为1',
  `user_headimg` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `is_system` int(1) NOT NULL DEFAULT '0' COMMENT '是否是系统后台用户 0 不是 1 是',
  `is_member` int(11) NOT NULL DEFAULT '0' COMMENT '是否是前台会员',
  `salt` varchar(16) NOT NULL,
  `user_tel` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `user_tel_bind` int(1) NOT NULL DEFAULT '0' COMMENT '手机号是否绑定 0 未绑定 1 绑定 ',
  `user_qq` varchar(255) DEFAULT '' COMMENT 'qq号',
  `qq_openid` varchar(255) NOT NULL DEFAULT '' COMMENT 'qq互联id',
  `qq_info` varchar(2000) NOT NULL DEFAULT '' COMMENT 'qq账号相关信息',
  `user_email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `user_email_bind` int(1) NOT NULL DEFAULT '0' COMMENT '是否邮箱绑定',
  `wx_openid` varchar(255) DEFAULT NULL COMMENT '微信用户openid',
  `wx_is_sub` int(1) NOT NULL DEFAULT '0' COMMENT '微信用户是否关注',
  `wx_info` varchar(2000) DEFAULT NULL COMMENT '微信用户信息',
  `other_info` varchar(255) DEFAULT NULL COMMENT '附加信息',
  `current_login_ip` varchar(255) DEFAULT NULL COMMENT '当前登录ip',
  `current_login_type` int(11) DEFAULT NULL COMMENT '当前登录的操作终端类型',
  `last_login_ip` varchar(255) DEFAULT NULL COMMENT '上次登录ip',
  `last_login_type` int(11) DEFAULT NULL COMMENT '上次登录的操作终端类型',
  `login_num` int(11) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `real_name` varchar(50) DEFAULT '' COMMENT '真实姓名',
  `sex` smallint(6) DEFAULT '0' COMMENT '性别 0保密 1男 2女',
  `location` varchar(255) DEFAULT '' COMMENT '所在地',
  `nick_name` varchar(50) DEFAULT '斯玛特加盟商' COMMENT '用户昵称',
  `wx_unionid` varchar(255) NOT NULL DEFAULT '' COMMENT '微信unionid',
  `qrcode_template_id` int(11) NOT NULL DEFAULT '0' COMMENT '模板id',
  `wx_sub_time` int(11) DEFAULT '0' COMMENT '微信用户关注时间',
  `wx_notsub_time` int(11) DEFAULT '0' COMMENT '微信用户取消关注时间',
  `reg_time` int(11) DEFAULT '0' COMMENT '注册时间',
  `current_login_time` int(11) DEFAULT '0' COMMENT '当前登录时间',
  `last_login_time` int(11) DEFAULT '0' COMMENT '上次登录时间',
  `birthday` int(11) DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `IDX_sys_user_user_email` (`user_email`),
  KEY `IDX_sys_user_user_name` (`user_name`),
  KEY `IDX_sys_user_user_password` (`user_password`),
  KEY `IDX_sys_user_user_tel` (`user_tel`),
  KEY `IDX_sys_user_wx_openid` (`wx_openid`),
  KEY `IDX_sys_user_wx_unionid` (`wx_unionid`)
) ENGINE=InnoDB AUTO_INCREMENT=3487 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=372 COMMENT='系统用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,0,'admin',0,'06da0a7569ddc5f1eee248517620d2e0',1,'',1,1,'gZtlb5','17727750995',0,'','','','',0,NULL,0,NULL,NULL,'116.7.67.49',1,'116.7.67.49',1,44,'',0,'','360用户','',0,0,0,0,1544517610,1544513866,0),(3073,0,'xushuqing',0,'06da0a7569ddc5f1eee248517620d2e0',1,'upload/avator/1544079779.jpg',0,1,'gZtlb5','17727750995',0,'1014256196','','','1014256196@qq.com',0,'',0,'','','116.7.67.49',1,'116.7.67.49',1,35,'徐舒青',1,'广东深圳','xusq','',1,0,0,1544000816,1544518380,1544513587,719337600),(3074,0,'zhouhaiyun',0,'06da0a7569ddc5f1eee248517620d2e0',1,'',0,1,'gZtlb5','17727750995',0,'','','','',0,'',0,'','','116.7.67.82',1,'116.7.67.82',1,4,'',0,'','zhouhaiyun','',0,0,0,1544001195,1544077602,1544059735,0),(3075,0,'xusq',0,'06da0a7569ddc5f1eee248517620d2e0',1,'',1,1,'gZtlb5','17727750995',0,'','','','',0,'',0,'','','116.7.67.82',1,'116.7.67.82',1,2,'',0,'','xusq','',0,0,0,1544003427,1544066678,1544066437,0),(3078,0,'zhy',0,'06da0a7569ddc5f1eee248517620d2e0',1,'',1,1,'gZtlb5','17727750995',0,'','','','',0,'',0,'','',NULL,NULL,NULL,NULL,0,'',0,'','zhy','',0,0,0,1544005031,0,0,0),(3215,0,'shizhi',0,'06da0a7569ddc5f1eee248517620d2e0',1,'',1,1,'gZtlb5','13911874167',1,'','','','',0,NULL,0,NULL,NULL,'116.7.67.49',1,'14.155.89.203',1,36,'',0,'','斯玛特加盟商','',0,0,0,0,1544491106,1544239610,0),(3348,0,'15961616718',0,'4495e202fcd8e4d5f408cd50e7efeacd',1,'',0,1,'NHLar8','15961616718',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','任卉洁','',0,0,0,0,0,0,0),(3349,0,'14752701578',0,'6ef522a5f941ec21c7bd0394c7113a4c',1,'',0,1,'z2YIWQ','14752701578',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','斯玛特扬州广陵区中集文昌中心','',0,0,0,0,0,0,0),(3350,0,'15105179669',0,'8ebc269f95c2157995bdf1ae1ddd9a2a',1,'',0,1,'78Q68y','15105179669',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','江苏南京建邺奥体中心','',0,0,0,0,0,0,0),(3351,0,'13502290169',0,'1e3c089763976770c22a83319b9e1df9',1,'',0,1,'bPHiCM','13502290169',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','广东惠州四季商业中心','',0,0,0,0,0,0,0),(3352,0,'13830488185',0,'7742b6bdf32f3b2ddab7865263d5f255',1,'',0,1,'GROtLg','13830488185',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','甘肃庆阳西峰中心','',0,0,0,0,0,0,0),(3353,0,'15770029666',0,'0ab683a03b537c300860f5860aceae67',1,'',0,1,'hsI7J5','15770029666',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','阿拉尔管理员','',0,0,0,0,0,0,0),(3354,0,'19955909979',0,'0054b75ae3bf6d2748d0036e4c195ef0',1,'',0,1,'WBIuTe','19955909979',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','吴文勤','',0,0,0,0,0,0,0),(3355,0,'18204101555',0,'68d7611087bac4bfa78139f1691c093e',1,'',0,1,'XtuW1y','18204101555',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','辽宁铁岭银州中心','',0,0,0,0,0,0,0),(3356,0,'18684225137',0,'cd5a21c31f3ccb046e78019383254a1b',1,'',0,1,'9Hyvhm','18684225137',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','吉林四平公主岭岭西紫金星城中心','',0,0,0,0,0,0,0),(3357,0,'18766888388',0,'ae7093f9af5b9f6891c027ff03faa058',1,'',0,1,'pg8k8Z','18766888388',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','山东曲阜星光天地中心','',0,0,0,0,0,0,0),(3358,0,'18553438619',0,'6e67fee909aeb26c9ced438bec5f622b',1,'',0,1,'Mly0iq','18553438619',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','山东菏泽曹县中心','',0,0,0,0,0,0,0),(3359,0,'18300571199',0,'92c0d526571cc4106f74d302947d10f0',1,'',0,1,'gGj2XQ','18300571199',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','山东菏泽定陶中心','',0,0,0,0,0,0,0),(3360,0,'15185170025',0,'beb515b04d631081ee30b61afd726645',1,'',0,1,'9veKq6','15185170025',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','贵州贵阳小河缤纷中心','',0,0,0,0,0,0,0),(3361,0,'13885196699',0,'51fd8631dccab542816f17dfbe2250db',1,'',0,1,'TNKQkG','13885196699',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','贵州贵阳云岩586中心','',0,0,0,0,0,0,0),(3362,0,'18198516557',0,'191a5dcd7db4c0f83e2dd0c1a032ca4e',1,'',0,1,'YE651c','18198516557',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','贵阳金融城恒大中央公园中心','',0,0,0,0,0,0,0),(3363,0,'13502179678',0,'c5564f0dafefc3bca638bef8805d8253',1,'',0,1,'Jsand0','13502179678',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','天津南开天拖美坪园中心','',0,0,0,0,0,0,0),(3364,0,'13419575866',0,'94f6da738735a904a7ad4582fde0be4f',1,'',0,1,'wiVTLS','13419575866',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','张菁','',0,0,0,0,0,0,0),(3365,0,'18971637736',0,'a42721c421f5a899cc74eff1251927a0',1,'',0,1,'tPkUHO','18971637736',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','湖北武汉洪山泛悦坊都会中心','',0,0,0,0,0,0,0),(3366,0,'13709719041',0,'10c399e9b917b7f1f1fcbde183a2d08d',1,'',0,1,'SQ0wAy','13709719041',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','青海西宁城西万达中心','',0,0,0,0,0,0,0),(3367,0,'15829349211',0,'8084cb59e8175e54155dd18549a7c7ed',1,'',0,1,'s0QDcX','15829349211',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','Kitty','',0,0,0,0,0,0,0),(3368,0,'18603196858',0,'ba73dbed01f57dad9ea1d6c8f8722120',1,'',0,1,'THa4jR','18603196858',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','河北邢台隆尧中心','',0,0,0,0,0,0,0),(3369,0,'18600404406',0,'ce54705272c2ac9cbd786fc3a8dd7913',1,'',0,1,'mN65vs','18600404406',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','河北保定满城惠友中心','',0,0,0,0,0,0,0),(3370,0,'18975068908',0,'36f55c433c2d5dc1c17327414d51767d',1,'',0,1,'2SH5VV','18975068908',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','湖南长沙雨花丰升德润中心','',0,0,0,0,0,0,0),(3371,0,'13666770333',0,'d336fb2cc6d9bc38bb97cf7b320ec37e',1,'',0,1,'xlNkL6','13666770333',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','浙江嘉兴桐乡吾悦广场中心','',0,0,0,0,0,0,0),(3372,0,'18268485166',0,'265319d0bd2ac813c2da99ed104bfb58',1,'',0,1,'jkUdwe','18268485166',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','浙江嘉兴嘉善中心','',0,0,0,0,0,0,0),(3373,0,'13858998321',0,'6dbc6025b68bc1cce854abd5618ad182',1,'',0,1,'HdCDAU','13858998321',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','浙江金华兰溪溪西','',0,0,0,0,0,0,0),(3374,0,'13566616199',0,'af47b4600aeb45ae623ab6db0fb88277',1,'',0,1,'qcIMpk','13566616199',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','浙江宁波慈溪中心','',0,0,0,0,0,0,0),(3375,0,'13567206171',0,'e6b78c0004f202e95b1285fafea68c59',1,'',0,1,'6L3c3z','13567206171',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','浙江绍兴柯桥中心','',0,0,0,0,0,0,0),(3376,0,'18782311777',0,'ceaafc11586efce0b218a514e3599b21',1,'',0,1,'2ZRKAa','18782311777',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','四川成都简阳万安山峰中心','',0,0,0,0,0,0,0),(3377,0,'13733811157',0,'48cd9a8a32031b407f34e7ef496f01b3',1,'',0,1,'24gfoI','13733811157',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','河南郑州郑东新区中心','',0,0,0,0,0,0,0),(3378,0,'15160031121',0,'73bcd3b95753987b7f6c24e3a10b5281',1,'',0,1,'WuwmtC','15160031121',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','河南安阳景诗雅苑中心 ','',0,0,0,0,0,0,0),(3379,0,'13703746655',0,'c26c8181f0e2b99545ab35221c2fe5b7',1,'',0,1,'kPpbVN','13703746655',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','马培军','',0,0,0,0,0,0,0),(3380,0,'15577717711',0,'6420032563985dd46b4241300cfe2e58',1,'',0,1,'ydaU0w','15577717711',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','韩老师','',0,0,0,0,0,0,0),(3381,0,'18679999299',0,'6bea311c127adda14c599209d9ab2775',1,'',0,1,'VQ7H00','18679999299',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','江西萍乡莲花富丽花苑中心','',0,0,0,0,0,0,0),(3382,0,'18645810908',0,'f1075684688682fdddbe14a6c5550ff5',1,'',0,1,'aMjnoD','18645810908',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','重庆渝中中心','',0,0,0,0,0,0,0),(3383,0,'15778129400',0,'2452f13c7f700672eff7403f7eb3ae30',1,'',0,1,'LEWcCG','15778129400',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','广西南宁江南中心','',0,0,0,0,0,0,0),(3384,0,'13569451007',0,'90f84db2539a4017886d960657e5dbf7',1,'',0,1,'KaUrrA','13569451007',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','河南长葛中心','',0,0,0,0,0,0,0),(3385,0,'17307926666',0,'4a304edd09918707478fde458a2c08f6',1,'',0,1,'aju7lG','17307926666',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','桂仪锋','',0,0,0,0,0,0,0),(3386,0,'13776877666',0,'b8cff0d01a579a94624f02c650ec450a',1,'',0,1,'jF4UIs','13776877666',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','江苏常州武进御城中心','',0,0,0,0,0,0,0),(3387,0,'18643506776',0,'cf0dd12de8c35b83e8e8b8447abf8841',1,'',0,1,'kxL76K','18643506776',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','冯丹丹','',0,0,0,0,0,0,0),(3388,0,'13762939727',0,'d7e4e75477a70f8ceb659b5d001d5313',1,'',0,1,'PQaMoA','13762939727',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','湖南怀化鹤城锦绣五溪广场中心','',0,0,0,0,0,0,0),(3389,0,'13633148683',0,'2bc72fc17acb910bd9a683b984ff3bea',1,'',0,1,'tVO9qf','13633148683',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','郭新民','',0,0,0,0,0,0,0),(3390,0,'15132099828',0,'d8aefa0ed2a23b79cacca19ec1ff8d29',1,'',0,1,'MEyKD5','15132099828',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','河北邯郸永年时代广场中心','',0,0,0,0,0,0,0),(3391,0,'13103143099',0,'b654eaffdf184d0b1d0da81b0d6db5a9',1,'',0,1,'N0BmY2','13103143099',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','河北承德平泉中心','',0,0,0,0,0,0,0),(3392,0,'13131276200',0,'5bfff22f99031b56ff0f701e764ddc58',1,'',0,1,'zUbSV2','13131276200',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','河北保定定州实验高中中心','',0,0,0,0,0,0,0),(3393,0,'18857799662',0,'2c8bc7bc1438a2253e62be03105a9025',1,'',0,1,'EldBly','18857799662',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','浙江温州龙湾中心','',0,0,0,0,0,0,0),(3394,0,'18888782640',0,'28fbf70fe98b8a91260ebd98b63fa6a8',1,'',0,1,'Qvil5T','18888782640',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','浙江绍兴上虞大通购物广场','',0,0,0,0,0,0,0),(3395,0,'15957948782',0,'e95cca9e7898ad90bea4e89c1369c9f2',1,'',0,1,'zmMp9v','15957948782',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','浙江金华东阳银泰城中心','',0,0,0,0,0,0,0),(3396,0,'13587622991',0,'5b7110499925400492cd0e772b601761',1,'',0,1,'uPFalY','13587622991',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','浙江温州鹿城中心','',0,0,0,0,0,0,0),(3397,0,'18531516776',0,'386eacb4385533d8d3ed1e69acc00afc',1,'',0,1,'5NHBnP','18531516776',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','河北唐山曹妃甸中心','',0,0,0,0,0,0,0),(3398,0,'13701155732',0,'50675d02a497568c56527087e3fe0772',1,'',0,1,'rmUah0','13701155732',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','北京良乡北潞园中心','',0,0,0,0,0,0,0),(3399,0,'18942231062',0,'aa0d78aeaf9fb69a330a2338bc077a4f',1,'',0,1,'63KA55','18942231062',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','江西南昌象湖新城中心 ','',0,0,0,0,0,0,0),(3400,0,'15039685123',0,'49a668240eaf85046e7b10571e1b853f',1,'',0,1,'vGSiZr','15039685123',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','河南驻马店驿城CBD中心','',0,0,0,0,0,0,0),(3401,0,'15133000625',0,'f99d99c55f8a516816b990b06a927a3a',1,'',0,1,'4Q8qb8','15133000625',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','耿康','',0,0,0,0,0,0,0),(3402,0,'15995058558',0,'f0d4329f7beab22988755f88dfd7481a',1,'',0,1,'Jmj7rL','15995058558',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','江苏常州溧阳万达广场中心','',0,0,0,0,0,0,0),(3403,0,'13795079099',0,'ad93c046c7c8a2c8c339d7dab7c66db6',1,'',0,1,'9eKQww','13795079099',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','辽宁阜新海州和平路中心','',0,0,0,0,0,0,0),(3404,0,'15326864444',0,'2a1a574d1fa0427de8823fa138ef85b5',1,'',0,1,'4KD7I6','15326864444',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','内蒙古赤峰红山万达广场中心','',0,0,0,0,0,0,0),(3405,0,'13865095737',0,'4667fbc8a39b15a8f3da54e9ba0cbca8',1,'',0,1,'53iYGD','13865095737',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'',' 安徽蚌埠固镇中心','',0,0,0,0,0,0,0),(3406,0,'15531976967',0,'645bf26d144eecbef73b6b5dbf6795e9',1,'',0,1,'BiGRAz','15531976967',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','河北邢台巨鹿中心','',0,0,0,0,0,0,0),(3407,0,'15324073652',0,'4eac6c82b9c3d829eb6051aab8728e5c',1,'',0,1,'FfC7wM','15324073652',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','河北张家口张北新世纪中心','',0,0,0,0,0,0,0),(3408,0,'18692007995',0,'d6d8ed04a94cb08a2868cc716278768a',1,'',0,1,'LoRO0y','18692007995',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','湖南衡阳耒阳金阳路中心','',0,0,0,0,0,0,0),(3409,0,'15265371999',0,'bd924dcb4729f87b4e87bb57852e8de9',1,'',0,1,'slAuvg','15265371999',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','山东济宁微山中心','',0,0,0,0,0,0,0),(3410,0,'15254976965',0,'ea6785ecb42af7e1288375b0c7f913be',1,'',0,1,'FHKEDb','15254976965',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','山东临沂平邑中心','',0,0,0,0,0,0,0),(3411,0,'13717615977',0,'d05b80217adce6884f60b689e62506a4',1,'',0,1,'vCaxIn','13717615977',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','北京海淀万柳中心','',0,0,0,0,0,0,0),(3412,0,'15137977799',0,'bf054b23c1dbf716ad691d66ecd72aa0',1,'',0,1,'lt5fRC','15137977799',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','河南洛阳宜阳锦花中心 ','',0,0,0,0,0,0,0),(3413,0,'15617001100',0,'2868507b34678c134848ad4d0f1f9f97',1,'',0,1,'6O1Tz0','15617001100',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','河南商丘睢阳中心','',0,0,0,0,0,0,0),(3414,0,'13069483737',0,'4ad5b91eba61bcf0527f9782e831a8d1',1,'',0,1,'9L9B8P','13069483737',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','河南焦作王府井中心','',0,0,0,0,0,0,0),(3415,0,'18637888638',0,'4546d10c3f45c1e3936f4e07ca289600',1,'',0,1,'biKMIQ','18637888638',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','河南开封开元广场中心','',0,0,0,0,0,0,0),(3416,0,'13599228806',0,'083fb1f32a8ea2285a3d994ef78878bf',1,'',0,1,'W4Fhlq','13599228806',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','福建泉州石狮中心','',0,0,0,0,0,0,0),(3417,0,'13881385528',0,'70753acf342539a8b46364ec95ca182f',1,'',0,1,'23HOpD','13881385528',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','万隽','',0,0,0,0,0,0,0),(3418,0,'15859160992',0,'c471ce0279ff87a17341e011a642ae16',1,'',0,1,'1KMHPl','15859160992',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','黄丽君','',0,0,0,0,0,0,0),(3419,0,'18369301859',0,'56ad369779890af244fe20dca78069e5',1,'',0,1,'voMXo8','18369301859',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','高礼燕','',0,0,0,0,0,0,0),(3420,0,'13731112345',0,'6552bbed31a85cc701044a69d84ae15d',1,'',0,1,'CR1Rw4','17331833659',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','河北石家庄长安阿尔卡迪亚中心','',0,0,0,0,0,0,0),(3421,0,'17331833659',0,'75b8beb8989c6b2af16284d7726edd56',1,'',0,1,'COfF0e','17331833659',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','河北衡水冀州都会城中心','',0,0,0,0,0,0,0),(3422,0,'18830362003',0,'7be8c197f5255fdf99ea0db19aa132e7',1,'',0,1,'b6TQvR','18830362003',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'',' 尤晓玉','',0,0,0,0,0,0,0),(3423,0,'15263971111',0,'7d96f4005872e5c0f11928c6798bd51f',1,'',0,1,'iP5UOE','15263971111',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','山东临沂沂水中心','',0,0,0,0,0,0,0),(3424,0,'18063589350',0,'f76697bfb2993f3fe74050d7fa7cb35e',1,'',0,1,'mMpb1X','18063589350',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','山东聊城东昌府鸿顺中心','',0,0,0,0,0,0,0),(3425,0,'15192626268',0,'dee8e12324a3e7922d1045b806a8546d',1,'',0,1,'5gfkBY','15192626268',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','山东青岛胶州香港花园中心','',0,0,0,0,0,0,0),(3426,0,'15020111966',0,'b4caadac7f5229901c7a1be977132071',1,'',0,1,'a3aVqn','15020111966',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','山东菏泽单县中心','',0,0,0,0,0,0,0),(3427,0,'13325034831',0,'a1de570d93becfe7fe1cf79ba4b29a48',1,'',0,1,'9InLzt','13325034831',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','山东东营广饶中心','',0,0,0,0,0,0,0),(3428,0,'13589998537',0,'19a4bb7d330143a77c7688cbdbf192a1',1,'',0,1,'pSWAAh','18563626646',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','张伟','',0,0,0,0,0,0,0),(3429,0,'13682073969',0,'2b81910af41206b7b6287d6aaa14a448',1,'',0,1,'DrH6pM','13682073969',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','天津津南首创中心','',0,0,0,0,0,0,0),(3430,0,'15770295405',0,'8913696fada91aa077b9138ba9dc743c',1,'',0,1,'xA58j2','15770295405',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','云南保山腾冲腾越中心','',0,0,0,0,0,0,0),(3431,0,'15518210369',0,'1e072280c9c4b62312b8f4b78f471fba',1,'',0,1,'aGEFVX','15518210369',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'',' 河南漯河会展中心','',0,0,0,0,0,0,0),(3432,0,'18603535278',0,'340ff076e0b565cef1569afe5fdde388',1,'',0,1,'qaS5XD','18603535278',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','山西阳泉盂县中心','',0,0,0,0,0,0,0),(3433,0,'13850390809',0,'bcf34ac6c2404357d244f557bec32b6a',1,'',0,1,'oD5qqr','13850390809',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','福建厦门湖里301中心','',0,0,0,0,0,0,0),(3434,0,'15109611751',0,'008c957a1978072497e467defc19ce89',1,'',0,1,'l1DEfD','15109611751',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','宁夏银川贺兰中心','',0,0,0,0,0,0,0),(3435,0,'13865935365',0,'c12ca766513fc8697ec2dfd215fba6b4',1,'',0,1,'LCi855','13865935365',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','安徽合肥蜀山天h中心','',0,0,0,0,0,0,0),(3436,0,'18714845473',0,'421c39310c81007a13b96e18f12fff68',1,'',0,1,'HUPEyj','18714845473',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','安徽芜湖鸠江公园大道中心','',0,0,0,0,0,0,0),(3437,0,'13052812730',0,'78fdf688273fd923c5a124cf8a45a796',1,'',0,1,'dPYsVn','13052812730',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','江苏镇江润州美的城中心','',0,0,0,0,0,0,0),(3438,0,'13705251705',0,'a6e30b48d0e1526c8cd561c9c64d3f6c',1,'',0,1,'dsDIK2','13705251705',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','江苏扬州邗江万达中心','',0,0,0,0,0,0,0),(3439,0,'18516413993',0,'da3f2eeb075dc65eb5ca9050ae1c006a',1,'',0,1,'xIejvu','18516413993',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','上海闵行龙柏中心','',0,0,0,0,0,0,0),(3440,0,'17604320190',0,'6fc5f954ca6739d932618742fdd1ac6f',1,'',0,1,'HWXl2n','17604320190',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','吉林吉林丰满水韵名城中心','',0,0,0,0,0,0,0),(3441,0,'18920926556',0,'d8ed178b2d84041ac304395cd14cc7ff',1,'',0,1,'t0xrKr','18920926556',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','内蒙古通辽科尔沁中心','',0,0,0,0,0,0,0),(3442,0,'15729597865',0,'3a5ee0a4cab3126eb60a646fcdb4556f',1,'',0,1,'jsa5Ty','15729597865',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','宁夏银川兴庆中心','',0,0,0,0,0,0,0),(3443,0,'13630030886',0,'9d7a35c98a8197d21be50a7b4fe1dd47',1,'',0,1,'tZR0bu','13630030886',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','广东佛山顺德乐从中心  ','',0,0,0,0,0,0,0),(3444,0,'13902464957',0,'fff38cc42522ce9b7ec63b63144f48b6',1,'',0,1,'my1RtA','13902464957',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','广东深圳南山蛇口海上世界中心','',0,0,0,0,0,0,0),(3445,0,'13712677744',0,'b4c45db9d6b01f409c9a38ddd7cef0c6',1,'',0,1,'Q9ZClo','13712677744',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','广东东莞厚街','',0,0,0,0,0,0,0),(3446,0,'13682073969',0,'d48387a00aa389da2b8265a9751a85ae',1,'',0,1,'JQMgaT','13682073969',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','天津津南首创中心','',0,0,0,0,0,0,0),(3447,0,'18646091550',0,'7e65f6dfee88926c13111abeee8d1966',1,'',0,1,'8y3v9b','18646091550',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','园长','',0,0,0,0,0,0,0),(3448,0,'17663023166',0,'bc3b272a0c1be3af97aadddad5047507',1,'',0,1,'2c6CUr','13663023166',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','山东淄博临淄凤凰城中心','',0,0,0,0,0,0,0),(3449,0,'17615145146',0,'59f02ce1ca2e1823341f814b6179255b',1,'',0,1,'Qn2eiS','',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','辽宁朝阳双塔天盛嘉苑中心','',0,0,0,0,0,0,0),(3450,0,'123123',0,'9af12de2c77fad6709362c3efd115ce3',1,'',0,1,'edre5K','13834645634',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','123123','',0,0,0,0,0,0,0),(3451,0,'15959285957',0,'1e8655e0c651d908df3067eb91ed66a9',1,'',0,1,'6RjBmL','15959285957',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','福建厦门翔安泰禾中心','',0,0,0,0,0,0,0),(3452,0,'13435074595',0,'99bd11745e5f82ceebf0145e232c8c13',1,'',0,1,'cLNJTg','13435074595',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','广东韶关武江太阳城中心','',0,0,0,0,0,0,0),(3453,0,'17727778168',0,'d4f6b7c42b9ec86f728e85c76db7c867',1,'',0,1,'BPakJu','17727778168',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','广东韶关浈江凤凰城中心','',0,0,0,0,0,0,0),(3454,0,'15610027899',0,'6f0bc2a5cef407d7726dd497ac03452c',1,'',0,1,'d01cb2','15610027899',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','山东青岛莱西香港路中心','',0,0,0,0,0,0,0),(3455,0,'13388018326',0,'9c01c9629809812935f0169b5f651259',1,'',0,1,'SwgOfr','13388018326',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','天津武清荔隆中心','',0,0,0,0,0,0,0),(3456,0,'13820654734',0,'57b2353f64a4eb3cea37a2b2ea95a7f2',1,'',0,1,'K4UoC5','13820654734',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','天津河西田园商业广场中心','',0,0,0,0,0,0,0),(3457,0,'15933160898',0,'e7bf449b7efc0989129723d971a423ed',1,'',0,1,'K5O4CP','15933160898',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','天津武清创意米兰中心','',0,0,0,0,0,0,0),(3458,0,'18721499498',0,'642ddeada87c3a64979efee259f15256',1,'',0,1,'1Px8KA','18721499498',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','张琴','',0,0,0,0,0,0,0),(3459,0,'13887326118',0,'f0a67b218963125c2bde9e8cc8074eb1',1,'',0,1,'gH9Td7','13887326118',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','云南红河弥勒中心','',0,0,0,0,0,0,0),(3460,0,'15302176543',0,'48f58abb3654a3a848dc3742a0a62b97',1,'',0,1,'3TNDXv','15302176543',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','天津塘沽金水畔广场中心','',0,0,0,0,0,0,0),(3461,0,'13905650330',0,'ed5aff9f2482e6303c50718a1db68309',1,'',0,1,'CbzSWV','13905650330',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','安徽合肥巢湖华邦书香里中心','',0,0,0,0,0,0,0),(3462,0,'18790422669',0,'c934beb6c44d5d36c3cb1e237ca8a44c',1,'',0,1,'tgpVJX','18790422669',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','河南信阳浉河中心  ','',0,0,0,0,0,0,0),(3463,0,'13564192692',0,'2c121512e2f830b530a99ba87756f0c6',1,'',0,1,'UcdtL6','17717362692',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','上海浦东新区惠南中心','',0,0,0,0,0,0,0),(3464,0,'15724451111',0,'c1736957368835ffafd8e2cdfbdd80a5',1,'',0,1,'ab0UJA','13261313123',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','辽宁锦州太和万达中心','',0,0,0,0,0,0,0),(3465,0,'18637718772',0,'4caa056ecc90661872de225ca6ac1807',1,'',0,1,'BxechL','18637718772',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','河南南阳宛城华鑫商务中心','',0,0,0,0,0,0,0),(3466,0,'13152318468',0,'f88e478b8a539420f2edf8ccef3befd4',1,'',0,1,'kROxAV','13609215324',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','陕西咸阳秦都玉景台中心','',0,0,0,0,0,0,0),(3467,0,'13832896258',0,'be0cee07435b58113110773847e70adc',1,'',0,1,'ktkCJy','13832896258',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','河北唐山玉田县中心','',0,0,0,0,0,0,0),(3468,0,'13831762000',0,'240d33d2184227448ebb08d1cbdf7406',1,'',0,1,'uHnJTT','13831762000',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','河北沧州黄骅中捷友谊广场中心','',0,0,0,0,0,0,0),(3469,0,'15075891780',0,'855a90c874400ce1cacf1c7b01baad6c',1,'',0,1,'dWM2vB','15075891780',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','河北衡水安平中心','',0,0,0,0,0,0,0),(3470,0,'18931638960',0,'902f3c8de8086f0ff85e7272b201d169',1,'',0,1,'IwxFPJ','18931638960',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','河北衡水武邑县中心','',0,0,0,0,0,0,0),(3471,0,'13613216963',0,'2b8ef1bc06a6227a5abd9deda9406617',1,'',0,1,'kOWQJ3','13613216963',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','河北石家庄裕华中心','',0,0,0,0,0,0,0),(3472,0,'15732596260',0,'e28391f2e70ea949c95f0893a0b1f791',1,'',0,1,'1LES6R','15732596260',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','河北唐山路北汇金中心','',0,0,0,0,0,0,0),(3473,0,'15639137177',0,'23912052ccdd816e13c8f04b69c021c9',1,'',0,1,'r2UcJ1','15639137177',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','河南济源济中心','',0,0,0,0,0,0,0),(3474,0,'13861529171',0,'81c435bc73df3e01981004c3609bde81',1,'',0,1,'GxU6Tb','13861529171',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','江苏宜兴官林尚岛豪庭中心','',0,0,0,0,0,0,0),(3475,0,'15029457788',0,'d20f433bd1f23bed4605acacbf34250b',1,'',0,1,'fRsbVE','15029457788',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','陕西安康汉滨金坊国际中心','',0,0,0,0,0,0,0),(3476,0,'18917946833',0,'69c15c51d58582e9320891046ab43283',1,'',0,1,'nQs60d','18917946833',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','上海浦东新区博硕创意园中心','',0,0,0,0,0,0,0),(3477,0,'18946726766',0,'ae1ce700835a9e67019f50f6904512ff',1,'',0,1,'ZjvcqM','18946726766',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','吉林长春高新富强天玺中心','',0,0,0,0,0,0,0),(3478,0,'18913919648',0,'924849cc70398fb2dc5ad32e822a52a0',1,'',0,1,'HQIbQh','18913919648',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','江苏南京栖霞万达中心','',0,0,0,0,0,0,0),(3479,0,'15951594083',0,'2b7880f45c635ac43e4c6b5fe7efc611',1,'',0,1,'zbwJQ0','15951594083',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','李实','',0,0,0,0,0,0,0),(3480,0,'18408441701',0,'9a201f87812eb07cde9879733ed58a64',1,'',0,1,'5T0Tcr','18408441701',1,'','','','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,'','宁夏银川吉泰润园中心','',0,0,0,0,0,0,0),(3481,1,'shizhi01',0,'1573002dc40cdd16cdf7c0b03f7fca17',1,'',0,0,'4NIiH8','',0,'','1','','123456',0,'',0,'','',NULL,NULL,NULL,NULL,0,'',0,'','','',0,0,0,1544235945,0,0,0),(3482,1,'shizhi02',0,'aee2ac5582928bd113286c3aabc209ca',1,'',0,0,'UWfEzj','',0,'','1','','123456',0,'',0,'','',NULL,NULL,NULL,NULL,0,'',0,'','','',0,0,0,1544236302,0,0,0),(3484,0,'shizhi05',0,'c45a0e40b3c0321322bbbf6c1e20e2b2',1,'',1,1,'8n4akR','',0,'','','','',0,'',0,'','','14.155.89.203',1,'14.155.89.203',1,2,'',0,'','shizhi05','',0,0,0,1544237240,1544237256,1544237245,0),(3485,0,'shizhi06',0,'c028579991c55228d3f2bc427e45812d',1,'',0,1,'R5hnF4','',0,'','','','',0,'',0,'','','14.155.89.203',1,'14.155.89.203',1,3,'',1,'','shizhi','',0,0,0,1544237334,1544237362,1544237348,0),(3486,0,'miaohua',0,'ae6d401d0097a232fcbd50c372d40994',1,'',1,1,'FMR9e7','',0,'','','','',0,'',0,'','',NULL,NULL,NULL,NULL,0,'',0,'','miaohua','',0,0,0,1544513701,0,0,0);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_admin`
--

DROP TABLE IF EXISTS `sys_user_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_admin` (
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'user用户ID',
  `admin_name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户姓名',
  `group_id_array` int(11) NOT NULL DEFAULT '0' COMMENT '系统用户组',
  `is_admin` int(1) NOT NULL DEFAULT '0' COMMENT '是否是系统管理员组',
  `admin_status` int(11) DEFAULT '1' COMMENT '状态 默认为1',
  `desc` text COMMENT '附加信息',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=910 COMMENT='后台管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_admin`
--

LOCK TABLES `sys_user_admin` WRITE;
/*!40000 ALTER TABLE `sys_user_admin` DISABLE KEYS */;
INSERT INTO `sys_user_admin` VALUES (1,'管理员',1,1,1,''),(3075,'xusq',2,0,1,''),(3078,'zhy',1,0,1,''),(3481,'shizhi01',1,0,1,'111'),(3482,'shizhi02',1,0,1,''),(3484,'shizhi05',1,0,1,''),(3486,'miaohua',1,0,1,'');
/*!40000 ALTER TABLE `sys_user_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_group`
--

DROP TABLE IF EXISTS `sys_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_group` (
  `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `instance_id` int(11) NOT NULL DEFAULT '1' COMMENT '实例ID',
  `group_name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户组名称',
  `group_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户组状态',
  `is_system` int(1) NOT NULL DEFAULT '0' COMMENT '是否是系统用户组',
  `module_id_array` text NOT NULL COMMENT '系统模块ID组，用，隔开',
  `desc` text COMMENT '描述',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=963 COMMENT='系统用户组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_group`
--

LOCK TABLES `sys_user_group` WRITE;
/*!40000 ALTER TABLE `sys_user_group` DISABLE KEYS */;
INSERT INTO `sys_user_group` VALUES (1,0,'管理员组',1,1,'120,121,122,123,126,127,128,129,133,137,139,144,145,149,151,169,170,171,172,176,179,180,184,185,186,187,189,190,191,192,194,195,196,197,198,199,200,201,202,203,210,218,221,334,335,336,339,340,341,342,343,358,359,360,361,381,382,383,387,388,389,390,392,394,395,403,405,409,418,419,420,421,422,423,424,425,427,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,450,451,452,454,455,456,457,459,460,461,462,463,469,471,472,474,477,478,479,480,481,482,484,485,486,487,488,489,490,491,492,493,494,495,496,497,498,499,501,502,503,504,506,507,508,509,510,512,513,517,518,519,520,521,522,523,524,525,526,527,528,529,530,10000,10001,10002,10003,10004,10005,10006,10007,10008,10009,10010,10011,10012,10013,10014,10015,10016,10017,10018,10019,10021,10022,10023,10024,10075,10076,10077,10078,10079,10080,10081,10082,10083',NULL,2017,0),(2,0,'商品管理员',1,0,'149,139,169,151,171,172,210,334,419,420,421,422,423,424,425,478,479,480,481,482,484,485,517,518,10001,10002,10003','',1543999831,0);
/*!40000 ALTER TABLE `sys_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_log`
--

DROP TABLE IF EXISTS `sys_user_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '操作用户ID',
  `is_system` int(11) NOT NULL DEFAULT '1' COMMENT '是否是后台操作',
  `controller` varchar(255) NOT NULL DEFAULT '' COMMENT '操作控制器',
  `method` varchar(255) NOT NULL DEFAULT '' COMMENT '操作方案',
  `data` text COMMENT '传输数据',
  `ip` varchar(255) DEFAULT NULL COMMENT 'ip地址',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=82 COMMENT='用户操作日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_log`
--

LOCK TABLES `sys_user_log` WRITE;
/*!40000 ALTER TABLE `sys_user_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_user_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_version_devolution`
--

DROP TABLE IF EXISTS `sys_version_devolution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_version_devolution` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `devolution_username` varchar(255) NOT NULL DEFAULT '' COMMENT '授权账户',
  `devolution_password` varchar(255) NOT NULL DEFAULT '' COMMENT '授权密码',
  `create_date` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='用户授权信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_version_devolution`
--

LOCK TABLES `sys_version_devolution` WRITE;
/*!40000 ALTER TABLE `sys_version_devolution` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_version_devolution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_version_patch`
--

DROP TABLE IF EXISTS `sys_version_patch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_version_patch` (
  `patch_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `patch_type` int(11) NOT NULL DEFAULT '1' COMMENT '补丁类型  1. B2C单用户商城 2.B2C 单用户分销商城 3 B2B2C多用户商城',
  `patch_type_name` varchar(50) NOT NULL DEFAULT '' COMMENT '补丁类型名称',
  `patch_release` varchar(50) NOT NULL DEFAULT '' COMMENT '补丁编号',
  `patch_name` varchar(255) NOT NULL DEFAULT '' COMMENT '补丁标题',
  `patch_no` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '版本号',
  `patch_file_name` varchar(50) NOT NULL DEFAULT '' COMMENT '补丁文件名称',
  `patch_log` text NOT NULL COMMENT '版本补丁更新日志',
  `patch_file_size` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '补丁文件大小',
  `is_up` int(11) NOT NULL DEFAULT '2' COMMENT '是否升级  1代表已升级  0未升级 2全部',
  `modify_date` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`patch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='版本补丁管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_version_patch`
--

LOCK TABLES `sys_version_patch` WRITE;
/*!40000 ALTER TABLE `sys_version_patch` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_version_patch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_web_style`
--

DROP TABLE IF EXISTS `sys_web_style`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_web_style` (
  `style_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `style_name` varchar(50) NOT NULL DEFAULT '' COMMENT '样式名称',
  `style_path` varchar(255) NOT NULL DEFAULT '' COMMENT '样式路径',
  `stye_img` varchar(255) NOT NULL DEFAULT '' COMMENT '样式图片路径',
  `desc` text COMMENT '备注',
  `type` int(11) DEFAULT '1' COMMENT '1：前台样式，2：后台样式',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`style_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='网站前台样式表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_web_style`
--

LOCK TABLES `sys_web_style` WRITE;
/*!40000 ALTER TABLE `sys_web_style` DISABLE KEYS */;
INSERT INTO `sys_web_style` VALUES (1,'热情洋溢','default','',NULL,1,0,0),(2,'蓝色清爽','blue','',NULL,1,0,0),(3,'经典版','admin','','',2,1500608775,1500608775),(4,'简约版','adminblue','','',2,1500608775,1500608775);
/*!40000 ALTER TABLE `sys_web_style` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_website`
--

DROP TABLE IF EXISTS `sys_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_website` (
  `website_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '网站标题',
  `logo` varchar(255) NOT NULL DEFAULT '' COMMENT '网站logo',
  `web_desc` varchar(1000) NOT NULL DEFAULT '' COMMENT '网站描述',
  `key_words` varchar(255) NOT NULL DEFAULT '' COMMENT '网站关键字',
  `web_icp` varchar(255) NOT NULL DEFAULT '' COMMENT '网站备案号',
  `style_id_pc` int(10) NOT NULL DEFAULT '2' COMMENT '前台网站风格（1：热情洋溢模板，2：蓝色清爽版）',
  `web_address` varchar(255) NOT NULL DEFAULT '' COMMENT '网站联系地址',
  `web_qrcode` varchar(255) NOT NULL DEFAULT '' COMMENT '网站公众号二维码',
  `web_url` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺网址',
  `web_email` varchar(255) NOT NULL DEFAULT '' COMMENT '网站邮箱',
  `web_phone` varchar(255) NOT NULL DEFAULT '' COMMENT '网站联系方式',
  `web_qq` varchar(255) NOT NULL DEFAULT '' COMMENT '网站qq号',
  `web_weixin` varchar(255) NOT NULL DEFAULT '' COMMENT '网站微信号',
  `web_status` int(10) NOT NULL DEFAULT '1' COMMENT '网站运营状态1.开启 2.关闭 ',
  `web_visit` int(11) NOT NULL DEFAULT '2',
  `web_reg` int(11) NOT NULL DEFAULT '1' COMMENT '是否开启注册 1 开启 2 关闭',
  `third_count` text NOT NULL COMMENT '第三方统计',
  `close_reason` varchar(255) NOT NULL DEFAULT '' COMMENT '站点关闭原因',
  `wap_status` int(10) NOT NULL DEFAULT '1' COMMENT '手机端运营状态 1.开启2.关闭',
  `style_id_admin` int(10) DEFAULT '4' COMMENT '后台网站风格（3：旧模板，4：新模板）',
  `create_time` int(11) DEFAULT '0' COMMENT '网站创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '网站修改时间',
  `url_type` int(11) NOT NULL DEFAULT '0' COMMENT '网站访问模式',
  `web_popup_title` varchar(50) NOT NULL DEFAULT '' COMMENT '网站弹出框标题',
  `config` text NOT NULL COMMENT '网站配置(json格式)',
  PRIMARY KEY (`website_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='网站信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_website`
--

LOCK TABLES `sys_website` WRITE;
/*!40000 ALTER TABLE `sys_website` DISABLE KEYS */;
INSERT INTO `sys_website` VALUES (1,'斯玛特加盟商电商系统','upload/common/1544172200.png','','斯玛特商城','123456789',1,'深圳市罗湖区百汇大厦','upload/common/1543909435.png','www.smtjy.com','1014256196@qq.com','17727750995','1014256196','17727750995',1,2,2,'','系统维护中',1,0,1477452112,1544494750,0,'','');
/*!40000 ALTER TABLE `sys_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_weixin_auth`
--

DROP TABLE IF EXISTS `sys_weixin_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_weixin_auth` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `instance_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `authorizer_appid` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺的appid  授权之后不用刷新',
  `authorizer_refresh_token` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺授权之后的刷新token，每月刷新',
  `authorizer_access_token` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺的公众号token，只有2小时',
  `func_info` varchar(1000) NOT NULL DEFAULT '' COMMENT '授权项目',
  `nick_name` varchar(50) NOT NULL DEFAULT '' COMMENT '公众号昵称',
  `head_img` varchar(255) NOT NULL DEFAULT '' COMMENT '公众号头像url',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '公众号原始账号',
  `alias` varchar(255) NOT NULL DEFAULT '' COMMENT '公众号原始名称',
  `qrcode_url` varchar(255) NOT NULL DEFAULT '' COMMENT '公众号二维码url',
  `auth_time` int(11) DEFAULT '0' COMMENT '授权时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='店铺(实例)微信公众账号授权';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_weixin_auth`
--

LOCK TABLES `sys_weixin_auth` WRITE;
/*!40000 ALTER TABLE `sys_weixin_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_weixin_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_weixin_default_replay`
--

DROP TABLE IF EXISTS `sys_weixin_default_replay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_weixin_default_replay` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `instance_id` int(11) NOT NULL COMMENT '店铺id',
  `reply_media_id` int(11) NOT NULL COMMENT '回复媒体内容id',
  `sort` int(11) NOT NULL,
  `create_time` int(11) DEFAULT '0',
  `modify_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='关注时回复';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_weixin_default_replay`
--

LOCK TABLES `sys_weixin_default_replay` WRITE;
/*!40000 ALTER TABLE `sys_weixin_default_replay` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_weixin_default_replay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_weixin_fans`
--

DROP TABLE IF EXISTS `sys_weixin_fans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_weixin_fans` (
  `fans_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '粉丝ID',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '会员编号ID',
  `source_uid` int(11) NOT NULL DEFAULT '0' COMMENT '推广人uid',
  `instance_id` int(11) NOT NULL COMMENT '店铺ID',
  `nickname` varchar(255) NOT NULL COMMENT '昵称',
  `nickname_decode` varchar(255) DEFAULT '',
  `headimgurl` varchar(500) NOT NULL DEFAULT '' COMMENT '头像',
  `sex` smallint(6) NOT NULL DEFAULT '1' COMMENT '性别',
  `language` varchar(20) NOT NULL DEFAULT '' COMMENT '用户语言',
  `country` varchar(60) NOT NULL DEFAULT '' COMMENT '国家',
  `province` varchar(255) NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(255) NOT NULL DEFAULT '' COMMENT '城市',
  `district` varchar(255) NOT NULL DEFAULT '' COMMENT '行政区/县',
  `openid` varchar(255) NOT NULL DEFAULT '' COMMENT '用户的标识，对当前公众号唯一     用户的唯一身份ID',
  `unionid` varchar(255) NOT NULL DEFAULT '' COMMENT '粉丝unionid',
  `groupid` int(11) NOT NULL DEFAULT '0' COMMENT '粉丝所在组id',
  `is_subscribe` bigint(1) NOT NULL DEFAULT '1' COMMENT '是否订阅',
  `memo` varchar(255) NOT NULL COMMENT '备注',
  `subscribe_date` int(11) DEFAULT '0' COMMENT '订阅时间',
  `unsubscribe_date` int(11) DEFAULT '0' COMMENT '解订阅时间',
  `update_date` int(11) DEFAULT '0' COMMENT '粉丝信息最后更新时间',
  PRIMARY KEY (`fans_id`),
  KEY `IDX_sys_weixin_fans_openid` (`openid`),
  KEY `IDX_sys_weixin_fans_unionid` (`unionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1638 COMMENT='微信公众号获取粉丝列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_weixin_fans`
--

LOCK TABLES `sys_weixin_fans` WRITE;
/*!40000 ALTER TABLE `sys_weixin_fans` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_weixin_fans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_weixin_follow_replay`
--

DROP TABLE IF EXISTS `sys_weixin_follow_replay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_weixin_follow_replay` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `instance_id` int(11) NOT NULL COMMENT '店铺id',
  `reply_media_id` int(11) NOT NULL COMMENT '回复媒体内容id',
  `sort` int(11) NOT NULL,
  `create_time` int(11) DEFAULT '0',
  `modify_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='关注时回复';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_weixin_follow_replay`
--

LOCK TABLES `sys_weixin_follow_replay` WRITE;
/*!40000 ALTER TABLE `sys_weixin_follow_replay` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_weixin_follow_replay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_weixin_functions_button`
--

DROP TABLE IF EXISTS `sys_weixin_functions_button`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_weixin_functions_button` (
  `button_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `instance_id` int(11) NOT NULL COMMENT '实例',
  `button_name` varchar(50) NOT NULL DEFAULT '' COMMENT '模块名',
  `keyname` varchar(20) NOT NULL DEFAULT '' COMMENT '触发关键词',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '触发网址',
  `hits` int(11) NOT NULL DEFAULT '0' COMMENT '触发次数',
  `is_enabled` int(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `is_system` int(1) DEFAULT '0',
  `orders` int(11) NOT NULL DEFAULT '0' COMMENT '排序号',
  `create_time` int(11) DEFAULT '0' COMMENT '创建日期',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改日期',
  PRIMARY KEY (`button_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1489 COMMENT='微信功能按钮';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_weixin_functions_button`
--

LOCK TABLES `sys_weixin_functions_button` WRITE;
/*!40000 ALTER TABLE `sys_weixin_functions_button` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_weixin_functions_button` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_weixin_instance_msg`
--

DROP TABLE IF EXISTS `sys_weixin_instance_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_weixin_instance_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `instance_id` int(11) NOT NULL COMMENT '店铺id（单店版为0）',
  `template_no` varchar(55) NOT NULL COMMENT '模版编号',
  `template_id` varbinary(55) DEFAULT NULL COMMENT '微信模板消息的ID',
  `title` varchar(100) NOT NULL COMMENT '模版标题',
  `is_enable` bit(1) DEFAULT b'0' COMMENT '是否启用',
  `headtext` varchar(255) NOT NULL COMMENT '头部文字',
  `bottomtext` varchar(255) NOT NULL COMMENT '底部文字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096 COMMENT='微信实例消息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_weixin_instance_msg`
--

LOCK TABLES `sys_weixin_instance_msg` WRITE;
/*!40000 ALTER TABLE `sys_weixin_instance_msg` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_weixin_instance_msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_weixin_key_replay`
--

DROP TABLE IF EXISTS `sys_weixin_key_replay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_weixin_key_replay` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `instance_id` int(11) NOT NULL COMMENT '店铺id',
  `key` varchar(255) NOT NULL COMMENT '关键词',
  `match_type` tinyint(4) NOT NULL COMMENT '匹配类型1模糊匹配2全部匹配',
  `reply_media_id` int(11) NOT NULL COMMENT '回复媒体内容id',
  `sort` int(11) NOT NULL,
  `create_time` int(11) DEFAULT '0',
  `modify_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='关键词回复';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_weixin_key_replay`
--

LOCK TABLES `sys_weixin_key_replay` WRITE;
/*!40000 ALTER TABLE `sys_weixin_key_replay` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_weixin_key_replay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_weixin_media`
--

DROP TABLE IF EXISTS `sys_weixin_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_weixin_media` (
  `media_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '图文消息id',
  `title` varchar(100) DEFAULT NULL,
  `instance_id` int(11) NOT NULL DEFAULT '0' COMMENT '实例id店铺id',
  `type` varchar(255) NOT NULL DEFAULT '1' COMMENT '类型1文本(项表无内容) 2单图文 3多图文',
  `sort` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) DEFAULT '0' COMMENT '创建日期',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改日期',
  PRIMARY KEY (`media_id`),
  UNIQUE KEY `id` (`media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1170;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_weixin_media`
--

LOCK TABLES `sys_weixin_media` WRITE;
/*!40000 ALTER TABLE `sys_weixin_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_weixin_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_weixin_media_item`
--

DROP TABLE IF EXISTS `sys_weixin_media_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_weixin_media_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `media_id` int(11) NOT NULL COMMENT '图文消息id',
  `title` varchar(100) DEFAULT NULL,
  `author` varchar(50) NOT NULL COMMENT '作者',
  `cover` varchar(200) NOT NULL COMMENT '图文消息封面',
  `show_cover_pic` tinyint(4) NOT NULL DEFAULT '1' COMMENT '封面图片显示在正文中',
  `summary` text,
  `content` text NOT NULL COMMENT '正文',
  `content_source_url` varchar(200) NOT NULL DEFAULT '' COMMENT '图文消息的原文地址，即点击“阅读原文”后的URL',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序号',
  `hits` int(11) NOT NULL DEFAULT '0' COMMENT '阅读次数',
  PRIMARY KEY (`id`),
  KEY `id` (`media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=712;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_weixin_media_item`
--

LOCK TABLES `sys_weixin_media_item` WRITE;
/*!40000 ALTER TABLE `sys_weixin_media_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_weixin_media_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_weixin_menu`
--

DROP TABLE IF EXISTS `sys_weixin_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_weixin_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `instance_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `menu_name` varchar(50) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `ico` varchar(32) NOT NULL DEFAULT '' COMMENT '菜图标单',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父菜单',
  `menu_event_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1普通url 2 图文素材 3 功能',
  `media_id` int(11) NOT NULL DEFAULT '0' COMMENT '图文消息ID',
  `menu_event_url` varchar(255) NOT NULL DEFAULT '' COMMENT '菜单url',
  `hits` int(11) NOT NULL DEFAULT '0' COMMENT '触发数',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_date` int(11) DEFAULT '0' COMMENT '创建日期',
  `modify_date` int(11) DEFAULT '0' COMMENT '修改日期',
  PRIMARY KEY (`menu_id`),
  KEY `IDX_biz_shop_menu_orders` (`sort`),
  KEY `IDX_biz_shop_menu_shopId` (`instance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1638 COMMENT='微设置->微店菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_weixin_menu`
--

LOCK TABLES `sys_weixin_menu` WRITE;
/*!40000 ALTER TABLE `sys_weixin_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_weixin_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_weixin_msg_template`
--

DROP TABLE IF EXISTS `sys_weixin_msg_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_weixin_msg_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `template_no` varchar(55) NOT NULL COMMENT '编号',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `contents` varchar(255) NOT NULL DEFAULT '' COMMENT '内容示例',
  `template_id` varchar(55) DEFAULT '' COMMENT '模版id',
  `headtext` varchar(255) DEFAULT NULL COMMENT '头部文字',
  `bottomtext` varchar(255) DEFAULT NULL COMMENT '底部文字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信消息模版';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_weixin_msg_template`
--

LOCK TABLES `sys_weixin_msg_template` WRITE;
/*!40000 ALTER TABLE `sys_weixin_msg_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_weixin_msg_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_weixin_qrcode_template`
--

DROP TABLE IF EXISTS `sys_weixin_qrcode_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_weixin_qrcode_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '实例ID',
  `instance_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `background` varchar(255) NOT NULL DEFAULT '' COMMENT '背景图片',
  `nick_font_color` varchar(255) NOT NULL DEFAULT '#000' COMMENT '昵称字体颜色',
  `nick_font_size` smallint(6) NOT NULL DEFAULT '12' COMMENT '昵称字体大小',
  `is_logo_show` smallint(6) NOT NULL DEFAULT '1' COMMENT 'logo是否显示',
  `header_left` varchar(6) NOT NULL DEFAULT '0px' COMMENT '头部左边距',
  `header_top` varchar(6) NOT NULL DEFAULT '0px' COMMENT '头部上边距',
  `name_left` varchar(6) NOT NULL DEFAULT '0px' COMMENT '昵称左边距',
  `name_top` varchar(6) NOT NULL DEFAULT '0px' COMMENT '昵称上边距',
  `logo_left` varchar(6) NOT NULL DEFAULT '0px' COMMENT 'logo左边距',
  `logo_top` varchar(6) NOT NULL DEFAULT '0px' COMMENT 'logo上边距',
  `code_left` varchar(6) NOT NULL DEFAULT '0px' COMMENT '二维码左边距',
  `code_top` varchar(6) NOT NULL DEFAULT '0px' COMMENT '二维码上边距',
  `is_check` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否默认',
  `is_remove` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除  0未删除 1删除',
  `template_url` varchar(255) NOT NULL DEFAULT '' COMMENT '模板样式路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=5461 COMMENT='微信推广二维码模板管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_weixin_qrcode_template`
--

LOCK TABLES `sys_weixin_qrcode_template` WRITE;
/*!40000 ALTER TABLE `sys_weixin_qrcode_template` DISABLE KEYS */;
INSERT INTO `sys_weixin_qrcode_template` VALUES (1,0,'public/static/images/qrcode_bg/qrcode_bg.png','#2b2b2b',23,1,'93px','467px','159px','479px','98px','319px','89px','88px',1,0,'public/static/images/qrcode_bg/template_bg_img.png');
/*!40000 ALTER TABLE `sys_weixin_qrcode_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_weixin_user_msg`
--

DROP TABLE IF EXISTS `sys_weixin_user_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_weixin_user_msg` (
  `msg_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `msg_type` varchar(255) NOT NULL,
  `content` text,
  `is_replay` int(11) NOT NULL DEFAULT '0' COMMENT '是否回复',
  `create_time` int(11) DEFAULT '0',
  PRIMARY KEY (`msg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信用户消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_weixin_user_msg`
--

LOCK TABLES `sys_weixin_user_msg` WRITE;
/*!40000 ALTER TABLE `sys_weixin_user_msg` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_weixin_user_msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_weixin_user_msg_replay`
--

DROP TABLE IF EXISTS `sys_weixin_user_msg_replay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_weixin_user_msg_replay` (
  `replay_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `msg_id` int(11) NOT NULL,
  `replay_uid` int(11) NOT NULL COMMENT '当前客服uid',
  `replay_type` varchar(255) NOT NULL,
  `content` text,
  `replay_time` int(11) DEFAULT '0',
  PRIMARY KEY (`replay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信用户消息回复表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_weixin_user_msg_replay`
--

LOCK TABLES `sys_weixin_user_msg_replay` WRITE;
/*!40000 ALTER TABLE `sys_weixin_user_msg_replay` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_weixin_user_msg_replay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_wexin_onekeysubscribe`
--

DROP TABLE IF EXISTS `sys_wexin_onekeysubscribe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_wexin_onekeysubscribe` (
  `instance_id` int(11) NOT NULL COMMENT '实例ID',
  `url` varchar(300) NOT NULL DEFAULT '' COMMENT '一键关注url',
  PRIMARY KEY (`instance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2048 COMMENT='微信一键关注设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_wexin_onekeysubscribe`
--

LOCK TABLES `sys_wexin_onekeysubscribe` WRITE;
/*!40000 ALTER TABLE `sys_wexin_onekeysubscribe` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_wexin_onekeysubscribe` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-19 14:33:05
