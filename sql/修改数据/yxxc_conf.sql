/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : demo5

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2014-12-24 17:29:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `yxxc_conf`
-- ----------------------------
DROP TABLE IF EXISTS `yxxc_conf`;
CREATE TABLE `yxxc_conf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `group_id` int(11) NOT NULL,
  `input_type` tinyint(1) NOT NULL COMMENT '配置输入的类型 0:文本输入 1:下拉框输入 2:图片上传 3:编辑器',
  `value_scope` text NOT NULL COMMENT '取值范围',
  `is_effect` tinyint(1) NOT NULL,
  `is_conf` tinyint(1) NOT NULL COMMENT '是否可配置 0: 可配置  1:不可配置',
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=177 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yxxc_conf
-- ----------------------------
INSERT INTO `yxxc_conf` VALUES ('1', 'DEFAULT_ADMIN', 'admin', '1', '0', '', '1', '0', '0');
INSERT INTO `yxxc_conf` VALUES ('2', 'URL_MODEL', '0', '1', '1', '0,1', '1', '1', '3');
INSERT INTO `yxxc_conf` VALUES ('3', 'AUTH_KEY', 'fanwe', '1', '0', '', '1', '1', '4');
INSERT INTO `yxxc_conf` VALUES ('4', 'TIME_ZONE', '8', '1', '1', '0,8', '1', '1', '1');
INSERT INTO `yxxc_conf` VALUES ('5', 'ADMIN_LOG', '1', '1', '1', '0,1', '0', '1', '0');
INSERT INTO `yxxc_conf` VALUES ('6', 'DB_VERSION', '2.92', '0', '0', '', '1', '0', '0');
INSERT INTO `yxxc_conf` VALUES ('7', 'DB_VOL_MAXSIZE', '8000000', '1', '0', '', '1', '1', '11');
INSERT INTO `yxxc_conf` VALUES ('8', 'WATER_MARK', './public/attachment/201011/4cdde85a27105.gif', '2', '2', '', '1', '1', '48');
INSERT INTO `yxxc_conf` VALUES ('24', 'CURRENCY_UNIT', '￥', '3', '0', '', '0', '1', '21');
INSERT INTO `yxxc_conf` VALUES ('10', 'BIG_WIDTH', '500', '2', '0', '', '0', '0', '49');
INSERT INTO `yxxc_conf` VALUES ('11', 'BIG_HEIGHT', '500', '2', '0', '', '0', '0', '50');
INSERT INTO `yxxc_conf` VALUES ('12', 'SMALL_WIDTH', '200', '2', '0', '', '0', '0', '51');
INSERT INTO `yxxc_conf` VALUES ('13', 'SMALL_HEIGHT', '200', '2', '0', '', '0', '0', '52');
INSERT INTO `yxxc_conf` VALUES ('14', 'WATER_ALPHA', '75', '2', '0', '', '1', '1', '53');
INSERT INTO `yxxc_conf` VALUES ('15', 'WATER_POSITION', '4', '2', '1', '1,2,3,4,5', '1', '1', '54');
INSERT INTO `yxxc_conf` VALUES ('16', 'MAX_IMAGE_SIZE', '300000', '2', '0', '', '1', '1', '55');
INSERT INTO `yxxc_conf` VALUES ('17', 'ALLOW_IMAGE_EXT', 'jpg,gif,png', '2', '0', '', '1', '1', '56');
INSERT INTO `yxxc_conf` VALUES ('18', 'MAX_FILE_SIZE', '1', '1', '0', '', '0', '1', '0');
INSERT INTO `yxxc_conf` VALUES ('19', 'ALLOW_FILE_EXT', '1', '1', '0', '', '0', '1', '0');
INSERT INTO `yxxc_conf` VALUES ('20', 'BG_COLOR', '#ffffff', '2', '0', '', '0', '0', '57');
INSERT INTO `yxxc_conf` VALUES ('21', 'IS_WATER_MARK', '1', '2', '1', '0,1', '1', '1', '58');
INSERT INTO `yxxc_conf` VALUES ('22', 'TEMPLATE', 'fanwe', '3', '0', '', '1', '1', '17');
INSERT INTO `yxxc_conf` VALUES ('126', 'YOUHUI_SEND_LIMIT', '5', '5', '0', '', '0', '1', '10');
INSERT INTO `yxxc_conf` VALUES ('25', 'SCORE_UNIT', '积分', '3', '0', '', '0', '1', '22');
INSERT INTO `yxxc_conf` VALUES ('26', 'USER_VERIFY', '1', '4', '1', '0,1', '0', '1', '63');
INSERT INTO `yxxc_conf` VALUES ('27', 'SHOP_LOGO', './public/attachment/201011/4cdd501dc023b.png', '3', '2', '', '1', '1', '19');
INSERT INTO `yxxc_conf` VALUES ('28', 'SHOP_LANG', 'zh-cn', '3', '1', 'zh-cn,zh-tw,en-us', '0', '1', '18');
INSERT INTO `yxxc_conf` VALUES ('29', 'SHOP_TITLE', '宝妈母婴', '3', '0', '', '1', '1', '13');
INSERT INTO `yxxc_conf` VALUES ('30', 'SHOP_KEYWORD', '宝妈母婴', '3', '0', '', '1', '1', '15');
INSERT INTO `yxxc_conf` VALUES ('31', 'SHOP_DESCRIPTION', '宝妈母婴', '3', '0', '', '1', '1', '15');
INSERT INTO `yxxc_conf` VALUES ('32', 'SHOP_TEL', '400-800-8888', '3', '0', '', '0', '1', '23');
INSERT INTO `yxxc_conf` VALUES ('33', 'SIDE_DEAL_COUNT', '3', '3', '0', '', '1', '1', '29');
INSERT INTO `yxxc_conf` VALUES ('34', 'SIDE_MESSAGE_COUNT', '3', '3', '0', '', '1', '1', '30');
INSERT INTO `yxxc_conf` VALUES ('35', 'INVITE_REFERRALS', '20', '4', '0', '', '0', '1', '67');
INSERT INTO `yxxc_conf` VALUES ('36', 'INVITE_REFERRALS_TYPE', '0', '4', '1', '0,1', '0', '1', '68');
INSERT INTO `yxxc_conf` VALUES ('37', 'ONLINE_MSN', 'msn@fanwe.com|msn2@fanwe.com', '3', '0', '', '1', '1', '24');
INSERT INTO `yxxc_conf` VALUES ('38', 'ONLINE_QQ', '88888888|9999999', '3', '0', '', '1', '1', '25');
INSERT INTO `yxxc_conf` VALUES ('39', 'ONLINE_TIME', '周一至周六 9:00-18:00', '3', '0', '', '1', '1', '26');
INSERT INTO `yxxc_conf` VALUES ('40', 'DEAL_PAGE_SIZE', '10', '3', '0', '', '1', '1', '31');
INSERT INTO `yxxc_conf` VALUES ('41', 'PAGE_SIZE', '10', '3', '0', '', '0', '1', '32');
INSERT INTO `yxxc_conf` VALUES ('42', 'HELP_CATE_LIMIT', '4', '3', '0', '', '0', '1', '34');
INSERT INTO `yxxc_conf` VALUES ('43', 'HELP_ITEM_LIMIT', '4', '3', '0', '', '0', '1', '35');
INSERT INTO `yxxc_conf` VALUES ('44', 'SHOP_FOOTER', '<div style=\"text-align:center;\">[宝妈母婴] <a target=\"_blank\" href=\"http://www.fanwe.com\">http://www.ishareyun.com</a><br />\r\n</div>\r\n', '3', '3', '', '1', '1', '37');
INSERT INTO `yxxc_conf` VALUES ('45', 'USER_MESSAGE_AUTO_EFFECT', '0', '4', '1', '0,1', '0', '1', '64');
INSERT INTO `yxxc_conf` VALUES ('46', 'SHOP_REFERRAL_HELP', '', '3', '3', '', '0', '1', '38');
INSERT INTO `yxxc_conf` VALUES ('47', 'SHOP_REFERRAL_SIDE_HELP', '<div class=\"side-tip referrals-side\">							<h3 class=\"first\"><br />\r\n</h3>\r\n						</div>\r\n', '3', '3', '', '0', '1', '39');
INSERT INTO `yxxc_conf` VALUES ('48', 'MAIL_SEND_COUPON', '0', '5', '1', '0,1', '0', '1', '73');
INSERT INTO `yxxc_conf` VALUES ('49', 'SMS_SEND_COUPON', '0', '5', '1', '0,1', '0', '1', '79');
INSERT INTO `yxxc_conf` VALUES ('50', 'MAIL_SEND_PAYMENT', '0', '5', '1', '0,1', '0', '1', '75');
INSERT INTO `yxxc_conf` VALUES ('51', 'SMS_SEND_PAYMENT', '0', '5', '1', '0,1', '0', '1', '81');
INSERT INTO `yxxc_conf` VALUES ('62', 'REPLY_ADDRESS', 'info@fanwe.com', '5', '0', '', '0', '1', '77');
INSERT INTO `yxxc_conf` VALUES ('54', 'MAIL_SEND_DELIVERY', '0', '5', '1', '0,1', '0', '1', '76');
INSERT INTO `yxxc_conf` VALUES ('55', 'SMS_SEND_DELIVERY', '0', '5', '1', '0,1', '0', '1', '82');
INSERT INTO `yxxc_conf` VALUES ('56', 'MAIL_ON', '0', '5', '1', '0,1', '0', '1', '72');
INSERT INTO `yxxc_conf` VALUES ('57', 'SMS_ON', '0', '5', '1', '0,1', '0', '1', '78');
INSERT INTO `yxxc_conf` VALUES ('58', 'REFERRAL_LIMIT', '1', '4', '0', '', '0', '1', '69');
INSERT INTO `yxxc_conf` VALUES ('59', 'SMS_COUPON_LIMIT', '3', '5', '0', '', '0', '1', '80');
INSERT INTO `yxxc_conf` VALUES ('60', 'MAIL_COUPON_LIMIT', '3', '5', '0', '', '0', '1', '74');
INSERT INTO `yxxc_conf` VALUES ('61', 'COUPON_NAME', '宝妈母婴', '3', '0', '', '0', '1', '16');
INSERT INTO `yxxc_conf` VALUES ('63', 'BATCH_PAGE_SIZE', '500', '3', '0', '', '1', '1', '33');
INSERT INTO `yxxc_conf` VALUES ('64', 'COUPON_PRINT_TPL', '<div style=\"border:1px solid #000000;padding:10px;margin:0px auto;width:600px;font-size:14px;\"><br />\r\n</div>\r\n', '3', '3', '', '0', '1', '40');
INSERT INTO `yxxc_conf` VALUES ('65', 'PUBLIC_DOMAIN_ROOT', '', '2', '0', '', '1', '1', '59');
INSERT INTO `yxxc_conf` VALUES ('66', 'SHOW_DEAL_CATE', '1', '3', '1', '0,1', '0', '1', '41');
INSERT INTO `yxxc_conf` VALUES ('67', 'REFERRAL_IP_LIMIT', '0', '4', '1', '0,1', '0', '1', '71');
INSERT INTO `yxxc_conf` VALUES ('68', 'UNSUBSCRIBE_MAIL_TIP', '您收到此邮件是因为您订阅了%s每日推荐更新。如果您不想继续接收此类邮件，可随时%s', '3', '0', '', '0', '1', '36');
INSERT INTO `yxxc_conf` VALUES ('69', 'CART_ON', '1', '3', '1', '0,1', '0', '1', '42');
INSERT INTO `yxxc_conf` VALUES ('70', 'REFERRALS_DELAY', '1', '4', '0', '', '0', '1', '70');
INSERT INTO `yxxc_conf` VALUES ('71', 'SUBMIT_DELAY', '5', '1', '0', '', '1', '1', '13');
INSERT INTO `yxxc_conf` VALUES ('72', 'APP_MSG_SENDER_OPEN', '0', '1', '1', '0,1', '1', '1', '9');
INSERT INTO `yxxc_conf` VALUES ('73', 'ADMIN_MSG_SENDER_OPEN', '0', '1', '1', '0,1', '1', '1', '10');
INSERT INTO `yxxc_conf` VALUES ('74', 'SHOP_OPEN', '1', '3', '1', '0,1', '1', '1', '46');
INSERT INTO `yxxc_conf` VALUES ('75', 'SHOP_CLOSE_HTML', '', '3', '3', '', '1', '1', '47');
INSERT INTO `yxxc_conf` VALUES ('76', 'FOOTER_LOGO', './public/attachment/201011/4cdd50ed013ec.png', '3', '2', '', '1', '1', '20');
INSERT INTO `yxxc_conf` VALUES ('77', 'GZIP_ON', '0', '1', '1', '0,1', '1', '1', '2');
INSERT INTO `yxxc_conf` VALUES ('78', 'INTEGRATE_CODE', '', '0', '0', '', '1', '0', '0');
INSERT INTO `yxxc_conf` VALUES ('79', 'INTEGRATE_CFG', '', '0', '0', '', '1', '0', '0');
INSERT INTO `yxxc_conf` VALUES ('80', 'SHOP_SEO_TITLE', '宝妈母婴', '3', '0', '', '1', '1', '14');
INSERT INTO `yxxc_conf` VALUES ('81', 'CACHE_ON', '0', '1', '1', '0,1', '1', '1', '7');
INSERT INTO `yxxc_conf` VALUES ('82', 'EXPIRED_TIME', '0', '1', '0', '', '1', '1', '5');
INSERT INTO `yxxc_conf` VALUES ('120', 'FILTER_WORD', '', '1', '0', '', '1', '1', '100');
INSERT INTO `yxxc_conf` VALUES ('84', 'STYLE_OPEN', '0', '3', '1', '0,1', '0', '0', '44');
INSERT INTO `yxxc_conf` VALUES ('85', 'STYLE_DEFAULT', '1', '3', '1', '0,1', '0', '0', '45');
INSERT INTO `yxxc_conf` VALUES ('86', 'TMPL_DOMAIN_ROOT', '', '2', '0', '0', '0', '0', '62');
INSERT INTO `yxxc_conf` VALUES ('87', 'CACHE_TYPE', 'File', '1', '1', 'File,Xcache,Memcached', '1', '1', '7');
INSERT INTO `yxxc_conf` VALUES ('88', 'MEMCACHE_HOST', '127.0.0.1:11211', '1', '0', '', '1', '1', '8');
INSERT INTO `yxxc_conf` VALUES ('90', 'IMAGE_USERNAME', '', '2', '0', '', '1', '1', '60');
INSERT INTO `yxxc_conf` VALUES ('91', 'IMAGE_PASSWORD', '', '2', '4', '', '1', '1', '61');
INSERT INTO `yxxc_conf` VALUES ('92', 'MOBILE_MUST', '0', '4', '1', '0,1', '0', '1', '66');
INSERT INTO `yxxc_conf` VALUES ('93', 'ATTR_SELECT', '0', '3', '1', '0,1', '0', '0', '43');
INSERT INTO `yxxc_conf` VALUES ('94', 'ICP_LICENSE', '', '3', '0', '', '1', '1', '27');
INSERT INTO `yxxc_conf` VALUES ('95', 'COUNT_CODE', '', '3', '0', '', '1', '1', '28');
INSERT INTO `yxxc_conf` VALUES ('96', 'DEAL_MSG_LOCK', '0', '0', '0', '', '0', '0', '0');
INSERT INTO `yxxc_conf` VALUES ('97', 'PROMOTE_MSG_LOCK', '0', '0', '0', '', '0', '0', '0');
INSERT INTO `yxxc_conf` VALUES ('98', 'LIST_TYPE', '1', '3', '1', '0,1', '1', '1', '45');
INSERT INTO `yxxc_conf` VALUES ('100', 'SUPPLIER_DETAIL', '1', '3', '1', '0,1', '1', '1', '45');
INSERT INTO `yxxc_conf` VALUES ('101', 'KUAIDI_APP_KEY', '', '1', '0', '', '1', '1', '83');
INSERT INTO `yxxc_conf` VALUES ('102', 'KUAIDI_TYPE', '2', '1', '1', '1,2', '1', '1', '84');
INSERT INTO `yxxc_conf` VALUES ('103', 'SEND_SPAN', '2', '1', '0', '', '1', '1', '85');
INSERT INTO `yxxc_conf` VALUES ('104', 'MAIL_USE_COUPON', '0', '5', '1', '0,1', '0', '1', '77');
INSERT INTO `yxxc_conf` VALUES ('105', 'SMS_USE_COUPON', '0', '5', '1', '0,1', '0', '1', '83');
INSERT INTO `yxxc_conf` VALUES ('106', 'LOTTERY_SMS_VERIFY', '0', '5', '1', '0,1', '0', '1', '84');
INSERT INTO `yxxc_conf` VALUES ('107', 'LOTTERY_SN_SMS', '0', '5', '1', '0,1', '0', '1', '85');
INSERT INTO `yxxc_conf` VALUES ('108', 'EDM_ON', '0', '5', '1', '0,1', '0', '1', '86');
INSERT INTO `yxxc_conf` VALUES ('109', 'EDM_USERNAME', '', '5', '0', '', '0', '1', '87');
INSERT INTO `yxxc_conf` VALUES ('110', 'EDM_PASSWORD', '', '5', '4', '', '0', '1', '88');
INSERT INTO `yxxc_conf` VALUES ('111', 'SHOP_SEARCH_KEYWORD', '宝妈母婴', '3', '0', '', '1', '1', '15');
INSERT INTO `yxxc_conf` VALUES ('112', 'REC_HOT_LIMIT', '4', '3', '0', '', '0', '1', '35');
INSERT INTO `yxxc_conf` VALUES ('113', 'REC_NEW_LIMIT', '4', '3', '0', '', '0', '1', '35');
INSERT INTO `yxxc_conf` VALUES ('114', 'REC_BEST_LIMIT', '4', '3', '0', '', '0', '1', '35');
INSERT INTO `yxxc_conf` VALUES ('115', 'REC_CATE_GOODS_LIMIT', '4', '3', '0', '', '0', '1', '35');
INSERT INTO `yxxc_conf` VALUES ('116', 'SALE_LIST', '5', '3', '0', '', '0', '1', '35');
INSERT INTO `yxxc_conf` VALUES ('117', 'INDEX_NOTICE_COUNT', '8', '3', '0', '', '0', '1', '35');
INSERT INTO `yxxc_conf` VALUES ('118', 'RELATE_GOODS_LIMIT', '5', '3', '0', '', '0', '1', '35');
INSERT INTO `yxxc_conf` VALUES ('119', 'TMPL_CACHE_ON', '0', '1', '1', '0,1', '1', '1', '6');
INSERT INTO `yxxc_conf` VALUES ('121', 'USER_LOGIN_SCORE', '0', '6', '0', '', '0', '1', '2');
INSERT INTO `yxxc_conf` VALUES ('122', 'USER_LOGIN_MONEY', '0', '6', '0', '', '0', '1', '1');
INSERT INTO `yxxc_conf` VALUES ('123', 'USER_REGISTER_SCORE', '0', '6', '0', '', '0', '1', '8');
INSERT INTO `yxxc_conf` VALUES ('124', 'USER_REGISTER_MONEY', '0', '6', '0', '', '0', '1', '7');
INSERT INTO `yxxc_conf` VALUES ('125', 'DOMAIN_ROOT', '', '1', '0', '', '1', '1', '10');
INSERT INTO `yxxc_conf` VALUES ('127', 'MAIN_APP', 'shop', '1', '1', 'shop,tuan,youhui', '1', '0', '10');
INSERT INTO `yxxc_conf` VALUES ('128', 'VERIFY_IMAGE', '0', '1', '1', '0,1', '1', '1', '10');
INSERT INTO `yxxc_conf` VALUES ('129', 'TUAN_SHOP_TITLE', '宝妈母婴', '3', '0', '', '0', '1', '13');
INSERT INTO `yxxc_conf` VALUES ('130', 'MALL_SHOP_TITLE', '宝妈母婴', '3', '0', '', '0', '1', '13');
INSERT INTO `yxxc_conf` VALUES ('131', 'APNS_MSG_LOCK', '0', '0', '0', '', '0', '0', '0');
INSERT INTO `yxxc_conf` VALUES ('132', 'PROMOTE_MSG_PAGE', '0', '0', '0', '', '0', '0', '0');
INSERT INTO `yxxc_conf` VALUES ('133', 'APNS_MSG_PAGE', '0', '0', '0', '', '0', '0', '0');
INSERT INTO `yxxc_conf` VALUES ('134', 'STORE_SEND_LIMIT', '5', '5', '0', '', '0', '1', '9');
INSERT INTO `yxxc_conf` VALUES ('135', 'USER_LOGIN_POINT', '0', '6', '0', '', '0', '1', '3');
INSERT INTO `yxxc_conf` VALUES ('136', 'USER_REGISTER_POINT', '10', '6', '0', '', '1', '1', '9');
INSERT INTO `yxxc_conf` VALUES ('137', 'USER_LOGIN_KEEP_MONEY', '0', '6', '0', '', '0', '1', '4');
INSERT INTO `yxxc_conf` VALUES ('138', 'USER_LOGIN_KEEP_SCORE', '0', '6', '0', '', '0', '1', '5');
INSERT INTO `yxxc_conf` VALUES ('139', 'USER_LOGIN_KEEP_POINT', '0', '6', '0', '', '0', '1', '6');
INSERT INTO `yxxc_conf` VALUES ('140', 'USER_ACTIVE_MONEY', '0', '6', '0', '', '0', '1', '10');
INSERT INTO `yxxc_conf` VALUES ('141', 'USER_ACTIVE_SCORE', '0', '6', '0', '', '0', '1', '11');
INSERT INTO `yxxc_conf` VALUES ('142', 'USER_ACTIVE_POINT', '2', '6', '0', '', '1', '1', '12');
INSERT INTO `yxxc_conf` VALUES ('143', 'USER_ACTIVE_MONEY_MAX', '0', '6', '0', '', '0', '1', '13');
INSERT INTO `yxxc_conf` VALUES ('144', 'USER_ACTIVE_SCORE_MAX', '0', '6', '0', '', '0', '1', '14');
INSERT INTO `yxxc_conf` VALUES ('145', 'USER_ACTIVE_POINT_MAX', '20', '6', '0', '', '1', '1', '15');
INSERT INTO `yxxc_conf` VALUES ('146', 'USER_DELETE_MONEY', '0', '6', '0', '', '0', '1', '16');
INSERT INTO `yxxc_conf` VALUES ('148', 'USER_DELETE_POINT', '-5', '6', '0', '', '1', '1', '18');
INSERT INTO `yxxc_conf` VALUES ('149', 'USER_ADD_MONEY', '0', '6', '0', '', '0', '1', '19');
INSERT INTO `yxxc_conf` VALUES ('150', 'USER_ADD_SCORE', '0', '6', '0', '', '0', '1', '20');
INSERT INTO `yxxc_conf` VALUES ('151', 'USER_ADD_POINT', '5', '6', '0', '', '1', '1', '21');
INSERT INTO `yxxc_conf` VALUES ('147', 'USER_DELETE_SCORE', '0', '6', '0', '', '0', '1', '17');
INSERT INTO `yxxc_conf` VALUES ('152', 'BIZ_AGREEMENT', '<ul>                                	<li>                                    &nbsp;&nbsp;&nbsp;&nbsp;您确认，在开始\"实名认证\"前，您已详细阅读了本协议所有内容，一旦您开始认证流程，即表示您充分理解并同意接受本协议的全部内容。                                    </li>\r\n                                    <li>                                    &nbsp;&nbsp;&nbsp;&nbsp;为了提高服务的安全性和我们的商户身份的可信度，我们向您提供认证服务。在您申请认证前，您必须先注册成为用户。商户认证成功后，我们将给予每个商户一个认证标识。本公司有权采取各种其认为必要手段对商户的身份进行识别。但是，作为普通的网络服务提供商，本公司所能采取的方法有限，而且在网络上进行商户身份识别也存在一定的困难，因此，本公司对完成认证的商户身份的准确性和绝对真实性不做任何保证。                                    </li>\r\n                                    <li>                                    &nbsp;&nbsp;&nbsp;&nbsp;本公司有权记录并保存您提供给本公司的信息和本公司获取的结果信息，亦有权根据本协议的约定向您或第三方提供您是否通过认证的结论以及您的身份信息。                                         </li>\r\n									<li>										<h3>一、关于认证服务的理解与认同</h3>\r\n										<ol class=\"decimal\">											<li>认证服务是由本公司提供的一项身份识别服务。除非本协议另有约定，一旦您的账户完成了认证，相应的身份信息和认证结果将不因任何原因被修改或取消；如果您的身份信息在完成认证后发生了变更，您应向本公司提供相应有权部门出具的凭证，由本公司协助您变更账户的对应认证信息。</li>\r\n											<li>本公司有权单方随时修改或变更本协议内容，并通过网站公告变更后的协议文本，无需单独通知您。本协议进行任何修改或变更后，您还继续使用我们的服务和/或认证服务的，即代表您已阅读、了解并同意接受变更后的协议内容；您如果不同意变更后的协议内容，应立即停用我们的服务和认证服务。</li>\r\n										</ol>\r\n																</li>\r\n<li>										<h3>二、实名认证</h3>\r\n										<ol class=\"decimal\">											<li>个体工商户类商户向本公司申请认证服务时，应向本公司提供以下资料：中华人民共和国工商登记机关颁发的个体工商户营业执照或者其他身份证明文件。</li>\r\n											<li>企业类商户向本公司申请认证服务时，应向本公司提供以下资料：中华人民共和国工商登记机关颁发的企业营业执照或者其他身份证明文件。</li>\r\n                                            <li>                                            其他类商户向本公司申请认证服务时，应向本公司提供以下资料：能够证明商户合法身份的证明文件，或者其他本公司认为必要的身份证明文件。                                            </li>\r\n                                            <li>                                            如商户在认证后变更任何身份信息，则应在变更发生后三个工作日内书面通知本公司变更认证，否则本公司有权随时单方终止提供服务，且因此造成的全部后果，由商户自行承担。                                            </li>\r\n                                            <li>                                            通过实名认证的商户不能自行修改已经认证的信息，包括但不限于企业名称、姓名以及身份证件号码等。                                            </li>\r\n										</ol>\r\n									</li>\r\n									<li>										<h3>三、特别声明</h3>\r\n												<ol class=\"decimal\">																						<li>认证信息共享：<br />\r\n为了使您享有便捷的服务，您经由其它网站向本公司提交认证申请即表示您同意本公司为您核对所提交的全部认证信息，并同意本公司将是否通过认证的结果及相关认证信息提供给该网站。</li>\r\n											<li>												认证资料的管理：<br />\r\n     您在认证时提交给本公司的认证资料，即不可撤销的授权由本公司保留。本公司承诺除法定或约定的事由外，不公开或编辑或透露您的认证资料及保存在本公司的非公开内容用于商业目的，但本条第1项规定以及以下情形除外：												<ol class=\"lower-roman\">													<li>您授权本公司透露的相关信息；</li>\r\n													<li>本公司向国家司法及行政机关提供；</li>\r\n                                                    <li>本公司向本公司关联企业提供；</li>\r\n                                                    <li>第三方和本公司一起为商户提供服务时，该第三方向您提供服务所需的相关信息；</li>\r\n                                                    <li>基于解决您与第三方民事纠纷的需要，本公司有权向该第三方提供您的身份信息。</li>\r\n												</ol>\r\n														</li>\r\n										</ol>\r\n									</li>\r\n																<li>										<h3>四、第三方网站的链接</h3>\r\n                                    </li>\r\n											<li>&nbsp;&nbsp;&nbsp;&nbsp;为实现认证信息审查，我们网站上可能包含了指向第三方网站的链接（以下简称\"链接网站\"）。\"链接网站\"非由本公司控制，对于任何\"链接网站\"的内容，包含但不限于\"链接网站\"内含的任何链接，或\"链接网站\"的任何改变或更新，本公司均不予负责。自\"链接网站\"接收的网络传播或其它形式之传送，本公司不予负责。</li>\r\n									<li>										<h3>五、不得为非法或禁止的使用</h3>\r\n                                    </li>\r\n                                    <li>&nbsp;&nbsp;&nbsp;&nbsp;接受本协议全部的说明、条款、条件是您申请认证的先决条件。您声明并保证，您不得为任何非法或为本协议、条件及须知所禁止之目的进行认证申请。您不得以任何可能损害、使瘫痪、使过度负荷或损害网站或其他网站的服务、或干扰本公司或他人对于认证申请的使用等方式使用认证服务。您不得经由非本公司许可提供的任何方式取得或试图取得任何资料或信息。									</li>\r\n									<li>										<h3>六、有关免责</h3>\r\n                                     </li>\r\n                                     <li>                                     &nbsp;&nbsp;&nbsp;&nbsp;下列情况时本公司无需承担任何责任：                                     </li>\r\n                                     <li>											<ol class=\"decimal\">												<li>由于您将账户密码告知他人或未保管好自己的密码或与他人共享账户或任何其他非本公司的过错，导致您的个人资料泄露。</li>\r\n												<li>													任何由于黑客攻击、计算机病毒侵入或发作、电信部门技术调整导致之影响、因政府管制而造成的暂时性关闭、由于第三方原因(包括不可抗力，例如国际出口的主干线路及国际出口电信提供商一方出现故障、火灾、水灾、雷击、地震、洪水、台风、龙卷风、火山爆发、瘟疫和传染病流行、罢工、战争或暴力行为或类似事件等)及其他非因本公司过错而造成的认证信息泄露、丢失、被盗用或被篡改等。															</li>\r\n												<li>由于与本公司链接的其它网站所造成的商户身份信息泄露及由此而导致的任何法律争议和后果。</li>\r\n                                                <li>任何商户向本公司提供错误、不完整、不实信息等造成不能通过认证或遭受任何其他损失，概与本公司无关。</li>\r\n											</ol>\r\n									</li>\r\n																</ul>\r\n', '3', '3', ' ', '0', '1', '100');
INSERT INTO `yxxc_conf` VALUES ('153', 'INDEX_LEFT_STORE', '1', '3', '0', ' ', '0', '1', '1');
INSERT INTO `yxxc_conf` VALUES ('154', 'INDEX_LEFT_TUAN', '1', '3', '0', ' ', '0', '1', '2');
INSERT INTO `yxxc_conf` VALUES ('155', 'INDEX_LEFT_YOUHUI', '1', '3', '0', ' ', '0', '1', '3');
INSERT INTO `yxxc_conf` VALUES ('156', 'INDEX_LEFT_DAIJIN', '1', '3', '0', ' ', '0', '1', '4');
INSERT INTO `yxxc_conf` VALUES ('157', 'INDEX_LEFT_EVENT', '1', '3', '0', ' ', '0', '1', '5');
INSERT INTO `yxxc_conf` VALUES ('158', 'INDEX_RIGHT_STORE', '1', '3', '0', ' ', '0', '1', '6');
INSERT INTO `yxxc_conf` VALUES ('159', 'INDEX_RIGHT_TUAN', '1', '3', '0', ' ', '0', '1', '7');
INSERT INTO `yxxc_conf` VALUES ('160', 'INDEX_RIGHT_YOUHUI', '1', '3', '0', ' ', '0', '1', '8');
INSERT INTO `yxxc_conf` VALUES ('161', 'INDEX_RIGHT_DAIJIN', '1', '3', '0', ' ', '0', '1', '9');
INSERT INTO `yxxc_conf` VALUES ('162', 'INDEX_RIGHT_EVENT', '1', '3', '0', ' ', '0', '1', '10');
INSERT INTO `yxxc_conf` VALUES ('163', 'USER_YOUHUI_DOWN_MONEY', '0', '6', '0', ' ', '0', '1', '21');
INSERT INTO `yxxc_conf` VALUES ('164', 'USER_YOUHUI_DOWN_SCORE', '0', '6', '0', ' ', '0', '1', '21');
INSERT INTO `yxxc_conf` VALUES ('165', 'USER_YOUHUI_DOWN_POINT', '0', '6', '0', ' ', '0', '1', '21');
INSERT INTO `yxxc_conf` VALUES ('166', 'COOKIE_PATH', '/', '1', '0', '', '1', '1', '10');
INSERT INTO `yxxc_conf` VALUES ('167', 'APPLE_PATH', 'ios', '3', '0', ' ', '1', '1', '101');
INSERT INTO `yxxc_conf` VALUES ('168', 'ANDROID_PATH', 'android', '3', '0', ' ', '1', '1', '102');
INSERT INTO `yxxc_conf` VALUES ('171', 'QRCODE_SIZE', '2', '3', '1', '1,2,3', '1', '1', '103');
INSERT INTO `yxxc_conf` VALUES ('169', 'SEND_SCORE_SMS', '0', '5', '1', '0,1', '0', '1', '82');
INSERT INTO `yxxc_conf` VALUES ('170', 'SEND_SCORE_MAIL', '0', '5', '1', '0,1', '0', '1', '76');
INSERT INTO `yxxc_conf` VALUES ('172', 'YOUHUI_SEND_TEL_LIMIT', '2', '5', '0', '', '0', '1', '10');
INSERT INTO `yxxc_conf` VALUES ('173', 'IP_LIMIT_NUM', '2', '1', '0', '', '1', '1', '5');
INSERT INTO `yxxc_conf` VALUES ('174', 'INDEX_SUPPLIER_COUNT', '8', '3', '0', '', '1', '1', '28');
INSERT INTO `yxxc_conf` VALUES ('175', 'BIZ_APPLE_PATH', 'ios', '3', '0', '', '1', '1', '103');
INSERT INTO `yxxc_conf` VALUES ('176', 'BIZ_ANDROID_PATH', 'android', '3', '0', '', '1', '1', '104');
