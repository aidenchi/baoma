/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : demo5

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2014-12-23 18:34:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `yxxc_role_module`
-- ----------------------------
DROP TABLE IF EXISTS `yxxc_role_module`;
CREATE TABLE `yxxc_role_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yxxc_role_module
-- ----------------------------
INSERT INTO `yxxc_role_module` VALUES ('5', 'Role', '权限组别', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('6', 'Admin', '管理员', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('12', 'Conf', '系统配置', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('13', 'Database', '数据库', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('15', 'Log', '系统日志', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('17', 'Article', '文章模块', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('18', 'ArticleCate', '文章分类', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('19', 'File', '文件管理', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('20', 'DealCity', '团购城市', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('58', 'Index', '首页', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('22', 'Supplier', '供应商', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('25', 'SupplierAccount', '供应商帐号', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('24', 'SupplierLocation', '供应商分店与部门', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('26', 'GoodsType', '商品类型', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('27', 'GoodsTypeAttr', '商品类型属性', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('28', 'DealCate', '生活服务分类', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('29', 'Deal', '商品管理', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('30', 'DealCoupon', '团购券', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('31', 'WeightUnit', '重量单位', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('32', 'UserField', '会员字段', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('33', 'UserGroup', '会员组别', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('34', 'User', '会员', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('35', 'Delivery', '配送方式', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('36', 'Nav', '导航菜单', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('37', 'Payment', '支付方式', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('38', 'Promote', '促销接口', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('39', 'MsgTemplate', '消息模板', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('40', 'Referrals', '邀请返利', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('41', 'DealOrder', '订单模块', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('42', 'PaymentNotice', '收款单', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('44', 'MessageType', '消息留言分组', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('45', 'Message', '消息留言', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('46', 'MailList', '邮件订阅', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('47', 'MailServer', '邮件服务器', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('48', 'Sms', '短信接口', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('49', 'EcvType', '代金券类型', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('50', 'Ecv', '代金券', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('51', 'MobileList', '短信订阅列表', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('52', 'PromoteMsg', '推广邮件短信', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('53', 'Adv', '广告模块', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('54', 'Vote', '投票调查', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('55', 'Integrate', '会员整合', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('56', 'DealMsgList', '业务群发队列', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('57', 'PromoteMsgList', '推广群发队列', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('59', 'DeliveryRegion', '配送地区', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('60', 'LinkGroup', '友情链接分组', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('61', 'Link', '友情链接', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('77', 'ApiLogin', 'API登录', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('62', 'Express', '快递接口', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('78', 'ShopCate', '商城分类', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('79', 'FilterGroup', '筛选分组', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('80', 'Filter', '筛选关键词', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('81', 'Topic', '用户主题', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('82', 'TopicReply', '主题回复', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('83', 'TopicImage', '主题图片', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('84', 'Area', '商圈地区', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('85', 'Youhui', '优惠券', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('86', 'YouhuiLog', '优惠券下载日志', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('87', 'Brand', '品牌管理', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('88', 'TopicTagCate', '分享标签分类', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('89', 'TopicTag', '分享标签', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('90', 'TopicTitle', '分享话题', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('91', 'DealCateType', '生活服务子类', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('92', 'Cache', '缓存处理', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('93', 'MAdv', '手机端广告', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('94', 'MIndex', '手机端首页菜单', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('95', 'MApns', 'iPhone消息推送', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('96', 'TagGroup', '商户标签分组管理', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('97', 'PointGroup', '商户点评评分分组管理', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('98', 'Event', '活动管理', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('99', 'EventSubmit', '活动报名管理', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('100', 'MsgSystem', '站内消息群发', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('101', 'MsgBox', '消息记录', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('102', 'EventCate', '活动分类', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('103', 'FetchTopic', '分享采集', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('104', 'ImagesGroup', '商户图片分组管理', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('105', 'TopicGroupCate', '分享小组分类', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('106', 'TopicGroup', '分享小组', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('108', 'Medal', '勋章系统', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('107', 'UserLevel', '会员等级', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('109', 'SupplierSubmit', '商家入驻', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('110', 'DarenSubmit', '达人申请', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('111', 'Balance', '结算', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('112', 'Statistic', '报表', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('113', 'DealEvent', '商品活动', '1', '0');
INSERT INTO `yxxc_role_module` VALUES ('114', 'SupplierLocationAge', '店铺年龄筛选', '1', '0');
