/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50632
Source Host           : localhost:3306
Source Database       : awesome

Target Server Type    : MYSQL
Target Server Version : 50632
File Encoding         : 65001

Date: 2017-03-14 22:50:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '课程名',
  `code` varchar(32) DEFAULT NULL COMMENT '课程代号',
  `profession` varchar(32) DEFAULT NULL COMMENT '所属专业',
  `remark` varchar(255) DEFAULT NULL COMMENT '课程描述',
  `content` text COMMENT '课程内容',
  `credit` int(11) DEFAULT NULL COMMENT '学分',
  `status` int(1) DEFAULT '1' COMMENT '状态 0禁用1启用',
  `create_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `video_url` varchar(255) DEFAULT NULL COMMENT '视频路径',
  `video_name` varchar(255) DEFAULT NULL COMMENT '视频名称',
  `video_type` int(1) DEFAULT NULL COMMENT '视频类型（1、本地上传视频 2、在线视频）',
  `teacher` int(11) DEFAULT NULL COMMENT '所属教师',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '课程2', '22', '工学', '英语学习', '英语学习', null, '1', '2017-03-14 22:36:15', '2017-03-14 22:36:15', '1489502123190', '多模块的 Spring MVC + Spring + Mybatis 讲解（基于 IntelliJ IDEA）.mp4', null, null);

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
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
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `is_collect` int(1) DEFAULT '0' COMMENT '是否收藏 1是 0 否',
  `is_join` int(1) DEFAULT '0' COMMENT '是否参加 1是 0否',
  UNIQUE KEY `index_student_course` (`student_id`,`course_id`) USING BTREE COMMENT '唯一索引'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_course
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(32) DEFAULT NULL COMMENT '手机号',
  `office_phone` varchar(32) DEFAULT NULL COMMENT '座机号',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `depart` varchar(32) DEFAULT NULL COMMENT '部门',
  `major` varchar(32) DEFAULT NULL COMMENT '专业',
  `sex` int(1) DEFAULT '0' COMMENT '姓名 男0女1',
  `status` int(1) DEFAULT '1' COMMENT '状态 0禁用 1启用',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `index_username` (`username`) USING BTREE COMMENT '用户名唯一'
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'root', '123', null, null, null, null, null, '理学', '0', '1');
INSERT INTO `user` VALUES ('2', 'admin', '222', '管理员', '18553269860', null, '654316301@qq.com', null, '工学', '0', '1');
INSERT INTO `user` VALUES ('5', 'fxw', '111', 'ambilight', '18522211', null, '342323@qq.com', null, '农学', '1', '1');
INSERT INTO `user` VALUES ('6', 'fxw2', '111111111111111', 'ambilight1111111', '185532698601111', null, '342323@qq.com', null, '医学', '0', '1');
INSERT INTO `user` VALUES ('7', 'fxw3', '123', 'ambilight', '18522211', null, '342323@qq.com', null, '1', '1', '1');
INSERT INTO `user` VALUES ('8', 'fxw4', '123', 'ambilight', '18522211', null, '342323@qq.com', null, '农学', '1', '1');
INSERT INTO `user` VALUES ('9', 'fxw5', '123', 'ambilight', '18522211', null, '342323@qq.com', null, '1', '1', '1');
INSERT INTO `user` VALUES ('10', 'fxw6', '123', 'ambilight', '18522211', null, '342323@qq.com', null, '1', '1', '1');
INSERT INTO `user` VALUES ('11', 'fxw7', '123', 'ambilight', '18522211', null, '342323@qq.com', null, '', '1', '1');
INSERT INTO `user` VALUES ('12', 'fxw123456', '123456', '', '18522211', null, '342323@qq.com', null, '工学', '1', '1');
INSERT INTO `user` VALUES ('13', 'fxw9', '123', 'ambilight', '18522211', null, '342323@qq.com', null, '1', '1', '1');
INSERT INTO `user` VALUES ('14', 'fxw10', '123', 'ambilight', '18522211', null, '342323@qq.com', null, '艺术学', '1', '1');
INSERT INTO `user` VALUES ('16', 'asfdas', '1231', '1231311', '11', null, '1112', null, '农学', '0', '1');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  KEY `u_fk` (`user_id`),
  KEY `r_fk` (`role_id`),
  CONSTRAINT `r_fk` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `u_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1');
INSERT INTO `user_role` VALUES ('2', '2');
INSERT INTO `user_role` VALUES ('5', '1');
INSERT INTO `user_role` VALUES ('5', '2');
INSERT INTO `user_role` VALUES ('11', '3');
INSERT INTO `user_role` VALUES ('12', '2');
