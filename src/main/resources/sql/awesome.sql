/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50632
Source Host           : localhost:3306
Source Database       : awesome

Target Server Type    : MYSQL
Target Server Version : 50632
File Encoding         : 65001

Date: 2017-03-09 13:48:05
*/

SET FOREIGN_KEY_CHECKS=0;

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
INSERT INTO `role` VALUES ('1', 'admin');
INSERT INTO `role` VALUES ('2', 'customer');

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
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'root', '123');
INSERT INTO `user` VALUES ('2', 'admin', '222');

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
