/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50632
Source Host           : localhost:3306
Source Database       : awesome

Target Server Type    : MYSQL
Target Server Version : 50632
File Encoding         : 65001

Date: 2017-04-04 10:40:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('2', '英语', '222', '医学', '大家在前端Javascript开发中会遇到处理日期时间的问题，经常会拿来一大堆处理函数才能完成一个简单    的日期时间显示效果。今天我给大家介绍，使用它可以轻松解决前端开发中遇到的种种日期时间问题。', '大家在前端Javascript开发中会遇到处理日期时间的问题，经常会拿来一大堆处理函数才能完成一个简单的日期时间显示效果。今天我给大家介绍一个轻量级的Javascript日期处理类库：moment.js，使用它可以轻松解决前端开发中遇到的种种日期时间问题。', null, '1', '2017-03-18 12:35:58', '2017-03-18 12:35:58', '1489502123190.mp4', '1489586809783.mp4', '1489541931163.jpg', null, '5');
INSERT INTO `course` VALUES ('3', '计算机科学与技术', '222', '理学', '计算机专业涵盖软件工程专业，主要培养具有良好的科学素养，系统地、较好地掌握计算机科学与技术包括计算机硬件、软件与应用的基本理论、基本知识和基本技能与方法，能在科研部..', '计算机专业涵盖软件工程专业，主要培养具有良好的科学素养，系统地、较好地掌握计算机科学与技术包括计算机硬件、软件与应用的基本理论、基本知识和基本技能与方法，能在科研部..', null, '1', '2017-03-18 12:36:46', '2017-03-18 12:36:46', '多模块的 Spring MVC + Spring + Mybatis 讲解（基于 IntelliJ IDEA）.mp4', '1489586809783.mp4', '1489545247016.jpg', null, '2');
INSERT INTO `course` VALUES ('4', '测试', '22', '农学', '本届晚会主题为“用责任汇聚诚信的力量”，继续发挥“维护市场经济秩序，打假维权”的主要任务，扶优逐劣，净化消优逐劣，净化消优逐劣，净化消优逐费市场，弘扬新国货，提振消费信心，为供给侧改革的推进保驾护航。', '本届晚会主题为“用责任汇聚诚信的力量”，继续发挥“维护市场经济秩序，打假维权”的主要任务，扶优逐劣，净化消费市场，弘扬新国货，提振消费信心，为供给侧改革的推进保驾护航。', null, '1', '2017-03-18 12:35:59', '2017-03-18 12:35:59', '2222222222.mp4', '1489586809783.mp4', '', null, '5');
INSERT INTO `course` VALUES ('5', '英语课', '222', '艺术学', '本届晚会主题为“用责任汇聚诚信的力量”，继续发挥“维护市场经济秩序，打假维权”的主要任务，扶优逐劣，净化消费市场，弘扬新国货，提振消费信心，为供给侧改革的推进保驾护航。', '本届晚会主题为“用责任汇聚诚信的力量”，继续发挥“维护市场经济秩序，打假维权”的主要任务，扶优逐劣，净化消费市场，弘扬新国货，提振消费信心，为供给侧改革的推进保驾护航。', null, '1', '2017-03-18 12:51:45', '2017-03-18 12:51:45', '多模块的 Spring MVC + Spring + Mybatis 讲解（基于 IntelliJ IDEA）.mp4', '1489586809783.mp4', '1489585921385.jpg', null, '2');
INSERT INTO `course` VALUES ('6', '地理课', '111', '农学', '一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十', 'where 元素知道只有在一个以上的if条件有值的情况下才去插入“WHERE”子句。而且，若最后的内容是“AND”或“OR”开头的，where 元素也知道如何将他们去除。\n\n如果 where 元素没有按正常套路出牌，我们还是可以通过自定义 trim 元素来定制我们想要的功能。比如，和 where 元素等价的自定义 trim 元素为：', null, '1', '2017-03-18 12:36:02', '2017-03-18 12:36:02', '2222222222.mp4', '1489586809783.mp4', '1489586809783.jpg', null, '5');
INSERT INTO `course` VALUES ('7', '课程2', '22', '工学', '英语学习', '英语学习', null, '1', '2017-03-09 13:01:03', '2017-03-18 13:01:03', '多模块的 Spring MVC + Spring + Mybatis 讲解（基于 IntelliJ IDEA）.mp4', '1489586809783.mp4', '1489502123190.jpg', null, '2');
INSERT INTO `course` VALUES ('8', '课程2', '22', '工学', '英语学习', '英语学习', null, '1', '2017-03-09 13:01:03', '2017-03-18 13:01:03', '多模块的 Spring MVC + Spring + Mybatis 讲解（基于 IntelliJ IDEA）.mp4', '1489586809783.mp4', '1489502123190.jpg', null, '2');
INSERT INTO `course` VALUES ('9', '课程2', '22', '工学', '英语学习', '英语学习', null, '1', '2017-03-09 13:01:03', '2017-03-18 13:01:03', '多模块的 Spring MVC + Spring + Mybatis 讲解（基于 IntelliJ IDEA）.mp4', '1489586809783.mp4', '1489502123190.jpg', null, '2');
INSERT INTO `course` VALUES ('10', '课程2', '22', '工学', '英语学习', '英语学习', null, '1', '2017-03-09 13:01:03', '2017-03-18 13:01:03', '多模块的 Spring MVC + Spring + Mybatis 讲解（基于 IntelliJ IDEA）.mp4', '1489586809783.mp4', '1489502123190.jpg', null, '2');
INSERT INTO `course` VALUES ('11', '课程2', '22', '工学', '英语学习', '英语学习', null, '1', '2017-03-09 13:01:03', '2017-03-18 13:01:03', '多模块的 Spring MVC + Spring + Mybatis 讲解（基于 IntelliJ IDEA）.mp4', '1489586809783.mp4', '1489502123190.jpg', null, '2');
INSERT INTO `course` VALUES ('12', '课程2', '22', '工学', '英语学习', '英语学习', null, '1', '2017-03-09 13:01:03', '2017-03-18 13:01:03', '多模块的 Spring MVC + Spring + Mybatis 讲解（基于 IntelliJ IDEA）.mp4', '1489586809783.mp4', '1489502123190.jpg', null, '2');
INSERT INTO `course` VALUES ('13', '课程2', '22', '工学', '英语学习', '英语学习', null, '1', '2017-03-09 13:01:03', '2017-03-18 13:01:03', '多模块的 Spring MVC + Spring + Mybatis 讲解（基于 IntelliJ IDEA）.mp4', '1489586809783.mp4', '1489502123190.jpg', null, '2');
INSERT INTO `course` VALUES ('14', '课程2', '22', '工学', '英语学习', '英语学习', null, '1', '2017-03-09 13:01:03', '2017-03-18 13:01:03', '多模块的 Spring MVC + Spring + Mybatis 讲解（基于 IntelliJ IDEA）.mp4', '1489586809783.mp4', '1489502123190.jpg', null, '2');
INSERT INTO `course` VALUES ('15', '课程2', '22', '工学', '英语学习', '英语学习', null, '1', '2017-03-09 13:01:03', '2017-03-18 13:01:03', '多模块的 Spring MVC + Spring + Mybatis 讲解（基于 IntelliJ IDEA）.mp4', '1489586809783.mp4', '1489502123190.jpg', null, '2');
INSERT INTO `course` VALUES ('16', '课程2', '22', '工学', '英语学习', '英语学习', null, '1', '2017-03-09 13:01:03', '2017-03-18 13:01:03', '多模块的 Spring MVC + Spring + Mybatis 讲解（基于 IntelliJ IDEA）.mp4', '1489586809783.mp4', '1489502123190.jpg', null, '2');
INSERT INTO `course` VALUES ('17', '课程2', '22', '工学', '英语学习', '英语学习', null, '1', '2017-03-09 13:01:03', '2017-03-18 13:01:03', '多模块的 Spring MVC + Spring + Mybatis 讲解（基于 IntelliJ IDEA）.mp4', '1489586809783.mp4', '1489502123190.jpg', null, '2');
INSERT INTO `course` VALUES ('18', '课程2', '22', '工学', '英语学习', '英语学习', null, '1', '2017-03-09 13:01:03', '2017-03-18 13:01:03', '多模块的 Spring MVC + Spring + Mybatis 讲解（基于 IntelliJ IDEA）.mp4', '1489586809783.mp4', '1489502123190.jpg', null, '2');
INSERT INTO `course` VALUES ('19', '课程2', '22', '工学', '英语学习', '英语学习', null, '1', '2017-03-09 13:01:03', '2017-03-18 13:01:03', '多模块的 Spring MVC + Spring + Mybatis 讲解（基于 IntelliJ IDEA）.mp4', '1489586809783.mp4', '1489502123190.jpg', null, '2');
INSERT INTO `course` VALUES ('21', '物理课', '123345', '农学', '1231111111111111111111111111111111111111111111', '阿斯顿发生的发的发', null, '1', '2017-03-26 19:39:20', '2017-04-02 15:24:37', '多模块的 Spring MVC + Spring + Mybatis 讲解（基于 IntelliJ IDEA）.mp4', '1491117870060.mp4', '1491117870060.jpg', null, '1');
INSERT INTO `course` VALUES ('23', '英语学习', '123456', '理学', 'yingyu', '多模块的 Spring MVC + Spring + Mybatis 讲解（基于 IntelliJ IDEA）.mp4多模块的 Spring MVC + Spring + Mybatis 讲解（基于 IntelliJ IDEA）.mp4多模块的 Spring MVC + Spring + Mybatis 讲解（基于 IntelliJ IDEA）.mp4多模块的 Spring MVC + Spring + Mybatis 讲解（基于 IntelliJ IDEA）.mp4多模块的 Spring MVC + Spring + Mybatis 讲解（基于 IntelliJ IDEA）.mp4', null, '1', '2017-04-02 14:44:54', '2017-04-02 14:44:54', '多模块的 Spring MVC + Spring + Mybatis 讲解（基于 IntelliJ IDEA）.mp4', '1491115446934.mp4', '1491115446934.jpg', null, '1');

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES ('1', 'add', null);
INSERT INTO `resource` VALUES ('2', 'delete', null);
INSERT INTO `resource` VALUES ('3', 'query', null);
INSERT INTO `resource` VALUES ('4', 'update', null);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(255) DEFAULT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '管理员');
INSERT INTO `role` VALUES ('2', '教师');
INSERT INTO `role` VALUES ('3', '学生');

