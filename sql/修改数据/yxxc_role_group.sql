/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : demo5

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2014-12-23 18:33:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `yxxc_role_group`
-- ----------------------------
DROP TABLE IF EXISTS `yxxc_role_group`;
CREATE TABLE `yxxc_role_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `nav_id` int(11) NOT NULL COMMENT '后台导航分组ID',
  `is_delete` tinyint(1) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yxxc_role_group
-- ----------------------------
INSERT INTO `yxxc_role_group` VALUES ('1', '首页', '1', '0', '1', '1');
INSERT INTO `yxxc_role_group` VALUES ('34', '分类', '12', '0', '1', '14');
INSERT INTO `yxxc_role_group` VALUES ('5', '系统设置', '3', '0', '1', '1');
INSERT INTO `yxxc_role_group` VALUES ('7', '管理员', '3', '0', '1', '2');
INSERT INTO `yxxc_role_group` VALUES ('8', '数据库操作', '3', '0', '1', '6');
INSERT INTO `yxxc_role_group` VALUES ('9', '系统日志', '3', '0', '1', '7');
INSERT INTO `yxxc_role_group` VALUES ('10', '文章管理', '5', '0', '1', '8');
INSERT INTO `yxxc_role_group` VALUES ('11', '文章分类管理', '5', '0', '1', '9');
INSERT INTO `yxxc_role_group` VALUES ('12', '商品管理', '6', '0', '1', '10');
INSERT INTO `yxxc_role_group` VALUES ('13', '类型属性', '6', '0', '0', '11');
INSERT INTO `yxxc_role_group` VALUES ('14', '供应商', '12', '0', '1', '12');
INSERT INTO `yxxc_role_group` VALUES ('15', '城市管理', '12', '0', '0', '13');
INSERT INTO `yxxc_role_group` VALUES ('16', '支付接口', '8', '0', '1', '14');
INSERT INTO `yxxc_role_group` VALUES ('17', '配送方式', '8', '0', '1', '15');
INSERT INTO `yxxc_role_group` VALUES ('18', '会员管理', '7', '0', '1', '16');
INSERT INTO `yxxc_role_group` VALUES ('19', '前端设置', '5', '0', '1', '17');
INSERT INTO `yxxc_role_group` VALUES ('20', '促销接口', '6', '0', '0', '18');
INSERT INTO `yxxc_role_group` VALUES ('21', '消息模板管理', '10', '0', '1', '19');
INSERT INTO `yxxc_role_group` VALUES ('22', '会员返利', '7', '0', '0', '20');
INSERT INTO `yxxc_role_group` VALUES ('23', '订单管理', '8', '0', '1', '13');
INSERT INTO `yxxc_role_group` VALUES ('24', '充值订单', '8', '0', '1', '13');
INSERT INTO `yxxc_role_group` VALUES ('35', '会员配置', '7', '0', '1', '19');
INSERT INTO `yxxc_role_group` VALUES ('26', '消息留言分组', '7', '0', '0', '24');
INSERT INTO `yxxc_role_group` VALUES ('27', '消息留言管理', '7', '0', '0', '25');
INSERT INTO `yxxc_role_group` VALUES ('28', '邮件管理', '10', '0', '1', '26');
INSERT INTO `yxxc_role_group` VALUES ('29', '短信管理', '10', '0', '1', '27');
INSERT INTO `yxxc_role_group` VALUES ('30', '代金券', '7', '0', '0', '28');
INSERT INTO `yxxc_role_group` VALUES ('31', '广告设置', '5', '0', '1', '29');
INSERT INTO `yxxc_role_group` VALUES ('32', '会员整合', '7', '0', '0', '30');
INSERT INTO `yxxc_role_group` VALUES ('33', '队列管理', '10', '0', '1', '31');
INSERT INTO `yxxc_role_group` VALUES ('36', '友情链接', '5', '0', '1', '32');
INSERT INTO `yxxc_role_group` VALUES ('55', 'API登录', '7', '0', '0', '33');
INSERT INTO `yxxc_role_group` VALUES ('56', '商品分类', '6', '0', '1', '10');
INSERT INTO `yxxc_role_group` VALUES ('57', '商品筛选', '6', '0', '0', '10');
INSERT INTO `yxxc_role_group` VALUES ('58', '地区', '12', '0', '1', '50');
INSERT INTO `yxxc_role_group` VALUES ('59', '商家优惠券', '12', '0', '0', '50');
INSERT INTO `yxxc_role_group` VALUES ('60', '论坛管理', '7', '0', '1', '10');
INSERT INTO `yxxc_role_group` VALUES ('62', '手机端设置', '3', '0', '0', '1');
INSERT INTO `yxxc_role_group` VALUES ('63', '商户标签分组管理', '12', '0', '0', '13');
INSERT INTO `yxxc_role_group` VALUES ('64', '商户点评评分分组管理', '12', '0', '0', '14');
INSERT INTO `yxxc_role_group` VALUES ('65', '活动管理', '12', '0', '0', '14');
INSERT INTO `yxxc_role_group` VALUES ('66', '站内消息', '7', '0', '1', '20');
INSERT INTO `yxxc_role_group` VALUES ('67', '商户图片分组管理', '12', '0', '0', '13');
INSERT INTO `yxxc_role_group` VALUES ('68', '报表与结算', '8', '0', '1', '14');
INSERT INTO `yxxc_role_group` VALUES ('69', '商品活动管理', '12', '0', '0', '51');
INSERT INTO `yxxc_role_group` VALUES ('70', '年龄', '12', '0', '1', '52');
