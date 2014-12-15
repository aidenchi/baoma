-- phpMyAdmin SQL Dump
-- version 3.3.7
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2014 年 11 月 24 日 10:19
-- 服务器版本: 5.1.63
-- PHP 版本: 5.2.17p1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `newo2o`
--

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_admin`
--

CREATE TABLE IF NOT EXISTS `fanwe_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adm_name` varchar(255) NOT NULL,
  `adm_password` varchar(255) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `role_id` int(11) NOT NULL,
  `login_time` int(11) NOT NULL,
  `login_ip` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_adm_name` (`adm_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `fanwe_admin`
--

INSERT INTO `fanwe_admin` (`id`, `adm_name`, `adm_password`, `is_effect`, `is_delete`, `role_id`, `login_time`, `login_ip`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 1, 0, 4, 1416765247, '222.186.97.53');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_adv`
--

CREATE TABLE IF NOT EXISTS `fanwe_adv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tmpl` varchar(255) NOT NULL,
  `adv_id` varchar(255) NOT NULL,
  `code` text NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `city_ids` varchar(255) NOT NULL,
  `rel_id` int(11) NOT NULL,
  `rel_table` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tmpl` (`tmpl`),
  KEY `adv_id` (`adv_id`),
  KEY `city_ids` (`city_ids`),
  KEY `rel_id` (`rel_id`),
  KEY `rel_table` (`rel_table`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

--
-- 转存表中的数据 `fanwe_adv`
--

INSERT INTO `fanwe_adv` (`id`, `tmpl`, `adv_id`, `code`, `is_effect`, `name`, `city_ids`, `rel_id`, `rel_table`) VALUES
(16, 'fanwe', '首页通栏广告位', '<img src="./public/attachment/201201/4f0137a68577b.jpg" alt="" border="0" />', 1, '首页通栏广告位', '', 0, ''),
(37, 'fanwe', '优惠券首页广告位1', '<img src="./public/attachment/201204/01/16/4f7815f501ac1.jpg" alt="" border="0" />', 1, '优惠首页广告1', '', 0, ''),
(36, 'fanwe', '首页广告位3', '<img src="./public/attachment/201204/01/16/4f7815f501ac1.jpg" alt="" border="0" />', 1, '首页广告3', '', 0, ''),
(15, 'fanwe', '首页商品分类的广告位', '<img src="./public/attachment/201201/4f01369a75566.jpg" alt="" border="0" />', 1, '首页服装分类广告', '', 24, 'shop_cate'),
(35, 'fanwe', '首页广告位2', '<img src="./public/attachment/201204/01/16/4f7815f501ac1.jpg" alt="" border="0" />', 1, '首页广告2', '', 0, ''),
(34, 'fanwe', '首页广告位1', '<img src="./public/attachment/201204/01/16/4f7815f501ac1.jpg" alt="" border="0" height="150" width="712" />', 1, '首页广告1', '', 0, ''),
(23, 'fanwe', '商城首页广告位1', '<img src="./public/attachment/201201/4f013c9a0a488.jpg" alt="" border="0" />', 1, '商城首页广告', '', 0, ''),
(38, 'fanwe', '优惠券首页广告位2', '<img src="./public/attachment/201204/01/16/4f7815f501ac1.jpg" alt="" border="0" />', 1, '优惠首页广告2', '', 0, ''),
(26, 'fanwe', '商城首页广告位2', '<img src="./public/attachment/201201/4f013c9a0a488.jpg" alt="" border="0" />', 1, '商城首页广告', '', 0, ''),
(27, 'fanwe', '商城首页广告位3', '<img src="./public/attachment/201201/4f013c9a0a488.jpg" alt="" border="0" />', 1, '商城首页广告', '', 0, ''),
(42, 'fanwe', '代金券首页广告位3', '<img src="./public/attachment/201204/01/16/4f7815f501ac1.jpg" alt="" border="0" />', 1, '代金券首页3', '', 0, ''),
(41, 'fanwe', '代金券首页广告位2', '<img src="./public/attachment/201204/01/16/4f7815f501ac1.jpg" alt="" border="0" />', 1, '代金券首页2', '', 0, ''),
(39, 'fanwe', '优惠券首页广告位3', '<img src="./public/attachment/201204/01/16/4f7815f501ac1.jpg" alt="" border="0" />', 1, '优惠首页广告3', '', 0, ''),
(40, 'fanwe', '代金券首页广告位1', '<img src="./public/attachment/201204/01/16/4f7815f501ac1.jpg" alt="" border="0" />', 1, '代金券首页1', '', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_api_log`
--

CREATE TABLE IF NOT EXISTS `fanwe_api_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `act` varchar(30) NOT NULL,
  `api` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=97 ;

--
-- 转存表中的数据 `fanwe_api_log`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_api_login`
--

CREATE TABLE IF NOT EXISTS `fanwe_api_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `config` text NOT NULL,
  `class_name` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `bicon` varchar(255) NOT NULL,
  `is_weibo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `fanwe_api_login`
--

INSERT INTO `fanwe_api_login` (`id`, `name`, `config`, `class_name`, `icon`, `bicon`, `is_weibo`) VALUES
(9, '新浪api登录接口', 'a:2:{s:7:"app_key";s:0:"";s:10:"app_secret";s:0:"";}', 'Sina', './public/attachment/201203/17/15/4f64396822524.png', './public/attachment/201203/17/15/4f64396822524.png', 1),
(10, '腾讯微博登录插件', 'a:2:{s:7:"app_key";s:0:"";s:10:"app_secret";s:0:"";}', 'Tencent', './public/attachment/201203/17/15/4f643977758ee.png', './public/attachment/201203/17/15/4f643977758ee.png', 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_apns_devices`
--

CREATE TABLE IF NOT EXISTS `fanwe_apns_devices` (
  `pid` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `clientid` int(11) NOT NULL,
  `appname` varchar(255) NOT NULL,
  `appversion` varchar(25) DEFAULT NULL,
  `deviceuid` char(40) NOT NULL,
  `devicetoken` char(64) NOT NULL,
  `devicename` varchar(255) NOT NULL,
  `devicemodel` varchar(100) NOT NULL,
  `deviceversion` varchar(25) NOT NULL,
  `pushbadge` enum('disabled','enabled') DEFAULT 'disabled',
  `pushalert` enum('disabled','enabled') DEFAULT 'disabled',
  `pushsound` enum('disabled','enabled') DEFAULT 'disabled',
  `development` enum('production','sandbox') CHARACTER SET latin1 NOT NULL DEFAULT 'production',
  `status` enum('active','uninstalled') NOT NULL DEFAULT 'active',
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pid`),
  UNIQUE KEY `appname` (`appname`,`appversion`,`deviceuid`),
  KEY `clientid` (`clientid`),
  KEY `devicetoken` (`devicetoken`),
  KEY `devicename` (`devicename`),
  KEY `devicemodel` (`devicemodel`),
  KEY `deviceversion` (`deviceversion`),
  KEY `pushbadge` (`pushbadge`),
  KEY `pushalert` (`pushalert`),
  KEY `pushsound` (`pushsound`),
  KEY `development` (`development`),
  KEY `status` (`status`),
  KEY `created` (`created`),
  KEY `modified` (`modified`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Store unique devices' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `fanwe_apns_devices`
--

INSERT INTO `fanwe_apns_devices` (`pid`, `clientid`, `appname`, `appversion`, `deviceuid`, `devicetoken`, `devicename`, `devicemodel`, `deviceversion`, `pushbadge`, `pushalert`, `pushsound`, `development`, `status`, `created`, `modified`) VALUES
(1, 0, '方维o2o', '1.0', 'c1e34ff19505c5b11d876bdffb451aa8', '6b2e73be2ec113452bc020ec7d05b6e1e0f09ed6ae95c6c7ec20bedd6ae3b21b', '酷酷菜', 'iPhone', '5.0.1', 'enabled', 'enabled', 'enabled', 'production', 'active', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_apns_device_history`
--

CREATE TABLE IF NOT EXISTS `fanwe_apns_device_history` (
  `pid` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `clientid` int(11) NOT NULL,
  `appname` varchar(255) NOT NULL,
  `appversion` varchar(25) DEFAULT NULL,
  `deviceuid` char(40) NOT NULL,
  `devicetoken` char(64) NOT NULL,
  `devicename` varchar(255) NOT NULL,
  `devicemodel` varchar(100) NOT NULL,
  `deviceversion` varchar(25) NOT NULL,
  `pushbadge` enum('disabled','enabled') DEFAULT 'disabled',
  `pushalert` enum('disabled','enabled') DEFAULT 'disabled',
  `pushsound` enum('disabled','enabled') DEFAULT 'disabled',
  `development` enum('production','sandbox') CHARACTER SET latin1 NOT NULL DEFAULT 'production',
  `status` enum('active','uninstalled') NOT NULL DEFAULT 'active',
  `archived` datetime NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `clientid` (`clientid`),
  KEY `devicetoken` (`devicetoken`),
  KEY `devicename` (`devicename`),
  KEY `devicemodel` (`devicemodel`),
  KEY `deviceversion` (`deviceversion`),
  KEY `pushbadge` (`pushbadge`),
  KEY `pushalert` (`pushalert`),
  KEY `pushsound` (`pushsound`),
  KEY `development` (`development`),
  KEY `status` (`status`),
  KEY `appname` (`appname`),
  KEY `appversion` (`appversion`),
  KEY `deviceuid` (`deviceuid`),
  KEY `archived` (`archived`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Store unique device history' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `fanwe_apns_device_history`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_apns_logs`
--

CREATE TABLE IF NOT EXISTS `fanwe_apns_logs` (
  `pid` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `clientid` varchar(64) NOT NULL,
  `fk_device` int(9) unsigned NOT NULL,
  `message` varchar(255) NOT NULL,
  `delivery` datetime NOT NULL,
  `status` enum('queued','delivered','failed') CHARACTER SET latin1 NOT NULL DEFAULT 'queued',
  `created` int(11) NOT NULL DEFAULT '0',
  `modified` int(11) NOT NULL DEFAULT '0',
  `message_id` int(11) NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `clientid` (`clientid`),
  KEY `fk_device` (`fk_device`),
  KEY `status` (`status`),
  KEY `created` (`created`),
  KEY `modified` (`modified`),
  KEY `message` (`message`),
  KEY `delivery` (`delivery`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Messages to push to APNS' AUTO_INCREMENT=102 ;

--
-- 转存表中的数据 `fanwe_apns_logs`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_apns_messages`
--

CREATE TABLE IF NOT EXISTS `fanwe_apns_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `send_time` int(11) NOT NULL,
  `user_names` text NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '0:未发送 1:发送中 2:已发送',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `fanwe_apns_messages`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_area`
--

CREATE TABLE IF NOT EXISTS `fanwe_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `city_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=50 ;

--
-- 转存表中的数据 `fanwe_area`
--

INSERT INTO `fanwe_area` (`id`, `name`, `city_id`, `sort`, `pid`) VALUES
(8, '鼓楼区', 15, 1, 0),
(9, '晋安区', 15, 2, 0),
(10, '台江区', 15, 3, 0),
(11, '仓山区', 15, 4, 0),
(12, '马尾区', 15, 5, 0),
(13, '五一广场', 15, 6, 8),
(14, '东街口', 15, 7, 8),
(15, '福州广场', 15, 8, 8),
(16, '省体育中心', 15, 9, 8),
(17, '西禅寺', 15, 10, 8),
(18, '社会主义学院', 15, 11, 8),
(19, '西洪路', 15, 12, 8),
(20, '屏山', 15, 13, 8),
(21, '中亭街', 15, 14, 10),
(22, '六一中路', 15, 15, 10),
(23, '龙华大厦', 15, 16, 10),
(24, '时代名城', 15, 17, 10),
(25, '台江路', 15, 18, 10),
(26, '宝龙城市广场', 15, 19, 10),
(27, '万象城', 15, 20, 10),
(28, '桥亭', 15, 21, 10),
(29, '小桥头', 15, 22, 10),
(30, '交通路', 15, 23, 10),
(31, '中亭街', 15, 24, 10),
(32, '白马河', 15, 25, 10),
(33, '博美诗邦', 15, 26, 10),
(34, '观海路', 15, 27, 11),
(35, '三叉街新村', 15, 28, 11),
(36, '北京金山', 15, 29, 11),
(37, '仓山镇', 15, 30, 11),
(38, '螺洲', 15, 31, 11),
(39, '三高路', 15, 32, 11),
(40, '下渡', 15, 33, 11),
(41, '工农路', 15, 34, 11),
(42, '首山路', 15, 35, 11),
(43, '王庄新村', 15, 36, 9),
(44, '岳峰路', 15, 37, 9),
(45, '融侨东区', 15, 38, 9),
(46, '五里亭', 15, 39, 9),
(47, '五一新村', 15, 40, 9),
(48, '福光路', 15, 41, 9),
(49, '五里亭', 15, 42, 9);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_article`
--

CREATE TABLE IF NOT EXISTS `fanwe_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `cate_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `add_admin_id` int(11) NOT NULL COMMENT '发布人',
  `is_effect` tinyint(4) NOT NULL,
  `rel_url` varchar(255) NOT NULL COMMENT '自动跳转的外链',
  `update_admin_id` int(11) NOT NULL COMMENT '更新人',
  `is_delete` tinyint(4) NOT NULL,
  `click_count` int(11) NOT NULL COMMENT '点击数',
  `sort` int(11) NOT NULL,
  `seo_title` text NOT NULL,
  `seo_keyword` text NOT NULL,
  `seo_description` text NOT NULL,
  `uname` varchar(255) NOT NULL,
  `notice_page` tinyint(1) NOT NULL,
  `sub_title` varchar(255) NOT NULL,
  `brief` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cate_id` (`cate_id`),
  KEY `create_time` (`create_time`),
  KEY `update_time` (`update_time`),
  KEY `click_count` (`click_count`),
  KEY `sort` (`sort`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=44 ;

--
-- 转存表中的数据 `fanwe_article`
--

INSERT INTO `fanwe_article` (`id`, `title`, `content`, `cate_id`, `create_time`, `update_time`, `add_admin_id`, `is_effect`, `rel_url`, `update_admin_id`, `is_delete`, `click_count`, `sort`, `seo_title`, `seo_keyword`, `seo_description`, `uname`, `notice_page`, `sub_title`, `brief`) VALUES
(20, '关于我们', '关于我们', 11, 0, 1305160934, 0, 1, '', 0, 0, 18, 11, '', '', '', '', 0, '', ''),
(37, '岁末回馈5折原价1299正品七匹狼男装外套时尚中长装羽绒服701604', '', 18, 1325451781, 1325451781, 0, 1, 'u:shop|goods|id=48', 0, 0, 1, 27, '', '', '', '', 0, '', ''),
(38, '老刘野生大鱼坊超值套餐', '', 18, 1325451857, 1325451857, 0, 1, 'u:tuan|deal|id=39', 0, 0, 0, 28, '', '', '', '', 0, '', ''),
(39, '全场新品上市', '', 18, 1325451918, 1325451918, 0, 1, 'u:shop|rec#rnew', 0, 0, 0, 29, '', '', '', 'new', 0, '', ''),
(40, '优惠券频道 更多优惠精彩', '', 18, 1325452086, 1325452086, 0, 1, 'u:youhui|index', 0, 0, 1, 30, '', '', '', 'youhui', 0, '', ''),
(27, '免责条款', '免责条款', 19, 1305160898, 1305160898, 0, 1, '', 0, 0, 3, 18, '', '', '', '', 0, '', ''),
(28, '隐私保护', '隐私保护', 19, 1305160911, 1305160911, 0, 1, '', 0, 0, 4, 19, '', '', '', '', 0, '', ''),
(29, '咨询热点', '咨询热点', 19, 1305160923, 1305160923, 0, 1, '', 0, 0, 2, 20, '', '', '', '', 0, '', ''),
(30, '联系我们', '联系我们', 19, 1305160934, 1305160934, 0, 1, '', 0, 0, 30, 21, '', '', '', '', 0, '', ''),
(31, '公司简介', '公司简介', 19, 1305160946, 1305160946, 0, 1, '', 0, 0, 92, 22, '', '', '', '', 0, '', ''),
(5, '如何抽奖', '如何抽奖', 19, 0, 1305489528, 0, 1, '', 0, 0, 3, 0, '', '', '', '', 0, '', ''),
(33, '女装新品热卖中!', '', 18, 1325451464, 1325451573, 0, 1, 'u:shop|cate|id=30', 0, 0, 2, 23, '', '', '', '', 0, '', ''),
(6, '加入我们', '加入我们', 11, 0, 1324319464, 0, 1, 'u:shop|user#register', 0, 0, 22, 2, '', '', '', '', 0, '', ''),
(7, '开放API', '', 9, 0, 1324238746, 0, 1, 'u:tuan|dhapi', 0, 0, 4, 1, '', '', '', '', 0, '', ''),
(8, 'RSS订阅', '', 9, 0, 1324083243, 0, 1, 'u:tuan|rss', 0, 0, 0, 4, '', '', '', '', 0, '', ''),
(9, '商家登录', '', 10, 0, 1324069250, 0, 1, 'u:tuan|coupon#supplier_login', 0, 0, 0, 5, '', '', '', '', 0, '', ''),
(10, '友情链接', '', 10, 0, 1324083193, 0, 1, 'u:shop|link', 0, 0, 0, 6, '', '', '', '', 0, '', ''),
(34, '品牌馆开张', '', 18, 1325451633, 1325451633, 0, 1, 'u:shop|brand', 0, 0, 0, 24, '', '', '', '', 0, '', ''),
(35, '各种特价，抢到手软！', '各种特价，抢到手软！', 18, 1325451669, 1325451669, 0, 1, '', 0, 0, 0, 25, '', '', '', '', 0, '', ''),
(36, '# 5元奖励包装评论 5000万礼卡免费领', '5元奖励包装评论 5000万礼卡免费领', 18, 1325451735, 1325451735, 0, 1, '', 0, 0, 0, 26, '', '', '', '', 0, '', ''),
(41, '2月情人密语之约“惠”生活指南！', '', 22, 1329333829, 1329333855, 0, 1, 'u:youhui|fcate', 0, 0, 1, 31, '', '', '', '', 3, '每周播报', '情人节约会哪里走？丁丁优惠带您吃喝玩乐应有尽有，网罗沪上甜点热饮，休闲娱乐，“惠”生活的亲密爱人们，赶快点击进入挑选你的情人节行程吧！'),
(42, '美罗城“因微爱情”主题活动开始啦！', '', 22, 1329334475, 1329334475, 0, 1, 'u:youhui|event', 0, 0, 0, 32, '', '', '', '', 3, '独家活动', '2012年2月11日至3月14日，微博“微爱情@美罗城”情人节晒出爱的礼物或宣言，即有机会赢取价值20000元大奖“马尔代夫”双人游、奔驰情人节礼品。'),
(43, '“爱”月情人节 找情侣送约会基金', '', 22, 1329334503, 1329334503, 0, 1, 'u:youhui|event', 0, 0, 0, 33, '', '', '', '', 3, '全城热恋', '圣诞节一个人过，情人节还想一个人过？在世界末日前的最后一个情人节，丁丁网为你找到最match的TA！更有200元约会基金为你们随时待命……');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_article_cate`
--

CREATE TABLE IF NOT EXISTS `fanwe_article_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `brief` varchar(255) NOT NULL COMMENT '描述',
  `pid` int(11) NOT NULL,
  `is_effect` tinyint(4) NOT NULL,
  `is_delete` tinyint(4) NOT NULL,
  `type_id` tinyint(1) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `type_id` (`type_id`),
  KEY `sort` (`sort`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- 转存表中的数据 `fanwe_article_cate`
--

INSERT INTO `fanwe_article_cate` (`id`, `title`, `brief`, `pid`, `is_effect`, `is_delete`, `type_id`, `sort`) VALUES
(11, '公司信息', '', 0, 1, 0, 1, 4),
(10, '商务合作', '', 0, 1, 0, 1, 2),
(9, '获取更新', '', 0, 1, 0, 1, 3),
(7, '用户帮助', '', 0, 1, 0, 1, 1),
(18, '商城公告', '', 0, 1, 0, 2, 5),
(19, '系统文章', '', 0, 1, 0, 3, 6),
(22, '热门推荐', '', 0, 1, 0, 2, 7);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_attr_stock`
--

CREATE TABLE IF NOT EXISTS `fanwe_attr_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) NOT NULL,
  `attr_cfg` text NOT NULL,
  `stock_cfg` int(11) NOT NULL,
  `attr_str` text NOT NULL,
  `buy_count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=92 ;

--
-- 转存表中的数据 `fanwe_attr_stock`
--

INSERT INTO `fanwe_attr_stock` (`id`, `deal_id`, `attr_cfg`, `stock_cfg`, `attr_str`, `buy_count`) VALUES
(89, 40, 'a:2:{i:12;s:6:"红色";i:13;s:6:"大码";}', 10, '红色大码', 0),
(90, 40, 'a:2:{i:12;s:6:"红色";i:13;s:6:"中码";}', 5, '红色中码', 0),
(91, 40, 'a:2:{i:12;s:6:"红色";i:13;s:6:"均码";}', 1000, '红色均码', 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_auto_cache`
--

CREATE TABLE IF NOT EXISTS `fanwe_auto_cache` (
  `cache_key` varchar(100) NOT NULL,
  `cache_type` varchar(100) NOT NULL,
  `cache_data` text NOT NULL,
  `cache_time` int(11) NOT NULL,
  PRIMARY KEY (`cache_key`,`cache_type`),
  KEY `cache_type` (`cache_type`),
  KEY `cache_key` (`cache_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_auto_cache`
--

INSERT INTO `fanwe_auto_cache` (`cache_key`, `cache_type`, `cache_data`, `cache_time`) VALUES
('FYOUHUI_FILTER_NAV_CACHE_AUTO_CACHE_15', 'fyouhui_filter_nav_cache_auto_cache', 'a:4:{s:9:"area_list";a:6:{i:0;a:7:{s:2:"id";s:2:"12";s:4:"name";s:9:"马尾区";s:7:"city_id";s:2:"15";s:4:"sort";s:1:"5";s:3:"pid";s:1:"0";s:3:"url";s:28:"/youhui.php?ctl=fcate&aid=12";s:5:"count";s:1:"0";}i:1;a:7:{s:2:"id";s:2:"11";s:4:"name";s:9:"仓山区";s:7:"city_id";s:2:"15";s:4:"sort";s:1:"4";s:3:"pid";s:1:"0";s:3:"url";s:28:"/youhui.php?ctl=fcate&aid=11";s:5:"count";s:1:"0";}i:2;a:7:{s:2:"id";s:2:"10";s:4:"name";s:9:"台江区";s:7:"city_id";s:2:"15";s:4:"sort";s:1:"3";s:3:"pid";s:1:"0";s:3:"url";s:28:"/youhui.php?ctl=fcate&aid=10";s:5:"count";s:1:"0";}i:3;a:7:{s:2:"id";s:1:"9";s:4:"name";s:9:"晋安区";s:7:"city_id";s:2:"15";s:4:"sort";s:1:"2";s:3:"pid";s:1:"0";s:3:"url";s:27:"/youhui.php?ctl=fcate&aid=9";s:5:"count";s:1:"0";}i:4;a:7:{s:2:"id";s:1:"8";s:4:"name";s:9:"鼓楼区";s:7:"city_id";s:2:"15";s:4:"sort";s:1:"1";s:3:"pid";s:1:"0";s:3:"url";s:27:"/youhui.php?ctl=fcate&aid=8";s:5:"count";s:1:"0";}i:5;a:5:{s:4:"name";s:6:"全部";s:2:"id";i:0;s:3:"act";i:1;s:3:"url";s:21:"/youhui.php?ctl=fcate";s:5:"count";s:1:"2";}}s:9:"quan_list";N;s:9:"cate_list";a:11:{i:0;a:15:{s:2:"id";s:2:"17";s:4:"name";s:12:"母婴亲子";s:5:"brief";s:0:"";s:3:"pid";s:1:"0";s:9:"is_delete";s:1:"0";s:9:"is_effect";s:1:"1";s:4:"sort";s:2:"10";s:5:"uname";s:0:"";s:9:"recommend";s:1:"1";s:4:"icon";s:0:"";s:10:"rec_youhui";s:1:"1";s:10:"rec_daijin";s:1:"1";s:8:"icon_img";s:0:"";s:3:"url";s:28:"/youhui.php?ctl=fcate&cid=17";s:5:"count";s:1:"0";}i:1;a:15:{s:2:"id";s:2:"16";s:4:"name";s:12:"医疗健康";s:5:"brief";s:0:"";s:3:"pid";s:1:"0";s:9:"is_delete";s:1:"0";s:9:"is_effect";s:1:"1";s:4:"sort";s:1:"9";s:5:"uname";s:0:"";s:9:"recommend";s:1:"1";s:4:"icon";s:0:"";s:10:"rec_youhui";s:1:"1";s:10:"rec_daijin";s:1:"1";s:8:"icon_img";s:0:"";s:3:"url";s:28:"/youhui.php?ctl=fcate&cid=16";s:5:"count";s:1:"0";}i:2;a:15:{s:2:"id";s:2:"15";s:4:"name";s:12:"我要结婚";s:5:"brief";s:0:"";s:3:"pid";s:1:"0";s:9:"is_delete";s:1:"0";s:9:"is_effect";s:1:"1";s:4:"sort";s:1:"8";s:5:"uname";s:0:"";s:9:"recommend";s:1:"1";s:4:"icon";s:0:"";s:10:"rec_youhui";s:1:"1";s:10:"rec_daijin";s:1:"1";s:8:"icon_img";s:0:"";s:3:"url";s:28:"/youhui.php?ctl=fcate&cid=15";s:5:"count";s:1:"0";}i:3;a:15:{s:2:"id";s:2:"14";s:4:"name";s:12:"都市丽人";s:5:"brief";s:0:"";s:3:"pid";s:1:"0";s:9:"is_delete";s:1:"0";s:9:"is_effect";s:1:"1";s:4:"sort";s:1:"7";s:5:"uname";s:0:"";s:9:"recommend";s:1:"1";s:4:"icon";s:0:"";s:10:"rec_youhui";s:1:"1";s:10:"rec_daijin";s:1:"1";s:8:"icon_img";s:0:"";s:3:"url";s:28:"/youhui.php?ctl=fcate&cid=14";s:5:"count";s:1:"0";}i:4;a:15:{s:2:"id";s:2:"13";s:4:"name";s:12:"爱车学车";s:5:"brief";s:0:"";s:3:"pid";s:1:"0";s:9:"is_delete";s:1:"0";s:9:"is_effect";s:1:"1";s:4:"sort";s:1:"6";s:5:"uname";s:0:"";s:9:"recommend";s:1:"1";s:4:"icon";s:0:"";s:10:"rec_youhui";s:1:"1";s:10:"rec_daijin";s:1:"1";s:8:"icon_img";s:0:"";s:3:"url";s:28:"/youhui.php?ctl=fcate&cid=13";s:5:"count";s:1:"0";}i:5;a:15:{s:2:"id";s:2:"12";s:4:"name";s:12:"网购精品";s:5:"brief";s:0:"";s:3:"pid";s:1:"0";s:9:"is_delete";s:1:"0";s:9:"is_effect";s:1:"1";s:4:"sort";s:1:"5";s:5:"uname";s:0:"";s:9:"recommend";s:1:"1";s:4:"icon";s:0:"";s:10:"rec_youhui";s:1:"1";s:10:"rec_daijin";s:1:"1";s:8:"icon_img";s:0:"";s:3:"url";s:28:"/youhui.php?ctl=fcate&cid=12";s:5:"count";s:1:"0";}i:6;a:15:{s:2:"id";s:2:"11";s:4:"name";s:12:"酒店旅游";s:5:"brief";s:0:"";s:3:"pid";s:1:"0";s:9:"is_delete";s:1:"0";s:9:"is_effect";s:1:"1";s:4:"sort";s:1:"4";s:5:"uname";s:0:"";s:9:"recommend";s:1:"1";s:4:"icon";s:0:"";s:10:"rec_youhui";s:1:"1";s:10:"rec_daijin";s:1:"1";s:8:"icon_img";s:0:"";s:3:"url";s:28:"/youhui.php?ctl=fcate&cid=11";s:5:"count";s:1:"0";}i:7;a:15:{s:2:"id";s:2:"10";s:4:"name";s:12:"生活服务";s:5:"brief";s:0:"";s:3:"pid";s:1:"0";s:9:"is_delete";s:1:"0";s:9:"is_effect";s:1:"1";s:4:"sort";s:1:"3";s:5:"uname";s:0:"";s:9:"recommend";s:1:"1";s:4:"icon";s:0:"";s:10:"rec_youhui";s:1:"1";s:10:"rec_daijin";s:1:"1";s:8:"icon_img";s:0:"";s:3:"url";s:28:"/youhui.php?ctl=fcate&cid=10";s:5:"count";s:1:"0";}i:8;a:15:{s:2:"id";s:1:"9";s:4:"name";s:12:"休闲娱乐";s:5:"brief";s:0:"";s:3:"pid";s:1:"0";s:9:"is_delete";s:1:"0";s:9:"is_effect";s:1:"1";s:4:"sort";s:1:"2";s:5:"uname";s:0:"";s:9:"recommend";s:1:"1";s:4:"icon";s:0:"";s:10:"rec_youhui";s:1:"1";s:10:"rec_daijin";s:1:"1";s:8:"icon_img";s:0:"";s:3:"url";s:27:"/youhui.php?ctl=fcate&cid=9";s:5:"count";s:1:"1";}i:9;a:15:{s:2:"id";s:1:"8";s:4:"name";s:12:"餐饮美食";s:5:"brief";s:0:"";s:3:"pid";s:1:"0";s:9:"is_delete";s:1:"0";s:9:"is_effect";s:1:"1";s:4:"sort";s:1:"1";s:5:"uname";s:0:"";s:9:"recommend";s:1:"1";s:4:"icon";s:0:"";s:10:"rec_youhui";s:1:"1";s:10:"rec_daijin";s:1:"1";s:8:"icon_img";s:0:"";s:3:"url";s:27:"/youhui.php?ctl=fcate&cid=8";s:5:"count";s:1:"1";}i:10;a:5:{s:4:"name";s:6:"全部";s:3:"cid";i:0;s:3:"act";i:1;s:3:"url";s:21:"/youhui.php?ctl=fcate";s:5:"count";s:1:"2";}}s:10:"scate_list";N;}', 1416591093),
('STORE_FILTER_NAV_CACHE_AUTO_CACHE_15', 'store_filter_nav_cache_auto_cache', 'a:4:{s:9:"area_list";a:6:{i:0;a:7:{s:2:"id";s:2:"12";s:4:"name";s:9:"马尾区";s:7:"city_id";s:2:"15";s:4:"sort";s:1:"5";s:3:"pid";s:1:"0";s:3:"url";s:28:"/youhui.php?ctl=store&aid=12";s:5:"count";s:1:"0";}i:1;a:7:{s:2:"id";s:2:"11";s:4:"name";s:9:"仓山区";s:7:"city_id";s:2:"15";s:4:"sort";s:1:"4";s:3:"pid";s:1:"0";s:3:"url";s:28:"/youhui.php?ctl=store&aid=11";s:5:"count";s:1:"0";}i:2;a:7:{s:2:"id";s:2:"10";s:4:"name";s:9:"台江区";s:7:"city_id";s:2:"15";s:4:"sort";s:1:"3";s:3:"pid";s:1:"0";s:3:"url";s:28:"/youhui.php?ctl=store&aid=10";s:5:"count";s:1:"1";}i:3;a:7:{s:2:"id";s:1:"9";s:4:"name";s:9:"晋安区";s:7:"city_id";s:2:"15";s:4:"sort";s:1:"2";s:3:"pid";s:1:"0";s:3:"url";s:27:"/youhui.php?ctl=store&aid=9";s:5:"count";s:1:"2";}i:4;a:7:{s:2:"id";s:1:"8";s:4:"name";s:9:"鼓楼区";s:7:"city_id";s:2:"15";s:4:"sort";s:1:"1";s:3:"pid";s:1:"0";s:3:"url";s:27:"/youhui.php?ctl=store&aid=8";s:5:"count";s:1:"6";}i:5;a:5:{s:4:"name";s:6:"全部";s:2:"id";i:0;s:3:"act";i:1;s:3:"url";s:21:"/youhui.php?ctl=store";s:5:"count";s:1:"7";}}s:9:"quan_list";N;s:9:"cate_list";a:11:{i:0;a:15:{s:2:"id";s:2:"17";s:4:"name";s:12:"母婴亲子";s:5:"brief";s:0:"";s:3:"pid";s:1:"0";s:9:"is_delete";s:1:"0";s:9:"is_effect";s:1:"1";s:4:"sort";s:2:"10";s:5:"uname";s:0:"";s:9:"recommend";s:1:"1";s:4:"icon";s:0:"";s:10:"rec_youhui";s:1:"1";s:10:"rec_daijin";s:1:"1";s:8:"icon_img";s:0:"";s:3:"url";s:28:"/youhui.php?ctl=store&cid=17";s:5:"count";s:1:"0";}i:1;a:15:{s:2:"id";s:2:"16";s:4:"name";s:12:"医疗健康";s:5:"brief";s:0:"";s:3:"pid";s:1:"0";s:9:"is_delete";s:1:"0";s:9:"is_effect";s:1:"1";s:4:"sort";s:1:"9";s:5:"uname";s:0:"";s:9:"recommend";s:1:"1";s:4:"icon";s:0:"";s:10:"rec_youhui";s:1:"1";s:10:"rec_daijin";s:1:"1";s:8:"icon_img";s:0:"";s:3:"url";s:28:"/youhui.php?ctl=store&cid=16";s:5:"count";s:1:"0";}i:2;a:15:{s:2:"id";s:2:"15";s:4:"name";s:12:"我要结婚";s:5:"brief";s:0:"";s:3:"pid";s:1:"0";s:9:"is_delete";s:1:"0";s:9:"is_effect";s:1:"1";s:4:"sort";s:1:"8";s:5:"uname";s:0:"";s:9:"recommend";s:1:"1";s:4:"icon";s:0:"";s:10:"rec_youhui";s:1:"1";s:10:"rec_daijin";s:1:"1";s:8:"icon_img";s:0:"";s:3:"url";s:28:"/youhui.php?ctl=store&cid=15";s:5:"count";s:1:"0";}i:3;a:15:{s:2:"id";s:2:"14";s:4:"name";s:12:"都市丽人";s:5:"brief";s:0:"";s:3:"pid";s:1:"0";s:9:"is_delete";s:1:"0";s:9:"is_effect";s:1:"1";s:4:"sort";s:1:"7";s:5:"uname";s:0:"";s:9:"recommend";s:1:"1";s:4:"icon";s:0:"";s:10:"rec_youhui";s:1:"1";s:10:"rec_daijin";s:1:"1";s:8:"icon_img";s:0:"";s:3:"url";s:28:"/youhui.php?ctl=store&cid=14";s:5:"count";s:1:"0";}i:4;a:15:{s:2:"id";s:2:"13";s:4:"name";s:12:"爱车学车";s:5:"brief";s:0:"";s:3:"pid";s:1:"0";s:9:"is_delete";s:1:"0";s:9:"is_effect";s:1:"1";s:4:"sort";s:1:"6";s:5:"uname";s:0:"";s:9:"recommend";s:1:"1";s:4:"icon";s:0:"";s:10:"rec_youhui";s:1:"1";s:10:"rec_daijin";s:1:"1";s:8:"icon_img";s:0:"";s:3:"url";s:28:"/youhui.php?ctl=store&cid=13";s:5:"count";s:1:"0";}i:5;a:15:{s:2:"id";s:2:"12";s:4:"name";s:12:"网购精品";s:5:"brief";s:0:"";s:3:"pid";s:1:"0";s:9:"is_delete";s:1:"0";s:9:"is_effect";s:1:"1";s:4:"sort";s:1:"5";s:5:"uname";s:0:"";s:9:"recommend";s:1:"1";s:4:"icon";s:0:"";s:10:"rec_youhui";s:1:"1";s:10:"rec_daijin";s:1:"1";s:8:"icon_img";s:0:"";s:3:"url";s:28:"/youhui.php?ctl=store&cid=12";s:5:"count";s:1:"0";}i:6;a:15:{s:2:"id";s:2:"11";s:4:"name";s:12:"酒店旅游";s:5:"brief";s:0:"";s:3:"pid";s:1:"0";s:9:"is_delete";s:1:"0";s:9:"is_effect";s:1:"1";s:4:"sort";s:1:"4";s:5:"uname";s:0:"";s:9:"recommend";s:1:"1";s:4:"icon";s:0:"";s:10:"rec_youhui";s:1:"1";s:10:"rec_daijin";s:1:"1";s:8:"icon_img";s:0:"";s:3:"url";s:28:"/youhui.php?ctl=store&cid=11";s:5:"count";s:1:"0";}i:7;a:15:{s:2:"id";s:2:"10";s:4:"name";s:12:"生活服务";s:5:"brief";s:0:"";s:3:"pid";s:1:"0";s:9:"is_delete";s:1:"0";s:9:"is_effect";s:1:"1";s:4:"sort";s:1:"3";s:5:"uname";s:0:"";s:9:"recommend";s:1:"1";s:4:"icon";s:0:"";s:10:"rec_youhui";s:1:"1";s:10:"rec_daijin";s:1:"1";s:8:"icon_img";s:0:"";s:3:"url";s:28:"/youhui.php?ctl=store&cid=10";s:5:"count";s:1:"1";}i:8;a:15:{s:2:"id";s:1:"9";s:4:"name";s:12:"休闲娱乐";s:5:"brief";s:0:"";s:3:"pid";s:1:"0";s:9:"is_delete";s:1:"0";s:9:"is_effect";s:1:"1";s:4:"sort";s:1:"2";s:5:"uname";s:0:"";s:9:"recommend";s:1:"1";s:4:"icon";s:0:"";s:10:"rec_youhui";s:1:"1";s:10:"rec_daijin";s:1:"1";s:8:"icon_img";s:0:"";s:3:"url";s:27:"/youhui.php?ctl=store&cid=9";s:5:"count";s:1:"0";}i:9;a:15:{s:2:"id";s:1:"8";s:4:"name";s:12:"餐饮美食";s:5:"brief";s:0:"";s:3:"pid";s:1:"0";s:9:"is_delete";s:1:"0";s:9:"is_effect";s:1:"1";s:4:"sort";s:1:"1";s:5:"uname";s:0:"";s:9:"recommend";s:1:"1";s:4:"icon";s:0:"";s:10:"rec_youhui";s:1:"1";s:10:"rec_daijin";s:1:"1";s:8:"icon_img";s:0:"";s:3:"url";s:27:"/youhui.php?ctl=store&cid=8";s:5:"count";s:1:"5";}i:10;a:5:{s:4:"name";s:6:"全部";s:3:"cid";i:0;s:3:"act";i:1;s:3:"url";s:21:"/youhui.php?ctl=store";s:5:"count";s:1:"7";}}s:10:"scate_list";N;}', 1416765236);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_brand`
--

CREATE TABLE IF NOT EXISTS `fanwe_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `brand_promote_logo` varchar(255) NOT NULL,
  `brief` text NOT NULL,
  `sort` int(11) NOT NULL,
  `shop_cate_id` int(11) NOT NULL,
  `brand_promote` tinyint(1) NOT NULL,
  `begin_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `time_status` tinyint(1) NOT NULL COMMENT '0:已上线 1:未上线 2:已过期',
  `dy_count` int(11) DEFAULT '0' COMMENT '品牌订阅数量',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `fanwe_brand`
--

INSERT INTO `fanwe_brand` (`id`, `name`, `logo`, `brand_promote_logo`, `brief`, `sort`, `shop_cate_id`, `brand_promote`, `begin_time`, `end_time`, `time_status`, `dy_count`) VALUES
(8, '耐克', './public/attachment/201201/4f0125515a461.gif', '', '耐克商标，图案是个小钩子，造型简洁有力，急如闪电，一看就让人想到使用耐克体育用品后所产生的速度和爆发力。', 2, 25, 0, 0, 0, 0, 0),
(7, '达芙妮', './public/attachment/201201/4f0124a1e1447.gif', '', '达芙妮的名字来源于希腊女神Daphne与太阳神阿波罗的爱情神话，空间主题的设计象征着对爱亘古不变的追逐。', 1, 24, 0, 0, 0, 0, 0),
(9, '南极人', './public/attachment/201201/4f012585146cb.gif', '', '南极人成立于1998年，累计销售额近90亿，拥有30000多个销售网点，品牌覆盖率高达89%，14年中国针织行业家喻户晓的领先品牌，屡次创造行业奇迹，是中国纺织行业的领导品牌.', 3, 24, 0, 0, 0, 0, 0),
(10, '茵佳妮', './public/attachment/201201/4f0125db13be8.gif', '', '“茵佳妮”不仅仅为消费者提供服装，更注重为顾客提供全新的品牌体验与内心共鸣，契合顾客群文化内涵注入品牌力量。“incolour茵佳妮”需要的是顾客发自内心的认可与热爱，而并非单一的着装感受。', 4, 24, 0, 0, 0, 0, 0),
(11, '歌莉娅', './public/attachment/201201/4f0126234229b.gif', '', '歌莉娅, 诞生于1995年以来, 不断地周游列国探索采撷, 将潮流与各地文化融合, 创作时尚又具有气质的女性服饰。我们相信「旅行就是生活」--世界著名童话故事大师安徒生的经典名言.', 5, 24, 0, 0, 0, 0, 0),
(12, '七匹狼', './public/attachment/201201/4f01322901e23.gif', '', '七匹狼狼文化的理念是勇敢，忠诚，沟通，力量，团队，不屈，自信。追逐人生，男人不止一面。', 6, 31, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_brand_dy`
--

CREATE TABLE IF NOT EXISTS `fanwe_brand_dy` (
  `uid` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  PRIMARY KEY (`uid`,`brand_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_brand_dy`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_conf`
--

CREATE TABLE IF NOT EXISTS `fanwe_conf` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=186 ;

--
-- 转存表中的数据 `fanwe_conf`
--

INSERT INTO `fanwe_conf` (`id`, `name`, `value`, `group_id`, `input_type`, `value_scope`, `is_effect`, `is_conf`, `sort`) VALUES
(1, 'DEFAULT_ADMIN', 'admin', 1, 0, '', 1, 0, 0),
(2, 'URL_MODEL', '0', 1, 1, '0,1', 1, 1, 3),
(3, 'AUTH_KEY', 'fanwe', 1, 0, '', 1, 1, 4),
(4, 'TIME_ZONE', '8', 1, 1, '0,8', 1, 1, 1),
(5, 'ADMIN_LOG', '1', 1, 1, '0,1', 0, 1, 0),
(6, 'DB_VERSION', '2.93', 0, 0, '', 1, 0, 0),
(7, 'DB_VOL_MAXSIZE', '8000000', 1, 0, '', 1, 1, 11),
(8, 'WATER_MARK', './public/attachment/201011/4cdde85a27105.gif', 2, 2, '', 1, 1, 48),
(24, 'CURRENCY_UNIT', '￥', 3, 0, '', 1, 1, 21),
(10, 'BIG_WIDTH', '500', 2, 0, '', 0, 0, 49),
(11, 'BIG_HEIGHT', '500', 2, 0, '', 0, 0, 50),
(12, 'SMALL_WIDTH', '200', 2, 0, '', 0, 0, 51),
(13, 'SMALL_HEIGHT', '200', 2, 0, '', 0, 0, 52),
(14, 'WATER_ALPHA', '75', 2, 0, '', 1, 1, 53),
(15, 'WATER_POSITION', '4', 2, 1, '1,2,3,4,5', 1, 1, 54),
(16, 'MAX_IMAGE_SIZE', '300000', 2, 0, '', 1, 1, 55),
(17, 'ALLOW_IMAGE_EXT', 'jpg,gif,png', 2, 0, '', 1, 1, 56),
(18, 'MAX_FILE_SIZE', '1', 1, 0, '', 0, 1, 0),
(19, 'ALLOW_FILE_EXT', '1', 1, 0, '', 0, 1, 0),
(20, 'BG_COLOR', '#ffffff', 2, 0, '', 0, 0, 57),
(21, 'IS_WATER_MARK', '1', 2, 1, '0,1', 1, 1, 58),
(22, 'TEMPLATE', 'qch2014', 3, 0, '', 1, 1, 17),
(126, 'YOUHUI_SEND_LIMIT', '5', 5, 0, '', 1, 1, 10),
(25, 'SCORE_UNIT', '积分', 3, 0, '', 1, 1, 22),
(26, 'USER_VERIFY', '1', 4, 1, '0,1', 1, 1, 63),
(27, 'SHOP_LOGO', './public/attachment/201011/4cdd501dc023b.png', 3, 2, '', 1, 1, 19),
(28, 'SHOP_LANG', 'zh-cn', 3, 1, 'zh-cn,zh-tw,en-us', 1, 1, 18),
(29, 'SHOP_TITLE', '方维o2o商业系统', 3, 0, '', 1, 1, 13),
(30, 'SHOP_KEYWORD', '方维o2o商业系统关键词', 3, 0, '', 1, 1, 15),
(31, 'SHOP_DESCRIPTION', '方维o2o商业系统描述', 3, 0, '', 1, 1, 15),
(32, 'SHOP_TEL', '400-800-8888', 3, 0, '', 1, 1, 23),
(33, 'SIDE_DEAL_COUNT', '3', 3, 0, '', 1, 1, 29),
(34, 'SIDE_MESSAGE_COUNT', '3', 3, 0, '', 1, 1, 30),
(35, 'INVITE_REFERRALS', '20', 4, 0, '', 1, 1, 67),
(36, 'INVITE_REFERRALS_TYPE', '0', 4, 1, '0,1', 1, 1, 68),
(37, 'ONLINE_MSN', 'msn@fanwe.com|msn2@fanwe.com', 3, 0, '', 1, 1, 24),
(38, 'ONLINE_QQ', '88888888|9999999', 3, 0, '', 1, 1, 25),
(39, 'ONLINE_TIME', '周一至周六 9:00-18:00', 3, 0, '', 1, 1, 26),
(40, 'DEAL_PAGE_SIZE', '24', 3, 0, '', 1, 1, 31),
(41, 'PAGE_SIZE', '24', 3, 0, '', 1, 1, 32),
(42, 'HELP_CATE_LIMIT', '4', 3, 0, '', 1, 1, 34),
(43, 'HELP_ITEM_LIMIT', '4', 3, 0, '', 1, 1, 35),
(44, 'SHOP_FOOTER', '<div style="text-align:center;">[方维o2o商业系统] <a target="_blank" href="http://www.fanwe.com">http://www.fanwe.com</a><br />\r\n</div>', 3, 3, '', 1, 1, 37),
(45, 'USER_MESSAGE_AUTO_EFFECT', '1', 4, 1, '0,1', 1, 1, 64),
(46, 'SHOP_REFERRAL_HELP', '当好友接受您的邀请，在 [方维网] 上首次成功购买，系统会在 1 小时内返还 ¥20 到您的 [方维网] 电子账户，下次团购时可直接用于支付。没有数量限制，邀请越多，返利越多。<br />\r\n<br />\r\n<span style="color:#f10b00;">友情接示：购买部份团购将不会产生返利或返利特定金额，请查看相关团购的具体说明							</span>', 3, 3, '', 1, 1, 38),
(47, 'SHOP_REFERRAL_SIDE_HELP', '<div class="side-tip referrals-side">							<h3 class="first">在哪里可以看到我的返利？</h3>\r\n							<p>如果邀请成功，在本页面会看到成功邀请列表。在"账户余额"页，可看到您目前电子账户的余额。返利金额不返现，可在下次团购时用于支付。</p>\r\n							<h3>我邀请好友了，什么时候收到返利？</h3>\r\n							<p>返利会在 24 小时内返还到您的帐户，并会发邮件通知您。</p>\r\n							<h3>哪些情况会导致邀请返利失效？</h3>\r\n							<ul class="invalid">								<li>好友点击邀请链接后超过 72 小时才购买</li>\r\n								<li>好友购买之前点击了其他人的邀请链接</li>\r\n								<li>好友的本次购买不是首次购买</li>\r\n								<li>由于最终团购人数没有达到人数下限，本次团购取消</li>\r\n							</ul>\r\n							<h3>自己邀请自己也能获得返利吗？</h3>\r\n							<p>不可以。我们会人工核查，对于查实的作弊行为，扣除一切返利，并取消邀请返利的资格。</p>\r\n						</div>', 3, 3, '', 1, 1, 39),
(48, 'MAIL_SEND_COUPON', '0', 5, 1, '0,1', 1, 1, 73),
(49, 'SMS_SEND_COUPON', '0', 5, 1, '0,1', 1, 1, 79),
(50, 'MAIL_SEND_PAYMENT', '0', 5, 1, '0,1', 1, 1, 75),
(51, 'SMS_SEND_PAYMENT', '0', 5, 1, '0,1', 1, 1, 81),
(62, 'REPLY_ADDRESS', 'info@fanwe.com', 5, 0, '', 1, 1, 77),
(54, 'MAIL_SEND_DELIVERY', '0', 5, 1, '0,1', 1, 1, 76),
(55, 'SMS_SEND_DELIVERY', '0', 5, 1, '0,1', 1, 1, 82),
(56, 'MAIL_ON', '0', 5, 1, '0,1', 1, 1, 72),
(57, 'SMS_ON', '0', 5, 1, '0,1', 1, 1, 78),
(58, 'REFERRAL_LIMIT', '1', 4, 0, '', 1, 1, 69),
(59, 'SMS_COUPON_LIMIT', '3', 5, 0, '', 1, 1, 80),
(60, 'MAIL_COUPON_LIMIT', '3', 5, 0, '', 1, 1, 74),
(61, 'COUPON_NAME', '方维券', 3, 0, '', 1, 1, 16),
(63, 'BATCH_PAGE_SIZE', '500', 3, 0, '', 1, 1, 33),
(64, 'COUPON_PRINT_TPL', '<div style="border:1px solid #000000;padding:10px;margin:0px auto;width:600px;font-size:14px;"><table class="dataEdit" cellpadding="0" cellspacing="0">	<tbody><tr>    <td width="400">    	<img src="./public/attachment/201011/4cdd505195d40.gif" alt="" border="0" />     </td>\r\n  <td style="font-weight:bolder;font-size:22px;font-family:verdana;" width="43%">    序列号：{$bond.sn}<br />\r\n    密码：{$bond.password}    </td>\r\n</tr>\r\n<tr><td colspan="2" height="1">  <div style="width:100%;border-bottom:1px solid #000000;">&nbsp;</div>\r\n  </td>\r\n</tr>\r\n<tr><td colspan="2" height="8"><br />\r\n</td>\r\n</tr>\r\n<tr><td style="font-weight:bolder;font-size:28px;height:50px;padding:5px;font-family:微软雅黑;" colspan="2">{$bond.name}</td>\r\n</tr>\r\n<tr><td style="line-height:22px;padding-right:20px;" width="400">{$bond.user_name}<br />\r\n  生效时间:{$bond.begin_time_format}<br />\r\n  过期时间:{$bond.end_time_format}<br />\r\n  商家电话：<br />\r\n  {$bond.tel}<br />\r\n  商家地址:<br />\r\n  {$bond.address}<br />\r\n  交通路线:<br />\r\n  {$bond.route}<br />\r\n  营业时间：<br />\r\n  {$bond.open_time}<br />\r\n  </td>\r\n  <td><div id="map_canvas" style="width:255px;height:255px;"></div>\r\n  <br />\r\n  </td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>', 3, 3, '', 1, 1, 40),
(65, 'PUBLIC_DOMAIN_ROOT', '', 2, 0, '', 1, 1, 59),
(66, 'SHOW_DEAL_CATE', '1', 3, 1, '0,1', 1, 1, 41),
(67, 'REFERRAL_IP_LIMIT', '0', 4, 1, '0,1', 1, 1, 71),
(68, 'UNSUBSCRIBE_MAIL_TIP', '您收到此邮件是因为您订阅了%s每日推荐更新。如果您不想继续接收此类邮件，可随时%s', 3, 0, '', 1, 1, 36),
(69, 'CART_ON', '1', 3, 1, '0,1', 1, 1, 42),
(70, 'REFERRALS_DELAY', '1', 4, 0, '', 1, 1, 70),
(71, 'SUBMIT_DELAY', '5', 1, 0, '', 1, 1, 13),
(72, 'APP_MSG_SENDER_OPEN', '0', 1, 1, '0,1', 1, 1, 9),
(73, 'ADMIN_MSG_SENDER_OPEN', '0', 1, 1, '0,1', 1, 1, 10),
(74, 'SHOP_OPEN', '1', 3, 1, '0,1', 1, 1, 46),
(75, 'SHOP_CLOSE_HTML', '', 3, 3, '', 1, 1, 47),
(76, 'FOOTER_LOGO', './public/attachment/201011/4cdd50ed013ec.png', 3, 2, '', 1, 1, 20),
(77, 'GZIP_ON', '0', 1, 1, '0,1', 1, 1, 2),
(78, 'INTEGRATE_CODE', '', 0, 0, '', 1, 0, 0),
(79, 'INTEGRATE_CFG', '', 0, 0, '', 1, 0, 0),
(80, 'SHOP_SEO_TITLE', '方维o2o商业系统,国内最优秀的PHP开源o2o系统', 3, 0, '', 1, 1, 14),
(81, 'CACHE_ON', '1', 1, 1, '0,1', 1, 1, 7),
(82, 'EXPIRED_TIME', '0', 1, 0, '', 1, 1, 5),
(120, 'FILTER_WORD', '', 1, 0, '', 1, 1, 100),
(84, 'STYLE_OPEN', '0', 3, 1, '0,1', 0, 0, 44),
(85, 'STYLE_DEFAULT', '1', 3, 1, '0,1', 0, 0, 45),
(86, 'TMPL_DOMAIN_ROOT', '', 2, 0, '0', 0, 0, 62),
(87, 'CACHE_TYPE', 'File', 1, 1, 'File,Xcache,Memcached', 1, 1, 7),
(88, 'MEMCACHE_HOST', '127.0.0.1:11211', 1, 0, '', 1, 1, 8),
(90, 'IMAGE_USERNAME', 'admin', 2, 0, '', 1, 1, 60),
(91, 'IMAGE_PASSWORD', 'admin', 2, 4, '', 1, 1, 61),
(92, 'MOBILE_MUST', '0', 4, 1, '0,1', 1, 1, 66),
(93, 'ATTR_SELECT', '0', 3, 1, '0,1', 0, 0, 43),
(94, 'ICP_LICENSE', '', 3, 0, '', 1, 1, 27),
(95, 'COUNT_CODE', '', 3, 0, '', 1, 1, 28),
(96, 'DEAL_MSG_LOCK', '0', 0, 0, '', 0, 0, 0),
(97, 'PROMOTE_MSG_LOCK', '0', 0, 0, '', 0, 0, 0),
(98, 'LIST_TYPE', '1', 3, 1, '0,1', 1, 1, 45),
(100, 'SUPPLIER_DETAIL', '1', 3, 1, '0,1', 1, 1, 45),
(101, 'KUAIDI_APP_KEY', '', 1, 0, '', 1, 1, 83),
(102, 'KUAIDI_TYPE', '2', 1, 1, '1,2', 1, 1, 84),
(103, 'SEND_SPAN', '2', 1, 0, '', 1, 1, 85),
(104, 'MAIL_USE_COUPON', '0', 5, 1, '0,1', 1, 1, 77),
(105, 'SMS_USE_COUPON', '0', 5, 1, '0,1', 1, 1, 83),
(106, 'LOTTERY_SMS_VERIFY', '0', 5, 1, '0,1', 1, 1, 84),
(107, 'LOTTERY_SN_SMS', '0', 5, 1, '0,1', 1, 1, 85),
(108, 'EDM_ON', '0', 5, 1, '0,1', 1, 1, 86),
(109, 'EDM_USERNAME', '', 5, 0, '', 1, 1, 87),
(110, 'EDM_PASSWORD', '', 5, 4, '', 1, 1, 88),
(111, 'SHOP_SEARCH_KEYWORD', '服装,手机,零食', 3, 0, '', 1, 1, 15),
(112, 'REC_HOT_LIMIT', '4', 3, 0, '', 1, 1, 35),
(113, 'REC_NEW_LIMIT', '4', 3, 0, '', 1, 1, 35),
(114, 'REC_BEST_LIMIT', '4', 3, 0, '', 1, 1, 35),
(115, 'REC_CATE_GOODS_LIMIT', '4', 3, 0, '', 1, 1, 35),
(116, 'SALE_LIST', '5', 3, 0, '', 1, 1, 35),
(117, 'INDEX_NOTICE_COUNT', '8', 3, 0, '', 1, 1, 35),
(118, 'RELATE_GOODS_LIMIT', '5', 3, 0, '', 1, 1, 35),
(119, 'TMPL_CACHE_ON', '1', 1, 1, '0,1', 1, 1, 6),
(121, 'USER_LOGIN_SCORE', '0', 6, 0, '', 1, 1, 2),
(122, 'USER_LOGIN_MONEY', '0', 6, 0, '', 1, 1, 1),
(123, 'USER_REGISTER_SCORE', '100', 6, 0, '', 1, 1, 8),
(124, 'USER_REGISTER_MONEY', '0', 6, 0, '', 1, 1, 7),
(125, 'DOMAIN_ROOT', '', 1, 0, '', 1, 1, 10),
(127, 'MAIN_APP', 'shop', 1, 1, 'shop,tuan,youhui', 1, 0, 10),
(128, 'VERIFY_IMAGE', '0', 1, 1, '0,1', 1, 1, 10),
(129, 'TUAN_SHOP_TITLE', '方维团购', 3, 0, '', 1, 1, 13),
(130, 'MALL_SHOP_TITLE', '方维商城', 3, 0, '', 1, 1, 13),
(131, 'APNS_MSG_LOCK', '0', 0, 0, '', 0, 0, 0),
(132, 'PROMOTE_MSG_PAGE', '0', 0, 0, '', 0, 0, 0),
(133, 'APNS_MSG_PAGE', '0', 0, 0, '', 0, 0, 0),
(134, 'STORE_SEND_LIMIT', '5', 5, 0, '', 1, 1, 9),
(135, 'USER_LOGIN_POINT', '10', 6, 0, '', 1, 1, 3),
(136, 'USER_REGISTER_POINT', '100', 6, 0, '', 1, 1, 9),
(137, 'USER_LOGIN_KEEP_MONEY', '0', 6, 0, '', 1, 1, 4),
(138, 'USER_LOGIN_KEEP_SCORE', '5', 6, 0, '', 1, 1, 5),
(139, 'USER_LOGIN_KEEP_POINT', '50', 6, 0, '', 1, 1, 6),
(140, 'USER_ACTIVE_MONEY', '0', 6, 0, '', 1, 1, 10),
(141, 'USER_ACTIVE_SCORE', '0', 6, 0, '', 1, 1, 11),
(142, 'USER_ACTIVE_POINT', '10', 6, 0, '', 1, 1, 12),
(143, 'USER_ACTIVE_MONEY_MAX', '0', 6, 0, '', 1, 1, 13),
(144, 'USER_ACTIVE_SCORE_MAX', '0', 6, 0, '', 1, 1, 14),
(145, 'USER_ACTIVE_POINT_MAX', '100', 6, 0, '', 1, 1, 15),
(146, 'USER_DELETE_MONEY', '0', 6, 0, '', 1, 1, 16),
(148, 'USER_DELETE_POINT', '-10', 6, 0, '', 1, 1, 18),
(149, 'USER_ADD_MONEY', '0', 6, 0, '', 1, 1, 19),
(150, 'USER_ADD_SCORE', '0', 6, 0, '', 1, 1, 20),
(151, 'USER_ADD_POINT', '10', 6, 0, '', 1, 1, 21),
(147, 'USER_DELETE_SCORE', '0', 6, 0, '', 1, 1, 17),
(152, 'BIZ_AGREEMENT', '<ul>                                	<li>                                    &nbsp;&nbsp;&nbsp;&nbsp;您确认，在开始"实名认证"前，您已详细阅读了本协议所有内容，一旦您开始认证流程，即表示您充分理解并同意接受本协议的全部内容。                                    </li>\r\n                                    <li>                                    &nbsp;&nbsp;&nbsp;&nbsp;为了提高服务的安全性和我们的商户身份的可信度，我们向您提供认证服务。在您申请认证前，您必须先注册成为用户。商户认证成功后，我们将给予每个商户一个认证标识。本公司有权采取各种其认为必要手段对商户的身份进行识别。但是，作为普通的网络服务提供商，本公司所能采取的方法有限，而且在网络上进行商户身份识别也存在一定的困难，因此，本公司对完成认证的商户身份的准确性和绝对真实性不做任何保证。                                    </li>\r\n                                    <li>                                    &nbsp;&nbsp;&nbsp;&nbsp;本公司有权记录并保存您提供给本公司的信息和本公司获取的结果信息，亦有权根据本协议的约定向您或第三方提供您是否通过认证的结论以及您的身份信息。                                         </li>\r\n									<li>										<h3>一、关于认证服务的理解与认同</h3>\r\n										<ol class="decimal">											<li>认证服务是由本公司提供的一项身份识别服务。除非本协议另有约定，一旦您的账户完成了认证，相应的身份信息和认证结果将不因任何原因被修改或取消；如果您的身份信息在完成认证后发生了变更，您应向本公司提供相应有权部门出具的凭证，由本公司协助您变更账户的对应认证信息。</li>\r\n											<li>本公司有权单方随时修改或变更本协议内容，并通过网站公告变更后的协议文本，无需单独通知您。本协议进行任何修改或变更后，您还继续使用我们的服务和/或认证服务的，即代表您已阅读、了解并同意接受变更后的协议内容；您如果不同意变更后的协议内容，应立即停用我们的服务和认证服务。</li>\r\n										</ol>\r\n																</li>\r\n<li>										<h3>二、实名认证</h3>\r\n										<ol class="decimal">											<li>个体工商户类商户向本公司申请认证服务时，应向本公司提供以下资料：中华人民共和国工商登记机关颁发的个体工商户营业执照或者其他身份证明文件。</li>\r\n											<li>企业类商户向本公司申请认证服务时，应向本公司提供以下资料：中华人民共和国工商登记机关颁发的企业营业执照或者其他身份证明文件。</li>\r\n                                            <li>                                            其他类商户向本公司申请认证服务时，应向本公司提供以下资料：能够证明商户合法身份的证明文件，或者其他本公司认为必要的身份证明文件。                                            </li>\r\n                                            <li>                                            如商户在认证后变更任何身份信息，则应在变更发生后三个工作日内书面通知本公司变更认证，否则本公司有权随时单方终止提供服务，且因此造成的全部后果，由商户自行承担。                                            </li>\r\n                                            <li>                                            通过实名认证的商户不能自行修改已经认证的信息，包括但不限于企业名称、姓名以及身份证件号码等。                                            </li>\r\n										</ol>\r\n									</li>\r\n									<li>										<h3>三、特别声明</h3>\r\n												<ol class="decimal">																						<li>认证信息共享：<br />\r\n为了使您享有便捷的服务，您经由其它网站向本公司提交认证申请即表示您同意本公司为您核对所提交的全部认证信息，并同意本公司将是否通过认证的结果及相关认证信息提供给该网站。</li>\r\n											<li>												认证资料的管理：<br />\r\n     您在认证时提交给本公司的认证资料，即不可撤销的授权由本公司保留。本公司承诺除法定或约定的事由外，不公开或编辑或透露您的认证资料及保存在本公司的非公开内容用于商业目的，但本条第1项规定以及以下情形除外：												<ol class="lower-roman">													<li>您授权本公司透露的相关信息；</li>\r\n													<li>本公司向国家司法及行政机关提供；</li>\r\n                                                    <li>本公司向本公司关联企业提供；</li>\r\n                                                    <li>第三方和本公司一起为商户提供服务时，该第三方向您提供服务所需的相关信息；</li>\r\n                                                    <li>基于解决您与第三方民事纠纷的需要，本公司有权向该第三方提供您的身份信息。</li>\r\n												</ol>\r\n														</li>\r\n										</ol>\r\n									</li>\r\n																<li>										<h3>四、第三方网站的链接</h3>\r\n                                    </li>\r\n											<li>&nbsp;&nbsp;&nbsp;&nbsp;为实现认证信息审查，我们网站上可能包含了指向第三方网站的链接（以下简称"链接网站"）。"链接网站"非由本公司控制，对于任何"链接网站"的内容，包含但不限于"链接网站"内含的任何链接，或"链接网站"的任何改变或更新，本公司均不予负责。自"链接网站"接收的网络传播或其它形式之传送，本公司不予负责。</li>\r\n									<li>										<h3>五、不得为非法或禁止的使用</h3>\r\n                                    </li>\r\n                                    <li>&nbsp;&nbsp;&nbsp;&nbsp;接受本协议全部的说明、条款、条件是您申请认证的先决条件。您声明并保证，您不得为任何非法或为本协议、条件及须知所禁止之目的进行认证申请。您不得以任何可能损害、使瘫痪、使过度负荷或损害网站或其他网站的服务、或干扰本公司或他人对于认证申请的使用等方式使用认证服务。您不得经由非本公司许可提供的任何方式取得或试图取得任何资料或信息。									</li>\r\n									<li>										<h3>六、有关免责</h3>\r\n                                     </li>\r\n                                     <li>                                     &nbsp;&nbsp;&nbsp;&nbsp;下列情况时本公司无需承担任何责任：                                     </li>\r\n                                     <li>											<ol class="decimal">												<li>由于您将账户密码告知他人或未保管好自己的密码或与他人共享账户或任何其他非本公司的过错，导致您的个人资料泄露。</li>\r\n												<li>													任何由于黑客攻击、计算机病毒侵入或发作、电信部门技术调整导致之影响、因政府管制而造成的暂时性关闭、由于第三方原因(包括不可抗力，例如国际出口的主干线路及国际出口电信提供商一方出现故障、火灾、水灾、雷击、地震、洪水、台风、龙卷风、火山爆发、瘟疫和传染病流行、罢工、战争或暴力行为或类似事件等)及其他非因本公司过错而造成的认证信息泄露、丢失、被盗用或被篡改等。															</li>\r\n												<li>由于与本公司链接的其它网站所造成的商户身份信息泄露及由此而导致的任何法律争议和后果。</li>\r\n                                                <li>任何商户向本公司提供错误、不完整、不实信息等造成不能通过认证或遭受任何其他损失，概与本公司无关。</li>\r\n											</ol>\r\n									</li>\r\n																</ul>', 3, 3, ' ', 1, 1, 100),
(153, 'INDEX_LEFT_STORE', '1', 3, 0, ' ', 1, 1, 1),
(154, 'INDEX_LEFT_TUAN', '1', 3, 0, ' ', 1, 1, 2),
(155, 'INDEX_LEFT_YOUHUI', '1', 3, 0, ' ', 1, 1, 3),
(156, 'INDEX_LEFT_DAIJIN', '1', 3, 0, ' ', 1, 1, 4),
(157, 'INDEX_LEFT_EVENT', '1', 3, 0, ' ', 1, 1, 5),
(158, 'INDEX_RIGHT_STORE', '1', 3, 0, ' ', 1, 1, 6),
(159, 'INDEX_RIGHT_TUAN', '1', 3, 0, ' ', 1, 1, 7),
(160, 'INDEX_RIGHT_YOUHUI', '1', 3, 0, ' ', 1, 1, 8),
(161, 'INDEX_RIGHT_DAIJIN', '1', 3, 0, ' ', 1, 1, 9),
(162, 'INDEX_RIGHT_EVENT', '1', 3, 0, ' ', 1, 1, 10),
(163, 'USER_YOUHUI_DOWN_MONEY', '0', 6, 0, ' ', 1, 1, 21),
(164, 'USER_YOUHUI_DOWN_SCORE', '0', 6, 0, ' ', 1, 1, 21),
(165, 'USER_YOUHUI_DOWN_POINT', '0', 6, 0, ' ', 1, 1, 21),
(166, 'COOKIE_PATH', '/', 1, 0, '', 1, 1, 10),
(167, 'APPLE_PATH', 'ios', 3, 0, ' ', 1, 1, 101),
(168, 'ANDROID_PATH', 'android', 3, 0, ' ', 1, 1, 102),
(171, 'QRCODE_SIZE', '2', 3, 1, '1,2,3', 1, 1, 103),
(169, 'SEND_SCORE_SMS', '0', 5, 1, '0,1', 1, 1, 82),
(170, 'SEND_SCORE_MAIL', '0', 5, 1, '0,1', 1, 1, 76),
(172, 'YOUHUI_SEND_TEL_LIMIT', '2', 5, 0, '', 1, 1, 10),
(173, 'IP_LIMIT_NUM', '2', 1, 0, '', 1, 1, 5),
(174, 'INDEX_SUPPLIER_COUNT', '8', 3, 0, '', 1, 1, 28),
(175, 'BIZ_APPLE_PATH', 'ios', 3, 0, '', 1, 1, 103),
(176, 'BIZ_ANDROID_PATH', 'android', 3, 0, '', 1, 1, 104);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_coupon_log`
--

CREATE TABLE IF NOT EXISTS `fanwe_coupon_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_sn` varchar(255) NOT NULL,
  `create_time` int(11) NOT NULL,
  `msg` text NOT NULL,
  `query_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `fanwe_coupon_log`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_daren_submit`
--

CREATE TABLE IF NOT EXISTS `fanwe_daren_submit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `is_publish` tinyint(1) NOT NULL,
  `create_time` int(11) NOT NULL,
  `reason` text NOT NULL,
  `daren_title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `fanwe_daren_submit`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `sub_name` varchar(255) NOT NULL,
  `cate_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `img` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `begin_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `min_bought` int(11) NOT NULL,
  `max_bought` int(11) NOT NULL,
  `user_min_bought` int(11) NOT NULL,
  `user_max_bought` int(11) NOT NULL,
  `origin_price` decimal(20,4) NOT NULL,
  `current_price` decimal(20,4) NOT NULL,
  `city_id` int(11) NOT NULL,
  `is_coupon` tinyint(1) NOT NULL,
  `is_delivery` tinyint(1) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `user_count` int(11) NOT NULL,
  `buy_count` int(11) NOT NULL,
  `time_status` tinyint(1) NOT NULL,
  `buy_status` tinyint(1) NOT NULL,
  `deal_type` tinyint(1) NOT NULL,
  `allow_promote` tinyint(1) NOT NULL,
  `return_money` decimal(20,4) NOT NULL,
  `return_score` int(11) NOT NULL,
  `brief` text NOT NULL,
  `sort` int(11) NOT NULL,
  `deal_goods_type` int(11) NOT NULL,
  `success_time` int(11) NOT NULL,
  `coupon_begin_time` int(11) NOT NULL,
  `coupon_end_time` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `weight` decimal(20,4) NOT NULL,
  `weight_id` int(11) NOT NULL,
  `is_referral` tinyint(1) NOT NULL,
  `buy_type` tinyint(1) NOT NULL,
  `discount` decimal(20,4) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `notice` tinyint(1) NOT NULL,
  `free_delivery` tinyint(1) NOT NULL,
  `define_payment` tinyint(1) NOT NULL,
  `seo_title` text NOT NULL,
  `seo_keyword` text NOT NULL,
  `seo_description` text NOT NULL,
  `is_hot` tinyint(1) NOT NULL,
  `is_new` tinyint(1) NOT NULL,
  `is_best` tinyint(1) NOT NULL,
  `is_lottery` tinyint(1) NOT NULL,
  `reopen` int(11) NOT NULL,
  `uname` varchar(255) NOT NULL,
  `forbid_sms` tinyint(1) NOT NULL,
  `cart_type` tinyint(1) NOT NULL,
  `shop_cate_id` int(11) NOT NULL,
  `is_shop` tinyint(1) NOT NULL,
  `total_point` int(11) NOT NULL,
  `avg_point` tinyint(1) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `name_match` text NOT NULL,
  `name_match_row` text NOT NULL,
  `deal_cate_match` text NOT NULL,
  `deal_cate_match_row` text NOT NULL,
  `shop_cate_match` text NOT NULL,
  `shop_cate_match_row` text NOT NULL,
  `locate_match` text NOT NULL,
  `locate_match_row` text NOT NULL,
  `tag_match` text NOT NULL,
  `tag_match_row` text NOT NULL,
  `xpoint` varchar(255) NOT NULL,
  `ypoint` varchar(255) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `brand_promote` tinyint(1) NOT NULL,
  `publish_wait` tinyint(1) NOT NULL COMMENT '0:已审核 1:等待审核',
  `account_id` int(11) NOT NULL,
  `is_recommend` tinyint(1) NOT NULL,
  `balance_price` decimal(20,4) NOT NULL,
  `is_refund` tinyint(1) NOT NULL DEFAULT '1',
  `auto_order` tinyint(1) NOT NULL,
  `expire_refund` tinyint(1) NOT NULL,
  `any_refund` tinyint(1) NOT NULL,
  `multi_attr` tinyint(1) NOT NULL,
  `notes` text NOT NULL,
  `deal_event_id` int(11) NOT NULL,
  `package` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cate_id` (`cate_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `begin_time` (`begin_time`),
  KEY `end_time` (`end_time`),
  KEY `current_price` (`current_price`),
  KEY `city_id` (`city_id`),
  KEY `buy_count` (`buy_count`),
  KEY `sort` (`sort`),
  KEY `buy_type` (`buy_type`),
  KEY `shop_cate_id` (`shop_cate_id`),
  KEY `is_shop` (`is_shop`),
  KEY `create_time` (`create_time`),
  KEY `update_time` (`update_time`),
  FULLTEXT KEY `name_match` (`name_match`),
  FULLTEXT KEY `locate_match` (`locate_match`),
  FULLTEXT KEY `tag_match` (`tag_match`),
  FULLTEXT KEY `deal_cate_match` (`deal_cate_match`),
  FULLTEXT KEY `all_match` (`name_match`,`deal_cate_match`,`locate_match`,`tag_match`,`shop_cate_match`),
  FULLTEXT KEY `shop_cate_match` (`shop_cate_match`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=57 ;

--
-- 转存表中的数据 `fanwe_deal`
--

INSERT INTO `fanwe_deal` (`id`, `name`, `sub_name`, `cate_id`, `supplier_id`, `img`, `description`, `begin_time`, `end_time`, `min_bought`, `max_bought`, `user_min_bought`, `user_max_bought`, `origin_price`, `current_price`, `city_id`, `is_coupon`, `is_delivery`, `is_effect`, `is_delete`, `user_count`, `buy_count`, `time_status`, `buy_status`, `deal_type`, `allow_promote`, `return_money`, `return_score`, `brief`, `sort`, `deal_goods_type`, `success_time`, `coupon_begin_time`, `coupon_end_time`, `code`, `weight`, `weight_id`, `is_referral`, `buy_type`, `discount`, `icon`, `notice`, `free_delivery`, `define_payment`, `seo_title`, `seo_keyword`, `seo_description`, `is_hot`, `is_new`, `is_best`, `is_lottery`, `reopen`, `uname`, `forbid_sms`, `cart_type`, `shop_cate_id`, `is_shop`, `total_point`, `avg_point`, `create_time`, `update_time`, `name_match`, `name_match_row`, `deal_cate_match`, `deal_cate_match_row`, `shop_cate_match`, `shop_cate_match_row`, `locate_match`, `locate_match_row`, `tag_match`, `tag_match_row`, `xpoint`, `ypoint`, `brand_id`, `brand_promote`, `publish_wait`, `account_id`, `is_recommend`, `balance_price`, `is_refund`, `auto_order`, `expire_refund`, `any_refund`, `multi_attr`, `notes`, `deal_event_id`, `package`) VALUES
(37, '仅售58元！原价最高142元的闽粤汇经典A、B、C（3选1）双人套餐一份：A套餐：状元虾饺皇一份+柱侯金钱肚一份+爽滑牛肉肠一份+上海小笼包一份+香酥焗蛋挞一份+上汤广芥一份+凤爪排骨饭一份+杨枝甘露一份，B套餐：蟹籽滑烧卖一份+金粟叉烧肠一份+上海生煎包一份+香煎萝卜糕一份+黑椒牛仔骨一份+潮州炒牛河一份+上汤生菜一份+梧州龟苓膏一份，C套餐：豉椒蒸肉排一份+黑椒牛仔骨一份+酱黄蒸凤爪一份+上汤娃娃菜一份+杨枝甘露一份+淮山烧骨粥一份+罗汉蒸肠粉一份+香煎马蹄糕一份。', '闽粤汇双人套餐一份', 8, 15, './public/attachment/201201/4f0110c586c48.jpg', '<img src="./public/attachment/201201/4f0110c586c48.jpg" alt="" border="0" /><br />', 0, 1496390400, 0, 0, 0, 0, 142.0000, 58.0000, 15, 1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0.0000, 0, '', 1, 0, 1325441578, 0, 0, '', 0.0000, 1, 0, 0, 0.0000, './public/attachment/201201/4f0110c586c48.jpg', 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 1325441578, 1416550843, 'ux40657ux26898,ux19978ux27748,ux22871ux39184,ux20964ux29226,ux38397ux31908,ux40863ux33491ux33167,ux29976ux38706,ux23567ux31548ux21253,ux26791ux24030,ux37329ux31903,ux20165ux21806ux53ux56ux20803ux65281ux21407ux20215ux26368ux39640ux49ux52ux50ux20803ux30340ux38397ux31908ux27719ux32463ux20856ux65ux12289ux66ux12289ux67ux65288ux51ux36873ux49ux65289ux21452ux20154ux22871ux39184ux19968ux20221ux65306ux65ux22871ux39184ux65306ux29366ux20803ux34430ux39290ux30343ux19968ux20221ux43ux26609ux20399ux37329ux38065ux32922ux19968ux20221ux43ux29245ux28369ux29275ux32905ux32928ux19968ux20221ux43ux19978ux28023ux23567ux31548ux21253ux19968ux20221ux43ux39321ux37221ux28951ux34507ux25374ux19968ux20221ux43ux19978ux27748ux24191ux33445ux19968ux20221ux43ux20964ux29226ux25490ux39592ux39277ux19968ux20221ux43ux26472ux26525ux29976ux38706ux19968ux20221ux65292ux66ux22871ux39184ux65306ux34809ux31869ux28369ux28903ux21334ux19968ux20221ux43ux37329ux31903ux21449ux28903ux32928ux19968ux20221ux43ux19978ux28023ux29983ux29006ux21253ux19968ux20221ux43ux39321ux29006ux33821ux21340ux31957ux19968ux20221ux43ux40657ux26898ux29275ux20180ux39592ux19968ux20221ux43ux28526ux24030ux28818ux29275ux27827ux19968ux20221ux43ux19978ux27748ux29983ux33756ux19968ux20221ux43ux26791ux24030ux40863ux33491ux33167ux19968ux20221ux65292ux67ux22871ux39184ux65306ux35913ux26898ux33976ux32905ux25490ux19968ux20221ux43ux40657ux26898ux29275ux20180ux39592ux19968ux20221ux43ux37233ux40644ux33976ux20964ux29226ux19968ux20221ux43ux19978ux27748ux23043ux23043ux33756ux19968ux20221ux43ux26472ux26525ux29976ux38706ux19968ux20221ux43ux28142ux23665ux28903ux39592ux31909ux19968ux20221ux43ux32599ux27721ux33976ux32928ux31881ux19968ux20221ux43ux39321ux29006ux39532ux36420ux31957ux19968ux20221ux12290', '黑椒,上汤,套餐,凤爪,闽粤,龟苓膏,甘露,小笼包,梧州,金粟,仅售58元！原价最高142元的闽粤汇经典A、B、C（3选1）双人套餐一份：A套餐：状元虾饺皇一份+柱侯金钱肚一份+爽滑牛肉肠一份+上海小笼包一份+香酥焗蛋挞一份+上汤广芥一份+凤爪排骨饭一份+杨枝甘露一份，B套餐：蟹籽滑烧卖一份+金粟叉烧肠一份+上海生煎包一份+香煎萝卜糕一份+黑椒牛仔骨一份+潮州炒牛河一份+上汤生菜一份+梧州龟苓膏一份，C套餐：豉椒蒸肉排一份+黑椒牛仔骨一份+酱黄蒸凤爪一份+上汤娃娃菜一份+杨枝甘露一份+淮山烧骨粥一份+罗汉蒸肠粉一份+香煎马蹄糕一份。', 'ux39184ux39278ux32654ux39135,ux38397ux33756,ux19996ux21271ux33756', '餐饮美食,闽菜,东北菜', '', '', 'ux20840ux22269,ux31119ux24030,ux20809ux22823ux38134ux34892,ux21271ux36335,ux38498ux20869,ux28023ux20851,ux49ux49ux48,ux20116ux19968,ux20116ux19968ux21271ux36335ux49ux49ux48ux21495ux21407ux28023ux20851ux22823ux38498ux20869ux65288ux29616ux20809ux22823ux38134ux34892ux21518ux65289,ux40723ux27004ux21306,ux20116ux19968ux24191ux22330,ux26187ux23433ux21306,ux20116ux19968ux26032ux26449', '全国,福州,光大银行,北路,院内,海关,110,五一,五一北路110号原海关大院内（现光大银行后）,鼓楼区,五一广场,晋安区,五一新村', '', '', '119.315682', '26.087528', 0, 0, 0, 0, 1, 0.0000, 1, 0, 0, 0, 0, '', 0, ''),
(38, '仅售78元！原价153元的爱琴海餐厅美味套餐一份：重庆烤鱼（草鱼）一份+辣炒丁螺一份+干煸四季豆一份+花蛤汤一份！本套餐不含餐具，需到店另付餐具1元/副！', '爱琴海美味套餐', 8, 16, './public/attachment/201201/4f0113ce66cd4.jpg', '<img src="./public/attachment/201201/4f0113ce66cd4.jpg" alt="" border="0" />', 0, 1489083600, 10, 0, 0, 0, 153.0000, 78.0000, 15, 1, 0, 1, 0, 0, 4, 1, 0, 0, 0, 0.0000, 0, '', 2, 0, 0, 0, 0, '', 0.0000, 1, 0, 0, 0.0000, './public/attachment/201201/4f0113ce66cd4.jpg', 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 1325442045, 1416550836, 'ux39184ux20855,ux29233ux29748ux28023,ux22871ux39184,ux22235ux23395ux35910,ux24178ux29048,ux33609ux40060,ux28900ux40060,ux37325ux24198,ux20165ux21806,ux21407ux20215,ux20165ux21806ux55ux56ux20803ux65281ux21407ux20215ux49ux53ux51ux20803ux30340ux29233ux29748ux28023ux39184ux21381ux32654ux21619ux22871ux39184ux19968ux20221ux65306ux37325ux24198ux28900ux40060ux65288ux33609ux40060ux65289ux19968ux20221ux43ux36771ux28818ux19969ux34746ux19968ux20221ux43ux24178ux29048ux22235ux23395ux35910ux19968ux20221ux43ux33457ux34532ux27748ux19968ux20221ux65281ux26412ux22871ux39184ux19981ux21547ux39184ux20855ux65292ux38656ux21040ux24215ux21478ux20184ux39184ux20855ux49ux20803ux47ux21103ux65281', '餐具,爱琴海,套餐,四季豆,干煸,草鱼,烤鱼,重庆,仅售,原价,仅售78元！原价153元的爱琴海餐厅美味套餐一份：重庆烤鱼（草鱼）一份+辣炒丁螺一份+干煸四季豆一份+花蛤汤一份！本套餐不含餐具，需到店另付餐具1元/副！', 'ux39184ux39278ux32654ux39135,ux38397ux33756', '餐饮美食,闽菜', '', '', 'ux20840ux22269,ux31119ux24030,ux40723ux27004ux21306,ux31119ux24030ux24066,ux31119ux24030ux24066ux40723ux27004ux21306ux40723ux23631ux36335ux52ux55ux21495,ux23631ux23665', '全国,福州,鼓楼区,福州市,福州市鼓楼区鼓屏路47号,屏山', '', '', '119.304522', '26.098978', 0, 0, 0, 0, 1, 0.0000, 1, 0, 0, 0, 0, '', 0, ''),
(39, '仅售98元！原价216元的老刘野生大鱼坊2-3人套餐一份：青根鱼一份+怀头鱼一份+秘制汤锅底一份+白菜/豆腐/土豆/宽粉/青菜/白萝卜（任选2份）+拍黄瓜/东北凉菜/皮蛋豆腐/水煮花生/油炸花生/拌海带丝/糖拌西红柿（任选一份）', '老刘野生大鱼坊套餐', 8, 17, './public/attachment/201201/4f0116296dc27.jpg', '<img src="./public/attachment/201201/4f0116296dc27.jpg" alt="" border="0" />', 0, 1483641000, 0, 0, 0, 0, 216.0000, 98.0000, 15, 1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0.0000, 0, '', 3, 0, 1325442624, 0, 0, '', 0.0000, 1, 0, 0, 0.0000, './public/attachment/201201/4f0116296dc27.jpg', 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 1325442624, 1416550829, 'ux20219ux36873,ux32769ux21016,ux33457ux29983,ux35910ux33104,ux30333ux33821ux21340,ux38149ux24213,ux20937ux33756,ux30382ux34507,ux28023ux24102,ux27833ux28856,ux20165ux21806ux57ux56ux20803ux65281ux21407ux20215ux50ux49ux54ux20803ux30340ux32769ux21016ux37326ux29983ux22823ux40060ux22346ux50ux45ux51ux20154ux22871ux39184ux19968ux20221ux65306ux38738ux26681ux40060ux19968ux20221ux43ux24576ux22836ux40060ux19968ux20221ux43ux31192ux21046ux27748ux38149ux24213ux19968ux20221ux43ux30333ux33756ux47ux35910ux33104ux47ux22303ux35910ux47ux23485ux31881ux47ux38738ux33756ux47ux30333ux33821ux21340ux65288ux20219ux36873ux50ux20221ux65289ux43ux25293ux40644ux29916ux47ux19996ux21271ux20937ux33756ux47ux30382ux34507ux35910ux33104ux47ux27700ux29038ux33457ux29983ux47ux27833ux28856ux33457ux29983ux47ux25292ux28023ux24102ux19997ux47ux31958ux25292ux35199ux32418ux26623ux65288ux20219ux36873ux19968ux20221ux65289', '任选,老刘,花生,豆腐,白萝卜,锅底,凉菜,皮蛋,海带,油炸,仅售98元！原价216元的老刘野生大鱼坊2-3人套餐一份：青根鱼一份+怀头鱼一份+秘制汤锅底一份+白菜/豆腐/土豆/宽粉/青菜/白萝卜（任选2份）+拍黄瓜/东北凉菜/皮蛋豆腐/水煮花生/油炸花生/拌海带丝/糖拌西红柿（任选一份）', 'ux39184ux39278ux32654ux39135,ux38397ux33756,ux24029ux33756', '餐饮美食,闽菜,川菜', '', '', 'ux20840ux22269,ux31119ux24030,ux40723ux27004ux21306,ux21326ux20016,ux31119ux24030ux24066,ux30000ux36335,ux22823ux37202ux24215,ux23545ux38754,ux22823ux21414,ux31119ux24030ux24066ux40723ux27004ux21306ux21476ux30000ux36335ux56ux56ux21495ux21326ux20016ux22823ux21414ux51ux23618ux65ux23460ux40ux38397ux37117ux22823ux37202ux24215ux23545ux38754ux41,ux21488ux27743ux21306', '全国,福州,鼓楼区,华丰,福州市,田路,大酒店,对面,大厦,福州市鼓楼区古田路88号华丰大厦3层A室(闽都大酒店对面),台江区', '', '', '119.320796', '26.082646', 0, 0, 0, 0, 1, 0.0000, 1, 0, 0, 0, 0, '', 0, ''),
(40, 'INC茵佳妮装新款百搭可爱时尚保暖大衣毛呢外套', '茵佳妮装新款百搭', 0, 0, './public/attachment/201201/4f01271aa4f99.jpg', '<p><img src="./public/attachment/201201/4f01272fd7672.jpg" alt="" border="0" /></p>\r\n<p><img src="./public/attachment/201201/4f012739d2982.jpg" alt="" border="0" /><br />\r\n</p>\r\n<p><img src="./public/attachment/201201/4f01274131ac1.jpg" alt="" border="0" /><br />\r\n</p>', 0, 0, 0, 0, 0, 0, 599.0000, 229.0000, 1, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0.0000, 0, '', 4, 8, 1325446951, 0, 0, '', 0.0000, 1, 0, 0, 0.0000, './public/attachment/201201/4f012715350e4.jpg', 0, 0, 0, '', '', '', 1, 1, 1, 0, 0, '', 0, 0, 30, 1, 0, 0, 1325446951, 1325456504, 'ux20339ux22958,ux27611ux21602,ux20445ux26262,ux22823ux34915,ux22806ux22871,ux26032ux27454,ux21487ux29233,ux26102ux23578,ux73ux78ux67,ux73ux78ux67ux33589ux20339ux22958ux35013ux26032ux27454ux30334ux25645ux21487ux29233ux26102ux23578ux20445ux26262ux22823ux34915ux27611ux21602ux22806ux22871,ux33589ux20339ux22958', '佳妮,毛呢,保暖,大衣,外套,新款,可爱,时尚,INC,INC茵佳妮装新款百搭可爱时尚保暖大衣毛呢外套,茵佳妮', '', '', 'ux26381ux35013ux44ux20869ux34915ux44ux37197ux20214,ux22899ux35013', '服装,内衣,配件,女装', 'ux20840ux22269', '全国', 'ux32418ux33394,ux22823ux30721,ux20013ux30721,ux22343ux30721,ux32431ux32501', '红色,大码,中码,均码,纯绵', '', '', 10, 0, 0, 0, 1, 0.0000, 1, 0, 0, 0, 0, '', 0, ''),
(41, 'INC2011秋冬新款女装连帽中长款毛衣', 'INC2011秋冬新款女装连帽中长款毛衣', 0, 0, './public/attachment/201201/4f012a86b3fbe.jpg', '<p><img src="./public/attachment/201201/4f012aa3afaef.jpg" alt="" border="0" /></p>\r\n<p><img src="./public/attachment/201201/4f012aac441a6.jpg" alt="" border="0" /><br />\r\n</p>\r\n<p><img src="./public/attachment/201201/4f012ab53c6bb.jpg" alt="" border="0" /><br />\r\n</p>', 0, 0, 0, 0, 0, 0, 224.0000, 159.0000, 1, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0.0000, 0, '', 5, 8, 1325447825, 0, 0, '', 0.0000, 1, 0, 0, 0.0000, './public/attachment/201201/4f012a7f769d1.jpg', 0, 0, 0, '', '', '', 1, 1, 1, 0, 0, '', 0, 0, 24, 1, 0, 0, 1325447825, 1325456491, 'ux20013ux38271,ux27611ux34915,ux31179ux20908,ux22899ux35013,ux26032ux27454,ux73ux78ux67ux50ux48ux49ux49,ux36830ux24125,ux73ux78ux67ux50ux48ux49ux49ux31179ux20908ux26032ux27454ux22899ux35013ux36830ux24125ux20013ux38271ux27454ux27611ux34915,ux33589ux20339ux22958', '中长,毛衣,秋冬,女装,新款,INC2011,连帽,INC2011秋冬新款女装连帽中长款毛衣,茵佳妮', '', '', 'ux26381ux35013ux44ux20869ux34915ux44ux37197ux20214', '服装,内衣,配件', 'ux20840ux22269', '全国', 'ux32418ux33394,ux40657ux33394,ux23567ux30721,ux20013ux30721,ux22823ux30721,ux22343ux30721,ux24120ux35268ux27611ux32447', '红色,黑色,小码,中码,大码,均码,常规毛线', '', '', 10, 0, 0, 0, 1, 0.0000, 1, 0, 0, 0, 0, '', 0, ''),
(42, 'INC茵佳妮冬装中长款修身保暖羽绒服不配腰带', 'INC茵佳妮冬装中长款修身保暖羽绒服', 0, 0, './public/attachment/201201/4f012bba3d02c.jpg', '<p><img src="./public/attachment/201201/4f012bd5cd9a3.jpg" alt="" border="0" /></p>\r\n<p><img src="./public/attachment/201201/4f012bde558b1.jpg" alt="" border="0" /><br />\r\n</p>', 0, 0, 0, 0, 0, 0, 349.0000, 269.0000, 1, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0.0000, 0, '', 6, 8, 1325448165, 0, 0, '', 0.0000, 1, 0, 0, 0.0000, './public/attachment/201201/4f012bb464634.jpg', 0, 0, 0, '', '', '', 1, 1, 1, 0, 0, '', 0, 0, 30, 1, 0, 0, 1325448165, 1325456482, 'ux20339ux22958,ux20013ux38271,ux20908ux35013,ux32701ux32466ux26381,ux20445ux26262,ux20462ux36523,ux19981ux37197,ux33136ux24102,ux73ux78ux67,ux73ux78ux67ux33589ux20339ux22958ux20908ux35013ux20013ux38271ux27454ux20462ux36523ux20445ux26262ux32701ux32466ux26381ux19981ux37197ux33136ux24102,ux33589ux20339ux22958', '佳妮,中长,冬装,羽绒服,保暖,修身,不配,腰带,INC,INC茵佳妮冬装中长款修身保暖羽绒服不配腰带,茵佳妮', '', '', 'ux26381ux35013ux44ux20869ux34915ux44ux37197ux20214,ux22899ux35013', '服装,内衣,配件,女装', 'ux20840ux22269', '全国', 'ux27915ux32043,ux29611ux32418,ux21271ux26497ux34013,ux23567ux30721,ux20013ux30721,ux22823ux30721,ux22343ux30721,ux32701ux32466', '洋紫,玫红,北极蓝,小码,中码,大码,均码,羽绒', '', '', 10, 0, 0, 0, 1, 0.0000, 1, 0, 0, 0, 0, '', 0, ''),
(43, 'INC茵佳妮新款女装双层翻领长袖修身双排扣毛呢外套', 'INC茵佳妮新款女装', 0, 0, './public/attachment/201201/4f012ce95cf44.jpg', '<p><img src="./public/attachment/201201/4f012d08c7c1f.jpg" alt="" border="0" /></p>\r\n<p><img src="./public/attachment/201201/4f012d1459f95.jpg" alt="" border="0" /><br />\r\n</p>\r\n<p><img src="./public/attachment/201201/4f012d1c89c4c.jpg" alt="" border="0" /><br />\r\n</p>\r\n<p><img src="./public/attachment/201201/4f012d23980fa.jpg" alt="" border="0" /><br />\r\n</p>', 0, 0, 0, 0, 0, 0, 599.0000, 299.0000, 1, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0.0000, 100, '', 7, 8, 1325448471, 0, 0, '', 0.0000, 1, 0, 0, 0.0000, './public/attachment/201201/4f012ce4b960b.jpg', 0, 0, 0, '', '', '', 1, 1, 1, 0, 0, '', 0, 0, 30, 1, 0, 0, 1325448470, 1325456473, 'ux20339ux22958,ux27611ux21602,ux21452ux25490,ux32763ux39046,ux20462ux36523,ux38271ux34966,ux21452ux23618,ux22806ux22871,ux22899ux35013,ux26032ux27454,ux73ux78ux67ux33589ux20339ux22958ux26032ux27454ux22899ux35013ux21452ux23618ux32763ux39046ux38271ux34966ux20462ux36523ux21452ux25490ux25187ux27611ux21602ux22806ux22871,ux33589ux20339ux22958', '佳妮,毛呢,双排,翻领,修身,长袖,双层,外套,女装,新款,INC茵佳妮新款女装双层翻领长袖修身双排扣毛呢外套,茵佳妮', '', '', 'ux26381ux35013ux44ux20869ux34915ux44ux37197ux20214,ux22899ux35013', '服装,内衣,配件,女装', 'ux20840ux22269', '全国', 'ux40657ux33394,ux39548ux33394,ux32418ux33394,ux22343ux30721,ux20013ux30721,ux23612ux32466', '黑色,驼色,红色,均码,中码,尼绒', '', '', 10, 0, 0, 0, 1, 0.0000, 1, 0, 0, 0, 0, '', 0, ''),
(44, '茵佳妮2011秋装新款糖果色修身简单格调百搭连帽卫衣', '茵佳妮2011秋装新款', 0, 0, './public/attachment/201201/4f012df65d0fe.jpg', '<p><img src="./public/attachment/201201/4f012e1063ec3.jpg" alt="" border="0" /></p>\r\n<p><img src="./public/attachment/201201/4f012e17c12e3.jpg" alt="" border="0" /><br />\r\n</p>', 0, 0, 0, 0, 0, 0, 169.0000, 109.0000, 15, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0.0000, 0, '', 8, 8, 1325448663, 0, 0, '', 0.0000, 1, 0, 0, 0.0000, './public/attachment/201201/4f012df0a2444.jpg', 0, 0, 0, '', '', '', 1, 1, 1, 0, 0, '', 0, 0, 30, 1, 0, 0, 1325448663, 1325456465, 'ux20339ux22958,ux31179ux35013,ux26684ux35843,ux20462ux36523,ux31958ux26524,ux26032ux27454,ux31616ux21333,ux36830ux24125,ux21355ux34915,ux50ux48ux49ux49,ux33589ux20339ux22958ux50ux48ux49ux49ux31179ux35013ux26032ux27454ux31958ux26524ux33394ux20462ux36523ux31616ux21333ux26684ux35843ux30334ux25645ux36830ux24125ux21355ux34915,ux33589ux20339ux22958', '佳妮,秋装,格调,修身,糖果,新款,简单,连帽,卫衣,2011,茵佳妮2011秋装新款糖果色修身简单格调百搭连帽卫衣,茵佳妮', '', '', 'ux26381ux35013ux44ux20869ux34915ux44ux37197ux20214,ux22899ux35013', '服装,内衣,配件,女装', 'ux20840ux22269,ux31119ux24030', '全国,福州', 'ux32737ux32736ux32511,ux20013ux30721,ux22343ux30721', '翡翠绿,中码,均码', '', '', 10, 0, 0, 0, 1, 0.0000, 1, 0, 0, 0, 0, '', 0, ''),
(45, 'INC新款翻领双排扣系腰带长袖优雅格子短款毛呢外套', 'INC新款', 0, 0, './public/images/201201/big/4f012ecddf917.jpg', '<p><img src="./public/attachment/201201/4f012f02b207a.jpg" alt="" border="0" /></p>\r\n<p><img src="./public/attachment/201201/4f012f0a3ee21.jpg" alt="" border="0" /><br />\r\n</p>', 0, 0, 0, 0, 0, 0, 349.0000, 269.0000, 1, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0.0000, 200, '', 9, 8, 1325448913, 0, 0, '', 0.0000, 1, 0, 0, 0.0000, './public/attachment/201201/4f012eb0a0454.jpg', 0, 0, 0, '', '', '', 1, 1, 1, 0, 0, '', 0, 0, 30, 1, 0, 0, 1325448911, 1325456457, 'ux27611ux21602,ux21452ux25490,ux30701ux27454,ux32763ux39046,ux38271ux34966,ux33136ux24102,ux26684ux23376,ux22806ux22871,ux26032ux27454,ux20248ux38597,ux73ux78ux67ux26032ux27454ux32763ux39046ux21452ux25490ux25187ux31995ux33136ux24102ux38271ux34966ux20248ux38597ux26684ux23376ux30701ux27454ux27611ux21602ux22806ux22871,ux33589ux20339ux22958', '毛呢,双排,短款,翻领,长袖,腰带,格子,外套,新款,优雅,INC新款翻领双排扣系腰带长袖优雅格子短款毛呢外套,茵佳妮', '', '', 'ux26381ux35013ux44ux20869ux34915ux44ux37197ux20214,ux22899ux35013', '服装,内衣,配件,女装', 'ux20840ux22269', '全国', 'ux40657ux30333ux26684,ux32418ux40657ux26684,ux22343ux30721,ux20013ux30721', '黑白格,红黑格,均码,中码', '', '', 10, 0, 0, 0, 1, 0.0000, 1, 0, 0, 0, 0, '', 0, ''),
(46, '品牌特卖南极人保暖内衣男士女士羊毛竹炭黄金绒(套装)9067/9068', '南极人保暖内衣', 0, 0, './public/attachment/201201/4f01301613aa8.jpg', '<p><img src="./public/attachment/201201/4f01302c63359.jpg" alt="" border="0" /></p>\r\n<p><img src="./public/attachment/201201/4f0130390a882.jpg" alt="" border="0" /><br />\r\n</p>', 0, 0, 0, 0, 0, 0, 249.0000, 95.0000, 1, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0.0000, 0, '', 10, 8, 1325449229, 0, 0, '', 0.0000, 1, 0, 0, 0.0000, './public/attachment/201201/4f013010be2af.jpg', 0, 0, 0, '', '', '', 1, 1, 1, 0, 0, '', 0, 0, 24, 1, 0, 0, 1325449229, 1325456449, 'ux21335ux26497ux20154,ux20445ux26262ux20869ux34915,ux31481ux28845,ux29305ux21334,ux32650ux27611,ux30007ux22763,ux22871ux35013,ux22899ux22763,ux40644ux37329,ux21697ux29260,ux21697ux29260ux29305ux21334ux21335ux26497ux20154ux20445ux26262ux20869ux34915ux30007ux22763ux22899ux22763ux32650ux27611ux31481ux28845ux40644ux37329ux32466ux40ux22871ux35013ux41ux57ux48ux54ux55ux47ux57ux48ux54ux56', '南极人,保暖内衣,竹炭,特卖,羊毛,男士,套装,女士,黄金,品牌,品牌特卖南极人保暖内衣男士女士羊毛竹炭黄金绒(套装)9067/9068', '', '', 'ux26381ux35013ux44ux20869ux34915ux44ux37197ux20214', '服装,内衣,配件', 'ux20840ux22269', '全国', 'ux40657ux33394,ux32043ux33394,ux22343ux30721,ux32431ux32501', '黑色,紫色,均码,纯绵', '', '', 9, 0, 0, 0, 1, 0.0000, 1, 0, 0, 0, 0, '', 0, ''),
(47, '4.3折原价1199正品七匹狼男装 冬款外套双面冬羽绒服701086', '七匹狼男装', 0, 0, './public/attachment/201201/4f01329d60fa2.jpg', '<img src="./public/attachment/201201/4f0132b85fbb4.jpg" alt="" border="0" />', 0, 0, 0, 0, 0, 0, 1199.0000, 525.0000, 1, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0.0000, 300, '', 11, 8, 1325449859, 0, 0, '', 0.0000, 1, 0, 0, 0.0000, './public/attachment/201201/4f013298227ec.jpg', 0, 0, 0, '', '', '', 1, 1, 1, 0, 0, '', 0, 0, 31, 1, 5, 5, 1325449858, 1325456432, 'ux19971ux21305ux29436,ux32701ux32466ux26381,ux21452ux38754,ux27491ux21697,ux30007ux35013,ux21407ux20215,ux22806ux22871,ux55ux48ux49ux48ux56ux54,ux49ux49ux57ux57,ux52ux46ux51,ux52ux46ux51ux25240ux21407ux20215ux49ux49ux57ux57ux27491ux21697ux19971ux21305ux29436ux30007ux35013ux20908ux27454ux22806ux22871ux21452ux38754ux20908ux32701ux32466ux26381ux55ux48ux49ux48ux56ux54', '七匹狼,羽绒服,双面,正品,男装,原价,外套,701086,1199,4.3,4.3折原价1199正品七匹狼男装 冬款外套双面冬羽绒服701086', '', '', 'ux26381ux35013ux44ux20869ux34915ux44ux37197ux20214,ux30007ux35013', '服装,内衣,配件,男装', 'ux20840ux22269', '全国', 'ux40657ux33394,ux36229ux22823ux30721,ux22823ux30721,ux20013ux30721', '黑色,超大码,大码,中码', '', '', 12, 0, 0, 0, 1, 0.0000, 1, 0, 0, 0, 0, '', 0, ''),
(48, '岁末回馈5折原价1299正品七匹狼男装外套时尚中长装羽绒服701604', '七匹狼男装外套', 0, 0, './public/attachment/201201/4f0133bbca79e.jpg', '<img src="./public/attachment/201201/4f0133d8801c8.jpg" alt="" border="0" />', 0, 0, 0, 0, 0, 0, 1299.0000, 639.0000, 15, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0.0000, 0, '', 12, 0, 1325450103, 0, 0, '', 0.0000, 1, 0, 0, 0.0000, './public/attachment/201201/4f0133a8ce189.jpg', 0, 0, 0, '', '', '', 1, 1, 1, 0, 0, '', 0, 0, 31, 1, 0, 0, 1325450102, 1325456422, 'ux19971ux21305ux29436,ux38271ux35013,ux32701ux32466ux26381,ux23681ux26411,ux22238ux39304,ux27491ux21697,ux30007ux35013,ux21407ux20215,ux22806ux22871,ux55ux48ux49ux54ux48ux52,ux23681ux26411ux22238ux39304ux53ux25240ux21407ux20215ux49ux50ux57ux57ux27491ux21697ux19971ux21305ux29436ux30007ux35013ux22806ux22871ux26102ux23578ux20013ux38271ux35013ux32701ux32466ux26381ux55ux48ux49ux54ux48ux52', '七匹狼,长装,羽绒服,岁末,回馈,正品,男装,原价,外套,701604,岁末回馈5折原价1299正品七匹狼男装外套时尚中长装羽绒服701604', '', '', 'ux26381ux35013ux44ux20869ux34915ux44ux37197ux20214,ux30007ux35013', '服装,内衣,配件,男装', 'ux20840ux22269,ux31119ux24030', '全国,福州', '', '', '', '', 12, 0, 0, 0, 1, 0.0000, 1, 0, 0, 0, 0, '', 0, ''),
(49, '【三店通用】6.8元抢购奶酪魏秘制奶酪1份！宫廷奶酪/木瓜奶酪/草莓奶酪/香芋奶酪/蓝莓奶酪/蛋黄奶酪/巧克力奶酪（7选1）！原料新鲜，奶香醇厚，口感细腻绵滑，四代传承经典美味，老北京的小吃名片！', '老北京的小吃', 8, 17, './public/attachment/201201/4f0147c5a1983.jpg', '<p><b>宫廷奶酪：</b>白如豆腐的宫廷奶酪，细腻润滑，奶香夹带着淡淡的酒香，凉甜细滑，入口香甜。奶酪不但不会使人发胖，而且对身体有很多的好处。奶酪和酸奶一样，包含了牛奶中所有的天然营养成分。爱吃又怕发胖的你，还不赶紧来尝尝这特有的老北京宫廷美食~</p>\r\n<p><img src="./public/attachment/201201/4f0148002ebea.jpg" alt="" border="0" /></p>\r\n<p><img src="./public/attachment/201201/4f014807b079d.jpg" alt="" border="0" /><br />\r\n</p>\r\n<p><img src="./public/attachment/201201/4f01480e48bce.jpg" alt="" border="0" /><br />\r\n</p>\r\n<p><img src="./public/attachment/201201/4f0148152af8b.jpg" alt="" border="0" /><br />\r\n</p>', 0, 1529704800, 0, 0, 0, 0, 10.0000, 6.8000, 15, 1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0.0000, 0, '', 13, 0, 1325455280, 0, 0, '', 0.0000, 0, 0, 0, 0.0000, './public/attachment/201201/4f0147c5a1983.jpg', 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 2, 0, 0, 1325455280, 1416550900, 'ux22902ux37226,ux22235ux20195,ux19977ux24215,ux39321ux33419,ux34013ux33683,ux37255ux21402,ux34507ux40644,ux26408ux29916,ux21475ux24863,ux25250ux36141,ux12304ux19977ux24215ux36890ux29992ux12305ux54ux46ux56ux20803ux25250ux36141ux22902ux37226ux39759ux31192ux21046ux22902ux37226ux49ux20221ux65281ux23467ux24311ux22902ux37226ux47ux26408ux29916ux22902ux37226ux47ux33609ux33683ux22902ux37226ux47ux39321ux33419ux22902ux37226ux47ux34013ux33683ux22902ux37226ux47ux34507ux40644ux22902ux37226ux47ux24039ux20811ux21147ux22902ux37226ux65288ux55ux36873ux49ux65289ux65281ux21407ux26009ux26032ux40092ux65292ux22902ux39321ux37255ux21402ux65292ux21475ux24863ux32454ux33147ux32501ux28369ux65292ux22235ux20195ux20256ux25215ux32463ux20856ux32654ux21619ux65292ux32769ux21271ux20140ux30340ux23567ux21507ux21517ux29255ux65281', '奶酪,四代,三店,香芋,蓝莓,醇厚,蛋黄,木瓜,口感,抢购,【三店通用】6.8元抢购奶酪魏秘制奶酪1份！宫廷奶酪/木瓜奶酪/草莓奶酪/香芋奶酪/蓝莓奶酪/蛋黄奶酪/巧克力奶酪（7选1）！原料新鲜，奶香醇厚，口感细腻绵滑，四代传承经典美味，老北京的小吃名片！', 'ux39184ux39278ux32654ux39135,ux21654ux21857', '餐饮美食,咖啡', '', '', 'ux20840ux22269,ux31119ux24030,ux40723ux27004ux21306,ux21326ux20016,ux31119ux24030ux24066,ux30000ux36335,ux22823ux37202ux24215,ux23545ux38754,ux22823ux21414,ux31119ux24030ux24066ux40723ux27004ux21306ux21476ux30000ux36335ux56ux56ux21495ux21326ux20016ux22823ux21414ux51ux23618ux65ux23460ux40ux38397ux37117ux22823ux37202ux24215ux23545ux38754ux41,ux21488ux27743ux21306', '全国,福州,鼓楼区,华丰,福州市,田路,大酒店,对面,大厦,福州市鼓楼区古田路88号华丰大厦3层A室(闽都大酒店对面),台江区', '', '', '119.320796', '26.082646', 0, 0, 0, 0, 1, 0.0000, 1, 0, 0, 0, 0, '', 0, ''),
(50, '仅28元乐享原价41元丁丁洋回转自助火锅单人自助餐！羊肉/牛肉1份（2选1），大虾、培根、灌汤牛肉丸、水果、时令蔬菜等百余种菜品不限量供应，小料、秘制锅底、饮料任选！一人一锅，健康自助，百余种菜品任由挑选，吃什么随心所欲！', '丁丁洋回转自助火锅', 8, 17, './public/attachment/201201/4f014896c9be2.jpg', '<p><b>牛肉、羊肉：</b>牛肉、羊肉只可选取其中一份，其余肉制品任由挑选！不用顾忌别人的口味，只选择自己的所爱，放在锅底中涮着。享受那份下锅后等待的喜悦，回味那一份捞起来的诱人鲜香！</p>\r\n<p><img src="./public/attachment/201201/4f0148b7b4ac5.jpg" alt="" border="0" /></p>\r\n<p><br />\r\n</p>\r\n<p><img src="./public/attachment/201201/4f0148bfaeadf.jpg" alt="" border="0" /><br />\r\n</p>', 0, 0, 0, 0, 0, 0, 41.0000, 28.0000, 15, 1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0.0000, 0, '', 14, 0, 1325455443, 0, 0, '', 0.0000, 0, 0, 0, 0.0000, './public/attachment/201201/4f014896c9be2.jpg', 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 2, 0, 0, 1325455443, 1326735857, 'ux33756ux21697,ux20313ux31181,ux19969ux19969,ux33258ux21161,ux32905ux20024,ux38149ux24213,ux26102ux20196,ux22521ux26681,ux19968ux20154,ux20219ux36873,ux20165ux50ux56ux20803ux20048ux20139ux21407ux20215ux52ux49ux20803ux19969ux19969ux27915ux22238ux36716ux33258ux21161ux28779ux38149ux21333ux20154ux33258ux21161ux39184ux65281ux32650ux32905ux47ux29275ux32905ux49ux20221ux65288ux50ux36873ux49ux65289ux65292ux22823ux34430ux12289ux22521ux26681ux12289ux28748ux27748ux29275ux32905ux20024ux12289ux27700ux26524ux12289ux26102ux20196ux34092ux33756ux31561ux30334ux20313ux31181ux33756ux21697ux19981ux38480ux37327ux20379ux24212ux65292ux23567ux26009ux12289ux31192ux21046ux38149ux24213ux12289ux39278ux26009ux20219ux36873ux65281ux19968ux20154ux19968ux38149ux65292ux20581ux24247ux33258ux21161ux65292ux30334ux20313ux31181ux33756ux21697ux20219ux30001ux25361ux36873ux65292ux21507ux20160ux20040ux38543ux24515ux25152ux27442ux65281', '菜品,余种,丁丁,自助,肉丸,锅底,时令,培根,一人,任选,仅28元乐享原价41元丁丁洋回转自助火锅单人自助餐！羊肉/牛肉1份（2选1），大虾、培根、灌汤牛肉丸、水果、时令蔬菜等百余种菜品不限量供应，小料、秘制锅底、饮料任选！一人一锅，健康自助，百余种菜品任由挑选，吃什么随心所欲！', 'ux39184ux39278ux32654ux39135,ux24029ux33756', '餐饮美食,川菜', '', '', 'ux20840ux22269,ux31119ux24030,ux40723ux27004ux21306,ux21326ux20016,ux31119ux24030ux24066,ux30000ux36335,ux22823ux37202ux24215,ux23545ux38754,ux22823ux21414,ux31119ux24030ux24066ux40723ux27004ux21306ux21476ux30000ux36335ux56ux56ux21495ux21326ux20016ux22823ux21414ux51ux23618ux65ux23460ux40ux38397ux37117ux22823ux37202ux24215ux23545ux38754ux41,ux21488ux27743ux21306', '全国,福州,鼓楼区,华丰,福州市,田路,大酒店,对面,大厦,福州市鼓楼区古田路88号华丰大厦3层A室(闽都大酒店对面),台江区', '', '', '119.320796', '26.082646', 0, 0, 0, 0, 1, 0.0000, 1, 0, 0, 0, 0, '', 0, ''),
(51, '【韩式烤肉】35元抢购汉丽轩十里河店单人自助午餐！海鲜、烤肉、蔬菜、甜品、面点、酒水等超过200余种环球风情美食！食材当天供应，营养、新鲜、量足！攀越性价比巅峰，尝遍天下美食，尽饮美酒佳酿！让味蕾来一次奢华烤肉之旅！', '韩式烤肉', 8, 17, './public/attachment/201201/4f01497b1bb54.jpg', '<p>【韩式烤肉】35元抢购汉丽轩十里河店单人自助午餐！原价45元/位，现价35元/位！海鲜、烤肉、蔬菜、甜品、面点、酒水等超过200余种环球风情美食！食材当天供应，营养、新鲜、量足！攀越性价比巅峰，尝遍天下美食，尽饮美酒佳酿！让味蕾来一次奢华烤肉之旅！<br />\r\n&nbsp;</p>\r\n<p><b>【温馨提示】<br />\r\n</b>（1）有效期截至2012年2月9日<br />\r\n（2）营业时间：午餐11:00-14:00；晚餐17:00-21:30，周六日通用，圣诞节、元旦不接待<br />\r\n（3）不需要提前预约，最长候餐时间不超过1小时<br />\r\n（4）仅限汉丽轩烤肉超市十里河店使用<br />\r\n（5）不与其他优惠同时使用<br />\r\n（6）90cm以下儿童购票免费，90cm-130cm为25元（儿童票需到店里购买，不参与此次活动）<br />\r\n&nbsp;</p>\r\n<b>【商品介绍】<br />\r\n</b><p><b>常规菜区：</b>羊肉、牛肉、五花肉、鸭肉、鹅肉、鸡肉、鸡翅、鸡脆骨、大虾、平鱼、红鱼、黑鱼、培根、鱿鱼等五十余种招牌秘制烤肉供您选择。新鲜营养的食材，放在烤盘上慢慢烤着，随着“滋滋”的烤肉声响起，香味儿也逐渐散溢开来！</p>\r\n<p><br />\r\n</p>\r\n<p><br />\r\n</p>\r\n<p><img src="./public/attachment/201201/4f0148b7b4ac5.jpg" alt="" border="0" /><br />\r\n</p>\r\n<p><br />\r\n</p>\r\n<p><img src="./public/attachment/201201/4f0148bfaeadf.jpg" alt="" border="0" /><br />\r\n</p>', 0, 1502402880, 0, 0, 0, 0, 45.0000, 35.0000, 15, 1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0.0000, 0, '', 15, 0, 1325455695, 0, 0, '', 0.0000, 0, 0, 0, 0.0000, './public/attachment/201201/4f01497b1bb54.jpg', 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 2, 0, 0, 1325455695, 1416550887, 'ux28900ux32905,ux21313ux37324,ux38889ux24335,ux32654ux39135,ux25856ux36234,ux20339ux37247,ux38754ux28857,ux21619ux34174,ux29615ux29699,ux37202ux27700,ux12304ux38889ux24335ux28900ux32905ux12305ux51ux53ux20803ux25250ux36141ux27721ux20029ux36713ux21313ux37324ux27827ux24215ux21333ux20154ux33258ux21161ux21320ux39184ux65281ux28023ux40092ux12289ux28900ux32905ux12289ux34092ux33756ux12289ux29980ux21697ux12289ux38754ux28857ux12289ux37202ux27700ux31561ux36229ux36807ux50ux48ux48ux20313ux31181ux29615ux29699ux39118ux24773ux32654ux39135ux65281ux39135ux26448ux24403ux22825ux20379ux24212ux65292ux33829ux20859ux12289ux26032ux40092ux12289ux37327ux36275ux65281ux25856ux36234ux24615ux20215ux27604ux24005ux23792ux65292ux23581ux36941ux22825ux19979ux32654ux39135ux65292ux23613ux39278ux32654ux37202ux20339ux37247ux65281ux35753ux21619ux34174ux26469ux19968ux27425ux22882ux21326ux28900ux32905ux20043ux26053ux65281', '烤肉,十里,韩式,美食,攀越,佳酿,面点,味蕾,环球,酒水,【韩式烤肉】35元抢购汉丽轩十里河店单人自助午餐！海鲜、烤肉、蔬菜、甜品、面点、酒水等超过200余种环球风情美食！食材当天供应，营养、新鲜、量足！攀越性价比巅峰，尝遍天下美食，尽饮美酒佳酿！让味蕾来一次奢华烤肉之旅！', 'ux39184ux39278ux32654ux39135,ux24029ux33756', '餐饮美食,川菜', '', '', 'ux20840ux22269,ux31119ux24030,ux40723ux27004ux21306,ux21326ux20016,ux31119ux24030ux24066,ux30000ux36335,ux22823ux37202ux24215,ux23545ux38754,ux22823ux21414,ux31119ux24030ux24066ux40723ux27004ux21306ux21476ux30000ux36335ux56ux56ux21495ux21326ux20016ux22823ux21414ux51ux23618ux65ux23460ux40ux38397ux37117ux22823ux37202ux24215ux23545ux38754ux41,ux21488ux27743ux21306', '全国,福州,鼓楼区,华丰,福州市,田路,大酒店,对面,大厦,福州市鼓楼区古田路88号华丰大厦3层A室(闽都大酒店对面),台江区', '', '', '119.320796', '26.082646', 0, 0, 0, 0, 1, 0.0000, 1, 0, 0, 0, 0, '', 0, ''),
(52, '【44店通用】独家尊享：仅28元享云川台球2小时畅打，千品网携手云川台球联袂献礼，全城44家连锁店通用！京城名店，星级服务，多人共享，不容错过，休闲娱乐好去处，首选云川俱乐部！', '台球券', 10, 21, './public/attachment/201201/4f014a031f8f9.jpg', '<b>【温馨提示】</b><br />\r\n（1）有效期截至2012年2月20日<br />\r\n（2）营业时间：09:00-02:00，尊享套餐使用时间：09:00-17:00（含节假日）<br />\r\n（3）云川俱乐部四十四家连锁店通用（中关村店天创科技大厦店、月坛店、国贸店除外）<br />\r\n（4）不与其他优惠同时使用<br />\r\n（5）本商品不限制使用份数，每人限购5份<br />\r\n（6）本商品不支持“随时退”、“随时退” <br />\r\n<br />\r\n<b>【商品介绍】</b><br />\r\n<p><b>云川台球：</b>一流的设备，星级的服务，高雅的环境，靓丽的陪练，高超的杆法，精彩的球技，超值的价格，尊贵的享受！一切的完美享受尽在云川台球俱乐部！这里是台球竞技的天堂，欣赏台球比赛的绝佳场所！</p>\r\n<p><img src="./public/attachment/201201/4f014a3684df8.jpg" alt="" border="0" /><br />\r\n</p>\r\n<p><br />\r\n</p>\r\n<p><img src="./public/attachment/201201/4f014a3d49bde.jpg" alt="" border="0" /><br />\r\n</p>', 0, 1495750200, 0, 0, 0, 0, 76.0000, 28.0000, 15, 1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0.0000, 0, '', 16, 0, 1325455822, 0, 0, '', 0.0000, 0, 0, 0, 0.0000, './public/attachment/201201/4f014a031f8f9.jpg', 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 2, 0, 0, 1325455822, 1416550880, 'ux20113ux24029,ux21488ux29699,ux21697ux32593,ux36890ux29992,ux20140ux22478,ux29486ux31036,ux32852ux34946,ux21517ux24215,ux20840ux22478,ux20465ux20048ux37096,ux12304ux52ux52ux24215ux36890ux29992ux12305ux29420ux23478ux23562ux20139ux65306ux20165ux50ux56ux20803ux20139ux20113ux24029ux21488ux29699ux50ux23567ux26102ux30021ux25171ux65292ux21315ux21697ux32593ux25658ux25163ux20113ux24029ux21488ux29699ux32852ux34946ux29486ux31036ux65292ux20840ux22478ux52ux52ux23478ux36830ux38145ux24215ux36890ux29992ux65281ux20140ux22478ux21517ux24215ux65292ux26143ux32423ux26381ux21153ux65292ux22810ux20154ux20849ux20139ux65292ux19981ux23481ux38169ux36807ux65292ux20241ux38386ux23089ux20048ux22909ux21435ux22788ux65292ux39318ux36873ux20113ux24029ux20465ux20048ux37096ux65281', '云川,台球,品网,通用,京城,献礼,联袂,名店,全城,俱乐部,【44店通用】独家尊享：仅28元享云川台球2小时畅打，千品网携手云川台球联袂献礼，全城44家连锁店通用！京城名店，星级服务，多人共享，不容错过，休闲娱乐好去处，首选云川俱乐部！', 'ux29983ux27963ux26381ux21153', '生活服务', '', '', 'ux20840ux22269,ux31119ux24030,ux26187ux23433ux21306,ux22909ux26469,ux31119ux24030ux24066,ux24215ux38754,ux26143ux20809,ux22823ux36947,ux36830ux27915ux36335,ux49ux50ux51,ux49ux51,ux31119ux24030ux24066ux26187ux23433ux21306ux36830ux27915ux36335ux49ux50ux51ux21495ux22909ux26469ux23627ux26143ux20809ux22823ux36947ux53ux35ux27004ux49ux51ux35ux24215ux38754,ux34701ux20392ux19996ux21306', '全国,福州,晋安区,好来,福州市,店面,星光,大道,连洋路,123,13,福州市晋安区连洋路123号好来屋星光大道5#楼13#店面,融侨东区', '', '', '119.357576', '26.077701', 0, 0, 0, 0, 1, 0.0000, 1, 0, 0, 0, 0, '', 0, ''),
(53, '【川味火锅】仅98元尊享原价227元四川仁火锅2-3人套餐！招牌红油高汤鸳鸯锅+肥牛+丸子组合+扇贝柱+田园鸭肠+香玉丝瓜+金银馒头+香甜玉米+酸梅汤/豆浆（2选1）2杯！纵情滋味，玩享生活，尽在四川仁火锅！', '川味火锅', 8, 17, './public/attachment/201201/4f014a935d99a.jpg', '<p>【川味火锅】仅98元尊享原价227元四川仁火锅2-3人套餐！招牌红油高汤鸳鸯锅+肥牛+丸子组合+扇贝柱+田园鸭肠+香玉丝瓜+金银馒头+香甜玉米+酸梅汤/豆浆（2选1）2杯！纵情滋味，玩享生活，尽在四川仁火锅！</p>\r\n<p><br />\r\n</p>\r\n<p><img src="./public/attachment/201201/4f014ab222e6b.jpg" alt="" border="0" /><br />\r\n</p>', 0, 0, 0, 0, 0, 0, 227.0000, 98.0000, 15, 1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0.0000, 0, '', 17, 0, 1325455942, 0, 0, '', 0.0000, 0, 0, 0, 0.0000, './public/attachment/201201/4f014a935d99a.jpg', 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 2, 0, 0, 1325455942, 1326735816, 'ux28779ux38149,ux22235ux24029,ux39321ux29577,ux24029ux21619,ux36125ux26609,ux37240ux26757ux27748,ux32418ux27833,ux39640ux27748,ux32933ux29275,ux19997ux29916,ux12304ux24029ux21619ux28779ux38149ux12305ux20165ux57ux56ux20803ux23562ux20139ux21407ux20215ux50ux50ux55ux20803ux22235ux24029ux20161ux28779ux38149ux50ux45ux51ux20154ux22871ux39184ux65281ux25307ux29260ux32418ux27833ux39640ux27748ux40499ux40495ux38149ux43ux32933ux29275ux43ux20024ux23376ux32452ux21512ux43ux25159ux36125ux26609ux43ux30000ux22253ux40493ux32928ux43ux39321ux29577ux19997ux29916ux43ux37329ux38134ux39314ux22836ux43ux39321ux29980ux29577ux31859ux43ux37240ux26757ux27748ux47ux35910ux27974ux65288ux50ux36873ux49ux65289ux50ux26479ux65281ux32437ux24773ux28363ux21619ux65292ux29609ux20139ux29983ux27963ux65292ux23613ux22312ux22235ux24029ux20161ux28779ux38149ux65281', '火锅,四川,香玉,川味,贝柱,酸梅汤,红油,高汤,肥牛,丝瓜,【川味火锅】仅98元尊享原价227元四川仁火锅2-3人套餐！招牌红油高汤鸳鸯锅+肥牛+丸子组合+扇贝柱+田园鸭肠+香玉丝瓜+金银馒头+香甜玉米+酸梅汤/豆浆（2选1）2杯！纵情滋味，玩享生活，尽在四川仁火锅！', 'ux39184ux39278ux32654ux39135,ux24029ux33756', '餐饮美食,川菜', '', '', 'ux20840ux22269,ux31119ux24030,ux40723ux27004ux21306,ux21326ux20016,ux31119ux24030ux24066,ux30000ux36335,ux22823ux37202ux24215,ux23545ux38754,ux22823ux21414,ux31119ux24030ux24066ux40723ux27004ux21306ux21476ux30000ux36335ux56ux56ux21495ux21326ux20016ux22823ux21414ux51ux23618ux65ux23460ux40ux38397ux37117ux22823ux37202ux24215ux23545ux38754ux41,ux21488ux27743ux21306', '全国,福州,鼓楼区,华丰,福州市,田路,大酒店,对面,大厦,福州市鼓楼区古田路88号华丰大厦3层A室(闽都大酒店对面),台江区', '', '', '119.320796', '26.082646', 0, 0, 0, 0, 1, 0.0000, 1, 0, 0, 0, 0, '', 0, '');
INSERT INTO `fanwe_deal` (`id`, `name`, `sub_name`, `cate_id`, `supplier_id`, `img`, `description`, `begin_time`, `end_time`, `min_bought`, `max_bought`, `user_min_bought`, `user_max_bought`, `origin_price`, `current_price`, `city_id`, `is_coupon`, `is_delivery`, `is_effect`, `is_delete`, `user_count`, `buy_count`, `time_status`, `buy_status`, `deal_type`, `allow_promote`, `return_money`, `return_score`, `brief`, `sort`, `deal_goods_type`, `success_time`, `coupon_begin_time`, `coupon_end_time`, `code`, `weight`, `weight_id`, `is_referral`, `buy_type`, `discount`, `icon`, `notice`, `free_delivery`, `define_payment`, `seo_title`, `seo_keyword`, `seo_description`, `is_hot`, `is_new`, `is_best`, `is_lottery`, `reopen`, `uname`, `forbid_sms`, `cart_type`, `shop_cate_id`, `is_shop`, `total_point`, `avg_point`, `create_time`, `update_time`, `name_match`, `name_match_row`, `deal_cate_match`, `deal_cate_match_row`, `shop_cate_match`, `shop_cate_match_row`, `locate_match`, `locate_match_row`, `tag_match`, `tag_match_row`, `xpoint`, `ypoint`, `brand_id`, `brand_promote`, `publish_wait`, `account_id`, `is_recommend`, `balance_price`, `is_refund`, `auto_order`, `expire_refund`, `any_refund`, `multi_attr`, `notes`, `deal_event_id`, `package`) VALUES
(54, '2012完美婚纱，幸福新人首选凯蒂！仅2580元，即享原价6880元【凯蒂婚纱摄影】套餐：专业拍摄至少100张+底片全送，30张精修入册+4套服装造型+独家外景基地三盛托斯卡纳欧式外景+新人宫殿主题摄影全实景棚任您选择+各类精美拍摄产品，资深摄影师、化妆师全程服务，前8名用户更有其他精美好礼。你的婚礼，要办就要响亮，给她最好的爱！', '婚纱', 15, 19, './public/attachment/201202/16/11/4f3c7d681ed70.jpg', '<p align="center"><strong>【福州】福州凯蒂婚纱摄影机构</strong></p>\r\n<p align="left"><strong><br />\r\n</strong><strong>【特别提示】</strong></p>\r\n<p align="left"><strong>有 效 期</strong>：2012年2月15日至2012年3月20日（过期无效)；</p>\r\n<p align="left"><strong>使用限制</strong>：可购买多张福团券，每张福团券仅限1对新人使用； </p>\r\n<p align="left"><strong>商家地址</strong>：福州市鼓楼区东街口贤南商厦二楼； </p>\r\n<p align="left"><strong>咨询电话</strong>：0591-83819192；</p>\r\n<p align="left"><strong>营业时间</strong>：8:00-22:00；</p>\r\n<p align="left"><strong>使用提示</strong>：</p>\r\n<p align="left">1.凭手机短信至商家店内验证消费，节假日通用； </p>\r\n<p align="left">2.请根据短信中的电话预约消费时间（为保证服务质量，请提前1天预约！）</p>\r\n<p align="left">3.请在有效期内至店验证签约，签约后拍照有效期为1年，过期无效；</p>\r\n<p align="left">4.无隐性消费，请放心购买。</p>\r\n<p align="left">客服电话：400-600-5515 </p>\r\n<p align="left"><strong>【活动详情】</strong></p>\r\n<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;2012完美婚纱，幸福新人首选凯蒂！仅2580元，即享原价6880元【凯蒂婚纱摄影】套餐：专业拍摄至少100张+底片全送，30张精修入册+4套服装造型+独家外景基地三盛托斯卡纳欧式外景+新人宫殿主题摄影全实景棚任您选择+各类精美拍摄产品，资深摄影师、化妆师全程服务，前8名用户更有其他精美好礼。你的婚礼，要办就要响亮，给她最好的爱！</p>\r\n<p align="left"><strong>【套餐详情】</strong></p>\r\n<p>■<strong>拍摄内容：</strong>世界专业级全画幅佳能5Dmark2数码相机拍摄不少于120张，赠数码底片电脑光盘1张，内含原始文档120张拍摄底片，其中入册30张；所有入册照片精调专业数码处理</p>\r\n<p>■<strong>服装造型：</strong>全面开放大S与何润东样版服一套拍摄</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;全面开放极品区维多利亚礼服一套拍摄 </p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;全面开放VIP区卡罗琳系列婚纱一套拍摄</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;全面开放VIP区卡罗琳系列礼服一套拍摄</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;高级彩妆造型师完美设计新娘整体造型4次</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;高级彩妆造型师完美设计新郎整体造型1次</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;免费提供绅士拍摄礼服4套</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;免费提供美目睫毛+化妆品+饰品道具</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;超视觉实景景观“新人宫殿”任意拍摄</p>\r\n<p>■<strong>专业服务：</strong>资深摄影师全程服务</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;资深化妆师全程服务</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;尊享独立豪华卸妆间</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;拍摄原创团队打造属于您的个性婚纱照</p>\r\n<p>■<strong>拍摄景点：</strong>千万级纯欧式独家外景基地三盛托斯卡纳精致化拍摄</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2000平米全景、穿透式3D影视新人宫殿实景影棚拍摄</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;韩宫实景五十八处任选（樱花树+钢琴恋曲 +罗马假日 +首尔夜曲+莱卡印象……）</p>\r\n<p>■<strong>拍摄产品：</strong>剧情风格多样化拍摄，精选本组底片共30张（放大本组内选）</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.16寸意大利琉璃水晶相册满屏设计一本<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（原创设计法国耐湾环保工艺PU迁薄内页一体化制作）</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.12寸意大利琉璃水晶相册满屏设计一本<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（原创设计法国耐湾环保工艺PU迁薄内页一体化制作）</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.32寸精放照片一张 + 32寸 油画特效处理 + 32寸 卢浮宫经典艺术相框一个（精修內选制作）</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.24寸精放照片一张 + 24寸 环保工艺宫廷版画制作（精修內选制作）</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.加赠时尚魅力摆台相框一个</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6.加赠流金岁月摆台相框一个</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7.加赠精美钱包照两张</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8.加赠答谢卡(3寸照片）30张</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;9.影视级3D电影婚纱电子相册一碟</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10.原始底片光盘一碟（内含120张）</p>\r\n<p>■<strong>前8名的加送：</strong>1.80寸超大韩式布挂一副</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.心动新年节三连挂框一副</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3.精美新娘皮包一个 <br />\r\n</p>\r\n<p>■<strong>结婚庆典：</strong>独创新婚传家宝——贵宾60年终身免费拍摄VIP卡一张</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;新娘结婚当日免费租用丽致区婚纱一套、礼服一套（干洗费60元/套另计）</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;新娘免费化妆两次（假睫毛、饰品、鲜花自配、需自付新娘红包138元）</p>\r\n<p><br />\r\n</p>\r\n<p><img src="./public/attachment/201202/16/11/4f3c7d8cbfa64.jpg" alt="" border="0" /></p>\r\n<p><br />\r\n</p>\r\n<p><img src="./public/attachment/201202/16/11/4f3c7d9443a97.jpg" alt="" border="0" /><br />\r\n</p>', 1328039587, 1519329180, 0, 0, 0, 0, 9999.0000, 1555.0000, 15, 1, 0, 1, 0, 0, 12, 1, 1, 0, 0, 0.0000, 0, '凯帝婚纱摄影是一家融汇东西方文化精髓的大型专业婚纱摄影公司，位于福州市繁华的东街口商圈。采用全新的规模化经营模式，拥有国际最新的顶级设备和服务空间，聚焦了国际化专业技术人才和管理团队。 凯帝婚纱摄影秉承“创新、完美、感恩”的核心理念，为新人提供高品质、个性化的婚纱摄影作品和全新的高品位服务！“新风格、新服务、新技术、新婚纱、新产品”五新特色是凯帝婚纱创新精神的体现；对品质的不懈追求、精益求精是凯帝婚纱追求完美的信念；人性化的精致服务、追求顾客百分之百满意度是凯帝婚纱对顾客感恩的具体表现！‎', 18, 0, 1329335573, 0, 0, '', 0.0000, 1, 0, 0, 0.0000, './public/attachment/201202/16/11/4f3c7d681ed70.jpg', 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 1329335573, 1416550823, 'ux20975ux33922,ux19977ux30427,ux25176ux26031ux21345ux32435,ux22806ux26223,ux25293ux25668,ux26032ux20154,ux20840ux31243ux26381ux21153,ux31934ux20462,ux24213ux29255,ux21270ux22918ux24072,ux50ux48ux49ux50ux23436ux32654ux23130ux32433ux65292ux24184ux31119ux26032ux20154ux39318ux36873ux20975ux33922ux65281ux20165ux50ux53ux56ux48ux20803ux65292ux21363ux20139ux21407ux20215ux54ux56ux56ux48ux20803ux12304ux20975ux33922ux23130ux32433ux25668ux24433ux12305ux22871ux39184ux65306ux19987ux19994ux25293ux25668ux33267ux23569ux49ux48ux48ux24352ux43ux24213ux29255ux20840ux36865ux65292ux51ux48ux24352ux31934ux20462ux20837ux20876ux43ux52ux22871ux26381ux35013ux36896ux22411ux43ux29420ux23478ux22806ux26223ux22522ux22320ux19977ux30427ux25176ux26031ux21345ux32435ux27431ux24335ux22806ux26223ux43ux26032ux20154ux23467ux27583ux20027ux39064ux25668ux24433ux20840ux23454ux26223ux26842ux20219ux24744ux36873ux25321ux43ux21508ux31867ux31934ux32654ux25293ux25668ux20135ux21697ux65292ux36164ux28145ux25668ux24433ux24072ux12289ux21270ux22918ux24072ux20840ux31243ux26381ux21153ux65292ux21069ux56ux21517ux29992ux25143ux26356ux26377ux20854ux20182ux31934ux32654ux22909ux31036ux12290ux20320ux30340ux23130ux31036ux65292ux35201ux21150ux23601ux35201ux21709ux20142ux65292ux32473ux22905ux26368ux22909ux30340ux29233ux65281', '凯蒂,三盛,托斯卡纳,外景,拍摄,新人,全程服务,精修,底片,化妆师,2012完美婚纱，幸福新人首选凯蒂！仅2580元，即享原价6880元【凯蒂婚纱摄影】套餐：专业拍摄至少100张+底片全送，30张精修入册+4套服装造型+独家外景基地三盛托斯卡纳欧式外景+新人宫殿主题摄影全实景棚任您选择+各类精美拍摄产品，资深摄影师、化妆师全程服务，前8名用户更有其他精美好礼。你的婚礼，要办就要响亮，给她最好的爱！', 'ux25105ux35201ux32467ux23130', '我要结婚', '', '', 'ux20840ux22269,ux31119ux24030,ux33945ux21476ux33829,ux31119ux24030ux24066,ux21271ux36335,ux31449ux29260,ux21518ux38498,ux23486ux39302,ux20116ux19968,ux31119ux24030ux24066ux20116ux19968ux21271ux36335ux54ux55ux21495ux65288ux33945ux21476ux33829ux31449ux29260ux21518ux65289ux24310ux31119ux23486ux39302ux21518ux38498,ux40723ux27004ux21306,ux20116ux19968ux24191ux22330', '全国,福州,蒙古营,福州市,北路,站牌,后院,宾馆,五一,福州市五一北路67号（蒙古营站牌后）延福宾馆后院,鼓楼区,五一广场', '', '', '119.31585', '26.089641', 0, 0, 0, 0, 1, 0.0000, 1, 0, 0, 0, 0, '', 0, ''),
(55, '甜蜜情人节，DIY巧克力表爱意！仅39元，即享原价106元【小丫烘焙坊】DIY巧克力18粒礼盒装。爱有时候可以不用说出来，但可以写出来，要表达什么就看你的手艺咯！', '巧克力', 8, 15, './public/attachment/201202/16/11/4f3c7ea394a90.jpg', '<p align="center"><strong>【福州】小丫烘焙坊-DIY巧克力</strong></p>\r\n<p><strong>【特别提示】</strong></p>\r\n<p><span style="color:#ff0000;"><strong>有 效 期：截止至2012年3月18日（过期无效）</strong></span></p>\r\n<p><strong>使用限制</strong>：每个ID限购10份；</p>\r\n<p><strong>营业时间</strong>：10：00—19:00；</p>\r\n<p><strong>商家地址</strong>：福州市台江区五一中路万都阿波罗10层1007（阿波罗大酒店后侧）；</p>\r\n<p><strong>预约电话</strong>：0591-28311183；（为保服务质量，请提前1天预约）</p>\r\n<p><strong>使用提示：</strong></p>\r\n<p>1.凭手机二维码至商家店内验证消费，节假日通用，一经验证，不予退款，请见谅；</p>\r\n<p align="left">2.请在有效期内验证，逾期无效；</p>\r\n<p align="left">3.团购不找零，不予店内其他优惠同享，商家承诺无隐性消费；</p>\r\n<p align="left">4.退款说明：有效期内退款额=（团购价-每份2元二维码信息费），有效期外退款额=（团购价-每份2元二维码信息费）*95%，请在提交退款申请时自动扣除，以便我们尽快的为您办理退款。</p>\r\n<p><strong>购买流程：</strong></p>\r\n<p><span style="color:#ff0000;">购买团购券&nbsp;&gt;&nbsp;提前1天致电预约，到店验证消费 &gt;&nbsp;开心享受服务</span></p>\r\n<p>客服电话：400-600-5515 </p>\r\n<p><strong>【活动详情】</strong></p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;【情人节特供】甜蜜情人节，DIY巧克力表爱意！仅39元，即享原价106元【小丫烘焙坊】DIY巧克力18粒礼盒装。爱有时候可以不用说出来，但可以写出来，要表达什么就看你的手艺咯！</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;黑白巧克力的经典融合，甜蜜爱情的美丽代表。</p>\r\n<p><img src="./public/attachment/201202/16/11/4f3c7ec24b7a6.jpg" alt="" border="0" /><br />\r\n</p>\r\n<p><img src="./public/attachment/201202/16/11/4f3c7ec9529e7.jpg" alt="" border="0" /><br />\r\n</p>', 1328644689, 1487879880, 0, 0, 0, 0, 200.0000, 55.0000, 15, 1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0.0000, 0, '', 19, 0, 1329335882, 0, 0, '', 0.0000, 1, 0, 0, 0.0000, './public/attachment/201202/16/11/4f3c7ea394a90.jpg', 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 1329335882, 1416550816, 'ux24039ux20811ux21147,ux20986ux26469,ux21487ux20197,ux28888ux28953,ux30418ux35013,ux25163ux33402,ux23567ux20011,ux29233ux24847,ux19981ux29992ux35828,ux21407ux20215,ux29980ux34588ux24773ux20154ux33410ux65292ux68ux73ux89ux24039ux20811ux21147ux34920ux29233ux24847ux65281ux20165ux51ux57ux20803ux65292ux21363ux20139ux21407ux20215ux49ux48ux54ux20803ux12304ux23567ux20011ux28888ux28953ux22346ux12305ux68ux73ux89ux24039ux20811ux21147ux49ux56ux31890ux31036ux30418ux35013ux12290ux29233ux26377ux26102ux20505ux21487ux20197ux19981ux29992ux35828ux20986ux26469ux65292ux20294ux21487ux20197ux20889ux20986ux26469ux65292ux35201ux34920ux36798ux20160ux20040ux23601ux30475ux20320ux30340ux25163ux33402ux21679ux65281', '巧克力,出来,可以,烘焙,盒装,手艺,小丫,爱意,不用说,原价,甜蜜情人节，DIY巧克力表爱意！仅39元，即享原价106元【小丫烘焙坊】DIY巧克力18粒礼盒装。爱有时候可以不用说出来，但可以写出来，要表达什么就看你的手艺咯！', 'ux39184ux39278ux32654ux39135,ux29980ux28857,ux38754ux21253', '餐饮美食,甜点,面包', '', '', 'ux20840ux22269,ux31119ux24030,ux20809ux22823ux38134ux34892,ux21271ux36335,ux38498ux20869,ux28023ux20851,ux49ux49ux48,ux20116ux19968,ux20116ux19968ux21271ux36335ux49ux49ux48ux21495ux21407ux28023ux20851ux22823ux38498ux20869ux65288ux29616ux20809ux22823ux38134ux34892ux21518ux65289,ux40723ux27004ux21306,ux20116ux19968ux24191ux22330,ux26187ux23433ux21306,ux20116ux19968ux26032ux26449', '全国,福州,光大银行,北路,院内,海关,110,五一,五一北路110号原海关大院内（现光大银行后）,鼓楼区,五一广场,晋安区,五一新村', '', '', '119.315682', '26.087528', 0, 0, 0, 0, 1, 0.0000, 1, 0, 0, 0, 0, '', 0, ''),
(56, '最有创意，最富心意的情人节礼物！仅23元，即享原价50元情人节DIY变色杯/马克杯，二选一。美丽的图案在升温后慢慢显现，那么神奇，那么浪漫，正如你们渐渐升温的爱情，永远美丽！福州市区包邮！', '创意茶杯', 10, 19, './public/attachment/201202/16/11/4f3c7f1d37dea.jpg', '<p align="center"><strong>【福州】DIY变色杯/</strong><strong>马克杯</strong></p>\r\n<p><strong>【特别提示】</strong></p>\r\n<p><span style="color:#ff0000;"><strong>有 效 期：2012年2月7日至2012年3月7日（下单后7个工作日内送达）</strong></span></p>\r\n<p><strong>使用限制</strong>：可购买多张优惠券；</p>\r\n<p><strong>咨询电话：</strong>13599397797；</p>\r\n<p><strong>注意事项：</strong></p>\r\n<p>1.本单福州市区内免费配送，下单后7个工作日内送达；</p>\r\n<p align="left">2.请在下单时填写清楚收货人姓名、联系电话及有效地址（请务必填写，以免延误收货）；</p>\r\n<p align="left">3.请您本人签收，商品送达请当场仔细检查验收，如商品配送有误、数量缺失、产品破损等问题，请当面及时向配送人员提出并拒收，商家会尽快为您安排调换，若已签收发现上述问题，概不提供退换；</p>\r\n<p align="left">4.因属配送类商品，下单后配送出去则概不退款。</p>\r\n<p align="left">5.请在下单后联系客服，将您需要印到杯子上的图案发至客服，我们将尽快联系商家为您处理。</p>\r\n<p><strong>购买流程：</strong></p>\r\n<p><span style="color:#ff0000;">购买团购券&nbsp;&gt;&nbsp;填写姓名、联系电话、地址及商品信息 &gt; 将图片发至客服&nbsp;&gt;&nbsp;等待送货上门</span></p>\r\n<p>客服电话：400-600-5515 </p>\r\n<p><strong>【活动详情】</strong></p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;【情人节特供】最有创意，最富心意的情人节礼物！仅23元，即享原价50元情人节DIY变色杯/马克杯，二选一。美丽的图案在升温后慢慢显现，那么神奇，那么浪漫，正如你们渐渐升温的爱情，永远美丽！福州市区包邮！</p>\r\n<p>【工艺材质】国家一级白瓷 </p>\r\n<p>【冲印】国家先进热转印技术 </p>\r\n<p>【规格】高9.5cm;直径8.2cm;容量325ml </p>\r\n<p>【可印区域】8cm*19cm </p>\r\n<p>【制作周期】（不含配送时间）5-7天 <br />\r\n</p>\r\n<p><br />\r\n</p>\r\n<p><img src="./public/attachment/201202/16/11/4f3c7f374b12d.jpg" alt="" border="0" /><br />\r\n</p>', 1328039994, 1486065540, 0, 0, 0, 0, 120.0000, 20.0000, 15, 1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0.0000, 0, '', 20, 0, 1329336008, 0, 0, '', 0.0000, 1, 0, 0, 0.0000, './public/attachment/201202/16/11/4f3c7f1d37dea.jpg', 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 1329336008, 1416550809, 'ux39532ux20811ux26479,ux21319ux28201,ux24773ux20154ux33410,ux37027ux20040,ux32654ux20029,ux31119ux24030,ux21019ux24847,ux21464ux33394,ux26174ux29616,ux24515ux24847,ux26368ux26377ux21019ux24847ux65292ux26368ux23500ux24515ux24847ux30340ux24773ux20154ux33410ux31036ux29289ux65281ux20165ux50ux51ux20803ux65292ux21363ux20139ux21407ux20215ux53ux48ux20803ux24773ux20154ux33410ux68ux73ux89ux21464ux33394ux26479ux47ux39532ux20811ux26479ux65292ux20108ux36873ux19968ux12290ux32654ux20029ux30340ux22270ux26696ux22312ux21319ux28201ux21518ux24930ux24930ux26174ux29616ux65292ux37027ux20040ux31070ux22855ux65292ux37027ux20040ux28010ux28459ux65292ux27491ux22914ux20320ux20204ux28176ux28176ux21319ux28201ux30340ux29233ux24773ux65292ux27704ux36828ux32654ux20029ux65281ux31119ux24030ux24066ux21306ux21253ux37038ux65281', '马克杯,升温,情人节,那么,美丽,福州,创意,变色,显现,心意,最有创意，最富心意的情人节礼物！仅23元，即享原价50元情人节DIY变色杯/马克杯，二选一。美丽的图案在升温后慢慢显现，那么神奇，那么浪漫，正如你们渐渐升温的爱情，永远美丽！福州市区包邮！', 'ux29983ux27963ux26381ux21153', '生活服务', '', '', 'ux20840ux22269,ux31119ux24030,ux33945ux21476ux33829,ux31119ux24030ux24066,ux21271ux36335,ux31449ux29260,ux21518ux38498,ux23486ux39302,ux20116ux19968,ux31119ux24030ux24066ux20116ux19968ux21271ux36335ux54ux55ux21495ux65288ux33945ux21476ux33829ux31449ux29260ux21518ux65289ux24310ux31119ux23486ux39302ux21518ux38498,ux40723ux27004ux21306,ux20116ux19968ux24191ux22330', '全国,福州,蒙古营,福州市,北路,站牌,后院,宾馆,五一,福州市五一北路67号（蒙古营站牌后）延福宾馆后院,鼓楼区,五一广场', '', '', '119.31585', '26.089641', 0, 0, 0, 0, 1, 0.0000, 1, 1, 1, 1, 0, '', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_attr`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_attr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `goods_type_attr_id` int(11) NOT NULL,
  `price` decimal(20,4) NOT NULL,
  `deal_id` int(11) NOT NULL,
  `is_checked` tinyint(1) NOT NULL,
  `add_balance_price` decimal(20,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_type_attr_id` (`goods_type_attr_id`),
  KEY `deal_id` (`deal_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=223 ;

--
-- 转存表中的数据 `fanwe_deal_attr`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_cart`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `deal_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `attr` varchar(255) NOT NULL,
  `unit_price` decimal(20,4) NOT NULL,
  `number` int(11) NOT NULL,
  `total_price` decimal(20,4) NOT NULL,
  `verify_code` varchar(255) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `return_money` decimal(20,4) NOT NULL,
  `return_total_money` decimal(20,4) NOT NULL,
  `return_score` int(11) NOT NULL,
  `return_total_score` int(11) NOT NULL,
  `buy_type` tinyint(1) NOT NULL,
  `sub_name` varchar(255) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `attr_str` text NOT NULL,
  `add_balance_price` decimal(20,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`),
  KEY `user_id` (`user_id`),
  KEY `deal_id` (`deal_id`),
  KEY `update_time` (`update_time`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=333 ;

--
-- 转存表中的数据 `fanwe_deal_cart`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_cate`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `brief` text NOT NULL,
  `pid` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `sort` int(11) NOT NULL,
  `uname` varchar(255) NOT NULL,
  `recommend` tinyint(1) NOT NULL,
  `icon` varchar(255) DEFAULT '' COMMENT '分类icon',
  `rec_youhui` tinyint(1) NOT NULL,
  `rec_daijin` tinyint(1) NOT NULL,
  `icon_img` varchar(255) NOT NULL COMMENT '图片标记',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `sort` (`sort`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- 转存表中的数据 `fanwe_deal_cate`
--

INSERT INTO `fanwe_deal_cate` (`id`, `name`, `brief`, `pid`, `is_delete`, `is_effect`, `sort`, `uname`, `recommend`, `icon`, `rec_youhui`, `rec_daijin`, `icon_img`) VALUES
(8, '餐饮美食', '', 0, 0, 1, 1, '', 1, '', 1, 1, ''),
(9, '休闲娱乐', '', 0, 0, 1, 2, '', 1, '', 1, 1, ''),
(10, '生活服务', '', 0, 0, 1, 3, '', 1, '', 1, 1, ''),
(11, '酒店旅游', '', 0, 0, 1, 4, '', 1, '', 1, 1, ''),
(12, '网购精品', '', 0, 0, 1, 5, '', 1, '', 1, 1, ''),
(13, '爱车学车', '', 0, 0, 1, 6, '', 1, '', 1, 1, ''),
(14, '都市丽人', '', 0, 0, 1, 7, '', 1, '', 1, 1, ''),
(15, '我要结婚', '', 0, 0, 1, 8, '', 1, '', 1, 1, ''),
(16, '医疗健康', '', 0, 0, 1, 9, '', 1, '', 1, 1, ''),
(17, '母婴亲子', '', 0, 0, 1, 10, '', 1, '', 1, 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_cate_type`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_cate_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_recommend` tinyint(1) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- 转存表中的数据 `fanwe_deal_cate_type`
--

INSERT INTO `fanwe_deal_cate_type` (`id`, `name`, `is_recommend`, `sort`) VALUES
(1, '咖啡', 1, 0),
(2, '闽菜', 1, 0),
(3, '东北菜', 1, 0),
(4, '川菜', 1, 0),
(5, 'KTV', 1, 0),
(6, '自助游', 1, 0),
(7, '周边游', 1, 0),
(8, '国内游', 1, 0),
(9, '海外游', 1, 0),
(10, '洗车', 1, 0),
(11, '汽车保养', 1, 0),
(12, '驾校', 0, 0),
(13, '4S店', 1, 0),
(14, '音响', 1, 0),
(15, '车载导航', 1, 0),
(16, '真皮座椅', 1, 0),
(17, '打蜡', 1, 0),
(18, '男科', 0, 0),
(19, '妇科', 0, 0),
(20, '儿科', 0, 0),
(21, '口腔科', 1, 0),
(22, '眼科', 1, 0),
(23, '体检中心', 1, 0),
(24, '心理诊所', 1, 0),
(25, '疗养院', 1, 0),
(26, '日本料理', 1, 0),
(27, '本帮菜', 1, 0),
(28, '甜点', 1, 0),
(29, '面包', 1, 0),
(30, '烧烤', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_cate_type_deal_link`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_cate_type_deal_link` (
  `deal_id` int(11) NOT NULL,
  `deal_cate_type_id` int(11) NOT NULL,
  PRIMARY KEY (`deal_id`,`deal_cate_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_deal_cate_type_deal_link`
--

INSERT INTO `fanwe_deal_cate_type_deal_link` (`deal_id`, `deal_cate_type_id`) VALUES
(37, 2),
(37, 3),
(38, 2),
(39, 2),
(39, 4),
(49, 1),
(50, 4),
(51, 4),
(53, 4),
(55, 28),
(55, 29);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_cate_type_link`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_cate_type_link` (
  `cate_id` int(11) NOT NULL,
  `deal_cate_type_id` int(11) NOT NULL,
  PRIMARY KEY (`cate_id`,`deal_cate_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_deal_cate_type_link`
--

INSERT INTO `fanwe_deal_cate_type_link` (`cate_id`, `deal_cate_type_id`) VALUES
(8, 1),
(8, 2),
(8, 3),
(8, 4),
(8, 26),
(8, 27),
(8, 28),
(8, 29),
(8, 30),
(9, 1),
(9, 5),
(9, 6),
(10, 5),
(11, 6),
(11, 7),
(11, 8),
(11, 9),
(13, 10),
(13, 11),
(13, 12),
(13, 13),
(13, 14),
(13, 15),
(13, 16),
(13, 17),
(16, 18),
(16, 19),
(16, 20),
(16, 21),
(16, 22),
(16, 23),
(16, 24),
(16, 25);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_cate_type_location_link`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_cate_type_location_link` (
  `location_id` int(11) NOT NULL,
  `deal_cate_type_id` int(11) NOT NULL,
  PRIMARY KEY (`location_id`,`deal_cate_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_deal_cate_type_location_link`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_cate_type_youhui_link`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_cate_type_youhui_link` (
  `deal_cate_type_id` int(11) NOT NULL,
  `youhui_id` int(11) NOT NULL,
  PRIMARY KEY (`deal_cate_type_id`,`youhui_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_deal_cate_type_youhui_link`
--

INSERT INTO `fanwe_deal_cate_type_youhui_link` (`deal_cate_type_id`, `youhui_id`) VALUES
(2, 10),
(2, 11),
(2, 14),
(2, 15),
(3, 10),
(3, 11),
(3, 14),
(3, 15),
(4, 11),
(4, 14),
(5, 20),
(26, 19),
(28, 18),
(29, 18);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_city`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `uname` varchar(255) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `pid` int(11) NOT NULL,
  `is_open` tinyint(1) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `description` text NOT NULL,
  `notice` text NOT NULL,
  `seo_title` text NOT NULL,
  `seo_keyword` text NOT NULL,
  `seo_description` text NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `sort` (`sort`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- 转存表中的数据 `fanwe_deal_city`
--

INSERT INTO `fanwe_deal_city` (`id`, `name`, `uname`, `is_effect`, `is_delete`, `pid`, `is_open`, `is_default`, `description`, `notice`, `seo_title`, `seo_keyword`, `seo_description`, `sort`) VALUES
(1, '全国', '', 1, 0, 0, 1, 0, '每天提供一单精品消费，为您精选餐厅、酒吧、KTV、SPA、美发店、瑜伽馆等特色商家，只要凑够最低团购人数就能享受无敌折扣。', '这是一则公告信息', '', '', '', 0),
(15, '福州', 'fuzhou', 1, 0, 1, 1, 1, '', '', '', '', '', 1),
(16, '北京', 'beijing', 1, 0, 1, 1, 0, '', '', '', '', '', 2),
(17, '上海', 'shanghai', 1, 0, 1, 1, 0, '', '', '', '', '', 3);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_collect`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `deal_id` (`deal_id`),
  KEY `user_id` (`user_id`),
  KEY `create_time` (`create_time`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `fanwe_deal_collect`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_coupon`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `begin_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `is_valid` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `deal_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_deal_id` int(11) NOT NULL,
  `is_new` tinyint(1) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `confirm_account` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `confirm_time` int(11) NOT NULL,
  `mail_count` int(11) NOT NULL,
  `sms_count` int(11) NOT NULL,
  `is_balance` tinyint(1) NOT NULL COMMENT '0:未结算 1:待结算 2:已结算',
  `balance_memo` text NOT NULL,
  `balance_price` decimal(20,4) NOT NULL COMMENT '结算单价',
  `balance_time` int(11) NOT NULL,
  `refund_status` tinyint(1) NOT NULL,
  `expire_refund` tinyint(1) NOT NULL,
  `any_refund` tinyint(1) NOT NULL,
  `coupon_price` decimal(20,4) NOT NULL,
  `coupon_score` int(11) NOT NULL,
  `deal_type` tinyint(1) NOT NULL,
  `coupon_money` decimal(20,4) NOT NULL,
  `add_balance_price` decimal(20,4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unk_sn` (`sn`) USING BTREE,
  UNIQUE KEY `unk_pw` (`password`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- 转存表中的数据 `fanwe_deal_coupon`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_delivery`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_delivery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) NOT NULL,
  `delivery_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `fanwe_deal_delivery`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_event`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `event_begin_time` int(11) NOT NULL,
  `event_end_time` int(11) NOT NULL,
  `submit_begin_time` int(11) NOT NULL,
  `submit_end_time` int(11) NOT NULL,
  `sort` int(11) DEFAULT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `content` text NOT NULL,
  `brief` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='商品活动' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `fanwe_deal_event`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_filter`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_filter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filter` text NOT NULL,
  `deal_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=120 ;

--
-- 转存表中的数据 `fanwe_deal_filter`
--

INSERT INTO `fanwe_deal_filter` (`id`, `filter`, `deal_id`, `filter_group_id`) VALUES
(119, '红色', 40, 9),
(118, '大码,中码,均码', 40, 8),
(117, '纯绵', 40, 7),
(116, '红色,黑色', 41, 9),
(115, '小码,中码,大码,均码', 41, 8),
(114, '常规毛线', 41, 7),
(113, '洋紫,玫红,北极蓝', 42, 9),
(112, '小码,中码,大码,均码', 42, 8),
(111, '羽绒', 42, 7),
(110, '黑色,驼色,红色', 43, 9),
(109, '均码,中码', 43, 8),
(108, '尼绒', 43, 7),
(107, '翡翠绿', 44, 9),
(106, '中码,均码', 44, 8),
(105, '', 44, 7),
(104, '黑白格,红黑格', 45, 9),
(103, '均码,中码', 45, 8),
(102, '', 45, 7),
(101, '黑色,紫色', 46, 9),
(100, '均码', 46, 8),
(99, '纯绵', 46, 7),
(98, '黑色', 47, 9),
(97, '超大码,大码,中码', 47, 8),
(96, '', 47, 7),
(95, '', 48, 9),
(94, '', 48, 8),
(93, '', 48, 7);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_gallery`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(255) NOT NULL,
  `deal_id` int(11) NOT NULL,
  `sort` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=605 ;

--
-- 转存表中的数据 `fanwe_deal_gallery`
--

INSERT INTO `fanwe_deal_gallery` (`id`, `img`, `deal_id`, `sort`) VALUES
(601, './public/attachment/201201/4f0110c586c48.jpg', 37, 0),
(600, './public/attachment/201201/4f0113ce66cd4.jpg', 38, 1),
(599, './public/attachment/201201/4f0113ce66cd4.jpg', 38, 0),
(598, './public/attachment/201201/4f0116296dc27.jpg', 39, 0),
(565, './public/attachment/201201/4f012726399d4.jpg', 40, 2),
(564, './public/attachment/201201/4f0127212b558.jpg', 40, 1),
(563, './public/attachment/201201/4f01271aa4f99.jpg', 40, 0),
(562, './public/attachment/201201/4f012a9be8b27.jpg', 41, 4),
(561, './public/attachment/201201/4f012a9641198.jpg', 41, 3),
(560, './public/attachment/201201/4f012a9145b41.jpg', 41, 2),
(559, './public/attachment/201201/4f012a8be1476.jpg', 41, 1),
(558, './public/attachment/201201/4f012a86b3fbe.jpg', 41, 0),
(557, './public/attachment/201201/4f012bcf19f01.jpg', 42, 4),
(556, './public/attachment/201201/4f012bc989600.jpg', 42, 3),
(555, './public/attachment/201201/4f012bc43d042.jpg', 42, 2),
(554, './public/attachment/201201/4f012bbf2ee36.jpg', 42, 1),
(553, './public/attachment/201201/4f012bba3d02c.jpg', 42, 0),
(552, './public/attachment/201201/4f012d022ec3a.jpg', 43, 4),
(551, './public/attachment/201201/4f012cfbe3bdc.jpg', 43, 3),
(550, './public/attachment/201201/4f012cf6de268.jpg', 43, 2),
(549, './public/attachment/201201/4f012cee51383.jpg', 43, 1),
(548, './public/attachment/201201/4f012ce95cf44.jpg', 43, 0),
(547, './public/attachment/201201/4f012e0ae8d5f.jpg', 44, 4),
(546, './public/attachment/201201/4f012e058cf5c.jpg', 44, 3),
(545, './public/attachment/201201/4f012e0093a97.jpg', 44, 2),
(544, './public/attachment/201201/4f012dfb0983c.jpg', 44, 1),
(543, './public/attachment/201201/4f012df65d0fe.jpg', 44, 0),
(542, './public/images/201201/big/4f012ee711c87.jpg', 45, 2),
(541, './public/images/201201/big/4f012ed9d9063.jpg', 45, 1),
(540, './public/images/201201/big/4f012ecddf917.jpg', 45, 0),
(539, './public/attachment/201201/4f01302514fee.jpg', 46, 3),
(538, './public/attachment/201201/4f01301fcdcc4.jpg', 46, 2),
(537, './public/attachment/201201/4f01301a53d4d.jpg', 46, 1),
(536, './public/attachment/201201/4f01301613aa8.jpg', 46, 0),
(535, './public/attachment/201201/4f0132b2236f0.jpg', 47, 4),
(534, './public/attachment/201201/4f0132acd6f67.jpg', 47, 3),
(533, './public/attachment/201201/4f0132a7ee87e.jpg', 47, 2),
(532, './public/attachment/201201/4f0132a246478.jpg', 47, 1),
(531, './public/attachment/201201/4f01329d60fa2.jpg', 47, 0),
(530, './public/attachment/201201/4f0133bbca79e.jpg', 48, 0),
(604, './public/attachment/201201/4f0147c5a1983.jpg', 49, 0),
(573, './public/attachment/201201/4f014896c9be2.jpg', 50, 0),
(603, './public/attachment/201201/4f01497b1bb54.jpg', 51, 0),
(602, './public/attachment/201201/4f014a031f8f9.jpg', 52, 0),
(570, './public/attachment/201201/4f014a935d99a.jpg', 53, 0),
(597, './public/attachment/201202/16/11/4f3c7d681ed70.jpg', 54, 0),
(596, './public/attachment/201202/16/11/4f3c7ea394a90.jpg', 55, 0),
(595, './public/attachment/201202/16/11/4f3c7f1d37dea.jpg', 56, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_location_link`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_location_link` (
  `deal_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`deal_id`,`location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_deal_location_link`
--

INSERT INTO `fanwe_deal_location_link` (`deal_id`, `location_id`) VALUES
(37, 14),
(38, 15),
(39, 16),
(49, 16),
(50, 16),
(51, 16),
(52, 20),
(53, 16),
(54, 18),
(55, 14),
(56, 18);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_msg_list`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_msg_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dest` varchar(255) NOT NULL,
  `send_type` tinyint(1) NOT NULL,
  `content` text NOT NULL,
  `send_time` int(11) NOT NULL,
  `is_send` tinyint(1) NOT NULL,
  `create_time` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `result` text NOT NULL,
  `is_success` tinyint(1) NOT NULL,
  `is_html` tinyint(1) NOT NULL,
  `title` text NOT NULL,
  `is_youhui` tinyint(1) NOT NULL,
  `youhui_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=105 ;

--
-- 转存表中的数据 `fanwe_deal_msg_list`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_order`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(255) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `pay_status` tinyint(1) NOT NULL,
  `total_price` decimal(20,4) NOT NULL,
  `pay_amount` decimal(20,4) NOT NULL,
  `delivery_status` tinyint(1) NOT NULL,
  `order_status` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `return_total_score` int(11) NOT NULL,
  `refund_amount` decimal(20,4) NOT NULL,
  `admin_memo` text NOT NULL,
  `memo` text NOT NULL,
  `region_lv1` int(11) NOT NULL,
  `region_lv2` int(11) NOT NULL,
  `region_lv3` int(11) NOT NULL,
  `region_lv4` int(11) NOT NULL,
  `address` text NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `consignee` varchar(255) NOT NULL,
  `deal_total_price` decimal(20,4) NOT NULL,
  `discount_price` decimal(20,4) NOT NULL,
  `delivery_fee` decimal(20,4) NOT NULL,
  `ecv_money` decimal(20,4) NOT NULL,
  `account_money` decimal(20,4) NOT NULL,
  `delivery_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `payment_fee` decimal(20,4) NOT NULL,
  `return_total_money` decimal(20,4) NOT NULL,
  `extra_status` tinyint(1) NOT NULL,
  `after_sale` tinyint(1) NOT NULL,
  `refund_money` decimal(20,4) NOT NULL,
  `bank_id` varchar(255) NOT NULL,
  `referer` varchar(255) NOT NULL,
  `deal_ids` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `refund_status` tinyint(1) NOT NULL COMMENT '0:不需退款 1:有退款申请 2:已处理',
  `retake_status` tinyint(1) NOT NULL,
  `promote_description` text NOT NULL,
  `is_auto_order` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1:门店自主下单标识；1:自主下单;0:非自主下单',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_sn` (`order_sn`),
  FULLTEXT KEY `deal_ids` (`deal_ids`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- 转存表中的数据 `fanwe_deal_order`
--

INSERT INTO `fanwe_deal_order` (`id`, `order_sn`, `type`, `user_id`, `create_time`, `update_time`, `pay_status`, `total_price`, `pay_amount`, `delivery_status`, `order_status`, `is_delete`, `return_total_score`, `refund_amount`, `admin_memo`, `memo`, `region_lv1`, `region_lv2`, `region_lv3`, `region_lv4`, `address`, `mobile`, `zip`, `consignee`, `deal_total_price`, `discount_price`, `delivery_fee`, `ecv_money`, `account_money`, `delivery_id`, `payment_id`, `payment_fee`, `return_total_money`, `extra_status`, `after_sale`, `refund_money`, `bank_id`, `referer`, `deal_ids`, `user_name`, `refund_status`, `retake_status`, `promote_description`, `is_auto_order`) VALUES
(24, '2012010202245833', 0, 44, 1325456698, 1325456714, 2, 525.0000, 525.0000, 0, 0, 0, 300, 0.0000, '', '', 1, 4, 53, 519, '福州博美诗邦', '99999999', '350000', '方维', 525.0000, 0.0000, 0.0000, 0.0000, 0.0000, 7, 16, 0.0000, 0.0000, 0, 0, 0.0000, 'ICBCB2C', '', '47', 'fanwe', 0, 0, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_order_item`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `unit_price` decimal(20,4) NOT NULL,
  `total_price` decimal(20,4) NOT NULL,
  `delivery_status` tinyint(1) NOT NULL,
  `name` text NOT NULL,
  `return_score` int(11) NOT NULL,
  `return_total_score` int(11) NOT NULL,
  `attr` varchar(255) NOT NULL,
  `verify_code` varchar(255) NOT NULL,
  `order_id` int(11) NOT NULL,
  `return_money` decimal(20,4) NOT NULL,
  `return_total_money` decimal(20,4) NOT NULL,
  `buy_type` tinyint(1) NOT NULL,
  `sub_name` varchar(255) NOT NULL,
  `attr_str` text NOT NULL,
  `is_balance` tinyint(1) NOT NULL COMMENT '0:未结算 1:待结算 2:已结算 3:部份结算',
  `balance_unit_price` decimal(20,4) NOT NULL,
  `balance_memo` text NOT NULL,
  `balance_total_price` decimal(20,4) NOT NULL,
  `balance_time` int(11) NOT NULL,
  `add_balance_price` decimal(20,4) NOT NULL,
  `add_balance_price_total` decimal(20,4) NOT NULL,
  `refund_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=79 ;

--
-- 转存表中的数据 `fanwe_deal_order_item`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_order_log`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_order_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_info` text NOT NULL,
  `log_time` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=69 ;

--
-- 转存表中的数据 `fanwe_deal_order_log`
--

INSERT INTO `fanwe_deal_order_log` (`id`, `log_info`, `log_time`, `order_id`) VALUES
(68, '2012010202245833创建收款单2012010202251477收款成功', 1325456714, 24);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_payment`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `fanwe_deal_payment`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_delivery`
--

CREATE TABLE IF NOT EXISTS `fanwe_delivery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `first_fee` decimal(20,4) NOT NULL,
  `allow_default` tinyint(1) NOT NULL,
  `sort` int(11) NOT NULL,
  `first_weight` decimal(20,4) NOT NULL,
  `continue_weight` decimal(20,4) NOT NULL,
  `continue_fee` decimal(20,4) NOT NULL,
  `weight_id` int(11) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `fanwe_delivery`
--

INSERT INTO `fanwe_delivery` (`id`, `name`, `description`, `first_fee`, `allow_default`, `sort`, `first_weight`, `continue_weight`, `continue_fee`, `weight_id`, `is_effect`) VALUES
(7, '顺风快递', '顺风快递,福州地区免运费', 10.0000, 1, 1, 0.0000, 0.0000, 0.0000, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_delivery_fee`
--

CREATE TABLE IF NOT EXISTS `fanwe_delivery_fee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_id` int(11) NOT NULL,
  `region_ids` text NOT NULL,
  `first_fee` decimal(20,4) NOT NULL,
  `first_weight` decimal(20,4) NOT NULL,
  `continue_fee` decimal(20,4) NOT NULL,
  `continue_weight` decimal(20,4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- 转存表中的数据 `fanwe_delivery_fee`
--

INSERT INTO `fanwe_delivery_fee` (`id`, `delivery_id`, `region_ids`, `first_fee`, `first_weight`, `continue_fee`, `continue_weight`) VALUES
(30, 7, '518,519,520,521,522,523,524,525,526,527,528,529,530,518,519,520,521,522,523,524,525,526,527,528,529,530,53', 0.0000, 0.0000, 0.0000, 0.0000);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_delivery_notice`
--

CREATE TABLE IF NOT EXISTS `fanwe_delivery_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_sn` varchar(255) NOT NULL,
  `delivery_time` int(11) NOT NULL,
  `is_arrival` tinyint(1) NOT NULL,
  `arrival_time` int(11) NOT NULL,
  `order_item_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `memo` text NOT NULL,
  `express_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `fanwe_delivery_notice`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_delivery_region`
--

CREATE TABLE IF NOT EXISTS `fanwe_delivery_region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '地区名称',
  `region_level` tinyint(4) NOT NULL COMMENT '1:国 2:省 3:市(县) 4:区(镇)',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3402 ;

--
-- 转存表中的数据 `fanwe_delivery_region`
--

INSERT INTO `fanwe_delivery_region` (`id`, `pid`, `name`, `region_level`) VALUES
(2, 1, '北京', 2),
(3, 1, '安徽', 2),
(4, 1, '福建', 2),
(5, 1, '甘肃', 2),
(6, 1, '广东', 2),
(7, 1, '广西', 2),
(8, 1, '贵州', 2),
(9, 1, '海南', 2),
(10, 1, '河北', 2),
(11, 1, '河南', 2),
(12, 1, '黑龙江', 2),
(13, 1, '湖北', 2),
(14, 1, '湖南', 2),
(15, 1, '吉林', 2),
(16, 1, '江苏', 2),
(17, 1, '江西', 2),
(18, 1, '辽宁', 2),
(19, 1, '内蒙古', 2),
(20, 1, '宁夏', 2),
(21, 1, '青海', 2),
(22, 1, '山东', 2),
(23, 1, '山西', 2),
(24, 1, '陕西', 2),
(25, 1, '上海', 2),
(26, 1, '四川', 2),
(27, 1, '天津', 2),
(28, 1, '西藏', 2),
(29, 1, '新疆', 2),
(30, 1, '云南', 2),
(31, 1, '浙江', 2),
(32, 1, '重庆', 2),
(33, 1, '香港', 2),
(34, 1, '澳门', 2),
(35, 1, '台湾', 2),
(36, 3, '安庆', 3),
(37, 3, '蚌埠', 3),
(38, 3, '巢湖', 3),
(39, 3, '池州', 3),
(40, 3, '滁州', 3),
(41, 3, '阜阳', 3),
(42, 3, '淮北', 3),
(43, 3, '淮南', 3),
(44, 3, '黄山', 3),
(45, 3, '六安', 3),
(46, 3, '马鞍山', 3),
(47, 3, '宿州', 3),
(48, 3, '铜陵', 3),
(49, 3, '芜湖', 3),
(50, 3, '宣城', 3),
(51, 3, '亳州', 3),
(52, 2, '北京', 3),
(53, 4, '福州', 3),
(54, 4, '龙岩', 3),
(55, 4, '南平', 3),
(56, 4, '宁德', 3),
(57, 4, '莆田', 3),
(58, 4, '泉州', 3),
(59, 4, '三明', 3),
(60, 4, '厦门', 3),
(61, 4, '漳州', 3),
(62, 5, '兰州', 3),
(63, 5, '白银', 3),
(64, 5, '定西', 3),
(65, 5, '甘南', 3),
(66, 5, '嘉峪关', 3),
(67, 5, '金昌', 3),
(68, 5, '酒泉', 3),
(69, 5, '临夏', 3),
(70, 5, '陇南', 3),
(71, 5, '平凉', 3),
(72, 5, '庆阳', 3),
(73, 5, '天水', 3),
(74, 5, '武威', 3),
(75, 5, '张掖', 3),
(76, 6, '广州', 3),
(77, 6, '深圳', 3),
(78, 6, '潮州', 3),
(79, 6, '东莞', 3),
(80, 6, '佛山', 3),
(81, 6, '河源', 3),
(82, 6, '惠州', 3),
(83, 6, '江门', 3),
(84, 6, '揭阳', 3),
(85, 6, '茂名', 3),
(86, 6, '梅州', 3),
(87, 6, '清远', 3),
(88, 6, '汕头', 3),
(89, 6, '汕尾', 3),
(90, 6, '韶关', 3),
(91, 6, '阳江', 3),
(92, 6, '云浮', 3),
(93, 6, '湛江', 3),
(94, 6, '肇庆', 3),
(95, 6, '中山', 3),
(96, 6, '珠海', 3),
(97, 7, '南宁', 3),
(98, 7, '桂林', 3),
(99, 7, '百色', 3),
(100, 7, '北海', 3),
(101, 7, '崇左', 3),
(102, 7, '防城港', 3),
(103, 7, '贵港', 3),
(104, 7, '河池', 3),
(105, 7, '贺州', 3),
(106, 7, '来宾', 3),
(107, 7, '柳州', 3),
(108, 7, '钦州', 3),
(109, 7, '梧州', 3),
(110, 7, '玉林', 3),
(111, 8, '贵阳', 3),
(112, 8, '安顺', 3),
(113, 8, '毕节', 3),
(114, 8, '六盘水', 3),
(115, 8, '黔东南', 3),
(116, 8, '黔南', 3),
(117, 8, '黔西南', 3),
(118, 8, '铜仁', 3),
(119, 8, '遵义', 3),
(120, 9, '海口', 3),
(121, 9, '三亚', 3),
(122, 9, '白沙', 3),
(123, 9, '保亭', 3),
(124, 9, '昌江', 3),
(125, 9, '澄迈县', 3),
(126, 9, '定安县', 3),
(127, 9, '东方', 3),
(128, 9, '乐东', 3),
(129, 9, '临高县', 3),
(130, 9, '陵水', 3),
(131, 9, '琼海', 3),
(132, 9, '琼中', 3),
(133, 9, '屯昌县', 3),
(134, 9, '万宁', 3),
(135, 9, '文昌', 3),
(136, 9, '五指山', 3),
(137, 9, '儋州', 3),
(138, 10, '石家庄', 3),
(139, 10, '保定', 3),
(140, 10, '沧州', 3),
(141, 10, '承德', 3),
(142, 10, '邯郸', 3),
(143, 10, '衡水', 3),
(144, 10, '廊坊', 3),
(145, 10, '秦皇岛', 3),
(146, 10, '唐山', 3),
(147, 10, '邢台', 3),
(148, 10, '张家口', 3),
(149, 11, '郑州', 3),
(150, 11, '洛阳', 3),
(151, 11, '开封', 3),
(152, 11, '安阳', 3),
(153, 11, '鹤壁', 3),
(154, 11, '济源', 3),
(155, 11, '焦作', 3),
(156, 11, '南阳', 3),
(157, 11, '平顶山', 3),
(158, 11, '三门峡', 3),
(159, 11, '商丘', 3),
(160, 11, '新乡', 3),
(161, 11, '信阳', 3),
(162, 11, '许昌', 3),
(163, 11, '周口', 3),
(164, 11, '驻马店', 3),
(165, 11, '漯河', 3),
(166, 11, '濮阳', 3),
(167, 12, '哈尔滨', 3),
(168, 12, '大庆', 3),
(169, 12, '大兴安岭', 3),
(170, 12, '鹤岗', 3),
(171, 12, '黑河', 3),
(172, 12, '鸡西', 3),
(173, 12, '佳木斯', 3),
(174, 12, '牡丹江', 3),
(175, 12, '七台河', 3),
(176, 12, '齐齐哈尔', 3),
(177, 12, '双鸭山', 3),
(178, 12, '绥化', 3),
(179, 12, '伊春', 3),
(180, 13, '武汉', 3),
(181, 13, '仙桃', 3),
(182, 13, '鄂州', 3),
(183, 13, '黄冈', 3),
(184, 13, '黄石', 3),
(185, 13, '荆门', 3),
(186, 13, '荆州', 3),
(187, 13, '潜江', 3),
(188, 13, '神农架林区', 3),
(189, 13, '十堰', 3),
(190, 13, '随州', 3),
(191, 13, '天门', 3),
(192, 13, '咸宁', 3),
(193, 13, '襄樊', 3),
(194, 13, '孝感', 3),
(195, 13, '宜昌', 3),
(196, 13, '恩施', 3),
(197, 14, '长沙', 3),
(198, 14, '张家界', 3),
(199, 14, '常德', 3),
(200, 14, '郴州', 3),
(201, 14, '衡阳', 3),
(202, 14, '怀化', 3),
(203, 14, '娄底', 3),
(204, 14, '邵阳', 3),
(205, 14, '湘潭', 3),
(206, 14, '湘西', 3),
(207, 14, '益阳', 3),
(208, 14, '永州', 3),
(209, 14, '岳阳', 3),
(210, 14, '株洲', 3),
(211, 15, '长春', 3),
(212, 15, '吉林', 3),
(213, 15, '白城', 3),
(214, 15, '白山', 3),
(215, 15, '辽源', 3),
(216, 15, '四平', 3),
(217, 15, '松原', 3),
(218, 15, '通化', 3),
(219, 15, '延边', 3),
(220, 16, '南京', 3),
(221, 16, '苏州', 3),
(222, 16, '无锡', 3),
(223, 16, '常州', 3),
(224, 16, '淮安', 3),
(225, 16, '连云港', 3),
(226, 16, '南通', 3),
(227, 16, '宿迁', 3),
(228, 16, '泰州', 3),
(229, 16, '徐州', 3),
(230, 16, '盐城', 3),
(231, 16, '扬州', 3),
(232, 16, '镇江', 3),
(233, 17, '南昌', 3),
(234, 17, '抚州', 3),
(235, 17, '赣州', 3),
(236, 17, '吉安', 3),
(237, 17, '景德镇', 3),
(238, 17, '九江', 3),
(239, 17, '萍乡', 3),
(240, 17, '上饶', 3),
(241, 17, '新余', 3),
(242, 17, '宜春', 3),
(243, 17, '鹰潭', 3),
(244, 18, '沈阳', 3),
(245, 18, '大连', 3),
(246, 18, '鞍山', 3),
(247, 18, '本溪', 3),
(248, 18, '朝阳', 3),
(249, 18, '丹东', 3),
(250, 18, '抚顺', 3),
(251, 18, '阜新', 3),
(252, 18, '葫芦岛', 3),
(253, 18, '锦州', 3),
(254, 18, '辽阳', 3),
(255, 18, '盘锦', 3),
(256, 18, '铁岭', 3),
(257, 18, '营口', 3),
(258, 19, '呼和浩特', 3),
(259, 19, '阿拉善盟', 3),
(260, 19, '巴彦淖尔盟', 3),
(261, 19, '包头', 3),
(262, 19, '赤峰', 3),
(263, 19, '鄂尔多斯', 3),
(264, 19, '呼伦贝尔', 3),
(265, 19, '通辽', 3),
(266, 19, '乌海', 3),
(267, 19, '乌兰察布市', 3),
(268, 19, '锡林郭勒盟', 3),
(269, 19, '兴安盟', 3),
(270, 20, '银川', 3),
(271, 20, '固原', 3),
(272, 20, '石嘴山', 3),
(273, 20, '吴忠', 3),
(274, 20, '中卫', 3),
(275, 21, '西宁', 3),
(276, 21, '果洛', 3),
(277, 21, '海北', 3),
(278, 21, '海东', 3),
(279, 21, '海南', 3),
(280, 21, '海西', 3),
(281, 21, '黄南', 3),
(282, 21, '玉树', 3),
(283, 22, '济南', 3),
(284, 22, '青岛', 3),
(285, 22, '滨州', 3),
(286, 22, '德州', 3),
(287, 22, '东营', 3),
(288, 22, '菏泽', 3),
(289, 22, '济宁', 3),
(290, 22, '莱芜', 3),
(291, 22, '聊城', 3),
(292, 22, '临沂', 3),
(293, 22, '日照', 3),
(294, 22, '泰安', 3),
(295, 22, '威海', 3),
(296, 22, '潍坊', 3),
(297, 22, '烟台', 3),
(298, 22, '枣庄', 3),
(299, 22, '淄博', 3),
(300, 23, '太原', 3),
(301, 23, '长治', 3),
(302, 23, '大同', 3),
(303, 23, '晋城', 3),
(304, 23, '晋中', 3),
(305, 23, '临汾', 3),
(306, 23, '吕梁', 3),
(307, 23, '朔州', 3),
(308, 23, '忻州', 3),
(309, 23, '阳泉', 3),
(310, 23, '运城', 3),
(311, 24, '西安', 3),
(312, 24, '安康', 3),
(313, 24, '宝鸡', 3),
(314, 24, '汉中', 3),
(315, 24, '商洛', 3),
(316, 24, '铜川', 3),
(317, 24, '渭南', 3),
(318, 24, '咸阳', 3),
(319, 24, '延安', 3),
(320, 24, '榆林', 3),
(321, 25, '上海', 3),
(322, 26, '成都', 3),
(323, 26, '绵阳', 3),
(324, 26, '阿坝', 3),
(325, 26, '巴中', 3),
(326, 26, '达州', 3),
(327, 26, '德阳', 3),
(328, 26, '甘孜', 3),
(329, 26, '广安', 3),
(330, 26, '广元', 3),
(331, 26, '乐山', 3),
(332, 26, '凉山', 3),
(333, 26, '眉山', 3),
(334, 26, '南充', 3),
(335, 26, '内江', 3),
(336, 26, '攀枝花', 3),
(337, 26, '遂宁', 3),
(338, 26, '雅安', 3),
(339, 26, '宜宾', 3),
(340, 26, '资阳', 3),
(341, 26, '自贡', 3),
(342, 26, '泸州', 3),
(343, 27, '天津', 3),
(344, 28, '拉萨', 3),
(345, 28, '阿里', 3),
(346, 28, '昌都', 3),
(347, 28, '林芝', 3),
(348, 28, '那曲', 3),
(349, 28, '日喀则', 3),
(350, 28, '山南', 3),
(351, 29, '乌鲁木齐', 3),
(352, 29, '阿克苏', 3),
(353, 29, '阿拉尔', 3),
(354, 29, '巴音郭楞', 3),
(355, 29, '博尔塔拉', 3),
(356, 29, '昌吉', 3),
(357, 29, '哈密', 3),
(358, 29, '和田', 3),
(359, 29, '喀什', 3),
(360, 29, '克拉玛依', 3),
(361, 29, '克孜勒苏', 3),
(362, 29, '石河子', 3),
(363, 29, '图木舒克', 3),
(364, 29, '吐鲁番', 3),
(365, 29, '五家渠', 3),
(366, 29, '伊犁', 3),
(367, 30, '昆明', 3),
(368, 30, '怒江', 3),
(369, 30, '普洱', 3),
(370, 30, '丽江', 3),
(371, 30, '保山', 3),
(372, 30, '楚雄', 3),
(373, 30, '大理', 3),
(374, 30, '德宏', 3),
(375, 30, '迪庆', 3),
(376, 30, '红河', 3),
(377, 30, '临沧', 3),
(378, 30, '曲靖', 3),
(379, 30, '文山', 3),
(380, 30, '西双版纳', 3),
(381, 30, '玉溪', 3),
(382, 30, '昭通', 3),
(383, 31, '杭州', 3),
(384, 31, '湖州', 3),
(385, 31, '嘉兴', 3),
(386, 31, '金华', 3),
(387, 31, '丽水', 3),
(388, 31, '宁波', 3),
(389, 31, '绍兴', 3),
(390, 31, '台州', 3),
(391, 31, '温州', 3),
(392, 31, '舟山', 3),
(393, 31, '衢州', 3),
(394, 32, '重庆', 3),
(395, 33, '香港', 3),
(396, 34, '澳门', 3),
(397, 35, '台湾', 3),
(398, 36, '迎江区', 4),
(399, 36, '大观区', 4),
(400, 36, '宜秀区', 4),
(401, 36, '桐城市', 4),
(402, 36, '怀宁县', 4),
(403, 36, '枞阳县', 4),
(404, 36, '潜山县', 4),
(405, 36, '太湖县', 4),
(406, 36, '宿松县', 4),
(407, 36, '望江县', 4),
(408, 36, '岳西县', 4),
(409, 37, '中市区', 4),
(410, 37, '东市区', 4),
(411, 37, '西市区', 4),
(412, 37, '郊区', 4),
(413, 37, '怀远县', 4),
(414, 37, '五河县', 4),
(415, 37, '固镇县', 4),
(416, 38, '居巢区', 4),
(417, 38, '庐江县', 4),
(418, 38, '无为县', 4),
(419, 38, '含山县', 4),
(420, 38, '和县', 4),
(421, 39, '贵池区', 4),
(422, 39, '东至县', 4),
(423, 39, '石台县', 4),
(424, 39, '青阳县', 4),
(425, 40, '琅琊区', 4),
(426, 40, '南谯区', 4),
(427, 40, '天长市', 4),
(428, 40, '明光市', 4),
(429, 40, '来安县', 4),
(430, 40, '全椒县', 4),
(431, 40, '定远县', 4),
(432, 40, '凤阳县', 4),
(433, 41, '蚌山区', 4),
(434, 41, '龙子湖区', 4),
(435, 41, '禹会区', 4),
(436, 41, '淮上区', 4),
(437, 41, '颍州区', 4),
(438, 41, '颍东区', 4),
(439, 41, '颍泉区', 4),
(440, 41, '界首市', 4),
(441, 41, '临泉县', 4),
(442, 41, '太和县', 4),
(443, 41, '阜南县', 4),
(444, 41, '颖上县', 4),
(445, 42, '相山区', 4),
(446, 42, '杜集区', 4),
(447, 42, '烈山区', 4),
(448, 42, '濉溪县', 4),
(449, 43, '田家庵区', 4),
(450, 43, '大通区', 4),
(451, 43, '谢家集区', 4),
(452, 43, '八公山区', 4),
(453, 43, '潘集区', 4),
(454, 43, '凤台县', 4),
(455, 44, '屯溪区', 4),
(456, 44, '黄山区', 4),
(457, 44, '徽州区', 4),
(458, 44, '歙县', 4),
(459, 44, '休宁县', 4),
(460, 44, '黟县', 4),
(461, 44, '祁门县', 4),
(462, 45, '金安区', 4),
(463, 45, '裕安区', 4),
(464, 45, '寿县', 4),
(465, 45, '霍邱县', 4),
(466, 45, '舒城县', 4),
(467, 45, '金寨县', 4),
(468, 45, '霍山县', 4),
(469, 46, '雨山区', 4),
(470, 46, '花山区', 4),
(471, 46, '金家庄区', 4),
(472, 46, '当涂县', 4),
(473, 47, '埇桥区', 4),
(474, 47, '砀山县', 4),
(475, 47, '萧县', 4),
(476, 47, '灵璧县', 4),
(477, 47, '泗县', 4),
(478, 48, '铜官山区', 4),
(479, 48, '狮子山区', 4),
(480, 48, '郊区', 4),
(481, 48, '铜陵县', 4),
(482, 49, '镜湖区', 4),
(483, 49, '弋江区', 4),
(484, 49, '鸠江区', 4),
(485, 49, '三山区', 4),
(486, 49, '芜湖县', 4),
(487, 49, '繁昌县', 4),
(488, 49, '南陵县', 4),
(489, 50, '宣州区', 4),
(490, 50, '宁国市', 4),
(491, 50, '郎溪县', 4),
(492, 50, '广德县', 4),
(493, 50, '泾县', 4),
(494, 50, '绩溪县', 4),
(495, 50, '旌德县', 4),
(496, 51, '涡阳县', 4),
(497, 51, '蒙城县', 4),
(498, 51, '利辛县', 4),
(499, 51, '谯城区', 4),
(500, 52, '东城区', 4),
(501, 52, '西城区', 4),
(502, 52, '海淀区', 4),
(503, 52, '朝阳区', 4),
(504, 52, '崇文区', 4),
(505, 52, '宣武区', 4),
(506, 52, '丰台区', 4),
(507, 52, '石景山区', 4),
(508, 52, '房山区', 4),
(509, 52, '门头沟区', 4),
(510, 52, '通州区', 4),
(511, 52, '顺义区', 4),
(512, 52, '昌平区', 4),
(513, 52, '怀柔区', 4),
(514, 52, '平谷区', 4),
(515, 52, '大兴区', 4),
(516, 52, '密云县', 4),
(517, 52, '延庆县', 4),
(518, 53, '鼓楼区', 4),
(519, 53, '台江区', 4),
(520, 53, '仓山区', 4),
(521, 53, '马尾区', 4),
(522, 53, '晋安区', 4),
(523, 53, '福清市', 4),
(524, 53, '长乐市', 4),
(525, 53, '闽侯县', 4),
(526, 53, '连江县', 4),
(527, 53, '罗源县', 4),
(528, 53, '闽清县', 4),
(529, 53, '永泰县', 4),
(530, 53, '平潭县', 4),
(531, 54, '新罗区', 4),
(532, 54, '漳平市', 4),
(533, 54, '长汀县', 4),
(534, 54, '永定县', 4),
(535, 54, '上杭县', 4),
(536, 54, '武平县', 4),
(537, 54, '连城县', 4),
(538, 55, '延平区', 4),
(539, 55, '邵武市', 4),
(540, 55, '武夷山市', 4),
(541, 55, '建瓯市', 4),
(542, 55, '建阳市', 4),
(543, 55, '顺昌县', 4),
(544, 55, '浦城县', 4),
(545, 55, '光泽县', 4),
(546, 55, '松溪县', 4),
(547, 55, '政和县', 4),
(548, 56, '蕉城区', 4),
(549, 56, '福安市', 4),
(550, 56, '福鼎市', 4),
(551, 56, '霞浦县', 4),
(552, 56, '古田县', 4),
(553, 56, '屏南县', 4),
(554, 56, '寿宁县', 4),
(555, 56, '周宁县', 4),
(556, 56, '柘荣县', 4),
(557, 57, '城厢区', 4),
(558, 57, '涵江区', 4),
(559, 57, '荔城区', 4),
(560, 57, '秀屿区', 4),
(561, 57, '仙游县', 4),
(562, 58, '鲤城区', 4),
(563, 58, '丰泽区', 4),
(564, 58, '洛江区', 4),
(565, 58, '清濛开发区', 4),
(566, 58, '泉港区', 4),
(567, 58, '石狮市', 4),
(568, 58, '晋江市', 4),
(569, 58, '南安市', 4),
(570, 58, '惠安县', 4),
(571, 58, '安溪县', 4),
(572, 58, '永春县', 4),
(573, 58, '德化县', 4),
(574, 58, '金门县', 4),
(575, 59, '梅列区', 4),
(576, 59, '三元区', 4),
(577, 59, '永安市', 4),
(578, 59, '明溪县', 4),
(579, 59, '清流县', 4),
(580, 59, '宁化县', 4),
(581, 59, '大田县', 4),
(582, 59, '尤溪县', 4),
(583, 59, '沙县', 4),
(584, 59, '将乐县', 4),
(585, 59, '泰宁县', 4),
(586, 59, '建宁县', 4),
(587, 60, '思明区', 4),
(588, 60, '海沧区', 4),
(589, 60, '湖里区', 4),
(590, 60, '集美区', 4),
(591, 60, '同安区', 4),
(592, 60, '翔安区', 4),
(593, 61, '芗城区', 4),
(594, 61, '龙文区', 4),
(595, 61, '龙海市', 4),
(596, 61, '云霄县', 4),
(597, 61, '漳浦县', 4),
(598, 61, '诏安县', 4),
(599, 61, '长泰县', 4),
(600, 61, '东山县', 4),
(601, 61, '南靖县', 4),
(602, 61, '平和县', 4),
(603, 61, '华安县', 4),
(604, 62, '皋兰县', 4),
(605, 62, '城关区', 4),
(606, 62, '七里河区', 4),
(607, 62, '西固区', 4),
(608, 62, '安宁区', 4),
(609, 62, '红古区', 4),
(610, 62, '永登县', 4),
(611, 62, '榆中县', 4),
(612, 63, '白银区', 4),
(613, 63, '平川区', 4),
(614, 63, '会宁县', 4),
(615, 63, '景泰县', 4),
(616, 63, '靖远县', 4),
(617, 64, '临洮县', 4),
(618, 64, '陇西县', 4),
(619, 64, '通渭县', 4),
(620, 64, '渭源县', 4),
(621, 64, '漳县', 4),
(622, 64, '岷县', 4),
(623, 64, '安定区', 4),
(624, 64, '安定区', 4),
(625, 65, '合作市', 4),
(626, 65, '临潭县', 4),
(627, 65, '卓尼县', 4),
(628, 65, '舟曲县', 4),
(629, 65, '迭部县', 4),
(630, 65, '玛曲县', 4),
(631, 65, '碌曲县', 4),
(632, 65, '夏河县', 4),
(633, 66, '嘉峪关市', 4),
(634, 67, '金川区', 4),
(635, 67, '永昌县', 4),
(636, 68, '肃州区', 4),
(637, 68, '玉门市', 4),
(638, 68, '敦煌市', 4),
(639, 68, '金塔县', 4),
(640, 68, '瓜州县', 4),
(641, 68, '肃北', 4),
(642, 68, '阿克塞', 4),
(643, 69, '临夏市', 4),
(644, 69, '临夏县', 4),
(645, 69, '康乐县', 4),
(646, 69, '永靖县', 4),
(647, 69, '广河县', 4),
(648, 69, '和政县', 4),
(649, 69, '东乡族自治县', 4),
(650, 69, '积石山', 4),
(651, 70, '成县', 4),
(652, 70, '徽县', 4),
(653, 70, '康县', 4),
(654, 70, '礼县', 4),
(655, 70, '两当县', 4),
(656, 70, '文县', 4),
(657, 70, '西和县', 4),
(658, 70, '宕昌县', 4),
(659, 70, '武都区', 4),
(660, 71, '崇信县', 4),
(661, 71, '华亭县', 4),
(662, 71, '静宁县', 4),
(663, 71, '灵台县', 4),
(664, 71, '崆峒区', 4),
(665, 71, '庄浪县', 4),
(666, 71, '泾川县', 4),
(667, 72, '合水县', 4),
(668, 72, '华池县', 4),
(669, 72, '环县', 4),
(670, 72, '宁县', 4),
(671, 72, '庆城县', 4),
(672, 72, '西峰区', 4),
(673, 72, '镇原县', 4),
(674, 72, '正宁县', 4),
(675, 73, '甘谷县', 4),
(676, 73, '秦安县', 4),
(677, 73, '清水县', 4),
(678, 73, '秦州区', 4),
(679, 73, '麦积区', 4),
(680, 73, '武山县', 4),
(681, 73, '张家川', 4),
(682, 74, '古浪县', 4),
(683, 74, '民勤县', 4),
(684, 74, '天祝', 4),
(685, 74, '凉州区', 4),
(686, 75, '高台县', 4),
(687, 75, '临泽县', 4),
(688, 75, '民乐县', 4),
(689, 75, '山丹县', 4),
(690, 75, '肃南', 4),
(691, 75, '甘州区', 4),
(692, 76, '从化市', 4),
(693, 76, '天河区', 4),
(694, 76, '东山区', 4),
(695, 76, '白云区', 4),
(696, 76, '海珠区', 4),
(697, 76, '荔湾区', 4),
(698, 76, '越秀区', 4),
(699, 76, '黄埔区', 4),
(700, 76, '番禺区', 4),
(701, 76, '花都区', 4),
(702, 76, '增城区', 4),
(703, 76, '从化区', 4),
(704, 76, '市郊', 4),
(705, 77, '福田区', 4),
(706, 77, '罗湖区', 4),
(707, 77, '南山区', 4),
(708, 77, '宝安区', 4),
(709, 77, '龙岗区', 4),
(710, 77, '盐田区', 4),
(711, 78, '湘桥区', 4),
(712, 78, '潮安县', 4),
(713, 78, '饶平县', 4),
(714, 79, '南城区', 4),
(715, 79, '东城区', 4),
(716, 79, '万江区', 4),
(717, 79, '莞城区', 4),
(718, 79, '石龙镇', 4),
(719, 79, '虎门镇', 4),
(720, 79, '麻涌镇', 4),
(721, 79, '道滘镇', 4),
(722, 79, '石碣镇', 4),
(723, 79, '沙田镇', 4),
(724, 79, '望牛墩镇', 4),
(725, 79, '洪梅镇', 4),
(726, 79, '茶山镇', 4),
(727, 79, '寮步镇', 4),
(728, 79, '大岭山镇', 4),
(729, 79, '大朗镇', 4),
(730, 79, '黄江镇', 4),
(731, 79, '樟木头', 4),
(732, 79, '凤岗镇', 4),
(733, 79, '塘厦镇', 4),
(734, 79, '谢岗镇', 4),
(735, 79, '厚街镇', 4),
(736, 79, '清溪镇', 4),
(737, 79, '常平镇', 4),
(738, 79, '桥头镇', 4),
(739, 79, '横沥镇', 4),
(740, 79, '东坑镇', 4),
(741, 79, '企石镇', 4),
(742, 79, '石排镇', 4),
(743, 79, '长安镇', 4),
(744, 79, '中堂镇', 4),
(745, 79, '高埗镇', 4),
(746, 80, '禅城区', 4),
(747, 80, '南海区', 4),
(748, 80, '顺德区', 4),
(749, 80, '三水区', 4),
(750, 80, '高明区', 4),
(751, 81, '东源县', 4),
(752, 81, '和平县', 4),
(753, 81, '源城区', 4),
(754, 81, '连平县', 4),
(755, 81, '龙川县', 4),
(756, 81, '紫金县', 4),
(757, 82, '惠阳区', 4),
(758, 82, '惠城区', 4),
(759, 82, '大亚湾', 4),
(760, 82, '博罗县', 4),
(761, 82, '惠东县', 4),
(762, 82, '龙门县', 4),
(763, 83, '江海区', 4),
(764, 83, '蓬江区', 4),
(765, 83, '新会区', 4),
(766, 83, '台山市', 4),
(767, 83, '开平市', 4),
(768, 83, '鹤山市', 4),
(769, 83, '恩平市', 4),
(770, 84, '榕城区', 4),
(771, 84, '普宁市', 4),
(772, 84, '揭东县', 4),
(773, 84, '揭西县', 4),
(774, 84, '惠来县', 4),
(775, 85, '茂南区', 4),
(776, 85, '茂港区', 4),
(777, 85, '高州市', 4),
(778, 85, '化州市', 4),
(779, 85, '信宜市', 4),
(780, 85, '电白县', 4),
(781, 86, '梅县', 4),
(782, 86, '梅江区', 4),
(783, 86, '兴宁市', 4),
(784, 86, '大埔县', 4),
(785, 86, '丰顺县', 4),
(786, 86, '五华县', 4),
(787, 86, '平远县', 4),
(788, 86, '蕉岭县', 4),
(789, 87, '清城区', 4),
(790, 87, '英德市', 4),
(791, 87, '连州市', 4),
(792, 87, '佛冈县', 4),
(793, 87, '阳山县', 4),
(794, 87, '清新县', 4),
(795, 87, '连山', 4),
(796, 87, '连南', 4),
(797, 88, '南澳县', 4),
(798, 88, '潮阳区', 4),
(799, 88, '澄海区', 4),
(800, 88, '龙湖区', 4),
(801, 88, '金平区', 4),
(802, 88, '濠江区', 4),
(803, 88, '潮南区', 4),
(804, 89, '城区', 4),
(805, 89, '陆丰市', 4),
(806, 89, '海丰县', 4),
(807, 89, '陆河县', 4),
(808, 90, '曲江县', 4),
(809, 90, '浈江区', 4),
(810, 90, '武江区', 4),
(811, 90, '曲江区', 4),
(812, 90, '乐昌市', 4),
(813, 90, '南雄市', 4),
(814, 90, '始兴县', 4),
(815, 90, '仁化县', 4),
(816, 90, '翁源县', 4),
(817, 90, '新丰县', 4),
(818, 90, '乳源', 4),
(819, 91, '江城区', 4),
(820, 91, '阳春市', 4),
(821, 91, '阳西县', 4),
(822, 91, '阳东县', 4),
(823, 92, '云城区', 4),
(824, 92, '罗定市', 4),
(825, 92, '新兴县', 4),
(826, 92, '郁南县', 4),
(827, 92, '云安县', 4),
(828, 93, '赤坎区', 4),
(829, 93, '霞山区', 4),
(830, 93, '坡头区', 4),
(831, 93, '麻章区', 4),
(832, 93, '廉江市', 4),
(833, 93, '雷州市', 4),
(834, 93, '吴川市', 4),
(835, 93, '遂溪县', 4),
(836, 93, '徐闻县', 4),
(837, 94, '肇庆市', 4),
(838, 94, '高要市', 4),
(839, 94, '四会市', 4),
(840, 94, '广宁县', 4),
(841, 94, '怀集县', 4),
(842, 94, '封开县', 4),
(843, 94, '德庆县', 4),
(844, 95, '石岐街道', 4),
(845, 95, '东区街道', 4),
(846, 95, '西区街道', 4),
(847, 95, '环城街道', 4),
(848, 95, '中山港街道', 4),
(849, 95, '五桂山街道', 4),
(850, 96, '香洲区', 4),
(851, 96, '斗门区', 4),
(852, 96, '金湾区', 4),
(853, 97, '邕宁区', 4),
(854, 97, '青秀区', 4),
(855, 97, '兴宁区', 4),
(856, 97, '良庆区', 4),
(857, 97, '西乡塘区', 4),
(858, 97, '江南区', 4),
(859, 97, '武鸣县', 4),
(860, 97, '隆安县', 4),
(861, 97, '马山县', 4),
(862, 97, '上林县', 4),
(863, 97, '宾阳县', 4),
(864, 97, '横县', 4),
(865, 98, '秀峰区', 4),
(866, 98, '叠彩区', 4),
(867, 98, '象山区', 4),
(868, 98, '七星区', 4),
(869, 98, '雁山区', 4),
(870, 98, '阳朔县', 4),
(871, 98, '临桂县', 4),
(872, 98, '灵川县', 4),
(873, 98, '全州县', 4),
(874, 98, '平乐县', 4),
(875, 98, '兴安县', 4),
(876, 98, '灌阳县', 4),
(877, 98, '荔浦县', 4),
(878, 98, '资源县', 4),
(879, 98, '永福县', 4),
(880, 98, '龙胜', 4),
(881, 98, '恭城', 4),
(882, 99, '右江区', 4),
(883, 99, '凌云县', 4),
(884, 99, '平果县', 4),
(885, 99, '西林县', 4),
(886, 99, '乐业县', 4),
(887, 99, '德保县', 4),
(888, 99, '田林县', 4),
(889, 99, '田阳县', 4),
(890, 99, '靖西县', 4),
(891, 99, '田东县', 4),
(892, 99, '那坡县', 4),
(893, 99, '隆林', 4),
(894, 100, '海城区', 4),
(895, 100, '银海区', 4),
(896, 100, '铁山港区', 4),
(897, 100, '合浦县', 4),
(898, 101, '江州区', 4),
(899, 101, '凭祥市', 4),
(900, 101, '宁明县', 4),
(901, 101, '扶绥县', 4),
(902, 101, '龙州县', 4),
(903, 101, '大新县', 4),
(904, 101, '天等县', 4),
(905, 102, '港口区', 4),
(906, 102, '防城区', 4),
(907, 102, '东兴市', 4),
(908, 102, '上思县', 4),
(909, 103, '港北区', 4),
(910, 103, '港南区', 4),
(911, 103, '覃塘区', 4),
(912, 103, '桂平市', 4),
(913, 103, '平南县', 4),
(914, 104, '金城江区', 4),
(915, 104, '宜州市', 4),
(916, 104, '天峨县', 4),
(917, 104, '凤山县', 4),
(918, 104, '南丹县', 4),
(919, 104, '东兰县', 4),
(920, 104, '都安', 4),
(921, 104, '罗城', 4),
(922, 104, '巴马', 4),
(923, 104, '环江', 4),
(924, 104, '大化', 4),
(925, 105, '八步区', 4),
(926, 105, '钟山县', 4),
(927, 105, '昭平县', 4),
(928, 105, '富川', 4),
(929, 106, '兴宾区', 4),
(930, 106, '合山市', 4),
(931, 106, '象州县', 4),
(932, 106, '武宣县', 4),
(933, 106, '忻城县', 4),
(934, 106, '金秀', 4),
(935, 107, '城中区', 4),
(936, 107, '鱼峰区', 4),
(937, 107, '柳北区', 4),
(938, 107, '柳南区', 4),
(939, 107, '柳江县', 4),
(940, 107, '柳城县', 4),
(941, 107, '鹿寨县', 4),
(942, 107, '融安县', 4),
(943, 107, '融水', 4),
(944, 107, '三江', 4),
(945, 108, '钦南区', 4),
(946, 108, '钦北区', 4),
(947, 108, '灵山县', 4),
(948, 108, '浦北县', 4),
(949, 109, '万秀区', 4),
(950, 109, '蝶山区', 4),
(951, 109, '长洲区', 4),
(952, 109, '岑溪市', 4),
(953, 109, '苍梧县', 4),
(954, 109, '藤县', 4),
(955, 109, '蒙山县', 4),
(956, 110, '玉州区', 4),
(957, 110, '北流市', 4),
(958, 110, '容县', 4),
(959, 110, '陆川县', 4),
(960, 110, '博白县', 4),
(961, 110, '兴业县', 4),
(962, 111, '南明区', 4),
(963, 111, '云岩区', 4),
(964, 111, '花溪区', 4),
(965, 111, '乌当区', 4),
(966, 111, '白云区', 4),
(967, 111, '小河区', 4),
(968, 111, '金阳新区', 4),
(969, 111, '新天园区', 4),
(970, 111, '清镇市', 4),
(971, 111, '开阳县', 4),
(972, 111, '修文县', 4),
(973, 111, '息烽县', 4),
(974, 112, '西秀区', 4),
(975, 112, '关岭', 4),
(976, 112, '镇宁', 4),
(977, 112, '紫云', 4),
(978, 112, '平坝县', 4),
(979, 112, '普定县', 4),
(980, 113, '毕节市', 4),
(981, 113, '大方县', 4),
(982, 113, '黔西县', 4),
(983, 113, '金沙县', 4),
(984, 113, '织金县', 4),
(985, 113, '纳雍县', 4),
(986, 113, '赫章县', 4),
(987, 113, '威宁', 4),
(988, 114, '钟山区', 4),
(989, 114, '六枝特区', 4),
(990, 114, '水城县', 4),
(991, 114, '盘县', 4),
(992, 115, '凯里市', 4),
(993, 115, '黄平县', 4),
(994, 115, '施秉县', 4),
(995, 115, '三穗县', 4),
(996, 115, '镇远县', 4),
(997, 115, '岑巩县', 4),
(998, 115, '天柱县', 4),
(999, 115, '锦屏县', 4),
(1000, 115, '剑河县', 4),
(1001, 115, '台江县', 4),
(1002, 115, '黎平县', 4),
(1003, 115, '榕江县', 4),
(1004, 115, '从江县', 4),
(1005, 115, '雷山县', 4),
(1006, 115, '麻江县', 4),
(1007, 115, '丹寨县', 4),
(1008, 116, '都匀市', 4),
(1009, 116, '福泉市', 4),
(1010, 116, '荔波县', 4),
(1011, 116, '贵定县', 4),
(1012, 116, '瓮安县', 4),
(1013, 116, '独山县', 4),
(1014, 116, '平塘县', 4),
(1015, 116, '罗甸县', 4),
(1016, 116, '长顺县', 4),
(1017, 116, '龙里县', 4),
(1018, 116, '惠水县', 4),
(1019, 116, '三都', 4),
(1020, 117, '兴义市', 4),
(1021, 117, '兴仁县', 4),
(1022, 117, '普安县', 4),
(1023, 117, '晴隆县', 4),
(1024, 117, '贞丰县', 4),
(1025, 117, '望谟县', 4),
(1026, 117, '册亨县', 4),
(1027, 117, '安龙县', 4),
(1028, 118, '铜仁市', 4),
(1029, 118, '江口县', 4),
(1030, 118, '石阡县', 4),
(1031, 118, '思南县', 4),
(1032, 118, '德江县', 4),
(1033, 118, '玉屏', 4),
(1034, 118, '印江', 4),
(1035, 118, '沿河', 4),
(1036, 118, '松桃', 4),
(1037, 118, '万山特区', 4),
(1038, 119, '红花岗区', 4),
(1039, 119, '务川县', 4),
(1040, 119, '道真县', 4),
(1041, 119, '汇川区', 4),
(1042, 119, '赤水市', 4),
(1043, 119, '仁怀市', 4),
(1044, 119, '遵义县', 4),
(1045, 119, '桐梓县', 4),
(1046, 119, '绥阳县', 4),
(1047, 119, '正安县', 4),
(1048, 119, '凤冈县', 4),
(1049, 119, '湄潭县', 4),
(1050, 119, '余庆县', 4),
(1051, 119, '习水县', 4),
(1052, 119, '道真', 4),
(1053, 119, '务川', 4),
(1054, 120, '秀英区', 4),
(1055, 120, '龙华区', 4),
(1056, 120, '琼山区', 4),
(1057, 120, '美兰区', 4),
(1058, 137, '市区', 4),
(1059, 137, '洋浦开发区', 4),
(1060, 137, '那大镇', 4),
(1061, 137, '王五镇', 4),
(1062, 137, '雅星镇', 4),
(1063, 137, '大成镇', 4),
(1064, 137, '中和镇', 4),
(1065, 137, '峨蔓镇', 4),
(1066, 137, '南丰镇', 4),
(1067, 137, '白马井镇', 4),
(1068, 137, '兰洋镇', 4),
(1069, 137, '和庆镇', 4),
(1070, 137, '海头镇', 4),
(1071, 137, '排浦镇', 4),
(1072, 137, '东成镇', 4),
(1073, 137, '光村镇', 4),
(1074, 137, '木棠镇', 4),
(1075, 137, '新州镇', 4),
(1076, 137, '三都镇', 4),
(1077, 137, '其他', 4),
(1078, 138, '长安区', 4),
(1079, 138, '桥东区', 4),
(1080, 138, '桥西区', 4),
(1081, 138, '新华区', 4),
(1082, 138, '裕华区', 4),
(1083, 138, '井陉矿区', 4),
(1084, 138, '高新区', 4),
(1085, 138, '辛集市', 4),
(1086, 138, '藁城市', 4),
(1087, 138, '晋州市', 4),
(1088, 138, '新乐市', 4),
(1089, 138, '鹿泉市', 4),
(1090, 138, '井陉县', 4),
(1091, 138, '正定县', 4),
(1092, 138, '栾城县', 4),
(1093, 138, '行唐县', 4),
(1094, 138, '灵寿县', 4),
(1095, 138, '高邑县', 4),
(1096, 138, '深泽县', 4),
(1097, 138, '赞皇县', 4),
(1098, 138, '无极县', 4),
(1099, 138, '平山县', 4),
(1100, 138, '元氏县', 4),
(1101, 138, '赵县', 4),
(1102, 139, '新市区', 4),
(1103, 139, '南市区', 4),
(1104, 139, '北市区', 4),
(1105, 139, '涿州市', 4),
(1106, 139, '定州市', 4),
(1107, 139, '安国市', 4),
(1108, 139, '高碑店市', 4),
(1109, 139, '满城县', 4),
(1110, 139, '清苑县', 4),
(1111, 139, '涞水县', 4),
(1112, 139, '阜平县', 4),
(1113, 139, '徐水县', 4),
(1114, 139, '定兴县', 4),
(1115, 139, '唐县', 4),
(1116, 139, '高阳县', 4),
(1117, 139, '容城县', 4),
(1118, 139, '涞源县', 4),
(1119, 139, '望都县', 4),
(1120, 139, '安新县', 4),
(1121, 139, '易县', 4),
(1122, 139, '曲阳县', 4),
(1123, 139, '蠡县', 4),
(1124, 139, '顺平县', 4),
(1125, 139, '博野县', 4),
(1126, 139, '雄县', 4),
(1127, 140, '运河区', 4),
(1128, 140, '新华区', 4),
(1129, 140, '泊头市', 4),
(1130, 140, '任丘市', 4),
(1131, 140, '黄骅市', 4),
(1132, 140, '河间市', 4),
(1133, 140, '沧县', 4),
(1134, 140, '青县', 4),
(1135, 140, '东光县', 4),
(1136, 140, '海兴县', 4),
(1137, 140, '盐山县', 4),
(1138, 140, '肃宁县', 4),
(1139, 140, '南皮县', 4),
(1140, 140, '吴桥县', 4),
(1141, 140, '献县', 4),
(1142, 140, '孟村', 4),
(1143, 141, '双桥区', 4),
(1144, 141, '双滦区', 4),
(1145, 141, '鹰手营子矿区', 4),
(1146, 141, '承德县', 4),
(1147, 141, '兴隆县', 4),
(1148, 141, '平泉县', 4),
(1149, 141, '滦平县', 4),
(1150, 141, '隆化县', 4),
(1151, 141, '丰宁', 4),
(1152, 141, '宽城', 4),
(1153, 141, '围场', 4),
(1154, 142, '从台区', 4),
(1155, 142, '复兴区', 4),
(1156, 142, '邯山区', 4),
(1157, 142, '峰峰矿区', 4),
(1158, 142, '武安市', 4),
(1159, 142, '邯郸县', 4),
(1160, 142, '临漳县', 4),
(1161, 142, '成安县', 4),
(1162, 142, '大名县', 4),
(1163, 142, '涉县', 4),
(1164, 142, '磁县', 4),
(1165, 142, '肥乡县', 4),
(1166, 142, '永年县', 4),
(1167, 142, '邱县', 4),
(1168, 142, '鸡泽县', 4),
(1169, 142, '广平县', 4),
(1170, 142, '馆陶县', 4),
(1171, 142, '魏县', 4),
(1172, 142, '曲周县', 4),
(1173, 143, '桃城区', 4),
(1174, 143, '冀州市', 4),
(1175, 143, '深州市', 4),
(1176, 143, '枣强县', 4),
(1177, 143, '武邑县', 4),
(1178, 143, '武强县', 4),
(1179, 143, '饶阳县', 4),
(1180, 143, '安平县', 4),
(1181, 143, '故城县', 4),
(1182, 143, '景县', 4),
(1183, 143, '阜城县', 4),
(1184, 144, '安次区', 4),
(1185, 144, '广阳区', 4),
(1186, 144, '霸州市', 4),
(1187, 144, '三河市', 4),
(1188, 144, '固安县', 4),
(1189, 144, '永清县', 4),
(1190, 144, '香河县', 4),
(1191, 144, '大城县', 4),
(1192, 144, '文安县', 4),
(1193, 144, '大厂', 4),
(1194, 145, '海港区', 4),
(1195, 145, '山海关区', 4),
(1196, 145, '北戴河区', 4),
(1197, 145, '昌黎县', 4),
(1198, 145, '抚宁县', 4),
(1199, 145, '卢龙县', 4),
(1200, 145, '青龙', 4),
(1201, 146, '路北区', 4),
(1202, 146, '路南区', 4),
(1203, 146, '古冶区', 4),
(1204, 146, '开平区', 4),
(1205, 146, '丰南区', 4),
(1206, 146, '丰润区', 4),
(1207, 146, '遵化市', 4),
(1208, 146, '迁安市', 4),
(1209, 146, '滦县', 4),
(1210, 146, '滦南县', 4),
(1211, 146, '乐亭县', 4),
(1212, 146, '迁西县', 4),
(1213, 146, '玉田县', 4),
(1214, 146, '唐海县', 4),
(1215, 147, '桥东区', 4),
(1216, 147, '桥西区', 4),
(1217, 147, '南宫市', 4),
(1218, 147, '沙河市', 4),
(1219, 147, '邢台县', 4),
(1220, 147, '临城县', 4),
(1221, 147, '内丘县', 4),
(1222, 147, '柏乡县', 4),
(1223, 147, '隆尧县', 4),
(1224, 147, '任县', 4),
(1225, 147, '南和县', 4),
(1226, 147, '宁晋县', 4),
(1227, 147, '巨鹿县', 4),
(1228, 147, '新河县', 4),
(1229, 147, '广宗县', 4),
(1230, 147, '平乡县', 4),
(1231, 147, '威县', 4),
(1232, 147, '清河县', 4),
(1233, 147, '临西县', 4),
(1234, 148, '桥西区', 4),
(1235, 148, '桥东区', 4),
(1236, 148, '宣化区', 4),
(1237, 148, '下花园区', 4),
(1238, 148, '宣化县', 4),
(1239, 148, '张北县', 4),
(1240, 148, '康保县', 4),
(1241, 148, '沽源县', 4),
(1242, 148, '尚义县', 4),
(1243, 148, '蔚县', 4),
(1244, 148, '阳原县', 4),
(1245, 148, '怀安县', 4),
(1246, 148, '万全县', 4),
(1247, 148, '怀来县', 4),
(1248, 148, '涿鹿县', 4),
(1249, 148, '赤城县', 4),
(1250, 148, '崇礼县', 4),
(1251, 149, '金水区', 4),
(1252, 149, '邙山区', 4),
(1253, 149, '二七区', 4),
(1254, 149, '管城区', 4),
(1255, 149, '中原区', 4),
(1256, 149, '上街区', 4),
(1257, 149, '惠济区', 4),
(1258, 149, '郑东新区', 4),
(1259, 149, '经济技术开发区', 4),
(1260, 149, '高新开发区', 4),
(1261, 149, '出口加工区', 4),
(1262, 149, '巩义市', 4),
(1263, 149, '荥阳市', 4),
(1264, 149, '新密市', 4),
(1265, 149, '新郑市', 4),
(1266, 149, '登封市', 4),
(1267, 149, '中牟县', 4),
(1268, 150, '西工区', 4),
(1269, 150, '老城区', 4),
(1270, 150, '涧西区', 4),
(1271, 150, '瀍河回族区', 4),
(1272, 150, '洛龙区', 4),
(1273, 150, '吉利区', 4),
(1274, 150, '偃师市', 4),
(1275, 150, '孟津县', 4),
(1276, 150, '新安县', 4),
(1277, 150, '栾川县', 4),
(1278, 150, '嵩县', 4),
(1279, 150, '汝阳县', 4),
(1280, 150, '宜阳县', 4),
(1281, 150, '洛宁县', 4),
(1282, 150, '伊川县', 4),
(1283, 151, '鼓楼区', 4),
(1284, 151, '龙亭区', 4),
(1285, 151, '顺河回族区', 4),
(1286, 151, '金明区', 4),
(1287, 151, '禹王台区', 4),
(1288, 151, '杞县', 4),
(1289, 151, '通许县', 4),
(1290, 151, '尉氏县', 4),
(1291, 151, '开封县', 4),
(1292, 151, '兰考县', 4),
(1293, 152, '北关区', 4),
(1294, 152, '文峰区', 4),
(1295, 152, '殷都区', 4),
(1296, 152, '龙安区', 4),
(1297, 152, '林州市', 4),
(1298, 152, '安阳县', 4),
(1299, 152, '汤阴县', 4),
(1300, 152, '滑县', 4),
(1301, 152, '内黄县', 4),
(1302, 153, '淇滨区', 4),
(1303, 153, '山城区', 4),
(1304, 153, '鹤山区', 4),
(1305, 153, '浚县', 4),
(1306, 153, '淇县', 4),
(1307, 154, '济源市', 4),
(1308, 155, '解放区', 4),
(1309, 155, '中站区', 4),
(1310, 155, '马村区', 4),
(1311, 155, '山阳区', 4),
(1312, 155, '沁阳市', 4),
(1313, 155, '孟州市', 4),
(1314, 155, '修武县', 4),
(1315, 155, '博爱县', 4),
(1316, 155, '武陟县', 4),
(1317, 155, '温县', 4),
(1318, 156, '卧龙区', 4),
(1319, 156, '宛城区', 4),
(1320, 156, '邓州市', 4),
(1321, 156, '南召县', 4),
(1322, 156, '方城县', 4),
(1323, 156, '西峡县', 4),
(1324, 156, '镇平县', 4),
(1325, 156, '内乡县', 4),
(1326, 156, '淅川县', 4),
(1327, 156, '社旗县', 4),
(1328, 156, '唐河县', 4),
(1329, 156, '新野县', 4),
(1330, 156, '桐柏县', 4),
(1331, 157, '新华区', 4),
(1332, 157, '卫东区', 4),
(1333, 157, '湛河区', 4),
(1334, 157, '石龙区', 4),
(1335, 157, '舞钢市', 4),
(1336, 157, '汝州市', 4),
(1337, 157, '宝丰县', 4),
(1338, 157, '叶县', 4),
(1339, 157, '鲁山县', 4),
(1340, 157, '郏县', 4),
(1341, 158, '湖滨区', 4),
(1342, 158, '义马市', 4),
(1343, 158, '灵宝市', 4),
(1344, 158, '渑池县', 4),
(1345, 158, '陕县', 4),
(1346, 158, '卢氏县', 4),
(1347, 159, '梁园区', 4),
(1348, 159, '睢阳区', 4),
(1349, 159, '永城市', 4),
(1350, 159, '民权县', 4),
(1351, 159, '睢县', 4),
(1352, 159, '宁陵县', 4),
(1353, 159, '虞城县', 4),
(1354, 159, '柘城县', 4),
(1355, 159, '夏邑县', 4),
(1356, 160, '卫滨区', 4),
(1357, 160, '红旗区', 4),
(1358, 160, '凤泉区', 4),
(1359, 160, '牧野区', 4),
(1360, 160, '卫辉市', 4),
(1361, 160, '辉县市', 4),
(1362, 160, '新乡县', 4),
(1363, 160, '获嘉县', 4),
(1364, 160, '原阳县', 4),
(1365, 160, '延津县', 4),
(1366, 160, '封丘县', 4),
(1367, 160, '长垣县', 4),
(1368, 161, '浉河区', 4),
(1369, 161, '平桥区', 4),
(1370, 161, '罗山县', 4),
(1371, 161, '光山县', 4),
(1372, 161, '新县', 4),
(1373, 161, '商城县', 4),
(1374, 161, '固始县', 4),
(1375, 161, '潢川县', 4),
(1376, 161, '淮滨县', 4),
(1377, 161, '息县', 4),
(1378, 162, '魏都区', 4),
(1379, 162, '禹州市', 4),
(1380, 162, '长葛市', 4),
(1381, 162, '许昌县', 4),
(1382, 162, '鄢陵县', 4),
(1383, 162, '襄城县', 4),
(1384, 163, '川汇区', 4),
(1385, 163, '项城市', 4),
(1386, 163, '扶沟县', 4),
(1387, 163, '西华县', 4),
(1388, 163, '商水县', 4),
(1389, 163, '沈丘县', 4),
(1390, 163, '郸城县', 4),
(1391, 163, '淮阳县', 4),
(1392, 163, '太康县', 4),
(1393, 163, '鹿邑县', 4),
(1394, 164, '驿城区', 4),
(1395, 164, '西平县', 4),
(1396, 164, '上蔡县', 4),
(1397, 164, '平舆县', 4),
(1398, 164, '正阳县', 4),
(1399, 164, '确山县', 4),
(1400, 164, '泌阳县', 4),
(1401, 164, '汝南县', 4),
(1402, 164, '遂平县', 4),
(1403, 164, '新蔡县', 4),
(1404, 165, '郾城区', 4),
(1405, 165, '源汇区', 4),
(1406, 165, '召陵区', 4),
(1407, 165, '舞阳县', 4),
(1408, 165, '临颍县', 4),
(1409, 166, '华龙区', 4),
(1410, 166, '清丰县', 4),
(1411, 166, '南乐县', 4),
(1412, 166, '范县', 4),
(1413, 166, '台前县', 4),
(1414, 166, '濮阳县', 4),
(1415, 167, '道里区', 4),
(1416, 167, '南岗区', 4),
(1417, 167, '动力区', 4),
(1418, 167, '平房区', 4),
(1419, 167, '香坊区', 4),
(1420, 167, '太平区', 4),
(1421, 167, '道外区', 4),
(1422, 167, '阿城区', 4),
(1423, 167, '呼兰区', 4),
(1424, 167, '松北区', 4),
(1425, 167, '尚志市', 4),
(1426, 167, '双城市', 4),
(1427, 167, '五常市', 4),
(1428, 167, '方正县', 4),
(1429, 167, '宾县', 4),
(1430, 167, '依兰县', 4),
(1431, 167, '巴彦县', 4),
(1432, 167, '通河县', 4),
(1433, 167, '木兰县', 4),
(1434, 167, '延寿县', 4),
(1435, 168, '萨尔图区', 4),
(1436, 168, '红岗区', 4),
(1437, 168, '龙凤区', 4),
(1438, 168, '让胡路区', 4),
(1439, 168, '大同区', 4),
(1440, 168, '肇州县', 4),
(1441, 168, '肇源县', 4),
(1442, 168, '林甸县', 4),
(1443, 168, '杜尔伯特', 4),
(1444, 169, '呼玛县', 4),
(1445, 169, '漠河县', 4),
(1446, 169, '塔河县', 4),
(1447, 170, '兴山区', 4),
(1448, 170, '工农区', 4),
(1449, 170, '南山区', 4),
(1450, 170, '兴安区', 4),
(1451, 170, '向阳区', 4),
(1452, 170, '东山区', 4),
(1453, 170, '萝北县', 4),
(1454, 170, '绥滨县', 4),
(1455, 171, '爱辉区', 4),
(1456, 171, '五大连池市', 4),
(1457, 171, '北安市', 4),
(1458, 171, '嫩江县', 4),
(1459, 171, '逊克县', 4),
(1460, 171, '孙吴县', 4),
(1461, 172, '鸡冠区', 4),
(1462, 172, '恒山区', 4),
(1463, 172, '城子河区', 4),
(1464, 172, '滴道区', 4),
(1465, 172, '梨树区', 4),
(1466, 172, '虎林市', 4),
(1467, 172, '密山市', 4),
(1468, 172, '鸡东县', 4),
(1469, 173, '前进区', 4),
(1470, 173, '郊区', 4),
(1471, 173, '向阳区', 4),
(1472, 173, '东风区', 4),
(1473, 173, '同江市', 4),
(1474, 173, '富锦市', 4),
(1475, 173, '桦南县', 4),
(1476, 173, '桦川县', 4),
(1477, 173, '汤原县', 4),
(1478, 173, '抚远县', 4),
(1479, 174, '爱民区', 4),
(1480, 174, '东安区', 4),
(1481, 174, '阳明区', 4),
(1482, 174, '西安区', 4),
(1483, 174, '绥芬河市', 4),
(1484, 174, '海林市', 4),
(1485, 174, '宁安市', 4),
(1486, 174, '穆棱市', 4),
(1487, 174, '东宁县', 4),
(1488, 174, '林口县', 4),
(1489, 175, '桃山区', 4),
(1490, 175, '新兴区', 4),
(1491, 175, '茄子河区', 4),
(1492, 175, '勃利县', 4),
(1493, 176, '龙沙区', 4),
(1494, 176, '昂昂溪区', 4),
(1495, 176, '铁峰区', 4),
(1496, 176, '建华区', 4),
(1497, 176, '富拉尔基区', 4),
(1498, 176, '碾子山区', 4),
(1499, 176, '梅里斯达斡尔区', 4),
(1500, 176, '讷河市', 4),
(1501, 176, '龙江县', 4),
(1502, 176, '依安县', 4),
(1503, 176, '泰来县', 4),
(1504, 176, '甘南县', 4),
(1505, 176, '富裕县', 4),
(1506, 176, '克山县', 4),
(1507, 176, '克东县', 4),
(1508, 176, '拜泉县', 4),
(1509, 177, '尖山区', 4),
(1510, 177, '岭东区', 4),
(1511, 177, '四方台区', 4),
(1512, 177, '宝山区', 4),
(1513, 177, '集贤县', 4),
(1514, 177, '友谊县', 4),
(1515, 177, '宝清县', 4),
(1516, 177, '饶河县', 4),
(1517, 178, '北林区', 4),
(1518, 178, '安达市', 4),
(1519, 178, '肇东市', 4),
(1520, 178, '海伦市', 4),
(1521, 178, '望奎县', 4),
(1522, 178, '兰西县', 4),
(1523, 178, '青冈县', 4),
(1524, 178, '庆安县', 4),
(1525, 178, '明水县', 4),
(1526, 178, '绥棱县', 4),
(1527, 179, '伊春区', 4),
(1528, 179, '带岭区', 4),
(1529, 179, '南岔区', 4),
(1530, 179, '金山屯区', 4),
(1531, 179, '西林区', 4),
(1532, 179, '美溪区', 4),
(1533, 179, '乌马河区', 4),
(1534, 179, '翠峦区', 4),
(1535, 179, '友好区', 4),
(1536, 179, '上甘岭区', 4),
(1537, 179, '五营区', 4),
(1538, 179, '红星区', 4),
(1539, 179, '新青区', 4),
(1540, 179, '汤旺河区', 4),
(1541, 179, '乌伊岭区', 4),
(1542, 179, '铁力市', 4),
(1543, 179, '嘉荫县', 4),
(1544, 180, '江岸区', 4),
(1545, 180, '武昌区', 4),
(1546, 180, '江汉区', 4),
(1547, 180, '硚口区', 4),
(1548, 180, '汉阳区', 4),
(1549, 180, '青山区', 4),
(1550, 180, '洪山区', 4),
(1551, 180, '东西湖区', 4),
(1552, 180, '汉南区', 4),
(1553, 180, '蔡甸区', 4),
(1554, 180, '江夏区', 4),
(1555, 180, '黄陂区', 4),
(1556, 180, '新洲区', 4),
(1557, 180, '经济开发区', 4),
(1558, 181, '仙桃市', 4),
(1559, 182, '鄂城区', 4),
(1560, 182, '华容区', 4),
(1561, 182, '梁子湖区', 4),
(1562, 183, '黄州区', 4),
(1563, 183, '麻城市', 4),
(1564, 183, '武穴市', 4),
(1565, 183, '团风县', 4),
(1566, 183, '红安县', 4),
(1567, 183, '罗田县', 4),
(1568, 183, '英山县', 4),
(1569, 183, '浠水县', 4),
(1570, 183, '蕲春县', 4),
(1571, 183, '黄梅县', 4),
(1572, 184, '黄石港区', 4),
(1573, 184, '西塞山区', 4),
(1574, 184, '下陆区', 4),
(1575, 184, '铁山区', 4),
(1576, 184, '大冶市', 4),
(1577, 184, '阳新县', 4),
(1578, 185, '东宝区', 4),
(1579, 185, '掇刀区', 4),
(1580, 185, '钟祥市', 4),
(1581, 185, '京山县', 4),
(1582, 185, '沙洋县', 4),
(1583, 186, '沙市区', 4),
(1584, 186, '荆州区', 4),
(1585, 186, '石首市', 4),
(1586, 186, '洪湖市', 4),
(1587, 186, '松滋市', 4),
(1588, 186, '公安县', 4),
(1589, 186, '监利县', 4),
(1590, 186, '江陵县', 4),
(1591, 187, '潜江市', 4),
(1592, 188, '神农架林区', 4),
(1593, 189, '张湾区', 4),
(1594, 189, '茅箭区', 4),
(1595, 189, '丹江口市', 4),
(1596, 189, '郧县', 4),
(1597, 189, '郧西县', 4),
(1598, 189, '竹山县', 4),
(1599, 189, '竹溪县', 4),
(1600, 189, '房县', 4),
(1601, 190, '曾都区', 4),
(1602, 190, '广水市', 4),
(1603, 191, '天门市', 4),
(1604, 192, '咸安区', 4),
(1605, 192, '赤壁市', 4),
(1606, 192, '嘉鱼县', 4),
(1607, 192, '通城县', 4),
(1608, 192, '崇阳县', 4),
(1609, 192, '通山县', 4),
(1610, 193, '襄城区', 4),
(1611, 193, '樊城区', 4),
(1612, 193, '襄阳区', 4),
(1613, 193, '老河口市', 4),
(1614, 193, '枣阳市', 4),
(1615, 193, '宜城市', 4),
(1616, 193, '南漳县', 4),
(1617, 193, '谷城县', 4),
(1618, 193, '保康县', 4),
(1619, 194, '孝南区', 4),
(1620, 194, '应城市', 4),
(1621, 194, '安陆市', 4),
(1622, 194, '汉川市', 4),
(1623, 194, '孝昌县', 4),
(1624, 194, '大悟县', 4),
(1625, 194, '云梦县', 4),
(1626, 195, '长阳', 4),
(1627, 195, '五峰', 4),
(1628, 195, '西陵区', 4),
(1629, 195, '伍家岗区', 4),
(1630, 195, '点军区', 4),
(1631, 195, '猇亭区', 4),
(1632, 195, '夷陵区', 4),
(1633, 195, '宜都市', 4),
(1634, 195, '当阳市', 4),
(1635, 195, '枝江市', 4),
(1636, 195, '远安县', 4),
(1637, 195, '兴山县', 4),
(1638, 195, '秭归县', 4),
(1639, 196, '恩施市', 4),
(1640, 196, '利川市', 4),
(1641, 196, '建始县', 4),
(1642, 196, '巴东县', 4),
(1643, 196, '宣恩县', 4),
(1644, 196, '咸丰县', 4),
(1645, 196, '来凤县', 4),
(1646, 196, '鹤峰县', 4),
(1647, 197, '岳麓区', 4),
(1648, 197, '芙蓉区', 4),
(1649, 197, '天心区', 4),
(1650, 197, '开福区', 4),
(1651, 197, '雨花区', 4),
(1652, 197, '开发区', 4),
(1653, 197, '浏阳市', 4),
(1654, 197, '长沙县', 4),
(1655, 197, '望城县', 4),
(1656, 197, '宁乡县', 4),
(1657, 198, '永定区', 4),
(1658, 198, '武陵源区', 4),
(1659, 198, '慈利县', 4),
(1660, 198, '桑植县', 4),
(1661, 199, '武陵区', 4),
(1662, 199, '鼎城区', 4),
(1663, 199, '津市市', 4),
(1664, 199, '安乡县', 4),
(1665, 199, '汉寿县', 4),
(1666, 199, '澧县', 4),
(1667, 199, '临澧县', 4),
(1668, 199, '桃源县', 4),
(1669, 199, '石门县', 4),
(1670, 200, '北湖区', 4),
(1671, 200, '苏仙区', 4),
(1672, 200, '资兴市', 4),
(1673, 200, '桂阳县', 4),
(1674, 200, '宜章县', 4),
(1675, 200, '永兴县', 4),
(1676, 200, '嘉禾县', 4),
(1677, 200, '临武县', 4),
(1678, 200, '汝城县', 4),
(1679, 200, '桂东县', 4),
(1680, 200, '安仁县', 4),
(1681, 201, '雁峰区', 4),
(1682, 201, '珠晖区', 4),
(1683, 201, '石鼓区', 4),
(1684, 201, '蒸湘区', 4),
(1685, 201, '南岳区', 4),
(1686, 201, '耒阳市', 4),
(1687, 201, '常宁市', 4),
(1688, 201, '衡阳县', 4),
(1689, 201, '衡南县', 4),
(1690, 201, '衡山县', 4),
(1691, 201, '衡东县', 4),
(1692, 201, '祁东县', 4),
(1693, 202, '鹤城区', 4),
(1694, 202, '靖州', 4),
(1695, 202, '麻阳', 4),
(1696, 202, '通道', 4),
(1697, 202, '新晃', 4),
(1698, 202, '芷江', 4),
(1699, 202, '沅陵县', 4),
(1700, 202, '辰溪县', 4),
(1701, 202, '溆浦县', 4),
(1702, 202, '中方县', 4),
(1703, 202, '会同县', 4),
(1704, 202, '洪江市', 4),
(1705, 203, '娄星区', 4),
(1706, 203, '冷水江市', 4),
(1707, 203, '涟源市', 4),
(1708, 203, '双峰县', 4),
(1709, 203, '新化县', 4),
(1710, 204, '城步', 4),
(1711, 204, '双清区', 4),
(1712, 204, '大祥区', 4),
(1713, 204, '北塔区', 4),
(1714, 204, '武冈市', 4),
(1715, 204, '邵东县', 4),
(1716, 204, '新邵县', 4),
(1717, 204, '邵阳县', 4),
(1718, 204, '隆回县', 4),
(1719, 204, '洞口县', 4),
(1720, 204, '绥宁县', 4),
(1721, 204, '新宁县', 4),
(1722, 205, '岳塘区', 4),
(1723, 205, '雨湖区', 4),
(1724, 205, '湘乡市', 4),
(1725, 205, '韶山市', 4),
(1726, 205, '湘潭县', 4),
(1727, 206, '吉首市', 4),
(1728, 206, '泸溪县', 4),
(1729, 206, '凤凰县', 4),
(1730, 206, '花垣县', 4),
(1731, 206, '保靖县', 4),
(1732, 206, '古丈县', 4),
(1733, 206, '永顺县', 4),
(1734, 206, '龙山县', 4),
(1735, 207, '赫山区', 4),
(1736, 207, '资阳区', 4),
(1737, 207, '沅江市', 4),
(1738, 207, '南县', 4),
(1739, 207, '桃江县', 4),
(1740, 207, '安化县', 4),
(1741, 208, '江华', 4),
(1742, 208, '冷水滩区', 4),
(1743, 208, '零陵区', 4),
(1744, 208, '祁阳县', 4),
(1745, 208, '东安县', 4),
(1746, 208, '双牌县', 4),
(1747, 208, '道县', 4),
(1748, 208, '江永县', 4),
(1749, 208, '宁远县', 4),
(1750, 208, '蓝山县', 4),
(1751, 208, '新田县', 4),
(1752, 209, '岳阳楼区', 4),
(1753, 209, '君山区', 4),
(1754, 209, '云溪区', 4),
(1755, 209, '汨罗市', 4),
(1756, 209, '临湘市', 4),
(1757, 209, '岳阳县', 4),
(1758, 209, '华容县', 4),
(1759, 209, '湘阴县', 4),
(1760, 209, '平江县', 4),
(1761, 210, '天元区', 4),
(1762, 210, '荷塘区', 4),
(1763, 210, '芦淞区', 4),
(1764, 210, '石峰区', 4),
(1765, 210, '醴陵市', 4),
(1766, 210, '株洲县', 4),
(1767, 210, '攸县', 4),
(1768, 210, '茶陵县', 4),
(1769, 210, '炎陵县', 4),
(1770, 211, '朝阳区', 4),
(1771, 211, '宽城区', 4),
(1772, 211, '二道区', 4),
(1773, 211, '南关区', 4),
(1774, 211, '绿园区', 4),
(1775, 211, '双阳区', 4),
(1776, 211, '净月潭开发区', 4),
(1777, 211, '高新技术开发区', 4),
(1778, 211, '经济技术开发区', 4),
(1779, 211, '汽车产业开发区', 4),
(1780, 211, '德惠市', 4),
(1781, 211, '九台市', 4),
(1782, 211, '榆树市', 4),
(1783, 211, '农安县', 4),
(1784, 212, '船营区', 4),
(1785, 212, '昌邑区', 4),
(1786, 212, '龙潭区', 4),
(1787, 212, '丰满区', 4),
(1788, 212, '蛟河市', 4),
(1789, 212, '桦甸市', 4),
(1790, 212, '舒兰市', 4),
(1791, 212, '磐石市', 4),
(1792, 212, '永吉县', 4),
(1793, 213, '洮北区', 4),
(1794, 213, '洮南市', 4),
(1795, 213, '大安市', 4),
(1796, 213, '镇赉县', 4),
(1797, 213, '通榆县', 4),
(1798, 214, '江源区', 4),
(1799, 214, '八道江区', 4),
(1800, 214, '长白', 4),
(1801, 214, '临江市', 4),
(1802, 214, '抚松县', 4),
(1803, 214, '靖宇县', 4),
(1804, 215, '龙山区', 4),
(1805, 215, '西安区', 4),
(1806, 215, '东丰县', 4),
(1807, 215, '东辽县', 4),
(1808, 216, '铁西区', 4),
(1809, 216, '铁东区', 4),
(1810, 216, '伊通', 4),
(1811, 216, '公主岭市', 4),
(1812, 216, '双辽市', 4),
(1813, 216, '梨树县', 4),
(1814, 217, '前郭尔罗斯', 4),
(1815, 217, '宁江区', 4),
(1816, 217, '长岭县', 4),
(1817, 217, '乾安县', 4),
(1818, 217, '扶余县', 4),
(1819, 218, '东昌区', 4),
(1820, 218, '二道江区', 4),
(1821, 218, '梅河口市', 4),
(1822, 218, '集安市', 4),
(1823, 218, '通化县', 4),
(1824, 218, '辉南县', 4),
(1825, 218, '柳河县', 4),
(1826, 219, '延吉市', 4),
(1827, 219, '图们市', 4),
(1828, 219, '敦化市', 4),
(1829, 219, '珲春市', 4),
(1830, 219, '龙井市', 4),
(1831, 219, '和龙市', 4),
(1832, 219, '安图县', 4),
(1833, 219, '汪清县', 4),
(1834, 220, '玄武区', 4),
(1835, 220, '鼓楼区', 4),
(1836, 220, '白下区', 4),
(1837, 220, '建邺区', 4),
(1838, 220, '秦淮区', 4),
(1839, 220, '雨花台区', 4),
(1840, 220, '下关区', 4),
(1841, 220, '栖霞区', 4),
(1842, 220, '浦口区', 4),
(1843, 220, '江宁区', 4),
(1844, 220, '六合区', 4),
(1845, 220, '溧水县', 4),
(1846, 220, '高淳县', 4),
(1847, 221, '沧浪区', 4),
(1848, 221, '金阊区', 4),
(1849, 221, '平江区', 4),
(1850, 221, '虎丘区', 4),
(1851, 221, '吴中区', 4),
(1852, 221, '相城区', 4),
(1853, 221, '园区', 4),
(1854, 221, '新区', 4),
(1855, 221, '常熟市', 4),
(1856, 221, '张家港市', 4),
(1857, 221, '玉山镇', 4),
(1858, 221, '巴城镇', 4),
(1859, 221, '周市镇', 4),
(1860, 221, '陆家镇', 4),
(1861, 221, '花桥镇', 4),
(1862, 221, '淀山湖镇', 4),
(1863, 221, '张浦镇', 4),
(1864, 221, '周庄镇', 4),
(1865, 221, '千灯镇', 4),
(1866, 221, '锦溪镇', 4),
(1867, 221, '开发区', 4),
(1868, 221, '吴江市', 4),
(1869, 221, '太仓市', 4),
(1870, 222, '崇安区', 4),
(1871, 222, '北塘区', 4),
(1872, 222, '南长区', 4),
(1873, 222, '锡山区', 4),
(1874, 222, '惠山区', 4),
(1875, 222, '滨湖区', 4),
(1876, 222, '新区', 4),
(1877, 222, '江阴市', 4),
(1878, 222, '宜兴市', 4),
(1879, 223, '天宁区', 4),
(1880, 223, '钟楼区', 4),
(1881, 223, '戚墅堰区', 4),
(1882, 223, '郊区', 4),
(1883, 223, '新北区', 4),
(1884, 223, '武进区', 4),
(1885, 223, '溧阳市', 4),
(1886, 223, '金坛市', 4),
(1887, 224, '清河区', 4),
(1888, 224, '清浦区', 4),
(1889, 224, '楚州区', 4),
(1890, 224, '淮阴区', 4),
(1891, 224, '涟水县', 4),
(1892, 224, '洪泽县', 4),
(1893, 224, '盱眙县', 4),
(1894, 224, '金湖县', 4),
(1895, 225, '新浦区', 4),
(1896, 225, '连云区', 4),
(1897, 225, '海州区', 4),
(1898, 225, '赣榆县', 4),
(1899, 225, '东海县', 4),
(1900, 225, '灌云县', 4),
(1901, 225, '灌南县', 4),
(1902, 226, '崇川区', 4),
(1903, 226, '港闸区', 4),
(1904, 226, '经济开发区', 4),
(1905, 226, '启东市', 4),
(1906, 226, '如皋市', 4),
(1907, 226, '通州市', 4),
(1908, 226, '海门市', 4),
(1909, 226, '海安县', 4),
(1910, 226, '如东县', 4),
(1911, 227, '宿城区', 4),
(1912, 227, '宿豫区', 4),
(1913, 227, '宿豫县', 4),
(1914, 227, '沭阳县', 4),
(1915, 227, '泗阳县', 4),
(1916, 227, '泗洪县', 4),
(1917, 228, '海陵区', 4),
(1918, 228, '高港区', 4),
(1919, 228, '兴化市', 4),
(1920, 228, '靖江市', 4),
(1921, 228, '泰兴市', 4),
(1922, 228, '姜堰市', 4),
(1923, 229, '云龙区', 4),
(1924, 229, '鼓楼区', 4),
(1925, 229, '九里区', 4),
(1926, 229, '贾汪区', 4),
(1927, 229, '泉山区', 4),
(1928, 229, '新沂市', 4),
(1929, 229, '邳州市', 4),
(1930, 229, '丰县', 4),
(1931, 229, '沛县', 4),
(1932, 229, '铜山县', 4),
(1933, 229, '睢宁县', 4),
(1934, 230, '城区', 4),
(1935, 230, '亭湖区', 4),
(1936, 230, '盐都区', 4),
(1937, 230, '盐都县', 4),
(1938, 230, '东台市', 4),
(1939, 230, '大丰市', 4),
(1940, 230, '响水县', 4),
(1941, 230, '滨海县', 4),
(1942, 230, '阜宁县', 4),
(1943, 230, '射阳县', 4),
(1944, 230, '建湖县', 4),
(1945, 231, '广陵区', 4),
(1946, 231, '维扬区', 4),
(1947, 231, '邗江区', 4),
(1948, 231, '仪征市', 4),
(1949, 231, '高邮市', 4),
(1950, 231, '江都市', 4),
(1951, 231, '宝应县', 4),
(1952, 232, '京口区', 4),
(1953, 232, '润州区', 4),
(1954, 232, '丹徒区', 4),
(1955, 232, '丹阳市', 4),
(1956, 232, '扬中市', 4),
(1957, 232, '句容市', 4),
(1958, 233, '东湖区', 4),
(1959, 233, '西湖区', 4),
(1960, 233, '青云谱区', 4),
(1961, 233, '湾里区', 4),
(1962, 233, '青山湖区', 4),
(1963, 233, '红谷滩新区', 4);
INSERT INTO `fanwe_delivery_region` (`id`, `pid`, `name`, `region_level`) VALUES
(1964, 233, '昌北区', 4),
(1965, 233, '高新区', 4),
(1966, 233, '南昌县', 4),
(1967, 233, '新建县', 4),
(1968, 233, '安义县', 4),
(1969, 233, '进贤县', 4),
(1970, 234, '临川区', 4),
(1971, 234, '南城县', 4),
(1972, 234, '黎川县', 4),
(1973, 234, '南丰县', 4),
(1974, 234, '崇仁县', 4),
(1975, 234, '乐安县', 4),
(1976, 234, '宜黄县', 4),
(1977, 234, '金溪县', 4),
(1978, 234, '资溪县', 4),
(1979, 234, '东乡县', 4),
(1980, 234, '广昌县', 4),
(1981, 235, '章贡区', 4),
(1982, 235, '于都县', 4),
(1983, 235, '瑞金市', 4),
(1984, 235, '南康市', 4),
(1985, 235, '赣县', 4),
(1986, 235, '信丰县', 4),
(1987, 235, '大余县', 4),
(1988, 235, '上犹县', 4),
(1989, 235, '崇义县', 4),
(1990, 235, '安远县', 4),
(1991, 235, '龙南县', 4),
(1992, 235, '定南县', 4),
(1993, 235, '全南县', 4),
(1994, 235, '宁都县', 4),
(1995, 235, '兴国县', 4),
(1996, 235, '会昌县', 4),
(1997, 235, '寻乌县', 4),
(1998, 235, '石城县', 4),
(1999, 236, '安福县', 4),
(2000, 236, '吉州区', 4),
(2001, 236, '青原区', 4),
(2002, 236, '井冈山市', 4),
(2003, 236, '吉安县', 4),
(2004, 236, '吉水县', 4),
(2005, 236, '峡江县', 4),
(2006, 236, '新干县', 4),
(2007, 236, '永丰县', 4),
(2008, 236, '泰和县', 4),
(2009, 236, '遂川县', 4),
(2010, 236, '万安县', 4),
(2011, 236, '永新县', 4),
(2012, 237, '珠山区', 4),
(2013, 237, '昌江区', 4),
(2014, 237, '乐平市', 4),
(2015, 237, '浮梁县', 4),
(2016, 238, '浔阳区', 4),
(2017, 238, '庐山区', 4),
(2018, 238, '瑞昌市', 4),
(2019, 238, '九江县', 4),
(2020, 238, '武宁县', 4),
(2021, 238, '修水县', 4),
(2022, 238, '永修县', 4),
(2023, 238, '德安县', 4),
(2024, 238, '星子县', 4),
(2025, 238, '都昌县', 4),
(2026, 238, '湖口县', 4),
(2027, 238, '彭泽县', 4),
(2028, 239, '安源区', 4),
(2029, 239, '湘东区', 4),
(2030, 239, '莲花县', 4),
(2031, 239, '芦溪县', 4),
(2032, 239, '上栗县', 4),
(2033, 240, '信州区', 4),
(2034, 240, '德兴市', 4),
(2035, 240, '上饶县', 4),
(2036, 240, '广丰县', 4),
(2037, 240, '玉山县', 4),
(2038, 240, '铅山县', 4),
(2039, 240, '横峰县', 4),
(2040, 240, '弋阳县', 4),
(2041, 240, '余干县', 4),
(2042, 240, '波阳县', 4),
(2043, 240, '万年县', 4),
(2044, 240, '婺源县', 4),
(2045, 241, '渝水区', 4),
(2046, 241, '分宜县', 4),
(2047, 242, '袁州区', 4),
(2048, 242, '丰城市', 4),
(2049, 242, '樟树市', 4),
(2050, 242, '高安市', 4),
(2051, 242, '奉新县', 4),
(2052, 242, '万载县', 4),
(2053, 242, '上高县', 4),
(2054, 242, '宜丰县', 4),
(2055, 242, '靖安县', 4),
(2056, 242, '铜鼓县', 4),
(2057, 243, '月湖区', 4),
(2058, 243, '贵溪市', 4),
(2059, 243, '余江县', 4),
(2060, 244, '沈河区', 4),
(2061, 244, '皇姑区', 4),
(2062, 244, '和平区', 4),
(2063, 244, '大东区', 4),
(2064, 244, '铁西区', 4),
(2065, 244, '苏家屯区', 4),
(2066, 244, '东陵区', 4),
(2067, 244, '沈北新区', 4),
(2068, 244, '于洪区', 4),
(2069, 244, '浑南新区', 4),
(2070, 244, '新民市', 4),
(2071, 244, '辽中县', 4),
(2072, 244, '康平县', 4),
(2073, 244, '法库县', 4),
(2074, 245, '西岗区', 4),
(2075, 245, '中山区', 4),
(2076, 245, '沙河口区', 4),
(2077, 245, '甘井子区', 4),
(2078, 245, '旅顺口区', 4),
(2079, 245, '金州区', 4),
(2080, 245, '开发区', 4),
(2081, 245, '瓦房店市', 4),
(2082, 245, '普兰店市', 4),
(2083, 245, '庄河市', 4),
(2084, 245, '长海县', 4),
(2085, 246, '铁东区', 4),
(2086, 246, '铁西区', 4),
(2087, 246, '立山区', 4),
(2088, 246, '千山区', 4),
(2089, 246, '岫岩', 4),
(2090, 246, '海城市', 4),
(2091, 246, '台安县', 4),
(2092, 247, '本溪', 4),
(2093, 247, '平山区', 4),
(2094, 247, '明山区', 4),
(2095, 247, '溪湖区', 4),
(2096, 247, '南芬区', 4),
(2097, 247, '桓仁', 4),
(2098, 248, '双塔区', 4),
(2099, 248, '龙城区', 4),
(2100, 248, '喀喇沁左翼蒙古族自治', 4),
(2101, 248, '北票市', 4),
(2102, 248, '凌源市', 4),
(2103, 248, '朝阳县', 4),
(2104, 248, '建平县', 4),
(2105, 249, '振兴区', 4),
(2106, 249, '元宝区', 4),
(2107, 249, '振安区', 4),
(2108, 249, '宽甸', 4),
(2109, 249, '东港市', 4),
(2110, 249, '凤城市', 4),
(2111, 250, '顺城区', 4),
(2112, 250, '新抚区', 4),
(2113, 250, '东洲区', 4),
(2114, 250, '望花区', 4),
(2115, 250, '清原', 4),
(2116, 250, '新宾', 4),
(2117, 250, '抚顺县', 4),
(2118, 251, '阜新', 4),
(2119, 251, '海州区', 4),
(2120, 251, '新邱区', 4),
(2121, 251, '太平区', 4),
(2122, 251, '清河门区', 4),
(2123, 251, '细河区', 4),
(2124, 251, '彰武县', 4),
(2125, 252, '龙港区', 4),
(2126, 252, '南票区', 4),
(2127, 252, '连山区', 4),
(2128, 252, '兴城市', 4),
(2129, 252, '绥中县', 4),
(2130, 252, '建昌县', 4),
(2131, 253, '太和区', 4),
(2132, 253, '古塔区', 4),
(2133, 253, '凌河区', 4),
(2134, 253, '凌海市', 4),
(2135, 253, '北镇市', 4),
(2136, 253, '黑山县', 4),
(2137, 253, '义县', 4),
(2138, 254, '白塔区', 4),
(2139, 254, '文圣区', 4),
(2140, 254, '宏伟区', 4),
(2141, 254, '太子河区', 4),
(2142, 254, '弓长岭区', 4),
(2143, 254, '灯塔市', 4),
(2144, 254, '辽阳县', 4),
(2145, 255, '双台子区', 4),
(2146, 255, '兴隆台区', 4),
(2147, 255, '大洼县', 4),
(2148, 255, '盘山县', 4),
(2149, 256, '银州区', 4),
(2150, 256, '清河区', 4),
(2151, 256, '调兵山市', 4),
(2152, 256, '开原市', 4),
(2153, 256, '铁岭县', 4),
(2154, 256, '西丰县', 4),
(2155, 256, '昌图县', 4),
(2156, 257, '站前区', 4),
(2157, 257, '西市区', 4),
(2158, 257, '鲅鱼圈区', 4),
(2159, 257, '老边区', 4),
(2160, 257, '盖州市', 4),
(2161, 257, '大石桥市', 4),
(2162, 258, '回民区', 4),
(2163, 258, '玉泉区', 4),
(2164, 258, '新城区', 4),
(2165, 258, '赛罕区', 4),
(2166, 258, '清水河县', 4),
(2167, 258, '土默特左旗', 4),
(2168, 258, '托克托县', 4),
(2169, 258, '和林格尔县', 4),
(2170, 258, '武川县', 4),
(2171, 259, '阿拉善左旗', 4),
(2172, 259, '阿拉善右旗', 4),
(2173, 259, '额济纳旗', 4),
(2174, 260, '临河区', 4),
(2175, 260, '五原县', 4),
(2176, 260, '磴口县', 4),
(2177, 260, '乌拉特前旗', 4),
(2178, 260, '乌拉特中旗', 4),
(2179, 260, '乌拉特后旗', 4),
(2180, 260, '杭锦后旗', 4),
(2181, 261, '昆都仑区', 4),
(2182, 261, '青山区', 4),
(2183, 261, '东河区', 4),
(2184, 261, '九原区', 4),
(2185, 261, '石拐区', 4),
(2186, 261, '白云矿区', 4),
(2187, 261, '土默特右旗', 4),
(2188, 261, '固阳县', 4),
(2189, 261, '达尔罕茂明安联合旗', 4),
(2190, 262, '红山区', 4),
(2191, 262, '元宝山区', 4),
(2192, 262, '松山区', 4),
(2193, 262, '阿鲁科尔沁旗', 4),
(2194, 262, '巴林左旗', 4),
(2195, 262, '巴林右旗', 4),
(2196, 262, '林西县', 4),
(2197, 262, '克什克腾旗', 4),
(2198, 262, '翁牛特旗', 4),
(2199, 262, '喀喇沁旗', 4),
(2200, 262, '宁城县', 4),
(2201, 262, '敖汉旗', 4),
(2202, 263, '东胜区', 4),
(2203, 263, '达拉特旗', 4),
(2204, 263, '准格尔旗', 4),
(2205, 263, '鄂托克前旗', 4),
(2206, 263, '鄂托克旗', 4),
(2207, 263, '杭锦旗', 4),
(2208, 263, '乌审旗', 4),
(2209, 263, '伊金霍洛旗', 4),
(2210, 264, '海拉尔区', 4),
(2211, 264, '莫力达瓦', 4),
(2212, 264, '满洲里市', 4),
(2213, 264, '牙克石市', 4),
(2214, 264, '扎兰屯市', 4),
(2215, 264, '额尔古纳市', 4),
(2216, 264, '根河市', 4),
(2217, 264, '阿荣旗', 4),
(2218, 264, '鄂伦春自治旗', 4),
(2219, 264, '鄂温克族自治旗', 4),
(2220, 264, '陈巴尔虎旗', 4),
(2221, 264, '新巴尔虎左旗', 4),
(2222, 264, '新巴尔虎右旗', 4),
(2223, 265, '科尔沁区', 4),
(2224, 265, '霍林郭勒市', 4),
(2225, 265, '科尔沁左翼中旗', 4),
(2226, 265, '科尔沁左翼后旗', 4),
(2227, 265, '开鲁县', 4),
(2228, 265, '库伦旗', 4),
(2229, 265, '奈曼旗', 4),
(2230, 265, '扎鲁特旗', 4),
(2231, 266, '海勃湾区', 4),
(2232, 266, '乌达区', 4),
(2233, 266, '海南区', 4),
(2234, 267, '化德县', 4),
(2235, 267, '集宁区', 4),
(2236, 267, '丰镇市', 4),
(2237, 267, '卓资县', 4),
(2238, 267, '商都县', 4),
(2239, 267, '兴和县', 4),
(2240, 267, '凉城县', 4),
(2241, 267, '察哈尔右翼前旗', 4),
(2242, 267, '察哈尔右翼中旗', 4),
(2243, 267, '察哈尔右翼后旗', 4),
(2244, 267, '四子王旗', 4),
(2245, 268, '二连浩特市', 4),
(2246, 268, '锡林浩特市', 4),
(2247, 268, '阿巴嘎旗', 4),
(2248, 268, '苏尼特左旗', 4),
(2249, 268, '苏尼特右旗', 4),
(2250, 268, '东乌珠穆沁旗', 4),
(2251, 268, '西乌珠穆沁旗', 4),
(2252, 268, '太仆寺旗', 4),
(2253, 268, '镶黄旗', 4),
(2254, 268, '正镶白旗', 4),
(2255, 268, '正蓝旗', 4),
(2256, 268, '多伦县', 4),
(2257, 269, '乌兰浩特市', 4),
(2258, 269, '阿尔山市', 4),
(2259, 269, '科尔沁右翼前旗', 4),
(2260, 269, '科尔沁右翼中旗', 4),
(2261, 269, '扎赉特旗', 4),
(2262, 269, '突泉县', 4),
(2263, 270, '西夏区', 4),
(2264, 270, '金凤区', 4),
(2265, 270, '兴庆区', 4),
(2266, 270, '灵武市', 4),
(2267, 270, '永宁县', 4),
(2268, 270, '贺兰县', 4),
(2269, 271, '原州区', 4),
(2270, 271, '海原县', 4),
(2271, 271, '西吉县', 4),
(2272, 271, '隆德县', 4),
(2273, 271, '泾源县', 4),
(2274, 271, '彭阳县', 4),
(2275, 272, '惠农县', 4),
(2276, 272, '大武口区', 4),
(2277, 272, '惠农区', 4),
(2278, 272, '陶乐县', 4),
(2279, 272, '平罗县', 4),
(2280, 273, '利通区', 4),
(2281, 273, '中卫县', 4),
(2282, 273, '青铜峡市', 4),
(2283, 273, '中宁县', 4),
(2284, 273, '盐池县', 4),
(2285, 273, '同心县', 4),
(2286, 274, '沙坡头区', 4),
(2287, 274, '海原县', 4),
(2288, 274, '中宁县', 4),
(2289, 275, '城中区', 4),
(2290, 275, '城东区', 4),
(2291, 275, '城西区', 4),
(2292, 275, '城北区', 4),
(2293, 275, '湟中县', 4),
(2294, 275, '湟源县', 4),
(2295, 275, '大通', 4),
(2296, 276, '玛沁县', 4),
(2297, 276, '班玛县', 4),
(2298, 276, '甘德县', 4),
(2299, 276, '达日县', 4),
(2300, 276, '久治县', 4),
(2301, 276, '玛多县', 4),
(2302, 277, '海晏县', 4),
(2303, 277, '祁连县', 4),
(2304, 277, '刚察县', 4),
(2305, 277, '门源', 4),
(2306, 278, '平安县', 4),
(2307, 278, '乐都县', 4),
(2308, 278, '民和', 4),
(2309, 278, '互助', 4),
(2310, 278, '化隆', 4),
(2311, 278, '循化', 4),
(2312, 279, '共和县', 4),
(2313, 279, '同德县', 4),
(2314, 279, '贵德县', 4),
(2315, 279, '兴海县', 4),
(2316, 279, '贵南县', 4),
(2317, 280, '德令哈市', 4),
(2318, 280, '格尔木市', 4),
(2319, 280, '乌兰县', 4),
(2320, 280, '都兰县', 4),
(2321, 280, '天峻县', 4),
(2322, 281, '同仁县', 4),
(2323, 281, '尖扎县', 4),
(2324, 281, '泽库县', 4),
(2325, 281, '河南蒙古族自治县', 4),
(2326, 282, '玉树县', 4),
(2327, 282, '杂多县', 4),
(2328, 282, '称多县', 4),
(2329, 282, '治多县', 4),
(2330, 282, '囊谦县', 4),
(2331, 282, '曲麻莱县', 4),
(2332, 283, '市中区', 4),
(2333, 283, '历下区', 4),
(2334, 283, '天桥区', 4),
(2335, 283, '槐荫区', 4),
(2336, 283, '历城区', 4),
(2337, 283, '长清区', 4),
(2338, 283, '章丘市', 4),
(2339, 283, '平阴县', 4),
(2340, 283, '济阳县', 4),
(2341, 283, '商河县', 4),
(2342, 284, '市南区', 4),
(2343, 284, '市北区', 4),
(2344, 284, '城阳区', 4),
(2345, 284, '四方区', 4),
(2346, 284, '李沧区', 4),
(2347, 284, '黄岛区', 4),
(2348, 284, '崂山区', 4),
(2349, 284, '胶州市', 4),
(2350, 284, '即墨市', 4),
(2351, 284, '平度市', 4),
(2352, 284, '胶南市', 4),
(2353, 284, '莱西市', 4),
(2354, 285, '滨城区', 4),
(2355, 285, '惠民县', 4),
(2356, 285, '阳信县', 4),
(2357, 285, '无棣县', 4),
(2358, 285, '沾化县', 4),
(2359, 285, '博兴县', 4),
(2360, 285, '邹平县', 4),
(2361, 286, '德城区', 4),
(2362, 286, '陵县', 4),
(2363, 286, '乐陵市', 4),
(2364, 286, '禹城市', 4),
(2365, 286, '宁津县', 4),
(2366, 286, '庆云县', 4),
(2367, 286, '临邑县', 4),
(2368, 286, '齐河县', 4),
(2369, 286, '平原县', 4),
(2370, 286, '夏津县', 4),
(2371, 286, '武城县', 4),
(2372, 287, '东营区', 4),
(2373, 287, '河口区', 4),
(2374, 287, '垦利县', 4),
(2375, 287, '利津县', 4),
(2376, 287, '广饶县', 4),
(2377, 288, '牡丹区', 4),
(2378, 288, '曹县', 4),
(2379, 288, '单县', 4),
(2380, 288, '成武县', 4),
(2381, 288, '巨野县', 4),
(2382, 288, '郓城县', 4),
(2383, 288, '鄄城县', 4),
(2384, 288, '定陶县', 4),
(2385, 288, '东明县', 4),
(2386, 289, '市中区', 4),
(2387, 289, '任城区', 4),
(2388, 289, '曲阜市', 4),
(2389, 289, '兖州市', 4),
(2390, 289, '邹城市', 4),
(2391, 289, '微山县', 4),
(2392, 289, '鱼台县', 4),
(2393, 289, '金乡县', 4),
(2394, 289, '嘉祥县', 4),
(2395, 289, '汶上县', 4),
(2396, 289, '泗水县', 4),
(2397, 289, '梁山县', 4),
(2398, 290, '莱城区', 4),
(2399, 290, '钢城区', 4),
(2400, 291, '东昌府区', 4),
(2401, 291, '临清市', 4),
(2402, 291, '阳谷县', 4),
(2403, 291, '莘县', 4),
(2404, 291, '茌平县', 4),
(2405, 291, '东阿县', 4),
(2406, 291, '冠县', 4),
(2407, 291, '高唐县', 4),
(2408, 292, '兰山区', 4),
(2409, 292, '罗庄区', 4),
(2410, 292, '河东区', 4),
(2411, 292, '沂南县', 4),
(2412, 292, '郯城县', 4),
(2413, 292, '沂水县', 4),
(2414, 292, '苍山县', 4),
(2415, 292, '费县', 4),
(2416, 292, '平邑县', 4),
(2417, 292, '莒南县', 4),
(2418, 292, '蒙阴县', 4),
(2419, 292, '临沭县', 4),
(2420, 293, '东港区', 4),
(2421, 293, '岚山区', 4),
(2422, 293, '五莲县', 4),
(2423, 293, '莒县', 4),
(2424, 294, '泰山区', 4),
(2425, 294, '岱岳区', 4),
(2426, 294, '新泰市', 4),
(2427, 294, '肥城市', 4),
(2428, 294, '宁阳县', 4),
(2429, 294, '东平县', 4),
(2430, 295, '荣成市', 4),
(2431, 295, '乳山市', 4),
(2432, 295, '环翠区', 4),
(2433, 295, '文登市', 4),
(2434, 296, '潍城区', 4),
(2435, 296, '寒亭区', 4),
(2436, 296, '坊子区', 4),
(2437, 296, '奎文区', 4),
(2438, 296, '青州市', 4),
(2439, 296, '诸城市', 4),
(2440, 296, '寿光市', 4),
(2441, 296, '安丘市', 4),
(2442, 296, '高密市', 4),
(2443, 296, '昌邑市', 4),
(2444, 296, '临朐县', 4),
(2445, 296, '昌乐县', 4),
(2446, 297, '芝罘区', 4),
(2447, 297, '福山区', 4),
(2448, 297, '牟平区', 4),
(2449, 297, '莱山区', 4),
(2450, 297, '开发区', 4),
(2451, 297, '龙口市', 4),
(2452, 297, '莱阳市', 4),
(2453, 297, '莱州市', 4),
(2454, 297, '蓬莱市', 4),
(2455, 297, '招远市', 4),
(2456, 297, '栖霞市', 4),
(2457, 297, '海阳市', 4),
(2458, 297, '长岛县', 4),
(2459, 298, '市中区', 4),
(2460, 298, '山亭区', 4),
(2461, 298, '峄城区', 4),
(2462, 298, '台儿庄区', 4),
(2463, 298, '薛城区', 4),
(2464, 298, '滕州市', 4),
(2465, 299, '张店区', 4),
(2466, 299, '临淄区', 4),
(2467, 299, '淄川区', 4),
(2468, 299, '博山区', 4),
(2469, 299, '周村区', 4),
(2470, 299, '桓台县', 4),
(2471, 299, '高青县', 4),
(2472, 299, '沂源县', 4),
(2473, 300, '杏花岭区', 4),
(2474, 300, '小店区', 4),
(2475, 300, '迎泽区', 4),
(2476, 300, '尖草坪区', 4),
(2477, 300, '万柏林区', 4),
(2478, 300, '晋源区', 4),
(2479, 300, '高新开发区', 4),
(2480, 300, '民营经济开发区', 4),
(2481, 300, '经济技术开发区', 4),
(2482, 300, '清徐县', 4),
(2483, 300, '阳曲县', 4),
(2484, 300, '娄烦县', 4),
(2485, 300, '古交市', 4),
(2486, 301, '城区', 4),
(2487, 301, '郊区', 4),
(2488, 301, '沁县', 4),
(2489, 301, '潞城市', 4),
(2490, 301, '长治县', 4),
(2491, 301, '襄垣县', 4),
(2492, 301, '屯留县', 4),
(2493, 301, '平顺县', 4),
(2494, 301, '黎城县', 4),
(2495, 301, '壶关县', 4),
(2496, 301, '长子县', 4),
(2497, 301, '武乡县', 4),
(2498, 301, '沁源县', 4),
(2499, 302, '城区', 4),
(2500, 302, '矿区', 4),
(2501, 302, '南郊区', 4),
(2502, 302, '新荣区', 4),
(2503, 302, '阳高县', 4),
(2504, 302, '天镇县', 4),
(2505, 302, '广灵县', 4),
(2506, 302, '灵丘县', 4),
(2507, 302, '浑源县', 4),
(2508, 302, '左云县', 4),
(2509, 302, '大同县', 4),
(2510, 303, '城区', 4),
(2511, 303, '高平市', 4),
(2512, 303, '沁水县', 4),
(2513, 303, '阳城县', 4),
(2514, 303, '陵川县', 4),
(2515, 303, '泽州县', 4),
(2516, 304, '榆次区', 4),
(2517, 304, '介休市', 4),
(2518, 304, '榆社县', 4),
(2519, 304, '左权县', 4),
(2520, 304, '和顺县', 4),
(2521, 304, '昔阳县', 4),
(2522, 304, '寿阳县', 4),
(2523, 304, '太谷县', 4),
(2524, 304, '祁县', 4),
(2525, 304, '平遥县', 4),
(2526, 304, '灵石县', 4),
(2527, 305, '尧都区', 4),
(2528, 305, '侯马市', 4),
(2529, 305, '霍州市', 4),
(2530, 305, '曲沃县', 4),
(2531, 305, '翼城县', 4),
(2532, 305, '襄汾县', 4),
(2533, 305, '洪洞县', 4),
(2534, 305, '吉县', 4),
(2535, 305, '安泽县', 4),
(2536, 305, '浮山县', 4),
(2537, 305, '古县', 4),
(2538, 305, '乡宁县', 4),
(2539, 305, '大宁县', 4),
(2540, 305, '隰县', 4),
(2541, 305, '永和县', 4),
(2542, 305, '蒲县', 4),
(2543, 305, '汾西县', 4),
(2544, 306, '离石市', 4),
(2545, 306, '离石区', 4),
(2546, 306, '孝义市', 4),
(2547, 306, '汾阳市', 4),
(2548, 306, '文水县', 4),
(2549, 306, '交城县', 4),
(2550, 306, '兴县', 4),
(2551, 306, '临县', 4),
(2552, 306, '柳林县', 4),
(2553, 306, '石楼县', 4),
(2554, 306, '岚县', 4),
(2555, 306, '方山县', 4),
(2556, 306, '中阳县', 4),
(2557, 306, '交口县', 4),
(2558, 307, '朔城区', 4),
(2559, 307, '平鲁区', 4),
(2560, 307, '山阴县', 4),
(2561, 307, '应县', 4),
(2562, 307, '右玉县', 4),
(2563, 307, '怀仁县', 4),
(2564, 308, '忻府区', 4),
(2565, 308, '原平市', 4),
(2566, 308, '定襄县', 4),
(2567, 308, '五台县', 4),
(2568, 308, '代县', 4),
(2569, 308, '繁峙县', 4),
(2570, 308, '宁武县', 4),
(2571, 308, '静乐县', 4),
(2572, 308, '神池县', 4),
(2573, 308, '五寨县', 4),
(2574, 308, '岢岚县', 4),
(2575, 308, '河曲县', 4),
(2576, 308, '保德县', 4),
(2577, 308, '偏关县', 4),
(2578, 309, '城区', 4),
(2579, 309, '矿区', 4),
(2580, 309, '郊区', 4),
(2581, 309, '平定县', 4),
(2582, 309, '盂县', 4),
(2583, 310, '盐湖区', 4),
(2584, 310, '永济市', 4),
(2585, 310, '河津市', 4),
(2586, 310, '临猗县', 4),
(2587, 310, '万荣县', 4),
(2588, 310, '闻喜县', 4),
(2589, 310, '稷山县', 4),
(2590, 310, '新绛县', 4),
(2591, 310, '绛县', 4),
(2592, 310, '垣曲县', 4),
(2593, 310, '夏县', 4),
(2594, 310, '平陆县', 4),
(2595, 310, '芮城县', 4),
(2596, 311, '莲湖区', 4),
(2597, 311, '新城区', 4),
(2598, 311, '碑林区', 4),
(2599, 311, '雁塔区', 4),
(2600, 311, '灞桥区', 4),
(2601, 311, '未央区', 4),
(2602, 311, '阎良区', 4),
(2603, 311, '临潼区', 4),
(2604, 311, '长安区', 4),
(2605, 311, '蓝田县', 4),
(2606, 311, '周至县', 4),
(2607, 311, '户县', 4),
(2608, 311, '高陵县', 4),
(2609, 312, '汉滨区', 4),
(2610, 312, '汉阴县', 4),
(2611, 312, '石泉县', 4),
(2612, 312, '宁陕县', 4),
(2613, 312, '紫阳县', 4),
(2614, 312, '岚皋县', 4),
(2615, 312, '平利县', 4),
(2616, 312, '镇坪县', 4),
(2617, 312, '旬阳县', 4),
(2618, 312, '白河县', 4),
(2619, 313, '陈仓区', 4),
(2620, 313, '渭滨区', 4),
(2621, 313, '金台区', 4),
(2622, 313, '凤翔县', 4),
(2623, 313, '岐山县', 4),
(2624, 313, '扶风县', 4),
(2625, 313, '眉县', 4),
(2626, 313, '陇县', 4),
(2627, 313, '千阳县', 4),
(2628, 313, '麟游县', 4),
(2629, 313, '凤县', 4),
(2630, 313, '太白县', 4),
(2631, 314, '汉台区', 4),
(2632, 314, '南郑县', 4),
(2633, 314, '城固县', 4),
(2634, 314, '洋县', 4),
(2635, 314, '西乡县', 4),
(2636, 314, '勉县', 4),
(2637, 314, '宁强县', 4),
(2638, 314, '略阳县', 4),
(2639, 314, '镇巴县', 4),
(2640, 314, '留坝县', 4),
(2641, 314, '佛坪县', 4),
(2642, 315, '商州区', 4),
(2643, 315, '洛南县', 4),
(2644, 315, '丹凤县', 4),
(2645, 315, '商南县', 4),
(2646, 315, '山阳县', 4),
(2647, 315, '镇安县', 4),
(2648, 315, '柞水县', 4),
(2649, 316, '耀州区', 4),
(2650, 316, '王益区', 4),
(2651, 316, '印台区', 4),
(2652, 316, '宜君县', 4),
(2653, 317, '临渭区', 4),
(2654, 317, '韩城市', 4),
(2655, 317, '华阴市', 4),
(2656, 317, '华县', 4),
(2657, 317, '潼关县', 4),
(2658, 317, '大荔县', 4),
(2659, 317, '合阳县', 4),
(2660, 317, '澄城县', 4),
(2661, 317, '蒲城县', 4),
(2662, 317, '白水县', 4),
(2663, 317, '富平县', 4),
(2664, 318, '秦都区', 4),
(2665, 318, '渭城区', 4),
(2666, 318, '杨陵区', 4),
(2667, 318, '兴平市', 4),
(2668, 318, '三原县', 4),
(2669, 318, '泾阳县', 4),
(2670, 318, '乾县', 4),
(2671, 318, '礼泉县', 4),
(2672, 318, '永寿县', 4),
(2673, 318, '彬县', 4),
(2674, 318, '长武县', 4),
(2675, 318, '旬邑县', 4),
(2676, 318, '淳化县', 4),
(2677, 318, '武功县', 4),
(2678, 319, '吴起县', 4),
(2679, 319, '宝塔区', 4),
(2680, 319, '延长县', 4),
(2681, 319, '延川县', 4),
(2682, 319, '子长县', 4),
(2683, 319, '安塞县', 4),
(2684, 319, '志丹县', 4),
(2685, 319, '甘泉县', 4),
(2686, 319, '富县', 4),
(2687, 319, '洛川县', 4),
(2688, 319, '宜川县', 4),
(2689, 319, '黄龙县', 4),
(2690, 319, '黄陵县', 4),
(2691, 320, '榆阳区', 4),
(2692, 320, '神木县', 4),
(2693, 320, '府谷县', 4),
(2694, 320, '横山县', 4),
(2695, 320, '靖边县', 4),
(2696, 320, '定边县', 4),
(2697, 320, '绥德县', 4),
(2698, 320, '米脂县', 4),
(2699, 320, '佳县', 4),
(2700, 320, '吴堡县', 4),
(2701, 320, '清涧县', 4),
(2702, 320, '子洲县', 4),
(2703, 321, '长宁区', 4),
(2704, 321, '闸北区', 4),
(2705, 321, '闵行区', 4),
(2706, 321, '徐汇区', 4),
(2707, 321, '浦东新区', 4),
(2708, 321, '杨浦区', 4),
(2709, 321, '普陀区', 4),
(2710, 321, '静安区', 4),
(2711, 321, '卢湾区', 4),
(2712, 321, '虹口区', 4),
(2713, 321, '黄浦区', 4),
(2714, 321, '南汇区', 4),
(2715, 321, '松江区', 4),
(2716, 321, '嘉定区', 4),
(2717, 321, '宝山区', 4),
(2718, 321, '青浦区', 4),
(2719, 321, '金山区', 4),
(2720, 321, '奉贤区', 4),
(2721, 321, '崇明县', 4),
(2722, 322, '青羊区', 4),
(2723, 322, '锦江区', 4),
(2724, 322, '金牛区', 4),
(2725, 322, '武侯区', 4),
(2726, 322, '成华区', 4),
(2727, 322, '龙泉驿区', 4),
(2728, 322, '青白江区', 4),
(2729, 322, '新都区', 4),
(2730, 322, '温江区', 4),
(2731, 322, '高新区', 4),
(2732, 322, '高新西区', 4),
(2733, 322, '都江堰市', 4),
(2734, 322, '彭州市', 4),
(2735, 322, '邛崃市', 4),
(2736, 322, '崇州市', 4),
(2737, 322, '金堂县', 4),
(2738, 322, '双流县', 4),
(2739, 322, '郫县', 4),
(2740, 322, '大邑县', 4),
(2741, 322, '蒲江县', 4),
(2742, 322, '新津县', 4),
(2743, 322, '都江堰市', 4),
(2744, 322, '彭州市', 4),
(2745, 322, '邛崃市', 4),
(2746, 322, '崇州市', 4),
(2747, 322, '金堂县', 4),
(2748, 322, '双流县', 4),
(2749, 322, '郫县', 4),
(2750, 322, '大邑县', 4),
(2751, 322, '蒲江县', 4),
(2752, 322, '新津县', 4),
(2753, 323, '涪城区', 4),
(2754, 323, '游仙区', 4),
(2755, 323, '江油市', 4),
(2756, 323, '盐亭县', 4),
(2757, 323, '三台县', 4),
(2758, 323, '平武县', 4),
(2759, 323, '安县', 4),
(2760, 323, '梓潼县', 4),
(2761, 323, '北川县', 4),
(2762, 324, '马尔康县', 4),
(2763, 324, '汶川县', 4),
(2764, 324, '理县', 4),
(2765, 324, '茂县', 4),
(2766, 324, '松潘县', 4),
(2767, 324, '九寨沟县', 4),
(2768, 324, '金川县', 4),
(2769, 324, '小金县', 4),
(2770, 324, '黑水县', 4),
(2771, 324, '壤塘县', 4),
(2772, 324, '阿坝县', 4),
(2773, 324, '若尔盖县', 4),
(2774, 324, '红原县', 4),
(2775, 325, '巴州区', 4),
(2776, 325, '通江县', 4),
(2777, 325, '南江县', 4),
(2778, 325, '平昌县', 4),
(2779, 326, '通川区', 4),
(2780, 326, '万源市', 4),
(2781, 326, '达县', 4),
(2782, 326, '宣汉县', 4),
(2783, 326, '开江县', 4),
(2784, 326, '大竹县', 4),
(2785, 326, '渠县', 4),
(2786, 327, '旌阳区', 4),
(2787, 327, '广汉市', 4),
(2788, 327, '什邡市', 4),
(2789, 327, '绵竹市', 4),
(2790, 327, '罗江县', 4),
(2791, 327, '中江县', 4),
(2792, 328, '康定县', 4),
(2793, 328, '丹巴县', 4),
(2794, 328, '泸定县', 4),
(2795, 328, '炉霍县', 4),
(2796, 328, '九龙县', 4),
(2797, 328, '甘孜县', 4),
(2798, 328, '雅江县', 4),
(2799, 328, '新龙县', 4),
(2800, 328, '道孚县', 4),
(2801, 328, '白玉县', 4),
(2802, 328, '理塘县', 4),
(2803, 328, '德格县', 4),
(2804, 328, '乡城县', 4),
(2805, 328, '石渠县', 4),
(2806, 328, '稻城县', 4),
(2807, 328, '色达县', 4),
(2808, 328, '巴塘县', 4),
(2809, 328, '得荣县', 4),
(2810, 329, '广安区', 4),
(2811, 329, '华蓥市', 4),
(2812, 329, '岳池县', 4),
(2813, 329, '武胜县', 4),
(2814, 329, '邻水县', 4),
(2815, 330, '利州区', 4),
(2816, 330, '元坝区', 4),
(2817, 330, '朝天区', 4),
(2818, 330, '旺苍县', 4),
(2819, 330, '青川县', 4),
(2820, 330, '剑阁县', 4),
(2821, 330, '苍溪县', 4),
(2822, 331, '峨眉山市', 4),
(2823, 331, '乐山市', 4),
(2824, 331, '犍为县', 4),
(2825, 331, '井研县', 4),
(2826, 331, '夹江县', 4),
(2827, 331, '沐川县', 4),
(2828, 331, '峨边', 4),
(2829, 331, '马边', 4),
(2830, 332, '西昌市', 4),
(2831, 332, '盐源县', 4),
(2832, 332, '德昌县', 4),
(2833, 332, '会理县', 4),
(2834, 332, '会东县', 4),
(2835, 332, '宁南县', 4),
(2836, 332, '普格县', 4),
(2837, 332, '布拖县', 4),
(2838, 332, '金阳县', 4),
(2839, 332, '昭觉县', 4),
(2840, 332, '喜德县', 4),
(2841, 332, '冕宁县', 4),
(2842, 332, '越西县', 4),
(2843, 332, '甘洛县', 4),
(2844, 332, '美姑县', 4),
(2845, 332, '雷波县', 4),
(2846, 332, '木里', 4),
(2847, 333, '东坡区', 4),
(2848, 333, '仁寿县', 4),
(2849, 333, '彭山县', 4),
(2850, 333, '洪雅县', 4),
(2851, 333, '丹棱县', 4),
(2852, 333, '青神县', 4),
(2853, 334, '阆中市', 4),
(2854, 334, '南部县', 4),
(2855, 334, '营山县', 4),
(2856, 334, '蓬安县', 4),
(2857, 334, '仪陇县', 4),
(2858, 334, '顺庆区', 4),
(2859, 334, '高坪区', 4),
(2860, 334, '嘉陵区', 4),
(2861, 334, '西充县', 4),
(2862, 335, '市中区', 4),
(2863, 335, '东兴区', 4),
(2864, 335, '威远县', 4),
(2865, 335, '资中县', 4),
(2866, 335, '隆昌县', 4),
(2867, 336, '东  区', 4),
(2868, 336, '西  区', 4),
(2869, 336, '仁和区', 4),
(2870, 336, '米易县', 4),
(2871, 336, '盐边县', 4),
(2872, 337, '船山区', 4),
(2873, 337, '安居区', 4),
(2874, 337, '蓬溪县', 4),
(2875, 337, '射洪县', 4),
(2876, 337, '大英县', 4),
(2877, 338, '雨城区', 4),
(2878, 338, '名山县', 4),
(2879, 338, '荥经县', 4),
(2880, 338, '汉源县', 4),
(2881, 338, '石棉县', 4),
(2882, 338, '天全县', 4),
(2883, 338, '芦山县', 4),
(2884, 338, '宝兴县', 4),
(2885, 339, '翠屏区', 4),
(2886, 339, '宜宾县', 4),
(2887, 339, '南溪县', 4),
(2888, 339, '江安县', 4),
(2889, 339, '长宁县', 4),
(2890, 339, '高县', 4),
(2891, 339, '珙县', 4),
(2892, 339, '筠连县', 4),
(2893, 339, '兴文县', 4),
(2894, 339, '屏山县', 4),
(2895, 340, '雁江区', 4),
(2896, 340, '简阳市', 4),
(2897, 340, '安岳县', 4),
(2898, 340, '乐至县', 4),
(2899, 341, '大安区', 4),
(2900, 341, '自流井区', 4),
(2901, 341, '贡井区', 4),
(2902, 341, '沿滩区', 4),
(2903, 341, '荣县', 4),
(2904, 341, '富顺县', 4),
(2905, 342, '江阳区', 4),
(2906, 342, '纳溪区', 4),
(2907, 342, '龙马潭区', 4),
(2908, 342, '泸县', 4),
(2909, 342, '合江县', 4),
(2910, 342, '叙永县', 4),
(2911, 342, '古蔺县', 4),
(2912, 343, '和平区', 4),
(2913, 343, '河西区', 4),
(2914, 343, '南开区', 4),
(2915, 343, '河北区', 4),
(2916, 343, '河东区', 4),
(2917, 343, '红桥区', 4),
(2918, 343, '东丽区', 4),
(2919, 343, '津南区', 4),
(2920, 343, '西青区', 4),
(2921, 343, '北辰区', 4),
(2922, 343, '塘沽区', 4),
(2923, 343, '汉沽区', 4),
(2924, 343, '大港区', 4),
(2925, 343, '武清区', 4),
(2926, 343, '宝坻区', 4),
(2927, 343, '经济开发区', 4),
(2928, 343, '宁河县', 4),
(2929, 343, '静海县', 4),
(2930, 343, '蓟县', 4),
(2931, 344, '城关区', 4),
(2932, 344, '林周县', 4),
(2933, 344, '当雄县', 4),
(2934, 344, '尼木县', 4),
(2935, 344, '曲水县', 4),
(2936, 344, '堆龙德庆县', 4),
(2937, 344, '达孜县', 4),
(2938, 344, '墨竹工卡县', 4),
(2939, 345, '噶尔县', 4),
(2940, 345, '普兰县', 4),
(2941, 345, '札达县', 4),
(2942, 345, '日土县', 4),
(2943, 345, '革吉县', 4),
(2944, 345, '改则县', 4),
(2945, 345, '措勤县', 4),
(2946, 346, '昌都县', 4),
(2947, 346, '江达县', 4),
(2948, 346, '贡觉县', 4),
(2949, 346, '类乌齐县', 4),
(2950, 346, '丁青县', 4),
(2951, 346, '察雅县', 4),
(2952, 346, '八宿县', 4),
(2953, 346, '左贡县', 4),
(2954, 346, '芒康县', 4),
(2955, 346, '洛隆县', 4),
(2956, 346, '边坝县', 4),
(2957, 347, '林芝县', 4),
(2958, 347, '工布江达县', 4),
(2959, 347, '米林县', 4),
(2960, 347, '墨脱县', 4),
(2961, 347, '波密县', 4),
(2962, 347, '察隅县', 4),
(2963, 347, '朗县', 4),
(2964, 348, '那曲县', 4),
(2965, 348, '嘉黎县', 4),
(2966, 348, '比如县', 4),
(2967, 348, '聂荣县', 4),
(2968, 348, '安多县', 4),
(2969, 348, '申扎县', 4),
(2970, 348, '索县', 4),
(2971, 348, '班戈县', 4),
(2972, 348, '巴青县', 4),
(2973, 348, '尼玛县', 4),
(2974, 349, '日喀则市', 4),
(2975, 349, '南木林县', 4),
(2976, 349, '江孜县', 4),
(2977, 349, '定日县', 4),
(2978, 349, '萨迦县', 4),
(2979, 349, '拉孜县', 4),
(2980, 349, '昂仁县', 4),
(2981, 349, '谢通门县', 4),
(2982, 349, '白朗县', 4),
(2983, 349, '仁布县', 4),
(2984, 349, '康马县', 4),
(2985, 349, '定结县', 4),
(2986, 349, '仲巴县', 4),
(2987, 349, '亚东县', 4),
(2988, 349, '吉隆县', 4),
(2989, 349, '聂拉木县', 4),
(2990, 349, '萨嘎县', 4),
(2991, 349, '岗巴县', 4),
(2992, 350, '乃东县', 4),
(2993, 350, '扎囊县', 4),
(2994, 350, '贡嘎县', 4),
(2995, 350, '桑日县', 4),
(2996, 350, '琼结县', 4),
(2997, 350, '曲松县', 4),
(2998, 350, '措美县', 4),
(2999, 350, '洛扎县', 4),
(3000, 350, '加查县', 4),
(3001, 350, '隆子县', 4),
(3002, 350, '错那县', 4),
(3003, 350, '浪卡子县', 4),
(3004, 351, '天山区', 4),
(3005, 351, '沙依巴克区', 4),
(3006, 351, '新市区', 4),
(3007, 351, '水磨沟区', 4),
(3008, 351, '头屯河区', 4),
(3009, 351, '达坂城区', 4),
(3010, 351, '米东区', 4),
(3011, 351, '乌鲁木齐县', 4),
(3012, 352, '阿克苏市', 4),
(3013, 352, '温宿县', 4),
(3014, 352, '库车县', 4),
(3015, 352, '沙雅县', 4),
(3016, 352, '新和县', 4),
(3017, 352, '拜城县', 4),
(3018, 352, '乌什县', 4),
(3019, 352, '阿瓦提县', 4),
(3020, 352, '柯坪县', 4),
(3021, 353, '阿拉尔市', 4),
(3022, 354, '库尔勒市', 4),
(3023, 354, '轮台县', 4),
(3024, 354, '尉犁县', 4),
(3025, 354, '若羌县', 4),
(3026, 354, '且末县', 4),
(3027, 354, '焉耆', 4),
(3028, 354, '和静县', 4),
(3029, 354, '和硕县', 4),
(3030, 354, '博湖县', 4),
(3031, 355, '博乐市', 4),
(3032, 355, '精河县', 4),
(3033, 355, '温泉县', 4),
(3034, 356, '呼图壁县', 4),
(3035, 356, '米泉市', 4),
(3036, 356, '昌吉市', 4),
(3037, 356, '阜康市', 4),
(3038, 356, '玛纳斯县', 4),
(3039, 356, '奇台县', 4),
(3040, 356, '吉木萨尔县', 4),
(3041, 356, '木垒', 4),
(3042, 357, '哈密市', 4),
(3043, 357, '伊吾县', 4),
(3044, 357, '巴里坤', 4),
(3045, 358, '和田市', 4),
(3046, 358, '和田县', 4),
(3047, 358, '墨玉县', 4),
(3048, 358, '皮山县', 4),
(3049, 358, '洛浦县', 4),
(3050, 358, '策勒县', 4),
(3051, 358, '于田县', 4),
(3052, 358, '民丰县', 4),
(3053, 359, '喀什市', 4),
(3054, 359, '疏附县', 4),
(3055, 359, '疏勒县', 4),
(3056, 359, '英吉沙县', 4),
(3057, 359, '泽普县', 4),
(3058, 359, '莎车县', 4),
(3059, 359, '叶城县', 4),
(3060, 359, '麦盖提县', 4),
(3061, 359, '岳普湖县', 4),
(3062, 359, '伽师县', 4),
(3063, 359, '巴楚县', 4),
(3064, 359, '塔什库尔干', 4),
(3065, 360, '克拉玛依市', 4),
(3066, 361, '阿图什市', 4),
(3067, 361, '阿克陶县', 4),
(3068, 361, '阿合奇县', 4),
(3069, 361, '乌恰县', 4),
(3070, 362, '石河子市', 4),
(3071, 363, '图木舒克市', 4),
(3072, 364, '吐鲁番市', 4),
(3073, 364, '鄯善县', 4),
(3074, 364, '托克逊县', 4),
(3075, 365, '五家渠市', 4),
(3076, 366, '阿勒泰市', 4),
(3077, 366, '布克赛尔', 4),
(3078, 366, '伊宁市', 4),
(3079, 366, '布尔津县', 4),
(3080, 366, '奎屯市', 4),
(3081, 366, '乌苏市', 4),
(3082, 366, '额敏县', 4),
(3083, 366, '富蕴县', 4),
(3084, 366, '伊宁县', 4),
(3085, 366, '福海县', 4),
(3086, 366, '霍城县', 4),
(3087, 366, '沙湾县', 4),
(3088, 366, '巩留县', 4),
(3089, 366, '哈巴河县', 4),
(3090, 366, '托里县', 4),
(3091, 366, '青河县', 4),
(3092, 366, '新源县', 4),
(3093, 366, '裕民县', 4),
(3094, 366, '和布克赛尔', 4),
(3095, 366, '吉木乃县', 4),
(3096, 366, '昭苏县', 4),
(3097, 366, '特克斯县', 4),
(3098, 366, '尼勒克县', 4),
(3099, 366, '察布查尔', 4),
(3100, 367, '盘龙区', 4),
(3101, 367, '五华区', 4),
(3102, 367, '官渡区', 4),
(3103, 367, '西山区', 4),
(3104, 367, '东川区', 4),
(3105, 367, '安宁市', 4),
(3106, 367, '呈贡县', 4),
(3107, 367, '晋宁县', 4),
(3108, 367, '富民县', 4),
(3109, 367, '宜良县', 4),
(3110, 367, '嵩明县', 4),
(3111, 367, '石林县', 4),
(3112, 367, '禄劝', 4),
(3113, 367, '寻甸', 4),
(3114, 368, '兰坪', 4),
(3115, 368, '泸水县', 4),
(3116, 368, '福贡县', 4),
(3117, 368, '贡山', 4),
(3118, 369, '宁洱', 4),
(3119, 369, '思茅区', 4),
(3120, 369, '墨江', 4),
(3121, 369, '景东', 4),
(3122, 369, '景谷', 4),
(3123, 369, '镇沅', 4),
(3124, 369, '江城', 4),
(3125, 369, '孟连', 4),
(3126, 369, '澜沧', 4),
(3127, 369, '西盟', 4),
(3128, 370, '古城区', 4),
(3129, 370, '宁蒗', 4),
(3130, 370, '玉龙', 4),
(3131, 370, '永胜县', 4),
(3132, 370, '华坪县', 4),
(3133, 371, '隆阳区', 4),
(3134, 371, '施甸县', 4),
(3135, 371, '腾冲县', 4),
(3136, 371, '龙陵县', 4),
(3137, 371, '昌宁县', 4),
(3138, 372, '楚雄市', 4),
(3139, 372, '双柏县', 4),
(3140, 372, '牟定县', 4),
(3141, 372, '南华县', 4),
(3142, 372, '姚安县', 4),
(3143, 372, '大姚县', 4),
(3144, 372, '永仁县', 4),
(3145, 372, '元谋县', 4),
(3146, 372, '武定县', 4),
(3147, 372, '禄丰县', 4),
(3148, 373, '大理市', 4),
(3149, 373, '祥云县', 4),
(3150, 373, '宾川县', 4),
(3151, 373, '弥渡县', 4),
(3152, 373, '永平县', 4),
(3153, 373, '云龙县', 4),
(3154, 373, '洱源县', 4),
(3155, 373, '剑川县', 4),
(3156, 373, '鹤庆县', 4),
(3157, 373, '漾濞', 4),
(3158, 373, '南涧', 4),
(3159, 373, '巍山', 4),
(3160, 374, '潞西市', 4),
(3161, 374, '瑞丽市', 4),
(3162, 374, '梁河县', 4),
(3163, 374, '盈江县', 4),
(3164, 374, '陇川县', 4),
(3165, 375, '香格里拉县', 4),
(3166, 375, '德钦县', 4),
(3167, 375, '维西', 4),
(3168, 376, '泸西县', 4),
(3169, 376, '蒙自县', 4),
(3170, 376, '个旧市', 4),
(3171, 376, '开远市', 4),
(3172, 376, '绿春县', 4),
(3173, 376, '建水县', 4),
(3174, 376, '石屏县', 4),
(3175, 376, '弥勒县', 4),
(3176, 376, '元阳县', 4),
(3177, 376, '红河县', 4),
(3178, 376, '金平', 4),
(3179, 376, '河口', 4),
(3180, 376, '屏边', 4),
(3181, 377, '临翔区', 4),
(3182, 377, '凤庆县', 4),
(3183, 377, '云县', 4),
(3184, 377, '永德县', 4),
(3185, 377, '镇康县', 4),
(3186, 377, '双江', 4),
(3187, 377, '耿马', 4),
(3188, 377, '沧源', 4),
(3189, 378, '麒麟区', 4),
(3190, 378, '宣威市', 4),
(3191, 378, '马龙县', 4),
(3192, 378, '陆良县', 4),
(3193, 378, '师宗县', 4),
(3194, 378, '罗平县', 4),
(3195, 378, '富源县', 4),
(3196, 378, '会泽县', 4),
(3197, 378, '沾益县', 4),
(3198, 379, '文山县', 4),
(3199, 379, '砚山县', 4),
(3200, 379, '西畴县', 4),
(3201, 379, '麻栗坡县', 4),
(3202, 379, '马关县', 4),
(3203, 379, '丘北县', 4),
(3204, 379, '广南县', 4),
(3205, 379, '富宁县', 4),
(3206, 380, '景洪市', 4),
(3207, 380, '勐海县', 4),
(3208, 380, '勐腊县', 4),
(3209, 381, '红塔区', 4),
(3210, 381, '江川县', 4),
(3211, 381, '澄江县', 4),
(3212, 381, '通海县', 4),
(3213, 381, '华宁县', 4),
(3214, 381, '易门县', 4),
(3215, 381, '峨山', 4),
(3216, 381, '新平', 4),
(3217, 381, '元江', 4),
(3218, 382, '昭阳区', 4),
(3219, 382, '鲁甸县', 4),
(3220, 382, '巧家县', 4),
(3221, 382, '盐津县', 4),
(3222, 382, '大关县', 4),
(3223, 382, '永善县', 4),
(3224, 382, '绥江县', 4),
(3225, 382, '镇雄县', 4),
(3226, 382, '彝良县', 4),
(3227, 382, '威信县', 4),
(3228, 382, '水富县', 4),
(3229, 383, '西湖区', 4),
(3230, 383, '上城区', 4),
(3231, 383, '下城区', 4),
(3232, 383, '拱墅区', 4),
(3233, 383, '滨江区', 4),
(3234, 383, '江干区', 4),
(3235, 383, '萧山区', 4),
(3236, 383, '余杭区', 4),
(3237, 383, '市郊', 4),
(3238, 383, '建德市', 4),
(3239, 383, '富阳市', 4),
(3240, 383, '临安市', 4),
(3241, 383, '桐庐县', 4),
(3242, 383, '淳安县', 4),
(3243, 384, '吴兴区', 4),
(3244, 384, '南浔区', 4),
(3245, 384, '德清县', 4),
(3246, 384, '长兴县', 4),
(3247, 384, '安吉县', 4),
(3248, 385, '南湖区', 4),
(3249, 385, '秀洲区', 4),
(3250, 385, '海宁市', 4),
(3251, 385, '嘉善县', 4),
(3252, 385, '平湖市', 4),
(3253, 385, '桐乡市', 4),
(3254, 385, '海盐县', 4),
(3255, 386, '婺城区', 4),
(3256, 386, '金东区', 4),
(3257, 386, '兰溪市', 4),
(3258, 386, '市区', 4),
(3259, 386, '佛堂镇', 4),
(3260, 386, '上溪镇', 4),
(3261, 386, '义亭镇', 4),
(3262, 386, '大陈镇', 4),
(3263, 386, '苏溪镇', 4),
(3264, 386, '赤岸镇', 4),
(3265, 386, '东阳市', 4),
(3266, 386, '永康市', 4),
(3267, 386, '武义县', 4),
(3268, 386, '浦江县', 4),
(3269, 386, '磐安县', 4),
(3270, 387, '莲都区', 4),
(3271, 387, '龙泉市', 4),
(3272, 387, '青田县', 4),
(3273, 387, '缙云县', 4),
(3274, 387, '遂昌县', 4),
(3275, 387, '松阳县', 4),
(3276, 387, '云和县', 4),
(3277, 387, '庆元县', 4),
(3278, 387, '景宁', 4),
(3279, 388, '海曙区', 4),
(3280, 388, '江东区', 4),
(3281, 388, '江北区', 4),
(3282, 388, '镇海区', 4),
(3283, 388, '北仑区', 4),
(3284, 388, '鄞州区', 4),
(3285, 388, '余姚市', 4),
(3286, 388, '慈溪市', 4),
(3287, 388, '奉化市', 4),
(3288, 388, '象山县', 4),
(3289, 388, '宁海县', 4),
(3290, 389, '越城区', 4),
(3291, 389, '上虞市', 4),
(3292, 389, '嵊州市', 4),
(3293, 389, '绍兴县', 4),
(3294, 389, '新昌县', 4),
(3295, 389, '诸暨市', 4),
(3296, 390, '椒江区', 4),
(3297, 390, '黄岩区', 4),
(3298, 390, '路桥区', 4),
(3299, 390, '温岭市', 4),
(3300, 390, '临海市', 4),
(3301, 390, '玉环县', 4),
(3302, 390, '三门县', 4),
(3303, 390, '天台县', 4),
(3304, 390, '仙居县', 4),
(3305, 391, '鹿城区', 4),
(3306, 391, '龙湾区', 4),
(3307, 391, '瓯海区', 4),
(3308, 391, '瑞安市', 4),
(3309, 391, '乐清市', 4),
(3310, 391, '洞头县', 4),
(3311, 391, '永嘉县', 4),
(3312, 391, '平阳县', 4),
(3313, 391, '苍南县', 4),
(3314, 391, '文成县', 4),
(3315, 391, '泰顺县', 4),
(3316, 392, '定海区', 4),
(3317, 392, '普陀区', 4),
(3318, 392, '岱山县', 4),
(3319, 392, '嵊泗县', 4),
(3320, 393, '衢州市', 4),
(3321, 393, '江山市', 4),
(3322, 393, '常山县', 4),
(3323, 393, '开化县', 4),
(3324, 393, '龙游县', 4),
(3325, 394, '合川区', 4),
(3326, 394, '江津区', 4),
(3327, 394, '南川区', 4),
(3328, 394, '永川区', 4),
(3329, 394, '南岸区', 4),
(3330, 394, '渝北区', 4),
(3331, 394, '万盛区', 4),
(3332, 394, '大渡口区', 4),
(3333, 394, '万州区', 4),
(3334, 394, '北碚区', 4),
(3335, 394, '沙坪坝区', 4),
(3336, 394, '巴南区', 4),
(3337, 394, '涪陵区', 4),
(3338, 394, '江北区', 4),
(3339, 394, '九龙坡区', 4),
(3340, 394, '渝中区', 4),
(3341, 394, '黔江开发区', 4),
(3342, 394, '长寿区', 4),
(3343, 394, '双桥区', 4),
(3344, 394, '綦江县', 4),
(3345, 394, '潼南县', 4),
(3346, 394, '铜梁县', 4),
(3347, 394, '大足县', 4),
(3348, 394, '荣昌县', 4),
(3349, 394, '璧山县', 4),
(3350, 394, '垫江县', 4),
(3351, 394, '武隆县', 4),
(3352, 394, '丰都县', 4),
(3353, 394, '城口县', 4),
(3354, 394, '梁平县', 4),
(3355, 394, '开县', 4),
(3356, 394, '巫溪县', 4),
(3357, 394, '巫山县', 4),
(3358, 394, '奉节县', 4),
(3359, 394, '云阳县', 4),
(3360, 394, '忠县', 4),
(3361, 394, '石柱', 4),
(3362, 394, '彭水', 4),
(3363, 394, '酉阳', 4),
(3364, 394, '秀山', 4),
(3365, 395, '沙田区', 4),
(3366, 395, '东区', 4),
(3367, 395, '观塘区', 4),
(3368, 395, '黄大仙区', 4),
(3369, 395, '九龙城区', 4),
(3370, 395, '屯门区', 4),
(3371, 395, '葵青区', 4),
(3372, 395, '元朗区', 4),
(3373, 395, '深水埗区', 4),
(3374, 395, '西贡区', 4),
(3375, 395, '大埔区', 4),
(3376, 395, '湾仔区', 4),
(3377, 395, '油尖旺区', 4),
(3378, 395, '北区', 4),
(3379, 395, '南区', 4),
(3380, 395, '荃湾区', 4),
(3381, 395, '中西区', 4),
(3382, 395, '离岛区', 4),
(3383, 396, '澳门', 4),
(3384, 397, '台北', 4),
(3385, 397, '高雄', 4),
(3386, 397, '基隆', 4),
(3387, 397, '台中', 4),
(3388, 397, '台南', 4),
(3389, 397, '新竹', 4),
(3390, 397, '嘉义', 4),
(3391, 397, '宜兰县', 4),
(3392, 397, '桃园县', 4),
(3393, 397, '苗栗县', 4),
(3394, 397, '彰化县', 4),
(3395, 397, '南投县', 4),
(3396, 397, '云林县', 4),
(3397, 397, '屏东县', 4),
(3398, 397, '台东县', 4),
(3399, 397, '花莲县', 4),
(3400, 397, '澎湖县', 4),
(1, 0, '中国', 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_ecv`
--

CREATE TABLE IF NOT EXISTS `fanwe_ecv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `use_limit` int(11) NOT NULL,
  `use_count` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `begin_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `money` decimal(20,4) NOT NULL,
  `ecv_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unk_sn` (`sn`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=110 ;

--
-- 转存表中的数据 `fanwe_ecv`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_ecv_type`
--

CREATE TABLE IF NOT EXISTS `fanwe_ecv_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `money` decimal(20,4) NOT NULL,
  `use_limit` int(11) NOT NULL,
  `begin_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `gen_count` int(11) NOT NULL,
  `send_type` tinyint(1) NOT NULL,
  `exchange_score` int(11) NOT NULL,
  `exchange_limit` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `fanwe_ecv_type`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_event`
--

CREATE TABLE IF NOT EXISTS `fanwe_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `event_begin_time` int(11) NOT NULL,
  `event_end_time` int(11) NOT NULL,
  `submit_begin_time` int(11) NOT NULL,
  `submit_end_time` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `cate_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `xpoint` varchar(255) NOT NULL,
  `ypoint` varchar(255) NOT NULL,
  `locate_match` text NOT NULL,
  `locate_match_row` text NOT NULL,
  `cate_match` text NOT NULL,
  `cate_match_row` text NOT NULL,
  `name_match` text NOT NULL,
  `name_match_row` text NOT NULL,
  `submit_count` int(11) NOT NULL,
  `reply_count` int(11) NOT NULL,
  `brief` text NOT NULL,
  `sort` int(11) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `click_count` int(11) NOT NULL,
  `is_recommend` tinyint(1) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `publish_wait` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `name_match` (`name_match`),
  FULLTEXT KEY `locate_match` (`locate_match`),
  FULLTEXT KEY `cate_match` (`cate_match`),
  FULLTEXT KEY `all_match` (`locate_match`,`cate_match`,`name_match`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `fanwe_event`
--

INSERT INTO `fanwe_event` (`id`, `name`, `icon`, `event_begin_time`, `event_end_time`, `submit_begin_time`, `submit_end_time`, `user_id`, `content`, `cate_id`, `city_id`, `address`, `xpoint`, `ypoint`, `locate_match`, `locate_match_row`, `cate_match`, `cate_match_row`, `name_match`, `name_match_row`, `submit_count`, `reply_count`, `brief`, `sort`, `is_effect`, `click_count`, `is_recommend`, `supplier_id`, `publish_wait`) VALUES
(1, '免费品偿巧克力', './public/attachment/201202/16/11/4f3c7ea394a90.jpg', 1328040080, 1360958483, 1328126485, 1363377687, 0, '<p><strong>【特别提示】</strong></p>\r\n<p><span style="color:#ff0000;"><strong>有 效 期：截止至2012年3月18日（过期无效）</strong></span></p>\r\n<p><strong>使用限制</strong>：每个ID限购10份；</p>\r\n<p><strong>营业时间</strong>：10：00—19:00；</p>\r\n<p><strong>商家地址</strong>：福州市台江区五一中路万都阿波罗10层1007（阿波罗大酒店后侧）；</p>\r\n<p><strong>预约电话</strong>：0591-28311183；（为保服务质量，请提前1天预约）</p>\r\n<p><strong>使用提示：</strong></p>\r\n<p>1.凭手机二维码至商家店内验证消费，节假日通用，一经验证，不予退款，请见谅；</p>\r\n<p align="left">2.请在有效期内验证，逾期无效；</p>\r\n<p align="left">3.团购不找零，不予店内其他优惠同享，商家承诺无隐性消费；</p>\r\n<p align="left">4.退款说明：有效期内退款额=（团购价-每份2元二维码信息费），有效期外退款额=（团购价-每份2元二维码信息费）*95%，请在提交退款申请时自动扣除，以便我们尽快的为您办理退款。</p>\r\n<p><strong>购买流程：</strong></p>\r\n<p><span style="color:#ff0000;">购买团购券&nbsp;&gt;&nbsp;提前1天致电预约，到店验证消费 &gt;&nbsp;开心享受服务</span></p>\r\n<p>客服电话：400-600-5515 </p>\r\n<p><strong>【活动详情】</strong></p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;【情人节特供】甜蜜情人节，DIY巧克力表爱意！仅39元，即享原价106元【小丫烘焙坊】DIY巧克力18粒礼盒装。爱有时候可以不用说出来，但可以写出来，要表达什么就看你的手艺咯！</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;黑白巧克力的经典融合，甜蜜爱情的美丽代表。</p>\r\n<p><br />\r\n</p>\r\n<p><img src="./public/attachment/201202/16/12/4f3c7fd896822.jpg" alt="" border="0" /><br />\r\n</p>', 3, 15, '福州宝龙城市广场', '119.298129', '26.068769', 'ux20840ux22269,ux31119ux24030,ux23453ux40857,ux24191ux22330,ux22478ux24066,ux31119ux24030ux23453ux40857ux22478ux24066ux24191ux22330,ux40723ux27004ux21306,ux39532ux23614ux21306,ux21488ux27743ux21306,ux20845ux19968ux20013ux36335,ux19975ux35937ux22478,ux23567ux26725ux22836,ux20179ux23665ux21306,ux20179ux23665ux38215,ux34746ux27954,ux19977ux39640ux36335,ux39318ux23665ux36335,ux26187ux23433ux21306,ux29579ux24196ux26032ux26449', '全国,福州,宝龙,广场,城市,福州宝龙城市广场,鼓楼区,马尾区,台江区,六一中路,万象城,小桥头,仓山区,仓山镇,螺洲,三高路,首山路,晋安区,王庄新村', 'ux30005ux24433', '电影', 'ux24039ux20811ux21147,ux20813ux36153,ux20813ux36153ux21697ux20607ux24039ux20811ux21147,ux21487ux20197,ux28888ux28953,ux31036ux30418,ux25163ux33402,ux23567ux20011,ux29233ux24847,ux19981ux29992ux35828,ux20889ux20986,ux21407ux20215,ux29980ux34588ux24773ux20154ux33410ux65292ux68ux73ux89ux24039ux20811ux21147ux34920ux29233ux24847ux65281ux20165ux51ux57ux20803ux65292ux21363ux20139ux21407ux20215ux49ux48ux54ux20803ux12304ux23567ux20011ux28888ux28953ux22346ux12305ux68ux73ux89ux24039ux20811ux21147ux49ux56ux31890ux31036ux30418ux35013ux12290ux29233ux26377ux26102ux20505ux21487ux20197ux19981ux29992ux35828ux20986ux26469ux65292ux20294ux21487ux20197ux20889ux20986ux26469ux65292ux35201ux34920ux36798ux20160ux20040ux23601ux30475ux20320ux30340ux25163ux33402ux21679ux65281', '巧克力,免费,免费品偿巧克力,可以,烘焙,礼盒,手艺,小丫,爱意,不用说,写出,原价,甜蜜情人节，DIY巧克力表爱意！仅39元，即享原价106元【小丫烘焙坊】DIY巧克力18粒礼盒装。爱有时候可以不用说出来，但可以写出来，要表达什么就看你的手艺咯！', 1, 1, '甜蜜情人节，DIY巧克力表爱意！仅39元，即享原价106元【小丫烘焙坊】DIY巧克力18粒礼盒装。爱有时候可以不用说出来，但可以写出来，要表达什么就看你的手艺咯！', 1, 1, 0, 0, 15, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_event_area_link`
--

CREATE TABLE IF NOT EXISTS `fanwe_event_area_link` (
  `event_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  PRIMARY KEY (`event_id`,`area_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_event_area_link`
--

INSERT INTO `fanwe_event_area_link` (`event_id`, `area_id`) VALUES
(1, 8),
(1, 12),
(1, 22),
(1, 27),
(1, 29),
(1, 37),
(1, 38),
(1, 39),
(1, 42),
(1, 43);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_event_cate`
--

CREATE TABLE IF NOT EXISTS `fanwe_event_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `sort` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `fanwe_event_cate`
--

INSERT INTO `fanwe_event_cate` (`id`, `name`, `is_effect`, `sort`, `count`) VALUES
(1, '电影', 1, 1, 0),
(2, '讲座', 1, 2, 0),
(3, '试吃', 1, 3, 1),
(4, '交友', 1, 4, 0),
(5, '旅游', 1, 5, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_event_field`
--

CREATE TABLE IF NOT EXISTS `fanwe_event_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `field_show_name` varchar(255) NOT NULL,
  `field_type` tinyint(1) NOT NULL COMMENT '0:手动输入 1:预选下拉',
  `value_scope` varchar(255) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `fanwe_event_field`
--

INSERT INTO `fanwe_event_field` (`id`, `event_id`, `field_show_name`, `field_type`, `value_scope`, `sort`) VALUES
(5, 1, '姓名', 0, '', 0),
(6, 1, '电话', 0, '', 1),
(7, 1, '性别', 1, '男 女', 2),
(8, 1, '年龄', 1, '0-18岁 18-30岁 30-50岁 50岁以上', 3);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_event_location_link`
--

CREATE TABLE IF NOT EXISTS `fanwe_event_location_link` (
  `event_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`event_id`,`location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_event_location_link`
--

INSERT INTO `fanwe_event_location_link` (`event_id`, `location_id`) VALUES
(1, 14);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_event_submit`
--

CREATE TABLE IF NOT EXISTS `fanwe_event_submit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `fanwe_event_submit`
--

INSERT INTO `fanwe_event_submit` (`id`, `user_id`, `create_time`, `event_id`) VALUES
(1, 44, 1329336241, 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_event_submit_field`
--

CREATE TABLE IF NOT EXISTS `fanwe_event_submit_field` (
  `submit_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `result` varchar(255) NOT NULL,
  `event_id` int(11) NOT NULL,
  PRIMARY KEY (`submit_id`,`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_event_submit_field`
--

INSERT INTO `fanwe_event_submit_field` (`submit_id`, `field_id`, `result`, `event_id`) VALUES
(1, 5, '张三', 1),
(1, 6, '13333333333', 1),
(1, 7, '男', 1),
(1, 8, '18-30岁', 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_express`
--

CREATE TABLE IF NOT EXISTS `fanwe_express` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `print_tmpl` text NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `config` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `fanwe_express`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_expression`
--

CREATE TABLE IF NOT EXISTS `fanwe_expression` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'tusiji',
  `emotion` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=135 ;

--
-- 转存表中的数据 `fanwe_expression`
--

INSERT INTO `fanwe_expression` (`id`, `title`, `type`, `emotion`, `filename`) VALUES
(19, '傲慢', 'qq', '[傲慢]', 'aoman.gif'),
(20, '白眼', 'qq', '[白眼]', 'baiyan.gif'),
(21, '鄙视', 'qq', '[鄙视]', 'bishi.gif'),
(22, '闭嘴', 'qq', '[闭嘴]', 'bizui.gif'),
(23, '擦汗', 'qq', '[擦汗]', 'cahan.gif'),
(24, '菜刀', 'qq', '[菜刀]', 'caidao.gif'),
(25, '差劲', 'qq', '[差劲]', 'chajin.gif'),
(26, '欢庆', 'qq', '[欢庆]', 'cheer.gif'),
(27, '虫子', 'qq', '[虫子]', 'chong.gif'),
(28, '呲牙', 'qq', '[呲牙]', 'ciya.gif'),
(29, '捶打', 'qq', '[捶打]', 'da.gif'),
(30, '大便', 'qq', '[大便]', 'dabian.gif'),
(31, '大兵', 'qq', '[大兵]', 'dabing.gif'),
(32, '大叫', 'qq', '[大叫]', 'dajiao.gif'),
(33, '大哭', 'qq', '[大哭]', 'daku.gif'),
(34, '蛋糕', 'qq', '[蛋糕]', 'dangao.gif'),
(35, '发怒', 'qq', '[发怒]', 'fanu.gif'),
(36, '刀', 'qq', '[刀]', 'dao.gif'),
(37, '得意', 'qq', '[得意]', 'deyi.gif'),
(38, '凋谢', 'qq', '[凋谢]', 'diaoxie.gif'),
(39, '饿', 'qq', '[饿]', 'er.gif'),
(40, '发呆', 'qq', '[发呆]', 'fadai.gif'),
(41, '发抖', 'qq', '[发抖]', 'fadou.gif'),
(42, '饭', 'qq', '[饭]', 'fan.gif'),
(43, '飞吻', 'qq', '[飞吻]', 'feiwen.gif'),
(44, '奋斗', 'qq', '[奋斗]', 'fendou.gif'),
(45, '尴尬', 'qq', '[尴尬]', 'gangga.gif'),
(46, '给力', 'qq', '[给力]', 'geili.gif'),
(47, '勾引', 'qq', '[勾引]', 'gouyin.gif'),
(48, '鼓掌', 'qq', '[鼓掌]', 'guzhang.gif'),
(49, '哈哈', 'qq', '[哈哈]', 'haha.gif'),
(50, '害羞', 'qq', '[害羞]', 'haixiu.gif'),
(51, '哈欠', 'qq', '[哈欠]', 'haqian.gif'),
(52, '花', 'qq', '[花]', 'hua.gif'),
(53, '坏笑', 'qq', '[坏笑]', 'huaixiao.gif'),
(54, '挥手', 'qq', '[挥手]', 'huishou.gif'),
(55, '回头', 'qq', '[回头]', 'huitou.gif'),
(56, '激动', 'qq', '[激动]', 'jidong.gif'),
(57, '惊恐', 'qq', '[惊恐]', 'jingkong.gif'),
(58, '惊讶', 'qq', '[惊讶]', 'jingya.gif'),
(59, '咖啡', 'qq', '[咖啡]', 'kafei.gif'),
(60, '可爱', 'qq', '[可爱]', 'keai.gif'),
(61, '可怜', 'qq', '[可怜]', 'kelian.gif'),
(62, '磕头', 'qq', '[磕头]', 'ketou.gif'),
(63, '示爱', 'qq', '[示爱]', 'kiss.gif'),
(64, '酷', 'qq', '[酷]', 'ku.gif'),
(65, '难过', 'qq', '[难过]', 'kuaikule.gif'),
(66, '骷髅', 'qq', '[骷髅]', 'kulou.gif'),
(67, '困', 'qq', '[困]', 'kun.gif'),
(68, '篮球', 'qq', '[篮球]', 'lanqiu.gif'),
(69, '冷汗', 'qq', '[冷汗]', 'lenghan.gif'),
(70, '流汗', 'qq', '[流汗]', 'liuhan.gif'),
(71, '流泪', 'qq', '[流泪]', 'liulei.gif'),
(72, '礼物', 'qq', '[礼物]', 'liwu.gif'),
(73, '爱心', 'qq', '[爱心]', 'love.gif'),
(74, '骂人', 'qq', '[骂人]', 'ma.gif'),
(75, '不开心', 'qq', '[不开心]', 'nanguo.gif'),
(76, '不好', 'qq', '[不好]', 'no.gif'),
(77, '很好', 'qq', '[很好]', 'ok.gif'),
(78, '佩服', 'qq', '[佩服]', 'peifu.gif'),
(79, '啤酒', 'qq', '[啤酒]', 'pijiu.gif'),
(80, '乒乓', 'qq', '[乒乓]', 'pingpang.gif'),
(81, '撇嘴', 'qq', '[撇嘴]', 'pizui.gif'),
(82, '强', 'qq', '[强]', 'qiang.gif'),
(83, '亲亲', 'qq', '[亲亲]', 'qinqin.gif'),
(84, '出丑', 'qq', '[出丑]', 'qioudale.gif'),
(85, '足球', 'qq', '[足球]', 'qiu.gif'),
(86, '拳头', 'qq', '[拳头]', 'quantou.gif'),
(87, '弱', 'qq', '[弱]', 'ruo.gif'),
(88, '色', 'qq', '[色]', 'se.gif'),
(89, '闪电', 'qq', '[闪电]', 'shandian.gif'),
(90, '胜利', 'qq', '[胜利]', 'shengli.gif'),
(91, '衰', 'qq', '[衰]', 'shuai.gif'),
(92, '睡觉', 'qq', '[睡觉]', 'shuijiao.gif'),
(93, '太阳', 'qq', '[太阳]', 'taiyang.gif'),
(96, '啊', 'tusiji', '[啊]', 'aa.gif'),
(97, '暗爽', 'tusiji', '[暗爽]', 'anshuang.gif'),
(98, 'byebye', 'tusiji', '[byebye]', 'baibai.gif'),
(99, '不行', 'tusiji', '[不行]', 'buxing.gif'),
(100, '戳眼', 'tusiji', '[戳眼]', 'chuoyan.gif'),
(101, '很得意', 'tusiji', '[很得意]', 'deyi.gif'),
(102, '顶', 'tusiji', '[顶]', 'ding.gif'),
(103, '抖抖', 'tusiji', '[抖抖]', 'douxiong.gif'),
(104, '哼', 'tusiji', '[哼]', 'heng.gif'),
(105, '挥汗', 'tusiji', '[挥汗]', 'huihan.gif'),
(106, '昏迷', 'tusiji', '[昏迷]', 'hunmi.gif'),
(107, '互拍', 'tusiji', '[互拍]', 'hupai.gif'),
(108, '瞌睡', 'tusiji', '[瞌睡]', 'keshui.gif'),
(109, '笼子', 'tusiji', '[笼子]', 'longzi.gif'),
(110, '听歌', 'tusiji', '[听歌]', 'music.gif'),
(111, '奶瓶', 'tusiji', '[奶瓶]', 'naiping.gif'),
(112, '扭背', 'tusiji', '[扭背]', 'niubei.gif'),
(113, '拍砖', 'tusiji', '[拍砖]', 'paizhuan.gif'),
(114, '飘过', 'tusiji', '[飘过]', 'piaoguo.gif'),
(115, '揉脸', 'tusiji', '[揉脸]', 'roulian.gif'),
(116, '闪闪', 'tusiji', '[闪闪]', 'shanshan.gif'),
(117, '生日', 'tusiji', '[生日]', 'shengri.gif'),
(118, '摊手', 'tusiji', '[摊手]', 'tanshou.gif'),
(119, '躺坐', 'tusiji', '[躺坐]', 'tanzuo.gif'),
(120, '歪头', 'tusiji', '[歪头]', 'waitou.gif'),
(121, '我踢', 'tusiji', '[我踢]', 'woti.gif'),
(122, '无聊', 'tusiji', '[无聊]', 'wuliao.gif'),
(123, '醒醒', 'tusiji', '[醒醒]', 'xingxing.gif'),
(124, '睡了', 'tusiji', '[睡了]', 'xixishui.gif'),
(125, '旋转', 'tusiji', '[旋转]', 'xuanzhuan.gif'),
(126, '摇晃', 'tusiji', '[摇晃]', 'yaohuang.gif'),
(127, '耶', 'tusiji', '[耶]', 'yeah.gif'),
(128, '郁闷', 'tusiji', '[郁闷]', 'yumen.gif'),
(129, '晕厥', 'tusiji', '[晕厥]', 'yunjue.gif'),
(130, '砸', 'tusiji', '[砸]', 'za.gif'),
(131, '震荡', 'tusiji', '[震荡]', 'zhendang.gif'),
(132, '撞墙', 'tusiji', '[撞墙]', 'zhuangqiang.gif'),
(133, '转头', 'tusiji', '[转头]', 'zhuantou.gif'),
(134, '抓墙', 'tusiji', '[抓墙]', 'zhuaqiang.gif');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_fetch_topic`
--

CREATE TABLE IF NOT EXISTS `fanwe_fetch_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `show_name` varchar(255) NOT NULL,
  `class_name` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `config` text NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `fanwe_fetch_topic`
--

INSERT INTO `fanwe_fetch_topic` (`id`, `name`, `show_name`, `class_name`, `icon`, `config`, `is_effect`, `sort`) VALUES
(1, '方维oso内部数据分享接口', '站内分享', 'Fanwe', './public/attachment/201202/16/10/4f3c6b5d33633.gif', 'N;', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_filter`
--

CREATE TABLE IF NOT EXISTS `fanwe_filter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `filter_name_idx` (`name`),
  KEY `filter_group_id` (`filter_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- 转存表中的数据 `fanwe_filter`
--

INSERT INTO `fanwe_filter` (`id`, `name`, `filter_group_id`) VALUES
(19, '纯绵', 7),
(20, '大码', 8),
(21, '中码', 8),
(22, '均码', 8),
(23, '红色', 9),
(24, '常规毛线', 7),
(25, '小码', 8),
(26, '黑色', 9),
(27, '羽绒', 7),
(28, '洋紫', 9),
(29, '玫红', 9),
(30, '北极蓝', 9),
(31, '尼绒', 7),
(32, '驼色', 9),
(33, '翡翠绿', 9),
(34, '黑白格', 9),
(35, '红黑格', 9),
(36, '紫色', 9),
(37, '超大码', 8);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_filter_group`
--

CREATE TABLE IF NOT EXISTS `fanwe_filter_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `cate_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `is_effect` tinyint(1) NOT NULL COMMENT '是否生效用于检索分组显示于分类页',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `fanwe_filter_group`
--

INSERT INTO `fanwe_filter_group` (`id`, `name`, `cate_id`, `sort`, `is_effect`) VALUES
(7, '面料', 24, 1, 1),
(8, '尺码', 24, 2, 1),
(9, '颜色', 24, 3, 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_flower_log`
--

CREATE TABLE IF NOT EXISTS `fanwe_flower_log` (
  `user_id` int(11) NOT NULL,
  `type` enum('good_count','bad_count') NOT NULL COMMENT 'good_count表示鲜花',
  `rec_id` int(11) NOT NULL,
  `rec_module` enum('image','dp') NOT NULL,
  `memo` varchar(20) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`rec_id`,`rec_module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_flower_log`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_free_delivery`
--

CREATE TABLE IF NOT EXISTS `fanwe_free_delivery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_id` int(11) NOT NULL,
  `deal_id` int(11) NOT NULL,
  `free_count` int(11) NOT NULL COMMENT '免运费的件数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `fanwe_free_delivery`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_goods_type`
--

CREATE TABLE IF NOT EXISTS `fanwe_goods_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `fanwe_goods_type`
--

INSERT INTO `fanwe_goods_type` (`id`, `name`) VALUES
(8, '服装');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_goods_type_attr`
--

CREATE TABLE IF NOT EXISTS `fanwe_goods_type_attr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `input_type` tinyint(1) NOT NULL,
  `preset_value` text NOT NULL,
  `goods_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `fanwe_goods_type_attr`
--

INSERT INTO `fanwe_goods_type_attr` (`id`, `name`, `input_type`, `preset_value`, `goods_type_id`) VALUES
(12, '颜色', 0, '', 8),
(13, '尺码', 0, '', 8);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_images_group`
--

CREATE TABLE IF NOT EXISTS `fanwe_images_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `fanwe_images_group`
--

INSERT INTO `fanwe_images_group` (`id`, `name`, `sort`) VALUES
(1, '店面', 100),
(2, '内部环境', 100),
(3, '菜式', 100);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_images_group_link`
--

CREATE TABLE IF NOT EXISTS `fanwe_images_group_link` (
  `images_group_id` int(11) NOT NULL COMMENT '商户子类点评评分分组ID fanwe_merchant_type_point_group',
  `category_id` int(11) NOT NULL,
  KEY `images_group_id` (`images_group_id`) USING BTREE,
  KEY `category_id` (`category_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_images_group_link`
--

INSERT INTO `fanwe_images_group_link` (`images_group_id`, `category_id`) VALUES
(2, 11),
(1, 10),
(2, 10),
(1, 9),
(1, 8),
(2, 8),
(3, 8),
(2, 14),
(1, 15),
(2, 16),
(1, 17),
(2, 17);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_link`
--

CREATE TABLE IF NOT EXISTS `fanwe_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `sort` int(11) NOT NULL,
  `img` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `count` int(11) NOT NULL,
  `show_index` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `fanwe_link`
--

INSERT INTO `fanwe_link` (`id`, `name`, `group_id`, `url`, `is_effect`, `sort`, `img`, `description`, `count`, `show_index`) VALUES
(3, '方维o2o商业系统', 6, 'http://www.fanwe.com', 1, 1, '', '方维o2o商业系统', 0, 1),
(4, '福团网', 6, 'http://www.futuan.com', 1, 2, '', '福团网', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_link_group`
--

CREATE TABLE IF NOT EXISTS `fanwe_link_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '友情链接分组名称',
  `sort` tinyint(1) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `fanwe_link_group`
--

INSERT INTO `fanwe_link_group` (`id`, `name`, `sort`, `is_effect`) VALUES
(6, '友情链接', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_log`
--

CREATE TABLE IF NOT EXISTS `fanwe_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_info` text NOT NULL,
  `log_time` int(11) NOT NULL,
  `log_admin` int(11) NOT NULL,
  `log_ip` varchar(255) NOT NULL,
  `log_status` tinyint(1) NOT NULL,
  `module` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2125 ;

--
-- 转存表中的数据 `fanwe_log`
--

INSERT INTO `fanwe_log` (`id`, `log_info`, `log_time`, `log_admin`, `log_ip`, `log_status`, `module`, `action`) VALUES
(2085, '最有创意，最富心意的情人节礼物！仅23元，即享原价50元情人节DIY变色杯/马克杯，二选一。美丽的图案在升温后慢慢显现，那么神奇，那么浪漫，正如你们渐渐升温的爱情，永远美丽！福州市区包邮！更新成功', 1377025421, 1, '127.0.0.1', 1, 'Deal', 'update'),
(2086, '最有创意，最富心意的情人节礼物！仅23元，即享原价50元情人节DIY变色杯/马克杯，二选一。美丽的图案在升温后慢慢显现，那么神奇，那么浪漫，正如你们渐渐升温的爱情，永远美丽！福州市区包邮！更新成功', 1377025445, 1, '127.0.0.1', 1, 'Deal', 'update'),
(2087, '最有创意，最富心意的情人节礼物！仅23元，即享原价50元情人节DIY变色杯/马克杯，二选一。美丽的图案在升温后慢慢显现，那么神奇，那么浪漫，正如你们渐渐升温的爱情，永远美丽！福州市区包邮！更新成功', 1377025464, 1, '127.0.0.1', 1, 'Deal', 'update'),
(2088, '1358549832删除成功', 1377025608, 1, '127.0.0.1', 1, 'Database', 'delete'),
(2089, 'admin登录成功', 1411365346, 1, '127.0.0.1', 1, 'Public', 'do_login'),
(2090, 'admin登录成功', 1416550701, 1, '180.118.174.99', 1, 'Public', 'do_login'),
(2091, '更新系统配置', 1416550782, 1, '180.118.174.99', 1, 'Conf', 'update'),
(2092, '最有创意，最富心意的情人节礼物！仅23元，即享原价50元情人节DIY变色杯/马克杯，二选一。美丽的图案在升温后慢慢显现，那么神奇，那么浪漫，正如你们渐渐升温的爱情，永远美丽！福州市区包邮！更新成功', 1416550809, 1, '180.118.174.99', 1, 'Deal', 'update'),
(2093, '甜蜜情人节，DIY巧克力表爱意！仅39元，即享原价106元【小丫烘焙坊】DIY巧克力18粒礼盒装。爱有时候可以不用说出来，但可以写出来，要表达什么就看你的手艺咯！更新成功', 1416550816, 1, '180.118.174.99', 1, 'Deal', 'update'),
(2094, '2012完美婚纱，幸福新人首选凯蒂！仅2580元，即享原价6880元【凯蒂婚纱摄影】套餐：专业拍摄至少100张+底片全送，30张精修入册+4套服装造型+独家外景基地三盛托斯卡纳欧式外景+新人宫殿主题摄影全实景棚任您选择+各类精美拍摄产品，资深摄影师、化妆师全程服务，前8名用户更有其他精美好礼。你的婚礼，要办就要响亮，给她最好的爱！更新成功', 1416550823, 1, '180.118.174.99', 1, 'Deal', 'update'),
(2095, '仅售98元！原价216元的老刘野生大鱼坊2-3人套餐一份：青根鱼一份+怀头鱼一份+秘制汤锅底一份+白菜/豆腐/土豆/宽粉/青菜/白萝卜（任选2份）+拍黄瓜/东北凉菜/皮蛋豆腐/水煮花生/油炸花生/拌海带丝/糖拌西红柿（任选一份）更新成功', 1416550829, 1, '180.118.174.99', 1, 'Deal', 'update'),
(2096, '仅售78元！原价153元的爱琴海餐厅美味套餐一份：重庆烤鱼（草鱼）一份+辣炒丁螺一份+干煸四季豆一份+花蛤汤一份！本套餐不含餐具，需到店另付餐具1元/副！更新成功', 1416550836, 1, '180.118.174.99', 1, 'Deal', 'update'),
(2097, '仅售58元！原价最高142元的闽粤汇经典A、B、C（3选1）双人套餐一份：A套餐：状元虾饺皇一份+柱侯金钱肚一份+爽滑牛肉肠一份+上海小笼包一份+香酥焗蛋挞一份+上汤广芥一份+凤爪排骨饭一份+杨枝甘露一份，B套餐：蟹籽滑烧卖一份+金粟叉烧肠一份+上海生煎包一份+香煎萝卜糕一份+黑椒牛仔骨一份+潮州炒牛河一份+上汤生菜一份+梧州龟苓膏一份，C套餐：豉椒蒸肉排一份+黑椒牛仔骨一份+酱黄蒸凤爪一份+上汤娃娃菜一份+杨枝甘露一份+淮山烧骨粥一份+罗汉蒸肠粉一份+香煎马蹄糕一份。更新成功', 1416550843, 1, '180.118.174.99', 1, 'Deal', 'update'),
(2098, '【44店通用】独家尊享：仅28元享云川台球2小时畅打，千品网携手云川台球联袂献礼，全城44家连锁店通用！京城名店，星级服务，多人共享，不容错过，休闲娱乐好去处，首选云川俱乐部！更新成功', 1416550880, 1, '180.118.174.99', 1, 'Deal', 'youhui_update'),
(2099, '【韩式烤肉】35元抢购汉丽轩十里河店单人自助午餐！海鲜、烤肉、蔬菜、甜品、面点、酒水等超过200余种环球风情美食！食材当天供应，营养、新鲜、量足！攀越性价比巅峰，尝遍天下美食，尽饮美酒佳酿！让味蕾来一次奢华烤肉之旅！更新成功', 1416550887, 1, '180.118.174.99', 1, 'Deal', 'youhui_update'),
(2100, '【三店通用】6.8元抢购奶酪魏秘制奶酪1份！宫廷奶酪/木瓜奶酪/草莓奶酪/香芋奶酪/蓝莓奶酪/蛋黄奶酪/巧克力奶酪（7选1）！原料新鲜，奶香醇厚，口感细腻绵滑，四代传承经典美味，老北京的小吃名片！更新成功', 1416550900, 1, '180.118.174.99', 1, 'Deal', 'youhui_update'),
(2101, '凡塔斯15元优惠券添加成功', 1416551168, 1, '180.118.174.99', 1, 'Youhui', 'insert'),
(2102, '凡塔斯15元优惠券更新成功', 1416551213, 1, '180.118.174.99', 1, 'Youhui', 'update'),
(2103, '年年大丰收4月添加成功', 1416551371, 1, '180.118.174.99', 1, 'Youhui', 'insert'),
(2104, '年年大丰收4月更新成功', 1416551418, 1, '180.118.174.99', 1, 'Youhui', 'update'),
(2105, 'admin登录成功', 1416588879, 1, '222.186.97.53', 1, 'Public', 'do_login'),
(2106, 'admin登录成功', 1416590352, 1, '222.186.97.53', 1, 'Public', 'do_login'),
(2107, '优惠首页更新成功', 1416590393, 1, '222.186.97.53', 1, 'MIndex', 'update'),
(2108, '商城列表更新成功', 1416590405, 1, '222.186.97.53', 1, 'MIndex', 'update'),
(2109, '团购列表更新成功', 1416590420, 1, '222.186.97.53', 1, 'MIndex', 'update'),
(2110, '优惠列表更新成功', 1416590429, 1, '222.186.97.53', 1, 'MIndex', 'update'),
(2111, '团购明细添加成功', 1416590537, 1, '222.186.97.53', 1, 'MIndex', 'insert'),
(2112, '商家列表添加成功', 1416590574, 1, '222.186.97.53', 1, 'MIndex', 'insert'),
(2113, '商品明细添加成功', 1416590613, 1, '222.186.97.53', 1, 'MIndex', 'insert'),
(2114, '更多优惠添加成功', 1416590637, 1, '222.186.97.53', 1, 'MIndex', 'insert'),
(2115, '更多优惠排序修改成功', 1416590650, 1, '222.186.97.53', 1, 'MIndex', 'set_sort'),
(2116, '更多优惠排序修改成功', 1416590657, 1, '222.186.97.53', 1, 'MIndex', 'set_sort'),
(2117, '商品明细排序修改成功', 1416590660, 1, '222.186.97.53', 1, 'MIndex', 'set_sort'),
(2118, '商家列表排序修改成功', 1416590667, 1, '222.186.97.53', 1, 'MIndex', 'set_sort'),
(2119, '团购明细排序修改成功', 1416590672, 1, '222.186.97.53', 1, 'MIndex', 'set_sort'),
(2120, '优惠首页排序修改成功', 1416590675, 1, '222.186.97.53', 1, 'MIndex', 'set_sort'),
(2121, '商城列表排序修改成功', 1416590677, 1, '222.186.97.53', 1, 'MIndex', 'set_sort'),
(2122, '团购列表排序修改成功', 1416590679, 1, '222.186.97.53', 1, 'MIndex', 'set_sort'),
(2123, '优惠列表排序修改成功', 1416590682, 1, '222.186.97.53', 1, 'MIndex', 'set_sort'),
(2124, 'admin登录成功', 1416765247, 1, '222.186.97.53', 1, 'Public', 'do_login');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_lottery`
--

CREATE TABLE IF NOT EXISTS `fanwe_lottery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lottery_sn` varchar(255) NOT NULL,
  `deal_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `create_time` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- 转存表中的数据 `fanwe_lottery`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_mail_list`
--

CREATE TABLE IF NOT EXISTS `fanwe_mail_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mail_address` varchar(255) NOT NULL,
  `city_id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mail_address_idx` (`mail_address`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `fanwe_mail_list`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_mail_server`
--

CREATE TABLE IF NOT EXISTS `fanwe_mail_server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `smtp_server` varchar(255) NOT NULL,
  `smtp_name` varchar(255) NOT NULL,
  `smtp_pwd` varchar(255) NOT NULL,
  `is_ssl` tinyint(1) NOT NULL,
  `smtp_port` varchar(255) NOT NULL,
  `use_limit` int(11) NOT NULL,
  `is_reset` tinyint(1) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `total_use` int(11) NOT NULL,
  `is_verify` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `fanwe_mail_server`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_medal`
--

CREATE TABLE IF NOT EXISTS `fanwe_medal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `config` text NOT NULL,
  `icon` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `route` text NOT NULL,
  `allow_check` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `fanwe_medal`
--

INSERT INTO `fanwe_medal` (`id`, `class_name`, `name`, `description`, `is_effect`, `config`, `icon`, `image`, `route`, `allow_check`) VALUES
(1, 'Groupuser', '组长勋章', '点亮表示您为组长', 1, 'N;', './public/attachment/201203/17/15/4f6438e27aa65.png', '', '申请成为小组组长即可点亮该勋章', 1),
(2, 'Keepsign', '忠实网友勋章', '点亮为忠实的网友会员', 1, 'a:1:{s:9:"day_count";s:2:"10";}', './public/attachment/201203/17/15/4f6438f0af2c6.png', '', '连续签到10天以上将获得该勋章', 1),
(3, 'Newuser', '新手勋章', '点亮您为新手，让更多的朋友找到你', 1, 'N;', './public/attachment/201203/17/15/4f643902cd067.png', '', '完善用户的所有资料，即可获取该勋章', 1),
(4, 'Sinabind', '新浪微博勋章', '新浪微博认证勋章，点亮为新浪微博用户', 1, 'N;', './public/attachment/201203/17/15/4f64391478be2.png', '', '绑定新浪微博即可获得该勋章', 0),
(5, 'Tencentbind', '腾讯微博勋章', '腾讯微博认证勋章，点亮为腾讯微博用户', 1, 'N;', './public/attachment/201203/17/15/4f6439210f17b.png', '', '绑定腾讯微博即可获得该勋章', 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_message`
--

CREATE TABLE IF NOT EXISTS `fanwe_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `admin_reply` text NOT NULL,
  `admin_id` int(11) NOT NULL,
  `rel_table` varchar(255) NOT NULL,
  `rel_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `city_id` int(11) NOT NULL,
  `is_buy` tinyint(1) NOT NULL,
  `contact_name` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `point` int(11) NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:商家未阅读;1:商家已阅读',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=98 ;

--
-- 转存表中的数据 `fanwe_message`
--

INSERT INTO `fanwe_message` (`id`, `title`, `content`, `create_time`, `update_time`, `admin_reply`, `admin_id`, `rel_table`, `rel_id`, `user_id`, `pid`, `is_effect`, `city_id`, `is_buy`, `contact_name`, `contact`, `point`, `is_read`) VALUES
(97, '看起来很不错。 我报名了[呲牙][呲牙]', '看起来很不错。 我报名了[呲牙][呲牙]', 1329336228, 0, '', 0, 'event', 1, 44, 0, 1, 0, 0, '', '', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_message_type`
--

CREATE TABLE IF NOT EXISTS `fanwe_message_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL,
  `is_fix` tinyint(1) NOT NULL,
  `show_name` varchar(255) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `fanwe_message_type`
--

INSERT INTO `fanwe_message_type` (`id`, `type_name`, `is_fix`, `show_name`, `is_effect`, `sort`) VALUES
(1, 'deal', 1, '商品评论', 1, 0),
(2, 'deal_order', 1, '订单留言', 0, 0),
(3, 'feedback', 1, '意见反馈', 0, 0),
(4, 'seller', 1, '商务合作', 0, 0),
(6, 'tx', 1, '提现申请', 0, 0),
(5, 'after_sale', 0, '售后服务', 0, 2),
(8, 'before_sale', 0, '售前咨询', 1, 3),
(10, 'faq', 1, '问题答疑', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_mobile_list`
--

CREATE TABLE IF NOT EXISTS `fanwe_mobile_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(255) NOT NULL,
  `city_id` int(11) NOT NULL,
  `verify_code` varchar(255) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mobile_idx` (`mobile`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- 转存表中的数据 `fanwe_mobile_list`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_msg_box`
--

CREATE TABLE IF NOT EXISTS `fanwe_msg_box` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `system_msg_id` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `group_key` varchar(200) NOT NULL,
  `is_notice` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `fanwe_msg_box`
--

INSERT INTO `fanwe_msg_box` (`id`, `title`, `content`, `from_user_id`, `to_user_id`, `create_time`, `is_read`, `is_delete`, `system_msg_id`, `type`, `group_key`, `is_notice`) VALUES
(1, '图片很美分享被置顶+10经验', '图片很美分享被置顶+10经验', 44, 44, 1331937858, 1, 0, 0, 0, '44_44_0_1', 1),
(2, '您已经成为初入江湖', '恭喜您，您已经成为初入江湖。', 0, 44, 1331939170, 1, 0, 0, 0, '0_44_0_2', 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_msg_system`
--

CREATE TABLE IF NOT EXISTS `fanwe_msg_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `user_names` text NOT NULL,
  `user_ids` text NOT NULL,
  `end_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `fanwe_msg_system`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_msg_template`
--

CREATE TABLE IF NOT EXISTS `fanwe_msg_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `type` tinyint(1) NOT NULL,
  `is_html` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `fanwe_msg_template`
--

INSERT INTO `fanwe_msg_template` (`id`, `name`, `content`, `type`, `is_html`) VALUES
(1, 'TPL_MAIL_COUPON', '{$coupon.user_name}你好! 你购买的{$coupon.deal_name}已购买成功，团购券序列号{$coupon.sn}密码{$coupon.password},有效期为{$coupon.begin_time_format}到{$coupon.end_time_format}', 1, 0),
(2, 'TPL_SMS_COUPON', '{$coupon.user_name}你好! 你购买的{$coupon.deal_sub_name}已购买成功，团购券序列号{$coupon.sn}密码{$coupon.password},有效期为{$coupon.begin_time_format}到{$coupon.end_time_format}', 0, 0),
(3, 'TPL_MAIL_USER_VERIFY', '{$user.user_name}你好，请点击以下链接验证你的会员身份\r\n</p>\r\n<a href=''{$user.verify_url}''>{$user.verify_url}</a>', 1, 1),
(4, 'TPL_MAIL_USER_PASSWORD', '{$user.user_name}你好，请点击以下链接修改您的密码\r\n</p>\r\n<a href=''{$user.password_url}''>{$user.password_url}</a>', 1, 1),
(5, 'TPL_SMS_PAYMENT', '{$payment_notice.user_name}你好,你所下订单{$payment_notice.order_sn}的收款单{$payment_notice.notice_sn}金额{$payment_notice.money_format}于{$payment_notice.pay_time_format}支付成功', 0, 0),
(6, 'TPL_MAIL_PAYMENT', '{$payment_notice.user_name}你好,你所下订单{$payment_notice.order_sn}的收款单{$payment_notice.notice_sn}金额{$payment_notice.money_format}于{$payment_notice.pay_time_format}支付成功', 1, 0),
(7, 'TPL_SMS_DELIVERY', '{$delivery_notice.user_name}你好,你所下订单{$delivery_notice.order_sn}的商品{$delivery_notice.deal_names}于{$delivery_notice.delivery_time_format}发货成功,发货单号{$delivery_notice.notice_sn}', 0, 0),
(8, 'TPL_MAIL_DELIVERY', '{$delivery_notice.user_name}你好,你所下订单{$delivery_notice.order_sn}的商品{$delivery_notice.deal_names}于{$delivery_notice.delivery_time_format}发货成功,发货单号{$delivery_notice.notice_sn}', 1, 0),
(9, 'TPL_SMS_VERIFY_CODE', '你的手机号为{$verify.mobile},验证码为{$verify.code}', 0, 0),
(10, 'TPL_DEAL_NOTICE_SMS', '{$notice.site_name}又有新团购啦!{$notice.deal_name},欢迎来抢团{$notice.site_url}', 0, 0),
(11, 'TPL_MAIL_UNSUBSCRIBE', '您好，您确定要退订{$mail.mail_address}吗？要退订请点击<a href="{$mail.url}">完成退订</a>', 1, 1),
(12, 'TPL_SMS_USE_COUPON', '{$coupon.user_name}你好! 你购买的{$coupon.deal_sub_name}，团购券{$coupon.sn}，已于{$coupon.confirm_time_format}使用', 0, 0),
(13, 'TPL_MAIL_USE_COUPON', '{$coupon.user_name}你好! 你购买的{$coupon.deal_name}，团购券{$coupon.sn}，已于{$coupon.confirm_time_format}使用', 1, 0),
(14, 'TPL_SMS_LOTTERY', '{$lottery.user_name}你好! 你参加的{$lottery.deal_sub_name}，抽奖号为{$lottery.lottery_sn}', 0, 0),
(15, 'TPL_SMS_SCORE', '{$username}你好! 你支付的订单{$order_sn}{$score_value}', 0, 0),
(16, 'TPL_MAIL_SCORE', '{$username}你好! 你支付的订单{$order_sn}{$score_value}', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_m_adv`
--

CREATE TABLE IF NOT EXISTS `fanwe_m_adv` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `img` varchar(255) DEFAULT '',
  `page` enum('sharelist','index','wap') DEFAULT 'sharelist',
  `type` tinyint(1) DEFAULT '0' COMMENT '1.标签集,2.url地址,3.分类排行,4.最亮达人,5.搜索发现,6.一起拍,7.热门单品排行,8.直接显示某个分享',
  `data` text,
  `sort` smallint(5) DEFAULT '10',
  `status` tinyint(1) DEFAULT '1',
  `city_id` int(11) DEFAULT '0',
  `is_middle` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `fanwe_m_adv`
--

INSERT INTO `fanwe_m_adv` (`id`, `name`, `img`, `page`, `type`, `data`, `sort`, `status`, `city_id`, `is_middle`) VALUES
(8, '达人', './public/attachment/201203/03/09/4f51762d89d4d.jpg', 'sharelist', 4, '', 1, 1, 0, NULL),
(9, '方维o2o', './public/attachment/201202/04/15/4f2ce3d1827e4.jpg', 'index', 2, 'a:1:{s:3:"url";s:20:"http://www.fanwe.com";}', 2, 1, 0, NULL),
(10, '支付宝广告', './public/attachment/201203/03/09/4f5176077b5e6.jpg', 'index', 1, 'a:2:{s:3:"cid";i:1;s:4:"tags";a:4:{i:0;s:6:"游戏";i:1;s:6:"电影";i:2;s:6:"可爱";i:3;s:6:"卖萌";}}', 3, 1, 0, NULL),
(11, '手机广告', './public/attachment/201203/03/09/4f5175debd973.jpg', 'index', 8, 'a:1:{s:8:"share_id";i:137;}', 4, 1, 0, NULL),
(12, '方维o2o', './public/attachment/201202/04/15/4f2ce3d1827e4.jpg', 'sharelist', 2, 'a:1:{s:3:"url";s:20:"http://www.fanwe.com";}', 5, 1, 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_m_config`
--

CREATE TABLE IF NOT EXISTS `fanwe_m_config` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `val` text,
  `type` tinyint(1) NOT NULL,
  `group_name` varchar(50) NOT NULL DEFAULT '基础配置' COMMENT '分组显示',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=72 ;

--
-- 转存表中的数据 `fanwe_m_config`
--

INSERT INTO `fanwe_m_config` (`id`, `code`, `title`, `val`, `type`, `group_name`, `sort`) VALUES
(1, 'catalog_id', '生活服务默认分类id', '8', 0, '基础配置', 0),
(19, 'index_logo', '首页logo', './public/attachment/201202/04/16/4f2ce8336d784.png', 2, '基础配置', 0),
(3, 'has_ecv', '有优惠券', '1', 0, '基础配置', 0),
(6, 'has_message', '有留言框', '1', 0, '基础配置', 0),
(7, 'has_region', '有配送地区选择项', '1', 0, '基础配置', 0),
(8, 'region_version', '配送地区版本', '1', 0, '基础配置', 0),
(9, 'only_one_delivery', '只有一个配送地区', '1', 0, '基础配置', 0),
(10, 'kf_phone', '客服电话', '400-000-0000', 0, '基础配置', 0),
(11, 'kf_email', '客服邮箱', 'qq@fanwe.com', 0, '基础配置', 0),
(12, 'select_payment_id', '默认支付方式', '0', 0, '基础配置', 0),
(15, 'delivery_id', '默认配送方式', '0', 0, '基础配置', 0),
(16, 'page_size', '分页大小', '10', 0, '基础配置', 0),
(18, 'program_title', '程序标题名称', '方维o2o商业系统', 0, '基础配置', 0),
(20, 'event_cate_id', '活动默认分类id', '3', 0, '基础配置', 0),
(21, 'shop_cate_id', '商城默认分类id', '24', 0, '基础配置', 0),
(22, 'sina_app_key', '新浪APP_KEY', '1025953237', 0, '基础配置', 0),
(23, 'sina_app_secret', '新浪APP_SECRET', '5186fc94189f83f201474b4d563bdd30', 0, '基础配置', 0),
(24, 'sina_bind_url', '新浪回调地址', 'http://new.97jw.com/api_callback.php?c=sina', 0, '基础配置', 0),
(70, 'article_cate_id', '公告列表(文章分类ID)', '0', 0, '基础配置', 21),
(69, 'about_info', '关于我们(文章ID)', '0', 0, '基础配置', 20),
(28, 'qq_app_key', 'QQ登录APP_KEY', '', 0, '基础配置', 0),
(29, 'qq_app_secret', 'QQ登录APP_SECRET', '', 0, '基础配置', 0),
(61, 'ios_biz_forced_upgrade', '商家ios是否强制升级(0:否;1:是)', '0', 0, '商家手机端升级设置', 12),
(62, 'android_biz_version', '商家android版本号(yyyymmddnn)', '', 0, '商家手机端升级设置', 13),
(63, 'android_biz_filename', '商家android下载包名', 'fanwe_o2os.apk', 0, '商家手机端升级设置', 14),
(65, 'android_biz_forced_upgrade', '商家android是否强制升级(0:否;1:是)', '0', 0, '商家手机端升级设置', 16),
(64, 'android_biz_upgrade', '商家android版本升级内容', '商家android升级测试', 3, '商家手机端升级设置', 15),
(50, 'ios_version', 'ios版本号(yyyymmddnn)', '', 0, '手机端升级设置', 1),
(51, 'ios_down_url', 'ios下载地址(appstore连接地址)', '', 0, '手机端升级设置', 2),
(52, 'ios_upgrade', 'ios版本升级内容', 'ios升级测试', 3, '手机端升级设置', 3),
(53, 'ios_forced_upgrade', 'ios是否强制升级(0:否;1:是)', '0', 0, '手机端升级设置', 4),
(54, 'android_version', 'android版本号(yyyymmddnn)', '', 0, '手机端升级设置', 5),
(55, 'android_filename', 'android下载包名', 'fanwe_o2o.apk', 0, '手机端升级设置', 6),
(56, 'android_upgrade', 'android版本升级内容', 'android升级测试', 3, '手机端升级设置', 7),
(57, 'android_forced_upgrade', 'android是否强制升级(0:否;1:是)', '0', 0, '手机端升级设置', 8),
(58, 'ios_biz_version', '商家ios版本号(yyyymmddnn)', '', 0, '商家手机端升级设置', 9),
(59, 'ios_biz_down_url', '商家ios下载地址(appstore连接地址)', '', 0, '商家手机端升级设置', 10),
(60, 'ios_biz_upgrade', '商家ios版本升级内容', '商家ios升级测试', 3, '商家手机端升级设置', 11),
(66, 'biz_article_cate_id', '商家我的消息(文章分类ID)', '19', 0, '商家手机端升级设置', 17),
(67, 'wx_app_key', '微信(分享)appkey', 'wxb054c5d0503e6758', 0, '基础配置', 18),
(68, 'wx_app_secret', '微信(分享)appSecret', 'e4730c1c7702cf6898eb87356ca85efd', 0, '基础配置', 19),
(71, 'order_has_bind_mobile', '下单时需要绑定手机号码', '1', 0, '基础配置', 22);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_m_config_list`
--

CREATE TABLE IF NOT EXISTS `fanwe_m_config_list` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pay_id` varchar(50) DEFAULT NULL,
  `group` int(10) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `has_calc` int(1) DEFAULT NULL,
  `money` float(10,2) DEFAULT NULL,
  `is_verify` int(1) DEFAULT '0' COMMENT '0:无效；1:有效',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `fanwe_m_config_list`
--

INSERT INTO `fanwe_m_config_list` (`id`, `pay_id`, `group`, `code`, `title`, `has_calc`, `money`, `is_verify`) VALUES
(1, '0', 1, 'Malipay', '支付宝/各银行', 1, 0.00, 0),
(2, '0', 1, 'Mcod', '货到付款', 1, 0.00, 0),
(3, '', 5, '1', '家', 0, 0.00, 1),
(4, '', 5, '2', '公司', 0, 0.00, 1),
(5, '0', 1, 'Walipay', '支付宝支付', 1, 0.00, 0),
(6, '0', 1, 'Wtenpay', '财付通支付', 1, 0.00, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_m_index`
--

CREATE TABLE IF NOT EXISTS `fanwe_m_index` (
  `id` mediumint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `vice_name` varchar(100) DEFAULT NULL,
  `desc` varchar(100) DEFAULT '',
  `img` varchar(255) DEFAULT '',
  `type` tinyint(1) DEFAULT '0' COMMENT '1.标签集,2.url地址,3.分类排行,4.最亮达人,5.搜索发现,6.一起拍,7.热门单品排行,8.直接显示某个分享',
  `data` text,
  `sort` smallint(5) DEFAULT '10',
  `status` tinyint(1) DEFAULT '1',
  `is_hot` tinyint(1) DEFAULT '0',
  `is_new` tinyint(1) DEFAULT '0',
  `city_id` int(11) DEFAULT '0',
  `mobile_type` tinyint(1) DEFAULT '0' COMMENT '手机类型0:ios/android; 1:wap',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- 转存表中的数据 `fanwe_m_index`
--

INSERT INTO `fanwe_m_index` (`id`, `name`, `vice_name`, `desc`, `img`, `type`, `data`, `sort`, `status`, `is_hot`, `is_new`, `city_id`, `mobile_type`) VALUES
(18, '优惠列表', '优惠列表', '优惠列表', './public/attachment/201411/22/09/546fe4dc75496.png', 12, 'a:1:{s:7:"cate_id";i:0;}', 12, 1, 0, 0, 0, 0),
(19, '团购列表', '团购列表', '团购列表', './public/attachment/201411/22/09/546fe4d40359e.png', 9, 'a:1:{s:7:"cate_id";i:0;}', 11, 1, 0, 0, 0, 0),
(20, '商城列表', '商城列表', '商城列表', './public/attachment/201411/22/09/546fe4c4b8f64.png', 10, 'a:1:{s:7:"cate_id";i:0;}', 10, 1, 0, 0, 0, 0),
(21, '优惠首页', '优惠首页', '优惠首页', './public/attachment/201411/22/09/546fe4b786190.png', 2, 'a:1:{s:3:"url";s:0:"";}', 9, 1, 0, 0, 0, 0),
(23, '团购明细', '', '', './public/attachment/201411/22/09/546fe53b912d2.png', 14, 'a:1:{s:7:"data_id";i:0;}', 8, 1, 0, 0, 0, 0),
(24, '商家列表', '', '', './public/attachment/201411/22/09/546fe56a80f23.png', 22, 'a:1:{s:7:"cate_id";i:0;}', 7, 1, 0, 0, 0, 0),
(25, '商品明细', '', '', './public/attachment/201411/22/09/546fe59447d25.png', 15, 'a:1:{s:7:"data_id";i:0;}', 6, 1, 0, 0, 0, 0),
(26, '更多优惠', '', '', './public/attachment/201411/22/09/546fe5aba7ba5.png', 2, 'a:1:{s:3:"url";s:0:"";}', 5, 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_nav`
--

CREATE TABLE IF NOT EXISTS `fanwe_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `blank` tinyint(1) NOT NULL,
  `sort` int(11) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `u_module` varchar(255) NOT NULL,
  `u_action` varchar(255) NOT NULL,
  `u_id` int(11) NOT NULL,
  `u_param` varchar(255) NOT NULL,
  `is_shop` tinyint(1) NOT NULL,
  `app_index` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=41 ;

--
-- 转存表中的数据 `fanwe_nav`
--

INSERT INTO `fanwe_nav` (`id`, `name`, `url`, `blank`, `sort`, `is_effect`, `u_module`, `u_action`, `u_id`, `u_param`, `is_shop`, `app_index`) VALUES
(32, '团购', '', 0, 0, 1, 'tuan', '', 0, '', 0, 'tuan'),
(20, '首页', '', 0, 5, 1, 'shop', '', 0, '', 0, 'shop'),
(31, '商城', '', 0, 0, 1, 'mall', '', 0, '', 0, 'shop'),
(33, '活动', '', 0, 0, 1, 'event', '', 0, '', 0, 'youhui'),
(34, '商家', '', 0, 0, 1, 'store', '', 0, '', 0, 'youhui'),
(35, '达人秀', '', 0, 0, 1, 'daren', '', 0, '', 0, 'shop'),
(36, '小组', '', 0, 0, 1, 'group', 'index', 0, '', 0, 'shop'),
(37, '发现', '', 0, 0, 1, 'discover', 'index', 0, '', 0, 'shop'),
(38, '品牌商家', '', 0, 0, 1, 'store', 'brand', 0, '', 0, 'youhui'),
(39, '优惠券', '', 0, 0, 1, 'youhui_index', '', 0, '', 0, 'youhui'),
(40, '代金券', '', 0, 0, 1, 'daijin_index', '', 0, '', 0, 'daijin');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_payment`
--

CREATE TABLE IF NOT EXISTS `fanwe_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `online_pay` tinyint(1) NOT NULL,
  `fee_amount` double(20,4) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `total_amount` double(20,4) NOT NULL,
  `config` text NOT NULL,
  `logo` varchar(255) NOT NULL,
  `sort` int(11) NOT NULL,
  `fee_type` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `fanwe_payment`
--

INSERT INTO `fanwe_payment` (`id`, `class_name`, `is_effect`, `online_pay`, `fee_amount`, `name`, `description`, `total_amount`, `config`, `logo`, `sort`, `fee_type`) VALUES
(15, 'Account', 1, 1, 0.0000, '余额支付', '', 0.0000, 'N;', '', 1, 0),
(16, 'AlipayBank', 1, 1, 0.0000, '支付宝银行直连支付', '', 525.0000, 'a:4:{s:14:"alipay_partner";s:0:"";s:14:"alipay_account";s:0:"";s:10:"alipay_key";s:0:"";s:14:"alipay_gateway";a:17:{s:7:"ICBCB2C";s:1:"1";s:3:"CMB";s:1:"1";s:3:"CCB";s:1:"1";s:3:"ABC";s:1:"1";s:4:"SPDB";s:1:"1";s:3:"SDB";s:1:"1";s:3:"CIB";s:1:"1";s:6:"BJBANK";s:1:"1";s:7:"CEBBANK";s:1:"1";s:4:"CMBC";s:1:"1";s:5:"CITIC";s:1:"1";s:3:"GDB";s:1:"1";s:7:"SPABANK";s:1:"1";s:6:"BOCB2C";s:1:"1";s:4:"COMM";s:1:"1";s:7:"ICBCBTB";s:1:"1";s:10:"PSBC-DEBIT";s:1:"1";}}', '', 2, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_payment_notice`
--

CREATE TABLE IF NOT EXISTS `fanwe_payment_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_sn` varchar(255) NOT NULL,
  `create_time` int(11) NOT NULL,
  `pay_time` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `is_paid` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `memo` text NOT NULL,
  `money` decimal(20,4) NOT NULL,
  `outer_notice_sn` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `notice_sn_unk` (`notice_sn`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=95 ;

--
-- 转存表中的数据 `fanwe_payment_notice`
--

INSERT INTO `fanwe_payment_notice` (`id`, `notice_sn`, `create_time`, `pay_time`, `order_id`, `is_paid`, `user_id`, `payment_id`, `memo`, `money`, `outer_notice_sn`) VALUES
(94, '2012010202251477', 1325456714, 1325456714, 24, 1, 41, 16, '', 525.0000, ''),
(93, '2012010202245854', 1325456698, 0, 24, 0, 41, 16, '', 525.0000, '');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_point_group`
--

CREATE TABLE IF NOT EXISTS `fanwe_point_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `fanwe_point_group`
--

INSERT INTO `fanwe_point_group` (`id`, `name`, `sort`) VALUES
(1, '卫生', 100),
(2, '服务', 100);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_point_group_link`
--

CREATE TABLE IF NOT EXISTS `fanwe_point_group_link` (
  `point_group_id` int(11) NOT NULL COMMENT '商户子类点评评分分组ID fanwe_merchant_type_point_group',
  `category_id` int(11) NOT NULL,
  KEY `group_id` (`point_group_id`) USING BTREE,
  KEY `type_id` (`category_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_point_group_link`
--

INSERT INTO `fanwe_point_group_link` (`point_group_id`, `category_id`) VALUES
(2, 12),
(2, 11),
(1, 10),
(2, 10),
(2, 9),
(1, 8),
(2, 8),
(1, 14),
(2, 14),
(1, 15),
(1, 16),
(2, 16),
(1, 17),
(2, 17);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_promote`
--

CREATE TABLE IF NOT EXISTS `fanwe_promote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) NOT NULL,
  `sort` int(11) NOT NULL,
  `config` text NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `fanwe_promote`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_promote_msg`
--

CREATE TABLE IF NOT EXISTS `fanwe_promote_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `send_time` int(11) NOT NULL,
  `send_status` tinyint(1) NOT NULL,
  `deal_id` int(11) NOT NULL,
  `send_type` tinyint(1) NOT NULL,
  `send_type_id` int(11) NOT NULL,
  `send_define_data` text NOT NULL,
  `is_html` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `fanwe_promote_msg`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_promote_msg_list`
--

CREATE TABLE IF NOT EXISTS `fanwe_promote_msg_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dest` varchar(255) NOT NULL,
  `send_type` tinyint(1) NOT NULL,
  `content` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `send_time` int(11) NOT NULL,
  `is_send` tinyint(1) NOT NULL,
  `create_time` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `result` text NOT NULL,
  `is_success` tinyint(1) NOT NULL,
  `is_html` tinyint(1) NOT NULL,
  `msg_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dest_idx` (`dest`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `fanwe_promote_msg_list`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_referrals`
--

CREATE TABLE IF NOT EXISTS `fanwe_referrals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `rel_user_id` int(11) NOT NULL,
  `money` double(20,4) NOT NULL,
  `create_time` int(11) NOT NULL,
  `pay_time` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `fanwe_referrals`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_region_conf`
--

CREATE TABLE IF NOT EXISTS `fanwe_region_conf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '地区名称',
  `region_level` tinyint(4) NOT NULL COMMENT '1:国 2:省 3:市(县) 4:区(镇)',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3401 ;

--
-- 转存表中的数据 `fanwe_region_conf`
--

INSERT INTO `fanwe_region_conf` (`id`, `pid`, `name`, `region_level`) VALUES
(3, 1, '安徽', 2),
(4, 1, '福建', 2),
(5, 1, '甘肃', 2),
(6, 1, '广东', 2),
(7, 1, '广西', 2),
(8, 1, '贵州', 2),
(9, 1, '海南', 2),
(10, 1, '河北', 2),
(11, 1, '河南', 2),
(12, 1, '黑龙江', 2),
(13, 1, '湖北', 2),
(14, 1, '湖南', 2),
(15, 1, '吉林', 2),
(16, 1, '江苏', 2),
(17, 1, '江西', 2),
(18, 1, '辽宁', 2),
(19, 1, '内蒙古', 2),
(20, 1, '宁夏', 2),
(21, 1, '青海', 2),
(22, 1, '山东', 2),
(23, 1, '山西', 2),
(24, 1, '陕西', 2),
(26, 1, '四川', 2),
(28, 1, '西藏', 2),
(29, 1, '新疆', 2),
(30, 1, '云南', 2),
(31, 1, '浙江', 2),
(36, 3, '安庆', 3),
(37, 3, '蚌埠', 3),
(38, 3, '巢湖', 3),
(39, 3, '池州', 3),
(40, 3, '滁州', 3),
(41, 3, '阜阳', 3),
(42, 3, '淮北', 3),
(43, 3, '淮南', 3),
(44, 3, '黄山', 3),
(45, 3, '六安', 3),
(46, 3, '马鞍山', 3),
(47, 3, '宿州', 3),
(48, 3, '铜陵', 3),
(49, 3, '芜湖', 3),
(50, 3, '宣城', 3),
(51, 3, '亳州', 3),
(52, 2, '北京', 2),
(53, 4, '福州', 3),
(54, 4, '龙岩', 3),
(55, 4, '南平', 3),
(56, 4, '宁德', 3),
(57, 4, '莆田', 3),
(58, 4, '泉州', 3),
(59, 4, '三明', 3),
(60, 4, '厦门', 3),
(61, 4, '漳州', 3),
(62, 5, '兰州', 3),
(63, 5, '白银', 3),
(64, 5, '定西', 3),
(65, 5, '甘南', 3),
(66, 5, '嘉峪关', 3),
(67, 5, '金昌', 3),
(68, 5, '酒泉', 3),
(69, 5, '临夏', 3),
(70, 5, '陇南', 3),
(71, 5, '平凉', 3),
(72, 5, '庆阳', 3),
(73, 5, '天水', 3),
(74, 5, '武威', 3),
(75, 5, '张掖', 3),
(76, 6, '广州', 3),
(77, 6, '深圳', 3),
(78, 6, '潮州', 3),
(79, 6, '东莞', 3),
(80, 6, '佛山', 3),
(81, 6, '河源', 3),
(82, 6, '惠州', 3),
(83, 6, '江门', 3),
(84, 6, '揭阳', 3),
(85, 6, '茂名', 3),
(86, 6, '梅州', 3),
(87, 6, '清远', 3),
(88, 6, '汕头', 3),
(89, 6, '汕尾', 3),
(90, 6, '韶关', 3),
(91, 6, '阳江', 3),
(92, 6, '云浮', 3),
(93, 6, '湛江', 3),
(94, 6, '肇庆', 3),
(95, 6, '中山', 3),
(96, 6, '珠海', 3),
(97, 7, '南宁', 3),
(98, 7, '桂林', 3),
(99, 7, '百色', 3),
(100, 7, '北海', 3),
(101, 7, '崇左', 3),
(102, 7, '防城港', 3),
(103, 7, '贵港', 3),
(104, 7, '河池', 3),
(105, 7, '贺州', 3),
(106, 7, '来宾', 3),
(107, 7, '柳州', 3),
(108, 7, '钦州', 3),
(109, 7, '梧州', 3),
(110, 7, '玉林', 3),
(111, 8, '贵阳', 3),
(112, 8, '安顺', 3),
(113, 8, '毕节', 3),
(114, 8, '六盘水', 3),
(115, 8, '黔东南', 3),
(116, 8, '黔南', 3),
(117, 8, '黔西南', 3),
(118, 8, '铜仁', 3),
(119, 8, '遵义', 3),
(120, 9, '海口', 3),
(121, 9, '三亚', 3),
(122, 9, '白沙', 3),
(123, 9, '保亭', 3),
(124, 9, '昌江', 3),
(125, 9, '澄迈县', 3),
(126, 9, '定安县', 3),
(127, 9, '东方', 3),
(128, 9, '乐东', 3),
(129, 9, '临高县', 3),
(130, 9, '陵水', 3),
(131, 9, '琼海', 3),
(132, 9, '琼中', 3),
(133, 9, '屯昌县', 3),
(134, 9, '万宁', 3),
(135, 9, '文昌', 3),
(136, 9, '五指山', 3),
(137, 9, '儋州', 3),
(138, 10, '石家庄', 3),
(139, 10, '保定', 3),
(140, 10, '沧州', 3),
(141, 10, '承德', 3),
(142, 10, '邯郸', 3),
(143, 10, '衡水', 3),
(144, 10, '廊坊', 3),
(145, 10, '秦皇岛', 3),
(146, 10, '唐山', 3),
(147, 10, '邢台', 3),
(148, 10, '张家口', 3),
(149, 11, '郑州', 3),
(150, 11, '洛阳', 3),
(151, 11, '开封', 3),
(152, 11, '安阳', 3),
(153, 11, '鹤壁', 3),
(154, 11, '济源', 3),
(155, 11, '焦作', 3),
(156, 11, '南阳', 3),
(157, 11, '平顶山', 3),
(158, 11, '三门峡', 3),
(159, 11, '商丘', 3),
(160, 11, '新乡', 3),
(161, 11, '信阳', 3),
(162, 11, '许昌', 3),
(163, 11, '周口', 3),
(164, 11, '驻马店', 3),
(165, 11, '漯河', 3),
(166, 11, '濮阳', 3),
(167, 12, '哈尔滨', 3),
(168, 12, '大庆', 3),
(169, 12, '大兴安岭', 3),
(170, 12, '鹤岗', 3),
(171, 12, '黑河', 3),
(172, 12, '鸡西', 3),
(173, 12, '佳木斯', 3),
(174, 12, '牡丹江', 3),
(175, 12, '七台河', 3),
(176, 12, '齐齐哈尔', 3),
(177, 12, '双鸭山', 3),
(178, 12, '绥化', 3),
(179, 12, '伊春', 3),
(180, 13, '武汉', 3),
(181, 13, '仙桃', 3),
(182, 13, '鄂州', 3),
(183, 13, '黄冈', 3),
(184, 13, '黄石', 3),
(185, 13, '荆门', 3),
(186, 13, '荆州', 3),
(187, 13, '潜江', 3),
(188, 13, '神农架林区', 3),
(189, 13, '十堰', 3),
(190, 13, '随州', 3),
(191, 13, '天门', 3),
(192, 13, '咸宁', 3),
(193, 13, '襄樊', 3),
(194, 13, '孝感', 3),
(195, 13, '宜昌', 3),
(196, 13, '恩施', 3),
(197, 14, '长沙', 3),
(198, 14, '张家界', 3),
(199, 14, '常德', 3),
(200, 14, '郴州', 3),
(201, 14, '衡阳', 3),
(202, 14, '怀化', 3),
(203, 14, '娄底', 3),
(204, 14, '邵阳', 3),
(205, 14, '湘潭', 3),
(206, 14, '湘西', 3),
(207, 14, '益阳', 3),
(208, 14, '永州', 3),
(209, 14, '岳阳', 3),
(210, 14, '株洲', 3),
(211, 15, '长春', 3),
(212, 15, '吉林', 3),
(213, 15, '白城', 3),
(214, 15, '白山', 3),
(215, 15, '辽源', 3),
(216, 15, '四平', 3),
(217, 15, '松原', 3),
(218, 15, '通化', 3),
(219, 15, '延边', 3),
(220, 16, '南京', 3),
(221, 16, '苏州', 3),
(222, 16, '无锡', 3),
(223, 16, '常州', 3),
(224, 16, '淮安', 3),
(225, 16, '连云港', 3),
(226, 16, '南通', 3),
(227, 16, '宿迁', 3),
(228, 16, '泰州', 3),
(229, 16, '徐州', 3),
(230, 16, '盐城', 3),
(231, 16, '扬州', 3),
(232, 16, '镇江', 3),
(233, 17, '南昌', 3),
(234, 17, '抚州', 3),
(235, 17, '赣州', 3),
(236, 17, '吉安', 3),
(237, 17, '景德镇', 3),
(238, 17, '九江', 3),
(239, 17, '萍乡', 3),
(240, 17, '上饶', 3),
(241, 17, '新余', 3),
(242, 17, '宜春', 3),
(243, 17, '鹰潭', 3),
(244, 18, '沈阳', 3),
(245, 18, '大连', 3),
(246, 18, '鞍山', 3),
(247, 18, '本溪', 3),
(248, 18, '朝阳', 3),
(249, 18, '丹东', 3),
(250, 18, '抚顺', 3),
(251, 18, '阜新', 3),
(252, 18, '葫芦岛', 3),
(253, 18, '锦州', 3),
(254, 18, '辽阳', 3),
(255, 18, '盘锦', 3),
(256, 18, '铁岭', 3),
(257, 18, '营口', 3),
(258, 19, '呼和浩特', 3),
(259, 19, '阿拉善盟', 3),
(260, 19, '巴彦淖尔盟', 3),
(261, 19, '包头', 3),
(262, 19, '赤峰', 3),
(263, 19, '鄂尔多斯', 3),
(264, 19, '呼伦贝尔', 3),
(265, 19, '通辽', 3),
(266, 19, '乌海', 3),
(267, 19, '乌兰察布市', 3),
(268, 19, '锡林郭勒盟', 3),
(269, 19, '兴安盟', 3),
(270, 20, '银川', 3),
(271, 20, '固原', 3),
(272, 20, '石嘴山', 3),
(273, 20, '吴忠', 3),
(274, 20, '中卫', 3),
(275, 21, '西宁', 3),
(276, 21, '果洛', 3),
(277, 21, '海北', 3),
(278, 21, '海东', 3),
(279, 21, '海南', 3),
(280, 21, '海西', 3),
(281, 21, '黄南', 3),
(282, 21, '玉树', 3),
(283, 22, '济南', 3),
(284, 22, '青岛', 3),
(285, 22, '滨州', 3),
(286, 22, '德州', 3),
(287, 22, '东营', 3),
(288, 22, '菏泽', 3),
(289, 22, '济宁', 3),
(290, 22, '莱芜', 3),
(291, 22, '聊城', 3),
(292, 22, '临沂', 3),
(293, 22, '日照', 3),
(294, 22, '泰安', 3),
(295, 22, '威海', 3),
(296, 22, '潍坊', 3),
(297, 22, '烟台', 3),
(298, 22, '枣庄', 3),
(299, 22, '淄博', 3),
(300, 23, '太原', 3),
(301, 23, '长治', 3),
(302, 23, '大同', 3),
(303, 23, '晋城', 3),
(304, 23, '晋中', 3),
(305, 23, '临汾', 3),
(306, 23, '吕梁', 3),
(307, 23, '朔州', 3),
(308, 23, '忻州', 3),
(309, 23, '阳泉', 3),
(310, 23, '运城', 3),
(311, 24, '西安', 3),
(312, 24, '安康', 3),
(313, 24, '宝鸡', 3),
(314, 24, '汉中', 3),
(315, 24, '商洛', 3),
(316, 24, '铜川', 3),
(317, 24, '渭南', 3),
(318, 24, '咸阳', 3),
(319, 24, '延安', 3),
(320, 24, '榆林', 3),
(321, 25, '上海', 2),
(322, 26, '成都', 3),
(323, 26, '绵阳', 3),
(324, 26, '阿坝', 3),
(325, 26, '巴中', 3),
(326, 26, '达州', 3),
(327, 26, '德阳', 3),
(328, 26, '甘孜', 3),
(329, 26, '广安', 3),
(330, 26, '广元', 3),
(331, 26, '乐山', 3),
(332, 26, '凉山', 3),
(333, 26, '眉山', 3),
(334, 26, '南充', 3),
(335, 26, '内江', 3),
(336, 26, '攀枝花', 3),
(337, 26, '遂宁', 3),
(338, 26, '雅安', 3),
(339, 26, '宜宾', 3),
(340, 26, '资阳', 3),
(341, 26, '自贡', 3),
(342, 26, '泸州', 3),
(343, 27, '天津', 2),
(344, 28, '拉萨', 3),
(345, 28, '阿里', 3),
(346, 28, '昌都', 3),
(347, 28, '林芝', 3),
(348, 28, '那曲', 3),
(349, 28, '日喀则', 3),
(350, 28, '山南', 3),
(351, 29, '乌鲁木齐', 3),
(352, 29, '阿克苏', 3),
(353, 29, '阿拉尔', 3),
(354, 29, '巴音郭楞', 3),
(355, 29, '博尔塔拉', 3),
(356, 29, '昌吉', 3),
(357, 29, '哈密', 3),
(358, 29, '和田', 3),
(359, 29, '喀什', 3),
(360, 29, '克拉玛依', 3),
(361, 29, '克孜勒苏', 3),
(362, 29, '石河子', 3),
(363, 29, '图木舒克', 3),
(364, 29, '吐鲁番', 3),
(365, 29, '五家渠', 3),
(366, 29, '伊犁', 3),
(367, 30, '昆明', 3),
(368, 30, '怒江', 3),
(369, 30, '普洱', 3),
(370, 30, '丽江', 3),
(371, 30, '保山', 3),
(372, 30, '楚雄', 3),
(373, 30, '大理', 3),
(374, 30, '德宏', 3),
(375, 30, '迪庆', 3),
(376, 30, '红河', 3),
(377, 30, '临沧', 3),
(378, 30, '曲靖', 3),
(379, 30, '文山', 3),
(380, 30, '西双版纳', 3),
(381, 30, '玉溪', 3),
(382, 30, '昭通', 3),
(383, 31, '杭州', 3),
(384, 31, '湖州', 3),
(385, 31, '嘉兴', 3),
(386, 31, '金华', 3),
(387, 31, '丽水', 3),
(388, 31, '宁波', 3),
(389, 31, '绍兴', 3),
(390, 31, '台州', 3),
(391, 31, '温州', 3),
(392, 31, '舟山', 3),
(393, 31, '衢州', 3),
(394, 32, '重庆', 2),
(395, 33, '香港', 2),
(396, 34, '澳门', 2),
(397, 35, '台湾', 2),
(500, 52, '东城区', 3),
(501, 52, '西城区', 3),
(502, 52, '海淀区', 3),
(503, 52, '朝阳区', 3),
(504, 52, '崇文区', 3),
(505, 52, '宣武区', 3),
(506, 52, '丰台区', 3),
(507, 52, '石景山区', 3),
(508, 52, '房山区', 3),
(509, 52, '门头沟区', 3),
(510, 52, '通州区', 3),
(511, 52, '顺义区', 3),
(512, 52, '昌平区', 3),
(513, 52, '怀柔区', 3),
(514, 52, '平谷区', 3),
(515, 52, '大兴区', 3),
(516, 52, '密云县', 3),
(517, 52, '延庆县', 3),
(2703, 321, '长宁区', 3),
(2704, 321, '闸北区', 3),
(2705, 321, '闵行区', 3),
(2706, 321, '徐汇区', 3),
(2707, 321, '浦东新区', 3),
(2708, 321, '杨浦区', 3),
(2709, 321, '普陀区', 3),
(2710, 321, '静安区', 3),
(2711, 321, '卢湾区', 3),
(2712, 321, '虹口区', 3),
(2713, 321, '黄浦区', 3),
(2714, 321, '南汇区', 3),
(2715, 321, '松江区', 3),
(2716, 321, '嘉定区', 3),
(2717, 321, '宝山区', 3),
(2718, 321, '青浦区', 3),
(2719, 321, '金山区', 3),
(2720, 321, '奉贤区', 3),
(2721, 321, '崇明县', 3),
(2912, 343, '和平区', 3),
(2913, 343, '河西区', 3),
(2914, 343, '南开区', 3),
(2915, 343, '河北区', 3),
(2916, 343, '河东区', 3),
(2917, 343, '红桥区', 3),
(2918, 343, '东丽区', 3),
(2919, 343, '津南区', 3),
(2920, 343, '西青区', 3),
(2921, 343, '北辰区', 3),
(2922, 343, '塘沽区', 3),
(2923, 343, '汉沽区', 3),
(2924, 343, '大港区', 3),
(2925, 343, '武清区', 3),
(2926, 343, '宝坻区', 3),
(2927, 343, '经济开发区', 3),
(2928, 343, '宁河县', 3),
(2929, 343, '静海县', 3),
(2930, 343, '蓟县', 3),
(3325, 394, '合川区', 3),
(3326, 394, '江津区', 3),
(3327, 394, '南川区', 3),
(3328, 394, '永川区', 3),
(3329, 394, '南岸区', 3),
(3330, 394, '渝北区', 3),
(3331, 394, '万盛区', 3),
(3332, 394, '大渡口区', 3),
(3333, 394, '万州区', 3),
(3334, 394, '北碚区', 3),
(3335, 394, '沙坪坝区', 3),
(3336, 394, '巴南区', 3),
(3337, 394, '涪陵区', 3),
(3338, 394, '江北区', 3),
(3339, 394, '九龙坡区', 3),
(3340, 394, '渝中区', 3),
(3341, 394, '黔江开发区', 3),
(3342, 394, '长寿区', 3),
(3343, 394, '双桥区', 3),
(3344, 394, '綦江县', 3),
(3345, 394, '潼南县', 3),
(3346, 394, '铜梁县', 3),
(3347, 394, '大足县', 3),
(3348, 394, '荣昌县', 3),
(3349, 394, '璧山县', 3),
(3350, 394, '垫江县', 3),
(3351, 394, '武隆县', 3),
(3352, 394, '丰都县', 3),
(3353, 394, '城口县', 3),
(3354, 394, '梁平县', 3),
(3355, 394, '开县', 3),
(3356, 394, '巫溪县', 3),
(3357, 394, '巫山县', 3),
(3358, 394, '奉节县', 3),
(3359, 394, '云阳县', 3),
(3360, 394, '忠县', 3),
(3361, 394, '石柱', 3),
(3362, 394, '彭水', 3),
(3363, 394, '酉阳', 3),
(3364, 394, '秀山', 3),
(3365, 395, '沙田区', 3),
(3366, 395, '东区', 3),
(3367, 395, '观塘区', 3),
(3368, 395, '黄大仙区', 3),
(3369, 395, '九龙城区', 3),
(3370, 395, '屯门区', 3),
(3371, 395, '葵青区', 3),
(3372, 395, '元朗区', 3),
(3373, 395, '深水埗区', 3),
(3374, 395, '西贡区', 3),
(3375, 395, '大埔区', 3),
(3376, 395, '湾仔区', 3),
(3377, 395, '油尖旺区', 3),
(3378, 395, '北区', 3),
(3379, 395, '南区', 3),
(3380, 395, '荃湾区', 3),
(3381, 395, '中西区', 3),
(3382, 395, '离岛区', 3),
(3383, 396, '澳门', 3),
(3384, 397, '台北', 3),
(3385, 397, '高雄', 3),
(3386, 397, '基隆', 3),
(3387, 397, '台中', 3),
(3388, 397, '台南', 3),
(3389, 397, '新竹', 3),
(3390, 397, '嘉义', 3),
(3391, 397, '宜兰县', 3),
(3392, 397, '桃园县', 3),
(3393, 397, '苗栗县', 3),
(3394, 397, '彰化县', 3),
(3395, 397, '南投县', 3),
(3396, 397, '云林县', 3),
(3397, 397, '屏东县', 3),
(3398, 397, '台东县', 3),
(3399, 397, '花莲县', 3),
(3400, 397, '澎湖县', 3);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_remind_count`
--

CREATE TABLE IF NOT EXISTS `fanwe_remind_count` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_count` int(11) NOT NULL COMMENT '分享数',
  `topic_count_time` int(11) NOT NULL,
  `dp_count` int(11) NOT NULL,
  `dp_count_time` int(11) NOT NULL,
  `msg_count` int(11) NOT NULL COMMENT '会员留言',
  `msg_count_time` int(11) NOT NULL,
  `buy_msg_count` int(11) NOT NULL,
  `buy_msg_count_time` int(11) NOT NULL,
  `order_count` int(11) NOT NULL,
  `order_count_time` int(11) NOT NULL,
  `refund_count` int(11) NOT NULL,
  `refund_count_time` int(11) NOT NULL,
  `retake_count` int(11) NOT NULL,
  `retake_count_time` int(11) NOT NULL,
  `incharge_count` int(11) NOT NULL,
  `incharge_count_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `fanwe_remind_count`
--

INSERT INTO `fanwe_remind_count` (`id`, `topic_count`, `topic_count_time`, `dp_count`, `dp_count_time`, `msg_count`, `msg_count_time`, `buy_msg_count`, `buy_msg_count_time`, `order_count`, `order_count_time`, `refund_count`, `refund_count_time`, `retake_count`, `retake_count_time`, `incharge_count`, `incharge_count_time`) VALUES
(1, 0, 1416594323, 0, 1416594371, 0, 1416594323, 0, 1416594323, 0, 1416594315, 0, 1416594315, 0, 1416594315, 0, 1416594312);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_role`
--

CREATE TABLE IF NOT EXISTS `fanwe_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `fanwe_role`
--

INSERT INTO `fanwe_role` (`id`, `name`, `is_effect`, `is_delete`) VALUES
(4, '测试管理员', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_role_access`
--

CREATE TABLE IF NOT EXISTS `fanwe_role_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `node_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=87 ;

--
-- 转存表中的数据 `fanwe_role_access`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_role_group`
--

CREATE TABLE IF NOT EXISTS `fanwe_role_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `nav_id` int(11) NOT NULL COMMENT '后台导航分组ID',
  `is_delete` tinyint(1) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=70 ;

--
-- 转存表中的数据 `fanwe_role_group`
--

INSERT INTO `fanwe_role_group` (`id`, `name`, `nav_id`, `is_delete`, `is_effect`, `sort`) VALUES
(1, '首页', 1, 0, 1, 1),
(34, '生活服务分类', 6, 0, 1, 11),
(5, '系统设置', 3, 0, 1, 1),
(7, '管理员', 3, 0, 1, 2),
(8, '数据库操作', 3, 0, 1, 6),
(9, '系统日志', 3, 0, 1, 7),
(10, '文章管理', 5, 0, 1, 8),
(11, '文章分类管理', 5, 0, 1, 9),
(12, '商品管理', 6, 0, 1, 10),
(13, '类型属性', 6, 0, 1, 11),
(14, '供应商', 12, 0, 1, 12),
(15, '城市管理', 12, 0, 1, 13),
(16, '支付接口', 8, 0, 1, 14),
(17, '配送方式', 8, 0, 1, 15),
(18, '会员管理', 7, 0, 1, 16),
(19, '前端设置', 5, 0, 1, 17),
(20, '促销接口', 6, 0, 1, 18),
(21, '消息模板管理', 10, 0, 1, 19),
(22, '会员返利', 7, 0, 1, 20),
(23, '订单管理', 8, 0, 1, 13),
(24, '充值订单', 8, 0, 1, 13),
(35, '会员配置', 7, 0, 1, 19),
(26, '消息留言分组', 7, 0, 1, 24),
(27, '消息留言管理', 7, 0, 1, 25),
(28, '邮件管理', 10, 0, 1, 26),
(29, '短信管理', 10, 0, 1, 27),
(30, '代金券', 7, 0, 1, 28),
(31, '广告设置', 5, 0, 1, 29),
(32, '会员整合', 7, 0, 1, 30),
(33, '队列管理', 10, 0, 1, 31),
(36, '友情链接', 5, 0, 1, 32),
(55, 'API登录', 7, 0, 1, 33),
(56, '商城分类', 6, 0, 1, 10),
(57, '商品筛选', 6, 0, 1, 10),
(58, '商圈地区', 12, 0, 1, 50),
(59, '商家优惠券', 12, 0, 1, 50),
(60, '分享标签设置', 3, 0, 1, 10),
(62, '手机端设置', 3, 0, 1, 1),
(63, '商户标签分组管理', 12, 0, 1, 13),
(64, '商户点评评分分组管理', 12, 0, 1, 14),
(65, '活动管理', 12, 0, 1, 14),
(66, '站内消息', 7, 0, 1, 20),
(67, '商户图片分组管理', 12, 0, 1, 13),
(68, '报表与结算', 8, 0, 1, 14),
(69, '商品活动管理', 12, 0, 1, 51);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_role_module`
--

CREATE TABLE IF NOT EXISTS `fanwe_role_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=114 ;

--
-- 转存表中的数据 `fanwe_role_module`
--

INSERT INTO `fanwe_role_module` (`id`, `module`, `name`, `is_effect`, `is_delete`) VALUES
(5, 'Role', '权限组别', 1, 0),
(6, 'Admin', '管理员', 1, 0),
(12, 'Conf', '系统配置', 1, 0),
(13, 'Database', '数据库', 1, 0),
(15, 'Log', '系统日志', 1, 0),
(17, 'Article', '文章模块', 1, 0),
(18, 'ArticleCate', '文章分类', 1, 0),
(19, 'File', '文件管理', 1, 0),
(20, 'DealCity', '团购城市', 1, 0),
(58, 'Index', '首页', 1, 0),
(22, 'Supplier', '供应商', 1, 0),
(25, 'SupplierAccount', '供应商帐号', 1, 0),
(24, 'SupplierLocation', '供应商分店与部门', 1, 0),
(26, 'GoodsType', '商品类型', 1, 0),
(27, 'GoodsTypeAttr', '商品类型属性', 1, 0),
(28, 'DealCate', '生活服务分类', 1, 0),
(29, 'Deal', '商品管理', 1, 0),
(30, 'DealCoupon', '团购券', 1, 0),
(31, 'WeightUnit', '重量单位', 1, 0),
(32, 'UserField', '会员字段', 1, 0),
(33, 'UserGroup', '会员组别', 1, 0),
(34, 'User', '会员', 1, 0),
(35, 'Delivery', '配送方式', 1, 0),
(36, 'Nav', '导航菜单', 1, 0),
(37, 'Payment', '支付方式', 1, 0),
(38, 'Promote', '促销接口', 1, 0),
(39, 'MsgTemplate', '消息模板', 1, 0),
(40, 'Referrals', '邀请返利', 1, 0),
(41, 'DealOrder', '订单模块', 1, 0),
(42, 'PaymentNotice', '收款单', 1, 0),
(44, 'MessageType', '消息留言分组', 1, 0),
(45, 'Message', '消息留言', 1, 0),
(46, 'MailList', '邮件订阅', 1, 0),
(47, 'MailServer', '邮件服务器', 1, 0),
(48, 'Sms', '短信接口', 1, 0),
(49, 'EcvType', '代金券类型', 1, 0),
(50, 'Ecv', '代金券', 1, 0),
(51, 'MobileList', '短信订阅列表', 1, 0),
(52, 'PromoteMsg', '推广邮件短信', 1, 0),
(53, 'Adv', '广告模块', 1, 0),
(54, 'Vote', '投票调查', 1, 0),
(55, 'Integrate', '会员整合', 1, 0),
(56, 'DealMsgList', '业务群发队列', 1, 0),
(57, 'PromoteMsgList', '推广群发队列', 1, 0),
(59, 'DeliveryRegion', '配送地区', 1, 0),
(60, 'LinkGroup', '友情链接分组', 1, 0),
(61, 'Link', '友情链接', 1, 0),
(77, 'ApiLogin', 'API登录', 1, 0),
(62, 'Express', '快递接口', 1, 0),
(78, 'ShopCate', '商城分类', 1, 0),
(79, 'FilterGroup', '筛选分组', 1, 0),
(80, 'Filter', '筛选关键词', 1, 0),
(81, 'Topic', '用户主题', 1, 0),
(82, 'TopicReply', '主题回复', 1, 0),
(83, 'TopicImage', '主题图片', 1, 0),
(84, 'Area', '商圈地区', 1, 0),
(85, 'Youhui', '优惠券', 1, 0),
(86, 'YouhuiLog', '优惠券下载日志', 1, 0),
(87, 'Brand', '品牌管理', 1, 0),
(88, 'TopicTagCate', '分享标签分类', 1, 0),
(89, 'TopicTag', '分享标签', 1, 0),
(90, 'TopicTitle', '分享话题', 1, 0),
(91, 'DealCateType', '生活服务子类', 1, 0),
(92, 'Cache', '缓存处理', 1, 0),
(93, 'MAdv', '手机端广告', 1, 0),
(94, 'MIndex', '手机端首页菜单', 1, 0),
(95, 'MApns', 'iPhone消息推送', 1, 0),
(96, 'TagGroup', '商户标签分组管理', 1, 0),
(97, 'PointGroup', '商户点评评分分组管理', 1, 0),
(98, 'Event', '活动管理', 1, 0),
(99, 'EventSubmit', '活动报名管理', 1, 0),
(100, 'MsgSystem', '站内消息群发', 1, 0),
(101, 'MsgBox', '消息记录', 1, 0),
(102, 'EventCate', '活动分类', 1, 0),
(103, 'FetchTopic', '分享采集', 1, 0),
(104, 'ImagesGroup', '商户图片分组管理', 1, 0),
(105, 'TopicGroupCate', '分享小组分类', 1, 0),
(106, 'TopicGroup', '分享小组', 1, 0),
(108, 'Medal', '勋章系统', 1, 0),
(107, 'UserLevel', '会员等级', 1, 0),
(109, 'SupplierSubmit', '商家入驻', 1, 0),
(110, 'DarenSubmit', '达人申请', 1, 0),
(111, 'Balance', '结算', 1, 0),
(112, 'Statistic', '报表', 1, 0),
(113, 'DealEvent', '商品活动', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_role_nav`
--

CREATE TABLE IF NOT EXISTS `fanwe_role_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `fanwe_role_nav`
--

INSERT INTO `fanwe_role_nav` (`id`, `name`, `is_delete`, `is_effect`, `sort`) VALUES
(1, '首页', 0, 1, 1),
(3, '系统设置', 0, 1, 10),
(5, '前端设置', 0, 1, 3),
(6, '商品管理', 0, 1, 2),
(7, '会员与留言', 0, 1, 4),
(8, '订单管理', 0, 1, 5),
(10, '短信邮件', 0, 1, 7),
(12, '优惠管理', 0, 1, 2);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_role_node`
--

CREATE TABLE IF NOT EXISTS `fanwe_role_node` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `group_id` int(11) NOT NULL COMMENT '后台分组菜单分组ID',
  `module_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=612 ;

--
-- 转存表中的数据 `fanwe_role_node`
--

INSERT INTO `fanwe_role_node` (`id`, `action`, `name`, `is_effect`, `is_delete`, `group_id`, `module_id`) VALUES
(334, 'main', '首页', 1, 0, 1, 58),
(11, 'index', '管理员分组列表', 1, 0, 7, 5),
(13, 'trash', '管理员分组回收站', 1, 0, 7, 5),
(14, 'index', '管理员列表', 1, 0, 7, 6),
(15, 'trash', '管理员回收站', 1, 0, 7, 6),
(16, 'index', '系统配置', 1, 0, 5, 12),
(17, 'index', '数据库备份列表', 1, 0, 8, 13),
(18, 'sql', 'SQL操作', 1, 0, 8, 13),
(19, 'index', '系统日志列表', 1, 0, 9, 15),
(20, 'index', '文章列表', 1, 0, 10, 17),
(21, 'index', '文章分类列表', 1, 0, 11, 18),
(22, 'trash', '文章分类回收站', 1, 0, 11, 18),
(23, 'trash', '文章回收站', 1, 0, 10, 17),
(24, 'do_upload', '编辑器图片上传', 1, 0, 0, 19),
(185, 'edit', '编辑页面', 1, 0, 0, 26),
(26, 'index', '城市列表', 1, 0, 15, 20),
(27, 'trash', '城市回收站', 1, 0, 15, 20),
(184, 'insert', '添加执行', 1, 0, 0, 26),
(183, 'add', '添加页面', 1, 0, 0, 26),
(30, 'index', '商户列表', 1, 0, 14, 22),
(31, 'index', '供应商分店部门列表', 1, 0, 0, 24),
(32, 'index', '商品类型列表', 1, 0, 13, 26),
(33, 'index', '分类列表', 1, 0, 34, 28),
(34, 'trash', '分类回收站', 1, 0, 34, 28),
(35, 'index', '团购列表', 1, 0, 12, 29),
(436, 'trash', '商品回收站', 1, 0, 12, 29),
(37, 'index', '重量列表', 1, 0, 17, 31),
(38, 'index', '会员字段列表', 1, 0, 35, 32),
(39, 'index', '会员组别列表', 1, 0, 35, 33),
(40, 'index', '会员列表', 1, 0, 18, 34),
(41, 'trash', '会员回收站', 1, 0, 18, 34),
(42, 'index', '配送方式列表', 1, 0, 17, 35),
(43, 'index', '导航菜单列表', 1, 0, 19, 36),
(44, 'index', '支付接口列表', 1, 0, 16, 37),
(45, 'index', '促销接口列表', 1, 0, 20, 38),
(46, 'index', '消息模板管理', 1, 0, 21, 39),
(47, 'index', '邀请返利列表', 1, 0, 22, 40),
(48, 'incharge_index', '充值订单列表', 1, 0, 24, 41),
(49, 'incharge_trash', '充值订单回收站', 1, 0, 24, 41),
(50, 'deal_index', '订单列表', 1, 0, 23, 41),
(51, 'deal_trash', '订单回收站', 1, 0, 23, 41),
(52, 'index', '收款单列表', 1, 0, 23, 42),
(171, 'index', '代金券列表', 1, 0, 0, 50),
(54, 'index', '消息留言分组列表', 1, 0, 26, 44),
(55, 'index', '消息留言列表', 1, 0, 27, 45),
(56, 'index', '邮件订阅列表', 1, 0, 28, 46),
(57, 'index', '邮件服务器列表', 1, 0, 28, 47),
(58, 'index', '短信接口列表', 1, 0, 29, 48),
(59, 'index', '代金券类型列表', 1, 0, 30, 49),
(60, 'index', '短信订阅列表', 1, 0, 29, 51),
(61, 'mail_index', '邮件列表', 1, 0, 28, 52),
(62, 'sms_index', '短信列表', 1, 0, 29, 52),
(63, 'index', '广告列表', 1, 0, 31, 53),
(64, 'index', '投票调查列表', 1, 0, 19, 54),
(65, 'index', '会员整合插件', 1, 0, 32, 55),
(66, 'index', '业务队列列表', 1, 0, 33, 56),
(67, 'index', '推广队列列表', 1, 0, 33, 57),
(68, 'add', '添加页面', 1, 0, 0, 6),
(69, 'edit', '编辑页面', 1, 0, 0, 6),
(70, 'set_effect', '设置生效', 1, 0, 0, 6),
(71, 'add', '添加执行', 1, 0, 0, 6),
(72, 'update', '编辑执行', 1, 0, 0, 6),
(73, 'delete', '删除', 1, 0, 0, 6),
(74, 'restore', '恢复', 1, 0, 0, 6),
(75, 'foreverdelete', '永久删除', 1, 0, 0, 6),
(76, 'set_default', '设置默认管理员', 1, 0, 0, 6),
(77, 'add', '添加页面', 1, 0, 0, 53),
(78, 'edit', '编辑页面', 1, 0, 0, 53),
(79, 'update', '编辑执行', 1, 0, 0, 53),
(80, 'foreverdelete', '永久删除', 1, 0, 0, 53),
(81, 'set_effect', '设置生效', 1, 0, 0, 53),
(82, 'add', '添加页面', 1, 0, 0, 17),
(83, 'insert', '添加执行', 1, 0, 0, 17),
(84, 'edit', '编辑页面', 1, 0, 0, 17),
(85, 'update', '编辑执行', 1, 0, 0, 17),
(86, 'delete', '删除', 1, 0, 0, 17),
(87, 'restore', '恢复', 1, 0, 0, 17),
(88, 'foreverdelete', '永久删除', 1, 0, 0, 17),
(89, 'set_sort', '排序', 1, 0, 0, 17),
(90, 'set_effect', '设置生效', 1, 0, 0, 17),
(91, 'add', '添加页面', 1, 0, 0, 18),
(92, 'insert', '添加执行', 1, 0, 0, 18),
(93, 'edit', '编辑页面', 1, 0, 0, 18),
(94, 'update', '编辑执行', 1, 0, 0, 18),
(95, 'delete', '删除', 1, 0, 0, 18),
(96, 'restore', '恢复', 1, 0, 0, 18),
(97, 'foreverdelete', '永久删除', 1, 0, 0, 18),
(98, 'set_effect', '设置生效', 1, 0, 0, 18),
(99, 'update', '更新配置', 1, 0, 0, 12),
(100, 'dump', '备份数据', 1, 0, 0, 13),
(101, 'delete', '删除备份', 1, 0, 0, 13),
(102, 'restore', '恢复备份', 1, 0, 0, 13),
(103, 'load_file', '读取页面', 1, 0, 0, 53),
(104, 'load_adv_id', '读取广告位', 1, 0, 0, 53),
(105, 'execute', '执行SQL语句', 1, 0, 0, 13),
(106, 'getTables', '读取数据表', 1, 0, 0, 13),
(107, 'add', '添加团购页面', 1, 0, 0, 29),
(108, 'insert', '添加执行', 1, 0, 0, 29),
(109, 'edit', '编辑团购页面', 1, 0, 0, 29),
(110, 'update', '编辑执行', 1, 0, 0, 29),
(111, 'delete', '删除', 1, 0, 0, 29),
(112, 'restore', '恢复', 1, 0, 0, 29),
(113, 'foreverdelete', '永久删除', 1, 0, 0, 29),
(114, 'set_sort', '排序', 1, 0, 0, 29),
(115, 'set_effect', '设置生效', 1, 0, 0, 29),
(116, 'attr_html', '装载属性', 1, 0, 0, 29),
(117, 'show_detail', '团购详情统计', 1, 0, 0, 29),
(118, 'add', '添加页面', 1, 0, 0, 28),
(119, 'insert', '添加执行', 1, 0, 0, 28),
(120, 'edit', '编辑页面', 1, 0, 0, 28),
(121, 'update', '编辑执行', 1, 0, 0, 28),
(122, 'delete', '删除', 1, 0, 0, 28),
(123, 'restore', '恢复', 1, 0, 0, 28),
(124, 'foreverdelete', '永久删除', 1, 0, 0, 20),
(125, 'set_effect', '设置生效', 1, 0, 0, 28),
(126, 'set_sort', '排序', 1, 0, 0, 28),
(127, 'add', '添加页面', 1, 0, 0, 20),
(128, 'insert', '添加执行', 1, 0, 0, 20),
(129, 'edit', '编辑页面', 1, 0, 0, 20),
(130, 'update', '编辑执行', 1, 0, 0, 20),
(131, 'delete', '删除', 1, 0, 0, 20),
(132, 'restore', '恢复', 1, 0, 0, 20),
(133, 'set_effect', '设置生效', 1, 0, 0, 20),
(134, 'set_default', '设为默认城市', 1, 0, 0, 20),
(135, 'index', '团购券列表', 1, 0, 0, 30),
(136, 'add', '添加页面', 1, 0, 0, 30),
(137, 'insert', '添加执行', 1, 0, 0, 30),
(138, 'edit', '编辑页面', 1, 0, 0, 30),
(139, 'update', '编辑执行', 1, 0, 0, 30),
(140, 'foreverdelete', '永久删除', 1, 0, 0, 30),
(141, 'import', '导入页面', 1, 0, 0, 30),
(142, 'importInsert', '导入执行', 1, 0, 0, 30),
(143, 'sample', '下载样例', 1, 0, 0, 30),
(144, 'export_csv', '导出csv', 1, 0, 0, 30),
(145, 'mail', '邮件通知', 1, 0, 0, 30),
(146, 'sms', '短信通知', 1, 0, 0, 30),
(147, 'show_content', '显示内容', 1, 0, 0, 56),
(148, 'send', '手动发送', 1, 0, 0, 56),
(149, 'foreverdelete', '永久删除', 1, 0, 0, 56),
(150, 'export_csv', '导出csv', 1, 0, 0, 41),
(151, 'pay_incharge', '充值单管理员收款', 1, 0, 0, 41),
(152, 'delete', '删除', 1, 0, 0, 41),
(153, 'restore', '恢复', 1, 0, 0, 41),
(154, 'foreverdelete', '永久删除', 1, 0, 0, 41),
(155, 'view_order', '查看订单', 1, 0, 0, 41),
(156, 'delivery', '订单发货', 1, 0, 0, 41),
(157, 'do_delivery', '执行发货', 1, 0, 0, 41),
(158, 'over_order', '订单结单', 1, 0, 0, 41),
(159, 'order_incharge', '订单收款', 1, 0, 0, 41),
(160, 'do_incharge', '执行收款', 1, 0, 0, 41),
(161, 'admin_memo', '售后操作', 1, 0, 0, 41),
(162, 'add', '添加页面', 1, 0, 0, 35),
(163, 'insert', '添加执行', 1, 0, 0, 35),
(164, 'edit', '编辑页面', 1, 0, 0, 35),
(165, 'update', '编辑执行', 1, 0, 0, 35),
(166, 'foreverdelete', '永久删除', 1, 0, 0, 35),
(167, 'set_sort', '排序', 1, 0, 0, 35),
(168, 'set_effect', '设置生效', 1, 0, 0, 35),
(169, 'selectRegions', '选择配置地区', 1, 0, 0, 35),
(170, 'getSubRegion', '展开地区', 1, 0, 0, 35),
(172, 'export_csv', '导出csv', 1, 0, 0, 50),
(173, 'foreverdelete', '永久删除', 1, 0, 0, 50),
(174, 'add', '添加页面', 1, 0, 0, 49),
(175, 'insert', '添加执行', 1, 0, 0, 49),
(176, 'edit', '编辑页面', 1, 0, 0, 49),
(177, 'update', '编辑执行', 1, 0, 0, 49),
(178, 'foreverdelete', '永久删除', 1, 0, 0, 49),
(179, 'send', '发放页面', 1, 0, 0, 49),
(180, 'doSend', '发放执行', 1, 0, 0, 49),
(181, 'do_upload_img', '图片控件上传', 1, 0, 0, 19),
(182, 'deleteImg', '删除图片', 1, 0, 0, 19),
(186, 'update', '编辑执行', 1, 0, 0, 26),
(187, 'foreverdelete', '永久删除', 1, 0, 0, 26),
(188, 'index', '商品属性列表', 1, 0, 0, 27),
(189, 'add', '添加页面', 1, 0, 0, 27),
(190, 'insert', '添加执行', 1, 0, 0, 27),
(191, 'edit', '编辑页面', 1, 0, 0, 27),
(192, 'update', '编辑执行', 1, 0, 0, 27),
(193, 'foreverdelete', '永久删除', 1, 0, 0, 27),
(195, 'install', '安装页面', 1, 0, 0, 55),
(196, 'save', '保存', 1, 0, 0, 55),
(197, 'uninstall', '卸载', 1, 0, 0, 55),
(198, 'foreverdelete', '永久删除', 1, 0, 0, 15),
(199, 'add', '添加页面', 1, 0, 0, 46),
(200, 'insert', '添加执行', 1, 0, 0, 46),
(201, 'edit', '编辑页面', 1, 0, 0, 46),
(202, 'update', '编辑执行', 1, 0, 0, 46),
(203, 'set_effect', '设置生效', 1, 0, 0, 46),
(204, 'foreverdelete', '永久删除', 1, 0, 0, 46),
(205, 'add', '添加页面', 1, 0, 0, 47),
(206, 'insert', '添加执行', 1, 0, 0, 47),
(207, 'edit', '编辑页面', 1, 0, 0, 47),
(208, 'update', '编辑执行', 1, 0, 0, 47),
(209, 'set_effect', '设置生效', 1, 0, 0, 47),
(210, 'foreverdelete', '永久删除', 1, 0, 0, 47),
(211, 'send_demo', '发送测试邮件', 1, 0, 0, 47),
(212, 'edit', '查看留言', 1, 0, 0, 45),
(213, 'update', '回复留言', 1, 0, 0, 45),
(214, 'foreverdelete', '永久删除', 1, 0, 0, 45),
(215, 'add', '添加页面', 1, 0, 0, 44),
(216, 'insert', '添加执行', 1, 0, 0, 44),
(217, 'edit', '编辑页面', 1, 0, 0, 44),
(218, 'update', '编辑执行', 1, 0, 0, 44),
(219, 'foreverdelete', '永久删除', 1, 0, 0, 44),
(220, 'set_sort', '排序', 1, 0, 0, 44),
(221, 'add', '添加页面', 1, 0, 0, 51),
(222, 'insert', '添加执行', 1, 0, 0, 51),
(223, 'edit', '编辑页面', 1, 0, 0, 51),
(224, 'update', '编辑执行', 1, 0, 0, 51),
(225, 'foreverdelete', '永久删除', 1, 0, 0, 51),
(226, 'set_effect', '设置生效', 1, 0, 0, 51),
(227, 'load_tpl', '载入对应模板', 1, 0, 0, 39),
(228, 'update', '保存', 1, 0, 0, 39),
(229, 'edit', '编辑页面', 1, 0, 0, 36),
(230, 'update', '编辑执行', 1, 0, 0, 36),
(231, 'set_effect', '设置生效', 1, 0, 0, 36),
(232, 'set_sort', '排序', 1, 0, 0, 36),
(233, 'install', '安装页面', 1, 0, 0, 37),
(234, 'insert', '安装保存', 1, 0, 0, 37),
(235, 'edit', '编辑页面', 1, 0, 0, 37),
(236, 'update', '编辑执行', 1, 0, 0, 37),
(237, 'uninstall', '卸载', 1, 0, 0, 37),
(238, 'install', '安装', 1, 0, 0, 38),
(239, 'uninstall', '卸载', 1, 0, 0, 38),
(240, 'set_sort', '排序', 1, 0, 0, 38),
(241, 'add_mail', '添加邮件页面', 1, 0, 0, 52),
(242, 'add_sms', '添加短信页面', 1, 0, 0, 52),
(243, 'gen_deal_mail', '生成团购邮件', 1, 0, 0, 52),
(244, 'gen_deal_sms', '生成团购短信', 1, 0, 0, 52),
(245, 'insert_mail', '添加邮件执行', 1, 0, 0, 52),
(246, 'insert_sms', '添加短信执行', 1, 0, 0, 52),
(247, 'edit_mail', '编辑邮件页面', 1, 0, 0, 52),
(248, 'edit_sms', '编辑短信页面', 1, 0, 0, 52),
(249, 'update_mail', '编辑邮件执行', 1, 0, 0, 52),
(250, 'update_sms', '编辑短信执行', 1, 0, 0, 52),
(251, 'foreverdelete', '永久删除', 1, 0, 0, 52),
(252, 'show_content', '显示内容', 1, 0, 0, 57),
(253, 'send', '手动发送', 1, 0, 0, 57),
(254, 'foreverdelete', '永久删除', 1, 0, 0, 57),
(255, 'pay', '发放返利', 1, 0, 0, 40),
(256, 'foreverdelete', '永久删除', 1, 0, 0, 40),
(257, 'add', '添加页面', 1, 0, 0, 5),
(258, 'insert', '添加执行', 1, 0, 0, 5),
(259, 'edit', '编辑页面', 1, 0, 0, 5),
(260, 'update', '编辑执行', 1, 0, 0, 5),
(261, 'set_effect', '设置生效', 1, 0, 0, 5),
(262, 'delete', '删除', 1, 0, 0, 5),
(263, 'restore', '恢复', 1, 0, 0, 5),
(264, 'foreverdelete', '永久删除', 1, 0, 0, 5),
(265, 'insert', '安装页面', 1, 0, 0, 48),
(266, 'insert', '安装保存', 1, 0, 0, 48),
(267, 'edit', '编辑页面', 1, 0, 0, 48),
(268, 'update', '编辑执行', 1, 0, 0, 48),
(269, 'uninstall', '卸载', 1, 0, 0, 48),
(270, 'set_effect', '设置生效', 1, 0, 0, 48),
(271, 'send_demo', '发送测试短信', 1, 0, 0, 48),
(272, 'index', '供应商帐号列表', 1, 0, 0, 25),
(273, 'trash', '供应商帐号回收站', 1, 0, 0, 25),
(274, 'add', '添加页面', 1, 0, 0, 25),
(275, 'insert', '添加执行', 1, 0, 0, 25),
(276, 'edit', '编辑页面', 1, 0, 0, 25),
(277, 'update', '编辑执行', 1, 0, 0, 25),
(278, 'delete', '删除', 1, 0, 0, 25),
(279, 'restore', '恢复', 1, 0, 0, 25),
(280, 'foreverdelete', '永久删除', 1, 0, 0, 25),
(281, 'set_effect', '设置生效', 1, 0, 0, 25),
(282, 'add', '添加页面', 1, 0, 0, 22),
(283, 'insert', '添加执行', 1, 0, 0, 22),
(284, 'edit', '编辑页面', 1, 0, 0, 22),
(285, 'update', '编辑执行', 1, 0, 0, 22),
(286, 'set_sort', '排序', 1, 0, 0, 22),
(287, 'foreverdelete', '永久删除', 1, 0, 0, 22),
(288, 'add', '添加页面', 1, 0, 0, 24),
(289, 'insert', '添加执行', 1, 0, 0, 24),
(290, 'edit', '编辑页面', 1, 0, 0, 24),
(291, 'update', '编辑执行', 1, 0, 0, 24),
(292, 'foreverdelete', '永久删除', 1, 0, 0, 24),
(293, 'setMain', '设为默认', 1, 0, 0, 24),
(294, 'add', '添加页面', 1, 0, 0, 34),
(295, 'insert', '添加执行', 1, 0, 0, 34),
(296, 'edit', '编辑页面', 1, 0, 0, 34),
(297, 'update', '编辑执行', 1, 0, 0, 34),
(298, 'delete', '删除', 1, 0, 0, 34),
(299, 'restore', '恢复', 1, 0, 0, 34),
(300, 'foreverdelete', '永久删除', 1, 0, 0, 34),
(301, 'set_effect', '设置生效', 1, 0, 0, 34),
(302, 'account', '修改资金积分页面', 1, 0, 0, 34),
(303, 'modify_account', '修改资金积分执行', 1, 0, 0, 34),
(304, 'account_detail', '帐户详情', 1, 0, 0, 34),
(305, 'foreverdelete_account_detail', '永久删除帐户详情', 1, 0, 0, 34),
(306, 'export_csv', '导出csv', 1, 0, 0, 34),
(307, 'add', '添加页面', 1, 0, 0, 32),
(308, 'insert', '添加执行', 1, 0, 0, 32),
(309, 'edit', '编辑页面', 1, 0, 0, 32),
(310, 'update', '编辑执行', 1, 0, 0, 32),
(311, 'foreverdelete', '永久删除', 1, 0, 0, 32),
(312, 'set_sort', '排序', 1, 0, 0, 32),
(313, 'add', '添加页面', 1, 0, 0, 33),
(314, 'insert', '添加执行', 1, 0, 0, 33),
(315, 'edit', '编辑页面', 1, 0, 0, 33),
(316, 'update', '编辑执行', 1, 0, 0, 33),
(317, 'foreverdelete', '永久删除', 1, 0, 0, 33),
(318, 'add', '添加页面', 1, 0, 0, 54),
(319, 'insert', '添加执行', 1, 0, 0, 54),
(320, 'edit', '编辑页面', 1, 0, 0, 54),
(321, 'update', '编辑执行', 1, 0, 0, 54),
(322, 'foreverdelete', '永久删除', 1, 0, 0, 54),
(323, 'set_effect', '设置生效', 1, 0, 0, 54),
(324, 'set_sort', '排序', 1, 0, 0, 54),
(325, 'vote_ask', '编辑问卷', 1, 0, 0, 54),
(326, 'add_ask_row', '添加问题', 1, 0, 0, 54),
(327, 'do_vote_ask', '保存问卷', 1, 0, 0, 54),
(328, 'vote_result', '查看结果', 1, 0, 0, 54),
(329, 'add', '添加页面', 1, 0, 0, 31),
(330, 'insert', '添加执行', 1, 0, 0, 31),
(331, 'edit', '编辑页面', 1, 0, 0, 31),
(332, 'update', '编辑执行', 1, 0, 0, 31),
(333, 'foreverdelete', '永久删除', 1, 0, 0, 31),
(335, 'index', '配送地区列表', 1, 0, 17, 59),
(336, 'add', '添加页面', 1, 0, 0, 59),
(337, 'insert', '添加执行', 1, 0, 0, 59),
(338, 'edit', '编辑页面', 1, 0, 0, 59),
(339, 'update', '编辑执行', 1, 0, 0, 59),
(340, 'foreverdelete', '永久删除', 1, 0, 0, 59),
(341, 'index', '友情链接分组列表', 1, 0, 36, 60),
(342, 'index', '友情链接列表', 1, 0, 36, 61),
(343, 'add', '添加页面', 1, 0, 0, 60),
(344, 'insert', '添加提交', 1, 0, 0, 60),
(345, 'edit', '编辑页面', 1, 0, 0, 60),
(346, 'update', '编辑提交', 1, 0, 0, 60),
(347, 'set_effect', '设置有效性', 1, 0, 0, 60),
(348, 'set_sort', '设置排序', 1, 0, 0, 60),
(349, 'foreverdelete', '永久删除', 1, 0, 0, 60),
(350, 'add', '添加页面', 1, 0, 0, 61),
(351, 'insert', '添加提交', 1, 0, 0, 61),
(352, 'edit', '编辑页面', 1, 0, 0, 61),
(353, 'update', '编辑提交', 1, 0, 0, 61),
(354, 'set_effect', '设置有效性', 1, 0, 0, 61),
(355, 'set_sort', '设置排序', 1, 0, 0, 61),
(356, 'foreverdelete', '永久删除', 1, 0, 0, 61),
(357, 'set_sort', '设置排序', 1, 0, 0, 18),
(358, 'index', 'API插件列表', 1, 0, 55, 77),
(359, 'install', 'API插件安装', 1, 0, 0, 77),
(360, 'uninstall', 'API插件卸载', 1, 0, 0, 77),
(361, 'insert', 'API插件安装提交', 1, 0, 0, 77),
(362, 'edit', 'API插件编辑', 1, 0, 0, 77),
(363, 'update', 'API插件编辑提交', 1, 0, 0, 77),
(364, 'export_csv', '邮件导出', 1, 0, 0, 46),
(365, 'import_csv', '邮件导入页', 1, 0, 0, 46),
(366, 'do_import_csv', '邮件导入', 1, 0, 0, 46),
(367, 'export_csv', '手机号码导出', 1, 0, 0, 51),
(368, 'do_import_csv', '手机号码导入', 1, 0, 0, 51),
(369, 'import_csv', '手机号码导入页', 1, 0, 0, 51),
(370, 'open_order', '开放订单', 1, 0, 0, 41),
(371, 'set_effect', '设为品牌商户', 1, 0, 0, 22),
(372, 'index', '快递接口列表', 1, 0, 17, 62),
(373, 'install', '快递接口安装', 1, 0, 0, 62),
(374, 'insert', '执行安装', 1, 0, 0, 62),
(375, 'edit', '快递接口编辑', 1, 0, 0, 62),
(376, 'update', '执行编辑', 1, 0, 0, 62),
(377, 'uninstall', '卸载', 1, 0, 0, 62),
(378, 'eprint', '打印', 1, 0, 0, 62),
(379, 'load_batch_delivery', '批量发货', 1, 0, 0, 41),
(380, 'do_batch_delivery', '执行发货', 1, 0, 0, 41),
(381, 'lottery_index', '抽奖号列表', 1, 0, 23, 41),
(382, 'del_lottery', '删除抽奖号', 1, 0, 0, 41),
(383, 'coupon', '第三方验证日志', 1, 0, 9, 15),
(384, 'import_mail', 'edm邮件导入', 1, 0, 0, 52),
(385, 'index', '商城分类列表', 1, 0, 56, 78),
(386, 'trash', '商城分类回收站', 1, 0, 56, 78),
(387, 'add', '添加商城分类', 1, 0, 0, 78),
(388, 'insert', '添加执行', 1, 0, 0, 78),
(389, 'edit', '编辑商城分类', 1, 0, 0, 78),
(390, 'update', '编辑执行', 1, 0, 0, 78),
(391, 'set_effect', '设置有效', 1, 0, 0, 78),
(392, 'set_sort', '设置排序', 1, 0, 0, 78),
(393, 'delete', '删除分类', 1, 0, 0, 78),
(394, 'restore', '恢复分类', 1, 0, 0, 78),
(395, 'foreverdelete', '永久删除分类', 1, 0, 0, 78),
(396, 'shop', '商品列表', 1, 0, 12, 29),
(399, 'shop_add', '商品添加页面', 1, 0, 0, 29),
(400, 'shop_insert', '商品添加执行', 1, 0, 0, 29),
(401, 'shop_edit', '商品编辑页面', 1, 0, 0, 29),
(402, 'shop_update', '商品编辑执行', 1, 0, 0, 29),
(403, 'index', '筛选分组', 1, 0, 57, 79),
(404, 'add', '添加筛选分组', 1, 0, 0, 79),
(405, 'insert', '添加提交', 1, 0, 0, 79),
(406, 'edit', '编辑筛选分组', 1, 0, 0, 79),
(407, 'update', '编辑提交', 1, 0, 0, 79),
(408, 'foreverdelete', '永久删除', 1, 0, 0, 79),
(409, 'filter_html', '装载关键词', 1, 0, 0, 29),
(410, 'index', '关键词列表', 1, 0, 0, 80),
(411, 'foreverdelete', '永久删除', 1, 0, 0, 80),
(412, 'referer', '订单来路统计', 1, 0, 23, 41),
(413, 'index', '会员主题管理', 1, 0, 27, 81),
(414, 'delete', '删除主题', 1, 0, 0, 81),
(415, 'edit', '编辑主题', 1, 0, 0, 81),
(416, 'update', '更新主题', 1, 0, 0, 81),
(417, 'index', '回复列表', 1, 0, 0, 82),
(418, 'delete', '删除回复', 1, 0, 0, 82),
(419, 'edit', '编辑回复', 1, 0, 0, 82),
(420, 'udpate', '更新回复', 1, 0, 0, 82),
(421, 'delete', '删除主题图片', 1, 0, 0, 83),
(444, 'index', '品牌列表', 1, 0, 14, 87),
(422, 'index', '门店列表', 1, 0, 14, 24),
(423, 'index', '商圈列表', 1, 0, 58, 84),
(424, 'index', '优惠券列表', 1, 0, 59, 85),
(425, 'add', '添加', 1, 0, 0, 84),
(426, 'insert', '添加提交', 1, 0, 0, 84),
(427, 'edit', '编辑', 1, 0, 0, 84),
(428, 'update', '编辑提交', 1, 0, 0, 84),
(429, 'foreverdelete', '永久删除', 1, 0, 0, 84),
(430, 'add', '添加', 1, 0, 0, 85),
(431, 'insert', '添加提交', 1, 0, 0, 85),
(432, 'edit', '编辑', 1, 0, 0, 85),
(433, 'update', '编辑提交', 1, 0, 0, 85),
(434, 'foreverdelete', '永久删除', 1, 0, 0, 85),
(435, 'youhui', '现金劵列表', 1, 0, 12, 29),
(437, 'youhui_add', '添加现金劵', 1, 0, 0, 29),
(438, 'youhui_insert', '添加提交现金劵', 1, 0, 0, 29),
(439, 'youhui_edit', '编辑现金劵', 1, 0, 0, 29),
(440, 'youhui_update', '编辑提交现金劵', 1, 0, 0, 29),
(441, 'index', '优惠券发送日志', 1, 0, 59, 86),
(442, 'foreverdelete', '永久删除', 1, 0, 0, 86),
(443, 'send_sms', '发送短信', 1, 0, 0, 86),
(445, 'add', '品牌添加', 1, 0, 0, 87),
(446, 'insert', '品牌添加提交', 1, 0, 0, 87),
(447, 'edit', '品牌编辑', 1, 0, 0, 87),
(448, 'update', '品牌编辑提交', 1, 0, 0, 87),
(449, 'foreverdelete', '删除品牌', 1, 0, 0, 87),
(450, 'index', '分享标签分类列表', 1, 0, 60, 88),
(451, 'add', '添加分类', 1, 0, 0, 88),
(452, 'insert', '添加提交', 1, 0, 0, 88),
(453, 'edit', '编辑分类', 1, 0, 0, 88),
(454, 'update', '编辑提交', 1, 0, 0, 88),
(455, 'foreverdelete', '永久删除', 1, 0, 0, 88),
(456, 'index', '分享标签列表', 1, 0, 60, 89),
(457, 'add', '添加标签', 1, 0, 0, 89),
(458, 'insert', '添加提交', 1, 0, 0, 89),
(459, 'edit', '编辑标签', 1, 0, 0, 89),
(460, 'update', '编辑提交', 1, 0, 0, 89),
(461, 'foreverdelete', '永久删除', 1, 0, 0, 89),
(462, 'index', '分享话题列表', 1, 0, 60, 90),
(463, 'add', '添加话题', 1, 0, 0, 90),
(464, 'insert', '添加提交', 1, 0, 0, 90),
(465, 'edit', '修改话题', 1, 0, 0, 90),
(466, 'update', '修改提交', 1, 0, 0, 90),
(467, 'foreverdelete', '永久删除', 1, 0, 0, 90),
(468, 'index', '子分类列表', 1, 0, 34, 91),
(469, 'add', '添加子类', 1, 0, 0, 91),
(470, 'insert', '添加提交', 1, 0, 0, 91),
(471, 'edit', '修改子类', 1, 0, 0, 91),
(472, 'update', '修改提交', 1, 0, 0, 91),
(473, 'foreverdelete', '永久删除', 1, 0, 0, 91),
(474, 'index', '缓存处理', 1, 0, 0, 92),
(475, 'clear_parse_file', '清空脚本样式缓存', 1, 0, 0, 92),
(477, 'clear_data', '清空数据缓存', 1, 0, 0, 92),
(480, 'syn_data', '同步数据', 1, 0, 0, 92),
(481, 'clear_image', '清空图片缓存', 1, 0, 0, 92),
(482, 'clear_admin', '清空后台缓存', 1, 0, 0, 92),
(483, 'mobile', '手机端配置', 1, 0, 62, 12),
(484, 'news', '手机端公告', 1, 1, 62, 12),
(485, 'savemobile', '保存手机端配置', 1, 0, 0, 12),
(486, 'add', '添加新闻', 1, 0, 0, 12),
(487, 'insertnews', '添加保存手机端新闻', 1, 0, 0, 12),
(488, 'edit', '编辑新闻', 1, 0, 0, 12),
(489, 'updatenews', '编辑保存手机端新闻', 1, 0, 0, 12),
(490, 'foreverdelete', '删除新闻', 1, 0, 0, 12),
(491, 'index', '手机端广告列表', 1, 0, 62, 93),
(492, 'add', '添加广告', 1, 0, 0, 93),
(493, 'insert', '添加提交', 1, 0, 0, 93),
(494, 'edit', '编辑广告', 1, 0, 0, 93),
(495, 'update', '编辑提交', 1, 0, 0, 93),
(496, 'foreverdelete', '删除广告', 1, 0, 0, 93),
(497, 'index', '首页菜单列表', 1, 0, 62, 94),
(498, 'add', '添加菜单', 1, 0, 0, 94),
(499, 'insert', '添加提交', 1, 0, 0, 94),
(500, 'edit', '编辑菜单', 1, 0, 0, 94),
(501, 'update', '编辑提交', 1, 0, 0, 94),
(502, 'foreverdelete', '删除菜单', 1, 0, 0, 94),
(503, 'index', 'iPhone消息推送', 1, 1, 62, 95),
(504, 'add', '添加群发消息', 1, 0, 0, 95),
(505, 'insert', '添加提交', 1, 0, 0, 95),
(506, 'logs', '推送进度查看', 1, 0, 0, 95),
(507, 'foreverdelete', '删除消息', 1, 0, 0, 95),
(509, 'edit', '编辑消息', 1, 0, 0, 95),
(510, 'update', '编辑提交', 1, 0, 0, 95),
(511, 'index', '分组列表', 1, 0, 63, 96),
(512, 'add', '添加页面', 1, 0, 0, 96),
(513, 'insert', '添加提交', 1, 0, 0, 96),
(514, 'edit', '编辑页面', 1, 0, 0, 96),
(515, 'update', '编辑执行', 1, 0, 0, 96),
(516, 'foreverdelete', '永久删除', 1, 0, 0, 96),
(517, 'index', '分组列表', 1, 0, 64, 97),
(518, 'add', '添加页面', 1, 0, 0, 97),
(519, 'insert', '添加提交', 1, 0, 0, 97),
(520, 'edit', '编辑页面', 1, 0, 0, 97),
(521, 'update', '编辑执行', 1, 0, 0, 97),
(522, 'foreverdelete', '永久删除', 1, 0, 0, 97),
(523, 'index', '活动列表', 1, 0, 65, 98),
(524, 'add', '添加活动', 1, 0, 0, 98),
(525, 'insert', '添加提交', 1, 0, 0, 98),
(526, 'edit', '编辑活动', 1, 0, 0, 98),
(527, 'update', '编辑提交', 1, 0, 0, 98),
(528, 'foreverdelete', '永久删除', 1, 0, 0, 98),
(529, 'index', '活动报名列表', 1, 0, 0, 99),
(531, 'foreverdelete', '永久删除', 1, 0, 0, 99),
(532, 'index', '消息列表', 1, 0, 66, 100),
(533, 'add', '添加消息', 1, 0, 0, 100),
(534, 'insert', '添加提交', 1, 0, 0, 100),
(535, 'edit', '编辑消息', 1, 0, 0, 100),
(536, 'update', '编辑提交', 1, 0, 0, 100),
(537, 'foreverdelete', '永久删除', 1, 0, 0, 100),
(538, 'index', '记录列表', 1, 0, 66, 101),
(539, 'view', '查看记录', 1, 0, 0, 101),
(540, 'foreverdelete', '永久删除', 1, 0, 0, 101),
(541, 'index', '分类列表', 1, 0, 65, 102),
(542, 'add', '添加活动', 1, 0, 0, 102),
(543, 'insert', '添加提交', 1, 0, 0, 102),
(544, 'edit', '编辑活动', 1, 0, 0, 102),
(545, 'update', '编辑提交', 1, 0, 0, 102),
(546, 'foreverdelete', '永久删除', 1, 0, 0, 102),
(547, 'index', '分享采集插件', 1, 0, 27, 103),
(548, 'install', '安装', 1, 0, 0, 103),
(549, 'insert', '执行安装', 1, 0, 0, 103),
(550, 'edit', '编辑', 1, 0, 0, 103),
(551, 'update', '编辑提交', 1, 0, 0, 103),
(552, 'uninstall', '卸载', 1, 0, 0, 103),
(553, 'index', '分组列表', 1, 0, 67, 104),
(554, 'add', '添加页面', 1, 0, 0, 104),
(555, 'insert', '添加提交', 1, 0, 0, 104),
(556, 'edit', '编辑页面', 1, 0, 0, 104),
(557, 'update', '编辑执行', 1, 0, 0, 104),
(558, 'foreverdelete', '永久删除', 1, 0, 0, 104),
(559, 'publish', '商家提交', 1, 0, 12, 29),
(560, 'publish', '商家提交', 1, 0, 59, 85),
(561, 'publish', '商家提交', 1, 0, 65, 98),
(562, 'index', '小组分类列表', 1, 0, 27, 105),
(563, 'index', '小组列表', 1, 0, 27, 106),
(564, 'add', '小组分类添加', 1, 0, 0, 105),
(565, 'insert', '小组分类添加提交', 1, 0, 0, 105),
(566, 'edit', '小组分类编辑', 1, 0, 0, 105),
(567, 'update', '小组分类编辑提交', 1, 0, 0, 105),
(568, 'foreverdelete', '永久删除', 1, 0, 0, 105),
(569, 'add', '小组添加', 1, 0, 0, 106),
(570, 'insert', '小组添加提交', 1, 0, 0, 106),
(571, 'edit', '小组编辑', 1, 0, 0, 106),
(572, 'update', '小组编辑提交', 1, 0, 0, 106),
(573, 'foreverdelete', '永久删除', 1, 0, 0, 106),
(574, 'user_index', '组员列表', 1, 0, 0, 106),
(575, 'user_add', '添加组员', 1, 0, 0, 106),
(576, 'user_insert', '添加组员提交', 1, 0, 0, 106),
(577, 'user_edit', '组员编辑', 1, 0, 0, 106),
(578, 'user_update', '组员编辑提交', 1, 0, 0, 106),
(579, 'user_delete', '删除组员', 1, 0, 0, 106),
(580, 'index', '会员等级列表', 1, 0, 35, 107),
(581, 'add', '添加会员等级', 1, 0, 0, 107),
(582, 'insert', '添加提交', 1, 0, 0, 107),
(583, 'edit', '编辑会员等级', 1, 0, 0, 107),
(584, 'update', '编辑提交', 1, 0, 0, 107),
(585, 'foreverdelete', '永久删除', 1, 0, 0, 107),
(586, 'index', '勋章列表', 1, 0, 35, 108),
(589, 'install', '安装勋章插件', 1, 0, 0, 108),
(590, 'insert', '安装提交', 1, 0, 0, 108),
(591, 'edit', '编辑勋章插件', 1, 0, 0, 108),
(592, 'update', '编辑提交', 1, 0, 0, 108),
(593, 'uninstall', '卸载勋章', 1, 0, 0, 108),
(594, 'index', '商家入驻申请', 1, 0, 14, 109),
(595, 'edit', '查看', 1, 0, 0, 109),
(596, 'foreverdelete', '永久删除', 1, 0, 0, 109),
(597, 'update', '审核通过', 1, 0, 0, 109),
(598, 'index', '达人申请列表', 1, 0, 18, 110),
(599, 'edit', '查看', 1, 0, 0, 110),
(600, 'update', '审核通过', 1, 0, 0, 110),
(601, 'foreverdelete', '永久删除', 1, 0, 0, 110),
(602, 'index', '结算列表', 1, 0, 68, 111),
(603, 'do_balance', '执行结算', 1, 0, 0, 111),
(604, 'index', '报表列表', 1, 0, 68, 112),
(605, 'set_sort', '门店排序', 1, 0, 0, 24),
(607, 'batch_refund', '批量退款', 1, 0, 0, 30),
(606, 'refund', '团购券退款', 1, 0, 0, 30),
(608, 'money_log', '财务明细', 1, 0, 0, 22),
(609, 'charge_index', '商户提现', 1, 0, 14, 22),
(610, 'docharge', '确认提现', 1, 0, 0, 22),
(611, 'index', '商品活动列表', 1, 0, 69, 113);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_shop_cate`
--

CREATE TABLE IF NOT EXISTS `fanwe_shop_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `brief` text NOT NULL,
  `pid` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `sort` int(11) NOT NULL,
  `uname` varchar(255) NOT NULL,
  `recommend` tinyint(1) NOT NULL,
  `cate_img` varchar(255) NOT NULL COMMENT '分类图片',
  PRIMARY KEY (`id`),
  KEY `sort` (`sort`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- 转存表中的数据 `fanwe_shop_cate`
--

INSERT INTO `fanwe_shop_cate` (`id`, `name`, `brief`, `pid`, `is_delete`, `is_effect`, `sort`, `uname`, `recommend`, `cate_img`) VALUES
(24, '服装,内衣,配件', '', 0, 0, 1, 1, 'cloth', 1, ''),
(25, '鞋,箱包', '', 0, 0, 1, 2, '', 0, ''),
(26, '珠宝饰品、手表眼镜', '', 0, 0, 1, 3, '', 0, ''),
(27, '家用电器', '', 0, 0, 1, 4, '', 0, ''),
(28, '居家生活', '', 0, 0, 1, 5, '', 0, ''),
(29, '母婴用品', '', 0, 0, 1, 6, '', 0, ''),
(30, '女装', '', 24, 0, 1, 7, '', 0, ''),
(31, '男装', '', 24, 0, 1, 8, '', 0, ''),
(32, '家居服', '', 24, 0, 1, 9, '', 0, ''),
(33, '毛衣', '', 24, 0, 1, 10, '', 0, ''),
(34, '皮衣', '', 24, 0, 1, 11, '', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_sms`
--

CREATE TABLE IF NOT EXISTS `fanwe_sms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `class_name` varchar(255) NOT NULL,
  `server_url` text NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `config` text NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `fanwe_sms`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_sms_mobile_verify`
--

CREATE TABLE IF NOT EXISTS `fanwe_sms_mobile_verify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile_phone` varchar(50) NOT NULL DEFAULT '',
  `code` varchar(20) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `add_time` int(10) DEFAULT NULL,
  `send_count` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `fanwe_sms_mobile_verify`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_supplier`
--

CREATE TABLE IF NOT EXISTS `fanwe_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `preview` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `sort` int(11) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `city_id` int(11) NOT NULL,
  `name_match` text NOT NULL,
  `name_match_row` text NOT NULL,
  `bank_info` text NOT NULL,
  `money` decimal(20,4) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `bank_user` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `is_effect` (`is_effect`),
  KEY `sort` (`sort`),
  KEY `city_id` (`city_id`),
  FULLTEXT KEY `name_match` (`name_match`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- 转存表中的数据 `fanwe_supplier`
--

INSERT INTO `fanwe_supplier` (`id`, `name`, `preview`, `content`, `sort`, `is_effect`, `city_id`, `name_match`, `name_match_row`, `bank_info`, `money`, `bank_name`, `bank_user`) VALUES
(15, '闽粤汇', './public/attachment/201201/4f013e6e7145c.jpg', '', 0, 1, 0, 'ux38397ux31908,ux38397ux31908ux27719', '闽粤,闽粤汇', '', 0.0000, '', ''),
(16, '爱琴海餐厅', './public/attachment/201201/4f013e40ac45d.jpg', '', 0, 1, 0, 'ux29233ux29748ux28023,ux39184ux21381,ux29233ux29748ux28023ux39184ux21381', '爱琴海,餐厅,爱琴海餐厅', '', 0.0000, '', ''),
(17, '老刘野生大鱼坊', './public/attachment/201201/4f013dca6585d.jpg', '', 0, 1, 0, 'ux32769ux21016,ux22823ux40060,ux37326ux29983,ux32769ux21016ux37326ux29983ux22823ux40060ux22346', '老刘,大鱼,野生,老刘野生大鱼坊', '', 0.0000, '', ''),
(18, '享客来牛排世家', './public/attachment/201201/4f013ee3d7cb9.jpg', '', 0, 0, 0, 'ux29275ux25490,ux19990ux23478,ux20139ux23458ux26469ux29275ux25490ux19990ux23478', '牛排,世家,享客来牛排世家', '', 0.0000, '', ''),
(19, '格瑞雅美容院', './public/attachment/201201/4f013fc452347.jpg', '', 0, 0, 0, 'ux38597ux32654,ux26684ux29790,ux23481ux38498,ux26684ux29790ux38597ux32654ux23481ux38498', '雅美,格瑞,容院,格瑞雅美容院', '', 0.0000, '', ''),
(20, '馨语河畔', './public/attachment/201201/4f01422c0c096.jpg', '', 0, 0, 0, 'ux27827ux30036,ux39336ux35821ux27827ux30036', '河畔,馨语河畔', '', 0.0000, '', ''),
(21, '泡泡糖宝贝游泳馆', './public/attachment/201201/4f0142c918abd.jpg', '', 0, 0, 0, 'ux27873ux27873ux31958,ux28216ux27891ux39302,ux23453ux36125,ux27873ux27873ux31958ux23453ux36125ux28216ux27891ux39302', '泡泡糖,游泳馆,宝贝,泡泡糖宝贝游泳馆', '', 0.0000, '', '');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_supplier_account`
--

CREATE TABLE IF NOT EXISTS `fanwe_supplier_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(255) NOT NULL,
  `account_password` varchar(255) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `description` text NOT NULL,
  `login_ip` varchar(255) NOT NULL,
  `login_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `allow_delivery` tinyint(1) NOT NULL,
  `allow_charge` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unk_account_name` (`account_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `fanwe_supplier_account`
--

INSERT INTO `fanwe_supplier_account` (`id`, `account_name`, `account_password`, `supplier_id`, `is_effect`, `is_delete`, `description`, `login_ip`, `login_time`, `update_time`, `allow_delivery`, `allow_charge`) VALUES
(7, 'fanwe', '6714ccb93be0fda4e51f206b91b46358', 21, 1, 0, '测试用的帐号', '222.186.97.53', 0, 1330109616, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_supplier_account_location_link`
--

CREATE TABLE IF NOT EXISTS `fanwe_supplier_account_location_link` (
  `account_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`account_id`,`location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_supplier_account_location_link`
--

INSERT INTO `fanwe_supplier_account_location_link` (`account_id`, `location_id`) VALUES
(7, 20);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_supplier_dy`
--

CREATE TABLE IF NOT EXISTS `fanwe_supplier_dy` (
  `uid` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  PRIMARY KEY (`uid`,`supplier_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_supplier_dy`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_supplier_location`
--

CREATE TABLE IF NOT EXISTS `fanwe_supplier_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `route` text NOT NULL,
  `address` text NOT NULL,
  `tel` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `xpoint` varchar(255) NOT NULL,
  `ypoint` varchar(255) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `open_time` varchar(255) NOT NULL,
  `brief` text NOT NULL,
  `is_main` tinyint(1) NOT NULL,
  `api_address` text NOT NULL,
  `city_id` int(11) NOT NULL,
  `deal_cate_match` text NOT NULL,
  `deal_cate_match_row` text NOT NULL,
  `locate_match` text NOT NULL,
  `locate_match_row` text NOT NULL,
  `name_match` text NOT NULL,
  `name_match_row` text NOT NULL,
  `deal_cate_id` int(11) NOT NULL,
  `preview` varchar(255) NOT NULL,
  `is_recommend` tinyint(1) NOT NULL COMMENT '推荐的门店',
  `is_verify` tinyint(1) NOT NULL COMMENT '认证门店',
  `tags` varchar(255) NOT NULL,
  `tags_match` text NOT NULL,
  `tags_match_row` text NOT NULL,
  `avg_point` float(14,4) NOT NULL,
  `good_dp_count` int(11) NOT NULL,
  `bad_dp_count` int(11) NOT NULL,
  `common_dp_count` int(11) NOT NULL,
  `total_point` int(11) NOT NULL,
  `dp_count` int(11) NOT NULL,
  `image_count` int(11) NOT NULL,
  `ref_avg_price` float(14,4) NOT NULL,
  `good_rate` float(14,4) NOT NULL,
  `common_rate` float(14,4) NOT NULL,
  `sms_content` varchar(255) NOT NULL DEFAULT '',
  `index_img` varchar(255) NOT NULL DEFAULT '',
  `tuan_count` int(11) NOT NULL,
  `event_count` int(11) NOT NULL,
  `youhui_count` int(11) NOT NULL,
  `daijin_count` int(11) NOT NULL,
  `seo_title` text NOT NULL,
  `seo_keyword` text NOT NULL,
  `seo_description` text NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `biz_license` varchar(255) NOT NULL,
  `biz_other_license` varchar(255) NOT NULL,
  `new_dp_count` int(11) NOT NULL,
  `new_dp_count_time` int(11) NOT NULL,
  `shop_count` int(11) NOT NULL,
  `mobile_brief` text NOT NULL,
  `sort` int(11) NOT NULL,
  `dp_group_point` text NOT NULL,
  `tuan_youhui_cache` text NOT NULL,
  `is_auto_order` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1:手机自主下单;消费者(在手机端上)可以直接给该门店支付金额',
  `bifanwe_license` varchar(255) NOT NULL,
  `bifanwe_other_license` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `city_id` (`city_id`),
  KEY `is_verify` (`is_verify`),
  KEY `is_effect` (`is_effect`),
  KEY `is_recommend` (`is_recommend`),
  KEY `avg_point` (`avg_point`),
  KEY `good_dp_count` (`good_dp_count`),
  KEY `bad_dp_count` (`bad_dp_count`),
  KEY `common_dp_count` (`common_dp_count`),
  KEY `total_point` (`total_point`),
  KEY `dp_count` (`dp_count`),
  KEY `good_rate` (`good_rate`),
  KEY `common_rate` (`common_rate`),
  KEY `tuan_count` (`tuan_count`),
  KEY `event_count` (`event_count`),
  KEY `youhui_count` (`youhui_count`),
  KEY `daijin_count` (`daijin_count`),
  KEY `new_dp_count` (`new_dp_count`),
  KEY `is_main` (`is_main`),
  KEY `supplier_id` (`supplier_id`) USING BTREE,
  KEY `search_idx1` (`city_id`,`is_recommend`,`is_effect`,`is_verify`) USING BTREE,
  KEY `search_idx2` (`city_id`,`avg_point`,`is_effect`) USING BTREE,
  KEY `search_idx3` (`supplier_id`,`is_main`) USING BTREE,
  KEY `search_idx4` (`city_id`,`deal_cate_id`,`is_verify`,`is_effect`,`is_recommend`) USING BTREE,
  KEY `search_idx5` (`city_id`,`deal_cate_id`,`dp_count`,`avg_point`,`ref_avg_price`,`is_effect`,`is_recommend`,`is_verify`) USING BTREE,
  KEY `search_idx6` (`good_rate`,`is_verify`,`is_effect`) USING BTREE,
  KEY `sort_default` (`is_recommend`,`is_verify`,`dp_count`) USING BTREE,
  KEY `ref_avg_price` (`ref_avg_price`),
  KEY `shop_count` (`shop_count`),
  FULLTEXT KEY `name_match` (`name_match`),
  FULLTEXT KEY `locate_match` (`locate_match`),
  FULLTEXT KEY `deal_cate_match` (`deal_cate_match`),
  FULLTEXT KEY `tags_match` (`tags_match`),
  FULLTEXT KEY `all_match` (`deal_cate_match`,`locate_match`,`name_match`,`tags_match`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- 转存表中的数据 `fanwe_supplier_location`
--

INSERT INTO `fanwe_supplier_location` (`id`, `name`, `route`, `address`, `tel`, `contact`, `xpoint`, `ypoint`, `supplier_id`, `open_time`, `brief`, `is_main`, `api_address`, `city_id`, `deal_cate_match`, `deal_cate_match_row`, `locate_match`, `locate_match_row`, `name_match`, `name_match_row`, `deal_cate_id`, `preview`, `is_recommend`, `is_verify`, `tags`, `tags_match`, `tags_match_row`, `avg_point`, `good_dp_count`, `bad_dp_count`, `common_dp_count`, `total_point`, `dp_count`, `image_count`, `ref_avg_price`, `good_rate`, `common_rate`, `sms_content`, `index_img`, `tuan_count`, `event_count`, `youhui_count`, `daijin_count`, `seo_title`, `seo_keyword`, `seo_description`, `is_effect`, `biz_license`, `biz_other_license`, `new_dp_count`, `new_dp_count_time`, `shop_count`, `mobile_brief`, `sort`, `dp_group_point`, `tuan_youhui_cache`, `is_auto_order`, `bifanwe_license`, `bifanwe_other_license`) VALUES
(17, '享客来牛排世家', '', '安泰店：鼓楼区吉庇路39号（安泰楼后面，码头一号旁）南街店 ：福州市鼓楼区八一七路南街车站旁（大洋百货正对面）', '0591-88592283', '', '119.306144', '26.086743', 18, '', '', 1, '安泰店：鼓楼区吉庇路39号（安泰楼后面，码头一号旁）南街店 ：福州市鼓楼区八一七路南街车站旁（大洋百货正对面）', 15, 'ux39184ux39278ux32654ux39135', '餐饮美食', 'ux40723ux27004ux21306,ux34903ux24215,ux21335ux34903,ux31119ux24030ux24066,ux19971ux36335,ux22823ux27915,ux30721ux22836,ux36710ux31449,ux30334ux36135,ux23545ux38754,ux23433ux27888ux24215ux65306ux40723ux27004ux21306ux21513ux24199ux36335ux51ux57ux21495ux65288ux23433ux27888ux27004ux21518ux38754ux65292ux30721ux22836ux19968ux21495ux26049ux65289ux21335ux34903ux24215ux65306ux31119ux24030ux24066ux40723ux27004ux21306ux20843ux19968ux19971ux36335ux21335ux34903ux36710ux31449ux26049ux65288ux22823ux27915ux30334ux36135ux27491ux23545ux38754ux65289,ux19996ux34903ux21475', '鼓楼区,街店,南街,福州市,七路,大洋,码头,车站,百货,对面,安泰店：鼓楼区吉庇路39号（安泰楼后面，码头一号旁）南街店 ：福州市鼓楼区八一七路南街车站旁（大洋百货正对面）,东街口', 'ux29275ux25490,ux19990ux23478,ux20139ux23458ux26469ux29275ux25490ux19990ux23478', '牛排,世家,享客来牛排世家', 8, './public/attachment/201201/4f013ee3d7cb9.jpg', 1, 1, '', '', '', 0.0000, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, '', '', 0, 0, 0, 0, '', '', '', 1, '', '', 0, 0, 0, '', 0, '', '', 0, '', ''),
(15, '爱琴海餐厅', '社会主义学院站下: 61路、70路、78路、100路、129路', '福州市鼓楼区鼓屏路47号', '0591-88522779', '', '119.304522', '26.098978', 16, '18:00-24:00', '', 1, '福州市鼓楼区鼓屏路47号', 15, 'ux39184ux39278ux32654ux39135', '餐饮美食', 'ux40723ux27004ux21306,ux31119ux24030ux24066,ux31119ux24030ux24066ux40723ux27004ux21306ux40723ux23631ux36335ux52ux55ux21495,ux23631ux23665', '鼓楼区,福州市,福州市鼓楼区鼓屏路47号,屏山', 'ux29233ux29748ux28023,ux39184ux21381,ux29233ux29748ux28023ux39184ux21381', '爱琴海,餐厅,爱琴海餐厅', 8, './public/attachment/201201/4f0113ce66cd4.jpg', 1, 1, '', 'ux24178ux20928,ux26126ux20142,ux26377ux30452ux36798ux20844ux20132', '干净,明亮,有直达公交', 3.3333, 2, 1, 0, 10, 3, 0, 43.3333, 0.6667, 0.0000, '', '', 1, 0, 0, 0, '', '', '', 1, '', '', 0, 0, 0, '', 0, '', '', 0, '', ''),
(16, '老刘野生大鱼坊', '7、16、36、40、62、69、71、73、74、79、80、88、92、97、103、125、202、306路，到五一路站下车即可', '福州市鼓楼区古田路88号华丰大厦3层A室(闽都大酒店对面)', '0591-83339688', '', '119.320796', '26.082646', 17, '10:30-14:30,16:30-21:30', '', 1, '福州市鼓楼区古田路88号华丰大厦3层A室(闽都大酒店对面)', 15, 'ux39184ux39278ux32654ux39135', '餐饮美食', 'ux40723ux27004ux21306,ux21326ux20016,ux31119ux24030ux24066,ux30000ux36335,ux22823ux37202ux24215,ux23545ux38754,ux22823ux21414,ux31119ux24030ux24066ux40723ux27004ux21306ux21476ux30000ux36335ux56ux56ux21495ux21326ux20016ux22823ux21414ux51ux23618ux65ux23460ux40ux38397ux37117ux22823ux37202ux24215ux23545ux38754ux41,ux21488ux27743ux21306', '鼓楼区,华丰,福州市,田路,大酒店,对面,大厦,福州市鼓楼区古田路88号华丰大厦3层A室(闽都大酒店对面),台江区', 'ux32769ux21016,ux22823ux40060,ux37326ux29983,ux32769ux21016ux37326ux29983ux22823ux40060ux22346', '老刘,大鱼,野生,老刘野生大鱼坊', 8, './public/attachment/201201/4f0116296dc27.jpg', 1, 1, '', '', '', 0.0000, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, '', '', 1, 0, 0, 4, '', '', '', 1, '', '', 0, 0, 0, '', 0, '', '', 0, '', ''),
(14, '闽粤汇', 'K3、19、51、52、69、74、102、106、129、130、133、301路，至蒙古营站下车', '五一北路110号原海关大院内（现光大银行后）', '0591-83326788,0591-88319968', '', '119.315682', '26.087528', 15, '11:30-14:00，17:30-21:00', '', 1, '五一北路110号原海关大院内（现光大银行后）', 15, 'ux39184ux39278ux32654ux39135', '餐饮美食', 'ux20809ux22823ux38134ux34892,ux21271ux36335,ux38498ux20869,ux28023ux20851,ux49ux49ux48,ux20116ux19968,ux20116ux19968ux21271ux36335ux49ux49ux48ux21495ux21407ux28023ux20851ux22823ux38498ux20869ux65288ux29616ux20809ux22823ux38134ux34892ux21518ux65289,ux40723ux27004ux21306,ux20116ux19968ux24191ux22330,ux26187ux23433ux21306,ux20116ux19968ux26032ux26449', '光大银行,北路,院内,海关,110,五一,五一北路110号原海关大院内（现光大银行后）,鼓楼区,五一广场,晋安区,五一新村', 'ux38397ux31908,ux38397ux31908ux27719', '闽粤,闽粤汇', 8, './public/attachment/201201/4f0110c586c48.jpg', 1, 1, '', '', '', 0.0000, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, '', '', 2, 0, 0, 0, '', '', '', 1, '', '', 0, 0, 0, '', 0, '', '', 0, '', ''),
(18, '格瑞雅美容院', '', '福州市五一北路67号（蒙古营站牌后）延福宾馆后院', '0591-88813330‎', '', '119.31585', '26.089641', 19, '', '', 1, '福州市五一北路67号（蒙古营站牌后）延福宾馆后院', 15, 'ux29983ux27963ux26381ux21153', '生活服务', 'ux33945ux21476ux33829,ux31119ux24030ux24066,ux21271ux36335,ux31449ux29260,ux21518ux38498,ux23486ux39302,ux20116ux19968,ux31119ux24030ux24066ux20116ux19968ux21271ux36335ux54ux55ux21495ux65288ux33945ux21476ux33829ux31449ux29260ux21518ux65289ux24310ux31119ux23486ux39302ux21518ux38498,ux40723ux27004ux21306,ux20116ux19968ux24191ux22330', '蒙古营,福州市,北路,站牌,后院,宾馆,五一,福州市五一北路67号（蒙古营站牌后）延福宾馆后院,鼓楼区,五一广场', 'ux38597ux32654,ux26684ux29790,ux23481ux38498,ux26684ux29790ux38597ux32654ux23481ux38498', '雅美,格瑞,容院,格瑞雅美容院', 10, './public/attachment/201201/4f013fc452347.jpg', 1, 1, '', '', '', 0.0000, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, '', '', 2, 0, 0, 0, '', '', '', 1, '', '', 0, 0, 0, '', 0, '', '', 0, '', ''),
(19, '馨语河畔', '', '鼓楼区南后街5号2楼', '18659138700‎', '', '119.302286', '26.091546', 20, '', '', 1, '鼓楼区南后街5号2楼', 15, 'ux39184ux39278ux32654ux39135', '餐饮美食', 'ux40723ux27004ux21306,ux21335ux21518ux34903,ux40723ux27004ux21306ux21335ux21518ux34903ux53ux21495ux50ux27004', '鼓楼区,南后街,鼓楼区南后街5号2楼', 'ux27827ux30036,ux39336ux35821ux27827ux30036', '河畔,馨语河畔', 8, './public/attachment/201201/4f01422c0c096.jpg', 1, 1, '', '', '', 0.0000, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, '', '', 0, 0, 0, 0, '', '', '', 1, '', '', 0, 0, 0, '', 0, '', '', 0, '', ''),
(20, '泡泡糖宝贝游泳馆', '', '福州市晋安区连洋路123号好来屋星光大道5#楼13#店面', '0591-85162880', '', '119.357576', '26.077701', 21, '', '', 1, '福州市晋安区连洋路123号好来屋星光大道5#楼13#店面', 15, '', '', 'ux26187ux23433ux21306,ux22909ux26469,ux31119ux24030ux24066,ux24215ux38754,ux26143ux20809,ux22823ux36947,ux36830ux27915ux36335,ux49ux50ux51,ux49ux51,ux31119ux24030ux24066ux26187ux23433ux21306ux36830ux27915ux36335ux49ux50ux51ux21495ux22909ux26469ux23627ux26143ux20809ux22823ux36947ux53ux35ux27004ux49ux51ux35ux24215ux38754,ux34701ux20392ux19996ux21306', '晋安区,好来,福州市,店面,星光,大道,连洋路,123,13,福州市晋安区连洋路123号好来屋星光大道5#楼13#店面,融侨东区', 'ux27873ux27873ux31958,ux28216ux27891ux39302,ux23453ux36125,ux27873ux27873ux31958ux23453ux36125ux28216ux27891ux39302', '泡泡糖,游泳馆,宝贝,泡泡糖宝贝游泳馆', 0, './public/attachment/201201/4f0142c918abd.jpg', 1, 1, '', '', '', 0.0000, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, '', '', 0, 0, 0, 1, '', '', '', 1, '', '', 0, 0, 0, '', 0, '', '', 0, '', '');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_supplier_location_area_link`
--

CREATE TABLE IF NOT EXISTS `fanwe_supplier_location_area_link` (
  `location_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  PRIMARY KEY (`location_id`,`area_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_supplier_location_area_link`
--

INSERT INTO `fanwe_supplier_location_area_link` (`location_id`, `area_id`) VALUES
(14, 13),
(14, 47),
(15, 8),
(15, 20),
(16, 10),
(17, 8),
(17, 14),
(18, 8),
(18, 13),
(19, 8),
(20, 9),
(20, 45);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_supplier_location_brand_link`
--

CREATE TABLE IF NOT EXISTS `fanwe_supplier_location_brand_link` (
  `brand_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_supplier_location_brand_link`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_supplier_location_dp`
--

CREATE TABLE IF NOT EXISTS `fanwe_supplier_location_dp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text,
  `create_time` int(11) NOT NULL,
  `point` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_img` tinyint(1) NOT NULL,
  `is_best` tinyint(1) NOT NULL,
  `is_top` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `good_count` int(11) NOT NULL,
  `bad_count` int(11) NOT NULL,
  `reply_count` int(11) NOT NULL,
  `supplier_location_id` int(11) NOT NULL,
  `avg_price` float(14,4) NOT NULL,
  `kb_user_id` varchar(50) NOT NULL,
  `kb_create_time` varchar(20) DEFAULT '',
  `kb_tags` varchar(255) DEFAULT '',
  `is_index` tinyint(1) NOT NULL,
  `is_buy` tinyint(1) NOT NULL,
  `from_data` varchar(255) NOT NULL,
  `rel_app_index` varchar(255) NOT NULL,
  `rel_route` varchar(255) NOT NULL,
  `rel_param` varchar(255) NOT NULL,
  `message_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `supplier_location_id` (`supplier_location_id`) USING BTREE,
  KEY `is_img` (`is_img`) USING BTREE,
  KEY `is_best` (`is_best`) USING BTREE,
  KEY `is_top` (`is_top`) USING BTREE,
  KEY `good_count` (`good_count`) USING BTREE,
  KEY `bad_count` (`bad_count`) USING BTREE,
  KEY `reply_count` (`reply_count`) USING BTREE,
  KEY `avg_price` (`avg_price`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `fanwe_supplier_location_dp`
--

INSERT INTO `fanwe_supplier_location_dp` (`id`, `title`, `content`, `create_time`, `point`, `user_id`, `is_img`, `is_best`, `is_top`, `status`, `good_count`, `bad_count`, `reply_count`, `supplier_location_id`, `avg_price`, `kb_user_id`, `kb_create_time`, `kb_tags`, `is_index`, `is_buy`, `from_data`, `rel_app_index`, `rel_route`, `rel_param`, `message_id`) VALUES
(1, '上周去吃过，感觉不错', '上周去吃过，感觉不错。推荐这家餐厅[坏笑]', 1333241498, 4, 44, 0, 0, 0, 1, 0, 0, 0, 15, 130.0000, '', '', '', 0, 0, '', '', '', '', 0),
(2, '非常好', '非常好非常好非常好非常好非常好非常好非常好', 1333241553, 5, 44, 0, 0, 0, 1, 0, 0, 0, 15, 0.0000, '', '', '', 0, 0, '', '', '', '', 0),
(3, '一般般一般般', '一般般一般般一般般一般般一般般一般般一般般一般般一般般一般般一般般一般般一般般一般般', 1333241576, 1, 44, 0, 0, 0, 1, 0, 0, 0, 15, 0.0000, '', '', '', 0, 0, '', '', '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_supplier_location_dp_point_result`
--

CREATE TABLE IF NOT EXISTS `fanwe_supplier_location_dp_point_result` (
  `group_id` int(11) NOT NULL,
  `point` int(11) NOT NULL,
  `supplier_location_id` int(11) NOT NULL,
  `dp_id` int(11) NOT NULL,
  KEY `group_id` (`group_id`) USING BTREE,
  KEY `supplier_location_id` (`supplier_location_id`) USING BTREE,
  KEY `dp_id` (`dp_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_supplier_location_dp_point_result`
--

INSERT INTO `fanwe_supplier_location_dp_point_result` (`group_id`, `point`, `supplier_location_id`, `dp_id`) VALUES
(1, 3, 15, 1),
(2, 4, 15, 1),
(1, 3, 15, 2),
(2, 5, 15, 2),
(1, 4, 15, 3),
(2, 2, 15, 3);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_supplier_location_dp_reply`
--

CREATE TABLE IF NOT EXISTS `fanwe_supplier_location_dp_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dp_id` int(11) NOT NULL,
  `content` text NOT NULL COMMENT '回应内容',
  `user_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `fanwe_supplier_location_dp_reply`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_supplier_location_dp_tag_result`
--

CREATE TABLE IF NOT EXISTS `fanwe_supplier_location_dp_tag_result` (
  `tags` varchar(255) NOT NULL,
  `dp_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `supplier_location_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_supplier_location_dp_tag_result`
--

INSERT INTO `fanwe_supplier_location_dp_tag_result` (`tags`, `dp_id`, `group_id`, `supplier_location_id`) VALUES
('干净 明亮', 1, 1, 15),
('有直达公交', 1, 2, 15);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_supplier_location_images`
--

CREATE TABLE IF NOT EXISTS `fanwe_supplier_location_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  `sort` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `supplier_location_id` int(11) NOT NULL,
  `dp_id` int(11) NOT NULL,
  `good_count` int(11) NOT NULL,
  `bad_count` int(11) NOT NULL,
  `brief` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `click_count` int(11) NOT NULL,
  `images_group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`user_id`) USING BTREE,
  KEY `supplier_location_id` (`supplier_location_id`) USING BTREE,
  KEY `dp_id` (`dp_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `fanwe_supplier_location_images`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_supplier_location_point_result`
--

CREATE TABLE IF NOT EXISTS `fanwe_supplier_location_point_result` (
  `group_id` int(11) NOT NULL,
  `avg_point` float(14,4) NOT NULL,
  `supplier_location_id` int(11) NOT NULL,
  `total_point` int(11) NOT NULL,
  PRIMARY KEY (`group_id`,`supplier_location_id`),
  KEY `group_id` (`group_id`) USING BTREE,
  KEY `dp_id` (`total_point`) USING BTREE,
  KEY `avg_point` (`avg_point`) USING BTREE,
  KEY `total_point` (`total_point`) USING BTREE,
  KEY `supplier_location_id` (`supplier_location_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_supplier_location_point_result`
--

INSERT INTO `fanwe_supplier_location_point_result` (`group_id`, `avg_point`, `supplier_location_id`, `total_point`) VALUES
(1, 3.0000, 15, 3),
(2, 4.0000, 15, 4);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_supplier_location_sign_log`
--

CREATE TABLE IF NOT EXISTS `fanwe_supplier_location_sign_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `sign_time` int(11) NOT NULL,
  `point` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `location_id` (`location_id`),
  KEY `sign_time` (`sign_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `fanwe_supplier_location_sign_log`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_supplier_money_log`
--

CREATE TABLE IF NOT EXISTS `fanwe_supplier_money_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_info` text NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `money` decimal(20,4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `fanwe_supplier_money_log`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_supplier_money_submit`
--

CREATE TABLE IF NOT EXISTS `fanwe_supplier_money_submit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `money` decimal(20,4) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `fanwe_supplier_money_submit`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_supplier_submit`
--

CREATE TABLE IF NOT EXISTS `fanwe_supplier_submit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `cate_config` text NOT NULL,
  `location_config` text NOT NULL,
  `address` varchar(255) NOT NULL,
  `tel` varchar(255) NOT NULL,
  `open_time` varchar(255) NOT NULL,
  `xpoint` varchar(255) NOT NULL,
  `ypoint` varchar(255) NOT NULL,
  `location_id` int(11) NOT NULL,
  `is_publish` tinyint(1) NOT NULL,
  `user_id` int(1) NOT NULL,
  `create_time` int(11) NOT NULL,
  `h_name` varchar(255) NOT NULL COMMENT '企业名称',
  `h_faren` varchar(255) NOT NULL COMMENT '法人',
  `h_license` varchar(255) NOT NULL COMMENT '营业执照',
  `h_other_license` varchar(255) NOT NULL COMMENT '其他资质上传',
  `h_user_name` varchar(255) NOT NULL COMMENT '店铺管理员姓名',
  `h_tel` varchar(255) NOT NULL,
  `h_supplier_logo` varchar(255) NOT NULL,
  `h_supplier_image` varchar(255) NOT NULL,
  `city_id` int(11) NOT NULL,
  `h_bank_info` text NOT NULL,
  `h_bank_user` varchar(255) NOT NULL,
  `h_bank_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `fanwe_supplier_submit`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_supplier_tag`
--

CREATE TABLE IF NOT EXISTS `fanwe_supplier_tag` (
  `tag_name` varchar(255) NOT NULL,
  `supplier_location_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL COMMENT '关联商户子类标签分组的ID(可为前台会员点评的分组标签，也可为后台管理员编辑的分组标签), 为0时为主显标签',
  `total_count` int(11) NOT NULL COMMENT '同商户，同类分组提交的次数。 用于表示该标签的热门度',
  KEY `merchant_id` (`supplier_location_id`) USING BTREE,
  KEY `group_id` (`group_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_supplier_tag`
--

INSERT INTO `fanwe_supplier_tag` (`tag_name`, `supplier_location_id`, `group_id`, `total_count`) VALUES
('干净', 15, 1, 1),
('明亮', 15, 1, 1),
('有直达公交', 15, 2, 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_supplier_tag_group_preset`
--

CREATE TABLE IF NOT EXISTS `fanwe_supplier_tag_group_preset` (
  `group_id` int(11) NOT NULL,
  `supplier_location_id` int(11) NOT NULL,
  `preset` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_supplier_tag_group_preset`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_tag_group`
--

CREATE TABLE IF NOT EXISTS `fanwe_tag_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `preset` text NOT NULL,
  `sort` int(11) NOT NULL,
  `memo` varchar(255) NOT NULL,
  `tags` text NOT NULL,
  `allow_dp` tinyint(1) NOT NULL,
  `allow_search` tinyint(1) NOT NULL,
  `allow_vote` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `fanwe_tag_group`
--

INSERT INTO `fanwe_tag_group` (`id`, `name`, `preset`, `sort`, `memo`, `tags`, `allow_dp`, `allow_search`, `allow_vote`) VALUES
(1, '环境', '', 100, '', '', 1, 1, 0),
(2, '交通', '', 100, '', '', 1, 1, 0),
(3, '口味', '', 100, '', '', 1, 1, 0),
(4, '服务', '很好 一般 很周到', 100, '', '', 1, 1, 0),
(5, '停车', '', 100, '', '', 1, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_tag_group_link`
--

CREATE TABLE IF NOT EXISTS `fanwe_tag_group_link` (
  `tag_group_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  KEY `tag_id` (`tag_group_id`) USING BTREE,
  KEY `type_id` (`category_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_tag_group_link`
--

INSERT INTO `fanwe_tag_group_link` (`tag_group_id`, `category_id`) VALUES
(4, 12),
(5, 11),
(4, 11),
(2, 11),
(4, 10),
(5, 10),
(5, 9),
(4, 9),
(2, 9),
(1, 8),
(2, 8),
(3, 8),
(4, 13),
(4, 14),
(5, 14),
(2, 15),
(4, 15),
(1, 16),
(4, 16),
(1, 17),
(4, 17);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_tag_user_vote`
--

CREATE TABLE IF NOT EXISTS `fanwe_tag_user_vote` (
  `user_id` int(11) NOT NULL,
  `tag_name` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`tag_name`,`group_id`,`location_id`),
  KEY `user_id` (`user_id`),
  KEY `tag_name` (`tag_name`),
  KEY `location_id` (`location_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_tag_user_vote`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_topic`
--

CREATE TABLE IF NOT EXISTS `fanwe_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `forum_title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `type` varchar(255) NOT NULL COMMENT '0:普通日志 1:购物分享',
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `relay_id` int(11) NOT NULL COMMENT '0:原创 1:转发来源的贴子ID',
  `origin_id` int(11) NOT NULL COMMENT '原创贴子ID',
  `reply_count` int(11) NOT NULL,
  `relay_count` int(11) NOT NULL,
  `good_count` int(11) NOT NULL,
  `bad_count` int(11) NOT NULL,
  `click_count` int(11) NOT NULL,
  `rel_app_index` varchar(255) NOT NULL,
  `rel_route` varchar(255) NOT NULL,
  `rel_param` varchar(255) NOT NULL,
  `message_id` int(11) NOT NULL,
  `topic_group` varchar(255) NOT NULL DEFAULT 'share',
  `fav_id` int(11) NOT NULL COMMENT '喜欢XX分享的分享ID',
  `fav_count` int(11) NOT NULL,
  `user_name_match` text NOT NULL,
  `user_name_match_row` text NOT NULL,
  `keyword_match` text NOT NULL,
  `keyword_match_row` text NOT NULL,
  `xpoint` varchar(255) NOT NULL,
  `ypoint` varchar(255) NOT NULL,
  `tags` text NOT NULL,
  `is_recommend` tinyint(1) NOT NULL,
  `has_image` tinyint(1) NOT NULL,
  `source_type` tinyint(1) NOT NULL COMMENT '0:本站 1:外站',
  `source_name` varchar(255) NOT NULL,
  `source_url` varchar(255) NOT NULL,
  `group_data` text NOT NULL COMMENT 'group插件采集同步的序列化数据',
  `daren_page` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL,
  `is_top` tinyint(1) NOT NULL,
  `is_best` tinyint(1) NOT NULL,
  `op_memo` text NOT NULL,
  `last_time` int(11) NOT NULL,
  `last_user_id` int(11) NOT NULL,
  `cate_match` text NOT NULL,
  `cate_match_row` text NOT NULL,
  `origin_topic_data` text NOT NULL,
  `images_count` int(11) NOT NULL,
  `image_list` text NOT NULL,
  `is_cached` tinyint(1) NOT NULL,
  `topic_group_data` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `create_time` (`create_time`),
  KEY `user_id` (`user_id`),
  KEY `is_recommend` (`is_recommend`),
  KEY `group_id` (`group_id`),
  KEY `is_top` (`is_top`),
  KEY `is_best` (`is_best`),
  KEY `has_image` (`has_image`),
  KEY `fav_id` (`fav_id`),
  KEY `relay_id` (`relay_id`),
  KEY `origin_id` (`origin_id`),
  KEY `type` (`type`),
  KEY `is_effect` (`is_effect`),
  KEY `is_delete` (`is_delete`),
  KEY `click_count` (`click_count`),
  KEY `last_time` (`last_time`),
  KEY `ordery_sort` (`create_time`,`is_top`),
  KEY `last_time_sort` (`last_time`,`is_top`),
  KEY `multi_key` (`is_effect`,`is_delete`,`last_time`,`is_recommend`,`group_id`,`is_top`,`is_best`,`create_time`),
  FULLTEXT KEY `user_name_match` (`user_name_match`),
  FULLTEXT KEY `keyword_match` (`keyword_match`),
  FULLTEXT KEY `cate_match` (`cate_match`),
  FULLTEXT KEY `all_match` (`keyword_match`,`cate_match`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=180 ;

--
-- 转存表中的数据 `fanwe_topic`
--

INSERT INTO `fanwe_topic` (`id`, `title`, `forum_title`, `content`, `create_time`, `type`, `user_id`, `user_name`, `is_effect`, `is_delete`, `relay_id`, `origin_id`, `reply_count`, `relay_count`, `good_count`, `bad_count`, `click_count`, `rel_app_index`, `rel_route`, `rel_param`, `message_id`, `topic_group`, `fav_id`, `fav_count`, `user_name_match`, `user_name_match_row`, `keyword_match`, `keyword_match_row`, `xpoint`, `ypoint`, `tags`, `is_recommend`, `has_image`, `source_type`, `source_name`, `source_url`, `group_data`, `daren_page`, `group_id`, `is_top`, `is_best`, `op_memo`, `last_time`, `last_user_id`, `cate_match`, `cate_match_row`, `origin_topic_data`, `images_count`, `image_list`, `is_cached`, `topic_group_data`) VALUES
(133, '荒草日出', '', '很美[害羞][哈哈]', 1328312164, 'share', 44, 'fanwe', 1, 0, 0, 133, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 0, '', '', 'ux26085ux20986,ux25668ux24433,ux23475ux32670,ux21704ux21704,ux33618ux33609,ux33618ux33609ux26085ux20986', '日出,摄影,害羞,哈哈,荒草,荒草日出', '', '', '日出 摄影', 1, 1, 0, '网站', '', '', './public/attachment/201202/16/12/4f3c86f3e1c90.jpg', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(134, '巧克力', '', '情人节要到了，准备巧克力了吗？', 1328312272, 'share', 44, 'fanwe', 1, 0, 0, 134, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 2, '', '', 'ux24039ux20811ux21147,ux24773ux20154ux33410,ux33410ux35201,ux20934ux22791,ux24773ux20154', '巧克力,情人节,节要,准备,情人', '', '', '巧克力 情人节', 1, 1, 0, '网站', '', '', './public/attachment/201202/16/12/4f3c871c3009b.jpg', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(135, '', '', '卡哇伊~[害羞]', 1328312355, 'share', 44, 'fanwe', 1, 0, 0, 135, 0, 1, 0, 0, 0, '', '', '', 0, 'share', 0, 0, '', '', 'ux23456ux29289,ux21334ux33804,ux21487ux29233,ux23475ux32670', '宠物,卖萌,可爱,害羞', '', '', '宠物 卖萌 可爱', 1, 1, 0, '网站', '', '', './public/attachment/201202/16/12/4f3c873962c4f.jpg', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(136, '', '', '电影《猎物》剧照[发呆]', 1328312503, 'share', 44, 'fanwe', 1, 0, 0, 136, 0, 1, 0, 0, 1, '', '', '', 0, 'share', 0, 0, '', '', 'ux30005ux24433,ux29454ux29289,ux21095ux29031,ux21457ux21574', '电影,猎物,剧照,发呆', '', '', '电影  猎物', 1, 1, 0, '网站', '', '', './public/attachment/201202/16/12/4f3c875493361.jpg', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(137, '', '', '口味又有些重了。[呲牙][呲牙]', 1328312605, 'share', 44, 'fanwe', 1, 0, 0, 137, 2, 2, 0, 0, 6, '', '', '', 0, 'share', 0, 0, '', '', 'ux28216ux25103,ux25163ux32472,ux21618ux29273,ux21475ux21619,ux26377ux20123', '游戏,手绘,呲牙,口味,有些', '', '', '游戏 手绘', 1, 1, 0, '网站', '', '', './public/attachment/201202/16/12/4f3c871c3009b.jpg', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(138, '', '', '口味又有些重了。[呲牙][呲牙] @fzmatthew:太可怕了', 1328312652, 'share', 46, 'fzmatthew', 1, 0, 137, 137, 0, 1, 0, 0, 0, '', '', '', 0, 'share', 0, 0, 'ux102ux122ux109ux97ux116ux116ux104ux101ux119', 'fzmatthew', 'ux21618ux29273,ux21475ux21619,ux102ux122ux109ux97ux116ux116ux104ux101ux119,ux21487ux24597,ux26377ux20123', '呲牙,口味,fzmatthew,可怕,有些', '', '', '', 0, 0, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(139, '', '', '', 1328312658, 'share', 46, 'fzmatthew', 1, 0, 0, 134, 1, 0, 0, 0, 2, '', '', '', 0, 'share', 134, 1, '', '', '', '', '', '', '', 0, 0, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(140, '', '', '卡哇伊~[害羞] @fzmatthew:很可爱啊[哈哈][哈哈]', 1328312676, 'share', 46, 'fzmatthew', 1, 0, 135, 135, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 0, 'ux102ux122ux109ux97ux116ux116ux104ux101ux119', 'fzmatthew', 'ux21704ux21704,ux23475ux32670,ux102ux122ux109ux97ux116ux116ux104ux101ux119,ux21487ux29233', '哈哈,害羞,fzmatthew,可爱', '', '', '', 0, 0, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(141, '', '', '口味又有些重了。[呲牙][呲牙] @fzmatthew:太可怕了 @fz云淡风轻:悲惨[得意]', 1328312778, 'share', 45, 'fz云淡风轻', 1, 0, 138, 137, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 0, 'ux102ux122ux109ux97ux116ux116ux104ux101ux119,ux102ux122ux20113ux28129ux39118ux36731', 'fzmatthew,fz云淡风轻', 'ux21618ux29273,ux20113ux28129ux39118ux36731,ux24754ux24808,ux21475ux21619,ux102ux122ux109ux97ux116ux116ux104ux101ux119,ux24471ux24847,ux21487ux24597,ux26377ux20123,ux102ux122', '呲牙,云淡风轻,悲惨,口味,fzmatthew,得意,可怕,有些,fz', '', '', '', 0, 0, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(142, '', '', '', 1328312833, 'share', 45, 'fz云淡风轻', 1, 0, 0, 134, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 139, 0, '', '', '', '', '', '', '', 0, 0, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(143, '', '', '电影《猎物》剧照[发呆] @fz云淡风轻:好看吗？', 1328312880, 'share', 45, 'fz云淡风轻', 1, 0, 136, 136, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 0, 'ux102ux122ux20113ux28129ux39118ux36731', 'fz云淡风轻', 'ux20113ux28129ux39118ux36731,ux29454ux29289,ux21095ux29031,ux21457ux21574,ux22909ux30475,ux30005ux24433,ux102ux122', '云淡风轻,猎物,剧照,发呆,好看,电影,fz', '', '', '', 0, 0, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(144, '', '', '时尚', 1328315204, 'share', 45, 'fz云淡风轻', 1, 0, 0, 144, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 1, '', '', 'ux26102ux23578', '时尚', '', '', ' 时尚', 0, 1, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(145, '', '', '精美壁纸', 1328315232, 'share', 45, 'fz云淡风轻', 1, 0, 0, 145, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 0, '', '', 'ux22721ux32440,ux31934ux32654ux22721ux32440', '壁纸,精美壁纸', '', '', ' 壁纸', 0, 1, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(146, '', '', '【经典回顾】：星尘', 1328315281, 'share', 45, 'fz云淡风轻', 1, 0, 0, 146, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 0, '', '', 'ux30005ux24433,ux26143ux23576,ux32463ux20856ux22238ux39038', '电影,星尘,经典回顾', '', '', '电影  星尘', 0, 1, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(147, '', '', '【经典回顾】：奇幻精灵历险记', 1328315335, 'share', 45, 'fz云淡风轻', 1, 0, 0, 147, 0, 1, 0, 0, 0, '', '', '', 0, 'share', 0, 0, '', '', 'ux30005ux24433,ux32463ux20856ux22238ux39038,ux21382ux38505ux35760,ux22855ux24187,ux31934ux28789', '电影,经典回顾,历险记,奇幻,精灵', '', '', '电影 ', 0, 1, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(148, '', '', '[哈哈][哈哈]奇幻精灵历险记', 1328315357, 'share', 45, 'fz云淡风轻', 1, 0, 0, 148, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 0, '', '', 'ux30005ux24433,ux21704ux21704,ux21382ux38505ux35760,ux22855ux24187,ux31934ux28789', '电影,哈哈,历险记,奇幻,精灵', '', '', '电影 ', 0, 1, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(149, '', '', '街拍', 1328315545, 'share', 45, 'fz云淡风轻', 1, 0, 0, 149, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 0, '', '', 'ux34903ux25293', '街拍', '', '', ' 街拍', 0, 1, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(150, '', '', '看什么看，咬死你们！[呲牙][呲牙]', 1328315616, 'share', 45, 'fz云淡风轻', 1, 0, 0, 150, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 1, '', '', 'ux23456ux29289,ux21334ux33804,ux21487ux29233,ux21618ux29273,ux20320ux20204,ux20160ux20040', '宠物,卖萌,可爱,呲牙,你们,什么', '', '', ' 宠物 卖萌 可爱', 0, 1, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(151, '', '', '手绘可爱猫咪画集欣赏', 1328315658, 'share', 45, 'fz云淡风轻', 1, 0, 0, 151, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 0, '', '', 'ux29483ux21674,ux23456ux29289,ux30011ux38598,ux25163ux32472,ux21487ux29233,ux27427ux36175', '猫咪,宠物,画集,手绘,可爱,欣赏', '', '', ' 猫咪 宠物', 0, 1, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(152, '', '', '绝美湿地--拉市海。。[酷]', 1328315738, 'share', 45, 'fz云淡风轻', 1, 0, 0, 152, 0, 1, 0, 0, 0, '', '', '', 0, 'share', 0, 1, '', '', 'ux33258ux21161ux28216,ux26053ux28216,ux26053ux34892,ux25289ux24066ux28023,ux28287ux22320', '自助游,旅游,旅行,拉市海,湿地', '', '', ' 自助游 旅游 旅行 拉市海', 0, 1, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(153, '', '', '', 1328315825, 'share', 46, 'fzmatthew', 1, 0, 0, 150, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 150, 0, '', '', '', '', '', '', '', 0, 0, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(154, '', '', '绝美湿地--拉市海。。[酷] @fzmatthew:真想去，很美', 1328315833, 'share', 46, 'fzmatthew', 1, 0, 152, 152, 1, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 0, 'ux102ux122ux109ux97ux116ux116ux104ux101ux119', 'fzmatthew', 'ux30495ux24819,ux28287ux22320,ux102ux122ux109ux97ux116ux116ux104ux101ux119', '真想,湿地,fzmatthew', '', '', '', 0, 0, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(155, '', '', '【经典回顾】：奇幻精灵历险记 @fzmatthew:好看吗？[得意]', 1328315853, 'share', 46, 'fzmatthew', 1, 0, 147, 147, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 0, 'ux102ux122ux109ux97ux116ux116ux104ux101ux119', 'fzmatthew', 'ux32463ux20856ux22238ux39038,ux21382ux38505ux35760,ux102ux122ux109ux97ux116ux116ux104ux101ux119,ux22855ux24187,ux24471ux24847,ux22909ux30475,ux31934ux28789', '经典回顾,历险记,fzmatthew,奇幻,得意,好看,精灵', '', '', '', 0, 0, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(156, '', '', '', 1328315865, 'share', 46, 'fzmatthew', 1, 0, 0, 152, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 152, 0, '', '', '', '', '', '', '', 0, 0, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(157, '', '', '', 1328315898, 'share', 44, 'fanwe', 1, 0, 0, 144, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 144, 0, '', '', '', '', '', '', '', 0, 0, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(158, '免费试吃', '', '巧克力[得意][得意]', 1328316502, 'share', 44, 'fanwe', 1, 0, 0, 158, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 0, '', '', 'ux35797ux21507,ux24039ux20811ux21147,ux24471ux24847,ux20813ux36153,ux20813ux36153ux35797ux21507', '试吃,巧克力,得意,免费,免费试吃', '', '', ' 试吃 巧克力', 0, 1, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(159, '对免费品偿巧克力发表了点评', '', '看起来很不错。 我报名了[呲牙][呲牙]', 1329336228, 'eventcomment', 44, 'fanwe', 1, 0, 0, 159, 0, 0, 0, 0, 0, 'youhui', 'edetail', 'id=1', 0, 'share', 0, 0, '', '', 'ux21618ux29273,ux30475ux36215ux26469,ux19981ux38169,ux25253ux21517,ux24039ux20811ux21147,ux28857ux35780,ux21457ux34920,ux20813ux36153,ux23545ux20813ux36153ux21697ux20607ux24039ux20811ux21147ux21457ux34920ux20102ux28857ux35780', '呲牙,看起来,不错,报名,巧克力,点评,发表,免费,对免费品偿巧克力发表了点评', '', '', '', 0, 0, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(160, '报名参加了免费品偿巧克力', '', '报名参加了免费品偿巧克力 - 甜蜜情人节，DIY巧克力表爱意！仅39元，即享原价106元【小丫烘焙坊】DIY巧克力18粒礼盒装。爱有时候可以不用说出来，但可以写出来，要表达什么就看你的手艺咯！', 1329336241, 'eventsubmit', 44, 'fanwe', 1, 0, 0, 160, 0, 0, 0, 0, 0, 'youhui', 'edetail', 'id=1', 0, 'share', 0, 0, '', '', 'ux24039ux20811ux21147,ux21487ux20197,ux28888ux28953,ux31036ux30418,ux25163ux33402,ux23567ux20011,ux29233ux24847,ux19981ux29992ux35828,ux20889ux20986,ux21407ux20215,ux21442ux21152,ux25253ux21517,ux20813ux36153,ux25253ux21517ux21442ux21152ux20102ux20813ux36153ux21697ux20607ux24039ux20811ux21147', '巧克力,可以,烘焙,礼盒,手艺,小丫,爱意,不用说,写出,原价,参加,报名,免费,报名参加了免费品偿巧克力', '', '', '', 0, 0, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(161, '', '', '活动推荐:免费品偿巧克力', 1329336269, 'shareevent', 44, 'fanwe', 1, 0, 0, 161, 0, 0, 0, 0, 0, '', '', '', 0, 'Fanwe', 0, 0, '', '', 'ux24039ux20811ux21147,ux20813ux36153,ux27963ux21160,ux25512ux33616', '巧克力,免费,活动,推荐', '', '', ' 巧克力 免费', 0, 1, 0, '网站', '', 'YToyOntzOjM6InVybCI7YTozOntzOjk6ImFwcF9pbmRleCI7czo2OiJ5b3VodWkiO3M6NToicm91dGUiO3M6NzoiZWRldGFpbCI7czo1OiJwYXJhbSI7czo0OiJpZD0xIjt9czo0OiJkYXRhIjthOjI4OntzOjI6ImlkIjtzOjE6IjEiO3M6NDoibmFtZSI7czoyMToi5YWN6LS55ZOB5YG/5ben5YWL5YqbIjtzOjQ6Imljb24iO3M6NTA6Ii4vcHVibGljL2F0dGFjaG1lbnQvMjAxMjAyLzE2LzExLzRmM2M3ZWEzOTRhOTAuanBnIjtzOjE2OiJldmVudF9iZWdpbl90aW1lIjtzOjEwOiIxMzI4MDQwMDgwIjtzOjE0OiJldmVudF9lbmRfdGltZSI7czoxMDoiMTM2MDk1ODQ4MyI7czoxNzoic3VibWl0X2JlZ2luX3RpbWUiO3M6MTA6IjEzMjgxMjY0ODUiO3M6MTU6InN1Ym1pdF9lbmRfdGltZSI7czoxMDoiMTM2MzM3NzY4NyI7czo3OiJ1c2VyX2lkIjtzOjE6IjAiO3M6NzoiY29udGVudCI7czoxODYzOiI8cD48c3Ryb25nPuOAkOeJueWIq+aPkOekuuOAkTwvc3Ryb25nPjwvcD4NCjxwPjxzcGFuIHN0eWxlPSJjb2xvcjojZmYwMDAwOyI+PHN0cm9uZz7mnIkg5pWIIOacn++8muaIquatouiHszIwMTLlubQz5pyIMTjml6XvvIjov4fmnJ/ml6DmlYjvvIk8L3N0cm9uZz48L3NwYW4+PC9wPg0KPHA+PHN0cm9uZz7kvb/nlKjpmZDliLY8L3N0cm9uZz7vvJrmr4/kuKpJROmZkOi0rTEw5Lu977ybPC9wPg0KPHA+PHN0cm9uZz7okKXkuJrml7bpl7Q8L3N0cm9uZz7vvJoxMO+8mjAw4oCUMTk6MDDvvJs8L3A+DQo8cD48c3Ryb25nPuWVhuWutuWcsOWdgDwvc3Ryb25nPu+8muemj+W3nuW4guWPsOaxn+WMuuS6lOS4gOS4rei3r+S4h+mDvemYv+azoue9lzEw5bGCMTAwN++8iOmYv+azoue9l+Wkp+mFkuW6l+WQjuS+p++8ie+8mzwvcD4NCjxwPjxzdHJvbmc+6aKE57qm55S16K+dPC9zdHJvbmc+77yaMDU5MS0yODMxMTE4M++8m++8iOS4uuS/neacjeWKoei0qOmHj++8jOivt+aPkOWJjTHlpKnpooTnuqbvvIk8L3A+DQo8cD48c3Ryb25nPuS9v+eUqOaPkOekuu+8mjwvc3Ryb25nPjwvcD4NCjxwPjEu5Yet5omL5py65LqM57u056CB6Iez5ZWG5a625bqX5YaF6aqM6K+B5raI6LS577yM6IqC5YGH5pel6YCa55So77yM5LiA57uP6aqM6K+B77yM5LiN5LqI6YCA5qy+77yM6K+36KeB6LCF77ybPC9wPg0KPHAgYWxpZ249ImxlZnQiPjIu6K+35Zyo5pyJ5pWI5pyf5YaF6aqM6K+B77yM6YC+5pyf5peg5pWI77ybPC9wPg0KPHAgYWxpZ249ImxlZnQiPjMu5Zui6LSt5LiN5om+6Zu277yM5LiN5LqI5bqX5YaF5YW25LuW5LyY5oOg5ZCM5Lqr77yM5ZWG5a625om/6K+65peg6ZqQ5oCn5raI6LS577ybPC9wPg0KPHAgYWxpZ249ImxlZnQiPjQu6YCA5qy+6K+05piO77ya5pyJ5pWI5pyf5YaF6YCA5qy+6aKdPe+8iOWboui0reS7ty3mr4/ku70y5YWD5LqM57u056CB5L+h5oGv6LS577yJ77yM5pyJ5pWI5pyf5aSW6YCA5qy+6aKdPe+8iOWboui0reS7ty3mr4/ku70y5YWD5LqM57u056CB5L+h5oGv6LS577yJKjk1Je+8jOivt+WcqOaPkOS6pOmAgOasvueUs+ivt+aXtuiHquWKqOaJo+mZpO+8jOS7peS+v+aIkeS7rOWwveW/q+eahOS4uuaCqOWKnueQhumAgOasvuOAgjwvcD4NCjxwPjxzdHJvbmc+6LSt5Lmw5rWB56iL77yaPC9zdHJvbmc+PC9wPg0KPHA+PHNwYW4gc3R5bGU9ImNvbG9yOiNmZjAwMDA7Ij7otK3kubDlm6LotK3liLgmbmJzcDsmZ3Q7Jm5ic3A75o+Q5YmNMeWkqeiHtOeUtemihOe6pu+8jOWIsOW6l+mqjOivgea2iOi0uSAmZ3Q7Jm5ic3A75byA5b+D5Lqr5Y+X5pyN5YqhPC9zcGFuPjwvcD4NCjxwPuWuouacjeeUteivne+8mjQwMC02MDAtNTUxNSA8L3A+DQo8cD48c3Ryb25nPuOAkOa0u+WKqOivpuaDheOAkTwvc3Ryb25nPjwvcD4NCjxwPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwO+OAkOaDheS6uuiKgueJueS+m+OAkeeUnOicnOaDheS6uuiKgu+8jERJWeW3p+WFi+WKm+ihqOeIseaEj++8geS7hTM55YWD77yM5Y2z5Lqr5Y6f5Lu3MTA25YWD44CQ5bCP5Lir54OY54SZ5Z2K44CRRElZ5ben5YWL5YqbMTjnspLnpLznm5Loo4XjgILniLHmnInml7blgJnlj6/ku6XkuI3nlKjor7Tlh7rmnaXvvIzkvYblj6/ku6Xlhpnlh7rmnaXvvIzopoHooajovr7ku4DkuYjlsLHnnIvkvaDnmoTmiYvoibrlkq/vvIE8L3A+DQo8cD4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDvpu5Hnmb3lt6flhYvlipvnmoTnu4/lhbjono3lkIjvvIznlJzonJzniLHmg4XnmoTnvo7kuL3ku6PooajjgII8L3A+DQo8cD48YnIgLz4NCjwvcD4NCjxwPjxpbWcgc3JjPSIuL3B1YmxpYy9hdHRhY2htZW50LzIwMTIwMi8xNi8xMi80ZjNjN2ZkODk2ODIyLmpwZyIgYWx0PSIiIGJvcmRlcj0iMCIgLz48YnIgLz4NCjwvcD4iO3M6NzoiY2F0ZV9pZCI7czoxOiIzIjtzOjc6ImNpdHlfaWQiO3M6MjoiMTUiO3M6NzoiYWRkcmVzcyI7czoyNDoi56aP5bee5a6d6b6Z5Z+O5biC5bm/5Zy6IjtzOjY6Inhwb2ludCI7czoxMDoiMTE5LjI5ODEyOSI7czo2OiJ5cG9pbnQiO3M6OToiMjYuMDY4NzY5IjtzOjEyOiJsb2NhdGVfbWF0Y2giO3M6NDI0OiJ1eDIwODQwdXgyMjI2OSx1eDMxMTE5dXgyNDAzMCx1eDIzNDUzdXg0MDg1Nyx1eDI0MTkxdXgyMjMzMCx1eDIyNDc4dXgyNDA2Nix1eDMxMTE5dXgyNDAzMHV4MjM0NTN1eDQwODU3dXgyMjQ3OHV4MjQwNjZ1eDI0MTkxdXgyMjMzMCx1eDQwNzIzdXgyNzAwNHV4MjEzMDYsdXgzOTUzMnV4MjM2MTR1eDIxMzA2LHV4MjE0ODh1eDI3NzQzdXgyMTMwNix1eDIwODQ1dXgxOTk2OHV4MjAwMTN1eDM2MzM1LHV4MTk5NzV1eDM1OTM3dXgyMjQ3OCx1eDIzNTY3dXgyNjcyNXV4MjI4MzYsdXgyMDE3OXV4MjM2NjV1eDIxMzA2LHV4MjAxNzl1eDIzNjY1dXgzODIxNSx1eDM0NzQ2dXgyNzk1NCx1eDE5OTc3dXgzOTY0MHV4MzYzMzUsdXgzOTMxOHV4MjM2NjV1eDM2MzM1LHV4MjYxODd1eDIzNDMzdXgyMTMwNix1eDI5NTc5dXgyNDE5NnV4MjYwMzJ1eDI2NDQ5IjtzOjE2OiJsb2NhdGVfbWF0Y2hfcm93IjtzOjE5Mjoi5YWo5Zu9LOemj+W3nizlrp3pvpks5bm/5Zy6LOWfjuW4giznpo/lt57lrp3pvpnln47luILlub/lnLos6byT5qW85Yy6LOmprOWwvuWMuizlj7DmsZ/ljLos5YWt5LiA5Lit6LevLOS4h+ixoeWfjizlsI/moaXlpLQs5LuT5bGx5Yy6LOS7k+WxsemVhyzonrrmtLIs5LiJ6auY6LevLOmmluWxsei3ryzmmYvlronljLos546L5bqE5paw5p2RIjtzOjEwOiJjYXRlX21hdGNoIjtzOjE0OiJ1eDMwMDA1dXgyNDQzMyI7czoxNDoiY2F0ZV9tYXRjaF9yb3ciO3M6Njoi55S15b2xIjtzOjEwOiJuYW1lX21hdGNoIjtzOjc1NzoidXgyNDAzOXV4MjA4MTF1eDIxMTQ3LHV4MjA4MTN1eDM2MTUzLHV4MjA4MTN1eDM2MTUzdXgyMTY5N3V4MjA2MDd1eDI0MDM5dXgyMDgxMXV4MjExNDcsdXgyMTQ4N3V4MjAxOTcsdXgyODg4OHV4Mjg5NTMsdXgzMTAzNnV4MzA0MTgsdXgyNTE2M3V4MzM0MDIsdXgyMzU2N3V4MjAwMTEsdXgyOTIzM3V4MjQ4NDcsdXgxOTk4MXV4Mjk5OTJ1eDM1ODI4LHV4MjA4ODl1eDIwOTg2LHV4MjE0MDd1eDIwMjE1LHV4Mjk5ODB1eDM0NTg4dXgyNDc3M3V4MjAxNTR1eDMzNDEwdXg2NTI5MnV4Njh1eDczdXg4OXV4MjQwMzl1eDIwODExdXgyMTE0N3V4MzQ5MjB1eDI5MjMzdXgyNDg0N3V4NjUyODF1eDIwMTY1dXg1MXV4NTd1eDIwODAzdXg2NTI5MnV4MjEzNjN1eDIwMTM5dXgyMTQwN3V4MjAyMTV1eDQ5dXg0OHV4NTR1eDIwODAzdXgxMjMwNHV4MjM1Njd1eDIwMDExdXgyODg4OHV4Mjg5NTN1eDIyMzQ2dXgxMjMwNXV4Njh1eDczdXg4OXV4MjQwMzl1eDIwODExdXgyMTE0N3V4NDl1eDU2dXgzMTg5MHV4MzEwMzZ1eDMwNDE4dXgzNTAxM3V4MTIyOTB1eDI5MjMzdXgyNjM3N3V4MjYxMDJ1eDIwNTA1dXgyMTQ4N3V4MjAxOTd1eDE5OTgxdXgyOTk5MnV4MzU4Mjh1eDIwOTg2dXgyNjQ2OXV4NjUyOTJ1eDIwMjk0dXgyMTQ4N3V4MjAxOTd1eDIwODg5dXgyMDk4NnV4MjY0Njl1eDY1MjkydXgzNTIwMXV4MzQ5MjB1eDM2Nzk4dXgyMDE2MHV4MjAwNDB1eDIzNjAxdXgzMDQ3NXV4MjAzMjB1eDMwMzQwdXgyNTE2M3V4MzM0MDJ1eDIxNjc5dXg2NTI4MSI7czoxNDoibmFtZV9tYXRjaF9yb3ciO3M6MzIyOiLlt6flhYvlipss5YWN6LS5LOWFjei0ueWTgeWBv+W3p+WFi+WKmyzlj6/ku6Us54OY54SZLOekvOebkizmiYvoibos5bCP5LirLOeIseaEjyzkuI3nlKjor7Qs5YaZ5Ye6LOWOn+S7tyznlJzonJzmg4XkurroioLvvIxESVnlt6flhYvlipvooajniLHmhI/vvIHku4UzOeWFg++8jOWNs+S6q+WOn+S7tzEwNuWFg+OAkOWwj+S4q+eDmOeEmeWdiuOAkURJWeW3p+WFi+WKmzE457KS56S855uS6KOF44CC54ix5pyJ5pe25YCZ5Y+v5Lul5LiN55So6K+05Ye65p2l77yM5L2G5Y+v5Lul5YaZ5Ye65p2l77yM6KaB6KGo6L6+5LuA5LmI5bCx55yL5L2g55qE5omL6Im65ZKv77yBIjtzOjEyOiJzdWJtaXRfY291bnQiO3M6MToiMSI7czoxMToicmVwbHlfY291bnQiO3M6MToiMSI7czo1OiJicmllZiI7czoyMTc6IueUnOicnOaDheS6uuiKgu+8jERJWeW3p+WFi+WKm+ihqOeIseaEj++8geS7hTM55YWD77yM5Y2z5Lqr5Y6f5Lu3MTA25YWD44CQ5bCP5Lir54OY54SZ5Z2K44CRRElZ5ben5YWL5YqbMTjnspLnpLznm5Loo4XjgILniLHmnInml7blgJnlj6/ku6XkuI3nlKjor7Tlh7rmnaXvvIzkvYblj6/ku6Xlhpnlh7rmnaXvvIzopoHooajovr7ku4DkuYjlsLHnnIvkvaDnmoTmiYvoibrlkq/vvIEiO3M6NDoic29ydCI7czoxOiIxIjtzOjk6ImlzX2VmZmVjdCI7czoxOiIxIjtzOjExOiJjbGlja19jb3VudCI7czoxOiIwIjtzOjEyOiJpc19yZWNvbW1lbmQiO3M6MToiMCI7czoxMToic3VwcGxpZXJfaWQiO3M6MjoiMTUiO319', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(162, '', '', '团购推荐:创意茶杯', 1329336284, 'sharetuan', 44, 'fanwe', 1, 0, 0, 162, 0, 0, 0, 0, 0, '', '', '', 0, 'Fanwe', 0, 0, '', '', 'ux21319ux28201,ux24773ux20154ux33410,ux37027ux20040,ux32654ux20029,ux39532ux20811ux26479,ux31119ux24030,ux21019ux24847,ux21464ux33394,ux26174ux29616,ux24515ux24847,ux33590ux26479,ux22242ux36141,ux25512ux33616', '升温,情人节,那么,美丽,马克杯,福州,创意,变色,显现,心意,茶杯,团购,推荐', '', '', ' 升温 情人节 那么 美丽 马克杯 福州 创意 变色 显现 心意', 0, 1, 0, '网站', '', 'YToyOntzOjM6InVybCI7YTozOntzOjk6ImFwcF9pbmRleCI7czo0OiJ0dWFuIjtzOjU6InJvdXRlIjtzOjQ6ImRlYWwiO3M6NToicGFyYW0iO3M6NToiaWQ9NTYiO31zOjQ6ImRhdGEiO2E6NzU6e3M6MjoiaWQiO3M6MjoiNTYiO3M6NDoibmFtZSI7czoyNjY6IuacgOacieWIm+aEj++8jOacgOWvjOW/g+aEj+eahOaDheS6uuiKguekvOeJqe+8geS7hTIz5YWD77yM5Y2z5Lqr5Y6f5Lu3NTDlhYPmg4XkurroioJESVnlj5joibLmna8v6ams5YWL5p2v77yM5LqM6YCJ5LiA44CC576O5Li955qE5Zu+5qGI5Zyo5Y2H5rip5ZCO5oWi5oWi5pi+546w77yM6YKj5LmI56We5aWH77yM6YKj5LmI5rWq5ryr77yM5q2j5aaC5L2g5Lus5riQ5riQ5Y2H5rip55qE54ix5oOF77yM5rC46L+c576O5Li977yB56aP5bee5biC5Yy65YyF6YKu77yBIjtzOjg6InN1Yl9uYW1lIjtzOjEyOiLliJvmhI/ojLbmna8iO3M6NzoiY2F0ZV9pZCI7czoyOiIxMCI7czoxMToic3VwcGxpZXJfaWQiO3M6MjoiMTkiO3M6MzoiaW1nIjtzOjUwOiIuL3B1YmxpYy9hdHRhY2htZW50LzIwMTIwMi8xNi8xMS80ZjNjN2YxZDM3ZGVhLmpwZyI7czoxMToiZGVzY3JpcHRpb24iO3M6MjE4NToiPHAgYWxpZ249ImNlbnRlciI+PHN0cm9uZz7jgJDnpo/lt57jgJFESVnlj5joibLmna8vPC9zdHJvbmc+PHN0cm9uZz7pqazlhYvmna88L3N0cm9uZz48L3A+DQo8cD48c3Ryb25nPuOAkOeJueWIq+aPkOekuuOAkTwvc3Ryb25nPjwvcD4NCjxwPjxzcGFuIHN0eWxlPSJjb2xvcjojZmYwMDAwOyI+PHN0cm9uZz7mnIkg5pWIIOacn++8mjIwMTLlubQy5pyIN+aXpeiHszIwMTLlubQz5pyIN+aXpe+8iOS4i+WNleWQjjfkuKrlt6XkvZzml6XlhoXpgIHovr7vvIk8L3N0cm9uZz48L3NwYW4+PC9wPg0KPHA+PHN0cm9uZz7kvb/nlKjpmZDliLY8L3N0cm9uZz7vvJrlj6/otK3kubDlpJrlvKDkvJjmg6DliLjvvJs8L3A+DQo8cD48c3Ryb25nPuWSqOivoueUteivne+8mjwvc3Ryb25nPjEzNTk5Mzk3Nzk377ybPC9wPg0KPHA+PHN0cm9uZz7ms6jmhI/kuovpobnvvJo8L3N0cm9uZz48L3A+DQo8cD4xLuacrOWNleemj+W3nuW4guWMuuWGheWFjei0uemFjemAge+8jOS4i+WNleWQjjfkuKrlt6XkvZzml6XlhoXpgIHovr7vvJs8L3A+DQo8cCBhbGlnbj0ibGVmdCI+Mi7or7flnKjkuIvljZXml7bloavlhpnmuIXmpZrmlLbotKfkurrlp5PlkI3jgIHogZTns7vnlLXor53lj4rmnInmlYjlnLDlnYDvvIjor7fliqHlv4XloavlhpnvvIzku6XlhY3lu7bor6/mlLbotKfvvInvvJs8L3A+DQo8cCBhbGlnbj0ibGVmdCI+My7or7fmgqjmnKzkurrnrb7mlLbvvIzllYblk4HpgIHovr7or7flvZPlnLrku5Tnu4bmo4Dmn6XpqozmlLbvvIzlpoLllYblk4HphY3pgIHmnInor6/jgIHmlbDph4/nvLrlpLHjgIHkuqflk4HnoLTmjZ/nrYnpl67popjvvIzor7flvZPpnaLlj4rml7blkJHphY3pgIHkurrlkZjmj5Dlh7rlubbmi5LmlLbvvIzllYblrrbkvJrlsL3lv6vkuLrmgqjlronmjpLosIPmjaLvvIzoi6Xlt7Lnrb7mlLblj5HnjrDkuIrov7Dpl67popjvvIzmpoLkuI3mj5DkvpvpgIDmjaLvvJs8L3A+DQo8cCBhbGlnbj0ibGVmdCI+NC7lm6DlsZ7phY3pgIHnsbvllYblk4HvvIzkuIvljZXlkI7phY3pgIHlh7rljrvliJnmpoLkuI3pgIDmrL7jgII8L3A+DQo8cCBhbGlnbj0ibGVmdCI+NS7or7flnKjkuIvljZXlkI7ogZTns7vlrqLmnI3vvIzlsIbmgqjpnIDopoHljbDliLDmna/lrZDkuIrnmoTlm77moYjlj5Hoh7PlrqLmnI3vvIzmiJHku6zlsIblsL3lv6vogZTns7vllYblrrbkuLrmgqjlpITnkIbjgII8L3A+DQo8cD48c3Ryb25nPui0reS5sOa1geeoi++8mjwvc3Ryb25nPjwvcD4NCjxwPjxzcGFuIHN0eWxlPSJjb2xvcjojZmYwMDAwOyI+6LSt5Lmw5Zui6LSt5Yi4Jm5ic3A7Jmd0OyZuYnNwO+Whq+WGmeWnk+WQjeOAgeiBlOezu+eUteivneOAgeWcsOWdgOWPiuWVhuWTgeS/oeaBryAmZ3Q7IOWwhuWbvueJh+WPkeiHs+WuouacjSZuYnNwOyZndDsmbmJzcDvnrYnlvoXpgIHotKfkuIrpl6g8L3NwYW4+PC9wPg0KPHA+5a6i5pyN55S16K+d77yaNDAwLTYwMC01NTE1IDwvcD4NCjxwPjxzdHJvbmc+44CQ5rS75Yqo6K+m5oOF44CRPC9zdHJvbmc+PC9wPg0KPHA+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A744CQ5oOF5Lq66IqC54m55L6b44CR5pyA5pyJ5Yib5oSP77yM5pyA5a+M5b+D5oSP55qE5oOF5Lq66IqC56S854mp77yB5LuFMjPlhYPvvIzljbPkuqvljp/ku7c1MOWFg+aDheS6uuiKgkRJWeWPmOiJsuadry/pqazlhYvmna/vvIzkuozpgInkuIDjgILnvo7kuL3nmoTlm77moYjlnKjljYfmuKnlkI7mhaLmhaLmmL7njrDvvIzpgqPkuYjnpZ7lpYfvvIzpgqPkuYjmtarmvKvvvIzmraPlpoLkvaDku6zmuJDmuJDljYfmuKnnmoTniLHmg4XvvIzmsLjov5znvo7kuL3vvIHnpo/lt57luILljLrljIXpgq7vvIE8L3A+DQo8cD7jgJDlt6XoibrmnZDotKjjgJHlm73lrrbkuIDnuqfnmb3nk7cgPC9wPg0KPHA+44CQ5Yay5Y2w44CR5Zu95a625YWI6L+b54Ot6L2s5Y2w5oqA5pyvIDwvcD4NCjxwPuOAkOinhOagvOOAkemrmDkuNWNtO+ebtOW+hDguMmNtO+WuuemHjzMyNW1sIDwvcD4NCjxwPuOAkOWPr+WNsOWMuuWfn+OAkThjbSoxOWNtIDwvcD4NCjxwPuOAkOWItuS9nOWRqOacn+OAke+8iOS4jeWQq+mFjemAgeaXtumXtO+8iTUtN+WkqSA8YnIgLz4NCjwvcD4NCjxwPjxiciAvPg0KPC9wPg0KPHA+PGltZyBzcmM9Ii4vcHVibGljL2F0dGFjaG1lbnQvMjAxMjAyLzE2LzExLzRmM2M3ZjM3NGIxMmQuanBnIiBhbHQ9IiIgYm9yZGVyPSIwIiAvPjxiciAvPg0KPC9wPiI7czoxMDoiYmVnaW5fdGltZSI7czoxMDoiMTMyODAzOTk5NCI7czo4OiJlbmRfdGltZSI7czoxMDoiMTM2MDk1ODM5NiI7czoxMDoibWluX2JvdWdodCI7czoxOiIwIjtzOjEwOiJtYXhfYm91Z2h0IjtzOjE6IjAiO3M6MTU6InVzZXJfbWluX2JvdWdodCI7czoxOiIwIjtzOjE1OiJ1c2VyX21heF9ib3VnaHQiO3M6MToiMCI7czoxMjoib3JpZ2luX3ByaWNlIjtzOjg6IjEyMC4wMDAwIjtzOjEzOiJjdXJyZW50X3ByaWNlIjtzOjc6IjIwLjAwMDAiO3M6NzoiY2l0eV9pZCI7czoyOiIxNSI7czo5OiJpc19jb3Vwb24iO3M6MToiMSI7czoxMToiaXNfZGVsaXZlcnkiO3M6MToiMCI7czo5OiJpc19lZmZlY3QiO3M6MToiMSI7czo5OiJpc19kZWxldGUiO3M6MToiMCI7czoxMDoidXNlcl9jb3VudCI7czoxOiIwIjtzOjk6ImJ1eV9jb3VudCI7czoxOiIwIjtzOjExOiJ0aW1lX3N0YXR1cyI7czoxOiIxIjtzOjEwOiJidXlfc3RhdHVzIjtzOjE6IjEiO3M6OToiZGVhbF90eXBlIjtzOjE6IjAiO3M6MTM6ImFsbG93X3Byb21vdGUiO3M6MToiMCI7czoxMjoicmV0dXJuX21vbmV5IjtzOjY6IjAuMDAwMCI7czoxMjoicmV0dXJuX3Njb3JlIjtzOjE6IjAiO3M6NToiYnJpZWYiO3M6MDoiIjtzOjQ6InNvcnQiO3M6MjoiMjAiO3M6MTU6ImRlYWxfZ29vZHNfdHlwZSI7czoxOiIwIjtzOjEyOiJzdWNjZXNzX3RpbWUiO3M6MTA6IjEzMjkzMzYwMDgiO3M6MTc6ImNvdXBvbl9iZWdpbl90aW1lIjtzOjE6IjAiO3M6MTU6ImNvdXBvbl9lbmRfdGltZSI7czoxOiIwIjtzOjQ6ImNvZGUiO3M6MDoiIjtzOjY6IndlaWdodCI7czo2OiIwLjAwMDAiO3M6OToid2VpZ2h0X2lkIjtzOjE6IjEiO3M6MTE6ImlzX3JlZmVycmFsIjtzOjE6IjAiO3M6ODoiYnV5X3R5cGUiO3M6MToiMCI7czo4OiJkaXNjb3VudCI7czo2OiIwLjAwMDAiO3M6NDoiaWNvbiI7czo1MDoiLi9wdWJsaWMvYXR0YWNobWVudC8yMDEyMDIvMTYvMTEvNGYzYzdmMWQzN2RlYS5qcGciO3M6Njoibm90aWNlIjtzOjE6IjAiO3M6MTM6ImZyZWVfZGVsaXZlcnkiO3M6MToiMCI7czoxNDoiZGVmaW5lX3BheW1lbnQiO3M6MToiMCI7czo5OiJzZW9fdGl0bGUiO3M6MDoiIjtzOjExOiJzZW9fa2V5d29yZCI7czowOiIiO3M6MTU6InNlb19kZXNjcmlwdGlvbiI7czowOiIiO3M6NjoiaXNfaG90IjtzOjE6IjAiO3M6NjoiaXNfbmV3IjtzOjE6IjAiO3M6NzoiaXNfYmVzdCI7czoxOiIwIjtzOjEwOiJpc19sb3R0ZXJ5IjtzOjE6IjAiO3M6NjoicmVvcGVuIjtzOjE6IjAiO3M6NToidW5hbWUiO3M6MDoiIjtzOjEwOiJmb3JiaWRfc21zIjtzOjE6IjAiO3M6OToiY2FydF90eXBlIjtzOjE6IjAiO3M6MTI6InNob3BfY2F0ZV9pZCI7czoxOiIwIjtzOjc6ImlzX3Nob3AiO3M6MToiMCI7czoxMToidG90YWxfcG9pbnQiO3M6MToiMCI7czo5OiJhdmdfcG9pbnQiO3M6MToiMCI7czoxMToiY3JlYXRlX3RpbWUiO3M6MTA6IjEzMjkzMzYwMDgiO3M6MTE6InVwZGF0ZV90aW1lIjtzOjEwOiIxMzI5MzM2MDA4IjtzOjEwOiJuYW1lX21hdGNoIjtzOjc5ODoidXgyMTMxOXV4MjgyMDEsdXgyNDc3M3V4MjAxNTR1eDMzNDEwLHV4MzcwMjd1eDIwMDQwLHV4MzI2NTR1eDIwMDI5LHV4Mzk1MzJ1eDIwODExdXgyNjQ3OSx1eDMxMTE5dXgyNDAzMCx1eDIxMDE5dXgyNDg0Nyx1eDIxNDY0dXgzMzM5NCx1eDI2MTc0dXgyOTYxNix1eDI0NTE1dXgyNDg0Nyx1eDI2MzY4dXgyNjM3N3V4MjEwMTl1eDI0ODQ3dXg2NTI5MnV4MjYzNjh1eDIzNTAwdXgyNDUxNXV4MjQ4NDd1eDMwMzQwdXgyNDc3M3V4MjAxNTR1eDMzNDEwdXgzMTAzNnV4MjkyODl1eDY1MjgxdXgyMDE2NXV4NTB1eDUxdXgyMDgwM3V4NjUyOTJ1eDIxMzYzdXgyMDEzOXV4MjE0MDd1eDIwMjE1dXg1M3V4NDh1eDIwODAzdXgyNDc3M3V4MjAxNTR1eDMzNDEwdXg2OHV4NzN1eDg5dXgyMTQ2NHV4MzMzOTR1eDI2NDc5dXg0N3V4Mzk1MzJ1eDIwODExdXgyNjQ3OXV4NjUyOTJ1eDIwMTA4dXgzNjg3M3V4MTk5Njh1eDEyMjkwdXgzMjY1NHV4MjAwMjl1eDMwMzQwdXgyMjI3MHV4MjY2OTZ1eDIyMzEydXgyMTMxOXV4MjgyMDF1eDIxNTE4dXgyNDkzMHV4MjQ5MzB1eDI2MTc0dXgyOTYxNnV4NjUyOTJ1eDM3MDI3dXgyMDA0MHV4MzEwNzB1eDIyODU1dXg2NTI5MnV4MzcwMjd1eDIwMDQwdXgyODAxMHV4Mjg0NTl1eDY1MjkydXgyNzQ5MXV4MjI5MTR1eDIwMzIwdXgyMDIwNHV4MjgxNzZ1eDI4MTc2dXgyMTMxOXV4MjgyMDF1eDMwMzQwdXgyOTIzM3V4MjQ3NzN1eDY1MjkydXgyNzcwNHV4MzY4Mjh1eDMyNjU0dXgyMDAyOXV4NjUyODF1eDMxMTE5dXgyNDAzMHV4MjQwNjZ1eDIxMzA2dXgyMTI1M3V4MzcwMzh1eDY1MjgxIjtzOjE0OiJuYW1lX21hdGNoX3JvdyI7czozNDI6IuWNh+a4qSzmg4XkurroioIs6YKj5LmILOe+juS4vSzpqazlhYvmna8s56aP5beeLOWIm+aEjyzlj5joibIs5pi+546wLOW/g+aEjyzmnIDmnInliJvmhI/vvIzmnIDlr4zlv4PmhI/nmoTmg4XkurroioLnpLznianvvIHku4UyM+WFg++8jOWNs+S6q+WOn+S7tzUw5YWD5oOF5Lq66IqCRElZ5Y+Y6Imy5p2vL+mprOWFi+adr++8jOS6jOmAieS4gOOAgue+juS4veeahOWbvuahiOWcqOWNh+a4qeWQjuaFouaFouaYvueOsO+8jOmCo+S5iOelnuWlh++8jOmCo+S5iOa1qua8q++8jOato+WmguS9oOS7rOa4kOa4kOWNh+a4qeeahOeIseaDhe+8jOawuOi/nOe+juS4ve+8geemj+W3nuW4guWMuuWMhemCru+8gSI7czoxNToiZGVhbF9jYXRlX21hdGNoIjtzOjI4OiJ1eDI5OTgzdXgyNzk2M3V4MjYzODF1eDIxMTUzIjtzOjE5OiJkZWFsX2NhdGVfbWF0Y2hfcm93IjtzOjEyOiLnlJ/mtLvmnI3liqEiO3M6MTU6InNob3BfY2F0ZV9tYXRjaCI7czowOiIiO3M6MTk6InNob3BfY2F0ZV9tYXRjaF9yb3ciO3M6MDoiIjtzOjEyOiJsb2NhdGVfbWF0Y2giO3M6Mzc3OiJ1eDIwODQwdXgyMjI2OSx1eDMxMTE5dXgyNDAzMCx1eDMzOTQ1dXgyMTQ3NnV4MzM4MjksdXgzMTExOXV4MjQwMzB1eDI0MDY2LHV4MjEyNzF1eDM2MzM1LHV4MzE0NDl1eDI5MjYwLHV4MjE1MTh1eDM4NDk4LHV4MjM0ODZ1eDM5MzAyLHV4MjQzMTB1eDMxMTE5LHV4MjAxMTZ1eDE5OTY4LHV4MzExMTl1eDI0MDMwdXgyNDA2NnV4MjAxMTZ1eDE5OTY4dXgyMTI3MXV4MzYzMzV1eDU0dXg1NXV4MjE0OTV1eDY1Mjg4dXgzMzk0NXV4MjE0NzZ1eDMzODI5dXgzMTQ0OXV4MjkyNjB1eDIxNTE4dXg2NTI4OXV4MjQzMTB1eDMxMTE5dXgyMzQ4NnV4MzkzMDJ1eDIxNTE4dXgzODQ5OCx1eDQwNzIzdXgyNzAwNHV4MjEzMDYsdXgyMDExNnV4MTk5Njh1eDI0MTkxdXgyMjMzMCI7czoxNjoibG9jYXRlX21hdGNoX3JvdyI7czoxNjc6IuWFqOWbvSznpo/lt54s6JKZ5Y+k6JClLOemj+W3nuW4gizljJfot68s56uZ54mMLOWQjumZoizlrr7ppoYs5bu256aPLOS6lOS4gCznpo/lt57luILkupTkuIDljJfot682N+WPt++8iOiSmeWPpOiQpeermeeJjOWQju+8ieW7tuemj+WuvummhuWQjumZoizpvJPmpbzljLos5LqU5LiA5bm/5Zy6IjtzOjk6InRhZ19tYXRjaCI7czowOiIiO3M6MTM6InRhZ19tYXRjaF9yb3ciO3M6MDoiIjtzOjY6Inhwb2ludCI7czo5OiIxMTkuMzE1ODUiO3M6NjoieXBvaW50IjtzOjk6IjI2LjA4OTY0MSI7czo4OiJicmFuZF9pZCI7czoxOiIwIjtzOjEzOiJicmFuZF9wcm9tb3RlIjtzOjE6IjAiO319', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(163, '', '', '商品推荐:七匹狼男装', 1329337052, 'sharegoods', 44, 'fanwe', 1, 0, 0, 163, 0, 0, 0, 0, 1, '', '', '', 0, 'Fanwe', 0, 0, '', '', 'ux19971ux21305ux29436,ux32701ux32466ux26381,ux21452ux38754,ux27491ux21697,ux30007ux35013,ux21407ux20215,ux22806ux22871,ux55ux48ux49ux48ux56ux54,ux49ux49ux57ux57,ux52ux46ux51,ux21830ux21697,ux25512ux33616', '七匹狼,羽绒服,双面,正品,男装,原价,外套,701086,1199,4.3,商品,推荐', '', '', ' 七匹狼 羽绒服 双面 正品 男装 原价 外套 701086 1199 4.3', 0, 1, 0, '网站', '', 'YToyOntzOjM6InVybCI7YTozOntzOjk6ImFwcF9pbmRleCI7czo0OiJzaG9wIjtzOjU6InJvdXRlIjtzOjU6Imdvb2RzIjtzOjU6InBhcmFtIjtzOjU6ImlkPTQ3Ijt9czo0OiJkYXRhIjthOjc1OntzOjI6ImlkIjtzOjI6IjQ3IjtzOjQ6Im5hbWUiO3M6NzQ6IjQuM+aKmOWOn+S7tzExOTnmraPlk4HkuIPljLnni7znlLfoo4Ug5Yas5qy+5aSW5aWX5Y+M6Z2i5Yas576957uS5pyNNzAxMDg2IjtzOjg6InN1Yl9uYW1lIjtzOjE1OiLkuIPljLnni7znlLfoo4UiO3M6NzoiY2F0ZV9pZCI7czoxOiIwIjtzOjExOiJzdXBwbGllcl9pZCI7czoxOiIwIjtzOjM6ImltZyI7czo0NDoiLi9wdWJsaWMvYXR0YWNobWVudC8yMDEyMDEvNGYwMTMyOWQ2MGZhMi5qcGciO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjc2OiI8aW1nIHNyYz0iLi9wdWJsaWMvYXR0YWNobWVudC8yMDEyMDEvNGYwMTMyYjg1ZmJiNC5qcGciIGFsdD0iIiBib3JkZXI9IjAiIC8+IjtzOjEwOiJiZWdpbl90aW1lIjtzOjE6IjAiO3M6ODoiZW5kX3RpbWUiO3M6MToiMCI7czoxMDoibWluX2JvdWdodCI7czoxOiIwIjtzOjEwOiJtYXhfYm91Z2h0IjtzOjE6IjAiO3M6MTU6InVzZXJfbWluX2JvdWdodCI7czoxOiIwIjtzOjE1OiJ1c2VyX21heF9ib3VnaHQiO3M6MToiMCI7czoxMjoib3JpZ2luX3ByaWNlIjtzOjk6IjExOTkuMDAwMCI7czoxMzoiY3VycmVudF9wcmljZSI7czo4OiI1MjUuMDAwMCI7czo3OiJjaXR5X2lkIjtzOjE6IjEiO3M6OToiaXNfY291cG9uIjtzOjE6IjAiO3M6MTE6ImlzX2RlbGl2ZXJ5IjtzOjE6IjEiO3M6OToiaXNfZWZmZWN0IjtzOjE6IjEiO3M6OToiaXNfZGVsZXRlIjtzOjE6IjAiO3M6MTA6InVzZXJfY291bnQiO3M6MToiMSI7czo5OiJidXlfY291bnQiO3M6MToiMSI7czoxMToidGltZV9zdGF0dXMiO3M6MToiMSI7czoxMDoiYnV5X3N0YXR1cyI7czoxOiIxIjtzOjk6ImRlYWxfdHlwZSI7czoxOiIwIjtzOjEzOiJhbGxvd19wcm9tb3RlIjtzOjE6IjAiO3M6MTI6InJldHVybl9tb25leSI7czo2OiIwLjAwMDAiO3M6MTI6InJldHVybl9zY29yZSI7czozOiIzMDAiO3M6NToiYnJpZWYiO3M6MDoiIjtzOjQ6InNvcnQiO3M6MjoiMTEiO3M6MTU6ImRlYWxfZ29vZHNfdHlwZSI7czoxOiI4IjtzOjEyOiJzdWNjZXNzX3RpbWUiO3M6MTA6IjEzMjU0NDk4NTkiO3M6MTc6ImNvdXBvbl9iZWdpbl90aW1lIjtzOjE6IjAiO3M6MTU6ImNvdXBvbl9lbmRfdGltZSI7czoxOiIwIjtzOjQ6ImNvZGUiO3M6MDoiIjtzOjY6IndlaWdodCI7czo2OiIwLjAwMDAiO3M6OToid2VpZ2h0X2lkIjtzOjE6IjEiO3M6MTE6ImlzX3JlZmVycmFsIjtzOjE6IjAiO3M6ODoiYnV5X3R5cGUiO3M6MToiMCI7czo4OiJkaXNjb3VudCI7czo2OiIwLjAwMDAiO3M6NDoiaWNvbiI7czo0NDoiLi9wdWJsaWMvYXR0YWNobWVudC8yMDEyMDEvNGYwMTMyOTgyMjdlYy5qcGciO3M6Njoibm90aWNlIjtzOjE6IjAiO3M6MTM6ImZyZWVfZGVsaXZlcnkiO3M6MToiMCI7czoxNDoiZGVmaW5lX3BheW1lbnQiO3M6MToiMCI7czo5OiJzZW9fdGl0bGUiO3M6MDoiIjtzOjExOiJzZW9fa2V5d29yZCI7czowOiIiO3M6MTU6InNlb19kZXNjcmlwdGlvbiI7czowOiIiO3M6NjoiaXNfaG90IjtzOjE6IjEiO3M6NjoiaXNfbmV3IjtzOjE6IjEiO3M6NzoiaXNfYmVzdCI7czoxOiIxIjtzOjEwOiJpc19sb3R0ZXJ5IjtzOjE6IjAiO3M6NjoicmVvcGVuIjtzOjE6IjAiO3M6NToidW5hbWUiO3M6MDoiIjtzOjEwOiJmb3JiaWRfc21zIjtzOjE6IjAiO3M6OToiY2FydF90eXBlIjtzOjE6IjAiO3M6MTI6InNob3BfY2F0ZV9pZCI7czoyOiIzMSI7czo3OiJpc19zaG9wIjtzOjE6IjEiO3M6MTE6InRvdGFsX3BvaW50IjtzOjE6IjUiO3M6OToiYXZnX3BvaW50IjtzOjE6IjUiO3M6MTE6ImNyZWF0ZV90aW1lIjtzOjEwOiIxMzI1NDQ5ODU4IjtzOjExOiJ1cGRhdGVfdGltZSI7czoxMDoiMTMyNTQ1NjQzMiI7czoxMDoibmFtZV9tYXRjaCI7czozNjY6InV4MTk5NzF1eDIxMzA1dXgyOTQzNix1eDMyNzAxdXgzMjQ2NnV4MjYzODEsdXgyMTQ1MnV4Mzg3NTQsdXgyNzQ5MXV4MjE2OTcsdXgzMDAwN3V4MzUwMTMsdXgyMTQwN3V4MjAyMTUsdXgyMjgwNnV4MjI4NzEsdXg1NXV4NDh1eDQ5dXg0OHV4NTZ1eDU0LHV4NDl1eDQ5dXg1N3V4NTcsdXg1MnV4NDZ1eDUxLHV4NTJ1eDQ2dXg1MXV4MjUyNDB1eDIxNDA3dXgyMDIxNXV4NDl1eDQ5dXg1N3V4NTd1eDI3NDkxdXgyMTY5N3V4MTk5NzF1eDIxMzA1dXgyOTQzNnV4MzAwMDd1eDM1MDEzdXgyMDkwOHV4Mjc0NTR1eDIyODA2dXgyMjg3MXV4MjE0NTJ1eDM4NzU0dXgyMDkwOHV4MzI3MDF1eDMyNDY2dXgyNjM4MXV4NTV1eDQ4dXg0OXV4NDh1eDU2dXg1NCI7czoxNDoibmFtZV9tYXRjaF9yb3ciO3M6MTQ1OiLkuIPljLnni7ws576957uS5pyNLOWPjOmdoizmraPlk4Es55S36KOFLOWOn+S7tyzlpJblpZcsNzAxMDg2LDExOTksNC4zLDQuM+aKmOWOn+S7tzExOTnmraPlk4HkuIPljLnni7znlLfoo4Ug5Yas5qy+5aSW5aWX5Y+M6Z2i5Yas576957uS5pyNNzAxMDg2IjtzOjE1OiJkZWFsX2NhdGVfbWF0Y2giO3M6MDoiIjtzOjE5OiJkZWFsX2NhdGVfbWF0Y2hfcm93IjtzOjA6IiI7czoxNToic2hvcF9jYXRlX21hdGNoIjtzOjY1OiJ1eDI2MzgxdXgzNTAxM3V4NDR1eDIwODY5dXgzNDkxNXV4NDR1eDM3MTk3dXgyMDIxNCx1eDMwMDA3dXgzNTAxMyI7czoxOToic2hvcF9jYXRlX21hdGNoX3JvdyI7czoyNzoi5pyN6KOFLOWGheihoyzphY3ku7Ys55S36KOFIjtzOjEyOiJsb2NhdGVfbWF0Y2giO3M6MTQ6InV4MjA4NDB1eDIyMjY5IjtzOjE2OiJsb2NhdGVfbWF0Y2hfcm93IjtzOjY6IuWFqOWbvSI7czo5OiJ0YWdfbWF0Y2giO3M6NjY6InV4NDA2NTd1eDMzMzk0LHV4MzYyMjl1eDIyODIzdXgzMDcyMSx1eDIyODIzdXgzMDcyMSx1eDIwMDEzdXgzMDcyMSI7czoxMzoidGFnX21hdGNoX3JvdyI7czozMDoi6buR6ImyLOi2heWkp+eggSzlpKfnoIEs5Lit56CBIjtzOjY6Inhwb2ludCI7czowOiIiO3M6NjoieXBvaW50IjtzOjA6IiI7czo4OiJicmFuZF9pZCI7czoyOiIxMiI7czoxMzoiYnJhbmRfcHJvbW90ZSI7czoxOiIwIjt9fQ==', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(164, '', '很美的地方，有机会一定要去看看', '很美的地方，有机会一定要去看看[强][强]', 1331937682, 'share', 44, 'fanwe', 1, 0, 0, 164, 0, 0, 0, 0, 6, '', '', '', 0, 'share', 0, 1, '', '', 'ux33258ux21161ux28216,ux26053ux34892,ux32654ux30340,ux19968ux23450,ux26426ux20250,ux30475ux30475,ux22320ux26041', '自助游,旅行,美的,一定,机会,看看,地方', '', '', ' 自助游 旅行', 1, 1, 0, '网站', '', '', '', 1, 1, 1, '', 0, 0, 'ux20241ux38386ux23089ux20048,ux20048ux20139ux32654ux39135,ux26053ux28216ux37202ux24215,ux37117ux24066ux36141ux29289,ux24184ux31119ux23621ux23478,ux28010ux28459ux23130ux24651,ux29609ux20048ux24110ux27966', '休闲娱乐,乐享美食,旅游酒店,都市购物,幸福居家,浪漫婚恋,玩乐帮派', '', 0, '', 0, ''),
(165, '', '不是寺庙的寺庙——西藏宗山古堡', '似乎，我从西藏回来，已经好久了。\r\n\r\n迟迟没有动笔，我不承认是因为懒。\r\n\r\n我是怕写不出动人之处，让大家失望，也让自己失望。\r\n\r\n终于，非要等到该忘记的几乎全忘了，才想着该下笔了。\r\n\r\n关于照片，我们一路都在后悔没把相机说明书带出来，再加上照片几乎都是在车上拍的，我也不会什么ps，所以也就不强求什么质量。', 1331938077, 'share', 44, 'fanwe', 1, 0, 0, 165, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 0, '', '', 'ux26053ux34892,ux35199ux34255,ux23546ux24217,ux22833ux26395,ux20960ux20046,ux29031ux29255,ux20160ux20040,ux19979ux31508,ux21160ux31508,ux20986ux21160,ux24378ux27714,ux36831ux36831', '旅行,西藏,寺庙,失望,几乎,照片,什么,下笔,动笔,出动,强求,迟迟', '', '', ' 旅行 西藏 寺庙', 1, 1, 0, '网站', '', '', '', 1, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(166, '', '海是倒过来的天空', '这是在船上拍的。\r\n当时正是日落时分。可是船却是逆着日落的方向前行着。\r\n这场日落持续了很久很久很久[爱心][爱心]', 1331938194, 'share', 46, 'fzmatthew', 1, 0, 0, 166, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 0, '', '', 'ux26085ux33853,ux22823ux28023,ux22825ux31354,ux29233ux24515,ux33337ux19978,ux26102ux20998,ux21069ux34892,ux36825ux22330,ux21364ux26159,ux27491ux26159,ux24403ux26102,ux21487ux26159', '日落,大海,天空,爱心,船上,时分,前行,这场,却是,正是,当时,可是', '', '', ' 日落 大海 天空', 1, 1, 0, '网站', '', '', '', 1, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(167, '', '', '', 1331938209, 'share', 46, 'fzmatthew', 1, 0, 0, 164, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 164, 0, '', '', '', '', '', '', '', 0, 0, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(168, '', '我们❤家要像这样-客厅篇', '心爱的客厅~有咪咪小盆友，是从日本来的哦，我把他领养回来，但是真搞不懂，这么可爱的猫咪为什么要抛弃他呢？还有矮矮的窗台，上面放了金鱼和小草门，正在茁壮成长:) 还有最重要的就是这些心爱的杂志啦，里面有无穷无尽的good ideas！', 1331938359, 'share', 44, 'fanwe', 1, 0, 0, 168, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 0, '', '', 'ux26085ux31995,ux29483ux21674,ux23478ux23621,ux37329ux40060,ux24515ux29233,ux36824ux26377,ux30406,ux33537ux22766ux25104ux38271,ux26085ux26412,ux26080ux31351ux26080ux23613,ux39046ux20859,ux21674ux21674,ux31383ux21488', '日系,猫咪,家居,金鱼,心爱,还有,盆,茁壮成长,日本,无穷无尽,领养,咪咪,窗台', '', '', ' 日系 猫咪 家居', 1, 1, 0, '网站', '', '', '', 2, 0, 0, '', 0, 0, 'ux20241ux38386ux23089ux20048,ux20048ux20139ux32654ux39135,ux26053ux28216ux37202ux24215,ux37117ux24066ux36141ux29289,ux24184ux31119ux23621ux23478,ux28010ux28459ux23130ux24651,ux29609ux20048ux24110ux27966', '休闲娱乐,乐享美食,旅游酒店,都市购物,幸福居家,浪漫婚恋,玩乐帮派', '', 0, '', 0, ''),
(169, '', '节省空间篇', '别看房子小 装修有妙招', 1331938416, 'share', 44, 'fanwe', 1, 0, 0, 169, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 0, '', '', 'ux31616ux32422,ux33410ux30465ux31354ux38388,ux23478ux23621,ux22937ux25307,ux25151ux23376,ux35013ux20462', '简约,节省空间,家居,妙招,房子,装修', '', '', ' 简约 节省空间 家居', 1, 1, 0, '网站', '', '', '', 2, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(170, '', '很美的清江河。', '很美的清江河。', 1331938485, 'share', 44, 'fanwe', 1, 0, 0, 170, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 0, '', '', 'ux32654ux30340,ux27743ux27827', '美的,江河', '', '', '', 1, 1, 0, '网站', '', '', '', 1, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(171, '', '很美丽的日落', '很美丽的日落[得意][得意]', 1331938803, 'share', 44, 'fanwe', 1, 0, 0, 171, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 0, '', '', 'ux40644ux26127,ux25668ux24433,ux24471ux24847,ux26085ux33853,ux32654ux20029', '黄昏,摄影,得意,日落,美丽', '', '', ' 黄昏 摄影', 1, 1, 0, '网站', '', '', '', 1, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(172, '', '在小岛旅行！', '蜈支洲码头：乘坐10分钟游轮抵岛，很漂亮的地方，只是有点晕船，就这样晕呼呼的到了岛上！', 1331938903, 'share', 44, 'fanwe', 1, 0, 0, 172, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 0, '', '', 'ux33258ux21161ux28216,ux26053ux34892,ux23567ux23707,ux22823ux28023,ux26197ux33337,ux28216ux36718,ux23707ux19978,ux20056ux22352,ux30721ux22836,ux21628ux21628,ux26377ux28857,ux21482ux26159,ux20998ux38047,ux28418ux20142', '自助游,旅行,小岛,大海,晕船,游轮,岛上,乘坐,码头,呼呼,有点,只是,分钟,漂亮', '', '', ' 自助游 旅行 小岛 大海', 1, 1, 0, '网站', '', '', '', 1, 0, 0, '', 0, 0, 'ux20241ux38386ux23089ux20048,ux20048ux20139ux32654ux39135,ux26053ux28216ux37202ux24215,ux37117ux24066ux36141ux29289,ux24184ux31119ux23621ux23478,ux28010ux28459ux23130ux24651,ux29609ux20048ux24110ux27966', '休闲娱乐,乐享美食,旅游酒店,都市购物,幸福居家,浪漫婚恋,玩乐帮派', '', 0, '', 0, ''),
(173, '', '在云端', '在云端', 1331938956, 'share', 44, 'fanwe', 1, 0, 0, 173, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 0, '', '', 'ux20113ux31471,ux39134ux26426,ux26053ux34892', '云端,飞机,旅行', '', '', ' 云端 飞机 旅行', 1, 1, 0, '网站', '', '', '', 1, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(174, '', '愤怒的小鸟', '[得意][得意]', 1331939026, 'share', 44, 'fanwe', 1, 0, 0, 174, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 0, '', '', 'ux24471ux24847', '得意', '', '', '', 1, 1, 0, '网站', '', '', '', 2, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(175, '', '它在干什么？', '它在干什么？[白眼][白眼]', 1331939071, 'share', 44, 'fanwe', 1, 0, 0, 175, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 0, '', '', 'ux23456ux29289,ux29483ux21674,ux30333ux30524,ux24178ux20160ux20040', '宠物,猫咪,白眼,干什么', '', '', ' 宠物 猫咪', 1, 1, 0, '网站', '', '', '', 2, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(176, '', '这部电影叫什么？', '这部电影叫什么？[奋斗][奋斗]', 1331939121, 'share', 44, 'fanwe', 1, 0, 0, 176, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 0, '', '', 'ux22859ux26007,ux36825ux37096,ux20160ux20040,ux30005ux24433', '奋斗,这部,什么,电影', '', '', '', 1, 1, 0, '网站', '', '', '', 2, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(177, '对爱琴海餐厅发表了点评', '', '上周去吃过，感觉不错。推荐这家餐厅[坏笑]', 1333241498, 'slocationcomment', 44, 'fanwe', 1, 0, 0, 177, 0, 0, 0, 0, 0, 'youhui', 'store#view', 'id=15', 0, 'share', 0, 0, '', '', 'ux36825ux23478,ux19978ux21608,ux39184ux21381,ux19981ux38169,ux24863ux35273,ux25512ux33616,ux29233ux29748ux28023,ux28857ux35780,ux21457ux34920,ux23545ux29233ux29748ux28023ux39184ux21381ux21457ux34920ux20102ux28857ux35780', '这家,上周,餐厅,不错,感觉,推荐,爱琴海,点评,发表,对爱琴海餐厅发表了点评', '', '', '', 0, 0, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(178, '对爱琴海餐厅发表了点评', '', '非常好非常好非常好非常好非常好非常好非常好', 1333241553, 'slocationcomment', 44, 'fanwe', 1, 0, 0, 178, 0, 0, 0, 0, 0, 'youhui', 'store#view', 'id=15', 0, 'share', 0, 0, '', '', 'ux38750ux24120,ux29233ux29748ux28023,ux39184ux21381,ux28857ux35780,ux21457ux34920,ux23545ux29233ux29748ux28023ux39184ux21381ux21457ux34920ux20102ux28857ux35780', '非常,爱琴海,餐厅,点评,发表,对爱琴海餐厅发表了点评', '', '', '', 0, 0, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(179, '对爱琴海餐厅发表了点评', '', '一般般一般般一般般一般般一般般一般般一般般一般般一般般一般般一般般一般般一般般一般般', 1333241576, 'slocationcomment', 44, 'fanwe', 1, 0, 0, 179, 0, 0, 0, 0, 0, 'youhui', 'store#view', 'id=15', 0, 'share', 0, 0, '', '', 'ux19968ux33324ux33324,ux29233ux29748ux28023,ux39184ux21381,ux28857ux35780,ux21457ux34920,ux23545ux29233ux29748ux28023ux39184ux21381ux21457ux34920ux20102ux28857ux35780', '一般般,爱琴海,餐厅,点评,发表,对爱琴海餐厅发表了点评', '', '', '', 0, 0, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_topic_cate_link`
--

CREATE TABLE IF NOT EXISTS `fanwe_topic_cate_link` (
  `topic_id` int(11) NOT NULL,
  `cate_id` int(11) NOT NULL,
  PRIMARY KEY (`topic_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_topic_cate_link`
--

INSERT INTO `fanwe_topic_cate_link` (`topic_id`, `cate_id`) VALUES
(133, 1),
(133, 2),
(133, 3),
(133, 4),
(133, 5),
(133, 6),
(133, 7),
(134, 1),
(134, 2),
(134, 3),
(134, 4),
(134, 5),
(134, 6),
(134, 7),
(135, 1),
(135, 2),
(135, 3),
(135, 4),
(135, 5),
(135, 6),
(135, 7),
(136, 1),
(136, 2),
(136, 3),
(136, 4),
(136, 5),
(136, 6),
(136, 7),
(137, 1),
(137, 2),
(137, 3),
(137, 4),
(137, 5),
(137, 6),
(137, 7),
(146, 1),
(147, 1),
(148, 1),
(152, 3),
(164, 1),
(164, 2),
(164, 3),
(164, 4),
(164, 5),
(164, 6),
(164, 7),
(168, 1),
(168, 2),
(168, 3),
(168, 4),
(168, 5),
(168, 6),
(168, 7),
(172, 1),
(172, 2),
(172, 3),
(172, 4),
(172, 5),
(172, 6),
(172, 7);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_topic_group`
--

CREATE TABLE IF NOT EXISTS `fanwe_topic_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `memo` text NOT NULL,
  `sort` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `cate_id` int(11) NOT NULL,
  `user_count` int(11) NOT NULL,
  `topic_count` int(11) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `fanwe_topic_group`
--

INSERT INTO `fanwe_topic_group` (`id`, `name`, `memo`, `sort`, `create_time`, `cate_id`, `user_count`, `topic_count`, `icon`, `image`, `is_effect`, `user_id`) VALUES
(1, '那个地方很美~❤', '✿趁我们还年轻，多出去走动走动。发现某个地方 某个角落很美✿\r\n\r\n✿ 那便是一种买再多再贵的东西都得不到的感觉✿\r\n\r\n1、姐妹们可以将自己喜欢任何的城市、任何小店...介绍给大家~\r\n\r\n2、要有理由和感想哦~\r\n\r\n3、附有自己拍的照片~	\r\n	\r\n    ✿喜欢旅游，喜欢美丽的景色，喜欢一切美好事物的朋友们一定要来哟~✿\r\n\r\n    ✿本小组是在情人节创建的 嘿嘿~✿\r\n\r\n    ✿希望本小组可以慢慢的壮大~	✿\r\n\r\n✿喜欢把那一幅幅美丽的画面制成明信片，喜欢收集各色各样的明信片✿', 1, 1331937520, 3, 1, 7, './public/attachment/201203/17/14/4f643167c6a86.jpg', './public/attachment/201203/17/14/4f64316f2da12.jpg', 1, 44),
(2, '我们❤家要像这样', '你是恋物控吗？\r\n你喜欢搜集温馨的家居小物吗？\r\n你喜欢装扮自己的小家吗？\r\n欢迎姑娘们加入这个小组～为这里添砖加瓦 \r\n一起讨论自己的小家， 自己的小店，自己的房间要长成什么样：）	\r\n~~~~~~~~~~~~~~~~~~~	\r\n❤温馨提醒❤：\r\n为了方便大家查找自己喜欢的类别信息，请大家按照以下形式写主题哦~\r\n{我们❤家要像这样-色彩篇}\r\n{我们❤家要像这样-原木篇}\r\n{我们❤家要像这样-地中海篇}\r\n{我们❤家要像这样-饰物篇}\r\n待补充。。。\r\n小组还在起步阶段 期待大家的加入与分享！', 2, 1331937599, 1, 1, 5, './public/attachment/201203/17/14/4f6431b8f2030.jpg', './public/attachment/201203/17/14/4f6431bded69f.jpg', 1, 44);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_topic_group_cate`
--

CREATE TABLE IF NOT EXISTS `fanwe_topic_group_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sort` int(11) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `group_count` int(11) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `fanwe_topic_group_cate`
--

INSERT INTO `fanwe_topic_group_cate` (`id`, `name`, `sort`, `icon`, `group_count`, `is_effect`) VALUES
(1, '时尚', 1, '', 1, 1),
(2, '美食', 2, '', 0, 1),
(3, '旅行', 3, '', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_topic_image`
--

CREATE TABLE IF NOT EXISTS `fanwe_topic_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `filesize` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `topic_table` varchar(255) NOT NULL,
  `o_path` varchar(255) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=144 ;

--
-- 转存表中的数据 `fanwe_topic_image`
--

INSERT INTO `fanwe_topic_image` (`id`, `topic_id`, `name`, `filesize`, `create_time`, `user_id`, `user_name`, `path`, `topic_table`, `o_path`, `width`, `height`) VALUES
(78, 131, 'ch1.jpg', 25250, 1328311856, 44, 'fanwe', './public/comment/201202/04/15/5d1b7f7e0a1ea52700cd53df79a7e32524_100x100.jpg', 'topic', './public/comment/201202/04/15/5d1b7f7e0a1ea52700cd53df79a7e32524.jpg', 510, 415),
(79, 131, 'ch2.jpg', 15125, 1328311863, 44, 'fanwe', './public/comment/201202/04/15/5d7e4407af01370b957421ddace76cf379_100x100.jpg', 'topic', './public/comment/201202/04/15/5d7e4407af01370b957421ddace76cf379.jpg', 450, 450),
(80, 131, 'ch3.jpg', 29240, 1328311866, 44, 'fanwe', './public/comment/201202/04/15/0af5bbe43efe7b6dea9ee468248c560e68_100x100.jpg', 'topic', './public/comment/201202/04/15/0af5bbe43efe7b6dea9ee468248c560e68.jpg', 510, 361),
(81, 131, 'ch4.jpg', 53319, 1328311869, 44, 'fanwe', './public/comment/201202/04/15/ad3223eb6ae4b63cf16e62b39f3db04897_100x100.jpg', 'topic', './public/comment/201202/04/15/ad3223eb6ae4b63cf16e62b39f3db04897.jpg', 510, 468),
(82, 131, 'ch5.jpg', 29240, 1328311872, 44, 'fanwe', './public/comment/201202/04/15/7d349340f511f2999a8344c335b14d4274_100x100.jpg', 'topic', './public/comment/201202/04/15/7d349340f511f2999a8344c335b14d4274.jpg', 510, 361),
(83, 132, 'sy.jpg', 207495, 1328312045, 44, 'fanwe', './public/comment/201202/04/15/ea03ad310dcbe85c691ac13bf836361778_100x100.jpg', 'topic', './public/comment/201202/04/15/ea03ad310dcbe85c691ac13bf836361778.jpg', 1280, 853),
(84, 132, 'sy2.jpg', 213082, 1328312049, 44, 'fanwe', './public/comment/201202/04/15/a03b1900ae539db09b9d3e90463b0c5160_100x100.jpg', 'topic', './public/comment/201202/04/15/a03b1900ae539db09b9d3e90463b0c5160.jpg', 1280, 738),
(85, 133, 'hc2.jpg', 106345, 1328312146, 44, 'fanwe', './public/comment/201202/04/15/7c00633a7f05b0445cd86bf1624dcb2558_100x100.jpg', 'topic', './public/comment/201202/04/15/7c00633a7f05b0445cd86bf1624dcb2558.jpg', 1280, 853),
(86, 133, 'hc3.jpg', 104056, 1328312149, 44, 'fanwe', './public/comment/201202/04/15/01df8dd4bda5c2eac50b99ee9570d97978_100x100.jpg', 'topic', './public/comment/201202/04/15/01df8dd4bda5c2eac50b99ee9570d97978.jpg', 1280, 853),
(87, 133, 'hc4.jpg', 99763, 1328312153, 44, 'fanwe', './public/comment/201202/04/15/0c51bb5f59f5b09a653d09080337871727_100x100.jpg', 'topic', './public/comment/201202/04/15/0c51bb5f59f5b09a653d09080337871727.jpg', 1280, 853),
(88, 133, 'hc.jpg', 98412, 1328312157, 44, 'fanwe', './public/comment/201202/04/15/0ef50d2c26dab3da41a5a871aa82abbf95_100x100.jpg', 'topic', './public/comment/201202/04/15/0ef50d2c26dab3da41a5a871aa82abbf95.jpg', 1280, 853),
(89, 134, 'qkl3.jpg', 268598, 1328312239, 44, 'fanwe', './public/comment/201202/04/15/d0ae28178ea3867e7722580634aa565767_100x100.jpg', 'topic', './public/comment/201202/04/15/d0ae28178ea3867e7722580634aa565767.jpg', 1280, 960),
(90, 134, 'qkl.jpg', 11083, 1328312245, 44, 'fanwe', './public/comment/201202/04/15/625f35e65814061ddef9a251276c8dd691_100x100.jpg', 'topic', './public/comment/201202/04/15/625f35e65814061ddef9a251276c8dd691.jpg', 200, 150),
(91, 135, 'cw2.jpg', 127358, 1328312346, 44, 'fanwe', './public/comment/201202/04/15/b9463eeb39987ca7e4d7726e9dccd72661_100x100.jpg', 'topic', './public/comment/201202/04/15/b9463eeb39987ca7e4d7726e9dccd72661.jpg', 1024, 768),
(92, 135, 'cw3.jpg', 146724, 1328312350, 44, 'fanwe', './public/comment/201202/04/15/5ca45df4a76eb9d1ee02fbe1a76b1b8c88_100x100.jpg', 'topic', './public/comment/201202/04/15/5ca45df4a76eb9d1ee02fbe1a76b1b8c88.jpg', 1024, 768),
(93, 135, 'cw.jpg', 91359, 1328312353, 44, 'fanwe', './public/comment/201202/04/15/fcfa3bc75df97377b5d22f663cfbdaae20_100x100.jpg', 'topic', './public/comment/201202/04/15/fcfa3bc75df97377b5d22f663cfbdaae20.jpg', 500, 639),
(94, 136, 'dy2.jpg', 219162, 1328312478, 44, 'fanwe', './public/comment/201202/04/15/3ed4cb6547a6a2a20237b55adf94d15594_100x100.jpg', 'topic', './public/comment/201202/04/15/3ed4cb6547a6a2a20237b55adf94d15594.jpg', 1280, 852),
(95, 136, 'dy3.jpg', 268797, 1328312482, 44, 'fanwe', './public/comment/201202/04/15/b517bda8ae56a6d36582a190fea06d2185_100x100.jpg', 'topic', './public/comment/201202/04/15/b517bda8ae56a6d36582a190fea06d2185.jpg', 1280, 852),
(96, 136, 'dy4.jpg', 10924, 1328312484, 44, 'fanwe', './public/comment/201202/04/15/19fdde7cba47936c9e998a85df85ce8686_100x100.jpg', 'topic', './public/comment/201202/04/15/19fdde7cba47936c9e998a85df85ce8686.jpg', 200, 133),
(97, 136, 'dy.jpg', 174286, 1328312488, 44, 'fanwe', './public/comment/201202/04/15/3664834a17d5d7d890bfcabb3e764e0f75_100x100.jpg', 'topic', './public/comment/201202/04/15/3664834a17d5d7d890bfcabb3e764e0f75.jpg', 1280, 855),
(98, 137, 'fn2.jpg', 50526, 1328312574, 44, 'fanwe', './public/comment/201202/04/15/be2c85548ad5fca063bd9d1d6add1faa13_100x100.jpg', 'topic', './public/comment/201202/04/15/be2c85548ad5fca063bd9d1d6add1faa13.jpg', 500, 500),
(99, 137, 'fn3.jpg', 52533, 1328312579, 44, 'fanwe', './public/comment/201202/04/15/05891ca45a216fc5aed6280bcaad084b93_100x100.jpg', 'topic', './public/comment/201202/04/15/05891ca45a216fc5aed6280bcaad084b93.jpg', 500, 500),
(100, 137, 'fn4.jpg', 48558, 1328312581, 44, 'fanwe', './public/comment/201202/04/15/822c1f3758e4b32e4327fbdb987a5b2d74_100x100.jpg', 'topic', './public/comment/201202/04/15/822c1f3758e4b32e4327fbdb987a5b2d74.jpg', 500, 500),
(101, 137, 'fn5.jpg', 59060, 1328312584, 44, 'fanwe', './public/comment/201202/04/15/13ba7fa8f7da90cd70f28d0296eed81073_100x100.jpg', 'topic', './public/comment/201202/04/15/13ba7fa8f7da90cd70f28d0296eed81073.jpg', 500, 500),
(102, 137, 'fn.jpg', 52061, 1328312587, 44, 'fanwe', './public/comment/201202/04/15/8b44310b7de3c540d24aabcfff97465f84_100x100.jpg', 'topic', './public/comment/201202/04/15/8b44310b7de3c540d24aabcfff97465f84.jpg', 500, 500),
(103, 144, '1546566505-1862554.jpg', 164816, 1328315193, 45, 'fz云淡风轻', './public/comment/201202/04/16/381b79ce992fb34191c9b9559b0fb9ea53_100x100.jpg', 'topic', './public/comment/201202/04/16/381b79ce992fb34191c9b9559b0fb9ea53.jpg', 800, 1066),
(104, 145, '1611441045-1877915.jpg', 280015, 1328315222, 45, 'fz云淡风轻', './public/comment/201202/04/16/f20cce9abe05d5def08330b5103a832580_100x100.jpg', 'topic', './public/comment/201202/04/16/f20cce9abe05d5def08330b5103a832580.jpg', 1280, 800),
(105, 146, 'xc.jpg', 140492, 1328315276, 45, 'fz云淡风轻', './public/comment/201202/04/16/a69a84427dd071df105eeb4bdf3f537a69_100x100.jpg', 'topic', './public/comment/201202/04/16/a69a84427dd071df105eeb4bdf3f537a69.jpg', 600, 885),
(106, 147, 'ddy1.jpg', 90877, 1328315326, 45, 'fz云淡风轻', './public/comment/201202/04/16/2bb1fba7bd9e10b01fea8a248d15129213_100x100.jpg', 'topic', './public/comment/201202/04/16/2bb1fba7bd9e10b01fea8a248d15129213.jpg', 600, 891),
(107, 147, 'ddy2.jpg', 67815, 1328315329, 45, 'fz云淡风轻', './public/comment/201202/04/16/52ffbe9fa4d1d960db5ed6fb4dd41ec676_100x100.jpg', 'topic', './public/comment/201202/04/16/52ffbe9fa4d1d960db5ed6fb4dd41ec676.jpg', 600, 251),
(108, 147, 'dy3.jpg', 268797, 1328315333, 45, 'fz云淡风轻', './public/comment/201202/04/16/4c5971b0370e739c71ea9d0f5e2e35e257_100x100.jpg', 'topic', './public/comment/201202/04/16/4c5971b0370e739c71ea9d0f5e2e35e257.jpg', 1280, 852),
(109, 148, 'ddy3.jpg', 99657, 1328315341, 45, 'fz云淡风轻', './public/comment/201202/04/16/347ba3d76c8cd114c26edd0097f657f168_100x100.jpg', 'topic', './public/comment/201202/04/16/347ba3d76c8cd114c26edd0097f657f168.jpg', 600, 400),
(110, 149, 'jp2.jpg', 116380, 1328315535, 45, 'fz云淡风轻', './public/comment/201202/04/16/a6808a103a19a445758c19031101371027_100x100.jpg', 'topic', './public/comment/201202/04/16/a6808a103a19a445758c19031101371027.jpg', 560, 493),
(111, 149, 'jp3.jpg', 142457, 1328315539, 45, 'fz云淡风轻', './public/comment/201202/04/16/47b1e49026ba7978bfa66545d0b25b7375_100x100.jpg', 'topic', './public/comment/201202/04/16/47b1e49026ba7978bfa66545d0b25b7375.jpg', 560, 465),
(112, 149, 'jp4.jpg', 69293, 1328315542, 45, 'fz云淡风轻', './public/comment/201202/04/16/2bb76d2bce44ef4405afcf26ed4d8c3511_100x100.jpg', 'topic', './public/comment/201202/04/16/2bb76d2bce44ef4405afcf26ed4d8c3511.jpg', 562, 456),
(113, 150, 'cww.jpg', 82015, 1328315598, 45, 'fz云淡风轻', './public/comment/201202/04/16/9aa15c792e0050e557ae6204329ff2ef98_100x100.jpg', 'topic', './public/comment/201202/04/16/9aa15c792e0050e557ae6204329ff2ef98.jpg', 480, 360),
(114, 150, 'cwww.jpg', 68014, 1328315601, 45, 'fz云淡风轻', './public/comment/201202/04/16/8a91e74d3723d560b792bdbb65a1211d78_100x100.jpg', 'topic', './public/comment/201202/04/16/8a91e74d3723d560b792bdbb65a1211d78.jpg', 510, 385),
(115, 151, 'sh.jpg', 91364, 1328315647, 45, 'fz云淡风轻', './public/comment/201202/04/16/e7e31636c26893863eb22f204351c0e535_100x100.jpg', 'topic', './public/comment/201202/04/16/e7e31636c26893863eb22f204351c0e535.jpg', 510, 515),
(116, 151, 'sh2.jpg', 101034, 1328315651, 45, 'fz云淡风轻', './public/comment/201202/04/16/c227a7c72c7780733ddccff8d987a0ef45_100x100.jpg', 'topic', './public/comment/201202/04/16/c227a7c72c7780733ddccff8d987a0ef45.jpg', 510, 517),
(117, 152, 'lx1.jpg', 167536, 1328315717, 45, 'fz云淡风轻', './public/comment/201202/04/16/59da51816b4eb48e835a9c7dffcf5fa880_100x100.jpg', 'topic', './public/comment/201202/04/16/59da51816b4eb48e835a9c7dffcf5fa880.jpg', 750, 497),
(118, 152, 'lx2.jpg', 168350, 1328315723, 45, 'fz云淡风轻', './public/comment/201202/04/16/8315ee9fd08bce1b8aca7ff9037d564328_100x100.jpg', 'topic', './public/comment/201202/04/16/8315ee9fd08bce1b8aca7ff9037d564328.jpg', 750, 499),
(119, 152, 'lx3.jpg', 148536, 1328315730, 45, 'fz云淡风轻', './public/comment/201202/04/16/fe9d5b48eb465991c1bac5380167e1bf22_100x100.jpg', 'topic', './public/comment/201202/04/16/fe9d5b48eb465991c1bac5380167e1bf22.jpg', 750, 499),
(120, 158, 'qkl3.jpg', 268598, 1328316487, 44, 'fanwe', './public/comment/201202/04/16/89b9f115dc9ee936440ce4294a19308c21_100x100.jpg', 'topic', './public/comment/201202/04/16/89b9f115dc9ee936440ce4294a19308c21.jpg', 1280, 960),
(121, 161, '60abe1073dee6f61192cd99bd575508443.jpg', 102222, 1329336267, 44, 'fanwe', './public/comment/201202/16/12/60abe1073dee6f61192cd99bd575508443_100x100.jpg', 'topic', './public/comment/201202/16/12/60abe1073dee6f61192cd99bd575508443.jpg', 420, 310),
(122, 162, '06ba7dca277558844809da860de26fec36.jpg', 151800, 1329336282, 44, 'fanwe', './public/comment/201202/16/12/06ba7dca277558844809da860de26fec36_100x100.jpg', 'topic', './public/comment/201202/16/12/06ba7dca277558844809da860de26fec36.jpg', 450, 310),
(123, 163, 'dff04d8009b248f1c5325fd9c15cc63d54.jpg', 22460, 1329337049, 44, 'fanwe', './public/comment/201202/16/12/dff04d8009b248f1c5325fd9c15cc63d54_100x100.jpg', 'topic', './public/comment/201202/16/12/dff04d8009b248f1c5325fd9c15cc63d54.jpg', 310, 310),
(124, 163, '31a7340dfa1e9ef6d7e92778518fb6d743.jpg', 23863, 1329337049, 44, 'fanwe', './public/comment/201202/16/12/31a7340dfa1e9ef6d7e92778518fb6d743_100x100.jpg', 'topic', './public/comment/201202/16/12/31a7340dfa1e9ef6d7e92778518fb6d743.jpg', 310, 310),
(125, 163, 'd432a21eab274e9f69dab11625ec500048.jpg', 27056, 1329337049, 44, 'fanwe', './public/comment/201202/16/12/d432a21eab274e9f69dab11625ec500048_100x100.jpg', 'topic', './public/comment/201202/16/12/d432a21eab274e9f69dab11625ec500048.jpg', 310, 310),
(126, 163, '592e71388f6524562f6ca79e1f3354d449.jpg', 27937, 1329337049, 44, 'fanwe', './public/comment/201202/16/12/592e71388f6524562f6ca79e1f3354d449_100x100.jpg', 'topic', './public/comment/201202/16/12/592e71388f6524562f6ca79e1f3354d449.jpg', 310, 310),
(127, 163, 'f41d7224291caaa87707c6f9a791ae3c37.jpg', 16947, 1329337049, 44, 'fanwe', './public/comment/201202/16/12/f41d7224291caaa87707c6f9a791ae3c37_100x100.jpg', 'topic', './public/comment/201202/16/12/f41d7224291caaa87707c6f9a791ae3c37.jpg', 310, 310),
(128, 164, 'lx1.jpg', 287406, 1331937648, 44, 'fanwe', './public/comment/201203/17/14/94856efdccc3994d42c406b2d519e03480_100x100.jpg', 'topic', './public/comment/201203/17/14/94856efdccc3994d42c406b2d519e03480.jpg', 750, 497),
(129, 164, 'lx3.jpg', 262608, 1331937657, 44, 'fanwe', './public/comment/201203/17/14/07109f2cb2018941eab28ab7093d87ac36_100x100.jpg', 'topic', './public/comment/201203/17/14/07109f2cb2018941eab28ab7093d87ac36.jpg', 750, 499),
(130, 165, '111.jpg', 129671, 1331938059, 44, 'fanwe', './public/comment/201203/17/14/d5270c5f1c1bc26f351ddfe09e0df65b57_100x100.jpg', 'topic', './public/comment/201203/17/14/d5270c5f1c1bc26f351ddfe09e0df65b57.jpg', 468, 310),
(131, 166, '123.jpg', 128770, 1331938179, 46, 'fzmatthew', './public/comment/201203/17/14/01bfbcd6b90e47bc6e0594dcf9714e1635_100x100.jpg', 'topic', './public/comment/201203/17/14/01bfbcd6b90e47bc6e0594dcf9714e1635.jpg', 468, 624),
(132, 166, '223.jpg', 102208, 1331938182, 46, 'fzmatthew', './public/comment/201203/17/14/c21e8c61792ff72f227a7808713cc68830_100x100.jpg', 'topic', './public/comment/201203/17/14/c21e8c61792ff72f227a7808713cc68830.jpg', 468, 624),
(133, 168, '123.jpg', 130698, 1331938329, 44, 'fanwe', './public/comment/201203/17/14/3d90ef28d42571b28151e30b47af58da56_100x100.jpg', 'topic', './public/comment/201203/17/14/3d90ef28d42571b28151e30b47af58da56.jpg', 468, 467),
(134, 168, '223.jpg', 118813, 1331938332, 44, 'fanwe', './public/comment/201203/17/14/a4b94ac22fec6b6cc76d8c0bf5283cb316_100x100.jpg', 'topic', './public/comment/201203/17/14/a4b94ac22fec6b6cc76d8c0bf5283cb316.jpg', 468, 467),
(135, 169, '123.jpg', 90294, 1331938404, 44, 'fanwe', './public/comment/201203/17/14/87e7e8b8bfb05f2b519b49812cd7aa2124_100x100.jpg', 'topic', './public/comment/201203/17/14/87e7e8b8bfb05f2b519b49812cd7aa2124.jpg', 468, 334),
(136, 170, '123.jpg', 181346, 1331938484, 44, 'fanwe', './public/comment/201203/17/14/44fac473deeb49e37c574342fcc5706333_100x100.jpg', 'topic', './public/comment/201203/17/14/44fac473deeb49e37c574342fcc5706333.jpg', 468, 624),
(137, 171, 'hc2.jpg', 264603, 1331938770, 44, 'fanwe', './public/comment/201203/17/14/94ea06c2948de50688a0828c6eeb626a79_100x100.jpg', 'topic', './public/comment/201203/17/14/94ea06c2948de50688a0828c6eeb626a79.jpg', 1280, 853),
(138, 171, 'hc3.jpg', 238190, 1331938775, 44, 'fanwe', './public/comment/201203/17/14/2d7e5b9d69685d315df2cfec70aa7bbe58_100x100.jpg', 'topic', './public/comment/201203/17/14/2d7e5b9d69685d315df2cfec70aa7bbe58.jpg', 1280, 853),
(139, 172, 'xd.jpg', 74631, 1331938891, 44, 'fanwe', './public/comment/201203/17/15/46a5beee2cd270c475466c10a121db9219_100x100.jpg', 'topic', './public/comment/201203/17/15/46a5beee2cd270c475466c10a121db9219.jpg', 468, 350),
(140, 173, 'td.jpg', 109140, 1331938945, 44, 'fanwe', './public/comment/201203/17/15/66521bf2db57360ac27fd9fddfdffd1969_100x100.jpg', 'topic', './public/comment/201203/17/15/66521bf2db57360ac27fd9fddfdffd1969.jpg', 468, 625),
(141, 174, 'fn2.jpg', 125272, 1331939025, 44, 'fanwe', './public/comment/201203/17/15/10a8df3b7f89e9d770e7f15f1db5cd3120_100x100.jpg', 'topic', './public/comment/201203/17/15/10a8df3b7f89e9d770e7f15f1db5cd3120.jpg', 500, 500),
(142, 175, 'cw2.jpg', 406222, 1331939046, 44, 'fanwe', './public/comment/201203/17/15/3036d0a4d5c61784b4fff657cacbc36396_100x100.jpg', 'topic', './public/comment/201203/17/15/3036d0a4d5c61784b4fff657cacbc36396.jpg', 1024, 768),
(143, 176, 'ddy1.jpg', 246083, 1331939104, 44, 'fanwe', './public/comment/201203/17/15/c3cd163b781bba9c27f6599b33d2b3b815_100x100.jpg', 'topic', './public/comment/201203/17/15/c3cd163b781bba9c27f6599b33d2b3b815.jpg', 600, 891);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_topic_reply`
--

CREATE TABLE IF NOT EXISTS `fanwe_topic_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `reply_id` int(11) NOT NULL,
  `reply_user_id` int(11) NOT NULL,
  `reply_user_name` varchar(255) NOT NULL,
  `create_time` int(11) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reply_id` (`reply_id`),
  KEY `topic_id` (`topic_id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=42 ;

--
-- 转存表中的数据 `fanwe_topic_reply`
--

INSERT INTO `fanwe_topic_reply` (`id`, `topic_id`, `content`, `user_id`, `user_name`, `reply_id`, `reply_user_id`, `reply_user_name`, `create_time`, `is_effect`, `is_delete`) VALUES
(38, 137, '[尴尬][尴尬]', 44, 'fanwe', 0, 0, '', 1328312626, 1, 0),
(39, 137, '回复@fanwe:[尴尬][尴尬][尴尬]', 46, 'fzmatthew', 38, 44, 'fanwe', 1328312707, 1, 0),
(40, 139, '看起来很好吃[示爱][示爱]', 45, 'fz云淡风轻', 0, 0, '', 1328312823, 1, 0),
(41, 154, '相当美', 46, 'fzmatthew', 0, 0, '', 1328315861, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_topic_tag`
--

CREATE TABLE IF NOT EXISTS `fanwe_topic_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_recommend` tinyint(1) NOT NULL COMMENT '是否推荐',
  `count` int(11) NOT NULL COMMENT '是否为预设标签',
  `is_preset` tinyint(1) NOT NULL,
  `color` varchar(10) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `fanwe_topic_tag`
--

INSERT INTO `fanwe_topic_tag` (`id`, `name`, `is_recommend`, `count`, `is_preset`, `color`, `sort`) VALUES
(1, '电影', 1, 2, 1, '', 0),
(2, '自助游', 1, 0, 1, '', 0),
(3, '闽菜', 1, 0, 1, '', 0),
(4, '川菜', 1, 0, 1, '', 0),
(5, '咖啡', 1, 0, 1, '#fff100', 0),
(6, '牛排', 1, 0, 1, '#a1410d', 0),
(7, '包包', 1, 0, 0, '#ed008c', 0),
(8, '复古', 1, 0, 0, '#a36209', 0),
(9, '甜美', 1, 0, 0, '', 0),
(10, '日系', 1, 0, 0, '#a4d49d', 0),
(11, '欧美', 1, 0, 0, '#ee1d24', 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_topic_tag_cate`
--

CREATE TABLE IF NOT EXISTS `fanwe_topic_tag_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sub_name` varchar(255) NOT NULL COMMENT '附标题',
  `mobile_title_bg` varchar(255) NOT NULL COMMENT '手机分类背景图',
  `sort` int(11) NOT NULL,
  `showin_mobile` tinyint(1) NOT NULL,
  `showin_web` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `fanwe_topic_tag_cate`
--

INSERT INTO `fanwe_topic_tag_cate` (`id`, `name`, `sub_name`, `mobile_title_bg`, `sort`, `showin_mobile`, `showin_web`) VALUES
(1, '休闲娱乐', '', './public/attachment/201202/04/16/4f2cef7b454fc.png', 0, 1, 1),
(2, '乐享美食', '', './public/attachment/201202/04/16/4f2cef6c8a9d1.png', 0, 1, 1),
(3, '旅游酒店', '', './public/attachment/201202/04/16/4f2cef7b454fc.png', 0, 1, 1),
(4, '都市购物', '', './public/attachment/201202/04/16/4f2cef7b454fc.png', 0, 1, 1),
(5, '幸福居家', '', '', 1, 0, 1),
(6, '浪漫婚恋', '', '', 2, 0, 1),
(7, '玩乐帮派', '', '', 3, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_topic_tag_cate_link`
--

CREATE TABLE IF NOT EXISTS `fanwe_topic_tag_cate_link` (
  `cate_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`cate_id`,`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_topic_tag_cate_link`
--

INSERT INTO `fanwe_topic_tag_cate_link` (`cate_id`, `tag_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(3, 9),
(3, 10),
(3, 11),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 6),
(4, 7),
(4, 8),
(4, 9),
(4, 10),
(4, 11),
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(5, 5),
(5, 6),
(5, 7),
(5, 8),
(5, 9),
(5, 10),
(5, 11),
(6, 1),
(6, 2),
(6, 3),
(6, 4),
(6, 5),
(6, 6),
(6, 7),
(6, 8),
(6, 9),
(6, 10),
(6, 11),
(7, 1),
(7, 2),
(7, 3),
(7, 4),
(7, 5),
(7, 6),
(7, 7),
(7, 8),
(7, 9),
(7, 10),
(7, 11);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_topic_title`
--

CREATE TABLE IF NOT EXISTS `fanwe_topic_title` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '0:主题1:活动',
  `is_recommend` tinyint(1) NOT NULL,
  `count` int(11) NOT NULL,
  `color` varchar(10) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`type`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `fanwe_topic_title`
--

INSERT INTO `fanwe_topic_title` (`id`, `name`, `type`, `is_recommend`, `count`, `color`, `sort`) VALUES
(1, '免费试吃', 1, 1, 0, '', 0),
(2, '试吃分享', 1, 1, 0, '', 0),
(3, '对爱琴海餐厅发表了点评', 0, 0, 3, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_topic_title_cate_link`
--

CREATE TABLE IF NOT EXISTS `fanwe_topic_title_cate_link` (
  `title_id` int(11) NOT NULL,
  `cate_id` int(11) NOT NULL,
  PRIMARY KEY (`title_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_topic_title_cate_link`
--

INSERT INTO `fanwe_topic_title_cate_link` (`title_id`, `cate_id`) VALUES
(1, 2),
(2, 2);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_topic_vote_log`
--

CREATE TABLE IF NOT EXISTS `fanwe_topic_vote_log` (
  `user_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `vote_count` int(11) NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `topic_id` (`topic_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_topic_vote_log`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_urls`
--

CREATE TABLE IF NOT EXISTS `fanwe_urls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` text NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `fanwe_urls`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user`
--

CREATE TABLE IF NOT EXISTS `fanwe_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `user_pwd` varchar(255) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `login_ip` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `score` int(11) NOT NULL,
  `money` double(20,4) NOT NULL,
  `verify` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL COMMENT '登录用的标识码',
  `pid` int(11) NOT NULL,
  `login_time` int(11) NOT NULL,
  `referral_count` int(11) NOT NULL,
  `password_verify` varchar(255) NOT NULL,
  `integrate_id` int(11) NOT NULL,
  `sina_id` varchar(255) NOT NULL,
  `renren_id` varchar(255) NOT NULL,
  `kaixin_id` varchar(255) NOT NULL,
  `sohu_id` varchar(255) NOT NULL,
  `lottery_mobile` varchar(255) NOT NULL,
  `lottery_verify` varchar(255) NOT NULL,
  `verify_create_time` int(11) NOT NULL,
  `tencent_id` varchar(255) NOT NULL,
  `referer` varchar(255) NOT NULL,
  `login_pay_time` int(11) NOT NULL,
  `focus_count` int(11) NOT NULL COMMENT '关注别人的数量',
  `focused_count` int(11) NOT NULL COMMENT '粉丝数',
  `province_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `sex` tinyint(1) NOT NULL DEFAULT '-1',
  `my_intro` varchar(255) NOT NULL,
  `is_merchant` tinyint(1) NOT NULL,
  `merchant_name` varchar(255) NOT NULL,
  `is_daren` tinyint(1) NOT NULL,
  `daren_title` varchar(255) NOT NULL,
  `step` tinyint(1) NOT NULL,
  `byear` int(4) NOT NULL,
  `bmonth` int(2) NOT NULL,
  `bday` int(2) NOT NULL,
  `locate_time` int(11) DEFAULT '0' COMMENT '用户最后登陆时间',
  `xpoint` float(10,6) DEFAULT '0.000000' COMMENT '用户最后登陆x座标',
  `ypoint` float(10,6) DEFAULT '0.000000' COMMENT '用户最后登陆y座标',
  `topic_count` int(11) NOT NULL,
  `fav_count` int(11) NOT NULL,
  `faved_count` int(11) NOT NULL,
  `dp_count` int(11) NOT NULL,
  `insite_count` int(11) NOT NULL,
  `outsite_count` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `point` int(11) NOT NULL,
  `sina_app_key` varchar(255) NOT NULL,
  `sina_app_secret` varchar(255) NOT NULL,
  `is_syn_sina` tinyint(1) NOT NULL,
  `tencent_app_key` varchar(255) NOT NULL,
  `tencent_app_secret` varchar(255) NOT NULL,
  `is_syn_tencent` tinyint(1) NOT NULL,
  `sina_token` varchar(255) NOT NULL,
  `t_access_token` varchar(255) NOT NULL,
  `t_openkey` varchar(255) NOT NULL,
  `t_openid` varchar(255) NOT NULL,
  `qq_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unk_user_name` (`user_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=48 ;

--
-- 转存表中的数据 `fanwe_user`
--

INSERT INTO `fanwe_user` (`id`, `user_name`, `user_pwd`, `create_time`, `update_time`, `login_ip`, `group_id`, `is_effect`, `is_delete`, `email`, `mobile`, `score`, `money`, `verify`, `code`, `pid`, `login_time`, `referral_count`, `password_verify`, `integrate_id`, `sina_id`, `renren_id`, `kaixin_id`, `sohu_id`, `lottery_mobile`, `lottery_verify`, `verify_create_time`, `tencent_id`, `referer`, `login_pay_time`, `focus_count`, `focused_count`, `province_id`, `city_id`, `sex`, `my_intro`, `is_merchant`, `merchant_name`, `is_daren`, `daren_title`, `step`, `byear`, `bmonth`, `bday`, `locate_time`, `xpoint`, `ypoint`, `topic_count`, `fav_count`, `faved_count`, `dp_count`, `insite_count`, `outsite_count`, `level_id`, `point`, `sina_app_key`, `sina_app_secret`, `is_syn_sina`, `tencent_app_key`, `tencent_app_secret`, `is_syn_tencent`, `sina_token`, `t_access_token`, `t_openkey`, `t_openid`, `qq_id`) VALUES
(44, 'fanwe', '6714ccb93be0fda4e51f206b91b46358', 1330109634, 1330109634, '222.186.97.53', 1, 1, 0, 'fanwe@fanwe.com', '', 0, 0.0000, '', '', 0, 1416595087, 0, '', 0, '1602795520', '0', '0', '0', '', '', 0, '', '', 0, 2, 3, 0, 0, -1, '', 1, 'fanwe', 1, '分享达人', 1, 0, 0, 0, 1330712776, 119.306938, 26.069746, 26, 1, 3, 3, 3, 0, 2, 150, '', '', 0, '', '', 0, '2.00e1KTkBMZD6RE6bcc6aac08AB2uzD', '', '', '', NULL),
(45, 'fz云淡风轻', '96e79218965eb72c92a549dd5a330112', 1328311801, 1328311801, '127.0.0.1', 1, 1, 0, '88522820@qq.com', '', 0, 0.0000, '', '', 0, 1328312741, 0, '', 0, '0', '0', '0', '0', '', '', 0, '', '', 0, 2, 3, 0, 0, -1, '', 0, '', 1, '美食达人', 1, 0, 0, 0, 0, 0.000000, 0.000000, 12, 1, 3, 0, 0, 0, 0, 0, '', '', 0, '', '', 0, '', '', '', '', NULL),
(46, 'fzmatthew', '96e79218965eb72c92a549dd5a330112', 1328311810, 1328311810, '127.0.0.1', 1, 1, 0, 'test@qq.com', '', 0, 0.0000, '', '', 0, 1331938095, 0, '', 0, '0', '0', '0', '0', '', '', 0, '', '', 0, 2, 3, 0, 0, -1, '', 0, '', 1, '旅游达人', 1, 0, 0, 0, 0, 0.000000, 0.000000, 9, 4, 1, 0, 0, 0, 0, 20, '', '', 0, '', '', 0, '', '', '', '', NULL),
(47, '方维o2o', '96e79218965eb72c92a549dd5a330112', 1328311817, 1328311817, '127.0.0.1', 1, 1, 0, 'fanwe@qq.com', '', 0, 0.0000, '', '', 0, 1328311457, 0, '', 0, '0', '0', '0', '0', '', '', 0, '', '', 0, 3, 0, 0, 0, -1, '', 0, '', 1, '购物达人', 1, 0, 0, 0, 0, 0.000000, 0.000000, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, '', '', 0, '', '', '', '', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_active_log`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_active_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `point` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `money` double(11,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `fanwe_user_active_log`
--

INSERT INTO `fanwe_user_active_log` (`id`, `user_id`, `create_time`, `point`, `score`, `money`) VALUES
(1, 44, 1331938079, 10, 0, 0.0000),
(2, 46, 1331938195, 10, 0, 0.0000),
(3, 46, 1331938209, 10, 0, 0.0000),
(4, 44, 1331938361, 10, 0, 0.0000),
(5, 44, 1331938417, 10, 0, 0.0000),
(6, 44, 1331938485, 10, 0, 0.0000),
(7, 44, 1331938803, 10, 0, 0.0000),
(8, 44, 1331938904, 10, 0, 0.0000),
(9, 44, 1331938957, 10, 0, 0.0000),
(10, 44, 1331939026, 10, 0, 0.0000),
(11, 44, 1331939071, 10, 0, 0.0000),
(12, 44, 1331939121, 10, 0, 0.0000),
(13, 44, 1333241498, 10, 0, 0.0000),
(14, 44, 1333241553, 10, 0, 0.0000),
(15, 44, 1333241576, 10, 0, 0.0000);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_auth`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `m_name` varchar(255) NOT NULL,
  `a_name` varchar(255) NOT NULL,
  `rel_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `fanwe_user_auth`
--

INSERT INTO `fanwe_user_auth` (`id`, `user_id`, `m_name`, `a_name`, `rel_id`) VALUES
(1, 44, 'group', 'del', 1),
(2, 44, 'group', 'replydel', 1),
(3, 44, 'group', 'settop', 1),
(4, 44, 'group', 'setbest', 1),
(5, 44, 'group', 'setmemo', 1),
(6, 44, 'group', 'del', 2),
(7, 44, 'group', 'replydel', 2),
(8, 44, 'group', 'settop', 2),
(9, 44, 'group', 'setbest', 2),
(10, 44, 'group', 'setmemo', 2);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_cate_link`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_cate_link` (
  `user_id` int(11) NOT NULL,
  `cate_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_user_cate_link`
--

INSERT INTO `fanwe_user_cate_link` (`user_id`, `cate_id`) VALUES
(44, 1),
(44, 2),
(44, 3),
(44, 4),
(44, 5),
(44, 6),
(44, 7);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_consignee`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_consignee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `region_lv1` int(11) NOT NULL,
  `region_lv2` int(11) NOT NULL,
  `region_lv3` int(11) NOT NULL,
  `region_lv4` int(11) NOT NULL,
  `address` text NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `consignee` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- 转存表中的数据 `fanwe_user_consignee`
--

INSERT INTO `fanwe_user_consignee` (`id`, `user_id`, `region_lv1`, `region_lv2`, `region_lv3`, `region_lv4`, `address`, `mobile`, `zip`, `consignee`) VALUES
(18, 41, 1, 4, 53, 519, '福州博美诗邦', '99999999', '350000', '方维');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_extend`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_extend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=85 ;

--
-- 转存表中的数据 `fanwe_user_extend`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_field`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(255) NOT NULL,
  `field_show_name` varchar(255) NOT NULL,
  `input_type` tinyint(1) NOT NULL,
  `value_scope` text NOT NULL,
  `is_must` tinyint(1) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unk_field_name` (`field_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `fanwe_user_field`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_focus`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_focus` (
  `focus_user_id` int(11) NOT NULL COMMENT '关注人ID',
  `focused_user_id` int(11) NOT NULL COMMENT '被关注人ID',
  `focus_user_name` varchar(255) NOT NULL,
  `focused_user_name` varchar(255) NOT NULL,
  PRIMARY KEY (`focus_user_id`,`focused_user_id`),
  KEY `focus_user_id` (`focus_user_id`),
  KEY `focused_user_id` (`focused_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_user_focus`
--

INSERT INTO `fanwe_user_focus` (`focus_user_id`, `focused_user_id`, `focus_user_name`, `focused_user_name`) VALUES
(42, 41, 'fz云淡风轻', 'fanwe'),
(45, 44, 'fz云淡风轻', 'fanwe'),
(46, 44, 'fzmatthew', 'fanwe'),
(46, 45, 'fzmatthew', 'fz云淡风轻'),
(47, 44, '方维o2o', 'fanwe'),
(47, 45, '方维o2o', 'fz云淡风轻'),
(47, 46, '方维o2o', 'fzmatthew'),
(45, 46, 'fz云淡风轻', 'fzmatthew');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_frequented`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_frequented` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT '员会ID',
  `title` varchar(50) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `xpoint` float(12,6) DEFAULT '0.000000' COMMENT 'longitude',
  `ypoint` float(12,6) DEFAULT '0.000000' COMMENT 'latitude',
  `latitude_top` float(12,6) DEFAULT NULL,
  `latitude_bottom` float(12,6) DEFAULT NULL,
  `longitude_left` float(12,6) DEFAULT NULL,
  `longitude_right` float(12,6) DEFAULT NULL,
  `zoom_level` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `fanwe_user_frequented`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_group`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `score` int(11) NOT NULL,
  `discount` double(20,4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `fanwe_user_group`
--

INSERT INTO `fanwe_user_group` (`id`, `name`, `score`, `discount`) VALUES
(1, '普通会员', 0, 1.0000);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_level`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `point` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unk` (`point`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `fanwe_user_level`
--

INSERT INTO `fanwe_user_level` (`id`, `name`, `point`) VALUES
(1, '新手上路', 0),
(2, '初入江湖', 100);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_log`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_info` text NOT NULL,
  `log_time` int(11) NOT NULL,
  `log_admin_id` int(11) NOT NULL,
  `log_user_id` int(11) NOT NULL,
  `money` double(20,4) NOT NULL,
  `score` int(11) NOT NULL,
  `point` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=85 ;

--
-- 转存表中的数据 `fanwe_user_log`
--

INSERT INTO `fanwe_user_log` (`id`, `log_info`, `log_time`, `log_admin_id`, `log_user_id`, `money`, `score`, `point`, `user_id`) VALUES
(67, '2012010202245833订单返积分', 1325456714, 1, 0, 0.0000, 300, 0, 41),
(68, '图片很美分享被置顶', 1331937858, 1, 0, 0.0000, 0, 10, 44),
(69, '发表了一则分享', 1331938079, 1, 0, 0.0000, 0, 10, 44),
(70, '发表了一则分享', 1331938195, 1, 0, 0.0000, 0, 10, 46),
(71, '喜欢了一则分享', 1331938209, 1, 0, 0.0000, 0, 10, 46),
(72, '发表了一则分享', 1331938361, 1, 0, 0.0000, 0, 10, 44),
(73, '发表了一则分享', 1331938417, 1, 0, 0.0000, 0, 10, 44),
(74, '发表了一则分享', 1331938485, 1, 0, 0.0000, 0, 10, 44),
(75, '发表了一则分享', 1331938803, 1, 0, 0.0000, 0, 10, 44),
(76, '发表了一则分享', 1331938904, 1, 0, 0.0000, 0, 10, 44),
(77, '发表了一则分享', 1331938957, 1, 0, 0.0000, 0, 10, 44),
(78, '发表了一则分享', 1331939026, 1, 0, 0.0000, 0, 10, 44),
(79, '发表了一则分享', 1331939071, 1, 0, 0.0000, 0, 10, 44),
(80, '发表了一则分享', 1331939121, 1, 0, 0.0000, 0, 10, 44),
(81, '您在2012-03-17 15:06:18签到成功', 1331939178, 1, 0, 0.0000, 0, 10, 44),
(82, '发表了一则商户点评', 1333241498, 1, 0, 0.0000, 0, 10, 44),
(83, '发表了一则商户点评', 1333241553, 1, 0, 0.0000, 0, 10, 44),
(84, '发表了一则商户点评', 1333241576, 1, 0, 0.0000, 0, 10, 44);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_medal`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_medal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `medal_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `create_time` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `icon` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `fanwe_user_medal`
--

INSERT INTO `fanwe_user_medal` (`id`, `user_id`, `medal_id`, `name`, `create_time`, `is_delete`, `icon`) VALUES
(1, 44, 1, '组长勋章', 1331939602, 0, './public/attachment/201203/17/15/4f6438e27aa65.png');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_sign_log`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_sign_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `sign_date` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `fanwe_user_sign_log`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_topic_group`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_topic_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '0:普通组员 1:管理员',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unk` (`group_id`,`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `fanwe_user_topic_group`
--

INSERT INTO `fanwe_user_topic_group` (`id`, `group_id`, `user_id`, `create_time`, `type`) VALUES
(1, 2, 46, 1331938112, 0),
(2, 1, 46, 1331938120, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_x_y_point`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_x_y_point` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `xpoint` float(14,6) NOT NULL DEFAULT '0.000000',
  `ypoint` float(14,6) NOT NULL DEFAULT '0.000000',
  `locate_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `fanwe_user_x_y_point`
--

INSERT INTO `fanwe_user_x_y_point` (`id`, `uid`, `xpoint`, `ypoint`, `locate_time`) VALUES
(1, 44, 119.306938, 26.069746, 1330712776);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_vote`
--

CREATE TABLE IF NOT EXISTS `fanwe_vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `begin_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `sort` int(11) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `fanwe_vote`
--

INSERT INTO `fanwe_vote` (`id`, `name`, `begin_time`, `end_time`, `is_effect`, `sort`, `description`) VALUES
(4, '您从哪知道我们的系统', 0, 0, 1, 1, '您从哪知道我们的系统');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_vote_ask`
--

CREATE TABLE IF NOT EXISTS `fanwe_vote_ask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `sort` int(11) NOT NULL,
  `vote_id` int(11) NOT NULL,
  `val_scope` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `fanwe_vote_ask`
--

INSERT INTO `fanwe_vote_ask` (`id`, `name`, `type`, `sort`, `vote_id`, `val_scope`) VALUES
(13, '报纸', 1, 0, 4, '报纸1,报纸2,报纸3'),
(12, '网站', 1, 0, 4, '网站1,网站2,网站3');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_vote_result`
--

CREATE TABLE IF NOT EXISTS `fanwe_vote_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `count` int(11) NOT NULL,
  `vote_id` int(11) NOT NULL,
  `vote_ask_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `fanwe_vote_result`
--


-- --------------------------------------------------------

--
-- 表的结构 `fanwe_weight_unit`
--

CREATE TABLE IF NOT EXISTS `fanwe_weight_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `rate` decimal(20,4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `fanwe_weight_unit`
--

INSERT INTO `fanwe_weight_unit` (`id`, `name`, `rate`) VALUES
(1, '克', 1.0000);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_youhui`
--

CREATE TABLE IF NOT EXISTS `fanwe_youhui` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `deal_cate_id` int(11) NOT NULL,
  `begin_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `send_type` tinyint(1) NOT NULL COMMENT '0:普通券 1:验证券 2:需预订验证券',
  `total_num` int(11) NOT NULL COMMENT '总条数',
  `sms_count` int(11) NOT NULL,
  `print_count` int(11) NOT NULL,
  `view_count` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `sms_content` varchar(255) NOT NULL,
  `is_sms` tinyint(1) NOT NULL,
  `is_print` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否打印:1不允许;0:允许',
  `brief` text NOT NULL COMMENT '简介',
  `youhui_type` tinyint(1) NOT NULL COMMENT '减免0/折扣1',
  `total_fee` int(11) NOT NULL,
  `deal_cate_match_row` text NOT NULL,
  `deal_cate_match` text NOT NULL,
  `locate_match_row` text NOT NULL,
  `locate_match` text NOT NULL,
  `name_match_row` text NOT NULL,
  `name_match` text NOT NULL,
  `xpoint` varchar(255) NOT NULL,
  `ypoint` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '用户发布的',
  `supplier_id` int(11) NOT NULL COMMENT '商户',
  `create_time` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `pub_by` tinyint(1) NOT NULL COMMENT '0:管理员 1:会员 2:商家',
  `is_recommend` tinyint(1) NOT NULL,
  `list_brief` text NOT NULL,
  `use_notice` text NOT NULL,
  `description` text NOT NULL,
  `index_img` varchar(255) NOT NULL,
  `image_3` varchar(255) NOT NULL,
  `image_3_w` int(11) NOT NULL,
  `image_3_h` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `publish_wait` tinyint(1) NOT NULL,
  `return_money` decimal(11,4) NOT NULL,
  `return_score` int(11) NOT NULL,
  `return_point` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`),
  KEY `cate_id` (`deal_cate_id`) USING BTREE,
  FULLTEXT KEY `f_t` (`deal_cate_match`,`name_match`,`locate_match`),
  FULLTEXT KEY `cate_match` (`deal_cate_match`),
  FULLTEXT KEY `name_match` (`name_match`),
  FULLTEXT KEY `locate_match` (`locate_match`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- 转存表中的数据 `fanwe_youhui`
--

INSERT INTO `fanwe_youhui` (`id`, `name`, `icon`, `image`, `deal_cate_id`, `begin_time`, `end_time`, `city_id`, `send_type`, `total_num`, `sms_count`, `print_count`, `view_count`, `sort`, `is_effect`, `sms_content`, `is_sms`, `is_print`, `brief`, `youhui_type`, `total_fee`, `deal_cate_match_row`, `deal_cate_match`, `locate_match_row`, `locate_match`, `name_match_row`, `name_match`, `xpoint`, `ypoint`, `user_id`, `supplier_id`, `create_time`, `brand_id`, `pub_by`, `is_recommend`, `list_brief`, `use_notice`, `description`, `index_img`, `image_3`, `image_3_w`, `image_3_h`, `address`, `publish_wait`, `return_money`, `return_score`, `return_point`) VALUES
(19, '凡塔斯15元优惠券', './public/attachment/201411/21/22/546f4ac878396.jpg', './public/attachment/201411/21/22/546f4ad1a4c95.jpg', 8, 0, 0, 1, 0, 999, 0, 1, 15, 1, 1, '凡塔斯15元优惠券', 1, 1, '凡塔斯15元优惠券凡塔斯15元优惠券凡塔斯15元优惠券凡塔斯15元优惠券', 0, 0, '餐饮美食,日本料理', 'ux39184ux39278ux32654ux39135,ux26085ux26412ux26009ux29702', '全国', 'ux20840ux22269', '塔斯,优惠券,凡塔斯15元优惠券', 'ux22612ux26031,ux20248ux24800ux21048,ux20961ux22612ux26031ux49ux53ux20803ux20248ux24800ux21048', '', '', 0, 0, 1416551168, 0, 0, 0, '凡塔斯15元优惠券凡塔斯15元优惠券凡塔斯15元优惠券凡塔斯15元优惠券', '<span style="color:#404040;font-family:arial, 宋体, verdana;text-align:center;">凡塔斯15元优惠券凡塔斯15元优惠券凡塔斯15元优惠券凡塔斯15元优惠券</span><span style="color:#404040;font-family:arial, 宋体, verdana;text-align:center;">凡塔斯15元优惠券凡塔斯15元优惠券凡塔斯15元优惠券凡塔斯15元优惠券</span><span style="color:#404040;font-family:arial, 宋体, verdana;text-align:center;">凡塔斯15元优惠券凡塔斯15元优惠券凡塔斯15元优惠券凡塔斯15元优惠券</span>', '<span style="color:#404040;font-family:arial, 宋体, verdana;text-align:center;">凡塔斯15元优惠券凡塔斯15元优惠券凡塔斯15元优惠券凡塔斯15元优惠券</span><span style="color:#404040;font-family:arial, 宋体, verdana;text-align:center;">凡塔斯15元优惠券凡塔斯15元优惠券凡塔斯15元优惠券凡塔斯15元优惠券<img src="./public/attachment/201411/21/22/546f4ad1a4c95.jpg" alt="" border="0" /></span>', '', './public/attachment/201411/21/22/546f4ada9baa0.jpg', 150, 110, '', 0, 0.0000, 0, 0),
(20, '年年大丰收4月', './public/attachment/201411/21/22/546f4c09c7d00.jpg', './public/attachment/201411/21/22/546f4c1b98f48.jpg', 9, 0, 0, 1, 0, 999, 1, 0, 9, 2, 1, '年年大丰收4月年年大丰收4月', 1, 1, '年年大丰收4月年年大丰收4月', 1, 0, '休闲娱乐,KTV', 'ux20241ux38386ux23089ux20048,ux75ux84ux86', '全国', 'ux20840ux22269', '丰收,年年,年年大丰收4月', 'ux20016ux25910,ux24180ux24180,ux24180ux24180ux22823ux20016ux25910ux52ux26376', '', '', 0, 0, 1416551371, 0, 0, 0, '年年大丰收4月年年大丰收4月年年大丰收4月', '<span style="color:#666666;font-family:微软雅黑;font-size:16px;font-weight:bold;line-height:26px;text-align:center;">年年大丰收4月</span><span style="color:#666666;font-family:微软雅黑;font-size:16px;font-weight:bold;line-height:26px;text-align:center;">年年大丰收4月</span><span style="color:#666666;font-family:微软雅黑;font-size:16px;font-weight:bold;line-height:26px;text-align:center;">年年大丰收4月</span><span style="color:#666666;font-family:微软雅黑;font-size:16px;font-weight:bold;line-height:26px;text-align:center;">年年大丰收4月</span><span style="color:#666666;font-family:微软雅黑;font-size:16px;font-weight:bold;line-height:26px;text-align:center;">年年大丰收4月</span><span style="color:#666666;font-family:微软雅黑;font-size:16px;font-weight:bold;line-height:26px;text-align:center;">年年大丰收4月</span><span style="color:#666666;font-family:微软雅黑;font-size:16px;font-weight:bold;line-height:26px;text-align:center;">年年大丰收4月</span><span style="color:#666666;font-family:微软雅黑;font-size:16px;font-weight:bold;line-height:26px;text-align:center;">年年大丰收4月</span><span style="color:#666666;font-family:微软雅黑;font-size:16px;font-weight:bold;line-height:26px;text-align:center;">年年大丰收4月</span><span style="color:#666666;font-family:微软雅黑;font-size:16px;font-weight:bold;line-height:26px;text-align:center;">年年大丰收4月</span>', '<span style="color:#666666;font-family:微软雅黑;font-size:16px;font-weight:bold;line-height:26px;text-align:center;">年年大丰收4月</span><span style="color:#666666;font-family:微软雅黑;font-size:16px;font-weight:bold;line-height:26px;text-align:center;">年年大丰收4月</span><span style="color:#666666;font-family:微软雅黑;font-size:16px;font-weight:bold;line-height:26px;text-align:center;">年年大丰收4月</span><span style="color:#666666;font-family:微软雅黑;font-size:16px;font-weight:bold;line-height:26px;text-align:center;">年年大丰收4月</span><span style="color:#666666;font-family:微软雅黑;font-size:16px;font-weight:bold;line-height:26px;text-align:center;">年年大丰收4月</span><span style="color:#666666;font-family:微软雅黑;font-size:16px;font-weight:bold;line-height:26px;text-align:center;">年年大丰收4月</span><span style="color:#666666;font-family:微软雅黑;font-size:16px;font-weight:bold;line-height:26px;text-align:center;">年年大丰收4月</span><span style="color:#666666;font-family:微软雅黑;font-size:16px;font-weight:bold;line-height:26px;text-align:center;">年年大丰收4月</span><span style="color:#666666;font-family:微软雅黑;font-size:16px;font-weight:bold;line-height:26px;text-align:center;">年年大丰收4月</span><span style="color:#666666;font-family:微软雅黑;font-size:16px;font-weight:bold;line-height:26px;text-align:center;">年年大丰收4月</span><span style="color:#666666;font-family:微软雅黑;font-size:16px;font-weight:bold;line-height:26px;text-align:center;">年年大丰收4月</span><span style="color:#666666;font-family:微软雅黑;font-size:16px;font-weight:bold;line-height:26px;text-align:center;">年年大丰收4月</span><span style="color:#666666;font-family:微软雅黑;font-size:16px;font-weight:bold;line-height:26px;text-align:center;">年年大丰收4月</span><span style="color:#666666;font-family:微软雅黑;font-size:16px;font-weight:bold;line-height:26px;text-align:center;">年年大丰收4月</span><span style="color:#666666;font-family:微软雅黑;font-size:16px;font-weight:bold;line-height:26px;text-align:center;">年年大丰收4月<img src="./public/attachment/201411/21/22/546f4c1b98f48.jpg" alt="" border="0" /></span>', '', './public/attachment/201411/21/22/546f4c09c7d00.jpg', 150, 110, '', 0, 0.0000, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_youhui_location_link`
--

CREATE TABLE IF NOT EXISTS `fanwe_youhui_location_link` (
  `youhui_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`youhui_id`,`location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_youhui_location_link`
--

INSERT INTO `fanwe_youhui_location_link` (`youhui_id`, `location_id`) VALUES
(12, 19),
(13, 20),
(14, 18),
(15, 14),
(16, 18),
(17, 18),
(18, 18);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_youhui_log`
--

CREATE TABLE IF NOT EXISTS `fanwe_youhui_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `youhui_id` int(11) NOT NULL,
  `youhui_sn` varchar(255) NOT NULL COMMENT '短信生成的优惠券序列号',
  `user_id` int(11) NOT NULL,
  `order_count` int(5) NOT NULL COMMENT '订餐人数',
  `is_private_room` tinyint(1) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `date_time` int(11) NOT NULL COMMENT '预订时间',
  `confirm_id` int(11) NOT NULL,
  `total_fee` int(11) NOT NULL COMMENT '消费金额',
  `create_time` int(11) NOT NULL,
  `confirm_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`youhui_sn`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=53 ;

--
-- 转存表中的数据 `fanwe_youhui_log`
--

INSERT INTO `fanwe_youhui_log` (`id`, `youhui_id`, `youhui_sn`, `user_id`, `order_count`, `is_private_room`, `mobile`, `date_time`, `confirm_id`, `total_fee`, `create_time`, `confirm_time`) VALUES
(52, 20, '27871901', 44, 1, 0, '', 0, 0, 0, 1416591402, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_youhui_sc`
--

CREATE TABLE IF NOT EXISTS `fanwe_youhui_sc` (
  `uid` int(11) NOT NULL,
  `youhui_id` int(11) NOT NULL,
  PRIMARY KEY (`uid`,`youhui_id`),
  UNIQUE KEY `inx_youhui_sc` (`uid`,`youhui_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_youhui_sc`
--