-- ----------------------------
-- Table structure for role_resource
-- ----------------------------
DROP TABLE IF EXISTS `role_resource`;
CREATE TABLE `role_resource` (
  `role_id` int(11) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  KEY `rid` (`role_id`),
  KEY `mid` (`resource_id`),
  CONSTRAINT `mid` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`),
  CONSTRAINT `rid` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_resource
-- ----------------------------
INSERT INTO `role_resource` VALUES ('1', '1');
INSERT INTO `role_resource` VALUES ('1', '2');
INSERT INTO `role_resource` VALUES ('1', '3');
INSERT INTO `role_resource` VALUES ('1', '4');
INSERT INTO `role_resource` VALUES ('2', '1');
INSERT INTO `role_resource` VALUES ('2', '3');

-- ----------------------------
-- Table structure for student_course
-- ----------------------------
DROP TABLE IF EXISTS `student_course`;
CREATE TABLE `student_course` (
  `student_id` int(11) NOT NULL COMMENT '学生编号',
  `course_id` int(11) NOT NULL COMMENT '课程编号',
  `is_collect` int(1) DEFAULT '0' COMMENT '是否收藏 1是 0 否',
  `is_join` int(1) DEFAULT '0' COMMENT '是否参加 1是 0否',
  `total_time` int(11) DEFAULT '0' COMMENT '观看的总时间(分钟为单位)',
  UNIQUE KEY `index_student_course` (`student_id`,`course_id`) USING BTREE COMMENT '唯一索引'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_course
-- ----------------------------
INSERT INTO `student_course` VALUES ('1', '1', '0', '0', '0');
INSERT INTO `student_course` VALUES ('1', '2', '0', '0', '0');
INSERT INTO `student_course` VALUES ('1', '3', '1', '1', '0');
INSERT INTO `student_course` VALUES ('1', '4', '0', '1', '0');
INSERT INTO `student_course` VALUES ('1', '5', '1', '1', '0');
INSERT INTO `student_course` VALUES ('1', '6', '0', '1', '0');
INSERT INTO `student_course` VALUES ('1', '21', '0', '0', '0');
INSERT INTO `student_course` VALUES ('2', '1', '0', '1', '0');
INSERT INTO `student_course` VALUES ('2', '22', '0', '1', '0');
INSERT INTO `student_course` VALUES ('2', '23', '0', '1', '0');
INSERT INTO `student_course` VALUES ('19', '21', '0', '1', '0');
INSERT INTO `student_course` VALUES ('20', '20', '0', '1', '0');
INSERT INTO `student_course` VALUES ('20', '22', '0', '0', '0');
INSERT INTO `student_course` VALUES ('20', '23', '0', '1', '11');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'root', '123456', '王老师', '18553269680', null, '23232@qq.com', null, '理学', '0', '1', 'Ta是王老师');
INSERT INTO `user` VALUES ('2', 'admin', '123456', '管理员', '18553269860', null, '654316301@qq.com', null, '工学', '0', '1', '我是管理员');
INSERT INTO `user` VALUES ('5', 'fxw', '111', 'ambilight', '18522211', null, '342323@qq.com', null, '农学', '1', '1', null);
INSERT INTO `user` VALUES ('6', 'fxw2', '111111111111111', 'ambilight1111111', '185532698601111', null, '342323@qq.com', null, '医学', '0', '1', null);
INSERT INTO `user` VALUES ('7', 'fxw3', '123', 'ambilight', '18522211', null, '342323@qq.com', null, '1', '1', '1', null);
INSERT INTO `user` VALUES ('8', 'fxw4', '123', 'ambilight', '18522211', null, '342323@qq.com', null, '农学', '1', '1', null);
INSERT INTO `user` VALUES ('9', 'fxw5', '123', 'ambilight', '18522211', null, '342323@qq.com', null, '1', '1', '1', null);
INSERT INTO `user` VALUES ('10', 'fxw6', '123', 'ambilight', '18522211', null, '342323@qq.com', null, '1', '1', '1', null);
INSERT INTO `user` VALUES ('11', 'fxw7', '123', 'ambilight', '18522211', null, '342323@qq.com', null, '', '1', '1', null);
INSERT INTO `user` VALUES ('12', 'fxw123456', '123456', '', '18522211', null, '342323@qq.com', null, '工学', '1', '1', null);
INSERT INTO `user` VALUES ('13', 'fxw9', '123', 'ambilight', '18522211', null, '342323@qq.com', null, '1', '1', '1', null);
INSERT INTO `user` VALUES ('14', 'fxw10', '123', 'ambilight', '18522211', null, '342323@qq.com', null, '艺术学', '1', '1', null);
INSERT INTO `user` VALUES ('16', 'asfdas', '1231', '1231311', '11', null, '1112', null, '农学', '0', '1', null);
INSERT INTO `user` VALUES ('19', 'admin1', '123456', '123', '18553269860', null, '654316301@qq.com', null, '工学', '0', '1', null);
INSERT INTO `user` VALUES ('20', 'test2', '123456', '学生1', '18553269860', null, '654316301@qq.com', null, '农学', '0', '1', null);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL COMMENT '用户编号',
  `role_id` int(11) NOT NULL COMMENT '角色编号',
  KEY `u_fk` (`user_id`),
  KEY `r_fk` (`role_id`),
  CONSTRAINT `r_fk` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `u_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('5', '1');
INSERT INTO `user_role` VALUES ('5', '2');
INSERT INTO `user_role` VALUES ('11', '3');
INSERT INTO `user_role` VALUES ('12', '2');
INSERT INTO `user_role` VALUES ('2', '1');
INSERT INTO `user_role` VALUES ('19', '3');
INSERT INTO `user_role` VALUES ('1', '2');
INSERT INTO `user_role` VALUES ('20', '3');
