/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : demo5

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2014-12-23 18:34:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `yxxc_supplier_location_age`
-- ----------------------------
DROP TABLE IF EXISTS `yxxc_supplier_location_age`;
CREATE TABLE `yxxc_supplier_location_age` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_effect` tinyint(11) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yxxc_supplier_location_age
-- ----------------------------
INSERT INTO `yxxc_supplier_location_age` VALUES ('4', '0-6月', '1', '7');
INSERT INTO `yxxc_supplier_location_age` VALUES ('5', '6-12月', '1', '6');
INSERT INTO `yxxc_supplier_location_age` VALUES ('6', '1-2岁', '1', '5');
INSERT INTO `yxxc_supplier_location_age` VALUES ('7', '2-3岁', '1', '4');
INSERT INTO `yxxc_supplier_location_age` VALUES ('8', '3-4岁', '1', '3');
INSERT INTO `yxxc_supplier_location_age` VALUES ('9', '4-6岁', '1', '2');
INSERT INTO `yxxc_supplier_location_age` VALUES ('10', '6-9岁', '1', '1');
