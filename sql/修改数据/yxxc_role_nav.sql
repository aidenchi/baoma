/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : demo5

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2014-12-23 18:33:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `yxxc_role_nav`
-- ----------------------------
DROP TABLE IF EXISTS `yxxc_role_nav`;
CREATE TABLE `yxxc_role_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yxxc_role_nav
-- ----------------------------
INSERT INTO `yxxc_role_nav` VALUES ('1', '首页', '0', '1', '1');
INSERT INTO `yxxc_role_nav` VALUES ('3', '系统设置', '0', '1', '10');
INSERT INTO `yxxc_role_nav` VALUES ('5', '前端设置', '0', '1', '5');
INSERT INTO `yxxc_role_nav` VALUES ('6', '商品管理', '0', '1', '3');
INSERT INTO `yxxc_role_nav` VALUES ('7', '论坛管理', '0', '1', '4');
INSERT INTO `yxxc_role_nav` VALUES ('8', '订单管理', '0', '0', '6');
INSERT INTO `yxxc_role_nav` VALUES ('10', '短信邮件', '0', '0', '7');
INSERT INTO `yxxc_role_nav` VALUES ('12', '店铺管理', '0', '1', '2');
