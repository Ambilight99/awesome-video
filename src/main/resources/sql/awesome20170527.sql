-- MySQL dump 10.13  Distrib 5.5.46, for Win64 (x86)
--
-- Host: localhost    Database: awesome
-- ------------------------------------------------------
-- Server version	5.5.46

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
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(255) DEFAULT NULL COMMENT '课程名',
  `code` varchar(32) DEFAULT NULL COMMENT '课程代号',
  `profession` varchar(32) DEFAULT NULL COMMENT '所属专业',
  `remark` varchar(255) DEFAULT NULL COMMENT '课程描述',
  `content` text COMMENT '课程内容',
  `credit` int(11) DEFAULT NULL COMMENT '学分',
  `status` int(1) DEFAULT '1' COMMENT '状态 0禁用1启用 （未用）',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `video_name` varchar(255) DEFAULT NULL COMMENT '视频名称',
  `video_url` varchar(255) DEFAULT NULL COMMENT '视频路径',
  `image_url` varchar(255) DEFAULT '' COMMENT '视频图片路径',
  `video_type` int(1) DEFAULT NULL COMMENT '视频类型（1、本地上传视频 2、在线视频） (未用)',
  `teacher` int(11) DEFAULT NULL COMMENT '所属教师',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (25,'《诗经》讲解','000001','文学','《诗经》的剖析','《诗经》是中国古代诗歌开端，最早的一部诗歌总集，原称“诗”或“诗三百”，收集了西周初年至春秋中叶（前11世纪至前6世纪）的诗歌，共311篇，其中6篇为笙诗，即只有标题，没有内容，称为笙诗六篇（南陔、白华、华黍、由康、崇伍、由仪），反映了周初至周晚期约五百年间的社会面貌。',NULL,1,'2017-04-07 13:01:20','2017-04-07 13:01:20','《诗经》_标清.mp4','1491570013151.mp4','1491570013151.jpg',NULL,31),(26,'中国历史文化','000005','历史学','中国历史文化','中国历史文化是中华文明演化而汇集成的一种反映民族特质和风貌的民族文化，是民族历史上各种思想文化、观念形态的总体表征，是指居住在中国地域内的中华民族及其祖先所创造的、为中华民族世世代代所继承发展的、具有鲜明民族特色的、历史悠久、内涵博大精深、传统优良的文化。它是中华民族几千年文明的结晶，除了儒家文化这个核心内容外，还包含有其他文化形态，如道家文化、佛教文化等等。%搜索A中国传统文化是指中国历史上以个体农业经济为基础，以宗法家庭为背景，以儒家伦理道德为核心的社会文化体系。她是我们的祖先传承下来的丰厚遗产，曾长期处于世界领先的地位。她所蕴含的思维方式、价值观念、行为准则。',NULL,1,'2017-04-07 13:11:37','2017-04-07 13:11:37','中国历史文化 - 吉林大学_标清.mp4','1491570600713.mp4','1491570600713.jpg',NULL,32),(27,'通信原理','000010','工学','通信原理','本视频讲述模拟通信和数字通信，且侧重于数字通信。主要内容包括:绪论、确定信号分析、随机过程和噪声分析、模拟信息传输、模拟信号的数字传输、数字信号的基带传输、数字信号的频带传输、信源及信源编码、信道及其复用技术、信道编码、同步原理、现代通信网、MATLAB通信仿真分析,各章节后面均备有相关习题与思考题。',NULL,1,'2017-04-07 13:25:44','2017-04-07 13:25:44','通信原理教学视频--张辉教授_标清.mp4','1491570956238.mp4','1491570956238.jpg',NULL,34),(28,'大学物理','000007','理学','大学物理','大学物理，是大学理工科类的一门基础课程，通过课程的学习，使学生熟悉自然界物质的结构，性质，相互作用及其运动的基本规律，为后继专业基础与专业课程的学习及进一步获取有关知识奠定必要的物理基础。但工科专业以力学基础和电磁学为主要授课。',NULL,1,'2017-04-07 13:36:05','2017-04-07 13:36:05','大学物理_标清.mp4','1491572163675.mp4','1491572163675.jpg',NULL,33),(29,'园艺专业概论','000025','农学','园艺专业概论','园艺专业概论以园艺作物生物多样性和科学文化内涵为基础。',NULL,1,'2017-04-07 14:11:59','2017-04-07 14:11:59','园艺专业概论.mp4','1491574315574.mp4','1491574315574.jpg',NULL,46),(30,'观赏园艺学','000026','农学','观赏园艺学','介绍园艺专业现状、学科体系、培养方案、科学展望与产业前景。',NULL,1,'2017-04-07 14:13:50','2017-04-07 14:13:50','观赏园艺学.mp4','1491574377528.mp4','1491574377528.jpg',NULL,46),(31,'园艺产业与园艺科学发展趋势','000027','农学','园艺产业与园艺科学发展趋势','使学生、教工作师和社会公众初步把握园艺专业内涵，为其学习和工作提供帮助。',NULL,1,'2017-04-07 14:15:47','2017-04-07 14:15:47','园艺产业与园艺科学发展趋势.mp4','1491574450264.mp4','1491574450264.jpg',NULL,46),(32,'V2火箭基地','000028','军事学','V2火箭基地','在二战时期，纳粹修建了当时世界上最大的军事工事基地，研制的当时最恶毒的科技，创造了巨大的恐怖武器、高科技和一些大规模杀伤性武器，本课程主要为大家介绍这些武器。',NULL,1,'2017-04-07 14:23:55','2017-04-07 14:23:55','V2火箭基地.mp4','1491574986966.mp4','1491574986966.jpg',NULL,47),(34,'U型潜艇基地','000029','军事学','U型潜艇基地','在二战时期，纳粹修建了当时世界上最大的军事工事基地，研制的当时最恶毒的科技，创造了巨大的恐怖武器、高科技和一些大规模杀伤性武器，本课程主要为大家介绍这些武器。',NULL,1,'2017-04-07 14:32:02','2017-04-07 14:32:02','U型潜艇基地.mp4','1491575489088.mp4','1491575489088.jpg',NULL,47),(35,'物理','000008','理学','普通物理全套视频教程','掌握理想气体状态方程。理解气体的状态参量，平衡态，理想气体内能概念。2.理解理想气体的压强和温度的统计解释。\n\n理解能量自由度均分原理; 理解麦克斯韦速率分布律; 了解玻耳兹曼分布律，平均碰撞频率和自由程概念。',NULL,1,'2017-04-07 14:33:33','2017-04-07 14:33:33','台湾国立交通大学 普通物理全套视频教程 共57讲 01_标清.mp4','1491575605216.mp4','1491575605216.jpg',NULL,33),(36,'文学理论','000002','文学','文学理论专题研究视频教程','文学理论是指研究有关文学的本质、特征、发展规律和社会作用的原理、原则的一门学科。是文艺学的一个门类。传统的习惯把文艺学分成三个门类:文学理论、文学史和文学批评。它们都以文学为研究对象，都要求把历史的、现实的文学理论与文学史和逻辑的研究结合起来。文学史重在对文学的历史研究;文学批评重在对文学的现实研究;文学理论则重在对文学作逻辑的研究。从古往今来的文学现象中，找出文学的本质和发展规律，揭示文学的不同形态的特点。',NULL,1,'2017-04-07 14:35:05','2017-04-07 14:35:05','文学理论专题研究视频教程  武汉大学_标清.mp4','1491575703562.mp4','1491575703562.jpg',NULL,31),(37,'中国历史文选','000004','历史学','中国历史文选视频教程','《中国历史文选》是高等学校文科历史专业课程之一，在综合大学和部分师范学院的历史系中已设置多年了。它的主要目的，在于通过各种典型历史作品，培养学生阅读并运用一般文言文史料的能力，也向学生介绍一点有关中国史料学和中国史学发展的常识。',NULL,1,'2017-04-07 14:37:16','2017-04-07 14:37:16','中国历史文选视频教程 全109讲 北京师范大学_标清.mp4','1491575832394.mp4','1491575832394.jpg',NULL,32),(38,'高层建筑结构设计','000011','工学','高层建筑结构设计','内容包括:高层混凝土建筑结构体系与布置、高层建筑的荷载与地震作用、高层建筑结构设计要求与计算原则、框架结构、剪力墙结构、框架一剪力墙结构、简体结构、高级高层建筑结构、混合结构、结构扭转计算、高层建筑结构分析与设计计算机方法的应用。',NULL,1,'2017-04-07 14:39:45','2017-04-07 14:39:45','高层建筑结构设计31 西安建筑科技大学 _标清.mp4','1491575981569.mp4','1491575981569.jpg',NULL,34),(39,'超级坦克','000030','军事学','超级坦克','课程揭示了科技引发了改变了战争的技术革命。',NULL,1,'2017-04-07 14:44:31','2017-04-07 14:44:31','超级坦克.mp4','1491576231904.mp4','1491576231904.jpg',NULL,47),(40,'管理思维导论','000031','管理学','管理思维导论','本课程从管理思维的角度介绍管理学的基本理论与方法，以管理课程为主线，讨论管理的决策、组织、领导、激励以及创新等问题。',NULL,1,'2017-04-07 14:59:05','2017-04-07 14:59:05','管理思维导论.mp4','1491577054128.mp4','1491577054128.jpg',NULL,48),(41,'管理思维的演变','000032','管理学','管理思维的演变','本课程从管理思维的角度介绍管理学的基本理论与方法，以管理课程为主线，讨论管理的决策、组织、领导、激励以及创新等问题。',NULL,1,'2017-04-07 15:02:41','2017-04-07 15:02:41','管理思维的演变.mp4','1491577358370.mp4','1491577358370.jpg',NULL,48),(42,'中国古代管理思想与现代管理思维','000033','管理学','中国古代管理思想与现代管理思维','本课程从管理思维的角度介绍管理学的基本理论与方法，以管理课程为主线，讨论管理的决策、组织、领导、激励以及创新等问题。',NULL,1,'2017-04-07 15:06:13','2017-04-07 15:06:13','中国古代管理思想与现代管理思维.mp4','1491577567188.mp4','1491577567188.jpg',NULL,48);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource`
--

DROP TABLE IF EXISTS `resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource`
--

LOCK TABLES `resource` WRITE;
/*!40000 ALTER TABLE `resource` DISABLE KEYS */;
INSERT INTO `resource` VALUES (1,'add',NULL),(2,'delete',NULL),(3,'query',NULL),(4,'update',NULL);
/*!40000 ALTER TABLE `resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(255) DEFAULT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'管理员'),(2,'教师'),(3,'学生');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_resource`
--

DROP TABLE IF EXISTS `role_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_resource` (
  `role_id` int(11) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  KEY `rid` (`role_id`),
  KEY `mid` (`resource_id`),
  CONSTRAINT `mid` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`),
  CONSTRAINT `rid` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_resource`
--

LOCK TABLES `role_resource` WRITE;
/*!40000 ALTER TABLE `role_resource` DISABLE KEYS */;
INSERT INTO `role_resource` VALUES (1,1),(1,2),(1,3),(1,4),(2,1),(2,3);
/*!40000 ALTER TABLE `role_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_course`
--

DROP TABLE IF EXISTS `student_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_course` (
  `student_id` int(11) NOT NULL COMMENT '学生编号',
  `course_id` int(11) NOT NULL COMMENT '课程编号',
  `is_collect` int(1) DEFAULT '0' COMMENT '是否收藏 1是 0 否',
  `is_join` int(1) DEFAULT '0' COMMENT '是否参加 1是 0否',
  `total_time` int(11) DEFAULT '0' COMMENT '观看的总时间(分钟为单位)',
  UNIQUE KEY `index_student_course` (`student_id`,`course_id`) USING BTREE COMMENT '唯一索引'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_course`
