2.93;
INSERT INTO `%DB_PREFIX%conf` VALUES ('174', 'INDEX_SUPPLIER_COUNT', '8', '3', '0', '', '1', '1', '28');

ALTER TABLE `%DB_PREFIX%deal` ADD COLUMN `is_refund`  tinyint(1) NOT NULL DEFAULT 1;
ALTER TABLE `%DB_PREFIX%deal` ADD COLUMN `notes`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
ALTER TABLE `%DB_PREFIX%deal` ADD COLUMN `deal_event_id`  int(11) NOT NULL;
ALTER TABLE `%DB_PREFIX%deal` ADD COLUMN `package`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;


CREATE TABLE IF NOT EXISTS `%DB_PREFIX%sms_mobile_verify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile_phone` varchar(50) NOT NULL DEFAULT '',
  `code` varchar(20) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `add_time` int(10) DEFAULT NULL,
  `send_count` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `%DB_PREFIX%deal_event` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`icon`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`event_begin_time`  int(11) NOT NULL ,
`event_end_time`  int(11) NOT NULL ,
`submit_begin_time`  int(11) NOT NULL ,
`submit_end_time`  int(11) NOT NULL ,
`sort`  int(11) NULL DEFAULT NULL ,
`is_effect`  tinyint(1) NOT NULL ,
`content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`brief`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`)
)ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

ALTER TABLE `%DB_PREFIX%m_adv` MODIFY COLUMN `page`  enum('sharelist','index','wap') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'sharelist' AFTER `img`;
ALTER TABLE `%DB_PREFIX%m_index` ADD COLUMN `mobile_type`  tinyint(1) NULL DEFAULT 0 COMMENT '手机类型0:ios/android; 1:wap' AFTER `city_id`;


ALTER TABLE `%DB_PREFIX%m_config` ADD COLUMN `group_name`  varchar(50) NOT NULL DEFAULT '基础配置' COMMENT '分组显示';
ALTER TABLE `%DB_PREFIX%m_config` ADD COLUMN `sort`  int(10) NOT NULL DEFAULT 0 COMMENT '排序';

INSERT INTO `%DB_PREFIX%m_config`(`id`,`code`,`title`,`val`,`type`,`group_name`,`sort`) VALUES ('28','qq_app_key','QQ登录APP_KEY','','0', '基础配置', '0');
INSERT INTO `%DB_PREFIX%m_config`(`id`,`code`,`title`,`val`,`type`,`group_name`,`sort`) VALUES ('29','qq_app_secret','QQ登录APP_SECRET','','0', '基础配置', '0');
INSERT INTO `%DB_PREFIX%m_config`(`id`,`code`,`title`,`val`,`type`,`group_name`,`sort`) VALUES ('61', 'ios_biz_forced_upgrade', '商家ios是否强制升级(0:否;1:是)', '0', '0', '商家手机端升级设置', '12');
INSERT INTO `%DB_PREFIX%m_config`(`id`,`code`,`title`,`val`,`type`,`group_name`,`sort`) VALUES ('62', 'android_biz_version', '商家android版本号(yyyymmddnn)', '', '0', '商家手机端升级设置', '13');
INSERT INTO `%DB_PREFIX%m_config`(`id`,`code`,`title`,`val`,`type`,`group_name`,`sort`) VALUES ('63', 'android_biz_filename', '商家android下载包名', '%DB_PREFIX%o2os.apk', '0', '商家手机端升级设置', '14');
INSERT INTO `%DB_PREFIX%m_config`(`id`,`code`,`title`,`val`,`type`,`group_name`,`sort`) VALUES ('65', 'android_biz_forced_upgrade', '商家android是否强制升级(0:否;1:是)', '0', '0', '商家手机端升级设置', '16');
INSERT INTO `%DB_PREFIX%m_config`(`id`,`code`,`title`,`val`,`type`,`group_name`,`sort`) VALUES ('64', 'android_biz_upgrade', '商家android版本升级内容', '商家android升级测试', '3', '商家手机端升级设置', '15');
INSERT INTO `%DB_PREFIX%m_config`(`id`,`code`,`title`,`val`,`type`,`group_name`,`sort`) VALUES ('50', 'ios_version', 'ios版本号(yyyymmddnn)', '', '0', '手机端升级设置', '1');
INSERT INTO `%DB_PREFIX%m_config`(`id`,`code`,`title`,`val`,`type`,`group_name`,`sort`) VALUES ('51', 'ios_down_url', 'ios下载地址(appstore连接地址)', '', '0', '手机端升级设置', '2');
INSERT INTO `%DB_PREFIX%m_config`(`id`,`code`,`title`,`val`,`type`,`group_name`,`sort`) VALUES ('52', 'ios_upgrade', 'ios版本升级内容', 'ios升级测试', '3', '手机端升级设置', '3');
INSERT INTO `%DB_PREFIX%m_config`(`id`,`code`,`title`,`val`,`type`,`group_name`,`sort`) VALUES ('53', 'ios_forced_upgrade', 'ios是否强制升级(0:否;1:是)', '0', '0', '手机端升级设置', '4');
INSERT INTO `%DB_PREFIX%m_config`(`id`,`code`,`title`,`val`,`type`,`group_name`,`sort`) VALUES ('54', 'android_version', 'android版本号(yyyymmddnn)', '', '0', '手机端升级设置', '5');
INSERT INTO `%DB_PREFIX%m_config`(`id`,`code`,`title`,`val`,`type`,`group_name`,`sort`) VALUES ('55', 'android_filename', 'android下载包名', '%DB_PREFIX%o2o.apk', '0', '手机端升级设置', '6');
INSERT INTO `%DB_PREFIX%m_config`(`id`,`code`,`title`,`val`,`type`,`group_name`,`sort`) VALUES ('56', 'android_upgrade', 'android版本升级内容', 'android升级测试', '3', '手机端升级设置', '7');
INSERT INTO `%DB_PREFIX%m_config`(`id`,`code`,`title`,`val`,`type`,`group_name`,`sort`) VALUES ('57', 'android_forced_upgrade', 'android是否强制升级(0:否;1:是)', '0', '0', '手机端升级设置', '8');
INSERT INTO `%DB_PREFIX%m_config`(`id`,`code`,`title`,`val`,`type`,`group_name`,`sort`) VALUES ('58', 'ios_biz_version', '商家ios版本号(yyyymmddnn)', '', '0', '商家手机端升级设置', '9');
INSERT INTO `%DB_PREFIX%m_config`(`id`,`code`,`title`,`val`,`type`,`group_name`,`sort`) VALUES ('59', 'ios_biz_down_url', '商家ios下载地址(appstore连接地址)', '', '0', '商家手机端升级设置', '10');
INSERT INTO `%DB_PREFIX%m_config`(`id`,`code`,`title`,`val`,`type`,`group_name`,`sort`) VALUES ('60', 'ios_biz_upgrade', '商家ios版本升级内容', '商家ios升级测试', '3', '商家手机端升级设置', '11');
INSERT INTO `%DB_PREFIX%m_config`(`id`,`code`,`title`,`val`,`type`,`group_name`,`sort`) VALUES ('66', 'biz_article_cate_id', '商家我的消息(文章分类ID)', '19', '0', '商家手机端升级设置', '17');
INSERT INTO `%DB_PREFIX%m_config`(`id`,`code`,`title`,`val`,`type`,`group_name`,`sort`) VALUES ('67', 'wx_app_key', '微信(分享)appkey', '', '0', '基础配置', '18');
INSERT INTO `%DB_PREFIX%m_config`(`id`,`code`,`title`,`val`,`type`,`group_name`,`sort`) VALUES ('68', 'wx_app_secret', '微信(分享)appSecret', '', '0', '基础配置', '19');

