/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50632
Source Host           : localhost:3306
Source Database       : awesome

Target Server Type    : MYSQL
Target Server Version : 50632
File Encoding         : 65001

Date: 2017-03-11 12:05:22
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
  `create_date` timestamp NULL DEFAULT COMMENT '创建时间',
  `update_date` timestamp NULL DEFAULT COMMENT '更新时间',
  `video_url` varchar(255) DEFAULT NULL COMMENT '视频路径',
  `video_type` int(1) DEFAULT NULL COMMENT '视频类型（1、本地上传视频 2、在线视频）',
  `teacher` int(11) DEFAULT NULL COMMENT '所属教师',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '教师');
INSERT INTO `role` VALUES ('2', '学生');

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
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'root', '123', null, null, null, null, null, null, '0', '1');
INSERT INTO `user` VALUES ('2', 'admin', '222', null, null, null, null, null, null, '0', '1');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
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
