/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : hxdy

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-05-08 01:12:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `category_no` varchar(20) NOT NULL,
  `preview` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `parent_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', 'php', '1', '', '2017-05-07 23:30:07', '0000-00-00 00:00:00', '0');
INSERT INTO `category` VALUES ('2', 'java', '2', '', '2017-05-07 23:30:08', '0000-00-00 00:00:00', '0');
INSERT INTO `category` VALUES ('3', 'javascript', '3', '', '2017-05-07 23:30:08', '0000-00-00 00:00:00', '0');
INSERT INTO `category` VALUES ('4', 'laravle', '1', '', '2017-05-07 23:30:31', '0000-00-00 00:00:00', '1');
INSERT INTO `category` VALUES ('5', 'thinkphp', '2', '', '2017-05-07 23:30:32', '0000-00-00 00:00:00', '1');
INSERT INTO `category` VALUES ('6', 'yii', '3', '', '2017-05-07 23:30:35', '0000-00-00 00:00:00', '1');
INSERT INTO `category` VALUES ('7', 'node.js', '1', '', '2017-05-07 23:30:37', '0000-00-00 00:00:00', '3');
INSERT INTO `category` VALUES ('8', 'react.js', '2', '', '2017-05-07 23:30:38', '0000-00-00 00:00:00', '3');
INSERT INTO `category` VALUES ('9', 'angular.js', '3', '', '2017-05-07 23:30:38', '0000-00-00 00:00:00', '3');
INSERT INTO `category` VALUES ('10', 'java base', '1', '', '2017-05-07 23:30:40', '0000-00-00 00:00:00', '2');
INSERT INTO `category` VALUES ('11', 'java web', '1', '', '2017-05-07 23:30:42', '0000-00-00 00:00:00', '2');

-- ----------------------------
-- Table structure for `member`
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(16) NOT NULL DEFAULT '',
  `phone` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `email` varchar(100) NOT NULL DEFAULT '',
  `active` int(1) NOT NULL DEFAULT '0' COMMENT '邮箱是否激活0没有激活，1激活',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('1', '', '', 'e10adc3949ba59abbe56e057f20f883e', '2017-05-07 16:16:06', '2017-05-07 16:16:06', '573358951@qq.com', '0');
INSERT INTO `member` VALUES ('6', '', '18232496759', 'e10adc3949ba59abbe56e057f20f883e', '2017-05-07 16:54:42', '2017-05-07 16:54:42', '', '0');

-- ----------------------------
-- Table structure for `pdt_content`
-- ----------------------------
DROP TABLE IF EXISTS `pdt_content`;
CREATE TABLE `pdt_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `content` text,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pdt_content
-- ----------------------------

-- ----------------------------
-- Table structure for `pdt_images`
-- ----------------------------
DROP TABLE IF EXISTS `pdt_images`;
CREATE TABLE `pdt_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `image_path` varchar(200) NOT NULL,
  `image_no` varchar(200) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pdt_images
-- ----------------------------

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `summary` varchar(200) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `preview` varchar(200) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------

-- ----------------------------
-- Table structure for `temp_email`
-- ----------------------------
DROP TABLE IF EXISTS `temp_email`;
CREATE TABLE `temp_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(32) NOT NULL DEFAULT '',
  `deadline` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='邮箱验证码';

-- ----------------------------
-- Records of temp_email
-- ----------------------------
INSERT INTO `temp_email` VALUES ('1', '1', '741e04df8f82586d6efa9962373c2fe6', '2017-05-09 09:16:06');
INSERT INTO `temp_email` VALUES ('2', '2', '64eb6dbc17f5ddc3aa46dca777deefb3', '2017-05-09 09:17:05');
INSERT INTO `temp_email` VALUES ('3', '3', '63497a78ded3da03c95e59756496e63f', '2017-05-09 09:30:46');
INSERT INTO `temp_email` VALUES ('4', '4', 'd6f2eebacfe035e272bf23778b1f1ffb', '2017-05-09 09:44:11');
INSERT INTO `temp_email` VALUES ('5', '5', '0e92605cae279d141320be4c843e0735', '2017-05-09 09:46:41');

-- ----------------------------
-- Table structure for `temp_phone`
-- ----------------------------
DROP TABLE IF EXISTS `temp_phone`;
CREATE TABLE `temp_phone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) NOT NULL,
  `code` int(11) NOT NULL,
  `deadline` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '验证码有效期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of temp_phone
-- ----------------------------
INSERT INTO `temp_phone` VALUES ('1', '18232496759', '2893', '2017-05-07 17:54:23');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` char(32) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