--无效，删除 腾讯 分享功能,关于我们
DELETE FROM `%DB_PREFIX%m_config` WHERE `code` IN ('tencent_app_key','tencent_app_secret','tencent_bind_url','about_info');

--关于我们,公告列表
INSERT INTO `%DB_PREFIX%m_config`(`id`,`code`,`title`,`val`,`type`,`group_name`,`sort`) VALUES ('69', 'about_info', '关于我们(文章ID)', '0', '0', '基础配置', '20');
INSERT INTO `%DB_PREFIX%m_config`(`id`,`code`,`title`,`val`,`type`,`group_name`,`sort`) VALUES ('70', 'article_cate_id', '公告列表(文章分类ID)', '0', '0', '基础配置', '21');

--下单时,需要绑定手机号码
INSERT INTO `%DB_PREFIX%m_config`(`id`,`code`,`title`,`val`,`type`,`group_name`,`sort`) VALUES ('71', 'order_has_bind_mobile', '下单时需要绑定手机号码', '1', '0', '基础配置', '22');

ALTER TABLE `%DB_PREFIX%shop_cate` ADD COLUMN `cate_img`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类图片';
ALTER TABLE `%DB_PREFIX%deal_cate` ADD COLUMN `icon_img`  varchar(255);
ALTER TABLE `%DB_PREFIX%user`  ADD COLUMN `qq_id`  varchar(255);


--自主下单
ALTER TABLE `%DB_PREFIX%supplier_location` ADD COLUMN `is_auto_order`  tinyint(1) NULL DEFAULT 0 COMMENT '1:消费者(在手机端上)可以直接给该门店支付金额';
ALTER TABLE `%DB_PREFIX%supplier_location` ADD COLUMN `bifanwe_license`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
ALTER TABLE `%DB_PREFIX%supplier_location` ADD COLUMN `bifanwe_other_license`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;


ALTER TABLE `%DB_PREFIX%deal_order` ADD COLUMN `is_auto_order`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '1:门店自主下单标识；1:自主下单;0:非自主下单';
ALTER TABLE `%DB_PREFIX%message` ADD COLUMN `is_read`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:商家未阅读;1:商家已阅读';

UPDATE `%DB_PREFIX%role_node` SET is_delete = 1 where id in (484,503);

ALTER TABLE `%DB_PREFIX%deal_order_item` ADD COLUMN `add_balance_price`  decimal(20,4) NULL DEFAULT 0;
ALTER TABLE `%DB_PREFIX%deal_order_item` ADD COLUMN `add_balance_price_total`  decimal(20,4) NULL DEFAULT 0;
ALTER TABLE `%DB_PREFIX%deal_order_item` ADD COLUMN `refund_status`  tinyint(1) NULL DEFAULT 0;

ALTER TABLE `%DB_PREFIX%deal_coupon` ADD COLUMN `add_balance_price`  decimal(20,4) NULL DEFAULT 0;

ALTER TABLE `%DB_PREFIX%deal_attr` ADD COLUMN `add_balance_price`  decimal(20,4) NOT NULL;
ALTER TABLE `%DB_PREFIX%deal_cart` ADD COLUMN `add_balance_price`  decimal(20,4) NOT NULL;

UPDATE `%DB_PREFIX%conf` set `value` = '2.93' where name = 'DB_VERSION';