--

LOCK TABLES `student_course` WRITE;
/*!40000 ALTER TABLE `student_course` DISABLE KEYS */;
INSERT INTO `student_course` VALUES (1,1,0,0,0),(1,2,0,0,0),(1,3,1,1,0),(1,4,0,1,0),(1,5,1,1,0),(1,6,0,1,0),(1,21,0,0,0),(2,1,0,1,0),(2,22,0,1,0),(2,23,0,1,1),(2,27,NULL,1,NULL),(2,38,NULL,1,NULL),(11,21,1,0,NULL),(11,23,0,1,NULL),(11,24,0,1,NULL),(19,21,0,1,0),(20,20,0,1,0),(20,22,0,0,0),(20,23,0,1,11),(20,24,0,1,NULL),(23,25,NULL,1,NULL),(23,36,NULL,1,NULL),(31,25,NULL,1,NULL),(31,36,NULL,1,NULL),(32,26,NULL,1,NULL),(32,37,NULL,1,NULL),(33,28,NULL,1,NULL),(33,35,NULL,1,NULL),(34,27,NULL,1,NULL),(34,38,NULL,1,NULL),(35,27,0,1,2),(41,29,NULL,1,NULL),(41,30,NULL,1,NULL),(41,31,NULL,1,NULL),(46,29,NULL,1,NULL),(46,30,NULL,1,NULL),(46,31,NULL,1,NULL),(47,32,NULL,1,NULL),(47,33,NULL,1,NULL),(47,34,NULL,1,NULL),(47,39,NULL,1,NULL),(48,40,NULL,1,NULL),(48,41,NULL,1,NULL),(48,42,NULL,1,NULL),(49,25,1,0,0),(49,29,NULL,1,NULL),(49,30,NULL,1,NULL),(49,31,NULL,1,NULL),(49,37,1,0,0),(49,42,1,1,5),(50,36,NULL,1,NULL),(51,37,NULL,1,NULL),(52,28,NULL,1,NULL),(52,35,NULL,1,NULL),(53,32,NULL,1,NULL),(53,33,NULL,1,NULL),(53,34,NULL,1,NULL),(53,39,NULL,1,NULL),(54,38,NULL,1,NULL),(55,37,1,0,0),(55,38,1,1,0),(55,39,0,1,0),(55,40,NULL,1,NULL),(55,41,1,1,NULL),(55,42,1,1,NULL);
/*!40000 ALTER TABLE `student_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(32) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `name` varchar(32) DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(32) DEFAULT NULL COMMENT '手机号',
  `office_phone` varchar(32) DEFAULT NULL COMMENT '座机号（未用）',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `depart` varchar(32) DEFAULT NULL COMMENT '部门（未用）',
  `major` varchar(32) DEFAULT NULL COMMENT '专业',
  `sex` int(1) DEFAULT '0' COMMENT '姓名 男0女1',
  `status` int(1) DEFAULT '1' COMMENT '状态 0禁用 1启用  （未用）',
  `description` text COMMENT '描述',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `index_username` (`username`) USING BTREE COMMENT '用户名唯一'
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'admin','123456','管理员','18553269860',NULL,'654316301@qq.com',NULL,'工学',0,1,'我是管理员'),(22,'wangyh','123456','王云慧','15165111850',NULL,'957876856@qq.com',NULL,'哲学',1,1,'管理员：王云慧，负责专业：哲学、经济学、法学、教育学'),(23,'xuyf','123456','徐燕飞','15864266239',NULL,'yezi951106@163.com',NULL,'文学',1,1,'管理员：徐燕飞 负责专业：文学、历史学、理学、工学'),(25,'nongfu','123456','农老师','15688592728',NULL,'798571454@qq.com',NULL,'哲学',1,1,'农老师，哲学老师，任教于山东师范大学哲学系'),(26,'shanquan','123456','桑老师','15588609872',NULL,'776789421@qq.com',NULL,'经济学',1,1,'桑老师，经济学老师，任教于山东财经大学'),(27,'lishan','123456','李老师','15588996311',NULL,'13489880@qq.com',NULL,'法学',1,1,'李老师，任教于山东师范大学'),(28,'yang','123456','杨老师','13555332511',NULL,'798789645@qq.com',NULL,'教育学',1,1,'杨老师，任教于山东农财经大学'),(31,'sdq12345','123456','司老师','13966878392',NULL,'878643599@qq.com',NULL,'文学',1,1,'文学共享，让知识融通'),(32,'ly5857','123456','李老师','15689023498',NULL,'liyunnan@163.com',NULL,'历史学',0,1,''),(33,'s28888','123456','孙老师','13542988988',NULL,'969328113@qq.com',NULL,'理学',0,1,''),(34,'nilan90','123456','倪老师','18674325683',NULL,'673290876@qq.com',NULL,'工学',0,1,''),(35,'licqaz','123456','李','13234567890',NULL,'12345667@qq.com',NULL,'哲学',1,1,'哲学系学生'),(36,'sunb','123456','孙','13245675432',NULL,'98765432@qq.com',NULL,'经济学',1,1,'孙，经济学学生'),(41,'liuyq','123456','刘叶青','15864266239',NULL,'yezi951106@163.com',NULL,'农学',1,1,'管理员：刘叶青 负责专业：农学、军事学、管理学'),(42,'mannk','123456','马','13454321245',NULL,'34567823@qq.com',NULL,'法学',1,1,'法学学士'),(43,'yangas','123456','yang','13456789012',NULL,'76543234@qq.com',NULL,'教育学',1,1,'教育学学生'),(46,'liuq','123456','刘青老师','13953197061',NULL,'yezi951106@163.com',NULL,'农学',1,1,'刘青老师，农学毕业，目前在山东农业大学任教。'),(47,'wangy','123456','王玉老师','15864266239',NULL,'1785562390@qq.com',NULL,'军事学',0,1,'王玉老师，曾当兵10年，目前在军事学院任教。'),(48,'zhangx','123456','张旭老师','13953197061',NULL,'1785562390@qq.com',NULL,'管理学',0,1,'张旭老师，36岁，目前在山东财经大学任教，主要教管理学。'),(49,'zhangh','123456','张晗','13868467849',NULL,'36477486@qq.com',NULL,'农学',1,1,'张晗，爱好园艺，喜欢在家摆弄花花草草。'),(50,'lin0011','123456','林建','15692100231',NULL,'782309214@qq.com',NULL,'文学',0,1,''),(51,'qqq11','123456','青青','13982168239',NULL,'qingqing@126.com',NULL,'历史学',1,1,''),(52,'0102wma','123456','王思安','15982322918',NULL,'232873491@qq.com',NULL,'理学',1,1,''),(53,'hanx','123456','韩笑','13867657798',NULL,'23647623@qq.com',NULL,'军事学',1,1,'韩笑，热爱军事学，是个军事迷。'),(54,'lader12','123456','孙允','13572918823',NULL,'1012398711@qq.com',NULL,'工学',0,1,''),(55,'mengy','123456','孟宇','15894638475',NULL,'7637486@qq.com',NULL,'管理学',1,1,'孟宇，目前在山东财经大学读大三。');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL COMMENT '用户编号',
  `role_id` int(11) NOT NULL COMMENT '角色编号',
  KEY `u_fk` (`user_id`),
  KEY `r_fk` (`role_id`),
  CONSTRAINT `r_fk` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `u_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (2,1),(22,1),(23,1),(25,2),(26,2),(27,2),(28,2),(31,2),(32,2),(33,2),(34,2),(35,3),(36,3),(41,1),(42,3),(43,3),(46,2),(47,2),(48,2),(49,3),(50,3),(51,3),(52,3),(53,3),(54,3),(55,3);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-27  7:26:19
