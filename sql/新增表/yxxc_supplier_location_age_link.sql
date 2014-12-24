/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : demo5

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2014-12-23 18:35:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `yxxc_supplier_location_age_link`
-- ----------------------------
DROP TABLE IF EXISTS `yxxc_supplier_location_age_link`;
CREATE TABLE `yxxc_supplier_location_age_link` (
  `location_id` int(11) NOT NULL,
  `age_id` int(11) NOT NULL,
  PRIMARY KEY (`location_id`,`age_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yxxc_supplier_location_age_link
-- ----------------------------
INSERT INTO `yxxc_supplier_location_age_link` VALUES ('25', '5');
INSERT INTO `yxxc_supplier_location_age_link` VALUES ('26', '4');
INSERT INTO `yxxc_supplier_location_age_link` VALUES ('27', '5');
