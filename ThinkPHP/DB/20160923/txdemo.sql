/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : txdemo

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2016-09-23 14:10:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for gwshop_active
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_active`;
CREATE TABLE `gwshop_active` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '活动配置表',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '活动类型',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `end_time` varchar(20) DEFAULT '' COMMENT '活动结束时间',
  `note` varchar(100) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gwshop_active
-- ----------------------------
INSERT INTO `gwshop_active` VALUES ('1', 'limit_goods', '1', '2016-09-29 23:59', '限时抢购结束时间');
INSERT INTO `gwshop_active` VALUES ('2', 'order_cancel', '1', '1800', '订单自动取消秒');

-- ----------------------------
-- Table structure for gwshop_ad
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_ad`;
CREATE TABLE `gwshop_ad` (
  `ad_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '广告位置ID',
  `media_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '广告类型',
  `ad_name` varchar(60) NOT NULL DEFAULT '' COMMENT '广告名称',
  `ad_link` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `ad_code` text NOT NULL COMMENT '图片地址',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '投放时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `link_man` varchar(60) NOT NULL DEFAULT '' COMMENT '添加人',
  `link_email` varchar(60) NOT NULL DEFAULT '' COMMENT '添加人邮箱',
  `link_phone` varchar(60) NOT NULL DEFAULT '' COMMENT '添加人联系电话',
  `click_count` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '点击量',
  `enabled` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `orderby` smallint(6) DEFAULT '50' COMMENT '排序',
  `target` tinyint(1) DEFAULT '0' COMMENT '是否开启浏览器新窗口',
  `bgcolor` varchar(20) DEFAULT NULL COMMENT '背景颜色',
  PRIMARY KEY (`ad_id`),
  KEY `enabled` (`enabled`),
  KEY `position_id` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gwshop_ad
-- ----------------------------
INSERT INTO `gwshop_ad` VALUES ('1', '1', '0', 'aaa', 'http://m.baidu.com', '/Public/upload/ad/2016/07-14/5786e8c742d95.jpg', '-28800', '-28800', '', '', '', '0', '1', '50', '0', '#000000');
INSERT INTO `gwshop_ad` VALUES ('2', '1', '0', 'bbb', '', '/Public/upload/ad/2016/07-14/5786e8fe19cbe.jpg', '-28800', '-28800', '', '', '', '0', '1', '50', '0', '#000000');
INSERT INTO `gwshop_ad` VALUES ('3', '1', '0', 'ccc', 'http://m.baidu.com', '/Public/upload/ad/2016/07-14/5786e8c742d95.jpg', '-28800', '-28800', '', '', '', '0', '1', '50', '0', '#000000');

-- ----------------------------
-- Table structure for gwshop_admin
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_admin`;
CREATE TABLE `gwshop_admin` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员编号',
  `user_name` varchar(60) NOT NULL COMMENT '用户名',
  `email` varchar(60) NOT NULL COMMENT '邮箱',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `last_login` int(11) NOT NULL DEFAULT '0' COMMENT '最后一次登录时间',
  `last_ip` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次登录ip',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态：0正常，1禁用',
  `role_id` smallint(5) NOT NULL DEFAULT '0' COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='管理员信息';

-- ----------------------------
-- Records of gwshop_admin
-- ----------------------------
INSERT INTO `gwshop_admin` VALUES ('1', 'admin', 'admin@qq.com', '1ec6c02ecd57e229429739a521ac6bfa', '2016', '1474609326', '127', '1', '1');
INSERT INTO `gwshop_admin` VALUES ('2', 'wubuze', '18650306103@qq.com', '14e1b600b1fd579f47433b88e8d85291', '0', '1472092112', '59', '0', '3');
INSERT INTO `gwshop_admin` VALUES ('3', 'user', 'user@qq.com', '14e1b600b1fd579f47433b88e8d85291', '1470204585', '1470210435', '127', '0', '3');
INSERT INTO `gwshop_admin` VALUES ('4', 'admin2', 'wubuze@qq.com', '14e1b600b1fd579f47433b88e8d85291', '1470210525', '1470210797', '127', '0', '1');
INSERT INTO `gwshop_admin` VALUES ('5', 'hyw', 'asdfa', '14e1b600b1fd579f47433b88e8d85291', '1470211469', '1470796337', '127', '0', '1');

-- ----------------------------
-- Table structure for gwshop_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_admin_log`;
CREATE TABLE `gwshop_admin_log` (
  `log_id` bigint(16) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `admin_id` int(10) DEFAULT NULL COMMENT '管理员id',
  `log_info` varchar(255) DEFAULT NULL COMMENT '日志描述',
  `log_ip` varchar(30) DEFAULT NULL COMMENT 'ip地址',
  `log_url` varchar(50) DEFAULT NULL COMMENT 'url',
  `log_time` int(10) DEFAULT NULL COMMENT '日志时间',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gwshop_admin_log
-- ----------------------------
INSERT INTO `gwshop_admin_log` VALUES ('1', '1', '管理角色', '127.0.0.1', '/index.php/Admin/Admin/roleSave', '1470196976');
INSERT INTO `gwshop_admin_log` VALUES ('2', '1', '管理角色', '127.0.0.1', '/index.php/Admin/Admin/roleSave', '1470197342');
INSERT INTO `gwshop_admin_log` VALUES ('3', '3', '后台登录', '127.0.0.1', '/index.php/Admin/Login/login', '1470205223');
INSERT INTO `gwshop_admin_log` VALUES ('4', '1', '管理角色', '127.0.0.1', '/index.php/Admin/Admin/roleSave', '1470207073');
INSERT INTO `gwshop_admin_log` VALUES ('5', '1', '管理角色', '127.0.0.1', '/index.php/Admin/Admin/roleSave', '1470207089');
INSERT INTO `gwshop_admin_log` VALUES ('6', '1', '管理角色', '127.0.0.1', '/index.php/Admin/Admin/roleSave', '1470207121');
INSERT INTO `gwshop_admin_log` VALUES ('7', null, '后台登录', '127.0.0.1', '/index.php/Admin/Login/login', '1470208325');
INSERT INTO `gwshop_admin_log` VALUES ('8', null, '后台登录', '127.0.0.1', '/index.php/Admin/Login/login', '1470208383');
INSERT INTO `gwshop_admin_log` VALUES ('9', null, '后台登录', '127.0.0.1', '/index.php/Admin/Login/login', '1470208426');
INSERT INTO `gwshop_admin_log` VALUES ('10', null, '后台登录', '127.0.0.1', '/index.php/Admin/Login/login', '1470208454');
INSERT INTO `gwshop_admin_log` VALUES ('11', null, '后台登录', '127.0.0.1', '/index.php/Admin/Login/login', '1470208586');
INSERT INTO `gwshop_admin_log` VALUES ('12', null, '后台登录', '127.0.0.1', '/index.php/Admin/Login/login', '1470208778');
INSERT INTO `gwshop_admin_log` VALUES ('13', null, '后台登录', '127.0.0.1', '/index.php/Admin/Login/login', '1470208806');
INSERT INTO `gwshop_admin_log` VALUES ('14', null, '后台登录', '127.0.0.1', '/index.php/Admin/Login/login', '1470208944');
INSERT INTO `gwshop_admin_log` VALUES ('15', null, '后台登录', '127.0.0.1', '/index.php/Admin/Login/login', '1470208989');
INSERT INTO `gwshop_admin_log` VALUES ('16', null, '后台登录', '127.0.0.1', '/index.php/Admin/Login/login', '1470209006');
INSERT INTO `gwshop_admin_log` VALUES ('17', null, '后台登录', '127.0.0.1', '/index.php/Admin/Login/login', '1470209375');
INSERT INTO `gwshop_admin_log` VALUES ('18', null, '后台登录', '127.0.0.1', '/index.php/Admin/Login/login', '1470209386');
INSERT INTO `gwshop_admin_log` VALUES ('19', '1', '后台登录', '127.0.0.1', '/index.php/Admin/Login/login', '1470209496');
INSERT INTO `gwshop_admin_log` VALUES ('20', null, '后台登录', '127.0.0.1', '/index.php/Admin/Login/login', '1470209697');
INSERT INTO `gwshop_admin_log` VALUES ('21', '1', '后台登录', '127.0.0.1', '/index.php/Admin/Login/login', '1470209713');
INSERT INTO `gwshop_admin_log` VALUES ('22', '1', '后台登录', '127.0.0.1', '/index.php/Admin/Login/login', '1470210042');
INSERT INTO `gwshop_admin_log` VALUES ('23', '3', '后台登录', '127.0.0.1', '/index.php/Admin/Login/login', '1470210435');
INSERT INTO `gwshop_admin_log` VALUES ('24', '4', '后台登录', '127.0.0.1', '/index.php/Admin/Login/login', '1470210537');
INSERT INTO `gwshop_admin_log` VALUES ('25', '4', '后台登录', '127.0.0.1', '/index.php/Admin/Login/login', '1470210797');
INSERT INTO `gwshop_admin_log` VALUES ('26', '4', '管理角色', '127.0.0.1', '/index.php/Admin/Admin/roleSave', '1470210874');
INSERT INTO `gwshop_admin_log` VALUES ('27', '2', '后台登录', '127.0.0.1', '/index.php/Admin/Login/login', '1470210888');
INSERT INTO `gwshop_admin_log` VALUES ('28', '4', '管理角色', '127.0.0.1', '/index.php/Admin/Admin/roleSave', '1470210977');
INSERT INTO `gwshop_admin_log` VALUES ('29', '4', '管理角色', '127.0.0.1', '/index.php/Admin/Admin/roleSave', '1470211026');
INSERT INTO `gwshop_admin_log` VALUES ('30', '4', '管理角色', '127.0.0.1', '/index.php/Admin/Admin/roleSave', '1470211068');
INSERT INTO `gwshop_admin_log` VALUES ('31', '4', '管理角色', '127.0.0.1', '/index.php/Admin/Admin/roleSave', '1470211108');
INSERT INTO `gwshop_admin_log` VALUES ('32', '4', '管理角色', '127.0.0.1', '/index.php/Admin/Admin/roleSave', '1470211152');
INSERT INTO `gwshop_admin_log` VALUES ('33', '4', '管理角色', '127.0.0.1', '/index.php/Admin/Admin/roleSave', '1470211181');
INSERT INTO `gwshop_admin_log` VALUES ('34', '2', '后台登录', '127.0.0.1', '/index.php/Admin/Login/login', '1470211226');
INSERT INTO `gwshop_admin_log` VALUES ('35', '4', '管理角色', '127.0.0.1', '/index.php/Admin/Admin/roleSave', '1470211375');
INSERT INTO `gwshop_admin_log` VALUES ('36', '2', '后台登录', '127.0.0.1', '/index.php/Admin/Login/login', '1470211418');
INSERT INTO `gwshop_admin_log` VALUES ('37', '2', '后台登录', '127.0.0.1', '/index.php/Admin/Login/login', '1470211720');
INSERT INTO `gwshop_admin_log` VALUES ('38', '2', '后台登录', '127.0.0.1', '/index.php/Admin/Login/login', '1470218009');
INSERT INTO `gwshop_admin_log` VALUES ('39', '1', '后台登录', '127.0.0.1', '/index.php/Admin/Login/login', '1470299699');
INSERT INTO `gwshop_admin_log` VALUES ('40', '1', '后台登录', '127.0.0.1', '/index.php/Admin/Login/login', '1470300571');
INSERT INTO `gwshop_admin_log` VALUES ('41', '1', '后台登录', '127.0.0.1', '/index.php/Admin/Login/login', '1470366582');
INSERT INTO `gwshop_admin_log` VALUES ('42', '1', '后台登录', '127.0.0.1', '/index.php/Admin/Login/login', '1470465935');
INSERT INTO `gwshop_admin_log` VALUES ('43', '1', '后台登录', '127.0.0.1', '/index.php/Admin/Login/login', '1470621550');
INSERT INTO `gwshop_admin_log` VALUES ('44', '1', '后台登录', '127.0.0.1', '/index.php/Admin/Login/login', '1470728737');
INSERT INTO `gwshop_admin_log` VALUES ('45', '1', '后台登录', '127.0.0.1', '/index.php/Admin/Login/login', '1470795962');
INSERT INTO `gwshop_admin_log` VALUES ('46', '5', '后台登录', '127.0.0.1', '/index.php/Admin/Login/login', '1470796337');
INSERT INTO `gwshop_admin_log` VALUES ('47', '1', '后台登录', '127.0.0.1', '/index.php/Admin/Login/login', '1470813991');
INSERT INTO `gwshop_admin_log` VALUES ('48', '1', '后台登录', '175.42.2.55', '/index.php/Admin/Login/login', '1470828552');
INSERT INTO `gwshop_admin_log` VALUES ('49', null, '后台登录', '175.42.2.55', '/index.php/Admin/Login/login', '1470883447');
INSERT INTO `gwshop_admin_log` VALUES ('50', null, '后台登录', '175.42.2.55', '/index.php/Admin/Login/login', '1470883450');
INSERT INTO `gwshop_admin_log` VALUES ('51', null, '后台登录', '175.42.2.55', '/index.php/Admin/Login/login', '1470883460');
INSERT INTO `gwshop_admin_log` VALUES ('52', '1', '后台登录', '175.42.2.55', '/index.php/Admin/Login/login', '1470886011');
INSERT INTO `gwshop_admin_log` VALUES ('53', '1', '后台登录', '59.56.44.93', '/index.php/Admin/Login/login', '1470886055');
INSERT INTO `gwshop_admin_log` VALUES ('54', '1', '后台登录', '59.56.44.93', '/index.php/Admin/Login/login', '1470886443');
INSERT INTO `gwshop_admin_log` VALUES ('55', '1', '后台登录', '59.56.44.93', '/index.php/Admin/Login/login', '1470886507');
INSERT INTO `gwshop_admin_log` VALUES ('56', '1', '后台登录', '59.56.44.93', '/index.php/Admin/Login/login', '1470886930');
INSERT INTO `gwshop_admin_log` VALUES ('57', '1', '后台登录', '218.106.145.21', '/index.php/Admin/Login/login', '1470887445');
INSERT INTO `gwshop_admin_log` VALUES ('58', '1', '后台登录', '175.42.2.55', '/index.php/Admin/Login/login', '1470887475');
INSERT INTO `gwshop_admin_log` VALUES ('59', '1', '后台登录', '175.42.2.55', '/index.php/Admin/Login/login', '1470918632');
INSERT INTO `gwshop_admin_log` VALUES ('60', '1', '后台登录', '59.56.44.93', '/index.php/Admin/Login/login', '1470965109');
INSERT INTO `gwshop_admin_log` VALUES ('61', '1', '后台登录', '59.56.44.93', '/index.php/Admin/Login/login', '1470990615');
INSERT INTO `gwshop_admin_log` VALUES ('62', '1', '后台登录', '59.56.44.93', '/index.php/Admin/Login/login', '1471054446');
INSERT INTO `gwshop_admin_log` VALUES ('63', null, '后台登录', '59.56.44.93', '/index.php/Admin/Login/login', '1471054648');
INSERT INTO `gwshop_admin_log` VALUES ('64', '1', '后台登录', '59.56.44.93', '/index.php/Admin/Login/login', '1471054680');
INSERT INTO `gwshop_admin_log` VALUES ('65', '1', '后台登录', '59.56.44.93', '/index.php/Admin/Login/login', '1471058250');
INSERT INTO `gwshop_admin_log` VALUES ('66', null, '后台登录', '59.56.44.93', '/index.php/Admin/Login/login', '1471058362');
INSERT INTO `gwshop_admin_log` VALUES ('67', '1', '后台登录', '59.56.44.93', '/index.php/Admin/Login/login', '1471058371');
INSERT INTO `gwshop_admin_log` VALUES ('68', '1', '后台登录', '59.56.44.93', '/index.php/Admin/Login/login', '1471061916');
INSERT INTO `gwshop_admin_log` VALUES ('69', '1', '后台登录', '59.56.44.93', '/index.php/Admin/Login/login', '1471069802');
INSERT INTO `gwshop_admin_log` VALUES ('70', '1', '后台登录', '59.56.44.89', '/index.php/Admin/Login/login', '1471244027');
INSERT INTO `gwshop_admin_log` VALUES ('71', '1', '后台登录', '59.56.44.89', '/index.php/Admin/Login/login', '1471326318');
INSERT INTO `gwshop_admin_log` VALUES ('72', '1', '后台登录', '59.56.44.89', '/index.php/Admin/Login/login', '1471330728');
INSERT INTO `gwshop_admin_log` VALUES ('73', '1', '后台登录', '211.96.170.138', '/index.php/Admin/Login/login', '1471398775');
INSERT INTO `gwshop_admin_log` VALUES ('74', '1', '后台登录', '59.56.44.89', '/index.php/Admin/Login/login', '1471399736');
INSERT INTO `gwshop_admin_log` VALUES ('75', '1', '后台登录', '59.56.44.89', '/index.php/Admin/Login/login', '1471423354');
INSERT INTO `gwshop_admin_log` VALUES ('76', null, '后台登录', '59.56.44.89', '/index.php/Admin/Login/login', '1471507876');
INSERT INTO `gwshop_admin_log` VALUES ('77', '1', '后台登录', '59.56.44.89', '/index.php/Admin/Login/login', '1471507954');
INSERT INTO `gwshop_admin_log` VALUES ('78', '1', '后台登录', '61.154.15.151', '/index.php/Admin/Login/login', '1471846866');
INSERT INTO `gwshop_admin_log` VALUES ('79', '1', '后台登录', '61.154.15.151', '/index.php/Admin/Login/login', '1471847725');
INSERT INTO `gwshop_admin_log` VALUES ('80', '1', '后台登录', '61.154.15.151', '/index.php/Admin/Login/login', '1472017610');
INSERT INTO `gwshop_admin_log` VALUES ('81', '1', '后台登录', '59.61.185.51', '/index.php/Admin/Login/login', '1472089993');
INSERT INTO `gwshop_admin_log` VALUES ('82', '2', '后台登录', '59.61.185.51', '/index.php/Admin/Login/login', '1472092112');
INSERT INTO `gwshop_admin_log` VALUES ('83', '1', '后台登录', '61.154.15.199', '/index.php/Admin/Login/login', '1472695306');
INSERT INTO `gwshop_admin_log` VALUES ('84', '1', '后台登录', '61.154.15.199', '/index.php/Admin/Login/login', '1472709214');
INSERT INTO `gwshop_admin_log` VALUES ('85', '1', '后台登录', '61.154.15.199', '/index.php/Admin/Login/login', '1472711458');
INSERT INTO `gwshop_admin_log` VALUES ('86', null, '后台登录', '61.154.15.199', '/index.php/Admin/Login/login', '1472711966');
INSERT INTO `gwshop_admin_log` VALUES ('87', '1', '后台登录', '61.154.15.199', '/index.php/Admin/Login/login', '1472711977');
INSERT INTO `gwshop_admin_log` VALUES ('88', '1', '后台登录', '61.154.15.199', '/index.php/Admin/Login/login', '1472715942');
INSERT INTO `gwshop_admin_log` VALUES ('89', '1', '后台登录', '127.0.0.1', '/index.php/Admin/Login/login', '1473840798');
INSERT INTO `gwshop_admin_log` VALUES ('90', '1', '后台登录', '127.0.0.1', '/index.php/Admin/Login/login', '1473849828');
INSERT INTO `gwshop_admin_log` VALUES ('91', '1', '后台登录', '127.0.0.1', '/index.php/Admin/Login/login', '1473920711');
INSERT INTO `gwshop_admin_log` VALUES ('92', '1', '后台登录', '127.0.0.1', '/index.php/Admin/Login/login', '1474430408');
INSERT INTO `gwshop_admin_log` VALUES ('93', '1', '后台登录', '127.0.0.1', '/index.php/Admin/Login/login', '1474507569');
INSERT INTO `gwshop_admin_log` VALUES ('94', '1', '后台登录', '127.0.0.1', '/index.php/Admin/Login/login', '1474558415');
INSERT INTO `gwshop_admin_log` VALUES ('95', '1', '后台登录', '127.0.0.1', '/index.php/Admin/Login/login', '1474591625');
INSERT INTO `gwshop_admin_log` VALUES ('96', null, '后台登录', '127.0.0.1', '/index.php/Admin/Login/login', '1474596017');
INSERT INTO `gwshop_admin_log` VALUES ('97', '1', '后台登录', '127.0.0.1', '/index.php/Admin/Login/login', '1474596028');
INSERT INTO `gwshop_admin_log` VALUES ('98', '1', '后台登录', '127.0.0.1', '/index.php/Admin/Login/login', '1474609326');

-- ----------------------------
-- Table structure for gwshop_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_admin_role`;
CREATE TABLE `gwshop_admin_role` (
  `role_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) DEFAULT NULL COMMENT '角色名称',
  `act_list` text COMMENT '权限列表',
  `role_desc` varchar(255) DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gwshop_admin_role
-- ----------------------------
INSERT INTO `gwshop_admin_role` VALUES ('1', '超级管理员', 'all', '所有权限');
INSERT INTO `gwshop_admin_role` VALUES ('2', '编辑', '35,36,75,76,78,26,27,28,29,89,90,91,92,93,94,95,96,97,98,99,100', '编辑网站');
INSERT INTO `gwshop_admin_role` VALUES ('3', '客服', '19,20,23,35,36,75,76,78,24,25,43,50,59,62,101,102,103,104,105,106,107,143,144,146', '客服处理订单发货');

-- ----------------------------
-- Table structure for gwshop_ad_position
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_ad_position`;
CREATE TABLE `gwshop_ad_position` (
  `position_id` int(3) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `position_name` varchar(60) NOT NULL DEFAULT '' COMMENT '广告位置名称',
  `ad_width` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '广告位宽度',
  `ad_height` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '广告位高度',
  `position_desc` varchar(255) NOT NULL DEFAULT '' COMMENT '广告描述',
  `position_style` text NOT NULL COMMENT '模板',
  `is_open` tinyint(1) DEFAULT '0' COMMENT '0关闭1开启',
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gwshop_ad_position
-- ----------------------------
INSERT INTO `gwshop_ad_position` VALUES ('1', 'wap首页轮播', '0', '0', 'wap首页轮播', '', '1');
INSERT INTO `gwshop_ad_position` VALUES ('2', 'dfg ', '11', '70', '', '', '1');

-- ----------------------------
-- Table structure for gwshop_area_china
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_area_china`;
CREATE TABLE `gwshop_area_china` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户订单表',
  `type` smallint(1) DEFAULT '0',
  `name` varchar(30) DEFAULT '',
  `parent_id` int(11) DEFAULT '0' COMMENT '状态修改时间',
  `zip` varchar(11) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1032701 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gwshop_area_china
-- ----------------------------
INSERT INTO `gwshop_area_china` VALUES ('110000', '2', '北京', '1', '');
INSERT INTO `gwshop_area_china` VALUES ('110100', '3', '北京市', '110000', '100000');
INSERT INTO `gwshop_area_china` VALUES ('110101', '4', '东城区', '110100', '100010');
INSERT INTO `gwshop_area_china` VALUES ('110102', '4', '西城区', '110100', '100032');
INSERT INTO `gwshop_area_china` VALUES ('110103', '4', '崇文区', '110100', '100061');
INSERT INTO `gwshop_area_china` VALUES ('110104', '4', '宣武区', '110100', '100054');
INSERT INTO `gwshop_area_china` VALUES ('110105', '4', '朝阳区', '110100', '100011');
INSERT INTO `gwshop_area_china` VALUES ('110106', '4', '丰台区', '110100', '100071');
INSERT INTO `gwshop_area_china` VALUES ('110107', '4', '石景山区', '110100', '100071');
INSERT INTO `gwshop_area_china` VALUES ('110108', '4', '海淀区', '110100', '100091');
INSERT INTO `gwshop_area_china` VALUES ('110109', '4', '门头沟区', '110100', '102300');
INSERT INTO `gwshop_area_china` VALUES ('110111', '4', '房山区', '110100', '102488');
INSERT INTO `gwshop_area_china` VALUES ('110112', '4', '通州区', '110100', '101100');
INSERT INTO `gwshop_area_china` VALUES ('110113', '4', '顺义区', '110100', '101300');
INSERT INTO `gwshop_area_china` VALUES ('110114', '4', '昌平区', '110100', '102200');
INSERT INTO `gwshop_area_china` VALUES ('110115', '4', '大兴区', '110100', '102600');
INSERT INTO `gwshop_area_china` VALUES ('110116', '4', '怀柔区', '110100', '101400');
INSERT INTO `gwshop_area_china` VALUES ('110117', '4', '平谷区', '110100', '101200');
INSERT INTO `gwshop_area_china` VALUES ('110228', '4', '密云县', '110100', '101500');
INSERT INTO `gwshop_area_china` VALUES ('110229', '4', '延庆县', '110100', '102100');
INSERT INTO `gwshop_area_china` VALUES ('110230', '4', '其它区', '110100', '');
INSERT INTO `gwshop_area_china` VALUES ('120000', '2', '天津', '1', '');
INSERT INTO `gwshop_area_china` VALUES ('120100', '3', '天津市', '120000', '300000');
INSERT INTO `gwshop_area_china` VALUES ('120101', '4', '和平区', '120100', '300041');
INSERT INTO `gwshop_area_china` VALUES ('120102', '4', '河东区', '120100', '300171');
INSERT INTO `gwshop_area_china` VALUES ('120103', '4', '河西区', '120100', '300202');
INSERT INTO `gwshop_area_china` VALUES ('120104', '4', '南开区', '120100', '300100');
INSERT INTO `gwshop_area_china` VALUES ('120105', '4', '河北区', '120100', '300143');
INSERT INTO `gwshop_area_china` VALUES ('120106', '4', '红桥区', '120100', '300131');
INSERT INTO `gwshop_area_china` VALUES ('120107', '4', '塘沽区', '120100', '300450');
INSERT INTO `gwshop_area_china` VALUES ('120108', '4', '汉沽区', '120100', '300480');
INSERT INTO `gwshop_area_china` VALUES ('120109', '4', '大港区', '120100', '300270');
INSERT INTO `gwshop_area_china` VALUES ('120110', '4', '东丽区', '120100', '300300');
INSERT INTO `gwshop_area_china` VALUES ('120111', '4', '西青区', '120100', '300380');
INSERT INTO `gwshop_area_china` VALUES ('120112', '4', '津南区', '120100', '300350');
INSERT INTO `gwshop_area_china` VALUES ('120113', '4', '北辰区', '120100', '300400');
INSERT INTO `gwshop_area_china` VALUES ('120114', '4', '武清区', '120100', '301700');
INSERT INTO `gwshop_area_china` VALUES ('120115', '4', '宝坻区', '120100', '301800');
INSERT INTO `gwshop_area_china` VALUES ('120116', '4', '滨海新区', '120100', '300457');
INSERT INTO `gwshop_area_china` VALUES ('120221', '4', '宁河县', '120100', '301500');
INSERT INTO `gwshop_area_china` VALUES ('120223', '4', '静海县', '120100', '301600');
INSERT INTO `gwshop_area_china` VALUES ('120225', '4', '蓟县', '120100', '301900');
INSERT INTO `gwshop_area_china` VALUES ('120226', '4', '其它区', '120100', '');
INSERT INTO `gwshop_area_china` VALUES ('130000', '2', '河北省', '1', '');
INSERT INTO `gwshop_area_china` VALUES ('130100', '3', '石家庄市', '130000', '050000');
INSERT INTO `gwshop_area_china` VALUES ('130102', '4', '长安区', '130100', '050011');
INSERT INTO `gwshop_area_china` VALUES ('130103', '4', '桥东区', '130100', '050011');
INSERT INTO `gwshop_area_china` VALUES ('130104', '4', '桥西区', '130100', '050051');
INSERT INTO `gwshop_area_china` VALUES ('130105', '4', '新华区', '130100', '050051');
INSERT INTO `gwshop_area_china` VALUES ('130107', '4', '井陉矿区', '130100', '050100');
INSERT INTO `gwshop_area_china` VALUES ('130108', '4', '裕华区', '130100', '050081');
INSERT INTO `gwshop_area_china` VALUES ('130121', '4', '井陉县', '130100', '050300');
INSERT INTO `gwshop_area_china` VALUES ('130123', '4', '正定县', '130100', '050800');
INSERT INTO `gwshop_area_china` VALUES ('130124', '4', '栾城县', '130100', '051430');
INSERT INTO `gwshop_area_china` VALUES ('130125', '4', '行唐县', '130100', '050600');
INSERT INTO `gwshop_area_china` VALUES ('130126', '4', '灵寿县', '130100', '050500');
INSERT INTO `gwshop_area_china` VALUES ('130127', '4', '高邑县', '130100', '051330');
INSERT INTO `gwshop_area_china` VALUES ('130128', '4', '深泽县', '130100', '052560');
INSERT INTO `gwshop_area_china` VALUES ('130129', '4', '赞皇县', '130100', '051230');
INSERT INTO `gwshop_area_china` VALUES ('130130', '4', '无极县', '130100', '052460');
INSERT INTO `gwshop_area_china` VALUES ('130131', '4', '平山县', '130100', '050400');
INSERT INTO `gwshop_area_china` VALUES ('130132', '4', '元氏县', '130100', '051130');
INSERT INTO `gwshop_area_china` VALUES ('130133', '4', '赵县', '130100', '051530');
INSERT INTO `gwshop_area_china` VALUES ('130181', '4', '辛集市', '130100', '052360');
INSERT INTO `gwshop_area_china` VALUES ('130182', '4', '藁城市', '130100', '052160');
INSERT INTO `gwshop_area_china` VALUES ('130183', '4', '晋州市', '130100', '052260');
INSERT INTO `gwshop_area_china` VALUES ('130184', '4', '新乐市', '130100', '050700');
INSERT INTO `gwshop_area_china` VALUES ('130185', '4', '鹿泉市', '130100', '050200');
INSERT INTO `gwshop_area_china` VALUES ('130186', '4', '其它区', '130100', '');
INSERT INTO `gwshop_area_china` VALUES ('130200', '3', '唐山市', '130000', '063000');
INSERT INTO `gwshop_area_china` VALUES ('130202', '4', '路南区', '130200', '063017');
INSERT INTO `gwshop_area_china` VALUES ('130203', '4', '路北区', '130200', '063015');
INSERT INTO `gwshop_area_china` VALUES ('130204', '4', '古冶区', '130200', '063104');
INSERT INTO `gwshop_area_china` VALUES ('130205', '4', '开平区', '130200', '063021');
INSERT INTO `gwshop_area_china` VALUES ('130207', '4', '丰南区', '130200', '063300');
INSERT INTO `gwshop_area_china` VALUES ('130208', '4', '丰润区', '130200', '064000');
INSERT INTO `gwshop_area_china` VALUES ('130223', '4', '滦县', '130200', '063700');
INSERT INTO `gwshop_area_china` VALUES ('130224', '4', '滦南县', '130200', '063500');
INSERT INTO `gwshop_area_china` VALUES ('130225', '4', '乐亭县', '130200', '063600');
INSERT INTO `gwshop_area_china` VALUES ('130227', '4', '迁西县', '130200', '064300');
INSERT INTO `gwshop_area_china` VALUES ('130229', '4', '玉田县', '130200', '064100');
INSERT INTO `gwshop_area_china` VALUES ('130230', '4', '唐海县', '130200', '063200');
INSERT INTO `gwshop_area_china` VALUES ('130281', '4', '遵化市', '130200', '064200');
INSERT INTO `gwshop_area_china` VALUES ('130283', '4', '迁安市', '130200', '064400');
INSERT INTO `gwshop_area_china` VALUES ('130284', '4', '其它区', '130200', '');
INSERT INTO `gwshop_area_china` VALUES ('130300', '3', '秦皇岛市', '130000', '066000');
INSERT INTO `gwshop_area_china` VALUES ('130302', '4', '海港区', '130300', '066000');
INSERT INTO `gwshop_area_china` VALUES ('130303', '4', '山海关区', '130300', '066200');
INSERT INTO `gwshop_area_china` VALUES ('130304', '4', '北戴河区', '130300', '066100');
INSERT INTO `gwshop_area_china` VALUES ('130321', '4', '青龙满族自治县', '130300', '066500');
INSERT INTO `gwshop_area_china` VALUES ('130322', '4', '昌黎县', '130300', '066600');
INSERT INTO `gwshop_area_china` VALUES ('130323', '4', '抚宁县', '130300', '066300');
INSERT INTO `gwshop_area_china` VALUES ('130324', '4', '卢龙县', '130300', '066400');
INSERT INTO `gwshop_area_china` VALUES ('130398', '4', '其它区', '130300', '');
INSERT INTO `gwshop_area_china` VALUES ('130399', '4', '经济技术开发区', '130300', '');
INSERT INTO `gwshop_area_china` VALUES ('130400', '3', '邯郸市', '130000', '056000');
INSERT INTO `gwshop_area_china` VALUES ('130402', '4', '邯山区', '130400', '056001');
INSERT INTO `gwshop_area_china` VALUES ('130403', '4', '丛台区', '130400', '056004');
INSERT INTO `gwshop_area_china` VALUES ('130404', '4', '复兴区', '130400', '056003');
INSERT INTO `gwshop_area_china` VALUES ('130406', '4', '峰峰矿区', '130400', '056200');
INSERT INTO `gwshop_area_china` VALUES ('130421', '4', '邯郸县', '130400', '056105');
INSERT INTO `gwshop_area_china` VALUES ('130423', '4', '临漳县', '130400', '056600');
INSERT INTO `gwshop_area_china` VALUES ('130424', '4', '成安县', '130400', '056700');
INSERT INTO `gwshop_area_china` VALUES ('130425', '4', '大名县', '130400', '056900');
INSERT INTO `gwshop_area_china` VALUES ('130426', '4', '涉县', '130400', '056400');
INSERT INTO `gwshop_area_china` VALUES ('130427', '4', '磁县', '130400', '056500');
INSERT INTO `gwshop_area_china` VALUES ('130428', '4', '肥乡县', '130400', '057550');
INSERT INTO `gwshop_area_china` VALUES ('130429', '4', '永年县', '130400', '057150');
INSERT INTO `gwshop_area_china` VALUES ('130430', '4', '邱县', '130400', '057450');
INSERT INTO `gwshop_area_china` VALUES ('130431', '4', '鸡泽县', '130400', '057350');
INSERT INTO `gwshop_area_china` VALUES ('130432', '4', '广平县', '130400', '057650');
INSERT INTO `gwshop_area_china` VALUES ('130433', '4', '馆陶县', '130400', '057750');
INSERT INTO `gwshop_area_china` VALUES ('130434', '4', '魏县', '130400', '056800');
INSERT INTO `gwshop_area_china` VALUES ('130435', '4', '曲周县', '130400', '057250');
INSERT INTO `gwshop_area_china` VALUES ('130481', '4', '武安市', '130400', '056300');
INSERT INTO `gwshop_area_china` VALUES ('130482', '4', '其它区', '130400', '');
INSERT INTO `gwshop_area_china` VALUES ('130500', '3', '邢台市', '130000', '054000');
INSERT INTO `gwshop_area_china` VALUES ('130502', '4', '桥东区', '130500', '054001');
INSERT INTO `gwshop_area_china` VALUES ('130503', '4', '桥西区', '130500', '054000');
INSERT INTO `gwshop_area_china` VALUES ('130521', '4', '邢台县', '130500', '054001');
INSERT INTO `gwshop_area_china` VALUES ('130522', '4', '临城县', '130500', '054300');
INSERT INTO `gwshop_area_china` VALUES ('130523', '4', '内丘县', '130500', '054200');
INSERT INTO `gwshop_area_china` VALUES ('130524', '4', '柏乡县', '130500', '055450');
INSERT INTO `gwshop_area_china` VALUES ('130525', '4', '隆尧县', '130500', '055350');
INSERT INTO `gwshop_area_china` VALUES ('130526', '4', '任县', '130500', '055150');
INSERT INTO `gwshop_area_china` VALUES ('130527', '4', '南和县', '130500', '054400');
INSERT INTO `gwshop_area_china` VALUES ('130528', '4', '宁晋县', '130500', '055550');
INSERT INTO `gwshop_area_china` VALUES ('130529', '4', '巨鹿县', '130500', '055250');
INSERT INTO `gwshop_area_china` VALUES ('130530', '4', '新河县', '130500', '055650');
INSERT INTO `gwshop_area_china` VALUES ('130531', '4', '广宗县', '130500', '054600');
INSERT INTO `gwshop_area_china` VALUES ('130532', '4', '平乡县', '130500', '054500');
INSERT INTO `gwshop_area_china` VALUES ('130533', '4', '威县', '130500', '054700');
INSERT INTO `gwshop_area_china` VALUES ('130534', '4', '清河县', '130500', '054800');
INSERT INTO `gwshop_area_china` VALUES ('130535', '4', '临西县', '130500', '054900');
INSERT INTO `gwshop_area_china` VALUES ('130581', '4', '南宫市', '130500', '055750');
INSERT INTO `gwshop_area_china` VALUES ('130582', '4', '沙河市', '130500', '054100');
INSERT INTO `gwshop_area_china` VALUES ('130583', '4', '其它区', '130500', '');
INSERT INTO `gwshop_area_china` VALUES ('130600', '3', '保定市', '130000', '071000');
INSERT INTO `gwshop_area_china` VALUES ('130602', '4', '新市区', '130600', '071052');
INSERT INTO `gwshop_area_china` VALUES ('130603', '4', '北市区', '130600', '071000');
INSERT INTO `gwshop_area_china` VALUES ('130604', '4', '南市区', '130600', '071000');
INSERT INTO `gwshop_area_china` VALUES ('130621', '4', '满城县', '130600', '072150');
INSERT INTO `gwshop_area_china` VALUES ('130622', '4', '清苑县', '130600', '071100');
INSERT INTO `gwshop_area_china` VALUES ('130623', '4', '涞水县', '130600', '074100');
INSERT INTO `gwshop_area_china` VALUES ('130624', '4', '阜平县', '130600', '073200');
INSERT INTO `gwshop_area_china` VALUES ('130625', '4', '徐水县', '130600', '072550');
INSERT INTO `gwshop_area_china` VALUES ('130626', '4', '定兴县', '130600', '072650');
INSERT INTO `gwshop_area_china` VALUES ('130627', '4', '唐县', '130600', '072350');
INSERT INTO `gwshop_area_china` VALUES ('130628', '4', '高阳县', '130600', '071500');
INSERT INTO `gwshop_area_china` VALUES ('130629', '4', '容城县', '130600', '071700');
INSERT INTO `gwshop_area_china` VALUES ('130630', '4', '涞源县', '130600', '074300');
INSERT INTO `gwshop_area_china` VALUES ('130631', '4', '望都县', '130600', '072450');
INSERT INTO `gwshop_area_china` VALUES ('130632', '4', '安新县', '130600', '071600');
INSERT INTO `gwshop_area_china` VALUES ('130633', '4', '易县', '130600', '074200');
INSERT INTO `gwshop_area_china` VALUES ('130634', '4', '曲阳县', '130600', '073100');
INSERT INTO `gwshop_area_china` VALUES ('130635', '4', '蠡县', '130600', '071400');
INSERT INTO `gwshop_area_china` VALUES ('130636', '4', '顺平县', '130600', '072250');
INSERT INTO `gwshop_area_china` VALUES ('130637', '4', '博野县', '130600', '071300');
INSERT INTO `gwshop_area_china` VALUES ('130638', '4', '雄县', '130600', '071800');
INSERT INTO `gwshop_area_china` VALUES ('130681', '4', '涿州市', '130600', '072750');
INSERT INTO `gwshop_area_china` VALUES ('130682', '4', '定州市', '130600', '073000');
INSERT INTO `gwshop_area_china` VALUES ('130683', '4', '安国市', '130600', '071200');
INSERT INTO `gwshop_area_china` VALUES ('130684', '4', '高碑店市', '130600', '074000');
INSERT INTO `gwshop_area_china` VALUES ('130698', '4', '高开区', '130600', '');
INSERT INTO `gwshop_area_china` VALUES ('130699', '4', '其它区', '130600', '');
INSERT INTO `gwshop_area_china` VALUES ('130700', '3', '张家口市', '130000', '075000');
INSERT INTO `gwshop_area_china` VALUES ('130702', '4', '桥东区', '130700', '075000');
INSERT INTO `gwshop_area_china` VALUES ('130703', '4', '桥西区', '130700', '075061');
INSERT INTO `gwshop_area_china` VALUES ('130705', '4', '宣化区', '130700', '075100');
INSERT INTO `gwshop_area_china` VALUES ('130706', '4', '下花园区', '130700', '075300');
INSERT INTO `gwshop_area_china` VALUES ('130721', '4', '宣化县', '130700', '075100');
INSERT INTO `gwshop_area_china` VALUES ('130722', '4', '张北县', '130700', '076450');
INSERT INTO `gwshop_area_china` VALUES ('130723', '4', '康保县', '130700', '076650');
INSERT INTO `gwshop_area_china` VALUES ('130724', '4', '沽源县', '130700', '076550');
INSERT INTO `gwshop_area_china` VALUES ('130725', '4', '尚义县', '130700', '076750');
INSERT INTO `gwshop_area_china` VALUES ('130726', '4', '蔚县', '130700', '075700');
INSERT INTO `gwshop_area_china` VALUES ('130727', '4', '阳原县', '130700', '075800');
INSERT INTO `gwshop_area_china` VALUES ('130728', '4', '怀安县', '130700', '076150');
INSERT INTO `gwshop_area_china` VALUES ('130729', '4', '万全县', '130700', '076250');
INSERT INTO `gwshop_area_china` VALUES ('130730', '4', '怀来县', '130700', '075400');
INSERT INTO `gwshop_area_china` VALUES ('130731', '4', '涿鹿县', '130700', '075600');
INSERT INTO `gwshop_area_china` VALUES ('130732', '4', '赤城县', '130700', '075500');
INSERT INTO `gwshop_area_china` VALUES ('130733', '4', '崇礼县', '130700', '076350');
INSERT INTO `gwshop_area_china` VALUES ('130734', '4', '其它区', '130700', '');
INSERT INTO `gwshop_area_china` VALUES ('130800', '3', '承德市', '130000', '067000');
INSERT INTO `gwshop_area_china` VALUES ('130802', '4', '双桥区', '130800', '067000');
INSERT INTO `gwshop_area_china` VALUES ('130803', '4', '双滦区', '130800', '067000');
INSERT INTO `gwshop_area_china` VALUES ('130804', '4', '鹰手营子矿区', '130800', '067000');
INSERT INTO `gwshop_area_china` VALUES ('130821', '4', '承德县', '130800', '067400');
INSERT INTO `gwshop_area_china` VALUES ('130822', '4', '兴隆县', '130800', '067300');
INSERT INTO `gwshop_area_china` VALUES ('130823', '4', '平泉县', '130800', '067500');
INSERT INTO `gwshop_area_china` VALUES ('130824', '4', '滦平县', '130800', '068250');
INSERT INTO `gwshop_area_china` VALUES ('130825', '4', '隆化县', '130800', '068150');
INSERT INTO `gwshop_area_china` VALUES ('130826', '4', '丰宁满族自治县', '130800', '068350');
INSERT INTO `gwshop_area_china` VALUES ('130827', '4', '宽城满族自治县', '130800', '067600');
INSERT INTO `gwshop_area_china` VALUES ('130828', '4', '围场满族蒙古族自治县', '130800', '068450');
INSERT INTO `gwshop_area_china` VALUES ('130829', '4', '其它区', '130800', '');
INSERT INTO `gwshop_area_china` VALUES ('130900', '3', '沧州市', '130000', '061000');
INSERT INTO `gwshop_area_china` VALUES ('130902', '4', '新华区', '130900', '061000');
INSERT INTO `gwshop_area_china` VALUES ('130903', '4', '运河区', '130900', '061000');
INSERT INTO `gwshop_area_china` VALUES ('130921', '4', '沧县', '130900', '061035');
INSERT INTO `gwshop_area_china` VALUES ('130922', '4', '青县', '130900', '062650');
INSERT INTO `gwshop_area_china` VALUES ('130923', '4', '东光县', '130900', '061600');
INSERT INTO `gwshop_area_china` VALUES ('130924', '4', '海兴县', '130900', '061200');
INSERT INTO `gwshop_area_china` VALUES ('130925', '4', '盐山县', '130900', '061300');
INSERT INTO `gwshop_area_china` VALUES ('130926', '4', '肃宁县', '130900', '062350');
INSERT INTO `gwshop_area_china` VALUES ('130927', '4', '南皮县', '130900', '061500');
INSERT INTO `gwshop_area_china` VALUES ('130928', '4', '吴桥县', '130900', '061800');
INSERT INTO `gwshop_area_china` VALUES ('130929', '4', '献县', '130900', '062250');
INSERT INTO `gwshop_area_china` VALUES ('130930', '4', '孟村回族自治县', '130900', '061400');
INSERT INTO `gwshop_area_china` VALUES ('130981', '4', '泊头市', '130900', '062150');
INSERT INTO `gwshop_area_china` VALUES ('130982', '4', '任丘市', '130900', '062550');
INSERT INTO `gwshop_area_china` VALUES ('130983', '4', '黄骅市', '130900', '061100');
INSERT INTO `gwshop_area_china` VALUES ('130984', '4', '河间市', '130900', '062450');
INSERT INTO `gwshop_area_china` VALUES ('130985', '4', '其它区', '130900', '');
INSERT INTO `gwshop_area_china` VALUES ('131000', '3', '廊坊市', '130000', '065000');
INSERT INTO `gwshop_area_china` VALUES ('131002', '4', '安次区', '131000', '065000');
INSERT INTO `gwshop_area_china` VALUES ('131003', '4', '广阳区', '131000', '065000');
INSERT INTO `gwshop_area_china` VALUES ('131022', '4', '固安县', '131000', '065500');
INSERT INTO `gwshop_area_china` VALUES ('131023', '4', '永清县', '131000', '065600');
INSERT INTO `gwshop_area_china` VALUES ('131024', '4', '香河县', '131000', '065400');
INSERT INTO `gwshop_area_china` VALUES ('131025', '4', '大城县', '131000', '065900');
INSERT INTO `gwshop_area_china` VALUES ('131026', '4', '文安县', '131000', '065800');
INSERT INTO `gwshop_area_china` VALUES ('131028', '4', '大厂回族自治县', '131000', '065300');
INSERT INTO `gwshop_area_china` VALUES ('131051', '4', '开发区', '131000', '');
INSERT INTO `gwshop_area_china` VALUES ('131052', '4', '燕郊经济技术开发区', '131000', '');
INSERT INTO `gwshop_area_china` VALUES ('131081', '4', '霸州市', '131000', '065700');
INSERT INTO `gwshop_area_china` VALUES ('131082', '4', '三河市', '131000', '065200');
INSERT INTO `gwshop_area_china` VALUES ('131083', '4', '其它区', '131000', '');
INSERT INTO `gwshop_area_china` VALUES ('131100', '3', '衡水市', '130000', '053000');
INSERT INTO `gwshop_area_china` VALUES ('131102', '4', '桃城区', '131100', '053000');
INSERT INTO `gwshop_area_china` VALUES ('131121', '4', '枣强县', '131100', '053100');
INSERT INTO `gwshop_area_china` VALUES ('131122', '4', '武邑县', '131100', '053400');
INSERT INTO `gwshop_area_china` VALUES ('131123', '4', '武强县', '131100', '053300');
INSERT INTO `gwshop_area_china` VALUES ('131124', '4', '饶阳县', '131100', '053900');
INSERT INTO `gwshop_area_china` VALUES ('131125', '4', '安平县', '131100', '053600');
INSERT INTO `gwshop_area_china` VALUES ('131126', '4', '故城县', '131100', '253800');
INSERT INTO `gwshop_area_china` VALUES ('131127', '4', '景县', '131100', '053500');
INSERT INTO `gwshop_area_china` VALUES ('131128', '4', '阜城县', '131100', '053700');
INSERT INTO `gwshop_area_china` VALUES ('131181', '4', '冀州市', '131100', '053200');
INSERT INTO `gwshop_area_china` VALUES ('131182', '4', '深州市', '131100', '053800');
INSERT INTO `gwshop_area_china` VALUES ('131183', '4', '其它区', '131100', '');
INSERT INTO `gwshop_area_china` VALUES ('140000', '2', '山西省', '1', '');
INSERT INTO `gwshop_area_china` VALUES ('140100', '3', '太原市', '140000', '030000');
INSERT INTO `gwshop_area_china` VALUES ('140105', '4', '小店区', '140100', '030032');
INSERT INTO `gwshop_area_china` VALUES ('140106', '4', '迎泽区', '140100', '030024');
INSERT INTO `gwshop_area_china` VALUES ('140107', '4', '杏花岭区', '140100', '030001');
INSERT INTO `gwshop_area_china` VALUES ('140108', '4', '尖草坪区', '140100', '030003');
INSERT INTO `gwshop_area_china` VALUES ('140109', '4', '万柏林区', '140100', '030027');
INSERT INTO `gwshop_area_china` VALUES ('140110', '4', '晋源区', '140100', '030025');
INSERT INTO `gwshop_area_china` VALUES ('140121', '4', '清徐县', '140100', '030400');
INSERT INTO `gwshop_area_china` VALUES ('140122', '4', '阳曲县', '140100', '030100');
INSERT INTO `gwshop_area_china` VALUES ('140123', '4', '娄烦县', '140100', '030300');
INSERT INTO `gwshop_area_china` VALUES ('140181', '4', '古交市', '140100', '030200');
INSERT INTO `gwshop_area_china` VALUES ('140182', '4', '其它区', '140100', '');
INSERT INTO `gwshop_area_china` VALUES ('140200', '3', '大同市', '140000', '037000');
INSERT INTO `gwshop_area_china` VALUES ('140202', '4', '城区', '140200', '037008');
INSERT INTO `gwshop_area_china` VALUES ('140203', '4', '矿区', '140200', '037001');
INSERT INTO `gwshop_area_china` VALUES ('140211', '4', '南郊区', '140200', '037001');
INSERT INTO `gwshop_area_china` VALUES ('140212', '4', '新荣区', '140200', '037002');
INSERT INTO `gwshop_area_china` VALUES ('140221', '4', '阳高县', '140200', '038100');
INSERT INTO `gwshop_area_china` VALUES ('140222', '4', '天镇县', '140200', '038200');
INSERT INTO `gwshop_area_china` VALUES ('140223', '4', '广灵县', '140200', '037500');
INSERT INTO `gwshop_area_china` VALUES ('140224', '4', '灵丘县', '140200', '034400');
INSERT INTO `gwshop_area_china` VALUES ('140225', '4', '浑源县', '140200', '037400');
INSERT INTO `gwshop_area_china` VALUES ('140226', '4', '左云县', '140200', '037100');
INSERT INTO `gwshop_area_china` VALUES ('140227', '4', '大同县', '140200', '037300');
INSERT INTO `gwshop_area_china` VALUES ('140228', '4', '其它区', '140200', '');
INSERT INTO `gwshop_area_china` VALUES ('140300', '3', '阳泉市', '140000', '045000');
INSERT INTO `gwshop_area_china` VALUES ('140302', '4', '城区', '140300', '045000');
INSERT INTO `gwshop_area_china` VALUES ('140303', '4', '矿区', '140300', '045000');
INSERT INTO `gwshop_area_china` VALUES ('140311', '4', '郊区', '140300', '045011');
INSERT INTO `gwshop_area_china` VALUES ('140321', '4', '平定县', '140300', '045200');
INSERT INTO `gwshop_area_china` VALUES ('140322', '4', '盂县', '140300', '045100');
INSERT INTO `gwshop_area_china` VALUES ('140323', '4', '其它区', '140300', '');
INSERT INTO `gwshop_area_china` VALUES ('140400', '3', '长治市', '140000', '046000');
INSERT INTO `gwshop_area_china` VALUES ('140421', '4', '长治县', '140400', '047100');
INSERT INTO `gwshop_area_china` VALUES ('140423', '4', '襄垣县', '140400', '046200');
INSERT INTO `gwshop_area_china` VALUES ('140424', '4', '屯留县', '140400', '046100');
INSERT INTO `gwshop_area_china` VALUES ('140425', '4', '平顺县', '140400', '047400');
INSERT INTO `gwshop_area_china` VALUES ('140426', '4', '黎城县', '140400', '047600');
INSERT INTO `gwshop_area_china` VALUES ('140427', '4', '壶关县', '140400', '047300');
INSERT INTO `gwshop_area_china` VALUES ('140428', '4', '长子县', '140400', '046600');
INSERT INTO `gwshop_area_china` VALUES ('140429', '4', '武乡县', '140400', '046300');
INSERT INTO `gwshop_area_china` VALUES ('140430', '4', '沁县', '140400', '046400');
INSERT INTO `gwshop_area_china` VALUES ('140431', '4', '沁源县', '140400', '046500');
INSERT INTO `gwshop_area_china` VALUES ('140481', '4', '潞城市', '140400', '047500');
INSERT INTO `gwshop_area_china` VALUES ('140482', '4', '城区', '140400', '046011');
INSERT INTO `gwshop_area_china` VALUES ('140483', '4', '郊区', '140400', '046011');
INSERT INTO `gwshop_area_china` VALUES ('140484', '4', '高新区', '140400', '');
INSERT INTO `gwshop_area_china` VALUES ('140485', '4', '其它区', '140400', '');
INSERT INTO `gwshop_area_china` VALUES ('140500', '3', '晋城市', '140000', '048000');
INSERT INTO `gwshop_area_china` VALUES ('140502', '4', '城区', '140500', '048000');
INSERT INTO `gwshop_area_china` VALUES ('140521', '4', '沁水县', '140500', '048200');
INSERT INTO `gwshop_area_china` VALUES ('140522', '4', '阳城县', '140500', '048100');
INSERT INTO `gwshop_area_china` VALUES ('140524', '4', '陵川县', '140500', '048300');
INSERT INTO `gwshop_area_china` VALUES ('140525', '4', '泽州县', '140500', '048012');
INSERT INTO `gwshop_area_china` VALUES ('140581', '4', '高平市', '140500', '048400');
INSERT INTO `gwshop_area_china` VALUES ('140582', '4', '其它区', '140500', '');
INSERT INTO `gwshop_area_china` VALUES ('140600', '3', '朔州市', '140000', '036000');
INSERT INTO `gwshop_area_china` VALUES ('140602', '4', '朔城区', '140600', '038500');
INSERT INTO `gwshop_area_china` VALUES ('140603', '4', '平鲁区', '140600', '038600');
INSERT INTO `gwshop_area_china` VALUES ('140621', '4', '山阴县', '140600', '036900');
INSERT INTO `gwshop_area_china` VALUES ('140622', '4', '应县', '140600', '037600');
INSERT INTO `gwshop_area_china` VALUES ('140623', '4', '右玉县', '140600', '037200');
INSERT INTO `gwshop_area_china` VALUES ('140624', '4', '怀仁县', '140600', '038300');
INSERT INTO `gwshop_area_china` VALUES ('140625', '4', '其它区', '140600', '');
INSERT INTO `gwshop_area_china` VALUES ('140700', '3', '晋中市', '140000', '030600');
INSERT INTO `gwshop_area_china` VALUES ('140702', '4', '榆次区', '140700', '030600');
INSERT INTO `gwshop_area_china` VALUES ('140721', '4', '榆社县', '140700', '031800');
INSERT INTO `gwshop_area_china` VALUES ('140722', '4', '左权县', '140700', '032600');
INSERT INTO `gwshop_area_china` VALUES ('140723', '4', '和顺县', '140700', '032700');
INSERT INTO `gwshop_area_china` VALUES ('140724', '4', '昔阳县', '140700', '045300');
INSERT INTO `gwshop_area_china` VALUES ('140725', '4', '寿阳县', '140700', '045400');
INSERT INTO `gwshop_area_china` VALUES ('140726', '4', '太谷县', '140700', '030800');
INSERT INTO `gwshop_area_china` VALUES ('140727', '4', '祁县', '140700', '030900');
INSERT INTO `gwshop_area_china` VALUES ('140728', '4', '平遥县', '140700', '031100');
INSERT INTO `gwshop_area_china` VALUES ('140729', '4', '灵石县', '140700', '031300');
INSERT INTO `gwshop_area_china` VALUES ('140781', '4', '介休市', '140700', '032000');
INSERT INTO `gwshop_area_china` VALUES ('140782', '4', '其它区', '140700', '');
INSERT INTO `gwshop_area_china` VALUES ('140800', '3', '运城市', '140000', '044000');
INSERT INTO `gwshop_area_china` VALUES ('140802', '4', '盐湖区', '140800', '044300');
INSERT INTO `gwshop_area_china` VALUES ('140821', '4', '临猗县', '140800', '044100');
INSERT INTO `gwshop_area_china` VALUES ('140822', '4', '万荣县', '140800', '044200');
INSERT INTO `gwshop_area_china` VALUES ('140823', '4', '闻喜县', '140800', '043800');
INSERT INTO `gwshop_area_china` VALUES ('140824', '4', '稷山县', '140800', '043200');
INSERT INTO `gwshop_area_china` VALUES ('140825', '4', '新绛县', '140800', '043100');
INSERT INTO `gwshop_area_china` VALUES ('140826', '4', '绛县', '140800', '043600');
INSERT INTO `gwshop_area_china` VALUES ('140827', '4', '垣曲县', '140800', '043700');
INSERT INTO `gwshop_area_china` VALUES ('140828', '4', '夏县', '140800', '044400');
INSERT INTO `gwshop_area_china` VALUES ('140829', '4', '平陆县', '140800', '044300');
INSERT INTO `gwshop_area_china` VALUES ('140830', '4', '芮城县', '140800', '044600');
INSERT INTO `gwshop_area_china` VALUES ('140881', '4', '永济市', '140800', '044500');
INSERT INTO `gwshop_area_china` VALUES ('140882', '4', '河津市', '140800', '043300');
INSERT INTO `gwshop_area_china` VALUES ('140883', '4', '其它区', '140800', '');
INSERT INTO `gwshop_area_china` VALUES ('140900', '3', '忻州市', '140000', '034000');
INSERT INTO `gwshop_area_china` VALUES ('140902', '4', '忻府区', '140900', '034000');
INSERT INTO `gwshop_area_china` VALUES ('140921', '4', '定襄县', '140900', '035400');
INSERT INTO `gwshop_area_china` VALUES ('140922', '4', '五台县', '140900', '035500');
INSERT INTO `gwshop_area_china` VALUES ('140923', '4', '代县', '140900', '034200');
INSERT INTO `gwshop_area_china` VALUES ('140924', '4', '繁峙县', '140900', '034300');
INSERT INTO `gwshop_area_china` VALUES ('140925', '4', '宁武县', '140900', '036700');
INSERT INTO `gwshop_area_china` VALUES ('140926', '4', '静乐县', '140900', '035100');
INSERT INTO `gwshop_area_china` VALUES ('140927', '4', '神池县', '140900', '036100');
INSERT INTO `gwshop_area_china` VALUES ('140928', '4', '五寨县', '140900', '036100');
INSERT INTO `gwshop_area_china` VALUES ('140929', '4', '岢岚县', '140900', '036300');
INSERT INTO `gwshop_area_china` VALUES ('140930', '4', '河曲县', '140900', '036500');
INSERT INTO `gwshop_area_china` VALUES ('140931', '4', '保德县', '140900', '036600');
INSERT INTO `gwshop_area_china` VALUES ('140932', '4', '偏关县', '140900', '036400');
INSERT INTO `gwshop_area_china` VALUES ('140981', '4', '原平市', '140900', '034100');
INSERT INTO `gwshop_area_china` VALUES ('140982', '4', '其它区', '140900', '');
INSERT INTO `gwshop_area_china` VALUES ('141000', '3', '临汾市', '140000', '041000');
INSERT INTO `gwshop_area_china` VALUES ('141002', '4', '尧都区', '141000', '041000');
INSERT INTO `gwshop_area_china` VALUES ('141021', '4', '曲沃县', '141000', '043400');
INSERT INTO `gwshop_area_china` VALUES ('141022', '4', '翼城县', '141000', '043500');
INSERT INTO `gwshop_area_china` VALUES ('141023', '4', '襄汾县', '141000', '041500');
INSERT INTO `gwshop_area_china` VALUES ('141024', '4', '洪洞县', '141000', '041600');
INSERT INTO `gwshop_area_china` VALUES ('141025', '4', '古县', '141000', '042400');
INSERT INTO `gwshop_area_china` VALUES ('141026', '4', '安泽县', '141000', '042500');
INSERT INTO `gwshop_area_china` VALUES ('141027', '4', '浮山县', '141000', '042600');
INSERT INTO `gwshop_area_china` VALUES ('141028', '4', '吉县', '141000', '042200');
INSERT INTO `gwshop_area_china` VALUES ('141029', '4', '乡宁县', '141000', '042100');
INSERT INTO `gwshop_area_china` VALUES ('141030', '4', '大宁县', '141000', '042300');
INSERT INTO `gwshop_area_china` VALUES ('141031', '4', '隰县', '141000', '041300');
INSERT INTO `gwshop_area_china` VALUES ('141032', '4', '永和县', '141000', '041400');
INSERT INTO `gwshop_area_china` VALUES ('141033', '4', '蒲县', '141000', '041200');
INSERT INTO `gwshop_area_china` VALUES ('141034', '4', '汾西县', '141000', '031500');
INSERT INTO `gwshop_area_china` VALUES ('141081', '4', '侯马市', '141000', '043000');
INSERT INTO `gwshop_area_china` VALUES ('141082', '4', '霍州市', '141000', '031400');
INSERT INTO `gwshop_area_china` VALUES ('141083', '4', '其它区', '141000', '');
INSERT INTO `gwshop_area_china` VALUES ('141100', '3', '吕梁市', '140000', '033000');
INSERT INTO `gwshop_area_china` VALUES ('141102', '4', '离石区', '141100', '033000');
INSERT INTO `gwshop_area_china` VALUES ('141121', '4', '文水县', '141100', '032100');
INSERT INTO `gwshop_area_china` VALUES ('141122', '4', '交城县', '141100', '030500');
INSERT INTO `gwshop_area_china` VALUES ('141123', '4', '兴县', '141100', '033601');
INSERT INTO `gwshop_area_china` VALUES ('141124', '4', '临县', '141100', '033200');
INSERT INTO `gwshop_area_china` VALUES ('141125', '4', '柳林县', '141100', '033300');
INSERT INTO `gwshop_area_china` VALUES ('141126', '4', '石楼县', '141100', '032500');
INSERT INTO `gwshop_area_china` VALUES ('141127', '4', '岚县', '141100', '033500');
INSERT INTO `gwshop_area_china` VALUES ('141128', '4', '方山县', '141100', '033100');
INSERT INTO `gwshop_area_china` VALUES ('141129', '4', '中阳县', '141100', '033400');
INSERT INTO `gwshop_area_china` VALUES ('141130', '4', '交口县', '141100', '032400');
INSERT INTO `gwshop_area_china` VALUES ('141181', '4', '孝义市', '141100', '032208');
INSERT INTO `gwshop_area_china` VALUES ('141182', '4', '汾阳市', '141100', '032200');
INSERT INTO `gwshop_area_china` VALUES ('141183', '4', '其它区', '141100', '');
INSERT INTO `gwshop_area_china` VALUES ('150000', '2', '内蒙古自治区', '1', '');
INSERT INTO `gwshop_area_china` VALUES ('150100', '3', '呼和浩特市', '150000', '010000');
INSERT INTO `gwshop_area_china` VALUES ('150102', '4', '新城区', '150100', '010050');
INSERT INTO `gwshop_area_china` VALUES ('150103', '4', '回民区', '150100', '010030');
INSERT INTO `gwshop_area_china` VALUES ('150104', '4', '玉泉区', '150100', '010020');
INSERT INTO `gwshop_area_china` VALUES ('150105', '4', '赛罕区', '150100', '010020');
INSERT INTO `gwshop_area_china` VALUES ('150121', '4', '土默特左旗', '150100', '010100');
INSERT INTO `gwshop_area_china` VALUES ('150122', '4', '托克托县', '150100', '010200');
INSERT INTO `gwshop_area_china` VALUES ('150123', '4', '和林格尔县', '150100', '011500');
INSERT INTO `gwshop_area_china` VALUES ('150124', '4', '清水河县', '150100', '011600');
INSERT INTO `gwshop_area_china` VALUES ('150125', '4', '武川县', '150100', '011700');
INSERT INTO `gwshop_area_china` VALUES ('150126', '4', '其它区', '150100', '');
INSERT INTO `gwshop_area_china` VALUES ('150200', '3', '包头市', '150000', '014000');
INSERT INTO `gwshop_area_china` VALUES ('150202', '4', '东河区', '150200', '014040');
INSERT INTO `gwshop_area_china` VALUES ('150203', '4', '昆都仑区', '150200', '014010');
INSERT INTO `gwshop_area_china` VALUES ('150204', '4', '青山区', '150200', '014030');
INSERT INTO `gwshop_area_china` VALUES ('150205', '4', '石拐区', '150200', '014070');
INSERT INTO `gwshop_area_china` VALUES ('150206', '4', '白云矿区', '150200', '014080');
INSERT INTO `gwshop_area_china` VALUES ('150207', '4', '九原区', '150200', '014060');
INSERT INTO `gwshop_area_china` VALUES ('150221', '4', '土默特右旗', '150200', '014100');
INSERT INTO `gwshop_area_china` VALUES ('150222', '4', '固阳县', '150200', '014200');
INSERT INTO `gwshop_area_china` VALUES ('150223', '4', '达尔罕茂明安联合旗', '150200', '014500');
INSERT INTO `gwshop_area_china` VALUES ('150224', '4', '其它区', '150200', '');
INSERT INTO `gwshop_area_china` VALUES ('150300', '3', '乌海市', '150000', '016000');
INSERT INTO `gwshop_area_china` VALUES ('150302', '4', '海勃湾区', '150300', '016000');
INSERT INTO `gwshop_area_china` VALUES ('150303', '4', '海南区', '150300', '016030');
INSERT INTO `gwshop_area_china` VALUES ('150304', '4', '乌达区', '150300', '016040');
INSERT INTO `gwshop_area_china` VALUES ('150305', '4', '其它区', '150300', '');
INSERT INTO `gwshop_area_china` VALUES ('150400', '3', '赤峰市', '150000', '024000');
INSERT INTO `gwshop_area_china` VALUES ('150402', '4', '红山区', '150400', '024020');
INSERT INTO `gwshop_area_china` VALUES ('150403', '4', '元宝山区', '150400', '024076');
INSERT INTO `gwshop_area_china` VALUES ('150404', '4', '松山区', '150400', '024005');
INSERT INTO `gwshop_area_china` VALUES ('150421', '4', '阿鲁科尔沁旗', '150400', '025550');
INSERT INTO `gwshop_area_china` VALUES ('150422', '4', '巴林左旗', '150400', '025450');
INSERT INTO `gwshop_area_china` VALUES ('150423', '4', '巴林右旗', '150400', '025150');
INSERT INTO `gwshop_area_china` VALUES ('150424', '4', '林西县', '150400', '025250');
INSERT INTO `gwshop_area_china` VALUES ('150425', '4', '克什克腾旗', '150400', '025350');
INSERT INTO `gwshop_area_china` VALUES ('150426', '4', '翁牛特旗', '150400', '024500');
INSERT INTO `gwshop_area_china` VALUES ('150428', '4', '喀喇沁旗', '150400', '024400');
INSERT INTO `gwshop_area_china` VALUES ('150429', '4', '宁城县', '150400', '024200');
INSERT INTO `gwshop_area_china` VALUES ('150430', '4', '敖汉旗', '150400', '024300');
INSERT INTO `gwshop_area_china` VALUES ('150431', '4', '其它区', '150400', '');
INSERT INTO `gwshop_area_china` VALUES ('150500', '3', '通辽市', '150000', '028000');
INSERT INTO `gwshop_area_china` VALUES ('150502', '4', '科尔沁区', '150500', '028000');
INSERT INTO `gwshop_area_china` VALUES ('150521', '4', '科尔沁左翼中旗', '150500', '029300');
INSERT INTO `gwshop_area_china` VALUES ('150522', '4', '科尔沁左翼后旗', '150500', '028100');
INSERT INTO `gwshop_area_china` VALUES ('150523', '4', '开鲁县', '150500', '028400');
INSERT INTO `gwshop_area_china` VALUES ('150524', '4', '库伦旗', '150500', '028200');
INSERT INTO `gwshop_area_china` VALUES ('150525', '4', '奈曼旗', '150500', '028300');
INSERT INTO `gwshop_area_china` VALUES ('150526', '4', '扎鲁特旗', '150500', '029100');
INSERT INTO `gwshop_area_china` VALUES ('150581', '4', '霍林郭勒市', '150500', '029200');
INSERT INTO `gwshop_area_china` VALUES ('150582', '4', '其它区', '150500', '');
INSERT INTO `gwshop_area_china` VALUES ('150600', '3', '鄂尔多斯市', '150000', '017004');
INSERT INTO `gwshop_area_china` VALUES ('150602', '4', '东胜区', '150600', '017000');
INSERT INTO `gwshop_area_china` VALUES ('150621', '4', '达拉特旗', '150600', '014300');
INSERT INTO `gwshop_area_china` VALUES ('150622', '4', '准格尔旗', '150600', '017100');
INSERT INTO `gwshop_area_china` VALUES ('150623', '4', '鄂托克前旗', '150600', '016200');
INSERT INTO `gwshop_area_china` VALUES ('150624', '4', '鄂托克旗', '150600', '016100');
INSERT INTO `gwshop_area_china` VALUES ('150625', '4', '杭锦旗', '150600', '017400');
INSERT INTO `gwshop_area_china` VALUES ('150626', '4', '乌审旗', '150600', '017300');
INSERT INTO `gwshop_area_china` VALUES ('150627', '4', '伊金霍洛旗', '150600', '017200');
INSERT INTO `gwshop_area_china` VALUES ('150628', '4', '其它区', '150600', '');
INSERT INTO `gwshop_area_china` VALUES ('150700', '3', '呼伦贝尔市', '150000', '021008');
INSERT INTO `gwshop_area_china` VALUES ('150702', '4', '海拉尔区', '150700', '021000');
INSERT INTO `gwshop_area_china` VALUES ('150721', '4', '阿荣旗', '150700', '162750');
INSERT INTO `gwshop_area_china` VALUES ('150722', '4', '莫力达瓦达斡尔族自治旗', '150700', '162850');
INSERT INTO `gwshop_area_china` VALUES ('150723', '4', '鄂伦春自治旗', '150700', '165450');
INSERT INTO `gwshop_area_china` VALUES ('150724', '4', '鄂温克族自治旗', '150700', '021100');
INSERT INTO `gwshop_area_china` VALUES ('150725', '4', '陈巴尔虎旗', '150700', '021500');
INSERT INTO `gwshop_area_china` VALUES ('150726', '4', '新巴尔虎左旗', '150700', '021200');
INSERT INTO `gwshop_area_china` VALUES ('150727', '4', '新巴尔虎右旗', '150700', '021300');
INSERT INTO `gwshop_area_china` VALUES ('150781', '4', '满洲里市', '150700', '021400');
INSERT INTO `gwshop_area_china` VALUES ('150782', '4', '牙克石市', '150700', '162650');
INSERT INTO `gwshop_area_china` VALUES ('150783', '4', '扎兰屯市', '150700', '162650');
INSERT INTO `gwshop_area_china` VALUES ('150784', '4', '额尔古纳市', '150700', '022250');
INSERT INTO `gwshop_area_china` VALUES ('150785', '4', '根河市', '150700', '022350');
INSERT INTO `gwshop_area_china` VALUES ('150786', '4', '其它区', '150700', '');
INSERT INTO `gwshop_area_china` VALUES ('150800', '3', '巴彦淖尔市', '150000', '015001');
INSERT INTO `gwshop_area_china` VALUES ('150802', '4', '临河区', '150800', '015001');
INSERT INTO `gwshop_area_china` VALUES ('150821', '4', '五原县', '150800', '015100');
INSERT INTO `gwshop_area_china` VALUES ('150822', '4', '磴口县', '150800', '015200');
INSERT INTO `gwshop_area_china` VALUES ('150823', '4', '乌拉特前旗', '150800', '015400');
INSERT INTO `gwshop_area_china` VALUES ('150824', '4', '乌拉特中旗', '150800', '015300');
INSERT INTO `gwshop_area_china` VALUES ('150825', '4', '乌拉特后旗', '150800', '015500');
INSERT INTO `gwshop_area_china` VALUES ('150826', '4', '杭锦后旗', '150800', '015400');
INSERT INTO `gwshop_area_china` VALUES ('150827', '4', '其它区', '150800', '');
INSERT INTO `gwshop_area_china` VALUES ('150900', '3', '乌兰察布市', '150000', '012000');
INSERT INTO `gwshop_area_china` VALUES ('150902', '4', '集宁区', '150900', '012000');
INSERT INTO `gwshop_area_china` VALUES ('150921', '4', '卓资县', '150900', '012300');
INSERT INTO `gwshop_area_china` VALUES ('150922', '4', '化德县', '150900', '013350');
INSERT INTO `gwshop_area_china` VALUES ('150923', '4', '商都县', '150900', '013400');
INSERT INTO `gwshop_area_china` VALUES ('150924', '4', '兴和县', '150900', '013650');
INSERT INTO `gwshop_area_china` VALUES ('150925', '4', '凉城县', '150900', '013750');
INSERT INTO `gwshop_area_china` VALUES ('150926', '4', '察哈尔右翼前旗', '150900', '012200');
INSERT INTO `gwshop_area_china` VALUES ('150927', '4', '察哈尔右翼中旗', '150900', '013550');
INSERT INTO `gwshop_area_china` VALUES ('150928', '4', '察哈尔右翼后旗', '150900', '012400');
INSERT INTO `gwshop_area_china` VALUES ('150929', '4', '四子王旗', '150900', '011800');
INSERT INTO `gwshop_area_china` VALUES ('150981', '4', '丰镇市', '150900', '012100');
INSERT INTO `gwshop_area_china` VALUES ('150982', '4', '其它区', '150900', '');
INSERT INTO `gwshop_area_china` VALUES ('152200', '3', '兴安盟', '150000', '137401');
INSERT INTO `gwshop_area_china` VALUES ('152201', '4', '乌兰浩特市', '152200', '137400');
INSERT INTO `gwshop_area_china` VALUES ('152202', '4', '阿尔山市', '152200', '137800');
INSERT INTO `gwshop_area_china` VALUES ('152221', '4', '科尔沁右翼前旗', '152200', '137400');
INSERT INTO `gwshop_area_china` VALUES ('152222', '4', '科尔沁右翼中旗', '152200', '029400');
INSERT INTO `gwshop_area_china` VALUES ('152223', '4', '扎赉特旗', '152200', '137600');
INSERT INTO `gwshop_area_china` VALUES ('152224', '4', '突泉县', '152200', '137500');
INSERT INTO `gwshop_area_china` VALUES ('152225', '4', '其它区', '152200', '');
INSERT INTO `gwshop_area_china` VALUES ('152500', '3', '锡林郭勒盟', '150000', '026021');
INSERT INTO `gwshop_area_china` VALUES ('152501', '4', '二连浩特市', '152500', '011100');
INSERT INTO `gwshop_area_china` VALUES ('152502', '4', '锡林浩特市', '152500', '026000');
INSERT INTO `gwshop_area_china` VALUES ('152522', '4', '阿巴嘎旗', '152500', '011400');
INSERT INTO `gwshop_area_china` VALUES ('152523', '4', '苏尼特左旗', '152500', '011300');
INSERT INTO `gwshop_area_china` VALUES ('152524', '4', '苏尼特右旗', '152500', '011200');
INSERT INTO `gwshop_area_china` VALUES ('152525', '4', '东乌珠穆沁旗', '152500', '026300');
INSERT INTO `gwshop_area_china` VALUES ('152526', '4', '西乌珠穆沁旗', '152500', '026200');
INSERT INTO `gwshop_area_china` VALUES ('152527', '4', '太仆寺旗', '152500', '027000');
INSERT INTO `gwshop_area_china` VALUES ('152528', '4', '镶黄旗', '152500', '013250');
INSERT INTO `gwshop_area_china` VALUES ('152529', '4', '正镶白旗', '152500', '013800');
INSERT INTO `gwshop_area_china` VALUES ('152530', '4', '正蓝旗', '152500', '027200');
INSERT INTO `gwshop_area_china` VALUES ('152531', '4', '多伦县', '152500', '027300');
INSERT INTO `gwshop_area_china` VALUES ('152532', '4', '其它区', '152500', '');
INSERT INTO `gwshop_area_china` VALUES ('152900', '3', '阿拉善盟', '150000', '750306');
INSERT INTO `gwshop_area_china` VALUES ('152921', '4', '阿拉善左旗', '152900', '750300');
INSERT INTO `gwshop_area_china` VALUES ('152922', '4', '阿拉善右旗', '152900', '737300');
INSERT INTO `gwshop_area_china` VALUES ('152923', '4', '额济纳旗', '152900', '735400');
INSERT INTO `gwshop_area_china` VALUES ('152924', '4', '其它区', '152900', '');
INSERT INTO `gwshop_area_china` VALUES ('210000', '2', '辽宁省', '1', '');
INSERT INTO `gwshop_area_china` VALUES ('210100', '3', '沈阳市', '210000', '110000');
INSERT INTO `gwshop_area_china` VALUES ('210102', '4', '和平区', '210100', '110002');
INSERT INTO `gwshop_area_china` VALUES ('210103', '4', '沈河区', '210100', '110013');
INSERT INTO `gwshop_area_china` VALUES ('210104', '4', '大东区', '210100', '110044');
INSERT INTO `gwshop_area_china` VALUES ('210105', '4', '皇姑区', '210100', '110031');
INSERT INTO `gwshop_area_china` VALUES ('210106', '4', '铁西区', '210100', '110023');
INSERT INTO `gwshop_area_china` VALUES ('210111', '4', '苏家屯区', '210100', '110102');
INSERT INTO `gwshop_area_china` VALUES ('210112', '4', '东陵区', '210100', '110015');
INSERT INTO `gwshop_area_china` VALUES ('210113', '4', '新城子区', '210100', '110121');
INSERT INTO `gwshop_area_china` VALUES ('210114', '4', '于洪区', '210100', '110024');
INSERT INTO `gwshop_area_china` VALUES ('210122', '4', '辽中县', '210100', '110200');
INSERT INTO `gwshop_area_china` VALUES ('210123', '4', '康平县', '210100', '110500');
INSERT INTO `gwshop_area_china` VALUES ('210124', '4', '法库县', '210100', '110400');
INSERT INTO `gwshop_area_china` VALUES ('210181', '4', '新民市', '210100', '110300');
INSERT INTO `gwshop_area_china` VALUES ('210182', '4', '浑南新区', '210100', '');
INSERT INTO `gwshop_area_china` VALUES ('210183', '4', '张士开发区', '210100', '');
INSERT INTO `gwshop_area_china` VALUES ('210184', '4', '沈北新区', '210100', '');
INSERT INTO `gwshop_area_china` VALUES ('210185', '4', '其它区', '210100', '');
INSERT INTO `gwshop_area_china` VALUES ('210200', '3', '大连市', '210000', '116000');
INSERT INTO `gwshop_area_china` VALUES ('210202', '4', '中山区', '210200', '116001');
INSERT INTO `gwshop_area_china` VALUES ('210203', '4', '西岗区', '210200', '116011');
INSERT INTO `gwshop_area_china` VALUES ('210204', '4', '沙河口区', '210200', '116021');
INSERT INTO `gwshop_area_china` VALUES ('210211', '4', '甘井子区', '210200', '116033');
INSERT INTO `gwshop_area_china` VALUES ('210212', '4', '旅顺口区', '210200', '116041');
INSERT INTO `gwshop_area_china` VALUES ('210213', '4', '金州区', '210200', '116100');
INSERT INTO `gwshop_area_china` VALUES ('210224', '4', '长海县', '210200', '116500');
INSERT INTO `gwshop_area_china` VALUES ('210251', '4', '开发区', '210200', '');
INSERT INTO `gwshop_area_china` VALUES ('210281', '4', '瓦房店市', '210200', '116300');
INSERT INTO `gwshop_area_china` VALUES ('210282', '4', '普兰店市', '210200', '116200');
INSERT INTO `gwshop_area_china` VALUES ('210283', '4', '庄河市', '210200', '116400');
INSERT INTO `gwshop_area_china` VALUES ('210297', '4', '岭前区', '210200', '');
INSERT INTO `gwshop_area_china` VALUES ('210298', '4', '其它区', '210200', '');
INSERT INTO `gwshop_area_china` VALUES ('210300', '3', '鞍山市', '210000', '114000');
INSERT INTO `gwshop_area_china` VALUES ('210302', '4', '铁东区', '210300', '114001');
INSERT INTO `gwshop_area_china` VALUES ('210303', '4', '铁西区', '210300', '110023');
INSERT INTO `gwshop_area_china` VALUES ('210304', '4', '立山区', '210300', '114031');
INSERT INTO `gwshop_area_china` VALUES ('210311', '4', '千山区', '210300', '114041');
INSERT INTO `gwshop_area_china` VALUES ('210321', '4', '台安县', '210300', '114100');
INSERT INTO `gwshop_area_china` VALUES ('210323', '4', '岫岩满族自治县', '210300', '114300');
INSERT INTO `gwshop_area_china` VALUES ('210351', '4', '高新区', '210300', '');
INSERT INTO `gwshop_area_china` VALUES ('210381', '4', '海城市', '210300', '114200');
INSERT INTO `gwshop_area_china` VALUES ('210382', '4', '其它区', '210300', '');
INSERT INTO `gwshop_area_china` VALUES ('210400', '3', '抚顺市', '210000', '113000');
INSERT INTO `gwshop_area_china` VALUES ('210402', '4', '新抚区', '210400', '113006');
INSERT INTO `gwshop_area_china` VALUES ('210403', '4', '东洲区', '210400', '113003');
INSERT INTO `gwshop_area_china` VALUES ('210404', '4', '望花区', '210400', '113001');
INSERT INTO `gwshop_area_china` VALUES ('210411', '4', '顺城区', '210400', '113006');
INSERT INTO `gwshop_area_china` VALUES ('210421', '4', '抚顺县', '210400', '113100');
INSERT INTO `gwshop_area_china` VALUES ('210422', '4', '新宾满族自治县', '210400', '113200');
INSERT INTO `gwshop_area_china` VALUES ('210423', '4', '清原满族自治县', '210400', '113300');
INSERT INTO `gwshop_area_china` VALUES ('210424', '4', '其它区', '210400', '');
INSERT INTO `gwshop_area_china` VALUES ('210500', '3', '本溪市', '210000', '117000');
INSERT INTO `gwshop_area_china` VALUES ('210502', '4', '平山区', '210500', '117000');
INSERT INTO `gwshop_area_china` VALUES ('210503', '4', '溪湖区', '210500', '117002');
INSERT INTO `gwshop_area_china` VALUES ('210504', '4', '明山区', '210500', '117021');
INSERT INTO `gwshop_area_china` VALUES ('210505', '4', '南芬区', '210500', '117014');
INSERT INTO `gwshop_area_china` VALUES ('210521', '4', '本溪满族自治县', '210500', '117100');
INSERT INTO `gwshop_area_china` VALUES ('210522', '4', '桓仁满族自治县', '210500', '117200');
INSERT INTO `gwshop_area_china` VALUES ('210523', '4', '其它区', '210500', '');
INSERT INTO `gwshop_area_china` VALUES ('210600', '3', '丹东市', '210000', '118000');
INSERT INTO `gwshop_area_china` VALUES ('210602', '4', '元宝区', '210600', '118000');
INSERT INTO `gwshop_area_china` VALUES ('210603', '4', '振兴区', '210600', '118002');
INSERT INTO `gwshop_area_china` VALUES ('210604', '4', '振安区', '210600', '118001');
INSERT INTO `gwshop_area_china` VALUES ('210624', '4', '宽甸满族自治县', '210600', '118200');
INSERT INTO `gwshop_area_china` VALUES ('210681', '4', '东港市', '210600', '118300');
INSERT INTO `gwshop_area_china` VALUES ('210682', '4', '凤城市', '210600', '118100');
INSERT INTO `gwshop_area_china` VALUES ('210683', '4', '其它区', '210600', '');
INSERT INTO `gwshop_area_china` VALUES ('210700', '3', '锦州市', '210000', '121000');
INSERT INTO `gwshop_area_china` VALUES ('210702', '4', '古塔区', '210700', '121001');
INSERT INTO `gwshop_area_china` VALUES ('210703', '4', '凌河区', '210700', '121000');
INSERT INTO `gwshop_area_china` VALUES ('210711', '4', '太和区', '210700', '121011');
INSERT INTO `gwshop_area_china` VALUES ('210726', '4', '黑山县', '210700', '121400');
INSERT INTO `gwshop_area_china` VALUES ('210727', '4', '义县', '210700', '121100');
INSERT INTO `gwshop_area_china` VALUES ('210781', '4', '凌海市', '210700', '121200');
INSERT INTO `gwshop_area_china` VALUES ('210782', '4', '北镇市', '210700', '121300');
INSERT INTO `gwshop_area_china` VALUES ('210783', '4', '其它区', '210700', '');
INSERT INTO `gwshop_area_china` VALUES ('210800', '3', '营口市', '210000', '115000');
INSERT INTO `gwshop_area_china` VALUES ('210802', '4', '站前区', '210800', '115002');
INSERT INTO `gwshop_area_china` VALUES ('210803', '4', '西市区', '210800', '115004');
INSERT INTO `gwshop_area_china` VALUES ('210804', '4', '鲅鱼圈区', '210800', '115007');
INSERT INTO `gwshop_area_china` VALUES ('210811', '4', '老边区', '210800', '115005');
INSERT INTO `gwshop_area_china` VALUES ('210881', '4', '盖州市', '210800', '115200');
INSERT INTO `gwshop_area_china` VALUES ('210882', '4', '大石桥市', '210800', '115100');
INSERT INTO `gwshop_area_china` VALUES ('210883', '4', '其它区', '210800', '');
INSERT INTO `gwshop_area_china` VALUES ('210900', '3', '阜新市', '210000', '123000');
INSERT INTO `gwshop_area_china` VALUES ('210902', '4', '海州区', '210900', '123000');
INSERT INTO `gwshop_area_china` VALUES ('210903', '4', '新邱区', '210900', '123005');
INSERT INTO `gwshop_area_china` VALUES ('210904', '4', '太平区', '210900', '123003');
INSERT INTO `gwshop_area_china` VALUES ('210905', '4', '清河门区', '210900', '123006');
INSERT INTO `gwshop_area_china` VALUES ('210911', '4', '细河区', '210900', '123000');
INSERT INTO `gwshop_area_china` VALUES ('210921', '4', '阜新蒙古族自治县', '210900', '123100');
INSERT INTO `gwshop_area_china` VALUES ('210922', '4', '彰武县', '210900', '123200');
INSERT INTO `gwshop_area_china` VALUES ('210923', '4', '其它区', '210900', '');
INSERT INTO `gwshop_area_china` VALUES ('211000', '3', '辽阳市', '210000', '111000');
INSERT INTO `gwshop_area_china` VALUES ('211002', '4', '白塔区', '211000', '111000');
INSERT INTO `gwshop_area_china` VALUES ('211003', '4', '文圣区', '211000', '111000');
INSERT INTO `gwshop_area_china` VALUES ('211004', '4', '宏伟区', '211000', '111003');
INSERT INTO `gwshop_area_china` VALUES ('211005', '4', '弓长岭区', '211000', '111008');
INSERT INTO `gwshop_area_china` VALUES ('211011', '4', '太子河区', '211000', '111000');
INSERT INTO `gwshop_area_china` VALUES ('211021', '4', '辽阳县', '211000', '111200');
INSERT INTO `gwshop_area_china` VALUES ('211081', '4', '灯塔市', '211000', '111300');
INSERT INTO `gwshop_area_china` VALUES ('211082', '4', '其它区', '211000', '');
INSERT INTO `gwshop_area_china` VALUES ('211100', '3', '盘锦市', '210000', '124000');
INSERT INTO `gwshop_area_china` VALUES ('211102', '4', '双台子区', '211100', '124000');
INSERT INTO `gwshop_area_china` VALUES ('211103', '4', '兴隆台区', '211100', '124010');
INSERT INTO `gwshop_area_china` VALUES ('211121', '4', '大洼县', '211100', '124000');
INSERT INTO `gwshop_area_china` VALUES ('211122', '4', '盘山县', '211100', '124100');
INSERT INTO `gwshop_area_china` VALUES ('211123', '4', '其它区', '211100', '');
INSERT INTO `gwshop_area_china` VALUES ('211200', '3', '铁岭市', '210000', '112000');
INSERT INTO `gwshop_area_china` VALUES ('211202', '4', '银州区', '211200', '112000');
INSERT INTO `gwshop_area_china` VALUES ('211204', '4', '清河区', '211200', '112003');
INSERT INTO `gwshop_area_china` VALUES ('211221', '4', '铁岭县', '211200', '112600');
INSERT INTO `gwshop_area_china` VALUES ('211223', '4', '西丰县', '211200', '112400');
INSERT INTO `gwshop_area_china` VALUES ('211224', '4', '昌图县', '211200', '112500');
INSERT INTO `gwshop_area_china` VALUES ('211281', '4', '调兵山市', '211200', '112700');
INSERT INTO `gwshop_area_china` VALUES ('211282', '4', '开原市', '211200', '112300');
INSERT INTO `gwshop_area_china` VALUES ('211283', '4', '其它区', '211200', '');
INSERT INTO `gwshop_area_china` VALUES ('211300', '3', '朝阳市', '210000', '122000');
INSERT INTO `gwshop_area_china` VALUES ('211302', '4', '双塔区', '211300', '122000');
INSERT INTO `gwshop_area_china` VALUES ('211303', '4', '龙城区', '211300', '122000');
INSERT INTO `gwshop_area_china` VALUES ('211321', '4', '朝阳县', '211300', '122000');
INSERT INTO `gwshop_area_china` VALUES ('211322', '4', '建平县', '211300', '122400');
INSERT INTO `gwshop_area_china` VALUES ('211324', '4', '喀喇沁左翼蒙古族自治县', '211300', '122300');
INSERT INTO `gwshop_area_china` VALUES ('211381', '4', '北票市', '211300', '122100');
INSERT INTO `gwshop_area_china` VALUES ('211382', '4', '凌源市', '211300', '122500');
INSERT INTO `gwshop_area_china` VALUES ('211383', '4', '其它区', '211300', '');
INSERT INTO `gwshop_area_china` VALUES ('211400', '3', '葫芦岛市', '210000', '125000');
INSERT INTO `gwshop_area_china` VALUES ('211402', '4', '连山区', '211400', '125001');
INSERT INTO `gwshop_area_china` VALUES ('211403', '4', '龙港区', '211400', '125004');
INSERT INTO `gwshop_area_china` VALUES ('211404', '4', '南票区', '211400', '125027');
INSERT INTO `gwshop_area_china` VALUES ('211421', '4', '绥中县', '211400', '125200');
INSERT INTO `gwshop_area_china` VALUES ('211422', '4', '建昌县', '211400', '125300');
INSERT INTO `gwshop_area_china` VALUES ('211481', '4', '兴城市', '211400', '125100');
INSERT INTO `gwshop_area_china` VALUES ('211482', '4', '其它区', '211400', '');
INSERT INTO `gwshop_area_china` VALUES ('220000', '2', '吉林省', '1', '');
INSERT INTO `gwshop_area_china` VALUES ('220100', '3', '长春市', '220000', '130000');
INSERT INTO `gwshop_area_china` VALUES ('220102', '4', '南关区', '220100', '130022');
INSERT INTO `gwshop_area_china` VALUES ('220103', '4', '宽城区', '220100', '130051');
INSERT INTO `gwshop_area_china` VALUES ('220104', '4', '朝阳区', '220100', '130012');
INSERT INTO `gwshop_area_china` VALUES ('220105', '4', '二道区', '220100', '130031');
INSERT INTO `gwshop_area_china` VALUES ('220106', '4', '绿园区', '220100', '130062');
INSERT INTO `gwshop_area_china` VALUES ('220112', '4', '双阳区', '220100', '130600');
INSERT INTO `gwshop_area_china` VALUES ('220122', '4', '农安县', '220100', '130200');
INSERT INTO `gwshop_area_china` VALUES ('220181', '4', '九台市', '220100', '130500');
INSERT INTO `gwshop_area_china` VALUES ('220182', '4', '榆树市', '220100', '130400');
INSERT INTO `gwshop_area_china` VALUES ('220183', '4', '德惠市', '220100', '130300');
INSERT INTO `gwshop_area_china` VALUES ('220184', '4', '高新技术产业开发区', '220100', '');
INSERT INTO `gwshop_area_china` VALUES ('220185', '4', '汽车产业开发区', '220100', '');
INSERT INTO `gwshop_area_china` VALUES ('220186', '4', '经济技术开发区', '220100', '');
INSERT INTO `gwshop_area_china` VALUES ('220187', '4', '净月旅游开发区', '220100', '');
INSERT INTO `gwshop_area_china` VALUES ('220188', '4', '其它区', '220100', '');
INSERT INTO `gwshop_area_china` VALUES ('220200', '3', '吉林市', '220000', '132000');
INSERT INTO `gwshop_area_china` VALUES ('220202', '4', '昌邑区', '220200', '132002');
INSERT INTO `gwshop_area_china` VALUES ('220203', '4', '龙潭区', '220200', '132021');
INSERT INTO `gwshop_area_china` VALUES ('220204', '4', '船营区', '220200', '132011');
INSERT INTO `gwshop_area_china` VALUES ('220211', '4', '丰满区', '220200', '132113');
INSERT INTO `gwshop_area_china` VALUES ('220221', '4', '永吉县', '220200', '132100');
INSERT INTO `gwshop_area_china` VALUES ('220281', '4', '蛟河市', '220200', '132500');
INSERT INTO `gwshop_area_china` VALUES ('220282', '4', '桦甸市', '220200', '132400');
INSERT INTO `gwshop_area_china` VALUES ('220283', '4', '舒兰市', '220200', '132600');
INSERT INTO `gwshop_area_china` VALUES ('220284', '4', '磐石市', '220200', '132300');
INSERT INTO `gwshop_area_china` VALUES ('220285', '4', '其它区', '220200', '');
INSERT INTO `gwshop_area_china` VALUES ('220300', '3', '四平市', '220000', '136000');
INSERT INTO `gwshop_area_china` VALUES ('220302', '4', '铁西区', '220300', '136000');
INSERT INTO `gwshop_area_china` VALUES ('220303', '4', '铁东区', '220300', '136001');
INSERT INTO `gwshop_area_china` VALUES ('220322', '4', '梨树县', '220300', '136500');
INSERT INTO `gwshop_area_china` VALUES ('220323', '4', '伊通满族自治县', '220300', '130700');
INSERT INTO `gwshop_area_china` VALUES ('220381', '4', '公主岭市', '220300', '136100');
INSERT INTO `gwshop_area_china` VALUES ('220382', '4', '双辽市', '220300', '136400');
INSERT INTO `gwshop_area_china` VALUES ('220383', '4', '其它区', '220300', '');
INSERT INTO `gwshop_area_china` VALUES ('220400', '3', '辽源市', '220000', '136200');
INSERT INTO `gwshop_area_china` VALUES ('220402', '4', '龙山区', '220400', '136200');
INSERT INTO `gwshop_area_china` VALUES ('220403', '4', '西安区', '220400', '136201');
INSERT INTO `gwshop_area_china` VALUES ('220421', '4', '东丰县', '220400', '136300');
INSERT INTO `gwshop_area_china` VALUES ('220422', '4', '东辽县', '220400', '136600');
INSERT INTO `gwshop_area_china` VALUES ('220423', '4', '其它区', '220400', '');
INSERT INTO `gwshop_area_china` VALUES ('220500', '3', '通化市', '220000', '134000');
INSERT INTO `gwshop_area_china` VALUES ('220502', '4', '东昌区', '220500', '134001');
INSERT INTO `gwshop_area_china` VALUES ('220503', '4', '二道江区', '220500', '134303');
INSERT INTO `gwshop_area_china` VALUES ('220521', '4', '通化县', '220500', '134100');
INSERT INTO `gwshop_area_china` VALUES ('220523', '4', '辉南县', '220500', '135100');
INSERT INTO `gwshop_area_china` VALUES ('220524', '4', '柳河县', '220500', '135300');
INSERT INTO `gwshop_area_china` VALUES ('220581', '4', '梅河口市', '220500', '135000');
INSERT INTO `gwshop_area_china` VALUES ('220582', '4', '集安市', '220500', '134200');
INSERT INTO `gwshop_area_china` VALUES ('220583', '4', '其它区', '220500', '');
INSERT INTO `gwshop_area_china` VALUES ('220600', '3', '白山市', '220000', '134300');
INSERT INTO `gwshop_area_china` VALUES ('220602', '4', '八道江区', '220600', '134300');
INSERT INTO `gwshop_area_china` VALUES ('220621', '4', '抚松县', '220600', '134500');
INSERT INTO `gwshop_area_china` VALUES ('220622', '4', '靖宇县', '220600', '135200');
INSERT INTO `gwshop_area_china` VALUES ('220623', '4', '长白朝鲜族自治县', '220600', '134400');
INSERT INTO `gwshop_area_china` VALUES ('220625', '4', '江源市', '220600', '134700');
INSERT INTO `gwshop_area_china` VALUES ('220681', '4', '临江市', '220600', '134600');
INSERT INTO `gwshop_area_china` VALUES ('220682', '4', '其它区', '220600', '');
INSERT INTO `gwshop_area_china` VALUES ('220700', '3', '松原市', '220000', '138000');
INSERT INTO `gwshop_area_china` VALUES ('220702', '4', '宁江区', '220700', '138000');
INSERT INTO `gwshop_area_china` VALUES ('220721', '4', '前郭尔罗斯蒙古族自治县', '220700', '131100');
INSERT INTO `gwshop_area_china` VALUES ('220722', '4', '长岭县', '220700', '131500');
INSERT INTO `gwshop_area_china` VALUES ('220723', '4', '乾安县', '220700', '131400');
INSERT INTO `gwshop_area_china` VALUES ('220724', '4', '扶余县', '220700', '131200');
INSERT INTO `gwshop_area_china` VALUES ('220725', '4', '其它区', '220700', '');
INSERT INTO `gwshop_area_china` VALUES ('220800', '3', '白城市', '220000', '137000');
INSERT INTO `gwshop_area_china` VALUES ('220802', '4', '洮北区', '220800', '137000');
INSERT INTO `gwshop_area_china` VALUES ('220821', '4', '镇赉县', '220800', '137300');
INSERT INTO `gwshop_area_china` VALUES ('220822', '4', '通榆县', '220800', '137200');
INSERT INTO `gwshop_area_china` VALUES ('220881', '4', '洮南市', '220800', '137100');
INSERT INTO `gwshop_area_china` VALUES ('220882', '4', '大安市', '220800', '131300');
INSERT INTO `gwshop_area_china` VALUES ('220883', '4', '其它区', '220800', '');
INSERT INTO `gwshop_area_china` VALUES ('222400', '3', '延边朝鲜族自治州', '220000', '133000');
INSERT INTO `gwshop_area_china` VALUES ('222401', '4', '延吉市', '222400', '133000');
INSERT INTO `gwshop_area_china` VALUES ('222402', '4', '图们市', '222400', '133100');
INSERT INTO `gwshop_area_china` VALUES ('222403', '4', '敦化市', '222400', '133700');
INSERT INTO `gwshop_area_china` VALUES ('222404', '4', '珲春市', '222400', '133300');
INSERT INTO `gwshop_area_china` VALUES ('222405', '4', '龙井市', '222400', '133400');
INSERT INTO `gwshop_area_china` VALUES ('222406', '4', '和龙市', '222400', '133500');
INSERT INTO `gwshop_area_china` VALUES ('222424', '4', '汪清县', '222400', '133200');
INSERT INTO `gwshop_area_china` VALUES ('222426', '4', '安图县', '222400', '133600');
INSERT INTO `gwshop_area_china` VALUES ('222427', '4', '其它区', '222400', '');
INSERT INTO `gwshop_area_china` VALUES ('230000', '2', '黑龙江省', '1', '');
INSERT INTO `gwshop_area_china` VALUES ('230100', '3', '哈尔滨市', '230000', '150000');
INSERT INTO `gwshop_area_china` VALUES ('230102', '4', '道里区', '230100', '150010');
INSERT INTO `gwshop_area_china` VALUES ('230103', '4', '南岗区', '230100', '150006');
INSERT INTO `gwshop_area_china` VALUES ('230104', '4', '道外区', '230100', '150026');
INSERT INTO `gwshop_area_china` VALUES ('230106', '4', '香坊区', '230100', '150036');
INSERT INTO `gwshop_area_china` VALUES ('230107', '4', '动力区', '230100', '150040');
INSERT INTO `gwshop_area_china` VALUES ('230108', '4', '平房区', '230100', '150060');
INSERT INTO `gwshop_area_china` VALUES ('230109', '4', '松北区', '230100', '150028');
INSERT INTO `gwshop_area_china` VALUES ('230111', '4', '呼兰区', '230100', '150500');
INSERT INTO `gwshop_area_china` VALUES ('230123', '4', '依兰县', '230100', '154800');
INSERT INTO `gwshop_area_china` VALUES ('230124', '4', '方正县', '230100', '150800');
INSERT INTO `gwshop_area_china` VALUES ('230125', '4', '宾县', '230100', '150400');
INSERT INTO `gwshop_area_china` VALUES ('230126', '4', '巴彦县', '230100', '151800');
INSERT INTO `gwshop_area_china` VALUES ('230127', '4', '木兰县', '230100', '151900');
INSERT INTO `gwshop_area_china` VALUES ('230128', '4', '通河县', '230100', '150900');
INSERT INTO `gwshop_area_china` VALUES ('230129', '4', '延寿县', '230100', '150700');
INSERT INTO `gwshop_area_china` VALUES ('230181', '4', '阿城市', '230100', '150300');
INSERT INTO `gwshop_area_china` VALUES ('230182', '4', '双城市', '230100', '150100');
INSERT INTO `gwshop_area_china` VALUES ('230183', '4', '尚志市', '230100', '150600');
INSERT INTO `gwshop_area_china` VALUES ('230184', '4', '五常市', '230100', '150200');
INSERT INTO `gwshop_area_china` VALUES ('230185', '4', '阿城市', '230100', '150300');
INSERT INTO `gwshop_area_china` VALUES ('230186', '4', '其它区', '230100', '');
INSERT INTO `gwshop_area_china` VALUES ('230200', '3', '齐齐哈尔市', '230000', '161000');
INSERT INTO `gwshop_area_china` VALUES ('230202', '4', '龙沙区', '230200', '161000');
INSERT INTO `gwshop_area_china` VALUES ('230203', '4', '建华区', '230200', '161006');
INSERT INTO `gwshop_area_china` VALUES ('230204', '4', '铁锋区', '230200', '161000');
INSERT INTO `gwshop_area_china` VALUES ('230205', '4', '昂昂溪区', '230200', '161031');
INSERT INTO `gwshop_area_china` VALUES ('230206', '4', '富拉尔基区', '230200', '161041');
INSERT INTO `gwshop_area_china` VALUES ('230207', '4', '碾子山区', '230200', '161046');
INSERT INTO `gwshop_area_china` VALUES ('230208', '4', '梅里斯达斡尔族区', '230200', '161021');
INSERT INTO `gwshop_area_china` VALUES ('230221', '4', '龙江县', '230200', '161100');
INSERT INTO `gwshop_area_china` VALUES ('230223', '4', '依安县', '230200', '161500');
INSERT INTO `gwshop_area_china` VALUES ('230224', '4', '泰来县', '230200', '162400');
INSERT INTO `gwshop_area_china` VALUES ('230225', '4', '甘南县', '230200', '162100');
INSERT INTO `gwshop_area_china` VALUES ('230227', '4', '富裕县', '230200', '161200');
INSERT INTO `gwshop_area_china` VALUES ('230229', '4', '克山县', '230200', '161600');
INSERT INTO `gwshop_area_china` VALUES ('230230', '4', '克东县', '230200', '164800');
INSERT INTO `gwshop_area_china` VALUES ('230231', '4', '拜泉县', '230200', '164700');
INSERT INTO `gwshop_area_china` VALUES ('230281', '4', '讷河市', '230200', '161300');
INSERT INTO `gwshop_area_china` VALUES ('230282', '4', '其它区', '230200', '');
INSERT INTO `gwshop_area_china` VALUES ('230300', '3', '鸡西市', '230000', '158100');
INSERT INTO `gwshop_area_china` VALUES ('230302', '4', '鸡冠区', '230300', '158100');
INSERT INTO `gwshop_area_china` VALUES ('230303', '4', '恒山区', '230300', '158130');
INSERT INTO `gwshop_area_china` VALUES ('230304', '4', '滴道区', '230300', '158150');
INSERT INTO `gwshop_area_china` VALUES ('230305', '4', '梨树区', '230300', '158160');
INSERT INTO `gwshop_area_china` VALUES ('230306', '4', '城子河区', '230300', '158170');
INSERT INTO `gwshop_area_china` VALUES ('230307', '4', '麻山区', '230300', '158180');
INSERT INTO `gwshop_area_china` VALUES ('230321', '4', '鸡东县', '230300', '158200');
INSERT INTO `gwshop_area_china` VALUES ('230381', '4', '虎林市', '230300', '158400');
INSERT INTO `gwshop_area_china` VALUES ('230382', '4', '密山市', '230300', '158300');
INSERT INTO `gwshop_area_china` VALUES ('230383', '4', '其它区', '230300', '');
INSERT INTO `gwshop_area_china` VALUES ('230400', '3', '鹤岗市', '230000', '154100');
INSERT INTO `gwshop_area_china` VALUES ('230402', '4', '向阳区', '230400', '154100');
INSERT INTO `gwshop_area_china` VALUES ('230403', '4', '工农区', '230400', '154101');
INSERT INTO `gwshop_area_china` VALUES ('230404', '4', '南山区', '230400', '154104');
INSERT INTO `gwshop_area_china` VALUES ('230405', '4', '兴安区', '230400', '154102');
INSERT INTO `gwshop_area_china` VALUES ('230406', '4', '东山区', '230400', '154106');
INSERT INTO `gwshop_area_china` VALUES ('230407', '4', '兴山区', '230400', '154105');
INSERT INTO `gwshop_area_china` VALUES ('230421', '4', '萝北县', '230400', '154200');
INSERT INTO `gwshop_area_china` VALUES ('230422', '4', '绥滨县', '230400', '156200');
INSERT INTO `gwshop_area_china` VALUES ('230423', '4', '其它区', '230400', '');
INSERT INTO `gwshop_area_china` VALUES ('230500', '3', '双鸭山市', '230000', '155100');
INSERT INTO `gwshop_area_china` VALUES ('230502', '4', '尖山区', '230500', '155100');
INSERT INTO `gwshop_area_china` VALUES ('230503', '4', '岭东区', '230500', '155120');
INSERT INTO `gwshop_area_china` VALUES ('230505', '4', '四方台区', '230500', '155130');
INSERT INTO `gwshop_area_china` VALUES ('230506', '4', '宝山区', '230500', '155131');
INSERT INTO `gwshop_area_china` VALUES ('230521', '4', '集贤县', '230500', '155900');
INSERT INTO `gwshop_area_china` VALUES ('230522', '4', '友谊县', '230500', '155800');
INSERT INTO `gwshop_area_china` VALUES ('230523', '4', '宝清县', '230500', '155600');
INSERT INTO `gwshop_area_china` VALUES ('230524', '4', '饶河县', '230500', '155700');
INSERT INTO `gwshop_area_china` VALUES ('230525', '4', '其它区', '230500', '');
INSERT INTO `gwshop_area_china` VALUES ('230600', '3', '大庆市', '230000', '163000');
INSERT INTO `gwshop_area_china` VALUES ('230602', '4', '萨尔图区', '230600', '163311');
INSERT INTO `gwshop_area_china` VALUES ('230603', '4', '龙凤区', '230600', '163711');
INSERT INTO `gwshop_area_china` VALUES ('230604', '4', '让胡路区', '230600', '163453');
INSERT INTO `gwshop_area_china` VALUES ('230605', '4', '红岗区', '230600', '163512');
INSERT INTO `gwshop_area_china` VALUES ('230606', '4', '大同区', '230600', '163814');
INSERT INTO `gwshop_area_china` VALUES ('230621', '4', '肇州县', '230600', '166400');
INSERT INTO `gwshop_area_china` VALUES ('230622', '4', '肇源县', '230600', '166500');
INSERT INTO `gwshop_area_china` VALUES ('230623', '4', '林甸县', '230600', '166300');
INSERT INTO `gwshop_area_china` VALUES ('230624', '4', '杜尔伯特蒙古族自治县', '230600', '166200');
INSERT INTO `gwshop_area_china` VALUES ('230625', '4', '其它区', '230600', '');
INSERT INTO `gwshop_area_china` VALUES ('230700', '3', '伊春市', '230000', '153000');
INSERT INTO `gwshop_area_china` VALUES ('230702', '4', '伊春区', '230700', '153000');
INSERT INTO `gwshop_area_china` VALUES ('230703', '4', '南岔区', '230700', '153100');
INSERT INTO `gwshop_area_china` VALUES ('230704', '4', '友好区', '230700', '153031');
INSERT INTO `gwshop_area_china` VALUES ('230705', '4', '西林区', '230700', '153025');
INSERT INTO `gwshop_area_china` VALUES ('230706', '4', '翠峦区', '230700', '153013');
INSERT INTO `gwshop_area_china` VALUES ('230707', '4', '新青区', '230700', '153036');
INSERT INTO `gwshop_area_china` VALUES ('230708', '4', '美溪区', '230700', '153021');
INSERT INTO `gwshop_area_china` VALUES ('230709', '4', '金山屯区', '230700', '152026');
INSERT INTO `gwshop_area_china` VALUES ('230710', '4', '五营区', '230700', '153033');
INSERT INTO `gwshop_area_china` VALUES ('230711', '4', '乌马河区', '230700', '153011');
INSERT INTO `gwshop_area_china` VALUES ('230712', '4', '汤旺河区', '230700', '153037');
INSERT INTO `gwshop_area_china` VALUES ('230713', '4', '带岭区', '230700', '153106');
INSERT INTO `gwshop_area_china` VALUES ('230714', '4', '乌伊岭区', '230700', '153038');
INSERT INTO `gwshop_area_china` VALUES ('230715', '4', '红星区', '230700', '153035');
INSERT INTO `gwshop_area_china` VALUES ('230716', '4', '上甘岭区', '230700', '153032');
INSERT INTO `gwshop_area_china` VALUES ('230722', '4', '嘉荫县', '230700', '153200');
INSERT INTO `gwshop_area_china` VALUES ('230781', '4', '铁力市', '230700', '152500');
INSERT INTO `gwshop_area_china` VALUES ('230782', '4', '其它区', '230700', '');
INSERT INTO `gwshop_area_china` VALUES ('230800', '3', '佳木斯市', '230000', '154000');
INSERT INTO `gwshop_area_china` VALUES ('230802', '4', '永红区', '230800', '154003');
INSERT INTO `gwshop_area_china` VALUES ('230803', '4', '向阳区', '230800', '154002');
INSERT INTO `gwshop_area_china` VALUES ('230804', '4', '前进区', '230800', '154002');
INSERT INTO `gwshop_area_china` VALUES ('230805', '4', '东风区', '230800', '154005');
INSERT INTO `gwshop_area_china` VALUES ('230811', '4', '郊区', '230800', '154004');
INSERT INTO `gwshop_area_china` VALUES ('230822', '4', '桦南县', '230800', '154400');
INSERT INTO `gwshop_area_china` VALUES ('230826', '4', '桦川县', '230800', '154300');
INSERT INTO `gwshop_area_china` VALUES ('230828', '4', '汤原县', '230800', '154700');
INSERT INTO `gwshop_area_china` VALUES ('230833', '4', '抚远县', '230800', '156500');
INSERT INTO `gwshop_area_china` VALUES ('230881', '4', '同江市', '230800', '156400');
INSERT INTO `gwshop_area_china` VALUES ('230882', '4', '富锦市', '230800', '156100');
INSERT INTO `gwshop_area_china` VALUES ('230883', '4', '其它区', '230800', '');
INSERT INTO `gwshop_area_china` VALUES ('230900', '3', '七台河市', '230000', '154600');
INSERT INTO `gwshop_area_china` VALUES ('230902', '4', '新兴区', '230900', '154604');
INSERT INTO `gwshop_area_china` VALUES ('230903', '4', '桃山区', '230900', '154600');
INSERT INTO `gwshop_area_china` VALUES ('230904', '4', '茄子河区', '230900', '154622');
INSERT INTO `gwshop_area_china` VALUES ('230921', '4', '勃利县', '230900', '154500');
INSERT INTO `gwshop_area_china` VALUES ('230922', '4', '其它区', '230900', '');
INSERT INTO `gwshop_area_china` VALUES ('231000', '3', '牡丹江市', '230000', '157000');
INSERT INTO `gwshop_area_china` VALUES ('231002', '4', '东安区', '231000', '157000');
INSERT INTO `gwshop_area_china` VALUES ('231003', '4', '阳明区', '231000', '157013');
INSERT INTO `gwshop_area_china` VALUES ('231004', '4', '爱民区', '231000', '157009');
INSERT INTO `gwshop_area_china` VALUES ('231005', '4', '西安区', '231000', '157000');
INSERT INTO `gwshop_area_china` VALUES ('231024', '4', '东宁县', '231000', '157200');
INSERT INTO `gwshop_area_china` VALUES ('231025', '4', '林口县', '231000', '157600');
INSERT INTO `gwshop_area_china` VALUES ('231081', '4', '绥芬河市', '231000', '157300');
INSERT INTO `gwshop_area_china` VALUES ('231083', '4', '海林市', '231000', '157100');
INSERT INTO `gwshop_area_china` VALUES ('231084', '4', '宁安市', '231000', '157400');
INSERT INTO `gwshop_area_china` VALUES ('231085', '4', '穆棱市', '231000', '157500');
INSERT INTO `gwshop_area_china` VALUES ('231086', '4', '其它区', '231000', '');
INSERT INTO `gwshop_area_china` VALUES ('231100', '3', '黑河市', '230000', '164300');
INSERT INTO `gwshop_area_china` VALUES ('231102', '4', '爱辉区', '231100', '164300');
INSERT INTO `gwshop_area_china` VALUES ('231121', '4', '嫩江县', '231100', '161400');
INSERT INTO `gwshop_area_china` VALUES ('231123', '4', '逊克县', '231100', '164400');
INSERT INTO `gwshop_area_china` VALUES ('231124', '4', '孙吴县', '231100', '164200');
INSERT INTO `gwshop_area_china` VALUES ('231181', '4', '北安市', '231100', '164000');
INSERT INTO `gwshop_area_china` VALUES ('231182', '4', '五大连池市', '231100', '164100');
INSERT INTO `gwshop_area_china` VALUES ('231183', '4', '其它区', '231100', '');
INSERT INTO `gwshop_area_china` VALUES ('231200', '3', '绥化市', '230000', '152000');
INSERT INTO `gwshop_area_china` VALUES ('231202', '4', '北林区', '231200', '152000');
INSERT INTO `gwshop_area_china` VALUES ('231221', '4', '望奎县', '231200', '152100');
INSERT INTO `gwshop_area_china` VALUES ('231222', '4', '兰西县', '231200', '151500');
INSERT INTO `gwshop_area_china` VALUES ('231223', '4', '青冈县', '231200', '151600');
INSERT INTO `gwshop_area_china` VALUES ('231224', '4', '庆安县', '231200', '152400');
INSERT INTO `gwshop_area_china` VALUES ('231225', '4', '明水县', '231200', '151700');
INSERT INTO `gwshop_area_china` VALUES ('231226', '4', '绥棱县', '231200', '152200');
INSERT INTO `gwshop_area_china` VALUES ('231281', '4', '安达市', '231200', '151400');
INSERT INTO `gwshop_area_china` VALUES ('231282', '4', '肇东市', '231200', '151100');
INSERT INTO `gwshop_area_china` VALUES ('231283', '4', '海伦市', '231200', '152300');
INSERT INTO `gwshop_area_china` VALUES ('231284', '4', '其它区', '231200', '');
INSERT INTO `gwshop_area_china` VALUES ('232700', '3', '大兴安岭地区', '230000', '165000');
INSERT INTO `gwshop_area_china` VALUES ('232721', '4', '呼玛县', '232700', '165100');
INSERT INTO `gwshop_area_china` VALUES ('232722', '4', '塔河县', '232700', '165200');
INSERT INTO `gwshop_area_china` VALUES ('232723', '4', '漠河县', '232700', '165300');
INSERT INTO `gwshop_area_china` VALUES ('232724', '4', '加格达奇区', '232700', '165300');
INSERT INTO `gwshop_area_china` VALUES ('232725', '4', '其它区', '232700', '');
INSERT INTO `gwshop_area_china` VALUES ('310000', '2', '上海', '1', '');
INSERT INTO `gwshop_area_china` VALUES ('310100', '3', '上海市', '310000', '200000');
INSERT INTO `gwshop_area_china` VALUES ('310101', '4', '黄浦区', '310100', '200001');
INSERT INTO `gwshop_area_china` VALUES ('310103', '4', '卢湾区', '310100', '200020');
INSERT INTO `gwshop_area_china` VALUES ('310104', '4', '徐汇区', '310100', '200030');
INSERT INTO `gwshop_area_china` VALUES ('310105', '4', '长宁区', '310100', '200050');
INSERT INTO `gwshop_area_china` VALUES ('310106', '4', '静安区', '310100', '200040');
INSERT INTO `gwshop_area_china` VALUES ('310107', '4', '普陀区', '310100', '200062');
INSERT INTO `gwshop_area_china` VALUES ('310108', '4', '闸北区', '310100', '200070');
INSERT INTO `gwshop_area_china` VALUES ('310109', '4', '虹口区', '310100', '200080');
INSERT INTO `gwshop_area_china` VALUES ('310110', '4', '杨浦区', '310100', '200082');
INSERT INTO `gwshop_area_china` VALUES ('310112', '4', '闵行区', '310100', '201100');
INSERT INTO `gwshop_area_china` VALUES ('310113', '4', '宝山区', '310100', '201900');
INSERT INTO `gwshop_area_china` VALUES ('310114', '4', '嘉定区', '310100', '201800');
INSERT INTO `gwshop_area_china` VALUES ('310115', '4', '浦东新区', '310100', '200120');
INSERT INTO `gwshop_area_china` VALUES ('310116', '4', '金山区', '310100', '201540');
INSERT INTO `gwshop_area_china` VALUES ('310117', '4', '松江区', '310100', '201600');
INSERT INTO `gwshop_area_china` VALUES ('310118', '4', '青浦区', '310100', '201700');
INSERT INTO `gwshop_area_china` VALUES ('310119', '4', '南汇区', '310100', '201300');
INSERT INTO `gwshop_area_china` VALUES ('310120', '4', '奉贤区', '310100', '201400');
INSERT INTO `gwshop_area_china` VALUES ('310152', '4', '川沙区', '310100', '');
INSERT INTO `gwshop_area_china` VALUES ('310230', '4', '崇明县', '310100', '202150');
INSERT INTO `gwshop_area_china` VALUES ('310231', '4', '其它区', '310100', '');
INSERT INTO `gwshop_area_china` VALUES ('320000', '2', '江苏省', '1', '');
INSERT INTO `gwshop_area_china` VALUES ('320100', '3', '南京市', '320000', '210000');
INSERT INTO `gwshop_area_china` VALUES ('320102', '4', '玄武区', '320100', '210018');
INSERT INTO `gwshop_area_china` VALUES ('320103', '4', '白下区', '320100', '210002');
INSERT INTO `gwshop_area_china` VALUES ('320104', '4', '秦淮区', '320100', '210001');
INSERT INTO `gwshop_area_china` VALUES ('320105', '4', '建邺区', '320100', '210004');
INSERT INTO `gwshop_area_china` VALUES ('320106', '4', '鼓楼区', '320100', '210009');
INSERT INTO `gwshop_area_china` VALUES ('320107', '4', '下关区', '320100', '210011');
INSERT INTO `gwshop_area_china` VALUES ('320111', '4', '浦口区', '320100', '211800');
INSERT INTO `gwshop_area_china` VALUES ('320113', '4', '栖霞区', '320100', '210046');
INSERT INTO `gwshop_area_china` VALUES ('320114', '4', '雨花台区', '320100', '210012');
INSERT INTO `gwshop_area_china` VALUES ('320115', '4', '江宁区', '320100', '211100');
INSERT INTO `gwshop_area_china` VALUES ('320116', '4', '六合区', '320100', '211500');
INSERT INTO `gwshop_area_china` VALUES ('320124', '4', '溧水县', '320100', '211200');
INSERT INTO `gwshop_area_china` VALUES ('320125', '4', '高淳县', '320100', '211300');
INSERT INTO `gwshop_area_china` VALUES ('320126', '4', '其它区', '320100', '');
INSERT INTO `gwshop_area_china` VALUES ('320200', '3', '无锡市', '320000', '214000');
INSERT INTO `gwshop_area_china` VALUES ('320202', '4', '崇安区', '320200', '214002');
INSERT INTO `gwshop_area_china` VALUES ('320203', '4', '南长区', '320200', '214021');
INSERT INTO `gwshop_area_china` VALUES ('320204', '4', '北塘区', '320200', '214044');
INSERT INTO `gwshop_area_china` VALUES ('320205', '4', '锡山区', '320200', '214101');
INSERT INTO `gwshop_area_china` VALUES ('320206', '4', '惠山区', '320200', '214187');
INSERT INTO `gwshop_area_china` VALUES ('320211', '4', '滨湖区', '320200', '214062');
INSERT INTO `gwshop_area_china` VALUES ('320281', '4', '江阴市', '320200', '214400');
INSERT INTO `gwshop_area_china` VALUES ('320282', '4', '宜兴市', '320200', '214200');
INSERT INTO `gwshop_area_china` VALUES ('320296', '4', '新区', '320200', '');
INSERT INTO `gwshop_area_china` VALUES ('320297', '4', '其它区', '320200', '');
INSERT INTO `gwshop_area_china` VALUES ('320300', '3', '徐州市', '320000', '221000');
INSERT INTO `gwshop_area_china` VALUES ('320302', '4', '鼓楼区', '320300', '220005');
INSERT INTO `gwshop_area_china` VALUES ('320303', '4', '云龙区', '320300', '220009');
INSERT INTO `gwshop_area_china` VALUES ('320304', '4', '九里区', '320300', '220040');
INSERT INTO `gwshop_area_china` VALUES ('320305', '4', '贾汪区', '320300', '220011');
INSERT INTO `gwshop_area_china` VALUES ('320311', '4', '泉山区', '320300', '220006');
INSERT INTO `gwshop_area_china` VALUES ('320321', '4', '丰县', '320300', '221700');
INSERT INTO `gwshop_area_china` VALUES ('320322', '4', '沛县', '320300', '221600');
INSERT INTO `gwshop_area_china` VALUES ('320323', '4', '铜山县', '320300', '221112');
INSERT INTO `gwshop_area_china` VALUES ('320324', '4', '睢宁县', '320300', '221200');
INSERT INTO `gwshop_area_china` VALUES ('320381', '4', '新沂市', '320300', '221400');
INSERT INTO `gwshop_area_china` VALUES ('320382', '4', '邳州市', '320300', '221300');
INSERT INTO `gwshop_area_china` VALUES ('320383', '4', '其它区', '320300', '');
INSERT INTO `gwshop_area_china` VALUES ('320400', '3', '常州市', '320000', '213000');
INSERT INTO `gwshop_area_china` VALUES ('320402', '4', '天宁区', '320400', '213003');
INSERT INTO `gwshop_area_china` VALUES ('320404', '4', '钟楼区', '320400', '213002');
INSERT INTO `gwshop_area_china` VALUES ('320405', '4', '戚墅堰区', '320400', '213011');
INSERT INTO `gwshop_area_china` VALUES ('320411', '4', '新北区', '320400', '213001');
INSERT INTO `gwshop_area_china` VALUES ('320412', '4', '武进区', '320400', '213161');
INSERT INTO `gwshop_area_china` VALUES ('320481', '4', '溧阳市', '320400', '213300');
INSERT INTO `gwshop_area_china` VALUES ('320482', '4', '金坛市', '320400', '213200');
INSERT INTO `gwshop_area_china` VALUES ('320483', '4', '其它区', '320400', '');
INSERT INTO `gwshop_area_china` VALUES ('320500', '3', '苏州市', '320000', '215000');
INSERT INTO `gwshop_area_china` VALUES ('320502', '4', '沧浪区', '320500', '215006');
INSERT INTO `gwshop_area_china` VALUES ('320503', '4', '平江区', '320500', '215005');
INSERT INTO `gwshop_area_china` VALUES ('320504', '4', '金阊区', '320500', '215008');
INSERT INTO `gwshop_area_china` VALUES ('320505', '4', '虎丘区', '320500', '215004');
INSERT INTO `gwshop_area_china` VALUES ('320506', '4', '吴中区', '320500', '215128');
INSERT INTO `gwshop_area_china` VALUES ('320507', '4', '相城区', '320500', '215131');
INSERT INTO `gwshop_area_china` VALUES ('320581', '4', '常熟市', '320500', '215500');
INSERT INTO `gwshop_area_china` VALUES ('320582', '4', '张家港市', '320500', '215600');
INSERT INTO `gwshop_area_china` VALUES ('320583', '4', '昆山市', '320500', '215300');
INSERT INTO `gwshop_area_china` VALUES ('320584', '4', '吴江市', '320500', '215200');
INSERT INTO `gwshop_area_china` VALUES ('320585', '4', '太仓市', '320500', '215400');
INSERT INTO `gwshop_area_china` VALUES ('320594', '4', '新区', '320500', '');
INSERT INTO `gwshop_area_china` VALUES ('320595', '4', '园区', '320500', '');
INSERT INTO `gwshop_area_china` VALUES ('320596', '4', '其它区', '320500', '');
INSERT INTO `gwshop_area_china` VALUES ('320600', '3', '南通市', '320000', '226000');
INSERT INTO `gwshop_area_china` VALUES ('320602', '4', '崇川区', '320600', '226001');
INSERT INTO `gwshop_area_china` VALUES ('320611', '4', '港闸区', '320600', '226001');
INSERT INTO `gwshop_area_china` VALUES ('320612', '4', '通州区', '320600', '226321');
INSERT INTO `gwshop_area_china` VALUES ('320621', '4', '海安县', '320600', '226600');
INSERT INTO `gwshop_area_china` VALUES ('320623', '4', '如东县', '320600', '226400');
INSERT INTO `gwshop_area_china` VALUES ('320681', '4', '启东市', '320600', '226200');
INSERT INTO `gwshop_area_china` VALUES ('320682', '4', '如皋市', '320600', '226500');
INSERT INTO `gwshop_area_china` VALUES ('320683', '4', '通州市', '320600', '226300');
INSERT INTO `gwshop_area_china` VALUES ('320684', '4', '海门市', '320600', '226100');
INSERT INTO `gwshop_area_china` VALUES ('320693', '4', '开发区', '320600', '');
INSERT INTO `gwshop_area_china` VALUES ('320694', '4', '其它区', '320600', '');
INSERT INTO `gwshop_area_china` VALUES ('320700', '3', '连云港市', '320000', '222000');
INSERT INTO `gwshop_area_china` VALUES ('320703', '4', '连云区', '320700', '222042');
INSERT INTO `gwshop_area_china` VALUES ('320705', '4', '新浦区', '320700', '222003');
INSERT INTO `gwshop_area_china` VALUES ('320706', '4', '海州区', '320700', '222023');
INSERT INTO `gwshop_area_china` VALUES ('320721', '4', '赣榆县', '320700', '222100');
INSERT INTO `gwshop_area_china` VALUES ('320722', '4', '东海县', '320700', '222300');
INSERT INTO `gwshop_area_china` VALUES ('320723', '4', '灌云县', '320700', '222200');
INSERT INTO `gwshop_area_china` VALUES ('320724', '4', '灌南县', '320700', '222500');
INSERT INTO `gwshop_area_china` VALUES ('320725', '4', '其它区', '320700', '');
INSERT INTO `gwshop_area_china` VALUES ('320800', '3', '淮安市', '320000', '223200');
INSERT INTO `gwshop_area_china` VALUES ('320802', '4', '清河区', '320800', '223001');
INSERT INTO `gwshop_area_china` VALUES ('320803', '4', '楚州区', '320800', '223200');
INSERT INTO `gwshop_area_china` VALUES ('320804', '4', '淮阴区', '320800', '223000');
INSERT INTO `gwshop_area_china` VALUES ('320811', '4', '清浦区', '320800', '223002');
INSERT INTO `gwshop_area_china` VALUES ('320826', '4', '涟水县', '320800', '223400');
INSERT INTO `gwshop_area_china` VALUES ('320829', '4', '洪泽县', '320800', '223100');
INSERT INTO `gwshop_area_china` VALUES ('320830', '4', '盱眙县', '320800', '211700');
INSERT INTO `gwshop_area_china` VALUES ('320831', '4', '金湖县', '320800', '211600');
INSERT INTO `gwshop_area_china` VALUES ('320832', '4', '其它区', '320800', '');
INSERT INTO `gwshop_area_china` VALUES ('320900', '3', '盐城市', '320000', '224000');
INSERT INTO `gwshop_area_china` VALUES ('320902', '4', '亭湖区', '320900', '224005');
INSERT INTO `gwshop_area_china` VALUES ('320903', '4', '盐都区', '320900', '224055');
INSERT INTO `gwshop_area_china` VALUES ('320921', '4', '响水县', '320900', '224600');
INSERT INTO `gwshop_area_china` VALUES ('320922', '4', '滨海县', '320900', '224500');
INSERT INTO `gwshop_area_china` VALUES ('320923', '4', '阜宁县', '320900', '224400');
INSERT INTO `gwshop_area_china` VALUES ('320924', '4', '射阳县', '320900', '224300');
INSERT INTO `gwshop_area_china` VALUES ('320925', '4', '建湖县', '320900', '224700');
INSERT INTO `gwshop_area_china` VALUES ('320981', '4', '东台市', '320900', '224200');
INSERT INTO `gwshop_area_china` VALUES ('320982', '4', '大丰市', '320900', '224100');
INSERT INTO `gwshop_area_china` VALUES ('320983', '4', '其它区', '320900', '');
INSERT INTO `gwshop_area_china` VALUES ('321000', '3', '扬州市', '320000', '225000');
INSERT INTO `gwshop_area_china` VALUES ('321002', '4', '广陵区', '321000', '225002');
INSERT INTO `gwshop_area_china` VALUES ('321003', '4', '邗江区', '321000', '225100');
INSERT INTO `gwshop_area_china` VALUES ('321011', '4', '维扬区', '321000', '225002');
INSERT INTO `gwshop_area_china` VALUES ('321023', '4', '宝应县', '321000', '225800');
INSERT INTO `gwshop_area_china` VALUES ('321081', '4', '仪征市', '321000', '211400');
INSERT INTO `gwshop_area_china` VALUES ('321084', '4', '高邮市', '321000', '225600');
INSERT INTO `gwshop_area_china` VALUES ('321088', '4', '江都市', '321000', '225200');
INSERT INTO `gwshop_area_china` VALUES ('321092', '4', '经济开发区', '321000', '');
INSERT INTO `gwshop_area_china` VALUES ('321093', '4', '其它区', '321000', '');
INSERT INTO `gwshop_area_china` VALUES ('321100', '3', '镇江市', '320000', '212000');
INSERT INTO `gwshop_area_china` VALUES ('321102', '4', '京口区', '321100', '212001');
INSERT INTO `gwshop_area_china` VALUES ('321111', '4', '润州区', '321100', '212004');
INSERT INTO `gwshop_area_china` VALUES ('321112', '4', '丹徒区', '321100', '212001');
INSERT INTO `gwshop_area_china` VALUES ('321181', '4', '丹阳市', '321100', '212300');
INSERT INTO `gwshop_area_china` VALUES ('321182', '4', '扬中市', '321100', '212200');
INSERT INTO `gwshop_area_china` VALUES ('321183', '4', '句容市', '321100', '212400');
INSERT INTO `gwshop_area_china` VALUES ('321184', '4', '其它区', '321100', '');
INSERT INTO `gwshop_area_china` VALUES ('321200', '3', '泰州市', '320000', '225300');
INSERT INTO `gwshop_area_china` VALUES ('321202', '4', '海陵区', '321200', '225300');
INSERT INTO `gwshop_area_china` VALUES ('321203', '4', '高港区', '321200', '225321');
INSERT INTO `gwshop_area_china` VALUES ('321281', '4', '兴化市', '321200', '225700');
INSERT INTO `gwshop_area_china` VALUES ('321282', '4', '靖江市', '321200', '214500');
INSERT INTO `gwshop_area_china` VALUES ('321283', '4', '泰兴市', '321200', '225400');
INSERT INTO `gwshop_area_china` VALUES ('321284', '4', '姜堰市', '321200', '225500');
INSERT INTO `gwshop_area_china` VALUES ('321285', '4', '其它区', '321200', '');
INSERT INTO `gwshop_area_china` VALUES ('321300', '3', '宿迁市', '320000', '223800');
INSERT INTO `gwshop_area_china` VALUES ('321302', '4', '宿城区', '321300', '223800');
INSERT INTO `gwshop_area_china` VALUES ('321311', '4', '宿豫区', '321300', '223800');
INSERT INTO `gwshop_area_china` VALUES ('321322', '4', '沭阳县', '321300', '223600');
INSERT INTO `gwshop_area_china` VALUES ('321323', '4', '泗阳县', '321300', '223700');
INSERT INTO `gwshop_area_china` VALUES ('321324', '4', '泗洪县', '321300', '223900');
INSERT INTO `gwshop_area_china` VALUES ('321325', '4', '其它区', '321300', '');
INSERT INTO `gwshop_area_china` VALUES ('330000', '2', '浙江省', '1', '');
INSERT INTO `gwshop_area_china` VALUES ('330100', '3', '杭州市', '330000', '310000');
INSERT INTO `gwshop_area_china` VALUES ('330102', '4', '上城区', '330100', '311500');
INSERT INTO `gwshop_area_china` VALUES ('330103', '4', '下城区', '330100', '310006');
INSERT INTO `gwshop_area_china` VALUES ('330104', '4', '江干区', '330100', '310002');
INSERT INTO `gwshop_area_china` VALUES ('330105', '4', '拱墅区', '330100', '310011');
INSERT INTO `gwshop_area_china` VALUES ('330106', '4', '西湖区', '330100', '310013');
INSERT INTO `gwshop_area_china` VALUES ('330108', '4', '滨江区', '330100', '310051');
INSERT INTO `gwshop_area_china` VALUES ('330109', '4', '萧山区', '330100', '311200');
INSERT INTO `gwshop_area_china` VALUES ('330110', '4', '余杭区', '330100', '311100');
INSERT INTO `gwshop_area_china` VALUES ('330122', '4', '桐庐县', '330100', '311500');
INSERT INTO `gwshop_area_china` VALUES ('330127', '4', '淳安县', '330100', '311700');
INSERT INTO `gwshop_area_china` VALUES ('330182', '4', '建德市', '330100', '311600');
INSERT INTO `gwshop_area_china` VALUES ('330183', '4', '富阳市', '330100', '311400');
INSERT INTO `gwshop_area_china` VALUES ('330185', '4', '临安市', '330100', '311300');
INSERT INTO `gwshop_area_china` VALUES ('330186', '4', '其它区', '330100', '');
INSERT INTO `gwshop_area_china` VALUES ('330200', '3', '宁波市', '330000', '315000');
INSERT INTO `gwshop_area_china` VALUES ('330203', '4', '海曙区', '330200', '315000');
INSERT INTO `gwshop_area_china` VALUES ('330204', '4', '江东区', '330200', '315040');
INSERT INTO `gwshop_area_china` VALUES ('330205', '4', '江北区', '330200', '315020');
INSERT INTO `gwshop_area_china` VALUES ('330206', '4', '北仑区', '330200', '315800');
INSERT INTO `gwshop_area_china` VALUES ('330211', '4', '镇海区', '330200', '315200');
INSERT INTO `gwshop_area_china` VALUES ('330212', '4', '鄞州区', '330200', '315100');
INSERT INTO `gwshop_area_china` VALUES ('330225', '4', '象山县', '330200', '315700');
INSERT INTO `gwshop_area_china` VALUES ('330226', '4', '宁海县', '330200', '315600');
INSERT INTO `gwshop_area_china` VALUES ('330281', '4', '余姚市', '330200', '315400');
INSERT INTO `gwshop_area_china` VALUES ('330282', '4', '慈溪市', '330200', '315300');
INSERT INTO `gwshop_area_china` VALUES ('330283', '4', '奉化市', '330200', '315500');
INSERT INTO `gwshop_area_china` VALUES ('330284', '4', '其它区', '330200', '');
INSERT INTO `gwshop_area_china` VALUES ('330300', '3', '温州市', '330000', '325000');
INSERT INTO `gwshop_area_china` VALUES ('330302', '4', '鹿城区', '330300', '325000');
INSERT INTO `gwshop_area_china` VALUES ('330303', '4', '龙湾区', '330300', '325024');
INSERT INTO `gwshop_area_china` VALUES ('330304', '4', '瓯海区', '330300', '325005');
INSERT INTO `gwshop_area_china` VALUES ('330322', '4', '洞头县', '330300', '325700');
INSERT INTO `gwshop_area_china` VALUES ('330324', '4', '永嘉县', '330300', '325100');
INSERT INTO `gwshop_area_china` VALUES ('330326', '4', '平阳县', '330300', '325400');
INSERT INTO `gwshop_area_china` VALUES ('330327', '4', '苍南县', '330300', '325800');
INSERT INTO `gwshop_area_china` VALUES ('330328', '4', '文成县', '330300', '325300');
INSERT INTO `gwshop_area_china` VALUES ('330329', '4', '泰顺县', '330300', '325500');
INSERT INTO `gwshop_area_china` VALUES ('330381', '4', '瑞安市', '330300', '325200');
INSERT INTO `gwshop_area_china` VALUES ('330382', '4', '乐清市', '330300', '325600');
INSERT INTO `gwshop_area_china` VALUES ('330383', '4', '其它区', '330300', '');
INSERT INTO `gwshop_area_china` VALUES ('330400', '3', '嘉兴市', '330000', '314000');
INSERT INTO `gwshop_area_china` VALUES ('330402', '4', '南湖区', '330400', '314000');
INSERT INTO `gwshop_area_china` VALUES ('330411', '4', '秀洲区', '330400', '314001');
INSERT INTO `gwshop_area_china` VALUES ('330421', '4', '嘉善县', '330400', '314100');
INSERT INTO `gwshop_area_china` VALUES ('330424', '4', '海盐县', '330400', '314300');
INSERT INTO `gwshop_area_china` VALUES ('330481', '4', '海宁市', '330400', '314400');
INSERT INTO `gwshop_area_china` VALUES ('330482', '4', '平湖市', '330400', '314200');
INSERT INTO `gwshop_area_china` VALUES ('330483', '4', '桐乡市', '330400', '314500');
INSERT INTO `gwshop_area_china` VALUES ('330484', '4', '其它区', '330400', '');
INSERT INTO `gwshop_area_china` VALUES ('330500', '3', '湖州市', '330000', '313000');
INSERT INTO `gwshop_area_china` VALUES ('330502', '4', '吴兴区', '330500', '313000');
INSERT INTO `gwshop_area_china` VALUES ('330503', '4', '南浔区', '330500', '313009');
INSERT INTO `gwshop_area_china` VALUES ('330521', '4', '德清县', '330500', '313200');
INSERT INTO `gwshop_area_china` VALUES ('330522', '4', '长兴县', '330500', '313100');
INSERT INTO `gwshop_area_china` VALUES ('330523', '4', '安吉县', '330500', '313300');
INSERT INTO `gwshop_area_china` VALUES ('330524', '4', '其它区', '330500', '');
INSERT INTO `gwshop_area_china` VALUES ('330600', '3', '绍兴市', '330000', '312000');
INSERT INTO `gwshop_area_china` VALUES ('330602', '4', '越城区', '330600', '312000');
INSERT INTO `gwshop_area_china` VALUES ('330621', '4', '绍兴县', '330600', '312000');
INSERT INTO `gwshop_area_china` VALUES ('330624', '4', '新昌县', '330600', '312500');
INSERT INTO `gwshop_area_china` VALUES ('330681', '4', '诸暨市', '330600', '311800');
INSERT INTO `gwshop_area_china` VALUES ('330682', '4', '上虞市', '330600', '312300');
INSERT INTO `gwshop_area_china` VALUES ('330683', '4', '嵊州市', '330600', '312400');
INSERT INTO `gwshop_area_china` VALUES ('330684', '4', '其它区', '330600', '');
INSERT INTO `gwshop_area_china` VALUES ('330700', '3', '金华市', '330000', '321000');
INSERT INTO `gwshop_area_china` VALUES ('330702', '4', '婺城区', '330700', '321051');
INSERT INTO `gwshop_area_china` VALUES ('330703', '4', '金东区', '330700', '321002');
INSERT INTO `gwshop_area_china` VALUES ('330723', '4', '武义县', '330700', '321200');
INSERT INTO `gwshop_area_china` VALUES ('330726', '4', '浦江县', '330700', '322200');
INSERT INTO `gwshop_area_china` VALUES ('330727', '4', '磐安县', '330700', '322300');
INSERT INTO `gwshop_area_china` VALUES ('330781', '4', '兰溪市', '330700', '321100');
INSERT INTO `gwshop_area_china` VALUES ('330782', '4', '义乌市', '330700', '322000');
INSERT INTO `gwshop_area_china` VALUES ('330783', '4', '东阳市', '330700', '322100');
INSERT INTO `gwshop_area_china` VALUES ('330784', '4', '永康市', '330700', '321300');
INSERT INTO `gwshop_area_china` VALUES ('330785', '4', '其它区', '330700', '');
INSERT INTO `gwshop_area_china` VALUES ('330800', '3', '衢州市', '330000', '324000');
INSERT INTO `gwshop_area_china` VALUES ('330802', '4', '柯城区', '330800', '324000');
INSERT INTO `gwshop_area_china` VALUES ('330803', '4', '衢江区', '330800', '324000');
INSERT INTO `gwshop_area_china` VALUES ('330822', '4', '常山县', '330800', '324200');
INSERT INTO `gwshop_area_china` VALUES ('330824', '4', '开化县', '330800', '324300');
INSERT INTO `gwshop_area_china` VALUES ('330825', '4', '龙游县', '330800', '324400');
INSERT INTO `gwshop_area_china` VALUES ('330881', '4', '江山市', '330800', '324100');
INSERT INTO `gwshop_area_china` VALUES ('330882', '4', '其它区', '330800', '');
INSERT INTO `gwshop_area_china` VALUES ('330900', '3', '舟山市', '330000', '316000');
INSERT INTO `gwshop_area_china` VALUES ('330902', '4', '定海区', '330900', '316000');
INSERT INTO `gwshop_area_china` VALUES ('330903', '4', '普陀区', '330900', '316100');
INSERT INTO `gwshop_area_china` VALUES ('330921', '4', '岱山县', '330900', '316200');
INSERT INTO `gwshop_area_china` VALUES ('330922', '4', '嵊泗县', '330900', '202400');
INSERT INTO `gwshop_area_china` VALUES ('330923', '4', '其它区', '330900', '');
INSERT INTO `gwshop_area_china` VALUES ('331000', '3', '台州市', '330000', '318000');
INSERT INTO `gwshop_area_china` VALUES ('331002', '4', '椒江区', '331000', '318000');
INSERT INTO `gwshop_area_china` VALUES ('331003', '4', '黄岩区', '331000', '318020');
INSERT INTO `gwshop_area_china` VALUES ('331004', '4', '路桥区', '331000', '318050');
INSERT INTO `gwshop_area_china` VALUES ('331021', '4', '玉环县', '331000', '317600');
INSERT INTO `gwshop_area_china` VALUES ('331022', '4', '三门县', '331000', '317100');
INSERT INTO `gwshop_area_china` VALUES ('331023', '4', '天台县', '331000', '317200');
INSERT INTO `gwshop_area_china` VALUES ('331024', '4', '仙居县', '331000', '317300');
INSERT INTO `gwshop_area_china` VALUES ('331081', '4', '温岭市', '331000', '317500');
INSERT INTO `gwshop_area_china` VALUES ('331082', '4', '临海市', '331000', '317000');
INSERT INTO `gwshop_area_china` VALUES ('331083', '4', '其它区', '331000', '');
INSERT INTO `gwshop_area_china` VALUES ('331100', '3', '丽水市', '330000', '323000');
INSERT INTO `gwshop_area_china` VALUES ('331102', '4', '莲都区', '331100', '323000');
INSERT INTO `gwshop_area_china` VALUES ('331121', '4', '青田县', '331100', '323900');
INSERT INTO `gwshop_area_china` VALUES ('331122', '4', '缙云县', '331100', '321400');
INSERT INTO `gwshop_area_china` VALUES ('331123', '4', '遂昌县', '331100', '323300');
INSERT INTO `gwshop_area_china` VALUES ('331124', '4', '松阳县', '331100', '323400');
INSERT INTO `gwshop_area_china` VALUES ('331125', '4', '云和县', '331100', '323600');
INSERT INTO `gwshop_area_china` VALUES ('331126', '4', '庆元县', '331100', '323800');
INSERT INTO `gwshop_area_china` VALUES ('331127', '4', '景宁畲族自治县', '331100', '323500');
INSERT INTO `gwshop_area_china` VALUES ('331181', '4', '龙泉市', '331100', '323700');
INSERT INTO `gwshop_area_china` VALUES ('331182', '4', '其它区', '331100', '');
INSERT INTO `gwshop_area_china` VALUES ('340000', '2', '安徽省', '1', '');
INSERT INTO `gwshop_area_china` VALUES ('340100', '3', '合肥市', '340000', '230000');
INSERT INTO `gwshop_area_china` VALUES ('340102', '4', '瑶海区', '340100', '230011');
INSERT INTO `gwshop_area_china` VALUES ('340103', '4', '庐阳区', '340100', '230001');
INSERT INTO `gwshop_area_china` VALUES ('340104', '4', '蜀山区', '340100', '230061');
INSERT INTO `gwshop_area_china` VALUES ('340111', '4', '包河区', '340100', '230041');
INSERT INTO `gwshop_area_china` VALUES ('340121', '4', '长丰县', '340100', '231100');
INSERT INTO `gwshop_area_china` VALUES ('340122', '4', '肥东县', '340100', '231600');
INSERT INTO `gwshop_area_china` VALUES ('340123', '4', '肥西县', '340100', '231200');
INSERT INTO `gwshop_area_china` VALUES ('340151', '4', '高新区', '340100', '');
INSERT INTO `gwshop_area_china` VALUES ('340191', '4', '中区', '340100', '');
INSERT INTO `gwshop_area_china` VALUES ('340192', '4', '其它区', '340100', '');
INSERT INTO `gwshop_area_china` VALUES ('340200', '3', '芜湖市', '340000', '241000');
INSERT INTO `gwshop_area_china` VALUES ('340202', '4', '镜湖区', '340200', '241000');
INSERT INTO `gwshop_area_china` VALUES ('340203', '4', '弋江区', '340200', '241000');
INSERT INTO `gwshop_area_china` VALUES ('340207', '4', '鸠江区', '340200', '241000');
INSERT INTO `gwshop_area_china` VALUES ('340208', '4', '三山区', '340200', '241000');
INSERT INTO `gwshop_area_china` VALUES ('340221', '4', '芜湖县', '340200', '241100');
INSERT INTO `gwshop_area_china` VALUES ('340222', '4', '繁昌县', '340200', '241200');
INSERT INTO `gwshop_area_china` VALUES ('340223', '4', '南陵县', '340200', '242400');
INSERT INTO `gwshop_area_china` VALUES ('340224', '4', '其它区', '340200', '');
INSERT INTO `gwshop_area_china` VALUES ('340300', '3', '蚌埠市', '340000', '233000');
INSERT INTO `gwshop_area_china` VALUES ('340302', '4', '龙子湖区', '340300', '233000');
INSERT INTO `gwshop_area_china` VALUES ('340303', '4', '蚌山区', '340300', '233000');
INSERT INTO `gwshop_area_china` VALUES ('340304', '4', '禹会区', '340300', '233010');
INSERT INTO `gwshop_area_china` VALUES ('340311', '4', '淮上区', '340300', '233002');
INSERT INTO `gwshop_area_china` VALUES ('340321', '4', '怀远县', '340300', '233400');
INSERT INTO `gwshop_area_china` VALUES ('340322', '4', '五河县', '340300', '233300');
INSERT INTO `gwshop_area_china` VALUES ('340323', '4', '固镇县', '340300', '233200');
INSERT INTO `gwshop_area_china` VALUES ('340324', '4', '其它区', '340300', '');
INSERT INTO `gwshop_area_china` VALUES ('340400', '3', '淮南市', '340000', '232000');
INSERT INTO `gwshop_area_china` VALUES ('340402', '4', '大通区', '340400', '232033');
INSERT INTO `gwshop_area_china` VALUES ('340403', '4', '田家庵区', '340400', '232000');
INSERT INTO `gwshop_area_china` VALUES ('340404', '4', '谢家集区', '340400', '232052');
INSERT INTO `gwshop_area_china` VALUES ('340405', '4', '八公山区', '340400', '232072');
INSERT INTO `gwshop_area_china` VALUES ('340406', '4', '潘集区', '340400', '232082');
INSERT INTO `gwshop_area_china` VALUES ('340421', '4', '凤台县', '340400', '232100');
INSERT INTO `gwshop_area_china` VALUES ('340422', '4', '其它区', '340400', '');
INSERT INTO `gwshop_area_china` VALUES ('340500', '3', '马鞍山市', '340000', '243000');
INSERT INTO `gwshop_area_china` VALUES ('340502', '4', '金家庄区', '340500', '243021');
INSERT INTO `gwshop_area_china` VALUES ('340503', '4', '花山区', '340500', '243000');
INSERT INTO `gwshop_area_china` VALUES ('340504', '4', '雨山区', '340500', '243071');
INSERT INTO `gwshop_area_china` VALUES ('340521', '4', '当涂县', '340500', '243100');
INSERT INTO `gwshop_area_china` VALUES ('340522', '4', '其它区', '340500', '');
INSERT INTO `gwshop_area_china` VALUES ('340600', '3', '淮北市', '340000', '235000');
INSERT INTO `gwshop_area_china` VALUES ('340602', '4', '杜集区', '340600', '235047');
INSERT INTO `gwshop_area_china` VALUES ('340603', '4', '相山区', '340600', '235000');
INSERT INTO `gwshop_area_china` VALUES ('340604', '4', '烈山区', '340600', '235025');
INSERT INTO `gwshop_area_china` VALUES ('340621', '4', '濉溪县', '340600', '235100');
INSERT INTO `gwshop_area_china` VALUES ('340622', '4', '其它区', '340600', '');
INSERT INTO `gwshop_area_china` VALUES ('340700', '3', '铜陵市', '340000', '244000');
INSERT INTO `gwshop_area_china` VALUES ('340702', '4', '铜官山区', '340700', '244000');
INSERT INTO `gwshop_area_china` VALUES ('340703', '4', '狮子山区', '340700', '244031');
INSERT INTO `gwshop_area_china` VALUES ('340711', '4', '郊区', '340700', '244000');
INSERT INTO `gwshop_area_china` VALUES ('340721', '4', '铜陵县', '340700', '244100');
INSERT INTO `gwshop_area_china` VALUES ('340722', '4', '其它区', '340700', '');
INSERT INTO `gwshop_area_china` VALUES ('340800', '3', '安庆市', '340000', '246000');
INSERT INTO `gwshop_area_china` VALUES ('340802', '4', '迎江区', '340800', '246003');
INSERT INTO `gwshop_area_china` VALUES ('340803', '4', '大观区', '340800', '246004');
INSERT INTO `gwshop_area_china` VALUES ('340811', '4', '宜秀区', '340800', '246003');
INSERT INTO `gwshop_area_china` VALUES ('340822', '4', '怀宁县', '340800', '246100');
INSERT INTO `gwshop_area_china` VALUES ('340823', '4', '枞阳县', '340800', '246700');
INSERT INTO `gwshop_area_china` VALUES ('340824', '4', '潜山县', '340800', '246300');
INSERT INTO `gwshop_area_china` VALUES ('340825', '4', '太湖县', '340800', '246400');
INSERT INTO `gwshop_area_china` VALUES ('340826', '4', '宿松县', '340800', '246500');
INSERT INTO `gwshop_area_china` VALUES ('340827', '4', '望江县', '340800', '246200');
INSERT INTO `gwshop_area_china` VALUES ('340828', '4', '岳西县', '340800', '246600');
INSERT INTO `gwshop_area_china` VALUES ('340881', '4', '桐城市', '340800', '231400');
INSERT INTO `gwshop_area_china` VALUES ('340882', '4', '其它区', '340800', '');
INSERT INTO `gwshop_area_china` VALUES ('341000', '3', '黄山市', '340000', '245000');
INSERT INTO `gwshop_area_china` VALUES ('341002', '4', '屯溪区', '341000', '245000');
INSERT INTO `gwshop_area_china` VALUES ('341003', '4', '黄山区', '341000', '242700');
INSERT INTO `gwshop_area_china` VALUES ('341004', '4', '徽州区', '341000', '245061');
INSERT INTO `gwshop_area_china` VALUES ('341021', '4', '歙县', '341000', '245200');
INSERT INTO `gwshop_area_china` VALUES ('341022', '4', '休宁县', '341000', '245400');
INSERT INTO `gwshop_area_china` VALUES ('341023', '4', '黟县', '341000', '245500');
INSERT INTO `gwshop_area_china` VALUES ('341024', '4', '祁门县', '341000', '245600');
INSERT INTO `gwshop_area_china` VALUES ('341025', '4', '其它区', '341000', '');
INSERT INTO `gwshop_area_china` VALUES ('341100', '3', '滁州市', '340000', '239000');
INSERT INTO `gwshop_area_china` VALUES ('341102', '4', '琅琊区', '341100', '239000');
INSERT INTO `gwshop_area_china` VALUES ('341103', '4', '南谯区', '341100', '239000');
INSERT INTO `gwshop_area_china` VALUES ('341122', '4', '来安县', '341100', '239200');
INSERT INTO `gwshop_area_china` VALUES ('341124', '4', '全椒县', '341100', '239500');
INSERT INTO `gwshop_area_china` VALUES ('341125', '4', '定远县', '341100', '233200');
INSERT INTO `gwshop_area_china` VALUES ('341126', '4', '凤阳县', '341100', '233100');
INSERT INTO `gwshop_area_china` VALUES ('341181', '4', '天长市', '341100', '239300');
INSERT INTO `gwshop_area_china` VALUES ('341182', '4', '明光市', '341100', '239400');
INSERT INTO `gwshop_area_china` VALUES ('341183', '4', '其它区', '341100', '');
INSERT INTO `gwshop_area_china` VALUES ('341200', '3', '阜阳市', '340000', '236000');
INSERT INTO `gwshop_area_china` VALUES ('341202', '4', '颍州区', '341200', '236001');
INSERT INTO `gwshop_area_china` VALUES ('341203', '4', '颍东区', '341200', '236058');
INSERT INTO `gwshop_area_china` VALUES ('341204', '4', '颍泉区', '341200', '236045');
INSERT INTO `gwshop_area_china` VALUES ('341221', '4', '临泉县', '341200', '236400');
INSERT INTO `gwshop_area_china` VALUES ('341222', '4', '太和县', '341200', '236600');
INSERT INTO `gwshop_area_china` VALUES ('341225', '4', '阜南县', '341200', '236300');
INSERT INTO `gwshop_area_china` VALUES ('341226', '4', '颍上县', '341200', '236200');
INSERT INTO `gwshop_area_china` VALUES ('341282', '4', '界首市', '341200', '236500');
INSERT INTO `gwshop_area_china` VALUES ('341283', '4', '其它区', '341200', '');
INSERT INTO `gwshop_area_china` VALUES ('341300', '3', '宿州市', '340000', '234000');
INSERT INTO `gwshop_area_china` VALUES ('341302', '4', '埇桥区', '341300', '234000');
INSERT INTO `gwshop_area_china` VALUES ('341321', '4', '砀山县', '341300', '235300');
INSERT INTO `gwshop_area_china` VALUES ('341322', '4', '萧县', '341300', '235200');
INSERT INTO `gwshop_area_china` VALUES ('341323', '4', '灵璧县', '341300', '234200');
INSERT INTO `gwshop_area_china` VALUES ('341324', '4', '泗县', '341300', '234300');
INSERT INTO `gwshop_area_china` VALUES ('341325', '4', '其它区', '341300', '');
INSERT INTO `gwshop_area_china` VALUES ('341400', '4', '巢湖市', '340100', '238000');
INSERT INTO `gwshop_area_china` VALUES ('341402', '4', '居巢区', '340100', '238000');
INSERT INTO `gwshop_area_china` VALUES ('341421', '4', '庐江县', '340100', '231500');
INSERT INTO `gwshop_area_china` VALUES ('341422', '4', '无为县', '340200', '238300');
INSERT INTO `gwshop_area_china` VALUES ('341423', '4', '含山县', '340500', '238100');
INSERT INTO `gwshop_area_china` VALUES ('341424', '4', '和县', '340500', '238200');
INSERT INTO `gwshop_area_china` VALUES ('341500', '3', '六安市', '340000', '237000');
INSERT INTO `gwshop_area_china` VALUES ('341502', '4', '金安区', '341500', '237005');
INSERT INTO `gwshop_area_china` VALUES ('341503', '4', '裕安区', '341500', '237010');
INSERT INTO `gwshop_area_china` VALUES ('341521', '4', '寿县', '341500', '232200');
INSERT INTO `gwshop_area_china` VALUES ('341522', '4', '霍邱县', '341500', '237400');
INSERT INTO `gwshop_area_china` VALUES ('341523', '4', '舒城县', '341500', '231300');
INSERT INTO `gwshop_area_china` VALUES ('341524', '4', '金寨县', '341500', '237300');
INSERT INTO `gwshop_area_china` VALUES ('341525', '4', '霍山县', '341500', '237200');
INSERT INTO `gwshop_area_china` VALUES ('341526', '4', '其它区', '341500', '');
INSERT INTO `gwshop_area_china` VALUES ('341600', '3', '亳州市', '340000', '236800');
INSERT INTO `gwshop_area_china` VALUES ('341602', '4', '谯城区', '341600', '236800');
INSERT INTO `gwshop_area_china` VALUES ('341621', '4', '涡阳县', '341600', '233600');
INSERT INTO `gwshop_area_china` VALUES ('341622', '4', '蒙城县', '341600', '233500');
INSERT INTO `gwshop_area_china` VALUES ('341623', '4', '利辛县', '341600', '236700');
INSERT INTO `gwshop_area_china` VALUES ('341624', '4', '其它区', '341600', '');
INSERT INTO `gwshop_area_china` VALUES ('341700', '3', '池州市', '340000', '247000');
INSERT INTO `gwshop_area_china` VALUES ('341702', '4', '贵池区', '341700', '247100');
INSERT INTO `gwshop_area_china` VALUES ('341721', '4', '东至县', '341700', '247200');
INSERT INTO `gwshop_area_china` VALUES ('341722', '4', '石台县', '341700', '245100');
INSERT INTO `gwshop_area_china` VALUES ('341723', '4', '青阳县', '341700', '242800');
INSERT INTO `gwshop_area_china` VALUES ('341724', '4', '其它区', '341700', '');
INSERT INTO `gwshop_area_china` VALUES ('341800', '3', '宣城市', '340000', '242000');
INSERT INTO `gwshop_area_china` VALUES ('341802', '4', '宣州区', '341800', '242000');
INSERT INTO `gwshop_area_china` VALUES ('341821', '4', '郎溪县', '341800', '242100');
INSERT INTO `gwshop_area_china` VALUES ('341822', '4', '广德县', '341800', '242200');
INSERT INTO `gwshop_area_china` VALUES ('341823', '4', '泾县', '341800', '242500');
INSERT INTO `gwshop_area_china` VALUES ('341824', '4', '绩溪县', '341800', '245300');
INSERT INTO `gwshop_area_china` VALUES ('341825', '4', '旌德县', '341800', '242600');
INSERT INTO `gwshop_area_china` VALUES ('341881', '4', '宁国市', '341800', '242300');
INSERT INTO `gwshop_area_china` VALUES ('341882', '4', '其它区', '341800', '');
INSERT INTO `gwshop_area_china` VALUES ('350000', '2', '福建省', '1', '');
INSERT INTO `gwshop_area_china` VALUES ('350100', '3', '福州市', '350000', '350000');
INSERT INTO `gwshop_area_china` VALUES ('350102', '4', '鼓楼区', '350100', '350001');
INSERT INTO `gwshop_area_china` VALUES ('350103', '4', '台江区', '350100', '350004');
INSERT INTO `gwshop_area_china` VALUES ('350104', '4', '仓山区', '350100', '350007');
INSERT INTO `gwshop_area_china` VALUES ('350105', '4', '马尾区', '350100', '350015');
INSERT INTO `gwshop_area_china` VALUES ('350111', '4', '晋安区', '350100', '350011');
INSERT INTO `gwshop_area_china` VALUES ('350121', '4', '闽侯县', '350100', '350100');
INSERT INTO `gwshop_area_china` VALUES ('350122', '4', '连江县', '350100', '350500');
INSERT INTO `gwshop_area_china` VALUES ('350123', '4', '罗源县', '350100', '350600');
INSERT INTO `gwshop_area_china` VALUES ('350124', '4', '闽清县', '350100', '350800');
INSERT INTO `gwshop_area_china` VALUES ('350125', '4', '永泰县', '350100', '350700');
INSERT INTO `gwshop_area_china` VALUES ('350128', '4', '平潭县', '350100', '350400');
INSERT INTO `gwshop_area_china` VALUES ('350181', '4', '福清市', '350100', '350300');
INSERT INTO `gwshop_area_china` VALUES ('350182', '4', '长乐市', '350100', '350200');
INSERT INTO `gwshop_area_china` VALUES ('350183', '4', '其它区', '350100', '');
INSERT INTO `gwshop_area_china` VALUES ('350200', '3', '厦门市', '350000', '361000');
INSERT INTO `gwshop_area_china` VALUES ('350203', '4', '思明区', '350200', '361001');
INSERT INTO `gwshop_area_china` VALUES ('350205', '4', '海沧区', '350200', '361026');
INSERT INTO `gwshop_area_china` VALUES ('350206', '4', '湖里区', '350200', '361006');
INSERT INTO `gwshop_area_china` VALUES ('350211', '4', '集美区', '350200', '361021');
INSERT INTO `gwshop_area_china` VALUES ('350212', '4', '同安区', '350200', '361100');
INSERT INTO `gwshop_area_china` VALUES ('350213', '4', '翔安区', '350200', '361101');
INSERT INTO `gwshop_area_china` VALUES ('350214', '4', '其它区', '350200', '');
INSERT INTO `gwshop_area_china` VALUES ('350300', '3', '莆田市', '350000', '351100');
INSERT INTO `gwshop_area_china` VALUES ('350302', '4', '城厢区', '350300', '351100');
INSERT INTO `gwshop_area_china` VALUES ('350303', '4', '涵江区', '350300', '351111');
INSERT INTO `gwshop_area_china` VALUES ('350304', '4', '荔城区', '350300', '351100');
INSERT INTO `gwshop_area_china` VALUES ('350305', '4', '秀屿区', '350300', '351152');
INSERT INTO `gwshop_area_china` VALUES ('350322', '4', '仙游县', '350300', '351200');
INSERT INTO `gwshop_area_china` VALUES ('350323', '4', '其它区', '350300', '');
INSERT INTO `gwshop_area_china` VALUES ('350400', '3', '三明市', '350000', '365000');
INSERT INTO `gwshop_area_china` VALUES ('350402', '4', '梅列区', '350400', '365000');
INSERT INTO `gwshop_area_china` VALUES ('350403', '4', '三元区', '350400', '365001');
INSERT INTO `gwshop_area_china` VALUES ('350421', '4', '明溪县', '350400', '365200');
INSERT INTO `gwshop_area_china` VALUES ('350423', '4', '清流县', '350400', '365300');
INSERT INTO `gwshop_area_china` VALUES ('350424', '4', '宁化县', '350400', '365400');
INSERT INTO `gwshop_area_china` VALUES ('350425', '4', '大田县', '350400', '366100');
INSERT INTO `gwshop_area_china` VALUES ('350426', '4', '尤溪县', '350400', '365100');
INSERT INTO `gwshop_area_china` VALUES ('350427', '4', '沙县', '350400', '365500');
INSERT INTO `gwshop_area_china` VALUES ('350428', '4', '将乐县', '350400', '353300');
INSERT INTO `gwshop_area_china` VALUES ('350429', '4', '泰宁县', '350400', '354400');
INSERT INTO `gwshop_area_china` VALUES ('350430', '4', '建宁县', '350400', '354500');
INSERT INTO `gwshop_area_china` VALUES ('350481', '4', '永安市', '350400', '366000');
INSERT INTO `gwshop_area_china` VALUES ('350482', '4', '其它区', '350400', '');
INSERT INTO `gwshop_area_china` VALUES ('350500', '3', '泉州市', '350000', '362000');
INSERT INTO `gwshop_area_china` VALUES ('350502', '4', '鲤城区', '350500', '362000');
INSERT INTO `gwshop_area_china` VALUES ('350503', '4', '丰泽区', '350500', '362000');
INSERT INTO `gwshop_area_china` VALUES ('350504', '4', '洛江区', '350500', '362011');
INSERT INTO `gwshop_area_china` VALUES ('350505', '4', '泉港区', '350500', '362801');
INSERT INTO `gwshop_area_china` VALUES ('350521', '4', '惠安县', '350500', '362100');
INSERT INTO `gwshop_area_china` VALUES ('350524', '4', '安溪县', '350500', '362400');
INSERT INTO `gwshop_area_china` VALUES ('350525', '4', '永春县', '350500', '362600');
INSERT INTO `gwshop_area_china` VALUES ('350526', '4', '德化县', '350500', '362500');
INSERT INTO `gwshop_area_china` VALUES ('350527', '4', '金门县', '350500', '362000');
INSERT INTO `gwshop_area_china` VALUES ('350581', '4', '石狮市', '350500', '362700');
INSERT INTO `gwshop_area_china` VALUES ('350582', '4', '晋江市', '350500', '362200');
INSERT INTO `gwshop_area_china` VALUES ('350583', '4', '南安市', '350500', '362300');
INSERT INTO `gwshop_area_china` VALUES ('350584', '4', '其它区', '350500', '');
INSERT INTO `gwshop_area_china` VALUES ('350600', '3', '漳州市', '350000', '363000');
INSERT INTO `gwshop_area_china` VALUES ('350602', '4', '芗城区', '350600', '363000');
INSERT INTO `gwshop_area_china` VALUES ('350603', '4', '龙文区', '350600', '363005');
INSERT INTO `gwshop_area_china` VALUES ('350622', '4', '云霄县', '350600', '363300');
INSERT INTO `gwshop_area_china` VALUES ('350623', '4', '漳浦县', '350600', '363200');
INSERT INTO `gwshop_area_china` VALUES ('350624', '4', '诏安县', '350600', '363500');
INSERT INTO `gwshop_area_china` VALUES ('350625', '4', '长泰县', '350600', '363900');
INSERT INTO `gwshop_area_china` VALUES ('350626', '4', '东山县', '350600', '363400');
INSERT INTO `gwshop_area_china` VALUES ('350627', '4', '南靖县', '350600', '363600');
INSERT INTO `gwshop_area_china` VALUES ('350628', '4', '平和县', '350600', '363700');
INSERT INTO `gwshop_area_china` VALUES ('350629', '4', '华安县', '350600', '363800');
INSERT INTO `gwshop_area_china` VALUES ('350681', '4', '龙海市', '350600', '363100');
INSERT INTO `gwshop_area_china` VALUES ('350682', '4', '其它区', '350600', '');
INSERT INTO `gwshop_area_china` VALUES ('350700', '3', '南平市', '350000', '353000');
INSERT INTO `gwshop_area_china` VALUES ('350702', '4', '延平区', '350700', '353000');
INSERT INTO `gwshop_area_china` VALUES ('350721', '4', '顺昌县', '350700', '353200');
INSERT INTO `gwshop_area_china` VALUES ('350722', '4', '浦城县', '350700', '353400');
INSERT INTO `gwshop_area_china` VALUES ('350723', '4', '光泽县', '350700', '354100');
INSERT INTO `gwshop_area_china` VALUES ('350724', '4', '松溪县', '350700', '353500');
INSERT INTO `gwshop_area_china` VALUES ('350725', '4', '政和县', '350700', '353600');
INSERT INTO `gwshop_area_china` VALUES ('350781', '4', '邵武市', '350700', '354000');
INSERT INTO `gwshop_area_china` VALUES ('350782', '4', '武夷山市', '350700', '354300');
INSERT INTO `gwshop_area_china` VALUES ('350783', '4', '建瓯市', '350700', '353100');
INSERT INTO `gwshop_area_china` VALUES ('350784', '4', '建阳市', '350700', '354200');
INSERT INTO `gwshop_area_china` VALUES ('350785', '4', '其它区', '350700', '');
INSERT INTO `gwshop_area_china` VALUES ('350800', '3', '龙岩市', '350000', '364000');
INSERT INTO `gwshop_area_china` VALUES ('350802', '4', '新罗区', '350800', '364000');
INSERT INTO `gwshop_area_china` VALUES ('350821', '4', '长汀县', '350800', '366300');
INSERT INTO `gwshop_area_china` VALUES ('350822', '4', '永定县', '350800', '364100');
INSERT INTO `gwshop_area_china` VALUES ('350823', '4', '上杭县', '350800', '364200');
INSERT INTO `gwshop_area_china` VALUES ('350824', '4', '武平县', '350800', '364300');
INSERT INTO `gwshop_area_china` VALUES ('350825', '4', '连城县', '350800', '366200');
INSERT INTO `gwshop_area_china` VALUES ('350881', '4', '漳平市', '350800', '364400');
INSERT INTO `gwshop_area_china` VALUES ('350882', '4', '其它区', '350800', '');
INSERT INTO `gwshop_area_china` VALUES ('350900', '3', '宁德市', '350000', '352100');
INSERT INTO `gwshop_area_china` VALUES ('350902', '4', '蕉城区', '350900', '352100');
INSERT INTO `gwshop_area_china` VALUES ('350921', '4', '霞浦县', '350900', '355100');
INSERT INTO `gwshop_area_china` VALUES ('350922', '4', '古田县', '350900', '352200');
INSERT INTO `gwshop_area_china` VALUES ('350923', '4', '屏南县', '350900', '352300');
INSERT INTO `gwshop_area_china` VALUES ('350924', '4', '寿宁县', '350900', '355500');
INSERT INTO `gwshop_area_china` VALUES ('350925', '4', '周宁县', '350900', '355400');
INSERT INTO `gwshop_area_china` VALUES ('350926', '4', '柘荣县', '350900', '355300');
INSERT INTO `gwshop_area_china` VALUES ('350981', '4', '福安市', '350900', '355000');
INSERT INTO `gwshop_area_china` VALUES ('350982', '4', '福鼎市', '350900', '355200');
INSERT INTO `gwshop_area_china` VALUES ('350983', '4', '其它区', '350900', '');
INSERT INTO `gwshop_area_china` VALUES ('360000', '2', '江西省', '1', '');
INSERT INTO `gwshop_area_china` VALUES ('360100', '3', '南昌市', '360000', '330000');
INSERT INTO `gwshop_area_china` VALUES ('360102', '4', '东湖区', '360100', '330006');
INSERT INTO `gwshop_area_china` VALUES ('360103', '4', '西湖区', '360100', '330009');
INSERT INTO `gwshop_area_china` VALUES ('360104', '4', '青云谱区', '360100', '330001');
INSERT INTO `gwshop_area_china` VALUES ('360105', '4', '湾里区', '360100', '330004');
INSERT INTO `gwshop_area_china` VALUES ('360111', '4', '青山湖区', '360100', '330006');
INSERT INTO `gwshop_area_china` VALUES ('360121', '4', '南昌县', '360100', '330200');
INSERT INTO `gwshop_area_china` VALUES ('360122', '4', '新建县', '360100', '330100');
INSERT INTO `gwshop_area_china` VALUES ('360123', '4', '安义县', '360100', '330500');
INSERT INTO `gwshop_area_china` VALUES ('360124', '4', '进贤县', '360100', '331700');
INSERT INTO `gwshop_area_china` VALUES ('360125', '4', '红谷滩新区', '360100', '');
INSERT INTO `gwshop_area_china` VALUES ('360126', '4', '经济技术开发区', '360100', '');
INSERT INTO `gwshop_area_china` VALUES ('360127', '4', '昌北区', '360100', '');
INSERT INTO `gwshop_area_china` VALUES ('360128', '4', '其它区', '360100', '');
INSERT INTO `gwshop_area_china` VALUES ('360200', '3', '景德镇市', '360000', '333000');
INSERT INTO `gwshop_area_china` VALUES ('360202', '4', '昌江区', '360200', '333000');
INSERT INTO `gwshop_area_china` VALUES ('360203', '4', '珠山区', '360200', '333000');
INSERT INTO `gwshop_area_china` VALUES ('360222', '4', '浮梁县', '360200', '333400');
INSERT INTO `gwshop_area_china` VALUES ('360281', '4', '乐平市', '360200', '333300');
INSERT INTO `gwshop_area_china` VALUES ('360282', '4', '其它区', '360200', '');
INSERT INTO `gwshop_area_china` VALUES ('360300', '3', '萍乡市', '360000', '337000');
INSERT INTO `gwshop_area_china` VALUES ('360302', '4', '安源区', '360300', '337000');
INSERT INTO `gwshop_area_china` VALUES ('360313', '4', '湘东区', '360300', '337032');
INSERT INTO `gwshop_area_china` VALUES ('360321', '4', '莲花县', '360300', '337100');
INSERT INTO `gwshop_area_china` VALUES ('360322', '4', '上栗县', '360300', '337009');
INSERT INTO `gwshop_area_china` VALUES ('360323', '4', '芦溪县', '360300', '337200');
INSERT INTO `gwshop_area_china` VALUES ('360324', '4', '其它区', '360300', '');
INSERT INTO `gwshop_area_china` VALUES ('360400', '3', '九江市', '360000', '332000');
INSERT INTO `gwshop_area_china` VALUES ('360402', '4', '庐山区', '360400', '332005');
INSERT INTO `gwshop_area_china` VALUES ('360403', '4', '浔阳区', '360400', '332000');
INSERT INTO `gwshop_area_china` VALUES ('360421', '4', '九江县', '360400', '332100');
INSERT INTO `gwshop_area_china` VALUES ('360423', '4', '武宁县', '360400', '332300');
INSERT INTO `gwshop_area_china` VALUES ('360424', '4', '修水县', '360400', '332400');
INSERT INTO `gwshop_area_china` VALUES ('360425', '4', '永修县', '360400', '330300');
INSERT INTO `gwshop_area_china` VALUES ('360426', '4', '德安县', '360400', '330400');
INSERT INTO `gwshop_area_china` VALUES ('360427', '4', '星子县', '360400', '332800');
INSERT INTO `gwshop_area_china` VALUES ('360428', '4', '都昌县', '360400', '332600');
INSERT INTO `gwshop_area_china` VALUES ('360429', '4', '湖口县', '360400', '332500');
INSERT INTO `gwshop_area_china` VALUES ('360430', '4', '彭泽县', '360400', '332700');
INSERT INTO `gwshop_area_china` VALUES ('360481', '4', '瑞昌市', '360400', '332200');
INSERT INTO `gwshop_area_china` VALUES ('360482', '4', '其它区', '360400', '');
INSERT INTO `gwshop_area_china` VALUES ('360500', '3', '新余市', '360000', '338000');
INSERT INTO `gwshop_area_china` VALUES ('360502', '4', '渝水区', '360500', '338025');
INSERT INTO `gwshop_area_china` VALUES ('360521', '4', '分宜县', '360500', '336600');
INSERT INTO `gwshop_area_china` VALUES ('360522', '4', '其它区', '360500', '');
INSERT INTO `gwshop_area_china` VALUES ('360600', '3', '鹰潭市', '360000', '335000');
INSERT INTO `gwshop_area_china` VALUES ('360602', '4', '月湖区', '360600', '335000');
INSERT INTO `gwshop_area_china` VALUES ('360622', '4', '余江县', '360600', '335200');
INSERT INTO `gwshop_area_china` VALUES ('360681', '4', '贵溪市', '360600', '335400');
INSERT INTO `gwshop_area_china` VALUES ('360682', '4', '其它区', '360600', '');
INSERT INTO `gwshop_area_china` VALUES ('360700', '3', '赣州市', '360000', '341000');
INSERT INTO `gwshop_area_china` VALUES ('360702', '4', '章贡区', '360700', '');
INSERT INTO `gwshop_area_china` VALUES ('360721', '4', '赣县', '360700', '341100');
INSERT INTO `gwshop_area_china` VALUES ('360722', '4', '信丰县', '360700', '341600');
INSERT INTO `gwshop_area_china` VALUES ('360723', '4', '大余县', '360700', '341500');
INSERT INTO `gwshop_area_china` VALUES ('360724', '4', '上犹县', '360700', '341200');
INSERT INTO `gwshop_area_china` VALUES ('360725', '4', '崇义县', '360700', '341300');
INSERT INTO `gwshop_area_china` VALUES ('360726', '4', '安远县', '360700', '342100');
INSERT INTO `gwshop_area_china` VALUES ('360727', '4', '龙南县', '360700', '341700');
INSERT INTO `gwshop_area_china` VALUES ('360728', '4', '定南县', '360700', '341900');
INSERT INTO `gwshop_area_china` VALUES ('360729', '4', '全南县', '360700', '341800');
INSERT INTO `gwshop_area_china` VALUES ('360730', '4', '宁都县', '360700', '342800');
INSERT INTO `gwshop_area_china` VALUES ('360731', '4', '于都县', '360700', '342300');
INSERT INTO `gwshop_area_china` VALUES ('360732', '4', '兴国县', '360700', '342400');
INSERT INTO `gwshop_area_china` VALUES ('360733', '4', '会昌县', '360700', '342600');
INSERT INTO `gwshop_area_china` VALUES ('360734', '4', '寻乌县', '360700', '342200');
INSERT INTO `gwshop_area_china` VALUES ('360735', '4', '石城县', '360700', '342700');
INSERT INTO `gwshop_area_china` VALUES ('360751', '4', '黄金区', '360700', '');
INSERT INTO `gwshop_area_china` VALUES ('360781', '4', '瑞金市', '360700', '342500');
INSERT INTO `gwshop_area_china` VALUES ('360782', '4', '南康市', '360700', '341400');
INSERT INTO `gwshop_area_china` VALUES ('360783', '4', '其它区', '360700', '');
INSERT INTO `gwshop_area_china` VALUES ('360800', '3', '吉安市', '360000', '343000');
INSERT INTO `gwshop_area_china` VALUES ('360802', '4', '吉州区', '360800', '343000');
INSERT INTO `gwshop_area_china` VALUES ('360803', '4', '青原区', '360800', '343009');
INSERT INTO `gwshop_area_china` VALUES ('360821', '4', '吉安县', '360800', '343100');
INSERT INTO `gwshop_area_china` VALUES ('360822', '4', '吉水县', '360800', '331600');
INSERT INTO `gwshop_area_china` VALUES ('360823', '4', '峡江县', '360800', '331400');
INSERT INTO `gwshop_area_china` VALUES ('360824', '4', '新干县', '360800', '331300');
INSERT INTO `gwshop_area_china` VALUES ('360825', '4', '永丰县', '360800', '331500');
INSERT INTO `gwshop_area_china` VALUES ('360826', '4', '泰和县', '360800', '343700');
INSERT INTO `gwshop_area_china` VALUES ('360827', '4', '遂川县', '360800', '343900');
INSERT INTO `gwshop_area_china` VALUES ('360828', '4', '万安县', '360800', '343800');
INSERT INTO `gwshop_area_china` VALUES ('360829', '4', '安福县', '360800', '343200');
INSERT INTO `gwshop_area_china` VALUES ('360830', '4', '永新县', '360800', '343400');
INSERT INTO `gwshop_area_china` VALUES ('360881', '4', '井冈山市', '360800', '343600');
INSERT INTO `gwshop_area_china` VALUES ('360882', '4', '其它区', '360800', '');
INSERT INTO `gwshop_area_china` VALUES ('360900', '3', '宜春市', '360000', '336000');
INSERT INTO `gwshop_area_china` VALUES ('360902', '4', '袁州区', '360900', '336000');
INSERT INTO `gwshop_area_china` VALUES ('360921', '4', '奉新县', '360900', '330700');
INSERT INTO `gwshop_area_china` VALUES ('360922', '4', '万载县', '360900', '336100');
INSERT INTO `gwshop_area_china` VALUES ('360923', '4', '上高县', '360900', '336400');
INSERT INTO `gwshop_area_china` VALUES ('360924', '4', '宜丰县', '360900', '336300');
INSERT INTO `gwshop_area_china` VALUES ('360925', '4', '靖安县', '360900', '330600');
INSERT INTO `gwshop_area_china` VALUES ('360926', '4', '铜鼓县', '360900', '336200');
INSERT INTO `gwshop_area_china` VALUES ('360981', '4', '丰城市', '360900', '331100');
INSERT INTO `gwshop_area_china` VALUES ('360982', '4', '樟树市', '360900', '331200');
INSERT INTO `gwshop_area_china` VALUES ('360983', '4', '高安市', '360900', '330800');
INSERT INTO `gwshop_area_china` VALUES ('360984', '4', '其它区', '360900', '');
INSERT INTO `gwshop_area_china` VALUES ('361000', '3', '抚州市', '360000', '344000');
INSERT INTO `gwshop_area_china` VALUES ('361002', '4', '临川区', '361000', '344100');
INSERT INTO `gwshop_area_china` VALUES ('361021', '4', '南城县', '361000', '344700');
INSERT INTO `gwshop_area_china` VALUES ('361022', '4', '黎川县', '361000', '344600');
INSERT INTO `gwshop_area_china` VALUES ('361023', '4', '南丰县', '361000', '344500');
INSERT INTO `gwshop_area_china` VALUES ('361024', '4', '崇仁县', '361000', '344200');
INSERT INTO `gwshop_area_china` VALUES ('361025', '4', '乐安县', '361000', '344300');
INSERT INTO `gwshop_area_china` VALUES ('361026', '4', '宜黄县', '361000', '344400');
INSERT INTO `gwshop_area_china` VALUES ('361027', '4', '金溪县', '361000', '344800');
INSERT INTO `gwshop_area_china` VALUES ('361028', '4', '资溪县', '361000', '335300');
INSERT INTO `gwshop_area_china` VALUES ('361029', '4', '东乡县', '361000', '331800');
INSERT INTO `gwshop_area_china` VALUES ('361030', '4', '广昌县', '361000', '344900');
INSERT INTO `gwshop_area_china` VALUES ('361031', '4', '其它区', '361000', '');
INSERT INTO `gwshop_area_china` VALUES ('361100', '3', '上饶市', '360000', '334000');
INSERT INTO `gwshop_area_china` VALUES ('361102', '4', '信州区', '361100', '334000');
INSERT INTO `gwshop_area_china` VALUES ('361121', '4', '上饶县', '361100', '334100');
INSERT INTO `gwshop_area_china` VALUES ('361122', '4', '广丰县', '361100', '334600');
INSERT INTO `gwshop_area_china` VALUES ('361123', '4', '玉山县', '361100', '334700');
INSERT INTO `gwshop_area_china` VALUES ('361124', '4', '铅山县', '361100', '334500');
INSERT INTO `gwshop_area_china` VALUES ('361125', '4', '横峰县', '361100', '334300');
INSERT INTO `gwshop_area_china` VALUES ('361126', '4', '弋阳县', '361100', '334400');
INSERT INTO `gwshop_area_china` VALUES ('361127', '4', '余干县', '361100', '335100');
INSERT INTO `gwshop_area_china` VALUES ('361128', '4', '鄱阳县', '361100', '333100');
INSERT INTO `gwshop_area_china` VALUES ('361129', '4', '万年县', '361100', '335500');
INSERT INTO `gwshop_area_china` VALUES ('361130', '4', '婺源县', '361100', '333200');
INSERT INTO `gwshop_area_china` VALUES ('361181', '4', '德兴市', '361100', '334200');
INSERT INTO `gwshop_area_china` VALUES ('361182', '4', '其它区', '361100', '');
INSERT INTO `gwshop_area_china` VALUES ('370000', '2', '山东省', '1', '');
INSERT INTO `gwshop_area_china` VALUES ('370100', '3', '济南市', '370000', '250000');
INSERT INTO `gwshop_area_china` VALUES ('370102', '4', '历下区', '370100', '250013');
INSERT INTO `gwshop_area_china` VALUES ('370103', '4', '市中区', '370100', '250002');
INSERT INTO `gwshop_area_china` VALUES ('370104', '4', '槐荫区', '370100', '250021');
INSERT INTO `gwshop_area_china` VALUES ('370105', '4', '天桥区', '370100', '250031');
INSERT INTO `gwshop_area_china` VALUES ('370112', '4', '历城区', '370100', '250100');
INSERT INTO `gwshop_area_china` VALUES ('370113', '4', '长清区', '370100', '250300');
INSERT INTO `gwshop_area_china` VALUES ('370124', '4', '平阴县', '370100', '250400');
INSERT INTO `gwshop_area_china` VALUES ('370125', '4', '济阳县', '370100', '251400');
INSERT INTO `gwshop_area_china` VALUES ('370126', '4', '商河县', '370100', '251600');
INSERT INTO `gwshop_area_china` VALUES ('370181', '4', '章丘市', '370100', '250200');
INSERT INTO `gwshop_area_china` VALUES ('370182', '4', '其它区', '370100', '');
INSERT INTO `gwshop_area_china` VALUES ('370200', '3', '青岛市', '370000', '266000');
INSERT INTO `gwshop_area_china` VALUES ('370202', '4', '市南区', '370200', '266001');
INSERT INTO `gwshop_area_china` VALUES ('370203', '4', '市北区', '370200', '266011');
INSERT INTO `gwshop_area_china` VALUES ('370205', '4', '四方区', '370200', '266031');
INSERT INTO `gwshop_area_china` VALUES ('370211', '4', '黄岛区', '370200', '266500');
INSERT INTO `gwshop_area_china` VALUES ('370212', '4', '崂山区', '370200', '266100');
INSERT INTO `gwshop_area_china` VALUES ('370213', '4', '李沧区', '370200', '266100');
INSERT INTO `gwshop_area_china` VALUES ('370214', '4', '城阳区', '370200', '266041');
INSERT INTO `gwshop_area_china` VALUES ('370251', '4', '开发区', '370200', '');
INSERT INTO `gwshop_area_china` VALUES ('370281', '4', '胶州市', '370200', '266300');
INSERT INTO `gwshop_area_china` VALUES ('370282', '4', '即墨市', '370200', '266200');
INSERT INTO `gwshop_area_china` VALUES ('370283', '4', '平度市', '370200', '266700');
INSERT INTO `gwshop_area_china` VALUES ('370284', '4', '胶南市', '370200', '266400');
INSERT INTO `gwshop_area_china` VALUES ('370285', '4', '莱西市', '370200', '266600');
INSERT INTO `gwshop_area_china` VALUES ('370286', '4', '其它区', '370200', '');
INSERT INTO `gwshop_area_china` VALUES ('370300', '3', '淄博市', '370000', '255000');
INSERT INTO `gwshop_area_china` VALUES ('370302', '4', '淄川区', '370300', '255100');
INSERT INTO `gwshop_area_china` VALUES ('370303', '4', '张店区', '370300', '255022');
INSERT INTO `gwshop_area_china` VALUES ('370304', '4', '博山区', '370300', '255200');
INSERT INTO `gwshop_area_china` VALUES ('370305', '4', '临淄区', '370300', '255400');
INSERT INTO `gwshop_area_china` VALUES ('370306', '4', '周村区', '370300', '255300');
INSERT INTO `gwshop_area_china` VALUES ('370321', '4', '桓台县', '370300', '256400');
INSERT INTO `gwshop_area_china` VALUES ('370322', '4', '高青县', '370300', '256300');
INSERT INTO `gwshop_area_china` VALUES ('370323', '4', '沂源县', '370300', '256100');
INSERT INTO `gwshop_area_china` VALUES ('370324', '4', '其它区', '370300', '');
INSERT INTO `gwshop_area_china` VALUES ('370400', '3', '枣庄市', '370000', '277100');
INSERT INTO `gwshop_area_china` VALUES ('370402', '4', '市中区', '370400', '277101');
INSERT INTO `gwshop_area_china` VALUES ('370403', '4', '薛城区', '370400', '277000');
INSERT INTO `gwshop_area_china` VALUES ('370404', '4', '峄城区', '370400', '277300');
INSERT INTO `gwshop_area_china` VALUES ('370405', '4', '台儿庄区', '370400', '277400');
INSERT INTO `gwshop_area_china` VALUES ('370406', '4', '山亭区', '370400', '277200');
INSERT INTO `gwshop_area_china` VALUES ('370481', '4', '滕州市', '370400', '277500');
INSERT INTO `gwshop_area_china` VALUES ('370482', '4', '其它区', '370400', '');
INSERT INTO `gwshop_area_china` VALUES ('370500', '3', '东营市', '370000', '257000');
INSERT INTO `gwshop_area_china` VALUES ('370502', '4', '东营区', '370500', '257029');
INSERT INTO `gwshop_area_china` VALUES ('370503', '4', '河口区', '370500', '257200');
INSERT INTO `gwshop_area_china` VALUES ('370521', '4', '垦利县', '370500', '257500');
INSERT INTO `gwshop_area_china` VALUES ('370522', '4', '利津县', '370500', '257400');
INSERT INTO `gwshop_area_china` VALUES ('370523', '4', '广饶县', '370500', '257300');
INSERT INTO `gwshop_area_china` VALUES ('370589', '4', '西城区', '370500', '');
INSERT INTO `gwshop_area_china` VALUES ('370590', '4', '东城区', '370500', '');
INSERT INTO `gwshop_area_china` VALUES ('370591', '4', '其它区', '370500', '');
INSERT INTO `gwshop_area_china` VALUES ('370600', '3', '烟台市', '370000', '264000');
INSERT INTO `gwshop_area_china` VALUES ('370602', '4', '芝罘区', '370600', '264001');
INSERT INTO `gwshop_area_china` VALUES ('370611', '4', '福山区', '370600', '265500');
INSERT INTO `gwshop_area_china` VALUES ('370612', '4', '牟平区', '370600', '264100');
INSERT INTO `gwshop_area_china` VALUES ('370613', '4', '莱山区', '370600', '264600');
INSERT INTO `gwshop_area_china` VALUES ('370634', '4', '长岛县', '370600', '265800');
INSERT INTO `gwshop_area_china` VALUES ('370681', '4', '龙口市', '370600', '265700');
INSERT INTO `gwshop_area_china` VALUES ('370682', '4', '莱阳市', '370600', '265200');
INSERT INTO `gwshop_area_china` VALUES ('370683', '4', '莱州市', '370600', '261400');
INSERT INTO `gwshop_area_china` VALUES ('370684', '4', '蓬莱市', '370600', '265600');
INSERT INTO `gwshop_area_china` VALUES ('370685', '4', '招远市', '370600', '265400');
INSERT INTO `gwshop_area_china` VALUES ('370686', '4', '栖霞市', '370600', '265300');
INSERT INTO `gwshop_area_china` VALUES ('370687', '4', '海阳市', '370600', '265100');
INSERT INTO `gwshop_area_china` VALUES ('370688', '4', '其它区', '370600', '');
INSERT INTO `gwshop_area_china` VALUES ('370700', '3', '潍坊市', '370000', '261000');
INSERT INTO `gwshop_area_china` VALUES ('370702', '4', '潍城区', '370700', '261021');
INSERT INTO `gwshop_area_china` VALUES ('370703', '4', '寒亭区', '370700', '261100');
INSERT INTO `gwshop_area_china` VALUES ('370704', '4', '坊子区', '370700', '261200');
INSERT INTO `gwshop_area_china` VALUES ('370705', '4', '奎文区', '370700', '261041');
INSERT INTO `gwshop_area_china` VALUES ('370724', '4', '临朐县', '370700', '262600');
INSERT INTO `gwshop_area_china` VALUES ('370725', '4', '昌乐县', '370700', '262400');
INSERT INTO `gwshop_area_china` VALUES ('370751', '4', '开发区', '370700', '');
INSERT INTO `gwshop_area_china` VALUES ('370781', '4', '青州市', '370700', '262500');
INSERT INTO `gwshop_area_china` VALUES ('370782', '4', '诸城市', '370700', '262200');
INSERT INTO `gwshop_area_china` VALUES ('370783', '4', '寿光市', '370700', '262700');
INSERT INTO `gwshop_area_china` VALUES ('370784', '4', '安丘市', '370700', '262100');
INSERT INTO `gwshop_area_china` VALUES ('370785', '4', '高密市', '370700', '261500');
INSERT INTO `gwshop_area_china` VALUES ('370786', '4', '昌邑市', '370700', '261300');
INSERT INTO `gwshop_area_china` VALUES ('370787', '4', '其它区', '370700', '');
INSERT INTO `gwshop_area_china` VALUES ('370800', '3', '济宁市', '370000', '272100');
INSERT INTO `gwshop_area_china` VALUES ('370802', '4', '市中区', '370800', '272133');
INSERT INTO `gwshop_area_china` VALUES ('370811', '4', '任城区', '370800', '272113');
INSERT INTO `gwshop_area_china` VALUES ('370826', '4', '微山县', '370800', '277600');
INSERT INTO `gwshop_area_china` VALUES ('370827', '4', '鱼台县', '370800', '272300');
INSERT INTO `gwshop_area_china` VALUES ('370828', '4', '金乡县', '370800', '272200');
INSERT INTO `gwshop_area_china` VALUES ('370829', '4', '嘉祥县', '370800', '272400');
INSERT INTO `gwshop_area_china` VALUES ('370830', '4', '汶上县', '370800', '272501');
INSERT INTO `gwshop_area_china` VALUES ('370831', '4', '泗水县', '370800', '273200');
INSERT INTO `gwshop_area_china` VALUES ('370832', '4', '梁山县', '370800', '272600');
INSERT INTO `gwshop_area_china` VALUES ('370881', '4', '曲阜市', '370800', '273100');
INSERT INTO `gwshop_area_china` VALUES ('370882', '4', '兖州市', '370800', '272000');
INSERT INTO `gwshop_area_china` VALUES ('370883', '4', '邹城市', '370800', '273500');
INSERT INTO `gwshop_area_china` VALUES ('370884', '4', '其它区', '370800', '');
INSERT INTO `gwshop_area_china` VALUES ('370900', '3', '泰安市', '370000', '271000');
INSERT INTO `gwshop_area_china` VALUES ('370902', '4', '泰山区', '370900', '271000');
INSERT INTO `gwshop_area_china` VALUES ('370903', '4', '岱岳区', '370900', '271000');
INSERT INTO `gwshop_area_china` VALUES ('370921', '4', '宁阳县', '370900', '271400');
INSERT INTO `gwshop_area_china` VALUES ('370923', '4', '东平县', '370900', '271500');
INSERT INTO `gwshop_area_china` VALUES ('370982', '4', '新泰市', '370900', '271200');
INSERT INTO `gwshop_area_china` VALUES ('370983', '4', '肥城市', '370900', '271600');
INSERT INTO `gwshop_area_china` VALUES ('370984', '4', '其它区', '370900', '');
INSERT INTO `gwshop_area_china` VALUES ('371000', '3', '威海市', '370000', '264200');
INSERT INTO `gwshop_area_china` VALUES ('371002', '4', '环翠区', '371000', '264200');
INSERT INTO `gwshop_area_china` VALUES ('371081', '4', '文登市', '371000', '264400');
INSERT INTO `gwshop_area_china` VALUES ('371082', '4', '荣成市', '371000', '264300');
INSERT INTO `gwshop_area_china` VALUES ('371083', '4', '乳山市', '371000', '264500');
INSERT INTO `gwshop_area_china` VALUES ('371084', '4', '其它区', '371000', '');
INSERT INTO `gwshop_area_china` VALUES ('371100', '3', '日照市', '370000', '276800');
INSERT INTO `gwshop_area_china` VALUES ('371102', '4', '东港区', '371100', '276800');
INSERT INTO `gwshop_area_china` VALUES ('371103', '4', '岚山区', '371100', '276808');
INSERT INTO `gwshop_area_china` VALUES ('371121', '4', '五莲县', '371100', '262300');
INSERT INTO `gwshop_area_china` VALUES ('371122', '4', '莒县', '371100', '276500');
INSERT INTO `gwshop_area_china` VALUES ('371123', '4', '其它区', '371100', '');
INSERT INTO `gwshop_area_china` VALUES ('371200', '3', '莱芜市', '370000', '271100');
INSERT INTO `gwshop_area_china` VALUES ('371202', '4', '莱城区', '371200', '271100');
INSERT INTO `gwshop_area_china` VALUES ('371203', '4', '钢城区', '371200', '271100');
INSERT INTO `gwshop_area_china` VALUES ('371204', '4', '其它区', '371200', '');
INSERT INTO `gwshop_area_china` VALUES ('371300', '3', '临沂市', '370000', '276000');
INSERT INTO `gwshop_area_china` VALUES ('371302', '4', '兰山区', '371300', '276002');
INSERT INTO `gwshop_area_china` VALUES ('371311', '4', '罗庄区', '371300', '276022');
INSERT INTO `gwshop_area_china` VALUES ('371312', '4', '河东区', '371300', '276034');
INSERT INTO `gwshop_area_china` VALUES ('371321', '4', '沂南县', '371300', '276300');
INSERT INTO `gwshop_area_china` VALUES ('371322', '4', '郯城县', '371300', '276100');
INSERT INTO `gwshop_area_china` VALUES ('371323', '4', '沂水县', '371300', '276400');
INSERT INTO `gwshop_area_china` VALUES ('371324', '4', '苍山县', '371300', '277700');
INSERT INTO `gwshop_area_china` VALUES ('371325', '4', '费县', '371300', '273400');
INSERT INTO `gwshop_area_china` VALUES ('371326', '4', '平邑县', '371300', '273300');
INSERT INTO `gwshop_area_china` VALUES ('371327', '4', '莒南县', '371300', '276600');
INSERT INTO `gwshop_area_china` VALUES ('371328', '4', '蒙阴县', '371300', '276200');
INSERT INTO `gwshop_area_china` VALUES ('371329', '4', '临沭县', '371300', '276700');
INSERT INTO `gwshop_area_china` VALUES ('371330', '4', '其它区', '371300', '');
INSERT INTO `gwshop_area_china` VALUES ('371400', '3', '德州市', '370000', '253000');
INSERT INTO `gwshop_area_china` VALUES ('371402', '4', '德城区', '371400', '253011');
INSERT INTO `gwshop_area_china` VALUES ('371421', '4', '陵县', '371400', '253500');
INSERT INTO `gwshop_area_china` VALUES ('371422', '4', '宁津县', '371400', '253400');
INSERT INTO `gwshop_area_china` VALUES ('371423', '4', '庆云县', '371400', '253700');
INSERT INTO `gwshop_area_china` VALUES ('371424', '4', '临邑县', '371400', '251500');
INSERT INTO `gwshop_area_china` VALUES ('371425', '4', '齐河县', '371400', '251100');
INSERT INTO `gwshop_area_china` VALUES ('371426', '4', '平原县', '371400', '253121');
INSERT INTO `gwshop_area_china` VALUES ('371427', '4', '夏津县', '371400', '253200');
INSERT INTO `gwshop_area_china` VALUES ('371428', '4', '武城县', '371400', '253300');
INSERT INTO `gwshop_area_china` VALUES ('371451', '4', '开发区', '371400', '');
INSERT INTO `gwshop_area_china` VALUES ('371481', '4', '乐陵市', '371400', '253600');
INSERT INTO `gwshop_area_china` VALUES ('371482', '4', '禹城市', '371400', '251200');
INSERT INTO `gwshop_area_china` VALUES ('371483', '4', '其它区', '371400', '');
INSERT INTO `gwshop_area_china` VALUES ('371500', '3', '聊城市', '370000', '252000');
INSERT INTO `gwshop_area_china` VALUES ('371502', '4', '东昌府区', '371500', '252000');
INSERT INTO `gwshop_area_china` VALUES ('371521', '4', '阳谷县', '371500', '252300');
INSERT INTO `gwshop_area_china` VALUES ('371522', '4', '莘县', '371500', '252400');
INSERT INTO `gwshop_area_china` VALUES ('371523', '4', '茌平县', '371500', '252100');
INSERT INTO `gwshop_area_china` VALUES ('371524', '4', '东阿县', '371500', '252200');
INSERT INTO `gwshop_area_china` VALUES ('371525', '4', '冠县', '371500', '252500');
INSERT INTO `gwshop_area_china` VALUES ('371526', '4', '高唐县', '371500', '252800');
INSERT INTO `gwshop_area_china` VALUES ('371581', '4', '临清市', '371500', '252600');
INSERT INTO `gwshop_area_china` VALUES ('371582', '4', '其它区', '371500', '');
INSERT INTO `gwshop_area_china` VALUES ('371600', '3', '滨州市', '370000', '256600');
INSERT INTO `gwshop_area_china` VALUES ('371602', '4', '滨城区', '371600', '256600');
INSERT INTO `gwshop_area_china` VALUES ('371621', '4', '惠民县', '371600', '257100');
INSERT INTO `gwshop_area_china` VALUES ('371622', '4', '阳信县', '371600', '251800');
INSERT INTO `gwshop_area_china` VALUES ('371623', '4', '无棣县', '371600', '251900');
INSERT INTO `gwshop_area_china` VALUES ('371624', '4', '沾化县', '371600', '256800');
INSERT INTO `gwshop_area_china` VALUES ('371625', '4', '博兴县', '371600', '256500');
INSERT INTO `gwshop_area_china` VALUES ('371626', '4', '邹平县', '371600', '256200');
INSERT INTO `gwshop_area_china` VALUES ('371627', '4', '其它区', '371600', '');
INSERT INTO `gwshop_area_china` VALUES ('371700', '3', '菏泽市', '370000', '274000');
INSERT INTO `gwshop_area_china` VALUES ('371702', '4', '牡丹区', '371700', '274009');
INSERT INTO `gwshop_area_china` VALUES ('371721', '4', '曹县', '371700', '274400');
INSERT INTO `gwshop_area_china` VALUES ('371722', '4', '单县', '371700', '274300');
INSERT INTO `gwshop_area_china` VALUES ('371723', '4', '成武县', '371700', '274200');
INSERT INTO `gwshop_area_china` VALUES ('371724', '4', '巨野县', '371700', '274900');
INSERT INTO `gwshop_area_china` VALUES ('371725', '4', '郓城县', '371700', '274700');
INSERT INTO `gwshop_area_china` VALUES ('371726', '4', '鄄城县', '371700', '274600');
INSERT INTO `gwshop_area_china` VALUES ('371727', '4', '定陶县', '371700', '274100');
INSERT INTO `gwshop_area_china` VALUES ('371728', '4', '东明县', '371700', '274500');
INSERT INTO `gwshop_area_china` VALUES ('371729', '4', '其它区', '371700', '');
INSERT INTO `gwshop_area_china` VALUES ('410000', '2', '河南省', '1', '');
INSERT INTO `gwshop_area_china` VALUES ('410100', '3', '郑州市', '410000', '450000');
INSERT INTO `gwshop_area_china` VALUES ('410102', '4', '中原区', '410100', '450007');
INSERT INTO `gwshop_area_china` VALUES ('410103', '4', '二七区', '410100', '450000');
INSERT INTO `gwshop_area_china` VALUES ('410104', '4', '管城回族区', '410100', '450000');
INSERT INTO `gwshop_area_china` VALUES ('410105', '4', '金水区', '410100', '450003');
INSERT INTO `gwshop_area_china` VALUES ('410106', '4', '上街区', '410100', '450041');
INSERT INTO `gwshop_area_china` VALUES ('410108', '4', '惠济区', '410100', '450053');
INSERT INTO `gwshop_area_china` VALUES ('410122', '4', '中牟县', '410100', '451450');
INSERT INTO `gwshop_area_china` VALUES ('410181', '4', '巩义市', '410100', '451200');
INSERT INTO `gwshop_area_china` VALUES ('410182', '4', '荥阳市', '410100', '450100');
INSERT INTO `gwshop_area_china` VALUES ('410183', '4', '新密市', '410100', '452300');
INSERT INTO `gwshop_area_china` VALUES ('410184', '4', '新郑市', '410100', '451150');
INSERT INTO `gwshop_area_china` VALUES ('410185', '4', '登封市', '410100', '452470');
INSERT INTO `gwshop_area_china` VALUES ('410186', '4', '郑东新区', '410100', '');
INSERT INTO `gwshop_area_china` VALUES ('410187', '4', '高新区', '410100', '');
INSERT INTO `gwshop_area_china` VALUES ('410188', '4', '其它区', '410100', '');
INSERT INTO `gwshop_area_china` VALUES ('410200', '3', '开封市', '410000', '475000');
INSERT INTO `gwshop_area_china` VALUES ('410202', '4', '龙亭区', '410200', '475100');
INSERT INTO `gwshop_area_china` VALUES ('410203', '4', '顺河回族区', '410200', '475000');
INSERT INTO `gwshop_area_china` VALUES ('410204', '4', '鼓楼区', '410200', '475000');
INSERT INTO `gwshop_area_china` VALUES ('410205', '4', '禹王台区', '410200', '475003');
INSERT INTO `gwshop_area_china` VALUES ('410211', '4', '金明区', '410200', '475002');
INSERT INTO `gwshop_area_china` VALUES ('410221', '4', '杞县', '410200', '475200');
INSERT INTO `gwshop_area_china` VALUES ('410222', '4', '通许县', '410200', '475400');
INSERT INTO `gwshop_area_china` VALUES ('410223', '4', '尉氏县', '410200', '475500');
INSERT INTO `gwshop_area_china` VALUES ('410224', '4', '开封县', '410200', '475100');
INSERT INTO `gwshop_area_china` VALUES ('410225', '4', '兰考县', '410200', '475300');
INSERT INTO `gwshop_area_china` VALUES ('410226', '4', '其它区', '410200', '');
INSERT INTO `gwshop_area_china` VALUES ('410300', '3', '洛阳市', '410000', '471000');
INSERT INTO `gwshop_area_china` VALUES ('410302', '4', '老城区', '410300', '471002');
INSERT INTO `gwshop_area_china` VALUES ('410303', '4', '西工区', '410300', '471000');
INSERT INTO `gwshop_area_china` VALUES ('410304', '4', '廛河回族区', '410300', '471002');
INSERT INTO `gwshop_area_china` VALUES ('410305', '4', '涧西区', '410300', '471003');
INSERT INTO `gwshop_area_china` VALUES ('410306', '4', '吉利区', '410300', '471012');
INSERT INTO `gwshop_area_china` VALUES ('410307', '4', '洛龙区', '410300', '471000');
INSERT INTO `gwshop_area_china` VALUES ('410322', '4', '孟津县', '410300', '471100');
INSERT INTO `gwshop_area_china` VALUES ('410323', '4', '新安县', '410300', '471800');
INSERT INTO `gwshop_area_china` VALUES ('410324', '4', '栾川县', '410300', '471500');
INSERT INTO `gwshop_area_china` VALUES ('410325', '4', '嵩县', '410300', '471400');
INSERT INTO `gwshop_area_china` VALUES ('410326', '4', '汝阳县', '410300', '471200');
INSERT INTO `gwshop_area_china` VALUES ('410327', '4', '宜阳县', '410300', '471600');
INSERT INTO `gwshop_area_china` VALUES ('410328', '4', '洛宁县', '410300', '471700');
INSERT INTO `gwshop_area_china` VALUES ('410329', '4', '伊川县', '410300', '471300');
INSERT INTO `gwshop_area_china` VALUES ('410381', '4', '偃师市', '410300', '471900');
INSERT INTO `gwshop_area_china` VALUES ('410400', '3', '平顶山市', '410000', '467000');
INSERT INTO `gwshop_area_china` VALUES ('410402', '4', '新华区', '410400', '467002');
INSERT INTO `gwshop_area_china` VALUES ('410403', '4', '卫东区', '410400', '467021');
INSERT INTO `gwshop_area_china` VALUES ('410404', '4', '石龙区', '410400', '467045');
INSERT INTO `gwshop_area_china` VALUES ('410411', '4', '湛河区', '410400', '467000');
INSERT INTO `gwshop_area_china` VALUES ('410421', '4', '宝丰县', '410400', '467400');
INSERT INTO `gwshop_area_china` VALUES ('410422', '4', '叶县', '410400', '467200');
INSERT INTO `gwshop_area_china` VALUES ('410423', '4', '鲁山县', '410400', '467300');
INSERT INTO `gwshop_area_china` VALUES ('410425', '4', '郏县', '410400', '467100');
INSERT INTO `gwshop_area_china` VALUES ('410481', '4', '舞钢市', '410400', '462500');
INSERT INTO `gwshop_area_china` VALUES ('410482', '4', '汝州市', '410400', '467500');
INSERT INTO `gwshop_area_china` VALUES ('410483', '4', '其它区', '410400', '');
INSERT INTO `gwshop_area_china` VALUES ('410500', '3', '安阳市', '410000', '455000');
INSERT INTO `gwshop_area_china` VALUES ('410502', '4', '文峰区', '410500', '455000');
INSERT INTO `gwshop_area_china` VALUES ('410503', '4', '北关区', '410500', '455001');
INSERT INTO `gwshop_area_china` VALUES ('410505', '4', '殷都区', '410500', '455004');
INSERT INTO `gwshop_area_china` VALUES ('410506', '4', '龙安区', '410500', '455001');
INSERT INTO `gwshop_area_china` VALUES ('410522', '4', '安阳县', '410500', '455100');
INSERT INTO `gwshop_area_china` VALUES ('410523', '4', '汤阴县', '410500', '456150');
INSERT INTO `gwshop_area_china` VALUES ('410526', '4', '滑县', '410500', '456400');
INSERT INTO `gwshop_area_china` VALUES ('410527', '4', '内黄县', '410500', '456300');
INSERT INTO `gwshop_area_china` VALUES ('410581', '4', '林州市', '410500', '456500');
INSERT INTO `gwshop_area_china` VALUES ('410582', '4', '其它区', '410500', '');
INSERT INTO `gwshop_area_china` VALUES ('410600', '3', '鹤壁市', '410000', '458000');
INSERT INTO `gwshop_area_china` VALUES ('410602', '4', '鹤山区', '410600', '458010');
INSERT INTO `gwshop_area_china` VALUES ('410603', '4', '山城区', '410600', '458000');
INSERT INTO `gwshop_area_china` VALUES ('410611', '4', '淇滨区', '410600', '458030');
INSERT INTO `gwshop_area_china` VALUES ('410621', '4', '浚县', '410600', '456250');
INSERT INTO `gwshop_area_china` VALUES ('410622', '4', '淇县', '410600', '456750');
INSERT INTO `gwshop_area_china` VALUES ('410623', '4', '其它区', '410600', '');
INSERT INTO `gwshop_area_china` VALUES ('410700', '3', '新乡市', '410000', '453000');
INSERT INTO `gwshop_area_china` VALUES ('410702', '4', '红旗区', '410700', '453000');
INSERT INTO `gwshop_area_china` VALUES ('410703', '4', '卫滨区', '410700', '453000');
INSERT INTO `gwshop_area_china` VALUES ('410704', '4', '凤泉区', '410700', '453011');
INSERT INTO `gwshop_area_china` VALUES ('410711', '4', '牧野区', '410700', '453002');
INSERT INTO `gwshop_area_china` VALUES ('410721', '4', '新乡县', '410700', '453700');
INSERT INTO `gwshop_area_china` VALUES ('410724', '4', '获嘉县', '410700', '453800');
INSERT INTO `gwshop_area_china` VALUES ('410725', '4', '原阳县', '410700', '453500');
INSERT INTO `gwshop_area_china` VALUES ('410726', '4', '延津县', '410700', '453200');
INSERT INTO `gwshop_area_china` VALUES ('410727', '4', '封丘县', '410700', '453300');
INSERT INTO `gwshop_area_china` VALUES ('410728', '4', '长垣县', '410700', '453400');
INSERT INTO `gwshop_area_china` VALUES ('410781', '4', '卫辉市', '410700', '453100');
INSERT INTO `gwshop_area_china` VALUES ('410782', '4', '辉县市', '410700', '453600');
INSERT INTO `gwshop_area_china` VALUES ('410783', '4', '其它区', '410700', '');
INSERT INTO `gwshop_area_china` VALUES ('410800', '3', '焦作市', '410000', '454000');
INSERT INTO `gwshop_area_china` VALUES ('410802', '4', '解放区', '410800', '454000');
INSERT INTO `gwshop_area_china` VALUES ('410803', '4', '中站区', '410800', '454191');
INSERT INTO `gwshop_area_china` VALUES ('410804', '4', '马村区', '410800', '454171');
INSERT INTO `gwshop_area_china` VALUES ('410811', '4', '山阳区', '410800', '454002');
INSERT INTO `gwshop_area_china` VALUES ('410821', '4', '修武县', '410800', '454350');
INSERT INTO `gwshop_area_china` VALUES ('410822', '4', '博爱县', '410800', '454450');
INSERT INTO `gwshop_area_china` VALUES ('410823', '4', '武陟县', '410800', '454950');
INSERT INTO `gwshop_area_china` VALUES ('410825', '4', '温县', '410800', '454850');
INSERT INTO `gwshop_area_china` VALUES ('410881', '4', '济源市', '410000', '454650');
INSERT INTO `gwshop_area_china` VALUES ('410882', '4', '沁阳市', '410800', '454550');
INSERT INTO `gwshop_area_china` VALUES ('410883', '4', '孟州市', '410800', '454750');
INSERT INTO `gwshop_area_china` VALUES ('410884', '4', '其它区', '410800', '');
INSERT INTO `gwshop_area_china` VALUES ('410900', '3', '濮阳市', '410000', '457000');
INSERT INTO `gwshop_area_china` VALUES ('410902', '4', '华龙区', '410900', '457001');
INSERT INTO `gwshop_area_china` VALUES ('410922', '4', '清丰县', '410900', '457300');
INSERT INTO `gwshop_area_china` VALUES ('410923', '4', '南乐县', '410900', '457400');
INSERT INTO `gwshop_area_china` VALUES ('410926', '4', '范县', '410900', '457500');
INSERT INTO `gwshop_area_china` VALUES ('410927', '4', '台前县', '410900', '457600');
INSERT INTO `gwshop_area_china` VALUES ('410928', '4', '濮阳县', '410900', '457100');
INSERT INTO `gwshop_area_china` VALUES ('410929', '4', '其它区', '410900', '');
INSERT INTO `gwshop_area_china` VALUES ('411000', '3', '许昌市', '410000', '461000');
INSERT INTO `gwshop_area_china` VALUES ('411002', '4', '魏都区', '411000', '461000');
INSERT INTO `gwshop_area_china` VALUES ('411023', '4', '许昌县', '411000', '461100');
INSERT INTO `gwshop_area_china` VALUES ('411024', '4', '鄢陵县', '411000', '461200');
INSERT INTO `gwshop_area_china` VALUES ('411025', '4', '襄城县', '411000', '461700');
INSERT INTO `gwshop_area_china` VALUES ('411081', '4', '禹州市', '411000', '461670');
INSERT INTO `gwshop_area_china` VALUES ('411082', '4', '长葛市', '411000', '461500');
INSERT INTO `gwshop_area_china` VALUES ('411083', '4', '其它区', '411000', '');
INSERT INTO `gwshop_area_china` VALUES ('411100', '3', '漯河市', '410000', '462000');
INSERT INTO `gwshop_area_china` VALUES ('411102', '4', '源汇区', '411100', '462000');
INSERT INTO `gwshop_area_china` VALUES ('411103', '4', '郾城区', '411100', '462300');
INSERT INTO `gwshop_area_china` VALUES ('411104', '4', '召陵区', '411100', '462300');
INSERT INTO `gwshop_area_china` VALUES ('411121', '4', '舞阳县', '411100', '462400');
INSERT INTO `gwshop_area_china` VALUES ('411122', '4', '临颍县', '411100', '462600');
INSERT INTO `gwshop_area_china` VALUES ('411123', '4', '其它区', '411100', '');
INSERT INTO `gwshop_area_china` VALUES ('411200', '3', '三门峡市', '410000', '472000');
INSERT INTO `gwshop_area_china` VALUES ('411202', '4', '湖滨区', '411200', '472000');
INSERT INTO `gwshop_area_china` VALUES ('411221', '4', '渑池县', '411200', '472400');
INSERT INTO `gwshop_area_china` VALUES ('411222', '4', '陕县', '411200', '472100');
INSERT INTO `gwshop_area_china` VALUES ('411224', '4', '卢氏县', '411200', '472200');
INSERT INTO `gwshop_area_china` VALUES ('411281', '4', '义马市', '411200', '472300');
INSERT INTO `gwshop_area_china` VALUES ('411282', '4', '灵宝市', '411200', '472500');
INSERT INTO `gwshop_area_china` VALUES ('411283', '4', '其它区', '411200', '');
INSERT INTO `gwshop_area_china` VALUES ('411300', '3', '南阳市', '410000', '473000');
INSERT INTO `gwshop_area_china` VALUES ('411302', '4', '宛城区', '411300', '473001');
INSERT INTO `gwshop_area_china` VALUES ('411303', '4', '卧龙区', '411300', '473003');
INSERT INTO `gwshop_area_china` VALUES ('411321', '4', '南召县', '411300', '474650');
INSERT INTO `gwshop_area_china` VALUES ('411322', '4', '方城县', '411300', '473200');
INSERT INTO `gwshop_area_china` VALUES ('411323', '4', '西峡县', '411300', '474550');
INSERT INTO `gwshop_area_china` VALUES ('411324', '4', '镇平县', '411300', '474250');
INSERT INTO `gwshop_area_china` VALUES ('411325', '4', '内乡县', '411300', '474350');
INSERT INTO `gwshop_area_china` VALUES ('411326', '4', '淅川县', '411300', '474450');
INSERT INTO `gwshop_area_china` VALUES ('411327', '4', '社旗县', '411300', '473300');
INSERT INTO `gwshop_area_china` VALUES ('411328', '4', '唐河县', '411300', '473400');
INSERT INTO `gwshop_area_china` VALUES ('411329', '4', '新野县', '411300', '473500');
INSERT INTO `gwshop_area_china` VALUES ('411330', '4', '桐柏县', '411300', '474750');
INSERT INTO `gwshop_area_china` VALUES ('411381', '4', '邓州市', '411300', '474150');
INSERT INTO `gwshop_area_china` VALUES ('411382', '4', '其它区', '411300', '');
INSERT INTO `gwshop_area_china` VALUES ('411400', '3', '商丘市', '410000', '476000');
INSERT INTO `gwshop_area_china` VALUES ('411402', '4', '梁园区', '411400', '476000');
INSERT INTO `gwshop_area_china` VALUES ('411403', '4', '睢阳区', '411400', '476100');
INSERT INTO `gwshop_area_china` VALUES ('411421', '4', '民权县', '411400', '476800');
INSERT INTO `gwshop_area_china` VALUES ('411422', '4', '睢县', '411400', '476900');
INSERT INTO `gwshop_area_china` VALUES ('411423', '4', '宁陵县', '411400', '476700');
INSERT INTO `gwshop_area_china` VALUES ('411424', '4', '柘城县', '411400', '476200');
INSERT INTO `gwshop_area_china` VALUES ('411425', '4', '虞城县', '411400', '476300');
INSERT INTO `gwshop_area_china` VALUES ('411426', '4', '夏邑县', '411400', '476400');
INSERT INTO `gwshop_area_china` VALUES ('411481', '4', '永城市', '411400', '476600');
INSERT INTO `gwshop_area_china` VALUES ('411482', '4', '其它区', '411400', '');
INSERT INTO `gwshop_area_china` VALUES ('411500', '3', '信阳市', '410000', '464000');
INSERT INTO `gwshop_area_china` VALUES ('411502', '4', '浉河区', '411500', '464000');
INSERT INTO `gwshop_area_china` VALUES ('411503', '4', '平桥区', '411500', '464100');
INSERT INTO `gwshop_area_china` VALUES ('411521', '4', '罗山县', '411500', '464200');
INSERT INTO `gwshop_area_china` VALUES ('411522', '4', '光山县', '411500', '465450');
INSERT INTO `gwshop_area_china` VALUES ('411523', '4', '新县', '411500', '465550');
INSERT INTO `gwshop_area_china` VALUES ('411524', '4', '商城县', '411500', '465350');
INSERT INTO `gwshop_area_china` VALUES ('411525', '4', '固始县', '411500', '465200');
INSERT INTO `gwshop_area_china` VALUES ('411526', '4', '潢川县', '411500', '465150');
INSERT INTO `gwshop_area_china` VALUES ('411527', '4', '淮滨县', '411500', '464400');
INSERT INTO `gwshop_area_china` VALUES ('411528', '4', '息县', '411500', '464300');
INSERT INTO `gwshop_area_china` VALUES ('411529', '4', '其它区', '411500', '');
INSERT INTO `gwshop_area_china` VALUES ('411600', '3', '周口市', '410000', '466000');
INSERT INTO `gwshop_area_china` VALUES ('411602', '4', '川汇区', '411600', '466000');
INSERT INTO `gwshop_area_china` VALUES ('411621', '4', '扶沟县', '411600', '461300');
INSERT INTO `gwshop_area_china` VALUES ('411622', '4', '西华县', '411600', '466600');
INSERT INTO `gwshop_area_china` VALUES ('411623', '4', '商水县', '411600', '466100');
INSERT INTO `gwshop_area_china` VALUES ('411624', '4', '沈丘县', '411600', '466300');
INSERT INTO `gwshop_area_china` VALUES ('411625', '4', '郸城县', '411600', '477150');
INSERT INTO `gwshop_area_china` VALUES ('411626', '4', '淮阳县', '411600', '466700');
INSERT INTO `gwshop_area_china` VALUES ('411627', '4', '太康县', '411600', '475400');
INSERT INTO `gwshop_area_china` VALUES ('411628', '4', '鹿邑县', '411600', '477200');
INSERT INTO `gwshop_area_china` VALUES ('411681', '4', '项城市', '411600', '466200');
INSERT INTO `gwshop_area_china` VALUES ('411682', '4', '其它区', '411600', '');
INSERT INTO `gwshop_area_china` VALUES ('411700', '3', '驻马店市', '410000', '463000');
INSERT INTO `gwshop_area_china` VALUES ('411702', '4', '驿城区', '411700', '463000');
INSERT INTO `gwshop_area_china` VALUES ('411721', '4', '西平县', '411700', '463900');
INSERT INTO `gwshop_area_china` VALUES ('411722', '4', '上蔡县', '411700', '463800');
INSERT INTO `gwshop_area_china` VALUES ('411723', '4', '平舆县', '411700', '463400');
INSERT INTO `gwshop_area_china` VALUES ('411724', '4', '正阳县', '411700', '463600');
INSERT INTO `gwshop_area_china` VALUES ('411725', '4', '确山县', '411700', '463200');
INSERT INTO `gwshop_area_china` VALUES ('411726', '4', '泌阳县', '411700', '463700');
INSERT INTO `gwshop_area_china` VALUES ('411727', '4', '汝南县', '411700', '463300');
INSERT INTO `gwshop_area_china` VALUES ('411728', '4', '遂平县', '411700', '463100');
INSERT INTO `gwshop_area_china` VALUES ('411729', '4', '新蔡县', '411700', '463500');
INSERT INTO `gwshop_area_china` VALUES ('411730', '4', '其它区', '411700', '');
INSERT INTO `gwshop_area_china` VALUES ('420000', '2', '湖北省', '1', '');
INSERT INTO `gwshop_area_china` VALUES ('420100', '3', '武汉市', '420000', '430000');
INSERT INTO `gwshop_area_china` VALUES ('420102', '4', '江岸区', '420100', '430014');
INSERT INTO `gwshop_area_china` VALUES ('420103', '4', '江汉区', '420100', '430015');
INSERT INTO `gwshop_area_china` VALUES ('420104', '4', '硚口区', '420100', '430033');
INSERT INTO `gwshop_area_china` VALUES ('420105', '4', '汉阳区', '420100', '430050');
INSERT INTO `gwshop_area_china` VALUES ('420106', '4', '武昌区', '420100', '430061');
INSERT INTO `gwshop_area_china` VALUES ('420107', '4', '青山区', '420100', '430080');
INSERT INTO `gwshop_area_china` VALUES ('420111', '4', '洪山区', '420100', '430070');
INSERT INTO `gwshop_area_china` VALUES ('420112', '4', '东西湖区', '420100', '430040');
INSERT INTO `gwshop_area_china` VALUES ('420113', '4', '汉南区', '420100', '430090');
INSERT INTO `gwshop_area_china` VALUES ('420114', '4', '蔡甸区', '420100', '430100');
INSERT INTO `gwshop_area_china` VALUES ('420115', '4', '江夏区', '420100', '430200');
INSERT INTO `gwshop_area_china` VALUES ('420116', '4', '黄陂区', '420100', '430300');
INSERT INTO `gwshop_area_china` VALUES ('420117', '4', '新洲区', '420100', '431400');
INSERT INTO `gwshop_area_china` VALUES ('420118', '4', '其它区', '420100', '');
INSERT INTO `gwshop_area_china` VALUES ('420200', '3', '黄石市', '420000', '435000');
INSERT INTO `gwshop_area_china` VALUES ('420202', '4', '黄石港区', '420200', '435002');
INSERT INTO `gwshop_area_china` VALUES ('420203', '4', '西塞山区', '420200', '435001');
INSERT INTO `gwshop_area_china` VALUES ('420204', '4', '下陆区', '420200', '435004');
INSERT INTO `gwshop_area_china` VALUES ('420205', '4', '铁山区', '420200', '435006');
INSERT INTO `gwshop_area_china` VALUES ('420222', '4', '阳新县', '420200', '435200');
INSERT INTO `gwshop_area_china` VALUES ('420281', '4', '大冶市', '420200', '435100');
INSERT INTO `gwshop_area_china` VALUES ('420282', '4', '其它区', '420200', '');
INSERT INTO `gwshop_area_china` VALUES ('420300', '3', '十堰市', '420000', '442000');
INSERT INTO `gwshop_area_china` VALUES ('420302', '4', '茅箭区', '420300', '442012');
INSERT INTO `gwshop_area_china` VALUES ('420303', '4', '张湾区', '420300', '442001');
INSERT INTO `gwshop_area_china` VALUES ('420321', '4', '郧县', '420300', '442500');
INSERT INTO `gwshop_area_china` VALUES ('420322', '4', '郧西县', '420300', '442600');
INSERT INTO `gwshop_area_china` VALUES ('420323', '4', '竹山县', '420300', '442200');
INSERT INTO `gwshop_area_china` VALUES ('420324', '4', '竹溪县', '420300', '442300');
INSERT INTO `gwshop_area_china` VALUES ('420325', '4', '房县', '420300', '442100');
INSERT INTO `gwshop_area_china` VALUES ('420381', '4', '丹江口市', '420300', '441900');
INSERT INTO `gwshop_area_china` VALUES ('420382', '4', '城区', '420300', '');
INSERT INTO `gwshop_area_china` VALUES ('420383', '4', '其它区', '420300', '');
INSERT INTO `gwshop_area_china` VALUES ('420500', '3', '宜昌市', '420000', '443000');
INSERT INTO `gwshop_area_china` VALUES ('420502', '4', '西陵区', '420500', '443000');
INSERT INTO `gwshop_area_china` VALUES ('420503', '4', '伍家岗区', '420500', '443001');
INSERT INTO `gwshop_area_china` VALUES ('420504', '4', '点军区', '420500', '443006');
INSERT INTO `gwshop_area_china` VALUES ('420505', '4', '猇亭区', '420500', '443007');
INSERT INTO `gwshop_area_china` VALUES ('420506', '4', '夷陵区', '420500', '443100');
INSERT INTO `gwshop_area_china` VALUES ('420525', '4', '远安县', '420500', '444200');
INSERT INTO `gwshop_area_china` VALUES ('420526', '4', '兴山县', '420500', '443700');
INSERT INTO `gwshop_area_china` VALUES ('420527', '4', '秭归县', '420500', '443600');
INSERT INTO `gwshop_area_china` VALUES ('420528', '4', '长阳土家族自治县', '420500', '443500');
INSERT INTO `gwshop_area_china` VALUES ('420529', '4', '五峰土家族自治县', '420500', '443400');
INSERT INTO `gwshop_area_china` VALUES ('420551', '4', '葛洲坝区', '420500', '');
INSERT INTO `gwshop_area_china` VALUES ('420552', '4', '开发区', '420500', '');
INSERT INTO `gwshop_area_china` VALUES ('420581', '4', '宜都市', '420500', '443300');
INSERT INTO `gwshop_area_china` VALUES ('420582', '4', '当阳市', '420500', '444100');
INSERT INTO `gwshop_area_china` VALUES ('420583', '4', '枝江市', '420500', '443200');
INSERT INTO `gwshop_area_china` VALUES ('420584', '4', '其它区', '420500', '');
INSERT INTO `gwshop_area_china` VALUES ('420600', '3', '襄阳市', '420000', '441000');
INSERT INTO `gwshop_area_china` VALUES ('420602', '4', '襄城区', '420600', '441021');
INSERT INTO `gwshop_area_china` VALUES ('420606', '4', '樊城区', '420600', '441001');
INSERT INTO `gwshop_area_china` VALUES ('420607', '4', '襄州区', '420600', '441100');
INSERT INTO `gwshop_area_china` VALUES ('420624', '4', '南漳县', '420600', '441500');
INSERT INTO `gwshop_area_china` VALUES ('420625', '4', '谷城县', '420600', '441700');
INSERT INTO `gwshop_area_china` VALUES ('420626', '4', '保康县', '420600', '441600');
INSERT INTO `gwshop_area_china` VALUES ('420682', '4', '老河口市', '420600', '441800');
INSERT INTO `gwshop_area_china` VALUES ('420683', '4', '枣阳市', '420600', '441200');
INSERT INTO `gwshop_area_china` VALUES ('420684', '4', '宜城市', '420600', '441400');
INSERT INTO `gwshop_area_china` VALUES ('420685', '4', '其它区', '420600', '');
INSERT INTO `gwshop_area_china` VALUES ('420700', '3', '鄂州市', '420000', '436000');
INSERT INTO `gwshop_area_china` VALUES ('420702', '4', '梁子湖区', '420700', '436064');
INSERT INTO `gwshop_area_china` VALUES ('420703', '4', '华容区', '420700', '436030');
INSERT INTO `gwshop_area_china` VALUES ('420704', '4', '鄂城区', '420700', '436000');
INSERT INTO `gwshop_area_china` VALUES ('420705', '4', '其它区', '420700', '');
INSERT INTO `gwshop_area_china` VALUES ('420800', '3', '荆门市', '420000', '448000');
INSERT INTO `gwshop_area_china` VALUES ('420802', '4', '东宝区', '420800', '448004');
INSERT INTO `gwshop_area_china` VALUES ('420804', '4', '掇刀区', '420800', '448124');
INSERT INTO `gwshop_area_china` VALUES ('420821', '4', '京山县', '420800', '431800');
INSERT INTO `gwshop_area_china` VALUES ('420822', '4', '沙洋县', '420800', '448200');
INSERT INTO `gwshop_area_china` VALUES ('420881', '4', '钟祥市', '420800', '431900');
INSERT INTO `gwshop_area_china` VALUES ('420882', '4', '其它区', '420800', '');
INSERT INTO `gwshop_area_china` VALUES ('420900', '3', '孝感市', '420000', '432000');
INSERT INTO `gwshop_area_china` VALUES ('420902', '4', '孝南区', '420900', '432100');
INSERT INTO `gwshop_area_china` VALUES ('420921', '4', '孝昌县', '420900', '432900');
INSERT INTO `gwshop_area_china` VALUES ('420922', '4', '大悟县', '420900', '432800');
INSERT INTO `gwshop_area_china` VALUES ('420923', '4', '云梦县', '420900', '432500');
INSERT INTO `gwshop_area_china` VALUES ('420981', '4', '应城市', '420900', '432400');
INSERT INTO `gwshop_area_china` VALUES ('420982', '4', '安陆市', '420900', '432600');
INSERT INTO `gwshop_area_china` VALUES ('420984', '4', '汉川市', '420900', '431600');
INSERT INTO `gwshop_area_china` VALUES ('420985', '4', '其它区', '420900', '');
INSERT INTO `gwshop_area_china` VALUES ('421000', '3', '荆州市', '420000', '434000');
INSERT INTO `gwshop_area_china` VALUES ('421002', '4', '沙市区', '421000', '434000');
INSERT INTO `gwshop_area_china` VALUES ('421003', '4', '荆州区', '421000', '434020');
INSERT INTO `gwshop_area_china` VALUES ('421022', '4', '公安县', '421000', '434300');
INSERT INTO `gwshop_area_china` VALUES ('421023', '4', '监利县', '421000', '433300');
INSERT INTO `gwshop_area_china` VALUES ('421024', '4', '江陵县', '421000', '434100');
INSERT INTO `gwshop_area_china` VALUES ('421081', '4', '石首市', '421000', '434400');
INSERT INTO `gwshop_area_china` VALUES ('421083', '4', '洪湖市', '421000', '433200');
INSERT INTO `gwshop_area_china` VALUES ('421087', '4', '松滋市', '421000', '434200');
INSERT INTO `gwshop_area_china` VALUES ('421088', '4', '其它区', '421000', '');
INSERT INTO `gwshop_area_china` VALUES ('421100', '3', '黄冈市', '420000', '438000');
INSERT INTO `gwshop_area_china` VALUES ('421102', '4', '黄州区', '421100', '438000');
INSERT INTO `gwshop_area_china` VALUES ('421121', '4', '团风县', '421100', '438000');
INSERT INTO `gwshop_area_china` VALUES ('421122', '4', '红安县', '421100', '431500');
INSERT INTO `gwshop_area_china` VALUES ('421123', '4', '罗田县', '421100', '438600');
INSERT INTO `gwshop_area_china` VALUES ('421124', '4', '英山县', '421100', '438700');
INSERT INTO `gwshop_area_china` VALUES ('421125', '4', '浠水县', '421100', '438200');
INSERT INTO `gwshop_area_china` VALUES ('421126', '4', '蕲春县', '421100', '436300');
INSERT INTO `gwshop_area_china` VALUES ('421127', '4', '黄梅县', '421100', '435500');
INSERT INTO `gwshop_area_china` VALUES ('421181', '4', '麻城市', '421100', '438300');
INSERT INTO `gwshop_area_china` VALUES ('421182', '4', '武穴市', '421100', '435400');
INSERT INTO `gwshop_area_china` VALUES ('421183', '4', '其它区', '421100', '');
INSERT INTO `gwshop_area_china` VALUES ('421200', '3', '咸宁市', '420000', '437100');
INSERT INTO `gwshop_area_china` VALUES ('421202', '4', '咸安区', '421200', '437000');
INSERT INTO `gwshop_area_china` VALUES ('421221', '4', '嘉鱼县', '421200', '437200');
INSERT INTO `gwshop_area_china` VALUES ('421222', '4', '通城县', '421200', '437400');
INSERT INTO `gwshop_area_china` VALUES ('421223', '4', '崇阳县', '421200', '437500');
INSERT INTO `gwshop_area_china` VALUES ('421224', '4', '通山县', '421200', '437600');
INSERT INTO `gwshop_area_china` VALUES ('421281', '4', '赤壁市', '421200', '437300');
INSERT INTO `gwshop_area_china` VALUES ('421282', '4', '温泉城区', '421200', '');
INSERT INTO `gwshop_area_china` VALUES ('421283', '4', '其它区', '421200', '');
INSERT INTO `gwshop_area_china` VALUES ('421300', '3', '随州市', '420000', '441300');
INSERT INTO `gwshop_area_china` VALUES ('421302', '4', '曾都区', '421300', '441300');
INSERT INTO `gwshop_area_china` VALUES ('421321', '4', '随县', '421300', '441300');
INSERT INTO `gwshop_area_china` VALUES ('421381', '4', '广水市', '421300', '432700');
INSERT INTO `gwshop_area_china` VALUES ('421382', '4', '其它区', '421300', '');
INSERT INTO `gwshop_area_china` VALUES ('422800', '3', '恩施土家族苗族自治州', '420000', '');
INSERT INTO `gwshop_area_china` VALUES ('422801', '4', '恩施市', '422800', '445000');
INSERT INTO `gwshop_area_china` VALUES ('422802', '4', '利川市', '422800', '445400');
INSERT INTO `gwshop_area_china` VALUES ('422822', '4', '建始县', '422800', '445300');
INSERT INTO `gwshop_area_china` VALUES ('422823', '4', '巴东县', '422800', '444300');
INSERT INTO `gwshop_area_china` VALUES ('422825', '4', '宣恩县', '422800', '445500');
INSERT INTO `gwshop_area_china` VALUES ('422826', '4', '咸丰县', '422800', '445600');
INSERT INTO `gwshop_area_china` VALUES ('422827', '4', '来凤县', '422800', '445700');
INSERT INTO `gwshop_area_china` VALUES ('422828', '4', '鹤峰县', '422800', '445800');
INSERT INTO `gwshop_area_china` VALUES ('422829', '4', '其它区', '422800', '');
INSERT INTO `gwshop_area_china` VALUES ('429004', '4', '仙桃市', '420000', '433000');
INSERT INTO `gwshop_area_china` VALUES ('429005', '4', '潜江市', '420000', '433100');
INSERT INTO `gwshop_area_china` VALUES ('429006', '4', '天门市', '420000', '431700');
INSERT INTO `gwshop_area_china` VALUES ('429021', '4', '神农架林区', '420000', '442400');
INSERT INTO `gwshop_area_china` VALUES ('430000', '2', '湖南省', '1', '');
INSERT INTO `gwshop_area_china` VALUES ('430100', '3', '长沙市', '430000', '410000');
INSERT INTO `gwshop_area_china` VALUES ('430102', '4', '芙蓉区', '430100', '410006');
INSERT INTO `gwshop_area_china` VALUES ('430103', '4', '天心区', '430100', '410002');
INSERT INTO `gwshop_area_china` VALUES ('430104', '4', '岳麓区', '430100', '410006');
INSERT INTO `gwshop_area_china` VALUES ('430105', '4', '开福区', '430100', '410005');
INSERT INTO `gwshop_area_china` VALUES ('430111', '4', '雨花区', '430100', '410007');
INSERT INTO `gwshop_area_china` VALUES ('430121', '4', '长沙县', '430100', '410100');
INSERT INTO `gwshop_area_china` VALUES ('430122', '4', '望城县', '430100', '410200');
INSERT INTO `gwshop_area_china` VALUES ('430124', '4', '宁乡县', '430100', '410600');
INSERT INTO `gwshop_area_china` VALUES ('430181', '4', '浏阳市', '430100', '410300');
INSERT INTO `gwshop_area_china` VALUES ('430182', '4', '其它区', '430100', '');
INSERT INTO `gwshop_area_china` VALUES ('430200', '3', '株洲市', '430000', '412000');
INSERT INTO `gwshop_area_china` VALUES ('430202', '4', '荷塘区', '430200', '412000');
INSERT INTO `gwshop_area_china` VALUES ('430203', '4', '芦淞区', '430200', '412000');
INSERT INTO `gwshop_area_china` VALUES ('430204', '4', '石峰区', '430200', '412005');
INSERT INTO `gwshop_area_china` VALUES ('430211', '4', '天元区', '430200', '412000');
INSERT INTO `gwshop_area_china` VALUES ('430221', '4', '株洲县', '430200', '412100');
INSERT INTO `gwshop_area_china` VALUES ('430223', '4', '攸县', '430200', '412300');
INSERT INTO `gwshop_area_china` VALUES ('430224', '4', '茶陵县', '430200', '412400');
INSERT INTO `gwshop_area_china` VALUES ('430225', '4', '炎陵县', '430200', '412500');
INSERT INTO `gwshop_area_china` VALUES ('430281', '4', '醴陵市', '430200', '412200');
INSERT INTO `gwshop_area_china` VALUES ('430282', '4', '其它区', '430200', '');
INSERT INTO `gwshop_area_china` VALUES ('430300', '3', '湘潭市', '430000', '411100');
INSERT INTO `gwshop_area_china` VALUES ('430302', '4', '雨湖区', '430300', '411100');
INSERT INTO `gwshop_area_china` VALUES ('430304', '4', '岳塘区', '430300', '411101');
INSERT INTO `gwshop_area_china` VALUES ('430321', '4', '湘潭县', '430300', '411200');
INSERT INTO `gwshop_area_china` VALUES ('430381', '4', '湘乡市', '430300', '411400');
INSERT INTO `gwshop_area_china` VALUES ('430382', '4', '韶山市', '430300', '411300');
INSERT INTO `gwshop_area_china` VALUES ('430383', '4', '其它区', '430300', '');
INSERT INTO `gwshop_area_china` VALUES ('430400', '3', '衡阳市', '430000', '421000');
INSERT INTO `gwshop_area_china` VALUES ('430405', '4', '珠晖区', '430400', '421002');
INSERT INTO `gwshop_area_china` VALUES ('430406', '4', '雁峰区', '430400', '421001');
INSERT INTO `gwshop_area_china` VALUES ('430407', '4', '石鼓区', '430400', '421001');
INSERT INTO `gwshop_area_china` VALUES ('430408', '4', '蒸湘区', '430400', '421001');
INSERT INTO `gwshop_area_china` VALUES ('430412', '4', '南岳区', '430400', '421900');
INSERT INTO `gwshop_area_china` VALUES ('430421', '4', '衡阳县', '430400', '421200');
INSERT INTO `gwshop_area_china` VALUES ('430422', '4', '衡南县', '430400', '421100');
INSERT INTO `gwshop_area_china` VALUES ('430423', '4', '衡山县', '430400', '421300');
INSERT INTO `gwshop_area_china` VALUES ('430424', '4', '衡东县', '430400', '421400');
INSERT INTO `gwshop_area_china` VALUES ('430426', '4', '祁东县', '430400', '421600');
INSERT INTO `gwshop_area_china` VALUES ('430481', '4', '耒阳市', '430400', '421800');
INSERT INTO `gwshop_area_china` VALUES ('430482', '4', '常宁市', '430400', '421500');
INSERT INTO `gwshop_area_china` VALUES ('430483', '4', '其它区', '430400', '');
INSERT INTO `gwshop_area_china` VALUES ('430500', '3', '邵阳市', '430000', '422000');
INSERT INTO `gwshop_area_china` VALUES ('430502', '4', '双清区', '430500', '422001');
INSERT INTO `gwshop_area_china` VALUES ('430503', '4', '大祥区', '430500', '422000');
INSERT INTO `gwshop_area_china` VALUES ('430511', '4', '北塔区', '430500', '422001');
INSERT INTO `gwshop_area_china` VALUES ('430521', '4', '邵东县', '430500', '422800');
INSERT INTO `gwshop_area_china` VALUES ('430522', '4', '新邵县', '430500', '422900');
INSERT INTO `gwshop_area_china` VALUES ('430523', '4', '邵阳县', '430500', '422100');
INSERT INTO `gwshop_area_china` VALUES ('430524', '4', '隆回县', '430500', '422200');
INSERT INTO `gwshop_area_china` VALUES ('430525', '4', '洞口县', '430500', '422300');
INSERT INTO `gwshop_area_china` VALUES ('430527', '4', '绥宁县', '430500', '422600');
INSERT INTO `gwshop_area_china` VALUES ('430528', '4', '新宁县', '430500', '422700');
INSERT INTO `gwshop_area_china` VALUES ('430529', '4', '城步苗族自治县', '430500', '422500');
INSERT INTO `gwshop_area_china` VALUES ('430581', '4', '武冈市', '430500', '422400');
INSERT INTO `gwshop_area_china` VALUES ('430582', '4', '其它区', '430500', '');
INSERT INTO `gwshop_area_china` VALUES ('430600', '3', '岳阳市', '430000', '414000');
INSERT INTO `gwshop_area_china` VALUES ('430602', '4', '岳阳楼区', '430600', '414000');
INSERT INTO `gwshop_area_china` VALUES ('430603', '4', '云溪区', '430600', '414003');
INSERT INTO `gwshop_area_china` VALUES ('430611', '4', '君山区', '430600', '414005');
INSERT INTO `gwshop_area_china` VALUES ('430621', '4', '岳阳县', '430600', '414100');
INSERT INTO `gwshop_area_china` VALUES ('430623', '4', '华容县', '430600', '414200');
INSERT INTO `gwshop_area_china` VALUES ('430624', '4', '湘阴县', '430600', '414600');
INSERT INTO `gwshop_area_china` VALUES ('430626', '4', '平江县', '430600', '410400');
INSERT INTO `gwshop_area_china` VALUES ('430681', '4', '汨罗市', '430600', '414400');
INSERT INTO `gwshop_area_china` VALUES ('430682', '4', '临湘市', '430600', '414300');
INSERT INTO `gwshop_area_china` VALUES ('430683', '4', '其它区', '430600', '');
INSERT INTO `gwshop_area_china` VALUES ('430700', '3', '常德市', '430000', '415000');
INSERT INTO `gwshop_area_china` VALUES ('430702', '4', '武陵区', '430700', '415000');
INSERT INTO `gwshop_area_china` VALUES ('430703', '4', '鼎城区', '430700', '415100');
INSERT INTO `gwshop_area_china` VALUES ('430721', '4', '安乡县', '430700', '415600');
INSERT INTO `gwshop_area_china` VALUES ('430722', '4', '汉寿县', '430700', '415900');
INSERT INTO `gwshop_area_china` VALUES ('430723', '4', '澧县', '430700', '415500');
INSERT INTO `gwshop_area_china` VALUES ('430724', '4', '临澧县', '430700', '415200');
INSERT INTO `gwshop_area_china` VALUES ('430725', '4', '桃源县', '430700', '415700');
INSERT INTO `gwshop_area_china` VALUES ('430726', '4', '石门县', '430700', '415300');
INSERT INTO `gwshop_area_china` VALUES ('430781', '4', '津市市', '430700', '415400');
INSERT INTO `gwshop_area_china` VALUES ('430782', '4', '其它区', '430700', '');
INSERT INTO `gwshop_area_china` VALUES ('430800', '3', '张家界市', '430000', '427000');
INSERT INTO `gwshop_area_china` VALUES ('430802', '4', '永定区', '430800', '427000');
INSERT INTO `gwshop_area_china` VALUES ('430811', '4', '武陵源区', '430800', '427400');
INSERT INTO `gwshop_area_china` VALUES ('430821', '4', '慈利县', '430800', '427200');
INSERT INTO `gwshop_area_china` VALUES ('430822', '4', '桑植县', '430800', '427100');
INSERT INTO `gwshop_area_china` VALUES ('430823', '4', '其它区', '430800', '');
INSERT INTO `gwshop_area_china` VALUES ('430900', '3', '益阳市', '430000', '413000');
INSERT INTO `gwshop_area_china` VALUES ('430902', '4', '资阳区', '430900', '413000');
INSERT INTO `gwshop_area_china` VALUES ('430903', '4', '赫山区', '430900', '413002');
INSERT INTO `gwshop_area_china` VALUES ('430921', '4', '南县', '430900', '413200');
INSERT INTO `gwshop_area_china` VALUES ('430922', '4', '桃江县', '430900', '413400');
INSERT INTO `gwshop_area_china` VALUES ('430923', '4', '安化县', '430900', '413500');
INSERT INTO `gwshop_area_china` VALUES ('430981', '4', '沅江市', '430900', '413100');
INSERT INTO `gwshop_area_china` VALUES ('430982', '4', '其它区', '430900', '');
INSERT INTO `gwshop_area_china` VALUES ('431000', '3', '郴州市', '430000', '423000');
INSERT INTO `gwshop_area_china` VALUES ('431002', '4', '北湖区', '431000', '423000');
INSERT INTO `gwshop_area_china` VALUES ('431003', '4', '苏仙区', '431000', '423000');
INSERT INTO `gwshop_area_china` VALUES ('431021', '4', '桂阳县', '431000', '424400');
INSERT INTO `gwshop_area_china` VALUES ('431022', '4', '宜章县', '431000', '424200');
INSERT INTO `gwshop_area_china` VALUES ('431023', '4', '永兴县', '431000', '423300');
INSERT INTO `gwshop_area_china` VALUES ('431024', '4', '嘉禾县', '431000', '424500');
INSERT INTO `gwshop_area_china` VALUES ('431025', '4', '临武县', '431000', '424300');
INSERT INTO `gwshop_area_china` VALUES ('431026', '4', '汝城县', '431000', '424100');
INSERT INTO `gwshop_area_china` VALUES ('431027', '4', '桂东县', '431000', '423500');
INSERT INTO `gwshop_area_china` VALUES ('431028', '4', '安仁县', '431000', '423600');
INSERT INTO `gwshop_area_china` VALUES ('431081', '4', '资兴市', '431000', '423400');
INSERT INTO `gwshop_area_china` VALUES ('431082', '4', '其它区', '431000', '');
INSERT INTO `gwshop_area_china` VALUES ('431100', '3', '永州市', '430000', '425000');
INSERT INTO `gwshop_area_china` VALUES ('431102', '4', '零陵区', '431100', '425007');
INSERT INTO `gwshop_area_china` VALUES ('431103', '4', '冷水滩区', '431100', '425000');
INSERT INTO `gwshop_area_china` VALUES ('431121', '4', '祁阳县', '431100', '426100');
INSERT INTO `gwshop_area_china` VALUES ('431122', '4', '东安县', '431100', '425900');
INSERT INTO `gwshop_area_china` VALUES ('431123', '4', '双牌县', '431100', '425200');
INSERT INTO `gwshop_area_china` VALUES ('431124', '4', '道县', '431100', '425300');
INSERT INTO `gwshop_area_china` VALUES ('431125', '4', '江永县', '431100', '425400');
INSERT INTO `gwshop_area_china` VALUES ('431126', '4', '宁远县', '431100', '425600');
INSERT INTO `gwshop_area_china` VALUES ('431127', '4', '蓝山县', '431100', '425800');
INSERT INTO `gwshop_area_china` VALUES ('431128', '4', '新田县', '431100', '425700');
INSERT INTO `gwshop_area_china` VALUES ('431129', '4', '江华瑶族自治县', '431100', '425500');
INSERT INTO `gwshop_area_china` VALUES ('431130', '4', '其它区', '431100', '');
INSERT INTO `gwshop_area_china` VALUES ('431200', '3', '怀化市', '430000', '418000');
INSERT INTO `gwshop_area_china` VALUES ('431202', '4', '鹤城区', '431200', '418000');
INSERT INTO `gwshop_area_china` VALUES ('431221', '4', '中方县', '431200', '418005');
INSERT INTO `gwshop_area_china` VALUES ('431222', '4', '沅陵县', '431200', '419600');
INSERT INTO `gwshop_area_china` VALUES ('431223', '4', '辰溪县', '431200', '419500');
INSERT INTO `gwshop_area_china` VALUES ('431224', '4', '溆浦县', '431200', '419300');
INSERT INTO `gwshop_area_china` VALUES ('431225', '4', '会同县', '431200', '418300');
INSERT INTO `gwshop_area_china` VALUES ('431226', '4', '麻阳苗族自治县', '431200', '419400');
INSERT INTO `gwshop_area_china` VALUES ('431227', '4', '新晃侗族自治县', '431200', '419200');
INSERT INTO `gwshop_area_china` VALUES ('431228', '4', '芷江侗族自治县', '431200', '419100');
INSERT INTO `gwshop_area_china` VALUES ('431229', '4', '靖州苗族侗族自治县', '431200', '418400');
INSERT INTO `gwshop_area_china` VALUES ('431230', '4', '通道侗族自治县', '431200', '418500');
INSERT INTO `gwshop_area_china` VALUES ('431281', '4', '洪江市', '431200', '418200');
INSERT INTO `gwshop_area_china` VALUES ('431282', '4', '其它区', '431200', '');
INSERT INTO `gwshop_area_china` VALUES ('431300', '3', '娄底市', '430000', '417000');
INSERT INTO `gwshop_area_china` VALUES ('431302', '4', '娄星区', '431300', '417000');
INSERT INTO `gwshop_area_china` VALUES ('431321', '4', '双峰县', '431300', '417700');
INSERT INTO `gwshop_area_china` VALUES ('431322', '4', '新化县', '431300', '417600');
INSERT INTO `gwshop_area_china` VALUES ('431381', '4', '冷水江市', '431300', '417500');
INSERT INTO `gwshop_area_china` VALUES ('431382', '4', '涟源市', '431300', '417100');
INSERT INTO `gwshop_area_china` VALUES ('431383', '4', '其它区', '431300', '');
INSERT INTO `gwshop_area_china` VALUES ('433100', '3', '湘西土家族苗族自治州', '430000', '416000');
INSERT INTO `gwshop_area_china` VALUES ('433101', '4', '吉首市', '433100', '416000');
INSERT INTO `gwshop_area_china` VALUES ('433122', '4', '泸溪县', '433100', '416100');
INSERT INTO `gwshop_area_china` VALUES ('433123', '4', '凤凰县', '433100', '416200');
INSERT INTO `gwshop_area_china` VALUES ('433124', '4', '花垣县', '433100', '416400');
INSERT INTO `gwshop_area_china` VALUES ('433125', '4', '保靖县', '433100', '416500');
INSERT INTO `gwshop_area_china` VALUES ('433126', '4', '古丈县', '433100', '416300');
INSERT INTO `gwshop_area_china` VALUES ('433127', '4', '永顺县', '433100', '416700');
INSERT INTO `gwshop_area_china` VALUES ('433130', '4', '龙山县', '433100', '416800');
INSERT INTO `gwshop_area_china` VALUES ('433131', '4', '其它区', '433100', '');
INSERT INTO `gwshop_area_china` VALUES ('440000', '2', '广东省', '1', '');
INSERT INTO `gwshop_area_china` VALUES ('440100', '3', '广州市', '440000', '510000');
INSERT INTO `gwshop_area_china` VALUES ('440103', '4', '荔湾区', '440100', '510145');
INSERT INTO `gwshop_area_china` VALUES ('440104', '4', '越秀区', '440100', '510180');
INSERT INTO `gwshop_area_china` VALUES ('440105', '4', '海珠区', '440100', '510220');
INSERT INTO `gwshop_area_china` VALUES ('440106', '4', '天河区', '440100', '510510');
INSERT INTO `gwshop_area_china` VALUES ('440111', '4', '白云区', '440100', '510440');
INSERT INTO `gwshop_area_china` VALUES ('440112', '4', '黄埔区', '440100', '510700');
INSERT INTO `gwshop_area_china` VALUES ('440113', '4', '番禺区', '440100', '511400');
INSERT INTO `gwshop_area_china` VALUES ('440114', '4', '花都区', '440100', '510800');
INSERT INTO `gwshop_area_china` VALUES ('440115', '4', '南沙区', '440100', '');
INSERT INTO `gwshop_area_china` VALUES ('440116', '4', '萝岗区', '440100', '');
INSERT INTO `gwshop_area_china` VALUES ('440183', '4', '增城市', '440100', '511300');
INSERT INTO `gwshop_area_china` VALUES ('440184', '4', '从化市', '440100', '510900');
INSERT INTO `gwshop_area_china` VALUES ('440188', '4', '东山区', '440100', '');
INSERT INTO `gwshop_area_china` VALUES ('440189', '4', '其它区', '440100', '');
INSERT INTO `gwshop_area_china` VALUES ('440200', '3', '韶关市', '440000', '512000');
INSERT INTO `gwshop_area_china` VALUES ('440203', '4', '武江区', '440200', '512026');
INSERT INTO `gwshop_area_china` VALUES ('440204', '4', '浈江区', '440200', '512023');
INSERT INTO `gwshop_area_china` VALUES ('440205', '4', '曲江区', '440200', '512100');
INSERT INTO `gwshop_area_china` VALUES ('440222', '4', '始兴县', '440200', '512500');
INSERT INTO `gwshop_area_china` VALUES ('440224', '4', '仁化县', '440200', '512300');
INSERT INTO `gwshop_area_china` VALUES ('440229', '4', '翁源县', '440200', '512600');
INSERT INTO `gwshop_area_china` VALUES ('440232', '4', '乳源瑶族自治县', '440200', '512700');
INSERT INTO `gwshop_area_china` VALUES ('440233', '4', '新丰县', '440200', '511100');
INSERT INTO `gwshop_area_china` VALUES ('440281', '4', '乐昌市', '440200', '512200');
INSERT INTO `gwshop_area_china` VALUES ('440282', '4', '南雄市', '440200', '512400');
INSERT INTO `gwshop_area_china` VALUES ('440283', '4', '其它区', '440200', '');
INSERT INTO `gwshop_area_china` VALUES ('440300', '3', '深圳市', '440000', '518000');
INSERT INTO `gwshop_area_china` VALUES ('440303', '4', '罗湖区', '440300', '518002');
INSERT INTO `gwshop_area_china` VALUES ('440304', '4', '福田区', '440300', '518031');
INSERT INTO `gwshop_area_china` VALUES ('440305', '4', '南山区', '440300', '518052');
INSERT INTO `gwshop_area_china` VALUES ('440306', '4', '宝安区', '440300', '518101');
INSERT INTO `gwshop_area_china` VALUES ('440307', '4', '龙岗区', '440300', '518116');
INSERT INTO `gwshop_area_china` VALUES ('440308', '4', '盐田区', '440300', '518083');
INSERT INTO `gwshop_area_china` VALUES ('440309', '4', '其它区', '440300', '');
INSERT INTO `gwshop_area_china` VALUES ('440400', '3', '珠海市', '440000', '519000');
INSERT INTO `gwshop_area_china` VALUES ('440402', '4', '香洲区', '440400', '519000');
INSERT INTO `gwshop_area_china` VALUES ('440403', '4', '斗门区', '440400', '519100');
INSERT INTO `gwshop_area_china` VALUES ('440404', '4', '金湾区', '440400', '519090');
INSERT INTO `gwshop_area_china` VALUES ('440486', '4', '金唐区', '440400', '');
INSERT INTO `gwshop_area_china` VALUES ('440487', '4', '南湾区', '440400', '');
INSERT INTO `gwshop_area_china` VALUES ('440488', '4', '其它区', '440400', '');
INSERT INTO `gwshop_area_china` VALUES ('440500', '3', '汕头市', '440000', '515000');
INSERT INTO `gwshop_area_china` VALUES ('440507', '4', '龙湖区', '440500', '515041');
INSERT INTO `gwshop_area_china` VALUES ('440511', '4', '金平区', '440500', '515041');
INSERT INTO `gwshop_area_china` VALUES ('440512', '4', '濠江区', '440500', '515071');
INSERT INTO `gwshop_area_china` VALUES ('440513', '4', '潮阳区', '440500', '515100');
INSERT INTO `gwshop_area_china` VALUES ('440514', '4', '潮南区', '440500', '515144');
INSERT INTO `gwshop_area_china` VALUES ('440515', '4', '澄海区', '440500', '515800');
INSERT INTO `gwshop_area_china` VALUES ('440523', '4', '南澳县', '440500', '515900');
INSERT INTO `gwshop_area_china` VALUES ('440524', '4', '其它区', '440500', '');
INSERT INTO `gwshop_area_china` VALUES ('440600', '3', '佛山市', '440000', '528000');
INSERT INTO `gwshop_area_china` VALUES ('440604', '4', '禅城区', '440600', '528000');
INSERT INTO `gwshop_area_china` VALUES ('440605', '4', '南海区', '440600', '528200');
INSERT INTO `gwshop_area_china` VALUES ('440606', '4', '顺德区', '440600', '528300');
INSERT INTO `gwshop_area_china` VALUES ('440607', '4', '三水区', '440600', '528100');
INSERT INTO `gwshop_area_china` VALUES ('440608', '4', '高明区', '440600', '528500');
INSERT INTO `gwshop_area_china` VALUES ('440609', '4', '其它区', '440600', '');
INSERT INTO `gwshop_area_china` VALUES ('440700', '3', '江门市', '440000', '529000');
INSERT INTO `gwshop_area_china` VALUES ('440703', '4', '蓬江区', '440700', '529051');
INSERT INTO `gwshop_area_china` VALUES ('440704', '4', '江海区', '440700', '529000');
INSERT INTO `gwshop_area_china` VALUES ('440705', '4', '新会区', '440700', '529100');
INSERT INTO `gwshop_area_china` VALUES ('440781', '4', '台山市', '440700', '529200');
INSERT INTO `gwshop_area_china` VALUES ('440783', '4', '开平市', '440700', '529300');
INSERT INTO `gwshop_area_china` VALUES ('440784', '4', '鹤山市', '440700', '529700');
INSERT INTO `gwshop_area_china` VALUES ('440785', '4', '恩平市', '440700', '529400');
INSERT INTO `gwshop_area_china` VALUES ('440786', '4', '其它区', '440700', '');
INSERT INTO `gwshop_area_china` VALUES ('440800', '3', '湛江市', '440000', '524000');
INSERT INTO `gwshop_area_china` VALUES ('440802', '4', '赤坎区', '440800', '524033');
INSERT INTO `gwshop_area_china` VALUES ('440803', '4', '霞山区', '440800', '524002');
INSERT INTO `gwshop_area_china` VALUES ('440804', '4', '坡头区', '440800', '524057');
INSERT INTO `gwshop_area_china` VALUES ('440811', '4', '麻章区', '440800', '524003');
INSERT INTO `gwshop_area_china` VALUES ('440823', '4', '遂溪县', '440800', '524300');
INSERT INTO `gwshop_area_china` VALUES ('440825', '4', '徐闻县', '440800', '524100');
INSERT INTO `gwshop_area_china` VALUES ('440881', '4', '廉江市', '440800', '524400');
INSERT INTO `gwshop_area_china` VALUES ('440882', '4', '雷州市', '440800', '524200');
INSERT INTO `gwshop_area_china` VALUES ('440883', '4', '吴川市', '440800', '524500');
INSERT INTO `gwshop_area_china` VALUES ('440884', '4', '其它区', '440800', '');
INSERT INTO `gwshop_area_china` VALUES ('440900', '3', '茂名市', '440000', '525000');
INSERT INTO `gwshop_area_china` VALUES ('440902', '4', '茂南区', '440900', '525011');
INSERT INTO `gwshop_area_china` VALUES ('440903', '4', '茂港区', '440900', '525027');
INSERT INTO `gwshop_area_china` VALUES ('440923', '4', '电白县', '440900', '525400');
INSERT INTO `gwshop_area_china` VALUES ('440981', '4', '高州市', '440900', '525200');
INSERT INTO `gwshop_area_china` VALUES ('440982', '4', '化州市', '440900', '525100');
INSERT INTO `gwshop_area_china` VALUES ('440983', '4', '信宜市', '440900', '525300');
INSERT INTO `gwshop_area_china` VALUES ('440984', '4', '其它区', '440900', '');
INSERT INTO `gwshop_area_china` VALUES ('441200', '3', '肇庆市', '440000', '526000');
INSERT INTO `gwshop_area_china` VALUES ('441202', '4', '端州区', '441200', '526040');
INSERT INTO `gwshop_area_china` VALUES ('441203', '4', '鼎湖区', '441200', '526070');
INSERT INTO `gwshop_area_china` VALUES ('441223', '4', '广宁县', '441200', '526300');
INSERT INTO `gwshop_area_china` VALUES ('441224', '4', '怀集县', '441200', '526400');
INSERT INTO `gwshop_area_china` VALUES ('441225', '4', '封开县', '441200', '526500');
INSERT INTO `gwshop_area_china` VALUES ('441226', '4', '德庆县', '441200', '526600');
INSERT INTO `gwshop_area_china` VALUES ('441283', '4', '高要市', '441200', '526100');
INSERT INTO `gwshop_area_china` VALUES ('441284', '4', '四会市', '441200', '526200');
INSERT INTO `gwshop_area_china` VALUES ('441285', '4', '其它区', '441200', '');
INSERT INTO `gwshop_area_china` VALUES ('441300', '3', '惠州市', '440000', '516000');
INSERT INTO `gwshop_area_china` VALUES ('441302', '4', '惠城区', '441300', '516001');
INSERT INTO `gwshop_area_china` VALUES ('441303', '4', '惠阳区', '441300', '516200');
INSERT INTO `gwshop_area_china` VALUES ('441322', '4', '博罗县', '441300', '516100');
INSERT INTO `gwshop_area_china` VALUES ('441323', '4', '惠东县', '441300', '516300');
INSERT INTO `gwshop_area_china` VALUES ('441324', '4', '龙门县', '441300', '516800');
INSERT INTO `gwshop_area_china` VALUES ('441325', '4', '其它区', '441300', '');
INSERT INTO `gwshop_area_china` VALUES ('441400', '3', '梅州市', '440000', '514000');
INSERT INTO `gwshop_area_china` VALUES ('441402', '4', '梅江区', '441400', '514000');
INSERT INTO `gwshop_area_china` VALUES ('441421', '4', '梅县', '441400', '514700');
INSERT INTO `gwshop_area_china` VALUES ('441422', '4', '大埔县', '441400', '514200');
INSERT INTO `gwshop_area_china` VALUES ('441423', '4', '丰顺县', '441400', '514300');
INSERT INTO `gwshop_area_china` VALUES ('441424', '4', '五华县', '441400', '514400');
INSERT INTO `gwshop_area_china` VALUES ('441426', '4', '平远县', '441400', '514600');
INSERT INTO `gwshop_area_china` VALUES ('441427', '4', '蕉岭县', '441400', '514100');
INSERT INTO `gwshop_area_china` VALUES ('441481', '4', '兴宁市', '441400', '514500');
INSERT INTO `gwshop_area_china` VALUES ('441482', '4', '其它区', '441400', '');
INSERT INTO `gwshop_area_china` VALUES ('441500', '3', '汕尾市', '440000', '516600');
INSERT INTO `gwshop_area_china` VALUES ('441502', '4', '城区', '441500', '516601');
INSERT INTO `gwshop_area_china` VALUES ('441521', '4', '海丰县', '441500', '516400');
INSERT INTO `gwshop_area_china` VALUES ('441523', '4', '陆河县', '441500', '516700');
INSERT INTO `gwshop_area_china` VALUES ('441581', '4', '陆丰市', '441500', '516500');
INSERT INTO `gwshop_area_china` VALUES ('441582', '4', '其它区', '441500', '');
INSERT INTO `gwshop_area_china` VALUES ('441600', '3', '河源市', '440000', '517000');
INSERT INTO `gwshop_area_china` VALUES ('441602', '4', '源城区', '441600', '517000');
INSERT INTO `gwshop_area_china` VALUES ('441621', '4', '紫金县', '441600', '517400');
INSERT INTO `gwshop_area_china` VALUES ('441622', '4', '龙川县', '441600', '517300');
INSERT INTO `gwshop_area_china` VALUES ('441623', '4', '连平县', '441600', '517100');
INSERT INTO `gwshop_area_china` VALUES ('441624', '4', '和平县', '441600', '517200');
INSERT INTO `gwshop_area_china` VALUES ('441625', '4', '东源县', '441600', '517500');
INSERT INTO `gwshop_area_china` VALUES ('441626', '4', '其它区', '441600', '');
INSERT INTO `gwshop_area_china` VALUES ('441700', '3', '阳江市', '440000', '529500');
INSERT INTO `gwshop_area_china` VALUES ('441702', '4', '江城区', '441700', '529525');
INSERT INTO `gwshop_area_china` VALUES ('441721', '4', '阳西县', '441700', '529800');
INSERT INTO `gwshop_area_china` VALUES ('441723', '4', '阳东县', '441700', '529931');
INSERT INTO `gwshop_area_china` VALUES ('441781', '4', '阳春市', '441700', '529600');
INSERT INTO `gwshop_area_china` VALUES ('441782', '4', '其它区', '441700', '');
INSERT INTO `gwshop_area_china` VALUES ('441800', '3', '清远市', '440000', '511500');
INSERT INTO `gwshop_area_china` VALUES ('441802', '4', '清城区', '441800', '511500');
INSERT INTO `gwshop_area_china` VALUES ('441821', '4', '佛冈县', '441800', '511600');
INSERT INTO `gwshop_area_china` VALUES ('441823', '4', '阳山县', '441800', '513100');
INSERT INTO `gwshop_area_china` VALUES ('441825', '4', '连山壮族瑶族自治县', '441800', '513200');
INSERT INTO `gwshop_area_china` VALUES ('441826', '4', '连南瑶族自治县', '441800', '513300');
INSERT INTO `gwshop_area_china` VALUES ('441827', '4', '清新县', '441800', '511800');
INSERT INTO `gwshop_area_china` VALUES ('441881', '4', '英德市', '441800', '513000');
INSERT INTO `gwshop_area_china` VALUES ('441882', '4', '连州市', '441800', '513400');
INSERT INTO `gwshop_area_china` VALUES ('441883', '4', '其它区', '441800', '');
INSERT INTO `gwshop_area_china` VALUES ('441900', '3', '东莞市', '440000', '523000');
INSERT INTO `gwshop_area_china` VALUES ('442000', '3', '中山市', '440000', '528400');
INSERT INTO `gwshop_area_china` VALUES ('445100', '3', '潮州市', '440000', '521000');
INSERT INTO `gwshop_area_china` VALUES ('445102', '4', '湘桥区', '445100', '521000');
INSERT INTO `gwshop_area_china` VALUES ('445121', '4', '潮安县', '445100', '515600');
INSERT INTO `gwshop_area_china` VALUES ('445122', '4', '饶平县', '445100', '515700');
INSERT INTO `gwshop_area_china` VALUES ('445185', '4', '枫溪区', '445100', '');
INSERT INTO `gwshop_area_china` VALUES ('445186', '4', '其它区', '445100', '');
INSERT INTO `gwshop_area_china` VALUES ('445200', '3', '揭阳市', '440000', '522000');
INSERT INTO `gwshop_area_china` VALUES ('445202', '4', '榕城区', '445200', '522095');
INSERT INTO `gwshop_area_china` VALUES ('445221', '4', '揭东县', '445200', '515500');
INSERT INTO `gwshop_area_china` VALUES ('445222', '4', '揭西县', '445200', '515400');
INSERT INTO `gwshop_area_china` VALUES ('445224', '4', '惠来县', '445200', '515200');
INSERT INTO `gwshop_area_china` VALUES ('445281', '4', '普宁市', '445200', '515300');
INSERT INTO `gwshop_area_china` VALUES ('445284', '4', '东山区', '445200', '');
INSERT INTO `gwshop_area_china` VALUES ('445285', '4', '其它区', '445200', '');
INSERT INTO `gwshop_area_china` VALUES ('445300', '3', '云浮市', '440000', '527300');
INSERT INTO `gwshop_area_china` VALUES ('445302', '4', '云城区', '445300', '527300');
INSERT INTO `gwshop_area_china` VALUES ('445321', '4', '新兴县', '445300', '527400');
INSERT INTO `gwshop_area_china` VALUES ('445322', '4', '郁南县', '445300', '527100');
INSERT INTO `gwshop_area_china` VALUES ('445323', '4', '云安县', '445300', '527500');
INSERT INTO `gwshop_area_china` VALUES ('445381', '4', '罗定市', '445300', '527200');
INSERT INTO `gwshop_area_china` VALUES ('445382', '4', '其它区', '445300', '');
INSERT INTO `gwshop_area_china` VALUES ('450000', '2', '广西壮族自治区', '1', '');
INSERT INTO `gwshop_area_china` VALUES ('450100', '3', '南宁市', '450000', '530000');
INSERT INTO `gwshop_area_china` VALUES ('450102', '4', '兴宁区', '450100', '530012');
INSERT INTO `gwshop_area_china` VALUES ('450103', '4', '青秀区', '450100', '530022');
INSERT INTO `gwshop_area_china` VALUES ('450105', '4', '江南区', '450100', '530031');
INSERT INTO `gwshop_area_china` VALUES ('450107', '4', '西乡塘区', '450100', '530001');
INSERT INTO `gwshop_area_china` VALUES ('450108', '4', '良庆区', '450100', '530200');
INSERT INTO `gwshop_area_china` VALUES ('450109', '4', '邕宁区', '450100', '530200');
INSERT INTO `gwshop_area_china` VALUES ('450122', '4', '武鸣县', '450100', '530100');
INSERT INTO `gwshop_area_china` VALUES ('450123', '4', '隆安县', '450100', '532700');
INSERT INTO `gwshop_area_china` VALUES ('450124', '4', '马山县', '450100', '530600');
INSERT INTO `gwshop_area_china` VALUES ('450125', '4', '上林县', '450100', '530500');
INSERT INTO `gwshop_area_china` VALUES ('450126', '4', '宾阳县', '450100', '530400');
INSERT INTO `gwshop_area_china` VALUES ('450127', '4', '横县', '450100', '530300');
INSERT INTO `gwshop_area_china` VALUES ('450128', '4', '其它区', '450100', '');
INSERT INTO `gwshop_area_china` VALUES ('450200', '3', '柳州市', '450000', '545000');
INSERT INTO `gwshop_area_china` VALUES ('450202', '4', '城中区', '450200', '545001');
INSERT INTO `gwshop_area_china` VALUES ('450203', '4', '鱼峰区', '450200', '545005');
INSERT INTO `gwshop_area_china` VALUES ('450204', '4', '柳南区', '450200', '545005');
INSERT INTO `gwshop_area_china` VALUES ('450205', '4', '柳北区', '450200', '545001');
INSERT INTO `gwshop_area_china` VALUES ('450221', '4', '柳江县', '450200', '545100');
INSERT INTO `gwshop_area_china` VALUES ('450222', '4', '柳城县', '450200', '545200');
INSERT INTO `gwshop_area_china` VALUES ('450223', '4', '鹿寨县', '450200', '545600');
INSERT INTO `gwshop_area_china` VALUES ('450224', '4', '融安县', '450200', '545400');
INSERT INTO `gwshop_area_china` VALUES ('450225', '4', '融水苗族自治县', '450200', '545300');
INSERT INTO `gwshop_area_china` VALUES ('450226', '4', '三江侗族自治县', '450200', '545500');
INSERT INTO `gwshop_area_china` VALUES ('450227', '4', '其它区', '450200', '');
INSERT INTO `gwshop_area_china` VALUES ('450300', '3', '桂林市', '450000', '541000');
INSERT INTO `gwshop_area_china` VALUES ('450302', '4', '秀峰区', '450300', '541001');
INSERT INTO `gwshop_area_china` VALUES ('450303', '4', '叠彩区', '450300', '541001');
INSERT INTO `gwshop_area_china` VALUES ('450304', '4', '象山区', '450300', '541002');
INSERT INTO `gwshop_area_china` VALUES ('450305', '4', '七星区', '450300', '541004');
INSERT INTO `gwshop_area_china` VALUES ('450311', '4', '雁山区', '450300', '541006');
INSERT INTO `gwshop_area_china` VALUES ('450321', '4', '阳朔县', '450300', '541900');
INSERT INTO `gwshop_area_china` VALUES ('450322', '4', '临桂县', '450300', '541100');
INSERT INTO `gwshop_area_china` VALUES ('450323', '4', '灵川县', '450300', '541200');
INSERT INTO `gwshop_area_china` VALUES ('450324', '4', '全州县', '450300', '541500');
INSERT INTO `gwshop_area_china` VALUES ('450325', '4', '兴安县', '450300', '541300');
INSERT INTO `gwshop_area_china` VALUES ('450326', '4', '永福县', '450300', '541800');
INSERT INTO `gwshop_area_china` VALUES ('450327', '4', '灌阳县', '450300', '541600');
INSERT INTO `gwshop_area_china` VALUES ('450328', '4', '龙胜各族自治县', '450300', '541700');
INSERT INTO `gwshop_area_china` VALUES ('450329', '4', '资源县', '450300', '541400');
INSERT INTO `gwshop_area_china` VALUES ('450330', '4', '平乐县', '450300', '542400');
INSERT INTO `gwshop_area_china` VALUES ('450331', '4', '荔浦县', '450300', '546600');
INSERT INTO `gwshop_area_china` VALUES ('450332', '4', '恭城瑶族自治县', '450300', '542500');
INSERT INTO `gwshop_area_china` VALUES ('450333', '4', '其它区', '450300', '');
INSERT INTO `gwshop_area_china` VALUES ('450400', '3', '梧州市', '450000', '543000');
INSERT INTO `gwshop_area_china` VALUES ('450403', '4', '万秀区', '450400', '543000');
INSERT INTO `gwshop_area_china` VALUES ('450404', '4', '蝶山区', '450400', '543002');
INSERT INTO `gwshop_area_china` VALUES ('450405', '4', '长洲区', '450400', '543002');
INSERT INTO `gwshop_area_china` VALUES ('450421', '4', '苍梧县', '450400', '543100');
INSERT INTO `gwshop_area_china` VALUES ('450422', '4', '藤县', '450400', '543300');
INSERT INTO `gwshop_area_china` VALUES ('450423', '4', '蒙山县', '450400', '546700');
INSERT INTO `gwshop_area_china` VALUES ('450481', '4', '岑溪市', '450400', '543200');
INSERT INTO `gwshop_area_china` VALUES ('450482', '4', '其它区', '450400', '');
INSERT INTO `gwshop_area_china` VALUES ('450500', '3', '北海市', '450000', '536000');
INSERT INTO `gwshop_area_china` VALUES ('450502', '4', '海城区', '450500', '536000');
INSERT INTO `gwshop_area_china` VALUES ('450503', '4', '银海区', '450500', '536000');
INSERT INTO `gwshop_area_china` VALUES ('450512', '4', '铁山港区', '450500', '536017');
INSERT INTO `gwshop_area_china` VALUES ('450521', '4', '合浦县', '450500', '536100');
INSERT INTO `gwshop_area_china` VALUES ('450522', '4', '其它区', '450500', '');
INSERT INTO `gwshop_area_china` VALUES ('450600', '3', '防城港市', '450000', '538000');
INSERT INTO `gwshop_area_china` VALUES ('450602', '4', '港口区', '450600', '538001');
INSERT INTO `gwshop_area_china` VALUES ('450603', '4', '防城区', '450600', '538021');
INSERT INTO `gwshop_area_china` VALUES ('450621', '4', '上思县', '450600', '535500');
INSERT INTO `gwshop_area_china` VALUES ('450681', '4', '东兴市', '450600', '538100');
INSERT INTO `gwshop_area_china` VALUES ('450682', '4', '其它区', '450600', '');
INSERT INTO `gwshop_area_china` VALUES ('450700', '3', '钦州市', '450000', '535000');
INSERT INTO `gwshop_area_china` VALUES ('450702', '4', '钦南区', '450700', '535000');
INSERT INTO `gwshop_area_china` VALUES ('450703', '4', '钦北区', '450700', '535000');
INSERT INTO `gwshop_area_china` VALUES ('450721', '4', '灵山县', '450700', '535400');
INSERT INTO `gwshop_area_china` VALUES ('450722', '4', '浦北县', '450700', '535300');
INSERT INTO `gwshop_area_china` VALUES ('450723', '4', '其它区', '450700', '');
INSERT INTO `gwshop_area_china` VALUES ('450800', '3', '贵港市', '450000', '537100');
INSERT INTO `gwshop_area_china` VALUES ('450802', '4', '港北区', '450800', '537100');
INSERT INTO `gwshop_area_china` VALUES ('450803', '4', '港南区', '450800', '537132');
INSERT INTO `gwshop_area_china` VALUES ('450804', '4', '覃塘区', '450800', '537121');
INSERT INTO `gwshop_area_china` VALUES ('450821', '4', '平南县', '450800', '537300');
INSERT INTO `gwshop_area_china` VALUES ('450881', '4', '桂平市', '450800', '537200');
INSERT INTO `gwshop_area_china` VALUES ('450882', '4', '其它区', '450800', '');
INSERT INTO `gwshop_area_china` VALUES ('450900', '3', '玉林市', '450000', '537000');
INSERT INTO `gwshop_area_china` VALUES ('450902', '4', '玉州区', '450900', '537000');
INSERT INTO `gwshop_area_china` VALUES ('450921', '4', '容县', '450900', '537500');
INSERT INTO `gwshop_area_china` VALUES ('450922', '4', '陆川县', '450900', '537700');
INSERT INTO `gwshop_area_china` VALUES ('450923', '4', '博白县', '450900', '537600');
INSERT INTO `gwshop_area_china` VALUES ('450924', '4', '兴业县', '450900', '537800');
INSERT INTO `gwshop_area_china` VALUES ('450981', '4', '北流市', '450900', '537400');
INSERT INTO `gwshop_area_china` VALUES ('450982', '4', '其它区', '450900', '');
INSERT INTO `gwshop_area_china` VALUES ('451000', '3', '百色市', '450000', '533000');
INSERT INTO `gwshop_area_china` VALUES ('451002', '4', '右江区', '451000', '533000');
INSERT INTO `gwshop_area_china` VALUES ('451021', '4', '田阳县', '451000', '533600');
INSERT INTO `gwshop_area_china` VALUES ('451022', '4', '田东县', '451000', '531500');
INSERT INTO `gwshop_area_china` VALUES ('451023', '4', '平果县', '451000', '531400');
INSERT INTO `gwshop_area_china` VALUES ('451024', '4', '德保县', '451000', '533700');
INSERT INTO `gwshop_area_china` VALUES ('451025', '4', '靖西县', '451000', '533800');
INSERT INTO `gwshop_area_china` VALUES ('451026', '4', '那坡县', '451000', '533900');
INSERT INTO `gwshop_area_china` VALUES ('451027', '4', '凌云县', '451000', '533100');
INSERT INTO `gwshop_area_china` VALUES ('451028', '4', '乐业县', '451000', '533200');
INSERT INTO `gwshop_area_china` VALUES ('451029', '4', '田林县', '451000', '533300');
INSERT INTO `gwshop_area_china` VALUES ('451030', '4', '西林县', '451000', '533500');
INSERT INTO `gwshop_area_china` VALUES ('451031', '4', '隆林各族自治县', '451000', '533400');
INSERT INTO `gwshop_area_china` VALUES ('451032', '4', '其它区', '451000', '');
INSERT INTO `gwshop_area_china` VALUES ('451100', '3', '贺州市', '450000', '542800');
INSERT INTO `gwshop_area_china` VALUES ('451102', '4', '八步区', '451100', '542800');
INSERT INTO `gwshop_area_china` VALUES ('451121', '4', '昭平县', '451100', '546800');
INSERT INTO `gwshop_area_china` VALUES ('451122', '4', '钟山县', '451100', '542600');
INSERT INTO `gwshop_area_china` VALUES ('451123', '4', '富川瑶族自治县', '451100', '542700');
INSERT INTO `gwshop_area_china` VALUES ('451124', '4', '其它区', '451100', '');
INSERT INTO `gwshop_area_china` VALUES ('451200', '3', '河池市', '450000', '547000');
INSERT INTO `gwshop_area_china` VALUES ('451202', '4', '金城江区', '451200', '547000');
INSERT INTO `gwshop_area_china` VALUES ('451221', '4', '南丹县', '451200', '547200');
INSERT INTO `gwshop_area_china` VALUES ('451222', '4', '天峨县', '451200', '547300');
INSERT INTO `gwshop_area_china` VALUES ('451223', '4', '凤山县', '451200', '547600');
INSERT INTO `gwshop_area_china` VALUES ('451224', '4', '东兰县', '451200', '547400');
INSERT INTO `gwshop_area_china` VALUES ('451225', '4', '罗城仫佬族自治县', '451200', '546400');
INSERT INTO `gwshop_area_china` VALUES ('451226', '4', '环江毛南族自治县', '451200', '547100');
INSERT INTO `gwshop_area_china` VALUES ('451227', '4', '巴马瑶族自治县', '451200', '547500');
INSERT INTO `gwshop_area_china` VALUES ('451228', '4', '都安瑶族自治县', '451200', '530700');
INSERT INTO `gwshop_area_china` VALUES ('451229', '4', '大化瑶族自治县', '451200', '530800');
INSERT INTO `gwshop_area_china` VALUES ('451281', '4', '宜州市', '451200', '546300');
INSERT INTO `gwshop_area_china` VALUES ('451282', '4', '其它区', '451200', '');
INSERT INTO `gwshop_area_china` VALUES ('451300', '3', '来宾市', '450000', '546100');
INSERT INTO `gwshop_area_china` VALUES ('451302', '4', '兴宾区', '451300', '546100');
INSERT INTO `gwshop_area_china` VALUES ('451321', '4', '忻城县', '451300', '546200');
INSERT INTO `gwshop_area_china` VALUES ('451322', '4', '象州县', '451300', '545800');
INSERT INTO `gwshop_area_china` VALUES ('451323', '4', '武宣县', '451300', '545900');
INSERT INTO `gwshop_area_china` VALUES ('451324', '4', '金秀瑶族自治县', '451300', '545700');
INSERT INTO `gwshop_area_china` VALUES ('451381', '4', '合山市', '451300', '546500');
INSERT INTO `gwshop_area_china` VALUES ('451382', '4', '其它区', '451300', '');
INSERT INTO `gwshop_area_china` VALUES ('451400', '3', '崇左市', '450000', '532200');
INSERT INTO `gwshop_area_china` VALUES ('451402', '4', '江洲区', '451400', '532200');
INSERT INTO `gwshop_area_china` VALUES ('451421', '4', '扶绥县', '451400', '532100');
INSERT INTO `gwshop_area_china` VALUES ('451422', '4', '宁明县', '451400', '532500');
INSERT INTO `gwshop_area_china` VALUES ('451423', '4', '龙州县', '451400', '532400');
INSERT INTO `gwshop_area_china` VALUES ('451424', '4', '大新县', '451400', '532300');
INSERT INTO `gwshop_area_china` VALUES ('451425', '4', '天等县', '451400', '532800');
INSERT INTO `gwshop_area_china` VALUES ('451481', '4', '凭祥市', '451400', '532600');
INSERT INTO `gwshop_area_china` VALUES ('451482', '4', '其它区', '451400', '');
INSERT INTO `gwshop_area_china` VALUES ('460000', '2', '海南省', '1', '');
INSERT INTO `gwshop_area_china` VALUES ('460100', '3', '海口市', '460000', '570000');
INSERT INTO `gwshop_area_china` VALUES ('460105', '4', '秀英区', '460100', '570311');
INSERT INTO `gwshop_area_china` VALUES ('460106', '4', '龙华区', '460100', '570105');
INSERT INTO `gwshop_area_china` VALUES ('460107', '4', '琼山区', '460100', '571100');
INSERT INTO `gwshop_area_china` VALUES ('460108', '4', '美兰区', '460100', '570203');
INSERT INTO `gwshop_area_china` VALUES ('460109', '4', '其它区', '460100', '');
INSERT INTO `gwshop_area_china` VALUES ('460200', '3', '三亚市', '460000', '572000');
INSERT INTO `gwshop_area_china` VALUES ('469001', '4', '五指山市', '460000', '572200');
INSERT INTO `gwshop_area_china` VALUES ('469002', '4', '琼海市', '460000', '571400');
INSERT INTO `gwshop_area_china` VALUES ('469003', '4', '儋州市', '460000', '571700');
INSERT INTO `gwshop_area_china` VALUES ('469005', '4', '文昌市', '460000', '571300');
INSERT INTO `gwshop_area_china` VALUES ('469006', '4', '万宁市', '460000', '571500');
INSERT INTO `gwshop_area_china` VALUES ('469007', '4', '东方市', '460000', '572600');
INSERT INTO `gwshop_area_china` VALUES ('469025', '4', '定安县', '460000', '571200');
INSERT INTO `gwshop_area_china` VALUES ('469026', '4', '屯昌县', '460000', '571600');
INSERT INTO `gwshop_area_china` VALUES ('469027', '4', '澄迈县', '460000', '571900');
INSERT INTO `gwshop_area_china` VALUES ('469028', '4', '临高县', '460000', '571800');
INSERT INTO `gwshop_area_china` VALUES ('469030', '4', '白沙黎族自治县', '460000', '572800');
INSERT INTO `gwshop_area_china` VALUES ('469031', '4', '昌江黎族自治县', '460000', '572700');
INSERT INTO `gwshop_area_china` VALUES ('469033', '4', '乐东黎族自治县', '460000', '572500');
INSERT INTO `gwshop_area_china` VALUES ('469034', '4', '陵水黎族自治县', '460000', '572400');
INSERT INTO `gwshop_area_china` VALUES ('469035', '4', '保亭黎族苗族自治县', '460000', '572300');
INSERT INTO `gwshop_area_china` VALUES ('469036', '4', '琼中黎族苗族自治县', '460000', '572900');
INSERT INTO `gwshop_area_china` VALUES ('469037', '4', '西沙群岛', '460000', '573100');
INSERT INTO `gwshop_area_china` VALUES ('469038', '4', '南沙群岛', '460000', '573100');
INSERT INTO `gwshop_area_china` VALUES ('469039', '4', '中沙群岛的岛礁及其海域', '460000', '573100');
INSERT INTO `gwshop_area_china` VALUES ('471004', '4', '高新区', '410300', '');
INSERT INTO `gwshop_area_china` VALUES ('471005', '4', '其它区', '410300', '');
INSERT INTO `gwshop_area_china` VALUES ('500000', '2', '重庆', '1', '');
INSERT INTO `gwshop_area_china` VALUES ('500100', '3', '重庆市', '500000', '400000');
INSERT INTO `gwshop_area_china` VALUES ('500101', '4', '万州区', '500100', '404000');
INSERT INTO `gwshop_area_china` VALUES ('500102', '4', '涪陵区', '500100', '408000');
INSERT INTO `gwshop_area_china` VALUES ('500103', '4', '渝中区', '500100', '400012');
INSERT INTO `gwshop_area_china` VALUES ('500104', '4', '大渡口区', '500100', '400084');
INSERT INTO `gwshop_area_china` VALUES ('500105', '4', '江北区', '500100', '400021');
INSERT INTO `gwshop_area_china` VALUES ('500106', '4', '沙坪坝区', '500100', '400020');
INSERT INTO `gwshop_area_china` VALUES ('500107', '4', '九龙坡区', '500100', '400039');
INSERT INTO `gwshop_area_china` VALUES ('500108', '4', '南岸区', '500100', '400060');
INSERT INTO `gwshop_area_china` VALUES ('500109', '4', '北碚区', '500100', '400700');
INSERT INTO `gwshop_area_china` VALUES ('500110', '4', '万盛区', '500100', '400800');
INSERT INTO `gwshop_area_china` VALUES ('500111', '4', '双桥区', '500100', '400900');
INSERT INTO `gwshop_area_china` VALUES ('500112', '4', '渝北区', '500100', '401120');
INSERT INTO `gwshop_area_china` VALUES ('500113', '4', '巴南区', '500100', '401320');
INSERT INTO `gwshop_area_china` VALUES ('500114', '4', '黔江区', '500100', '409700');
INSERT INTO `gwshop_area_china` VALUES ('500115', '4', '长寿区', '500100', '401220');
INSERT INTO `gwshop_area_china` VALUES ('500222', '4', '綦江县', '500100', '401420');
INSERT INTO `gwshop_area_china` VALUES ('500223', '4', '潼南县', '500100', '402660');
INSERT INTO `gwshop_area_china` VALUES ('500224', '4', '铜梁县', '500100', '402560');
INSERT INTO `gwshop_area_china` VALUES ('500225', '4', '大足县', '500100', '402360');
INSERT INTO `gwshop_area_china` VALUES ('500226', '4', '荣昌县', '500100', '402460');
INSERT INTO `gwshop_area_china` VALUES ('500227', '4', '璧山县', '500100', '402760');
INSERT INTO `gwshop_area_china` VALUES ('500228', '4', '梁平县', '500100', '405200');
INSERT INTO `gwshop_area_china` VALUES ('500229', '4', '城口县', '500100', '405900');
INSERT INTO `gwshop_area_china` VALUES ('500230', '4', '丰都县', '500100', '408200');
INSERT INTO `gwshop_area_china` VALUES ('500231', '4', '垫江县', '500100', '408300');
INSERT INTO `gwshop_area_china` VALUES ('500232', '4', '武隆县', '500100', '408500');
INSERT INTO `gwshop_area_china` VALUES ('500233', '4', '忠县', '500100', '404300');
INSERT INTO `gwshop_area_china` VALUES ('500234', '4', '开县', '500100', '405400');
INSERT INTO `gwshop_area_china` VALUES ('500235', '4', '云阳县', '500100', '404500');
INSERT INTO `gwshop_area_china` VALUES ('500236', '4', '奉节县', '500100', '404600');
INSERT INTO `gwshop_area_china` VALUES ('500237', '4', '巫山县', '500100', '404700');
INSERT INTO `gwshop_area_china` VALUES ('500238', '4', '巫溪县', '500100', '405800');
INSERT INTO `gwshop_area_china` VALUES ('500240', '4', '石柱土家族自治县', '500100', '409100');
INSERT INTO `gwshop_area_china` VALUES ('500241', '4', '秀山土家族苗族自治县', '500100', '409900');
INSERT INTO `gwshop_area_china` VALUES ('500242', '4', '酉阳土家族苗族自治县', '500100', '409800');
INSERT INTO `gwshop_area_china` VALUES ('500243', '4', '彭水苗族土家族自治县', '500100', '409600');
INSERT INTO `gwshop_area_china` VALUES ('500381', '4', '江津区', '500100', '402260');
INSERT INTO `gwshop_area_china` VALUES ('500382', '4', '合川区', '500100', '401520');
INSERT INTO `gwshop_area_china` VALUES ('500383', '4', '永川区', '500100', '402160');
INSERT INTO `gwshop_area_china` VALUES ('500384', '4', '南川区', '500100', '408400');
INSERT INTO `gwshop_area_china` VALUES ('500385', '4', '其它区', '500100', '');
INSERT INTO `gwshop_area_china` VALUES ('510000', '2', '四川省', '1', '');
INSERT INTO `gwshop_area_china` VALUES ('510100', '3', '成都市', '510000', '610000');
INSERT INTO `gwshop_area_china` VALUES ('510104', '4', '锦江区', '510100', '610011');
INSERT INTO `gwshop_area_china` VALUES ('510105', '4', '青羊区', '510100', '610031');
INSERT INTO `gwshop_area_china` VALUES ('510106', '4', '金牛区', '510100', '610036');
INSERT INTO `gwshop_area_china` VALUES ('510107', '4', '武侯区', '510100', '610041');
INSERT INTO `gwshop_area_china` VALUES ('510108', '4', '成华区', '510100', '610066');
INSERT INTO `gwshop_area_china` VALUES ('510112', '4', '龙泉驿区', '510100', '610100');
INSERT INTO `gwshop_area_china` VALUES ('510113', '4', '青白江区', '510100', '610300');
INSERT INTO `gwshop_area_china` VALUES ('510114', '4', '新都区', '510100', '610500');
INSERT INTO `gwshop_area_china` VALUES ('510115', '4', '温江区', '510100', '611130');
INSERT INTO `gwshop_area_china` VALUES ('510121', '4', '金堂县', '510100', '610400');
INSERT INTO `gwshop_area_china` VALUES ('510122', '4', '双流县', '510100', '610200');
INSERT INTO `gwshop_area_china` VALUES ('510124', '4', '郫县', '510100', '611730');
INSERT INTO `gwshop_area_china` VALUES ('510129', '4', '大邑县', '510100', '611330');
INSERT INTO `gwshop_area_china` VALUES ('510131', '4', '蒲江县', '510100', '611630');
INSERT INTO `gwshop_area_china` VALUES ('510132', '4', '新津县', '510100', '611430');
INSERT INTO `gwshop_area_china` VALUES ('510181', '4', '都江堰市', '510100', '611830');
INSERT INTO `gwshop_area_china` VALUES ('510182', '4', '彭州市', '510100', '611930');
INSERT INTO `gwshop_area_china` VALUES ('510183', '4', '邛崃市', '510100', '611530');
INSERT INTO `gwshop_area_china` VALUES ('510184', '4', '崇州市', '510100', '611230');
INSERT INTO `gwshop_area_china` VALUES ('510185', '4', '其它区', '510100', '');
INSERT INTO `gwshop_area_china` VALUES ('510300', '3', '自贡市', '510000', '643000');
INSERT INTO `gwshop_area_china` VALUES ('510302', '4', '自流井区', '510300', '643000');
INSERT INTO `gwshop_area_china` VALUES ('510303', '4', '贡井区', '510300', '643020');
INSERT INTO `gwshop_area_china` VALUES ('510304', '4', '大安区', '510300', '643010');
INSERT INTO `gwshop_area_china` VALUES ('510311', '4', '沿滩区', '510300', '643030');
INSERT INTO `gwshop_area_china` VALUES ('510321', '4', '荣县', '510300', '643100');
INSERT INTO `gwshop_area_china` VALUES ('510322', '4', '富顺县', '510300', '643200');
INSERT INTO `gwshop_area_china` VALUES ('510323', '4', '其它区', '510300', '');
INSERT INTO `gwshop_area_china` VALUES ('510400', '3', '攀枝花市', '510000', '617000');
INSERT INTO `gwshop_area_china` VALUES ('510402', '4', '东区', '510400', '617067');
INSERT INTO `gwshop_area_china` VALUES ('510403', '4', '西区', '510400', '617012');
INSERT INTO `gwshop_area_china` VALUES ('510411', '4', '仁和区', '510400', '617061');
INSERT INTO `gwshop_area_china` VALUES ('510421', '4', '米易县', '510400', '617200');
INSERT INTO `gwshop_area_china` VALUES ('510422', '4', '盐边县', '510400', '617100');
INSERT INTO `gwshop_area_china` VALUES ('510423', '4', '其它区', '510400', '');
INSERT INTO `gwshop_area_china` VALUES ('510500', '3', '泸州市', '510000', '646000');
INSERT INTO `gwshop_area_china` VALUES ('510502', '4', '江阳区', '510500', '646000');
INSERT INTO `gwshop_area_china` VALUES ('510503', '4', '纳溪区', '510500', '646300');
INSERT INTO `gwshop_area_china` VALUES ('510504', '4', '龙马潭区', '510500', '646000');
INSERT INTO `gwshop_area_china` VALUES ('510521', '4', '泸县', '510500', '646100');
INSERT INTO `gwshop_area_china` VALUES ('510522', '4', '合江县', '510500', '646200');
INSERT INTO `gwshop_area_china` VALUES ('510524', '4', '叙永县', '510500', '646400');
INSERT INTO `gwshop_area_china` VALUES ('510525', '4', '古蔺县', '510500', '646500');
INSERT INTO `gwshop_area_china` VALUES ('510526', '4', '其它区', '510500', '');
INSERT INTO `gwshop_area_china` VALUES ('510600', '3', '德阳市', '510000', '618000');
INSERT INTO `gwshop_area_china` VALUES ('510603', '4', '旌阳区', '510600', '618000');
INSERT INTO `gwshop_area_china` VALUES ('510623', '4', '中江县', '510600', '618300');
INSERT INTO `gwshop_area_china` VALUES ('510626', '4', '罗江县', '510600', '618500');
INSERT INTO `gwshop_area_china` VALUES ('510681', '4', '广汉市', '510600', '618300');
INSERT INTO `gwshop_area_china` VALUES ('510682', '4', '什邡市', '510600', '618400');
INSERT INTO `gwshop_area_china` VALUES ('510683', '4', '绵竹市', '510600', '618200');
INSERT INTO `gwshop_area_china` VALUES ('510684', '4', '其它区', '510600', '');
INSERT INTO `gwshop_area_china` VALUES ('510700', '3', '绵阳市', '510000', '621000');
INSERT INTO `gwshop_area_china` VALUES ('510703', '4', '涪城区', '510700', '621000');
INSERT INTO `gwshop_area_china` VALUES ('510704', '4', '游仙区', '510700', '621022');
INSERT INTO `gwshop_area_china` VALUES ('510722', '4', '三台县', '510700', '621100');
INSERT INTO `gwshop_area_china` VALUES ('510723', '4', '盐亭县', '510700', '621600');
INSERT INTO `gwshop_area_china` VALUES ('510724', '4', '安县', '510700', '622650');
INSERT INTO `gwshop_area_china` VALUES ('510725', '4', '梓潼县', '510700', '622150');
INSERT INTO `gwshop_area_china` VALUES ('510726', '4', '北川羌族自治县', '510700', '622750');
INSERT INTO `gwshop_area_china` VALUES ('510727', '4', '平武县', '510700', '621550');
INSERT INTO `gwshop_area_china` VALUES ('510751', '4', '高新区', '510700', '');
INSERT INTO `gwshop_area_china` VALUES ('510781', '4', '江油市', '510700', '621700');
INSERT INTO `gwshop_area_china` VALUES ('510782', '4', '其它区', '510700', '');
INSERT INTO `gwshop_area_china` VALUES ('510800', '3', '广元市', '510000', '628000');
INSERT INTO `gwshop_area_china` VALUES ('510802', '4', '利州区', '510800', '628017');
INSERT INTO `gwshop_area_china` VALUES ('510811', '4', '元坝区', '510800', '628021');
INSERT INTO `gwshop_area_china` VALUES ('510812', '4', '朝天区', '510800', '628012');
INSERT INTO `gwshop_area_china` VALUES ('510821', '4', '旺苍县', '510800', '628200');
INSERT INTO `gwshop_area_china` VALUES ('510822', '4', '青川县', '510800', '628100');
INSERT INTO `gwshop_area_china` VALUES ('510823', '4', '剑阁县', '510800', '628300');
INSERT INTO `gwshop_area_china` VALUES ('510824', '4', '苍溪县', '510800', '628400');
INSERT INTO `gwshop_area_china` VALUES ('510825', '4', '其它区', '510800', '');
INSERT INTO `gwshop_area_china` VALUES ('510900', '3', '遂宁市', '510000', '629000');
INSERT INTO `gwshop_area_china` VALUES ('510903', '4', '船山区', '510900', '629000');
INSERT INTO `gwshop_area_china` VALUES ('510904', '4', '安居区', '510900', '629000');
INSERT INTO `gwshop_area_china` VALUES ('510921', '4', '蓬溪县', '510900', '629100');
INSERT INTO `gwshop_area_china` VALUES ('510922', '4', '射洪县', '510900', '629200');
INSERT INTO `gwshop_area_china` VALUES ('510923', '4', '大英县', '510900', '629300');
INSERT INTO `gwshop_area_china` VALUES ('510924', '4', '其它区', '510900', '');
INSERT INTO `gwshop_area_china` VALUES ('511000', '3', '内江市', '510000', '641000');
INSERT INTO `gwshop_area_china` VALUES ('511002', '4', '市中区', '511000', '641000');
INSERT INTO `gwshop_area_china` VALUES ('511011', '4', '东兴区', '511000', '641100');
INSERT INTO `gwshop_area_china` VALUES ('511024', '4', '威远县', '511000', '642450');
INSERT INTO `gwshop_area_china` VALUES ('511025', '4', '资中县', '511000', '641200');
INSERT INTO `gwshop_area_china` VALUES ('511028', '4', '隆昌县', '511000', '642150');
INSERT INTO `gwshop_area_china` VALUES ('511029', '4', '其它区', '511000', '');
INSERT INTO `gwshop_area_china` VALUES ('511100', '3', '乐山市', '510000', '614000');
INSERT INTO `gwshop_area_china` VALUES ('511102', '4', '市中区', '511100', '614000');
INSERT INTO `gwshop_area_china` VALUES ('511111', '4', '沙湾区', '511100', '614900');
INSERT INTO `gwshop_area_china` VALUES ('511112', '4', '五通桥区', '511100', '614800');
INSERT INTO `gwshop_area_china` VALUES ('511113', '4', '金口河区', '511100', '614700');
INSERT INTO `gwshop_area_china` VALUES ('511123', '4', '犍为县', '511100', '614400');
INSERT INTO `gwshop_area_china` VALUES ('511124', '4', '井研县', '511100', '613100');
INSERT INTO `gwshop_area_china` VALUES ('511126', '4', '夹江县', '511100', '614100');
INSERT INTO `gwshop_area_china` VALUES ('511129', '4', '沐川县', '511100', '614500');
INSERT INTO `gwshop_area_china` VALUES ('511132', '4', '峨边彝族自治县', '511100', '614300');
INSERT INTO `gwshop_area_china` VALUES ('511133', '4', '马边彝族自治县', '511100', '614600');
INSERT INTO `gwshop_area_china` VALUES ('511181', '4', '峨眉山市', '511100', '614200');
INSERT INTO `gwshop_area_china` VALUES ('511182', '4', '其它区', '511100', '');
INSERT INTO `gwshop_area_china` VALUES ('511300', '3', '南充市', '510000', '637000');
INSERT INTO `gwshop_area_china` VALUES ('511302', '4', '顺庆区', '511300', '637500');
INSERT INTO `gwshop_area_china` VALUES ('511303', '4', '高坪区', '511300', '637100');
INSERT INTO `gwshop_area_china` VALUES ('511304', '4', '嘉陵区', '511300', '637900');
INSERT INTO `gwshop_area_china` VALUES ('511321', '4', '南部县', '511300', '637300');
INSERT INTO `gwshop_area_china` VALUES ('511322', '4', '营山县', '511300', '638150');
INSERT INTO `gwshop_area_china` VALUES ('511323', '4', '蓬安县', '511300', '638250');
INSERT INTO `gwshop_area_china` VALUES ('511324', '4', '仪陇县', '511300', '637600');
INSERT INTO `gwshop_area_china` VALUES ('511325', '4', '西充县', '511300', '637200');
INSERT INTO `gwshop_area_china` VALUES ('511381', '4', '阆中市', '511300', '637400');
INSERT INTO `gwshop_area_china` VALUES ('511382', '4', '其它区', '511300', '');
INSERT INTO `gwshop_area_china` VALUES ('511400', '3', '眉山市', '510000', '620000');
INSERT INTO `gwshop_area_china` VALUES ('511402', '4', '东坡区', '511400', '620010');
INSERT INTO `gwshop_area_china` VALUES ('511421', '4', '仁寿县', '511400', '620500');
INSERT INTO `gwshop_area_china` VALUES ('511422', '4', '彭山县', '511400', '620860');
INSERT INTO `gwshop_area_china` VALUES ('511423', '4', '洪雅县', '511400', '620360');
INSERT INTO `gwshop_area_china` VALUES ('511424', '4', '丹棱县', '511400', '620200');
INSERT INTO `gwshop_area_china` VALUES ('511425', '4', '青神县', '511400', '620460');
INSERT INTO `gwshop_area_china` VALUES ('511426', '4', '其它区', '511400', '');
INSERT INTO `gwshop_area_china` VALUES ('511500', '3', '宜宾市', '510000', '644000');
INSERT INTO `gwshop_area_china` VALUES ('511502', '4', '翠屏区', '511500', '644000');
INSERT INTO `gwshop_area_china` VALUES ('511521', '4', '宜宾县', '511500', '644600');
INSERT INTO `gwshop_area_china` VALUES ('511522', '4', '南溪县', '511500', '644100');
INSERT INTO `gwshop_area_china` VALUES ('511523', '4', '江安县', '511500', '644200');
INSERT INTO `gwshop_area_china` VALUES ('511524', '4', '长宁县', '511500', '644300');
INSERT INTO `gwshop_area_china` VALUES ('511525', '4', '高县', '511500', '645150');
INSERT INTO `gwshop_area_china` VALUES ('511526', '4', '珙县', '511500', '644500');
INSERT INTO `gwshop_area_china` VALUES ('511527', '4', '筠连县', '511500', '645250');
INSERT INTO `gwshop_area_china` VALUES ('511528', '4', '兴文县', '511500', '644400');
INSERT INTO `gwshop_area_china` VALUES ('511529', '4', '屏山县', '511500', '645350');
INSERT INTO `gwshop_area_china` VALUES ('511530', '4', '其它区', '511500', '');
INSERT INTO `gwshop_area_china` VALUES ('511600', '3', '广安市', '510000', '638000');
INSERT INTO `gwshop_area_china` VALUES ('511602', '4', '广安区', '511600', '638550');
INSERT INTO `gwshop_area_china` VALUES ('511621', '4', '岳池县', '511600', '638300');
INSERT INTO `gwshop_area_china` VALUES ('511622', '4', '武胜县', '511600', '638420');
INSERT INTO `gwshop_area_china` VALUES ('511623', '4', '邻水县', '511600', '638520');
INSERT INTO `gwshop_area_china` VALUES ('511681', '4', '华蓥市', '511600', '638650');
INSERT INTO `gwshop_area_china` VALUES ('511682', '4', '市辖区', '511600', '');
INSERT INTO `gwshop_area_china` VALUES ('511683', '4', '其它区', '511600', '');
INSERT INTO `gwshop_area_china` VALUES ('511700', '3', '达州市', '510000', '635000');
INSERT INTO `gwshop_area_china` VALUES ('511702', '4', '通川区', '511700', '635000');
INSERT INTO `gwshop_area_china` VALUES ('511721', '4', '达县', '511700', '635006');
INSERT INTO `gwshop_area_china` VALUES ('511722', '4', '宣汉县', '511700', '636150');
INSERT INTO `gwshop_area_china` VALUES ('511723', '4', '开江县', '511700', '636250');
INSERT INTO `gwshop_area_china` VALUES ('511724', '4', '大竹县', '511700', '635100');
INSERT INTO `gwshop_area_china` VALUES ('511725', '4', '渠县', '511700', '635200');
INSERT INTO `gwshop_area_china` VALUES ('511781', '4', '万源市', '511700', '636350');
INSERT INTO `gwshop_area_china` VALUES ('511782', '4', '其它区', '511700', '');
INSERT INTO `gwshop_area_china` VALUES ('511800', '3', '雅安市', '510000', '625000');
INSERT INTO `gwshop_area_china` VALUES ('511802', '4', '雨城区', '511800', '625000');
INSERT INTO `gwshop_area_china` VALUES ('511821', '4', '名山县', '511800', '625100');
INSERT INTO `gwshop_area_china` VALUES ('511822', '4', '荥经县', '511800', '625200');
INSERT INTO `gwshop_area_china` VALUES ('511823', '4', '汉源县', '511800', '625300');
INSERT INTO `gwshop_area_china` VALUES ('511824', '4', '石棉县', '511800', '625400');
INSERT INTO `gwshop_area_china` VALUES ('511825', '4', '天全县', '511800', '625500');
INSERT INTO `gwshop_area_china` VALUES ('511826', '4', '芦山县', '511800', '625600');
INSERT INTO `gwshop_area_china` VALUES ('511827', '4', '宝兴县', '511800', '625700');
INSERT INTO `gwshop_area_china` VALUES ('511828', '4', '其它区', '511800', '');
INSERT INTO `gwshop_area_china` VALUES ('511900', '3', '巴中市', '510000', '636000');
INSERT INTO `gwshop_area_china` VALUES ('511902', '4', '巴州区', '511900', '636601');
INSERT INTO `gwshop_area_china` VALUES ('511921', '4', '通江县', '511900', '636700');
INSERT INTO `gwshop_area_china` VALUES ('511922', '4', '南江县', '511900', '636600');
INSERT INTO `gwshop_area_china` VALUES ('511923', '4', '平昌县', '511900', '636400');
INSERT INTO `gwshop_area_china` VALUES ('511924', '4', '其它区', '511900', '');
INSERT INTO `gwshop_area_china` VALUES ('512000', '3', '资阳市', '510000', '641300');
INSERT INTO `gwshop_area_china` VALUES ('512002', '4', '雁江区', '512000', '641300');
INSERT INTO `gwshop_area_china` VALUES ('512021', '4', '安岳县', '512000', '642350');
INSERT INTO `gwshop_area_china` VALUES ('512022', '4', '乐至县', '512000', '641500');
INSERT INTO `gwshop_area_china` VALUES ('512081', '4', '简阳市', '512000', '641400');
INSERT INTO `gwshop_area_china` VALUES ('512082', '4', '其它区', '512000', '');
INSERT INTO `gwshop_area_china` VALUES ('513200', '3', '阿坝藏族羌族自治州', '510000', '');
INSERT INTO `gwshop_area_china` VALUES ('513221', '4', '汶川县', '513200', '623000');
INSERT INTO `gwshop_area_china` VALUES ('513222', '4', '理县', '513200', '632100');
INSERT INTO `gwshop_area_china` VALUES ('513223', '4', '茂县', '513200', '623200');
INSERT INTO `gwshop_area_china` VALUES ('513224', '4', '松潘县', '513200', '623300');
INSERT INTO `gwshop_area_china` VALUES ('513225', '4', '九寨沟县', '513200', '623400');
INSERT INTO `gwshop_area_china` VALUES ('513226', '4', '金川县', '513200', '624100');
INSERT INTO `gwshop_area_china` VALUES ('513227', '4', '小金县', '513200', '624200');
INSERT INTO `gwshop_area_china` VALUES ('513228', '4', '黑水县', '513200', '623500');
INSERT INTO `gwshop_area_china` VALUES ('513229', '4', '马尔康县', '513200', '624000');
INSERT INTO `gwshop_area_china` VALUES ('513230', '4', '壤塘县', '513200', '624300');
INSERT INTO `gwshop_area_china` VALUES ('513231', '4', '阿坝县', '513200', '624600');
INSERT INTO `gwshop_area_china` VALUES ('513232', '4', '若尔盖县', '513200', '624500');
INSERT INTO `gwshop_area_china` VALUES ('513233', '4', '红原县', '513200', '624400');
INSERT INTO `gwshop_area_china` VALUES ('513234', '4', '其它区', '513200', '');
INSERT INTO `gwshop_area_china` VALUES ('513300', '3', '甘孜藏族自治州', '510000', '');
INSERT INTO `gwshop_area_china` VALUES ('513321', '4', '康定县', '513300', '626000');
INSERT INTO `gwshop_area_china` VALUES ('513322', '4', '泸定县', '513300', '626100');
INSERT INTO `gwshop_area_china` VALUES ('513323', '4', '丹巴县', '513300', '626300');
INSERT INTO `gwshop_area_china` VALUES ('513324', '4', '九龙县', '513300', '626200');
INSERT INTO `gwshop_area_china` VALUES ('513325', '4', '雅江县', '513300', '627450');
INSERT INTO `gwshop_area_china` VALUES ('513326', '4', '道孚县', '513300', '626400');
INSERT INTO `gwshop_area_china` VALUES ('513327', '4', '炉霍县', '513300', '626500');
INSERT INTO `gwshop_area_china` VALUES ('513328', '4', '甘孜县', '513300', '626700');
INSERT INTO `gwshop_area_china` VALUES ('513329', '4', '新龙县', '513300', '626800');
INSERT INTO `gwshop_area_china` VALUES ('513330', '4', '德格县', '513300', '627250');
INSERT INTO `gwshop_area_china` VALUES ('513331', '4', '白玉县', '513300', '627150');
INSERT INTO `gwshop_area_china` VALUES ('513332', '4', '石渠县', '513300', '627350');
INSERT INTO `gwshop_area_china` VALUES ('513333', '4', '色达县', '513300', '626600');
INSERT INTO `gwshop_area_china` VALUES ('513334', '4', '理塘县', '513300', '627550');
INSERT INTO `gwshop_area_china` VALUES ('513335', '4', '巴塘县', '513300', '627650');
INSERT INTO `gwshop_area_china` VALUES ('513336', '4', '乡城县', '513300', '627850');
INSERT INTO `gwshop_area_china` VALUES ('513337', '4', '稻城县', '513300', '627750');
INSERT INTO `gwshop_area_china` VALUES ('513338', '4', '得荣县', '513300', '627950');
INSERT INTO `gwshop_area_china` VALUES ('513339', '4', '其它区', '513300', '');
INSERT INTO `gwshop_area_china` VALUES ('513400', '3', '凉山彝族自治州', '510000', '');
INSERT INTO `gwshop_area_china` VALUES ('513401', '4', '西昌市', '513400', '615000');
INSERT INTO `gwshop_area_china` VALUES ('513422', '4', '木里藏族自治县', '513400', '615800');
INSERT INTO `gwshop_area_china` VALUES ('513423', '4', '盐源县', '513400', '615700');
INSERT INTO `gwshop_area_china` VALUES ('513424', '4', '德昌县', '513400', '615500');
INSERT INTO `gwshop_area_china` VALUES ('513425', '4', '会理县', '513400', '615100');
INSERT INTO `gwshop_area_china` VALUES ('513426', '4', '会东县', '513400', '615200');
INSERT INTO `gwshop_area_china` VALUES ('513427', '4', '宁南县', '513400', '615400');
INSERT INTO `gwshop_area_china` VALUES ('513428', '4', '普格县', '513400', '615300');
INSERT INTO `gwshop_area_china` VALUES ('513429', '4', '布拖县', '513400', '616350');
INSERT INTO `gwshop_area_china` VALUES ('513430', '4', '金阳县', '513400', '616250');
INSERT INTO `gwshop_area_china` VALUES ('513431', '4', '昭觉县', '513400', '616150');
INSERT INTO `gwshop_area_china` VALUES ('513432', '4', '喜德县', '513400', '616750');
INSERT INTO `gwshop_area_china` VALUES ('513433', '4', '冕宁县', '513400', '615600');
INSERT INTO `gwshop_area_china` VALUES ('513434', '4', '越西县', '513400', '616650');
INSERT INTO `gwshop_area_china` VALUES ('513435', '4', '甘洛县', '513400', '616850');
INSERT INTO `gwshop_area_china` VALUES ('513436', '4', '美姑县', '513400', '616450');
INSERT INTO `gwshop_area_china` VALUES ('513437', '4', '雷波县', '513400', '616550');
INSERT INTO `gwshop_area_china` VALUES ('513438', '4', '其它区', '513400', '');
INSERT INTO `gwshop_area_china` VALUES ('520000', '2', '贵州省', '1', '');
INSERT INTO `gwshop_area_china` VALUES ('520100', '3', '贵阳市', '520000', '550000');
INSERT INTO `gwshop_area_china` VALUES ('520102', '4', '南明区', '520100', '550002');
INSERT INTO `gwshop_area_china` VALUES ('520103', '4', '云岩区', '520100', '550001');
INSERT INTO `gwshop_area_china` VALUES ('520111', '4', '花溪区', '520100', '550025');
INSERT INTO `gwshop_area_china` VALUES ('520112', '4', '乌当区', '520100', '550018');
INSERT INTO `gwshop_area_china` VALUES ('520113', '4', '白云区', '520100', '550014');
INSERT INTO `gwshop_area_china` VALUES ('520114', '4', '小河区', '520100', '550009');
INSERT INTO `gwshop_area_china` VALUES ('520121', '4', '开阳县', '520100', '550300');
INSERT INTO `gwshop_area_china` VALUES ('520122', '4', '息烽县', '520100', '551100');
INSERT INTO `gwshop_area_china` VALUES ('520123', '4', '修文县', '520100', '550200');
INSERT INTO `gwshop_area_china` VALUES ('520151', '4', '金阳开发区', '520100', '');
INSERT INTO `gwshop_area_china` VALUES ('520181', '4', '清镇市', '520100', '551400');
INSERT INTO `gwshop_area_china` VALUES ('520182', '4', '其它区', '520100', '');
INSERT INTO `gwshop_area_china` VALUES ('520200', '3', '六盘水市', '520000', '553000');
INSERT INTO `gwshop_area_china` VALUES ('520201', '4', '钟山区', '520200', '553000');
INSERT INTO `gwshop_area_china` VALUES ('520203', '4', '六枝特区', '520200', '553400');
INSERT INTO `gwshop_area_china` VALUES ('520221', '4', '水城县', '520200', '553600');
INSERT INTO `gwshop_area_china` VALUES ('520222', '4', '盘县', '520200', '561601');
INSERT INTO `gwshop_area_china` VALUES ('520223', '4', '其它区', '520200', '');
INSERT INTO `gwshop_area_china` VALUES ('520300', '3', '遵义市', '520000', '563000');
INSERT INTO `gwshop_area_china` VALUES ('520302', '4', '红花岗区', '520300', '563000');
INSERT INTO `gwshop_area_china` VALUES ('520303', '4', '汇川区', '520300', '563000');
INSERT INTO `gwshop_area_china` VALUES ('520321', '4', '遵义县', '520300', '563100');
INSERT INTO `gwshop_area_china` VALUES ('520322', '4', '桐梓县', '520300', '563200');
INSERT INTO `gwshop_area_china` VALUES ('520323', '4', '绥阳县', '520300', '563300');
INSERT INTO `gwshop_area_china` VALUES ('520324', '4', '正安县', '520300', '563400');
INSERT INTO `gwshop_area_china` VALUES ('520325', '4', '道真仡佬族苗族自治县', '520300', '563500');
INSERT INTO `gwshop_area_china` VALUES ('520326', '4', '务川仡佬族苗族自治县', '520300', '564300');
INSERT INTO `gwshop_area_china` VALUES ('520327', '4', '凤冈县', '520300', '564200');
INSERT INTO `gwshop_area_china` VALUES ('520328', '4', '湄潭县', '520300', '564100');
INSERT INTO `gwshop_area_china` VALUES ('520329', '4', '余庆县', '520300', '564400');
INSERT INTO `gwshop_area_china` VALUES ('520330', '4', '习水县', '520300', '564600');
INSERT INTO `gwshop_area_china` VALUES ('520381', '4', '赤水市', '520300', '564700');
INSERT INTO `gwshop_area_china` VALUES ('520382', '4', '仁怀市', '520300', '564500');
INSERT INTO `gwshop_area_china` VALUES ('520383', '4', '其它区', '520300', '');
INSERT INTO `gwshop_area_china` VALUES ('520400', '3', '安顺市', '520000', '561000');
INSERT INTO `gwshop_area_china` VALUES ('520402', '4', '西秀区', '520400', '561000');
INSERT INTO `gwshop_area_china` VALUES ('520421', '4', '平坝县', '520400', '561100');
INSERT INTO `gwshop_area_china` VALUES ('520422', '4', '普定县', '520400', '562100');
INSERT INTO `gwshop_area_china` VALUES ('520423', '4', '镇宁布依族苗族自治县', '520400', '561200');
INSERT INTO `gwshop_area_china` VALUES ('520424', '4', '关岭布依族苗族自治县', '520400', '561300');
INSERT INTO `gwshop_area_china` VALUES ('520425', '4', '紫云苗族布依族自治县', '520400', '550800');
INSERT INTO `gwshop_area_china` VALUES ('520426', '4', '其它区', '520400', '');
INSERT INTO `gwshop_area_china` VALUES ('522200', '3', '铜仁地区', '520000', '');
INSERT INTO `gwshop_area_china` VALUES ('522201', '4', '铜仁市', '522200', '554300');
INSERT INTO `gwshop_area_china` VALUES ('522222', '4', '江口县', '522200', '554400');
INSERT INTO `gwshop_area_china` VALUES ('522223', '4', '玉屏侗族自治县', '522200', '554000');
INSERT INTO `gwshop_area_china` VALUES ('522224', '4', '石阡县', '522200', '555100');
INSERT INTO `gwshop_area_china` VALUES ('522225', '4', '思南县', '522200', '565100');
INSERT INTO `gwshop_area_china` VALUES ('522226', '4', '印江土家族苗族自治县', '522200', '555200');
INSERT INTO `gwshop_area_china` VALUES ('522227', '4', '德江县', '522200', '565200');
INSERT INTO `gwshop_area_china` VALUES ('522228', '4', '沿河土家族自治县', '522200', '565300');
INSERT INTO `gwshop_area_china` VALUES ('522229', '4', '松桃苗族自治县', '522200', '554100');
INSERT INTO `gwshop_area_china` VALUES ('522230', '4', '万山特区', '522200', '554200');
INSERT INTO `gwshop_area_china` VALUES ('522231', '4', '其它区', '522200', '');
INSERT INTO `gwshop_area_china` VALUES ('522300', '3', '黔西南布依族苗族自治州', '520000', '');
INSERT INTO `gwshop_area_china` VALUES ('522301', '4', '兴义市', '522300', '562400');
INSERT INTO `gwshop_area_china` VALUES ('522322', '4', '兴仁县', '522300', '562300');
INSERT INTO `gwshop_area_china` VALUES ('522323', '4', '普安县', '522300', '561500');
INSERT INTO `gwshop_area_china` VALUES ('522324', '4', '晴隆县', '522300', '561400');
INSERT INTO `gwshop_area_china` VALUES ('522325', '4', '贞丰县', '522300', '562200');
INSERT INTO `gwshop_area_china` VALUES ('522326', '4', '望谟县', '522300', '552300');
INSERT INTO `gwshop_area_china` VALUES ('522327', '4', '册亨县', '522300', '552200');
INSERT INTO `gwshop_area_china` VALUES ('522328', '4', '安龙县', '522300', '552400');
INSERT INTO `gwshop_area_china` VALUES ('522329', '4', '其它区', '522300', '');
INSERT INTO `gwshop_area_china` VALUES ('522400', '3', '毕节地区', '520000', '');
INSERT INTO `gwshop_area_china` VALUES ('522401', '4', '毕节市', '522400', '551700');
INSERT INTO `gwshop_area_china` VALUES ('522422', '4', '大方县', '522400', '551600');
INSERT INTO `gwshop_area_china` VALUES ('522423', '4', '黔西县', '522400', '551500');
INSERT INTO `gwshop_area_china` VALUES ('522424', '4', '金沙县', '522400', '551800');
INSERT INTO `gwshop_area_china` VALUES ('522425', '4', '织金县', '522400', '552100');
INSERT INTO `gwshop_area_china` VALUES ('522426', '4', '纳雍县', '522400', '553300');
INSERT INTO `gwshop_area_china` VALUES ('522427', '4', '威宁彝族回族苗族自治县', '522400', '553100');
INSERT INTO `gwshop_area_china` VALUES ('522428', '4', '赫章县', '522400', '553200');
INSERT INTO `gwshop_area_china` VALUES ('522429', '4', '其它区', '522400', '');
INSERT INTO `gwshop_area_china` VALUES ('522600', '3', '黔东南苗族侗族自治州', '520000', '');
INSERT INTO `gwshop_area_china` VALUES ('522601', '4', '凯里市', '522600', '556000');
INSERT INTO `gwshop_area_china` VALUES ('522622', '4', '黄平县', '522600', '556100');
INSERT INTO `gwshop_area_china` VALUES ('522623', '4', '施秉县', '522600', '556200');
INSERT INTO `gwshop_area_china` VALUES ('522624', '4', '三穗县', '522600', '556500');
INSERT INTO `gwshop_area_china` VALUES ('522625', '4', '镇远县', '522600', '557700');
INSERT INTO `gwshop_area_china` VALUES ('522626', '4', '岑巩县', '522600', '557800');
INSERT INTO `gwshop_area_china` VALUES ('522627', '4', '天柱县', '522600', '556600');
INSERT INTO `gwshop_area_china` VALUES ('522628', '4', '锦屏县', '522600', '556700');
INSERT INTO `gwshop_area_china` VALUES ('522629', '4', '剑河县', '522600', '556400');
INSERT INTO `gwshop_area_china` VALUES ('522630', '4', '台江县', '522600', '556300');
INSERT INTO `gwshop_area_china` VALUES ('522631', '4', '黎平县', '522600', '557300');
INSERT INTO `gwshop_area_china` VALUES ('522632', '4', '榕江县', '522600', '557200');
INSERT INTO `gwshop_area_china` VALUES ('522633', '4', '从江县', '522600', '557400');
INSERT INTO `gwshop_area_china` VALUES ('522634', '4', '雷山县', '522600', '557100');
INSERT INTO `gwshop_area_china` VALUES ('522635', '4', '麻江县', '522600', '557600');
INSERT INTO `gwshop_area_china` VALUES ('522636', '4', '丹寨县', '522600', '557500');
INSERT INTO `gwshop_area_china` VALUES ('522637', '4', '其它区', '522600', '');
INSERT INTO `gwshop_area_china` VALUES ('522700', '3', '黔南布依族苗族自治州', '520000', '');
INSERT INTO `gwshop_area_china` VALUES ('522701', '4', '都匀市', '522700', '558000');
INSERT INTO `gwshop_area_china` VALUES ('522702', '4', '福泉市', '522700', '550500');
INSERT INTO `gwshop_area_china` VALUES ('522722', '4', '荔波县', '522700', '558400');
INSERT INTO `gwshop_area_china` VALUES ('522723', '4', '贵定县', '522700', '551300');
INSERT INTO `gwshop_area_china` VALUES ('522725', '4', '瓮安县', '522700', '550400');
INSERT INTO `gwshop_area_china` VALUES ('522726', '4', '独山县', '522700', '558200');
INSERT INTO `gwshop_area_china` VALUES ('522727', '4', '平塘县', '522700', '558300');
INSERT INTO `gwshop_area_china` VALUES ('522728', '4', '罗甸县', '522700', '550100');
INSERT INTO `gwshop_area_china` VALUES ('522729', '4', '长顺县', '522700', '550700');
INSERT INTO `gwshop_area_china` VALUES ('522730', '4', '龙里县', '522700', '551200');
INSERT INTO `gwshop_area_china` VALUES ('522731', '4', '惠水县', '522700', '550600');
INSERT INTO `gwshop_area_china` VALUES ('522732', '4', '三都水族自治县', '522700', '558100');
INSERT INTO `gwshop_area_china` VALUES ('522733', '4', '其它区', '522700', '');
INSERT INTO `gwshop_area_china` VALUES ('530000', '2', '云南省', '1', '');
INSERT INTO `gwshop_area_china` VALUES ('530100', '3', '昆明市', '530000', '650000');
INSERT INTO `gwshop_area_china` VALUES ('530102', '4', '五华区', '530100', '650032');
INSERT INTO `gwshop_area_china` VALUES ('530103', '4', '盘龙区', '530100', '650051');
INSERT INTO `gwshop_area_china` VALUES ('530111', '4', '官渡区', '530100', '650220');
INSERT INTO `gwshop_area_china` VALUES ('530112', '4', '西山区', '530100', '650100');
INSERT INTO `gwshop_area_china` VALUES ('530113', '4', '东川区', '530100', '654100');
INSERT INTO `gwshop_area_china` VALUES ('530121', '4', '呈贡县', '530100', '650500');
INSERT INTO `gwshop_area_china` VALUES ('530122', '4', '晋宁县', '530100', '650600');
INSERT INTO `gwshop_area_china` VALUES ('530124', '4', '富民县', '530100', '650400');
INSERT INTO `gwshop_area_china` VALUES ('530125', '4', '宜良县', '530100', '652100');
INSERT INTO `gwshop_area_china` VALUES ('530126', '4', '石林彝族自治县', '530100', '652200');
INSERT INTO `gwshop_area_china` VALUES ('530127', '4', '嵩明县', '530100', '651700');
INSERT INTO `gwshop_area_china` VALUES ('530128', '4', '禄劝彝族苗族自治县', '530100', '651500');
INSERT INTO `gwshop_area_china` VALUES ('530129', '4', '寻甸回族彝族自治县', '530100', '655200');
INSERT INTO `gwshop_area_china` VALUES ('530181', '4', '安宁市', '530100', '650300');
INSERT INTO `gwshop_area_china` VALUES ('530182', '4', '其它区', '530100', '');
INSERT INTO `gwshop_area_china` VALUES ('530300', '3', '曲靖市', '530000', '655000');
INSERT INTO `gwshop_area_china` VALUES ('530302', '4', '麒麟区', '530300', '655000');
INSERT INTO `gwshop_area_china` VALUES ('530321', '4', '马龙县', '530300', '655100');
INSERT INTO `gwshop_area_china` VALUES ('530322', '4', '陆良县', '530300', '655600');
INSERT INTO `gwshop_area_china` VALUES ('530323', '4', '师宗县', '530300', '655700');
INSERT INTO `gwshop_area_china` VALUES ('530324', '4', '罗平县', '530300', '655800');
INSERT INTO `gwshop_area_china` VALUES ('530325', '4', '富源县', '530300', '655500');
INSERT INTO `gwshop_area_china` VALUES ('530326', '4', '会泽县', '530300', '654200');
INSERT INTO `gwshop_area_china` VALUES ('530328', '4', '沾益县', '530300', '655331');
INSERT INTO `gwshop_area_china` VALUES ('530381', '4', '宣威市', '530300', '655400');
INSERT INTO `gwshop_area_china` VALUES ('530382', '4', '其它区', '530300', '');
INSERT INTO `gwshop_area_china` VALUES ('530400', '3', '玉溪市', '530000', '');
INSERT INTO `gwshop_area_china` VALUES ('530402', '4', '红塔区', '530400', '653100');
INSERT INTO `gwshop_area_china` VALUES ('530421', '4', '江川县', '530400', '652600');
INSERT INTO `gwshop_area_china` VALUES ('530422', '4', '澄江县', '530400', '652500');
INSERT INTO `gwshop_area_china` VALUES ('530423', '4', '通海县', '530400', '652700');
INSERT INTO `gwshop_area_china` VALUES ('530424', '4', '华宁县', '530400', '652800');
INSERT INTO `gwshop_area_china` VALUES ('530425', '4', '易门县', '530400', '651100');
INSERT INTO `gwshop_area_china` VALUES ('530426', '4', '峨山彝族自治县', '530400', '653200');
INSERT INTO `gwshop_area_china` VALUES ('530427', '4', '新平彝族傣族自治县', '530400', '653400');
INSERT INTO `gwshop_area_china` VALUES ('530428', '4', '元江哈尼族彝族傣族自治县', '530400', '653300');
INSERT INTO `gwshop_area_china` VALUES ('530429', '4', '其它区', '530400', '');
INSERT INTO `gwshop_area_china` VALUES ('530500', '3', '保山市', '530000', '');
INSERT INTO `gwshop_area_china` VALUES ('530502', '4', '隆阳区', '530500', '678000');
INSERT INTO `gwshop_area_china` VALUES ('530521', '4', '施甸县', '530500', '678200');
INSERT INTO `gwshop_area_china` VALUES ('530522', '4', '腾冲县', '530500', '679100');
INSERT INTO `gwshop_area_china` VALUES ('530523', '4', '龙陵县', '530500', '678300');
INSERT INTO `gwshop_area_china` VALUES ('530524', '4', '昌宁县', '530500', '678100');
INSERT INTO `gwshop_area_china` VALUES ('530525', '4', '其它区', '530500', '');
INSERT INTO `gwshop_area_china` VALUES ('530600', '3', '昭通市', '530000', '657000');
INSERT INTO `gwshop_area_china` VALUES ('530602', '4', '昭阳区', '530600', '657000');
INSERT INTO `gwshop_area_china` VALUES ('530621', '4', '鲁甸县', '530600', '657100');
INSERT INTO `gwshop_area_china` VALUES ('530622', '4', '巧家县', '530600', '654600');
INSERT INTO `gwshop_area_china` VALUES ('530623', '4', '盐津县', '530600', '657500');
INSERT INTO `gwshop_area_china` VALUES ('530624', '4', '大关县', '530600', '657400');
INSERT INTO `gwshop_area_china` VALUES ('530625', '4', '永善县', '530600', '657300');
INSERT INTO `gwshop_area_china` VALUES ('530626', '4', '绥江县', '530600', '657700');
INSERT INTO `gwshop_area_china` VALUES ('530627', '4', '镇雄县', '530600', '657200');
INSERT INTO `gwshop_area_china` VALUES ('530628', '4', '彝良县', '530600', '657600');
INSERT INTO `gwshop_area_china` VALUES ('530629', '4', '威信县', '530600', '657900');
INSERT INTO `gwshop_area_china` VALUES ('530630', '4', '水富县', '530600', '657800');
INSERT INTO `gwshop_area_china` VALUES ('530631', '4', '其它区', '530600', '');
INSERT INTO `gwshop_area_china` VALUES ('530700', '3', '丽江市', '530000', '');
INSERT INTO `gwshop_area_china` VALUES ('530702', '4', '古城区', '530700', '674100');
INSERT INTO `gwshop_area_china` VALUES ('530721', '4', '玉龙纳西族自治县', '530700', '674100');
INSERT INTO `gwshop_area_china` VALUES ('530722', '4', '永胜县', '530700', '674200');
INSERT INTO `gwshop_area_china` VALUES ('530723', '4', '华坪县', '530700', '674800');
INSERT INTO `gwshop_area_china` VALUES ('530724', '4', '宁蒗彝族自治县', '530700', '674300');
INSERT INTO `gwshop_area_china` VALUES ('530725', '4', '其它区', '530700', '');
INSERT INTO `gwshop_area_china` VALUES ('530800', '3', '普洱市', '530000', '665000');
INSERT INTO `gwshop_area_china` VALUES ('530802', '4', '思茅区', '530800', '665000');
INSERT INTO `gwshop_area_china` VALUES ('530821', '4', '宁洱哈尼族彝族自治县', '530800', '665100');
INSERT INTO `gwshop_area_china` VALUES ('530822', '4', '墨江哈尼族自治县', '530800', '654800');
INSERT INTO `gwshop_area_china` VALUES ('530823', '4', '景东彝族自治县', '530800', '676200');
INSERT INTO `gwshop_area_china` VALUES ('530824', '4', '景谷傣族彝族自治县', '530800', '666400');
INSERT INTO `gwshop_area_china` VALUES ('530825', '4', '镇沅彝族哈尼族拉祜族自治县', '530800', '666500');
INSERT INTO `gwshop_area_china` VALUES ('530826', '4', '江城哈尼族彝族自治县', '530800', '665900');
INSERT INTO `gwshop_area_china` VALUES ('530827', '4', '孟连傣族拉祜族佤族自治县', '530800', '665800');
INSERT INTO `gwshop_area_china` VALUES ('530828', '4', '澜沧拉祜族自治县', '530800', '665600');
INSERT INTO `gwshop_area_china` VALUES ('530829', '4', '西盟佤族自治县', '530800', '665700');
INSERT INTO `gwshop_area_china` VALUES ('530830', '4', '其它区', '530800', '');
INSERT INTO `gwshop_area_china` VALUES ('530900', '3', '临沧市', '530000', '');
INSERT INTO `gwshop_area_china` VALUES ('530902', '4', '临翔区', '530900', '677000');
INSERT INTO `gwshop_area_china` VALUES ('530921', '4', '凤庆县', '530900', '675900');
INSERT INTO `gwshop_area_china` VALUES ('530922', '4', '云县', '530900', '675800');
INSERT INTO `gwshop_area_china` VALUES ('530923', '4', '永德县', '530900', '677600');
INSERT INTO `gwshop_area_china` VALUES ('530924', '4', '镇康县', '530900', '677700');
INSERT INTO `gwshop_area_china` VALUES ('530925', '4', '双江拉祜族佤族布朗族傣族自治县', '530900', '677300');
INSERT INTO `gwshop_area_china` VALUES ('530926', '4', '耿马傣族佤族自治县', '530900', '677500');
INSERT INTO `gwshop_area_china` VALUES ('530927', '4', '沧源佤族自治县', '530900', '677400');
INSERT INTO `gwshop_area_china` VALUES ('530928', '4', '其它区', '530900', '');
INSERT INTO `gwshop_area_china` VALUES ('532300', '3', '楚雄彝族自治州', '530000', '');
INSERT INTO `gwshop_area_china` VALUES ('532301', '4', '楚雄市', '532300', '675000');
INSERT INTO `gwshop_area_china` VALUES ('532322', '4', '双柏县', '532300', '675100');
INSERT INTO `gwshop_area_china` VALUES ('532323', '4', '牟定县', '532300', '675500');
INSERT INTO `gwshop_area_china` VALUES ('532324', '4', '南华县', '532300', '675200');
INSERT INTO `gwshop_area_china` VALUES ('532325', '4', '姚安县', '532300', '675300');
INSERT INTO `gwshop_area_china` VALUES ('532326', '4', '大姚县', '532300', '675400');
INSERT INTO `gwshop_area_china` VALUES ('532327', '4', '永仁县', '532300', '651400');
INSERT INTO `gwshop_area_china` VALUES ('532328', '4', '元谋县', '532300', '651300');
INSERT INTO `gwshop_area_china` VALUES ('532329', '4', '武定县', '532300', '651600');
INSERT INTO `gwshop_area_china` VALUES ('532331', '4', '禄丰县', '532300', '651200');
INSERT INTO `gwshop_area_china` VALUES ('532332', '4', '其它区', '532300', '');
INSERT INTO `gwshop_area_china` VALUES ('532500', '3', '红河哈尼族彝族自治州', '530000', '');
INSERT INTO `gwshop_area_china` VALUES ('532501', '4', '个旧市', '532500', '661000');
INSERT INTO `gwshop_area_china` VALUES ('532502', '4', '开远市', '532500', '661600');
INSERT INTO `gwshop_area_china` VALUES ('532522', '4', '蒙自县', '532500', '661100');
INSERT INTO `gwshop_area_china` VALUES ('532523', '4', '屏边苗族自治县', '532500', '661200');
INSERT INTO `gwshop_area_china` VALUES ('532524', '4', '建水县', '532500', '654300');
INSERT INTO `gwshop_area_china` VALUES ('532525', '4', '石屏县', '532500', '662200');
INSERT INTO `gwshop_area_china` VALUES ('532526', '4', '弥勒县', '532500', '652300');
INSERT INTO `gwshop_area_china` VALUES ('532527', '4', '泸西县', '532500', '652400');
INSERT INTO `gwshop_area_china` VALUES ('532528', '4', '元阳县', '532500', '662400');
INSERT INTO `gwshop_area_china` VALUES ('532529', '4', '红河县', '532500', '654400');
INSERT INTO `gwshop_area_china` VALUES ('532530', '4', '金平苗族瑶族傣族自治县', '532500', '661500');
INSERT INTO `gwshop_area_china` VALUES ('532531', '4', '绿春县', '532500', '662500');
INSERT INTO `gwshop_area_china` VALUES ('532532', '4', '河口瑶族自治县', '532500', '661300');
INSERT INTO `gwshop_area_china` VALUES ('532533', '4', '其它区', '532500', '');
INSERT INTO `gwshop_area_china` VALUES ('532600', '3', '文山壮族苗族自治州', '530000', '');
INSERT INTO `gwshop_area_china` VALUES ('532621', '4', '文山县', '532600', '663000');
INSERT INTO `gwshop_area_china` VALUES ('532622', '4', '砚山县', '532600', '663100');
INSERT INTO `gwshop_area_china` VALUES ('532623', '4', '西畴县', '532600', '663500');
INSERT INTO `gwshop_area_china` VALUES ('532624', '4', '麻栗坡县', '532600', '663600');
INSERT INTO `gwshop_area_china` VALUES ('532625', '4', '马关县', '532600', '663700');
INSERT INTO `gwshop_area_china` VALUES ('532626', '4', '丘北县', '532600', '663200');
INSERT INTO `gwshop_area_china` VALUES ('532627', '4', '广南县', '532600', '663300');
INSERT INTO `gwshop_area_china` VALUES ('532628', '4', '富宁县', '532600', '663400');
INSERT INTO `gwshop_area_china` VALUES ('532629', '4', '其它区', '532600', '');
INSERT INTO `gwshop_area_china` VALUES ('532800', '3', '西双版纳傣族自治州', '530000', '');
INSERT INTO `gwshop_area_china` VALUES ('532801', '4', '景洪市', '532800', '666100');
INSERT INTO `gwshop_area_china` VALUES ('532822', '4', '勐海县', '532800', '666200');
INSERT INTO `gwshop_area_china` VALUES ('532823', '4', '勐腊县', '532800', '666300');
INSERT INTO `gwshop_area_china` VALUES ('532824', '4', '其它区', '532800', '');
INSERT INTO `gwshop_area_china` VALUES ('532900', '3', '大理白族自治州', '530000', '');
INSERT INTO `gwshop_area_china` VALUES ('532901', '4', '大理市', '532900', '671000');
INSERT INTO `gwshop_area_china` VALUES ('532922', '4', '漾濞彝族自治县', '532900', '672500');
INSERT INTO `gwshop_area_china` VALUES ('532923', '4', '祥云县', '532900', '672100');
INSERT INTO `gwshop_area_china` VALUES ('532924', '4', '宾川县', '532900', '671600');
INSERT INTO `gwshop_area_china` VALUES ('532925', '4', '弥渡县', '532900', '675600');
INSERT INTO `gwshop_area_china` VALUES ('532926', '4', '南涧彝族自治县', '532900', '675700');
INSERT INTO `gwshop_area_china` VALUES ('532927', '4', '巍山彝族回族自治县', '532900', '672400');
INSERT INTO `gwshop_area_china` VALUES ('532928', '4', '永平县', '532900', '672600');
INSERT INTO `gwshop_area_china` VALUES ('532929', '4', '云龙县', '532900', '672700');
INSERT INTO `gwshop_area_china` VALUES ('532930', '4', '洱源县', '532900', '671200');
INSERT INTO `gwshop_area_china` VALUES ('532931', '4', '剑川县', '532900', '671300');
INSERT INTO `gwshop_area_china` VALUES ('532932', '4', '鹤庆县', '532900', '671500');
INSERT INTO `gwshop_area_china` VALUES ('532933', '4', '其它区', '532900', '');
INSERT INTO `gwshop_area_china` VALUES ('533100', '3', '德宏傣族景颇族自治州', '530000', '');
INSERT INTO `gwshop_area_china` VALUES ('533102', '4', '瑞丽市', '533100', '678600');
INSERT INTO `gwshop_area_china` VALUES ('533103', '4', '潞西市', '533100', '678400');
INSERT INTO `gwshop_area_china` VALUES ('533122', '4', '梁河县', '533100', '679200');
INSERT INTO `gwshop_area_china` VALUES ('533123', '4', '盈江县', '533100', '679300');
INSERT INTO `gwshop_area_china` VALUES ('533124', '4', '陇川县', '533100', '678700');
INSERT INTO `gwshop_area_china` VALUES ('533125', '4', '其它区', '533100', '');
INSERT INTO `gwshop_area_china` VALUES ('533300', '3', '怒江傈僳族自治州', '530000', '');
INSERT INTO `gwshop_area_china` VALUES ('533321', '4', '泸水县', '533300', '673100');
INSERT INTO `gwshop_area_china` VALUES ('533323', '4', '福贡县', '533300', '673400');
INSERT INTO `gwshop_area_china` VALUES ('533324', '4', '贡山独龙族怒族自治县', '533300', '673500');
INSERT INTO `gwshop_area_china` VALUES ('533325', '4', '兰坪白族普米族自治县', '533300', '671400');
INSERT INTO `gwshop_area_china` VALUES ('533326', '4', '其它区', '533300', '');
INSERT INTO `gwshop_area_china` VALUES ('533400', '3', '迪庆藏族自治州', '530000', '');
INSERT INTO `gwshop_area_china` VALUES ('533421', '4', '香格里拉县', '533400', '674400');
INSERT INTO `gwshop_area_china` VALUES ('533422', '4', '德钦县', '533400', '674500');
INSERT INTO `gwshop_area_china` VALUES ('533423', '4', '维西傈僳族自治县', '533400', '674600');
INSERT INTO `gwshop_area_china` VALUES ('533424', '4', '其它区', '533400', '');
INSERT INTO `gwshop_area_china` VALUES ('540000', '2', '西藏自治区', '1', '');
INSERT INTO `gwshop_area_china` VALUES ('540100', '3', '拉萨市', '540000', '850000');
INSERT INTO `gwshop_area_china` VALUES ('540102', '4', '城关区', '540100', '850000');
INSERT INTO `gwshop_area_china` VALUES ('540121', '4', '林周县', '540100', '851600');
INSERT INTO `gwshop_area_china` VALUES ('540122', '4', '当雄县', '540100', '851500');
INSERT INTO `gwshop_area_china` VALUES ('540123', '4', '尼木县', '540100', '851300');
INSERT INTO `gwshop_area_china` VALUES ('540124', '4', '曲水县', '540100', '850600');
INSERT INTO `gwshop_area_china` VALUES ('540125', '4', '堆龙德庆县', '540100', '851400');
INSERT INTO `gwshop_area_china` VALUES ('540126', '4', '达孜县', '540100', '850100');
INSERT INTO `gwshop_area_china` VALUES ('540127', '4', '墨竹工卡县', '540100', '850200');
INSERT INTO `gwshop_area_china` VALUES ('540128', '4', '其它区', '540100', '');
INSERT INTO `gwshop_area_china` VALUES ('542100', '3', '昌都地区', '540000', '');
INSERT INTO `gwshop_area_china` VALUES ('542121', '4', '昌都县', '542100', '854000');
INSERT INTO `gwshop_area_china` VALUES ('542122', '4', '江达县', '542100', '854100');
INSERT INTO `gwshop_area_china` VALUES ('542123', '4', '贡觉县', '542100', '854200');
INSERT INTO `gwshop_area_china` VALUES ('542124', '4', '类乌齐县', '542100', '855600');
INSERT INTO `gwshop_area_china` VALUES ('542125', '4', '丁青县', '542100', '855700');
INSERT INTO `gwshop_area_china` VALUES ('542126', '4', '察雅县', '542100', '854300');
INSERT INTO `gwshop_area_china` VALUES ('542127', '4', '八宿县', '542100', '854600');
INSERT INTO `gwshop_area_china` VALUES ('542128', '4', '左贡县', '542100', '854400');
INSERT INTO `gwshop_area_china` VALUES ('542129', '4', '芒康县', '542100', '854500');
INSERT INTO `gwshop_area_china` VALUES ('542132', '4', '洛隆县', '542100', '855400');
INSERT INTO `gwshop_area_china` VALUES ('542133', '4', '边坝县', '542100', '855500');
INSERT INTO `gwshop_area_china` VALUES ('542134', '4', '其它区', '542100', '');
INSERT INTO `gwshop_area_china` VALUES ('542200', '3', '山南地区', '540000', '');
INSERT INTO `gwshop_area_china` VALUES ('542221', '4', '乃东县', '542200', '856100');
INSERT INTO `gwshop_area_china` VALUES ('542222', '4', '扎囊县', '542200', '850800');
INSERT INTO `gwshop_area_china` VALUES ('542223', '4', '贡嘎县', '542200', '850700');
INSERT INTO `gwshop_area_china` VALUES ('542224', '4', '桑日县', '542200', '856200');
INSERT INTO `gwshop_area_china` VALUES ('542225', '4', '琼结县', '542200', '856800');
INSERT INTO `gwshop_area_china` VALUES ('542226', '4', '曲松县', '542200', '856300');
INSERT INTO `gwshop_area_china` VALUES ('542227', '4', '措美县', '542200', '856900');
INSERT INTO `gwshop_area_china` VALUES ('542228', '4', '洛扎县', '542200', '851200');
INSERT INTO `gwshop_area_china` VALUES ('542229', '4', '加查县', '542200', '856400');
INSERT INTO `gwshop_area_china` VALUES ('542231', '4', '隆子县', '542200', '856600');
INSERT INTO `gwshop_area_china` VALUES ('542232', '4', '错那县', '542200', '856700');
INSERT INTO `gwshop_area_china` VALUES ('542233', '4', '浪卡子县', '542200', '851100');
INSERT INTO `gwshop_area_china` VALUES ('542234', '4', '其它区', '542200', '');
INSERT INTO `gwshop_area_china` VALUES ('542300', '3', '日喀则地区', '540000', '');
INSERT INTO `gwshop_area_china` VALUES ('542301', '4', '日喀则市', '542300', '857000');
INSERT INTO `gwshop_area_china` VALUES ('542322', '4', '南木林县', '542300', '857100');
INSERT INTO `gwshop_area_china` VALUES ('542323', '4', '江孜县', '542300', '857400');
INSERT INTO `gwshop_area_china` VALUES ('542324', '4', '定日县', '542300', '858200');
INSERT INTO `gwshop_area_china` VALUES ('542325', '4', '萨迦县', '542300', '857800');
INSERT INTO `gwshop_area_china` VALUES ('542326', '4', '拉孜县', '542300', '858100');
INSERT INTO `gwshop_area_china` VALUES ('542327', '4', '昂仁县', '542300', '858500');
INSERT INTO `gwshop_area_china` VALUES ('542328', '4', '谢通门县', '542300', '858900');
INSERT INTO `gwshop_area_china` VALUES ('542329', '4', '白朗县', '542300', '857300');
INSERT INTO `gwshop_area_china` VALUES ('542330', '4', '仁布县', '542300', '857200');
INSERT INTO `gwshop_area_china` VALUES ('542331', '4', '康马县', '542300', '857500');
INSERT INTO `gwshop_area_china` VALUES ('542332', '4', '定结县', '542300', '857900');
INSERT INTO `gwshop_area_china` VALUES ('542333', '4', '仲巴县', '542300', '858800');
INSERT INTO `gwshop_area_china` VALUES ('542334', '4', '亚东县', '542300', '857600');
INSERT INTO `gwshop_area_china` VALUES ('542335', '4', '吉隆县', '542300', '858700');
INSERT INTO `gwshop_area_china` VALUES ('542336', '4', '聂拉木县', '542300', '858300');
INSERT INTO `gwshop_area_china` VALUES ('542337', '4', '萨嘎县', '542300', '858600');
INSERT INTO `gwshop_area_china` VALUES ('542338', '4', '岗巴县', '542300', '857700');
INSERT INTO `gwshop_area_china` VALUES ('542339', '4', '其它区', '542300', '');
INSERT INTO `gwshop_area_china` VALUES ('542400', '3', '那曲地区', '540000', '');
INSERT INTO `gwshop_area_china` VALUES ('542421', '4', '那曲县', '542400', '852000');
INSERT INTO `gwshop_area_china` VALUES ('542422', '4', '嘉黎县', '542400', '852400');
INSERT INTO `gwshop_area_china` VALUES ('542423', '4', '比如县', '542400', '852300');
INSERT INTO `gwshop_area_china` VALUES ('542424', '4', '聂荣县', '542400', '853500');
INSERT INTO `gwshop_area_china` VALUES ('542425', '4', '安多县', '542400', '853400');
INSERT INTO `gwshop_area_china` VALUES ('542426', '4', '申扎县', '542400', '853100');
INSERT INTO `gwshop_area_china` VALUES ('542427', '4', '索县', '542400', '852200');
INSERT INTO `gwshop_area_china` VALUES ('542428', '4', '班戈县', '542400', '852500');
INSERT INTO `gwshop_area_china` VALUES ('542429', '4', '巴青县', '542400', '852100');
INSERT INTO `gwshop_area_china` VALUES ('542430', '4', '尼玛县', '542400', '852600');
INSERT INTO `gwshop_area_china` VALUES ('542431', '4', '其它区', '542400', '');
INSERT INTO `gwshop_area_china` VALUES ('542500', '3', '阿里地区', '540000', '');
INSERT INTO `gwshop_area_china` VALUES ('542521', '4', '普兰县', '542500', '859500');
INSERT INTO `gwshop_area_china` VALUES ('542522', '4', '札达县', '542500', '859600');
INSERT INTO `gwshop_area_china` VALUES ('542523', '4', '噶尔县', '542500', '859400');
INSERT INTO `gwshop_area_china` VALUES ('542524', '4', '日土县', '542500', '859700');
INSERT INTO `gwshop_area_china` VALUES ('542525', '4', '革吉县', '542500', '859100');
INSERT INTO `gwshop_area_china` VALUES ('542526', '4', '改则县', '542500', '859200');
INSERT INTO `gwshop_area_china` VALUES ('542527', '4', '措勤县', '542500', '859300');
INSERT INTO `gwshop_area_china` VALUES ('542528', '4', '其它区', '542500', '');
INSERT INTO `gwshop_area_china` VALUES ('542600', '3', '林芝地区', '540000', '');
INSERT INTO `gwshop_area_china` VALUES ('542621', '4', '林芝县', '542600', '860100');
INSERT INTO `gwshop_area_china` VALUES ('542622', '4', '工布江达县', '542600', '860200');
INSERT INTO `gwshop_area_china` VALUES ('542623', '4', '米林县', '542600', '860500');
INSERT INTO `gwshop_area_china` VALUES ('542624', '4', '墨脱县', '542600', '860700');
INSERT INTO `gwshop_area_china` VALUES ('542625', '4', '波密县', '542600', '860300');
INSERT INTO `gwshop_area_china` VALUES ('542626', '4', '察隅县', '542600', '860600');
INSERT INTO `gwshop_area_china` VALUES ('542627', '4', '朗县', '542600', '860400');
INSERT INTO `gwshop_area_china` VALUES ('542628', '4', '其它区', '542600', '');
INSERT INTO `gwshop_area_china` VALUES ('610000', '2', '陕西省', '1', '');
INSERT INTO `gwshop_area_china` VALUES ('610100', '3', '西安市', '610000', '710000');
INSERT INTO `gwshop_area_china` VALUES ('610102', '4', '新城区', '610100', '710005');
INSERT INTO `gwshop_area_china` VALUES ('610103', '4', '碑林区', '610100', '710001');
INSERT INTO `gwshop_area_china` VALUES ('610104', '4', '莲湖区', '610100', '710003');
INSERT INTO `gwshop_area_china` VALUES ('610111', '4', '灞桥区', '610100', '710038');
INSERT INTO `gwshop_area_china` VALUES ('610112', '4', '未央区', '610100', '710016');
INSERT INTO `gwshop_area_china` VALUES ('610113', '4', '雁塔区', '610100', '710061');
INSERT INTO `gwshop_area_china` VALUES ('610114', '4', '阎良区', '610100', '710089');
INSERT INTO `gwshop_area_china` VALUES ('610115', '4', '临潼区', '610100', '710600');
INSERT INTO `gwshop_area_china` VALUES ('610116', '4', '长安区', '610100', '710100');
INSERT INTO `gwshop_area_china` VALUES ('610122', '4', '蓝田县', '610100', '710500');
INSERT INTO `gwshop_area_china` VALUES ('610124', '4', '周至县', '610100', '710400');
INSERT INTO `gwshop_area_china` VALUES ('610125', '4', '户县', '610100', '710300');
INSERT INTO `gwshop_area_china` VALUES ('610126', '4', '高陵县', '610100', '710200');
INSERT INTO `gwshop_area_china` VALUES ('610127', '4', '其它区', '610100', '');
INSERT INTO `gwshop_area_china` VALUES ('610200', '3', '铜川市', '610000', '727000');
INSERT INTO `gwshop_area_china` VALUES ('610202', '4', '王益区', '610200', '727000');
INSERT INTO `gwshop_area_china` VALUES ('610203', '4', '印台区', '610200', '727007');
INSERT INTO `gwshop_area_china` VALUES ('610204', '4', '耀州区', '610200', '727100');
INSERT INTO `gwshop_area_china` VALUES ('610222', '4', '宜君县', '610200', '727200');
INSERT INTO `gwshop_area_china` VALUES ('610223', '4', '其它区', '610200', '');
INSERT INTO `gwshop_area_china` VALUES ('610300', '3', '宝鸡市', '610000', '721000');
INSERT INTO `gwshop_area_china` VALUES ('610302', '4', '渭滨区', '610300', '721000');
INSERT INTO `gwshop_area_china` VALUES ('610303', '4', '金台区', '610300', '721001');
INSERT INTO `gwshop_area_china` VALUES ('610304', '4', '陈仓区', '610300', '721300');
INSERT INTO `gwshop_area_china` VALUES ('610322', '4', '凤翔县', '610300', '721400');
INSERT INTO `gwshop_area_china` VALUES ('610323', '4', '岐山县', '610300', '722400');
INSERT INTO `gwshop_area_china` VALUES ('610324', '4', '扶风县', '610300', '722200');
INSERT INTO `gwshop_area_china` VALUES ('610326', '4', '眉县', '610300', '722300');
INSERT INTO `gwshop_area_china` VALUES ('610327', '4', '陇县', '610300', '721200');
INSERT INTO `gwshop_area_china` VALUES ('610328', '4', '千阳县', '610300', '721100');
INSERT INTO `gwshop_area_china` VALUES ('610329', '4', '麟游县', '610300', '721500');
INSERT INTO `gwshop_area_china` VALUES ('610330', '4', '凤县', '610300', '721700');
INSERT INTO `gwshop_area_china` VALUES ('610331', '4', '太白县', '610300', '721600');
INSERT INTO `gwshop_area_china` VALUES ('610332', '4', '其它区', '610300', '');
INSERT INTO `gwshop_area_china` VALUES ('610400', '3', '咸阳市', '610000', '712000');
INSERT INTO `gwshop_area_china` VALUES ('610402', '4', '秦都区', '610400', '712000');
INSERT INTO `gwshop_area_china` VALUES ('610403', '4', '杨陵区', '610400', '712100');
INSERT INTO `gwshop_area_china` VALUES ('610404', '4', '渭城区', '610400', '712000');
INSERT INTO `gwshop_area_china` VALUES ('610422', '4', '三原县', '610400', '713800');
INSERT INTO `gwshop_area_china` VALUES ('610423', '4', '泾阳县', '610400', '713700');
INSERT INTO `gwshop_area_china` VALUES ('610424', '4', '乾县', '610400', '713300');
INSERT INTO `gwshop_area_china` VALUES ('610425', '4', '礼泉县', '610400', '713200');
INSERT INTO `gwshop_area_china` VALUES ('610426', '4', '永寿县', '610400', '713400');
INSERT INTO `gwshop_area_china` VALUES ('610427', '4', '彬县', '610400', '713500');
INSERT INTO `gwshop_area_china` VALUES ('610428', '4', '长武县', '610400', '713600');
INSERT INTO `gwshop_area_china` VALUES ('610429', '4', '旬邑县', '610400', '711300');
INSERT INTO `gwshop_area_china` VALUES ('610430', '4', '淳化县', '610400', '711200');
INSERT INTO `gwshop_area_china` VALUES ('610431', '4', '武功县', '610400', '712200');
INSERT INTO `gwshop_area_china` VALUES ('610481', '4', '兴平市', '610400', '713100');
INSERT INTO `gwshop_area_china` VALUES ('610482', '4', '其它区', '610400', '');
INSERT INTO `gwshop_area_china` VALUES ('610500', '3', '渭南市', '610000', '714000');
INSERT INTO `gwshop_area_china` VALUES ('610502', '4', '临渭区', '610500', '714000');
INSERT INTO `gwshop_area_china` VALUES ('610521', '4', '华县', '610500', '714100');
INSERT INTO `gwshop_area_china` VALUES ('610522', '4', '潼关县', '610500', '714300');
INSERT INTO `gwshop_area_china` VALUES ('610523', '4', '大荔县', '610500', '715100');
INSERT INTO `gwshop_area_china` VALUES ('610524', '4', '合阳县', '610500', '715300');
INSERT INTO `gwshop_area_china` VALUES ('610525', '4', '澄城县', '610500', '715200');
INSERT INTO `gwshop_area_china` VALUES ('610526', '4', '蒲城县', '610500', '715500');
INSERT INTO `gwshop_area_china` VALUES ('610527', '4', '白水县', '610500', '715600');
INSERT INTO `gwshop_area_china` VALUES ('610528', '4', '富平县', '610500', '711700');
INSERT INTO `gwshop_area_china` VALUES ('610581', '4', '韩城市', '610500', '715400');
INSERT INTO `gwshop_area_china` VALUES ('610582', '4', '华阴市', '610500', '714200');
INSERT INTO `gwshop_area_china` VALUES ('610583', '4', '其它区', '610500', '');
INSERT INTO `gwshop_area_china` VALUES ('610600', '3', '延安市', '610000', '716000');
INSERT INTO `gwshop_area_china` VALUES ('610602', '4', '宝塔区', '610600', '716000');
INSERT INTO `gwshop_area_china` VALUES ('610621', '4', '延长县', '610600', '717100');
INSERT INTO `gwshop_area_china` VALUES ('610622', '4', '延川县', '610600', '717200');
INSERT INTO `gwshop_area_china` VALUES ('610623', '4', '子长县', '610600', '717300');
INSERT INTO `gwshop_area_china` VALUES ('610624', '4', '安塞县', '610600', '717400');
INSERT INTO `gwshop_area_china` VALUES ('610625', '4', '志丹县', '610600', '717500');
INSERT INTO `gwshop_area_china` VALUES ('610626', '4', '吴起县', '610600', '717600');
INSERT INTO `gwshop_area_china` VALUES ('610627', '4', '甘泉县', '610600', '716100');
INSERT INTO `gwshop_area_china` VALUES ('610628', '4', '富县', '610600', '727500');
INSERT INTO `gwshop_area_china` VALUES ('610629', '4', '洛川县', '610600', '727400');
INSERT INTO `gwshop_area_china` VALUES ('610630', '4', '宜川县', '610600', '716200');
INSERT INTO `gwshop_area_china` VALUES ('610631', '4', '黄龙县', '610600', '715700');
INSERT INTO `gwshop_area_china` VALUES ('610632', '4', '黄陵县', '610600', '727300');
INSERT INTO `gwshop_area_china` VALUES ('610633', '4', '其它区', '610600', '');
INSERT INTO `gwshop_area_china` VALUES ('610700', '3', '汉中市', '610000', '723000');
INSERT INTO `gwshop_area_china` VALUES ('610702', '4', '汉台区', '610700', '723000');
INSERT INTO `gwshop_area_china` VALUES ('610721', '4', '南郑县', '610700', '723100');
INSERT INTO `gwshop_area_china` VALUES ('610722', '4', '城固县', '610700', '723200');
INSERT INTO `gwshop_area_china` VALUES ('610723', '4', '洋县', '610700', '723300');
INSERT INTO `gwshop_area_china` VALUES ('610724', '4', '西乡县', '610700', '723500');
INSERT INTO `gwshop_area_china` VALUES ('610725', '4', '勉县', '610700', '724200');
INSERT INTO `gwshop_area_china` VALUES ('610726', '4', '宁强县', '610700', '724400');
INSERT INTO `gwshop_area_china` VALUES ('610727', '4', '略阳县', '610700', '724300');
INSERT INTO `gwshop_area_china` VALUES ('610728', '4', '镇巴县', '610700', '723600');
INSERT INTO `gwshop_area_china` VALUES ('610729', '4', '留坝县', '610700', '724100');
INSERT INTO `gwshop_area_china` VALUES ('610730', '4', '佛坪县', '610700', '723400');
INSERT INTO `gwshop_area_china` VALUES ('610731', '4', '其它区', '610700', '');
INSERT INTO `gwshop_area_china` VALUES ('610800', '3', '榆林市', '610000', '719000');
INSERT INTO `gwshop_area_china` VALUES ('610802', '4', '榆阳区', '610800', '719000');
INSERT INTO `gwshop_area_china` VALUES ('610821', '4', '神木县', '610800', '719300');
INSERT INTO `gwshop_area_china` VALUES ('610822', '4', '府谷县', '610800', '719400');
INSERT INTO `gwshop_area_china` VALUES ('610823', '4', '横山县', '610800', '719100');
INSERT INTO `gwshop_area_china` VALUES ('610824', '4', '靖边县', '610800', '718500');
INSERT INTO `gwshop_area_china` VALUES ('610825', '4', '定边县', '610800', '718600');
INSERT INTO `gwshop_area_china` VALUES ('610826', '4', '绥德县', '610800', '718000');
INSERT INTO `gwshop_area_china` VALUES ('610827', '4', '米脂县', '610800', '718100');
INSERT INTO `gwshop_area_china` VALUES ('610828', '4', '佳县', '610800', '719200');
INSERT INTO `gwshop_area_china` VALUES ('610829', '4', '吴堡县', '610800', '718200');
INSERT INTO `gwshop_area_china` VALUES ('610830', '4', '清涧县', '610800', '718300');
INSERT INTO `gwshop_area_china` VALUES ('610831', '4', '子洲县', '610800', '718400');
INSERT INTO `gwshop_area_china` VALUES ('610832', '4', '其它区', '610800', '');
INSERT INTO `gwshop_area_china` VALUES ('610900', '3', '安康市', '610000', '725000');
INSERT INTO `gwshop_area_china` VALUES ('610902', '4', '汉滨区', '610900', '725000');
INSERT INTO `gwshop_area_china` VALUES ('610921', '4', '汉阴县', '610900', '725100');
INSERT INTO `gwshop_area_china` VALUES ('610922', '4', '石泉县', '610900', '725200');
INSERT INTO `gwshop_area_china` VALUES ('610923', '4', '宁陕县', '610900', '711600');
INSERT INTO `gwshop_area_china` VALUES ('610924', '4', '紫阳县', '610900', '725300');
INSERT INTO `gwshop_area_china` VALUES ('610925', '4', '岚皋县', '610900', '725400');
INSERT INTO `gwshop_area_china` VALUES ('610926', '4', '平利县', '610900', '725500');
INSERT INTO `gwshop_area_china` VALUES ('610927', '4', '镇坪县', '610900', '725600');
INSERT INTO `gwshop_area_china` VALUES ('610928', '4', '旬阳县', '610900', '725700');
INSERT INTO `gwshop_area_china` VALUES ('610929', '4', '白河县', '610900', '725800');
INSERT INTO `gwshop_area_china` VALUES ('610930', '4', '其它区', '610900', '');
INSERT INTO `gwshop_area_china` VALUES ('611000', '3', '商洛市', '610000', '726000');
INSERT INTO `gwshop_area_china` VALUES ('611002', '4', '商州区', '611000', '726000');
INSERT INTO `gwshop_area_china` VALUES ('611021', '4', '洛南县', '611000', '726100');
INSERT INTO `gwshop_area_china` VALUES ('611022', '4', '丹凤县', '611000', '726200');
INSERT INTO `gwshop_area_china` VALUES ('611023', '4', '商南县', '611000', '726300');
INSERT INTO `gwshop_area_china` VALUES ('611024', '4', '山阳县', '611000', '726400');
INSERT INTO `gwshop_area_china` VALUES ('611025', '4', '镇安县', '611000', '711500');
INSERT INTO `gwshop_area_china` VALUES ('611026', '4', '柞水县', '611000', '711400');
INSERT INTO `gwshop_area_china` VALUES ('611027', '4', '其它区', '611000', '');
INSERT INTO `gwshop_area_china` VALUES ('620000', '2', '甘肃省', '1', '');
INSERT INTO `gwshop_area_china` VALUES ('620100', '3', '兰州市', '620000', '730000');
INSERT INTO `gwshop_area_china` VALUES ('620102', '4', '城关区', '620100', '730030');
INSERT INTO `gwshop_area_china` VALUES ('620103', '4', '七里河区', '620100', '730050');
INSERT INTO `gwshop_area_china` VALUES ('620104', '4', '西固区', '620100', '730060');
INSERT INTO `gwshop_area_china` VALUES ('620105', '4', '安宁区', '620100', '730070');
INSERT INTO `gwshop_area_china` VALUES ('620111', '4', '红古区', '620100', '730080');
INSERT INTO `gwshop_area_china` VALUES ('620121', '4', '永登县', '620100', '730300');
INSERT INTO `gwshop_area_china` VALUES ('620122', '4', '皋兰县', '620100', '730200');
INSERT INTO `gwshop_area_china` VALUES ('620123', '4', '榆中县', '620100', '730100');
INSERT INTO `gwshop_area_china` VALUES ('620124', '4', '其它区', '620100', '');
INSERT INTO `gwshop_area_china` VALUES ('620200', '3', '嘉峪关市', '620000', '735100');
INSERT INTO `gwshop_area_china` VALUES ('620300', '3', '金昌市', '620000', '737100');
INSERT INTO `gwshop_area_china` VALUES ('620302', '4', '金川区', '620300', '737103');
INSERT INTO `gwshop_area_china` VALUES ('620321', '4', '永昌县', '620300', '737200');
INSERT INTO `gwshop_area_china` VALUES ('620322', '4', '其它区', '620300', '');
INSERT INTO `gwshop_area_china` VALUES ('620400', '3', '白银市', '620000', '');
INSERT INTO `gwshop_area_china` VALUES ('620402', '4', '白银区', '620400', '730900');
INSERT INTO `gwshop_area_china` VALUES ('620403', '4', '平川区', '620400', '730910');
INSERT INTO `gwshop_area_china` VALUES ('620421', '4', '靖远县', '620400', '730600');
INSERT INTO `gwshop_area_china` VALUES ('620422', '4', '会宁县', '620400', '730700');
INSERT INTO `gwshop_area_china` VALUES ('620423', '4', '景泰县', '620400', '730400');
INSERT INTO `gwshop_area_china` VALUES ('620424', '4', '其它区', '620400', '');
INSERT INTO `gwshop_area_china` VALUES ('620500', '3', '天水市', '620000', '');
INSERT INTO `gwshop_area_china` VALUES ('620502', '4', '秦州区', '620500', '741000');
INSERT INTO `gwshop_area_china` VALUES ('620503', '4', '麦积区', '620500', '741020');
INSERT INTO `gwshop_area_china` VALUES ('620521', '4', '清水县', '620500', '741400');
INSERT INTO `gwshop_area_china` VALUES ('620522', '4', '秦安县', '620500', '741600');
INSERT INTO `gwshop_area_china` VALUES ('620523', '4', '甘谷县', '620500', '741200');
INSERT INTO `gwshop_area_china` VALUES ('620524', '4', '武山县', '620500', '741300');
INSERT INTO `gwshop_area_china` VALUES ('620525', '4', '张家川回族自治县', '620500', '741500');
INSERT INTO `gwshop_area_china` VALUES ('620526', '4', '其它区', '620500', '');
INSERT INTO `gwshop_area_china` VALUES ('620600', '3', '武威市', '620000', '733000');
INSERT INTO `gwshop_area_china` VALUES ('620602', '4', '凉州区', '620600', '733000');
INSERT INTO `gwshop_area_china` VALUES ('620621', '4', '民勤县', '620600', '733300');
INSERT INTO `gwshop_area_china` VALUES ('620622', '4', '古浪县', '620600', '733100');
INSERT INTO `gwshop_area_china` VALUES ('620623', '4', '天祝藏族自治县', '620600', '733200');
INSERT INTO `gwshop_area_china` VALUES ('620624', '4', '其它区', '620600', '');
INSERT INTO `gwshop_area_china` VALUES ('620700', '3', '张掖市', '620000', '734000');
INSERT INTO `gwshop_area_china` VALUES ('620702', '4', '甘州区', '620700', '734000');
INSERT INTO `gwshop_area_china` VALUES ('620721', '4', '肃南裕固族自治县', '620700', '734400');
INSERT INTO `gwshop_area_china` VALUES ('620722', '4', '民乐县', '620700', '734500');
INSERT INTO `gwshop_area_china` VALUES ('620723', '4', '临泽县', '620700', '734200');
INSERT INTO `gwshop_area_china` VALUES ('620724', '4', '高台县', '620700', '734300');
INSERT INTO `gwshop_area_china` VALUES ('620725', '4', '山丹县', '620700', '734100');
INSERT INTO `gwshop_area_china` VALUES ('620726', '4', '其它区', '620700', '');
INSERT INTO `gwshop_area_china` VALUES ('620800', '3', '平凉市', '620000', '744000');
INSERT INTO `gwshop_area_china` VALUES ('620802', '4', '崆峒区', '620800', '744000');
INSERT INTO `gwshop_area_china` VALUES ('620821', '4', '泾川县', '620800', '744300');
INSERT INTO `gwshop_area_china` VALUES ('620822', '4', '灵台县', '620800', '744400');
INSERT INTO `gwshop_area_china` VALUES ('620823', '4', '崇信县', '620800', '744200');
INSERT INTO `gwshop_area_china` VALUES ('620824', '4', '华亭县', '620800', '744100');
INSERT INTO `gwshop_area_china` VALUES ('620825', '4', '庄浪县', '620800', '744600');
INSERT INTO `gwshop_area_china` VALUES ('620826', '4', '静宁县', '620800', '743400');
INSERT INTO `gwshop_area_china` VALUES ('620827', '4', '其它区', '620800', '');
INSERT INTO `gwshop_area_china` VALUES ('620900', '3', '酒泉市', '620000', '735000');
INSERT INTO `gwshop_area_china` VALUES ('620902', '4', '肃州区', '620900', '735000');
INSERT INTO `gwshop_area_china` VALUES ('620921', '4', '金塔县', '620900', '735300');
INSERT INTO `gwshop_area_china` VALUES ('620922', '4', '安西县', '620900', '743000');
INSERT INTO `gwshop_area_china` VALUES ('620923', '4', '肃北蒙古族自治县', '620900', '736300');
INSERT INTO `gwshop_area_china` VALUES ('620924', '4', '阿克塞哈萨克族自治县', '620900', '736400');
INSERT INTO `gwshop_area_china` VALUES ('620981', '4', '玉门市', '620900', '735200');
INSERT INTO `gwshop_area_china` VALUES ('620982', '4', '敦煌市', '620900', '736200');
INSERT INTO `gwshop_area_china` VALUES ('620983', '4', '其它区', '620900', '');
INSERT INTO `gwshop_area_china` VALUES ('621000', '3', '庆阳市', '620000', '');
INSERT INTO `gwshop_area_china` VALUES ('621002', '4', '西峰区', '621000', '745000');
INSERT INTO `gwshop_area_china` VALUES ('621021', '4', '庆城县', '621000', '745100');
INSERT INTO `gwshop_area_china` VALUES ('621022', '4', '环县', '621000', '745700');
INSERT INTO `gwshop_area_china` VALUES ('621023', '4', '华池县', '621000', '745600');
INSERT INTO `gwshop_area_china` VALUES ('621024', '4', '合水县', '621000', '745400');
INSERT INTO `gwshop_area_china` VALUES ('621025', '4', '正宁县', '621000', '745300');
INSERT INTO `gwshop_area_china` VALUES ('621026', '4', '宁县', '621000', '745200');
INSERT INTO `gwshop_area_china` VALUES ('621027', '4', '镇原县', '621000', '744500');
INSERT INTO `gwshop_area_china` VALUES ('621028', '4', '其它区', '621000', '');
INSERT INTO `gwshop_area_china` VALUES ('621100', '3', '定西市', '620000', '743000');
INSERT INTO `gwshop_area_china` VALUES ('621102', '4', '安定区', '621100', '743000');
INSERT INTO `gwshop_area_china` VALUES ('621121', '4', '通渭县', '621100', '743300');
INSERT INTO `gwshop_area_china` VALUES ('621122', '4', '陇西县', '621100', '748100');
INSERT INTO `gwshop_area_china` VALUES ('621123', '4', '渭源县', '621100', '748200');
INSERT INTO `gwshop_area_china` VALUES ('621124', '4', '临洮县', '621100', '730500');
INSERT INTO `gwshop_area_china` VALUES ('621125', '4', '漳县', '621100', '748300');
INSERT INTO `gwshop_area_china` VALUES ('621126', '4', '岷县', '621100', '748400');
INSERT INTO `gwshop_area_china` VALUES ('621127', '4', '其它区', '621100', '');
INSERT INTO `gwshop_area_china` VALUES ('621200', '3', '陇南市', '620000', '');
INSERT INTO `gwshop_area_china` VALUES ('621202', '4', '武都区', '621200', '746000');
INSERT INTO `gwshop_area_china` VALUES ('621221', '4', '成县', '621200', '742500');
INSERT INTO `gwshop_area_china` VALUES ('621222', '4', '文县', '621200', '746400');
INSERT INTO `gwshop_area_china` VALUES ('621223', '4', '宕昌县', '621200', '748500');
INSERT INTO `gwshop_area_china` VALUES ('621224', '4', '康县', '621200', '746500');
INSERT INTO `gwshop_area_china` VALUES ('621225', '4', '西和县', '621200', '742100');
INSERT INTO `gwshop_area_china` VALUES ('621226', '4', '礼县', '621200', '742200');
INSERT INTO `gwshop_area_china` VALUES ('621227', '4', '徽县', '621200', '742300');
INSERT INTO `gwshop_area_china` VALUES ('621228', '4', '两当县', '621200', '742400');
INSERT INTO `gwshop_area_china` VALUES ('621229', '4', '其它区', '621200', '');
INSERT INTO `gwshop_area_china` VALUES ('622900', '3', '临夏回族自治州', '620000', '');
INSERT INTO `gwshop_area_china` VALUES ('622901', '4', '临夏市', '622900', '731100');
INSERT INTO `gwshop_area_china` VALUES ('622921', '4', '临夏县', '622900', '731800');
INSERT INTO `gwshop_area_china` VALUES ('622922', '4', '康乐县', '622900', '731500');
INSERT INTO `gwshop_area_china` VALUES ('622923', '4', '永靖县', '622900', '731600');
INSERT INTO `gwshop_area_china` VALUES ('622924', '4', '广河县', '622900', '731300');
INSERT INTO `gwshop_area_china` VALUES ('622925', '4', '和政县', '622900', '731200');
INSERT INTO `gwshop_area_china` VALUES ('622926', '4', '东乡族自治县', '622900', '731400');
INSERT INTO `gwshop_area_china` VALUES ('622927', '4', '积石山保安族东乡族撒拉族自治县', '622900', '731700');
INSERT INTO `gwshop_area_china` VALUES ('622928', '4', '其它区', '622900', '');
INSERT INTO `gwshop_area_china` VALUES ('623000', '3', '甘南藏族自治州', '620000', '747000');
INSERT INTO `gwshop_area_china` VALUES ('623001', '4', '合作市', '623000', '747000');
INSERT INTO `gwshop_area_china` VALUES ('623021', '4', '临潭县', '623000', '747500');
INSERT INTO `gwshop_area_china` VALUES ('623022', '4', '卓尼县', '623000', '747600');
INSERT INTO `gwshop_area_china` VALUES ('623023', '4', '舟曲县', '623000', '746300');
INSERT INTO `gwshop_area_china` VALUES ('623024', '4', '迭部县', '623000', '747400');
INSERT INTO `gwshop_area_china` VALUES ('623025', '4', '玛曲县', '623000', '747300');
INSERT INTO `gwshop_area_china` VALUES ('623026', '4', '碌曲县', '623000', '747200');
INSERT INTO `gwshop_area_china` VALUES ('623027', '4', '夏河县', '623000', '747100');
INSERT INTO `gwshop_area_china` VALUES ('623028', '4', '其它区', '623000', '');
INSERT INTO `gwshop_area_china` VALUES ('630000', '2', '青海省', '1', '');
INSERT INTO `gwshop_area_china` VALUES ('630100', '3', '西宁市', '630000', '810000');
INSERT INTO `gwshop_area_china` VALUES ('630102', '4', '城东区', '630100', '810000');
INSERT INTO `gwshop_area_china` VALUES ('630103', '4', '城中区', '630100', '810000');
INSERT INTO `gwshop_area_china` VALUES ('630104', '4', '城西区', '630100', '810001');
INSERT INTO `gwshop_area_china` VALUES ('630105', '4', '城北区', '630100', '810001');
INSERT INTO `gwshop_area_china` VALUES ('630121', '4', '大通回族土族自治县', '630100', '810100');
INSERT INTO `gwshop_area_china` VALUES ('630122', '4', '湟中县', '630100', '811600');
INSERT INTO `gwshop_area_china` VALUES ('630123', '4', '湟源县', '630100', '812100');
INSERT INTO `gwshop_area_china` VALUES ('630124', '4', '其它区', '630100', '');
INSERT INTO `gwshop_area_china` VALUES ('632100', '3', '海东地区', '630000', '');
INSERT INTO `gwshop_area_china` VALUES ('632121', '4', '平安县', '632100', '810600');
INSERT INTO `gwshop_area_china` VALUES ('632122', '4', '民和回族土族自治县', '632100', '810800');
INSERT INTO `gwshop_area_china` VALUES ('632123', '4', '乐都县', '632100', '810700');
INSERT INTO `gwshop_area_china` VALUES ('632126', '4', '互助土族自治县', '632100', '810500');
INSERT INTO `gwshop_area_china` VALUES ('632127', '4', '化隆回族自治县', '632100', '810900');
INSERT INTO `gwshop_area_china` VALUES ('632128', '4', '循化撒拉族自治县', '632100', '811100');
INSERT INTO `gwshop_area_china` VALUES ('632129', '4', '其它区', '632100', '');
INSERT INTO `gwshop_area_china` VALUES ('632200', '3', '海北藏族自治州', '630000', '');
INSERT INTO `gwshop_area_china` VALUES ('632221', '4', '门源回族自治县', '632200', '810300');
INSERT INTO `gwshop_area_china` VALUES ('632222', '4', '祁连县', '632200', '810400');
INSERT INTO `gwshop_area_china` VALUES ('632223', '4', '海晏县', '632200', '812200');
INSERT INTO `gwshop_area_china` VALUES ('632224', '4', '刚察县', '632200', '812300');
INSERT INTO `gwshop_area_china` VALUES ('632225', '4', '其它区', '632200', '');
INSERT INTO `gwshop_area_china` VALUES ('632300', '3', '黄南藏族自治州', '630000', '');
INSERT INTO `gwshop_area_china` VALUES ('632321', '4', '同仁县', '632300', '811300');
INSERT INTO `gwshop_area_china` VALUES ('632322', '4', '尖扎县', '632300', '811200');
INSERT INTO `gwshop_area_china` VALUES ('632323', '4', '泽库县', '632300', '811400');
INSERT INTO `gwshop_area_china` VALUES ('632324', '4', '河南蒙古族自治县', '632300', '811500');
INSERT INTO `gwshop_area_china` VALUES ('632325', '4', '其它区', '632300', '');
INSERT INTO `gwshop_area_china` VALUES ('632500', '3', '海南藏族自治州', '630000', '');
INSERT INTO `gwshop_area_china` VALUES ('632521', '4', '共和县', '632500', '813000');
INSERT INTO `gwshop_area_china` VALUES ('632522', '4', '同德县', '632500', '813200');
INSERT INTO `gwshop_area_china` VALUES ('632523', '4', '贵德县', '632500', '811700');
INSERT INTO `gwshop_area_china` VALUES ('632524', '4', '兴海县', '632500', '813300');
INSERT INTO `gwshop_area_china` VALUES ('632525', '4', '贵南县', '632500', '813100');
INSERT INTO `gwshop_area_china` VALUES ('632526', '4', '其它区', '632500', '');
INSERT INTO `gwshop_area_china` VALUES ('632600', '3', '果洛藏族自治州', '630000', '');
INSERT INTO `gwshop_area_china` VALUES ('632621', '4', '玛沁县', '632600', '814000');
INSERT INTO `gwshop_area_china` VALUES ('632622', '4', '班玛县', '632600', '814300');
INSERT INTO `gwshop_area_china` VALUES ('632623', '4', '甘德县', '632600', '814100');
INSERT INTO `gwshop_area_china` VALUES ('632624', '4', '达日县', '632600', '814200');
INSERT INTO `gwshop_area_china` VALUES ('632625', '4', '久治县', '632600', '624700');
INSERT INTO `gwshop_area_china` VALUES ('632626', '4', '玛多县', '632600', '813500');
INSERT INTO `gwshop_area_china` VALUES ('632627', '4', '其它区', '632600', '');
INSERT INTO `gwshop_area_china` VALUES ('632700', '3', '玉树藏族自治州', '630000', '');
INSERT INTO `gwshop_area_china` VALUES ('632721', '4', '玉树县', '632700', '815000');
INSERT INTO `gwshop_area_china` VALUES ('632722', '4', '杂多县', '632700', '815300');
INSERT INTO `gwshop_area_china` VALUES ('632723', '4', '称多县', '632700', '815100');
INSERT INTO `gwshop_area_china` VALUES ('632724', '4', '治多县', '632700', '815400');
INSERT INTO `gwshop_area_china` VALUES ('632725', '4', '囊谦县', '632700', '815200');
INSERT INTO `gwshop_area_china` VALUES ('632726', '4', '曲麻莱县', '632700', '815500');
INSERT INTO `gwshop_area_china` VALUES ('632727', '4', '其它区', '632700', '');
INSERT INTO `gwshop_area_china` VALUES ('632800', '3', '海西蒙古族藏族自治州', '630000', '');
INSERT INTO `gwshop_area_china` VALUES ('632801', '4', '格尔木市', '632800', '816000');
INSERT INTO `gwshop_area_china` VALUES ('632802', '4', '德令哈市', '632800', '817000');
INSERT INTO `gwshop_area_china` VALUES ('632821', '4', '乌兰县', '632800', '817100');
INSERT INTO `gwshop_area_china` VALUES ('632822', '4', '都兰县', '632800', '816100');
INSERT INTO `gwshop_area_china` VALUES ('632823', '4', '天峻县', '632800', '817200');
INSERT INTO `gwshop_area_china` VALUES ('632824', '4', '其它区', '632800', '');
INSERT INTO `gwshop_area_china` VALUES ('640000', '2', '宁夏回族自治区', '1', '');
INSERT INTO `gwshop_area_china` VALUES ('640100', '3', '银川市', '640000', '750000');
INSERT INTO `gwshop_area_china` VALUES ('640104', '4', '兴庆区', '640100', '750001');
INSERT INTO `gwshop_area_china` VALUES ('640105', '4', '西夏区', '640100', '750027');
INSERT INTO `gwshop_area_china` VALUES ('640106', '4', '金凤区', '640100', '750011');
INSERT INTO `gwshop_area_china` VALUES ('640121', '4', '永宁县', '640100', '750100');
INSERT INTO `gwshop_area_china` VALUES ('640122', '4', '贺兰县', '640100', '750200');
INSERT INTO `gwshop_area_china` VALUES ('640181', '4', '灵武市', '640100', '751400');
INSERT INTO `gwshop_area_china` VALUES ('640182', '4', '其它区', '640100', '');
INSERT INTO `gwshop_area_china` VALUES ('640200', '3', '石嘴山市', '640000', '');
INSERT INTO `gwshop_area_china` VALUES ('640202', '4', '大武口区', '640200', '753000');
INSERT INTO `gwshop_area_china` VALUES ('640205', '4', '惠农区', '640200', '753200');
INSERT INTO `gwshop_area_china` VALUES ('640221', '4', '平罗县', '640200', '753400');
INSERT INTO `gwshop_area_china` VALUES ('640222', '4', '其它区', '640200', '');
INSERT INTO `gwshop_area_china` VALUES ('640300', '3', '吴忠市', '640000', '751100');
INSERT INTO `gwshop_area_china` VALUES ('640302', '4', '利通区', '640300', '751100');
INSERT INTO `gwshop_area_china` VALUES ('640303', '4', '红寺堡区', '640300', '751900');
INSERT INTO `gwshop_area_china` VALUES ('640323', '4', '盐池县', '640300', '751500');
INSERT INTO `gwshop_area_china` VALUES ('640324', '4', '同心县', '640300', '751300');
INSERT INTO `gwshop_area_china` VALUES ('640381', '4', '青铜峡市', '640300', '751600');
INSERT INTO `gwshop_area_china` VALUES ('640382', '4', '其它区', '640300', '');
INSERT INTO `gwshop_area_china` VALUES ('640400', '3', '固原市', '640000', '756000');
INSERT INTO `gwshop_area_china` VALUES ('640402', '4', '原州区', '640400', '756000');
INSERT INTO `gwshop_area_china` VALUES ('640422', '4', '西吉县', '640400', '756200');
INSERT INTO `gwshop_area_china` VALUES ('640423', '4', '隆德县', '640400', '756300');
INSERT INTO `gwshop_area_china` VALUES ('640424', '4', '泾源县', '640400', '756400');
INSERT INTO `gwshop_area_china` VALUES ('640425', '4', '彭阳县', '640400', '756500');
INSERT INTO `gwshop_area_china` VALUES ('640426', '4', '其它区', '640400', '');
INSERT INTO `gwshop_area_china` VALUES ('640500', '3', '中卫市', '640000', '');
INSERT INTO `gwshop_area_china` VALUES ('640502', '4', '沙坡头区', '640500', '751700');
INSERT INTO `gwshop_area_china` VALUES ('640521', '4', '中宁县', '640500', '751200');
INSERT INTO `gwshop_area_china` VALUES ('640522', '4', '海原县', '640500', '756100');
INSERT INTO `gwshop_area_china` VALUES ('640523', '4', '其它区', '640500', '');
INSERT INTO `gwshop_area_china` VALUES ('650000', '2', '新疆维吾尔自治区', '1', '');
INSERT INTO `gwshop_area_china` VALUES ('650100', '3', '乌鲁木齐市', '650000', '830000');
INSERT INTO `gwshop_area_china` VALUES ('650102', '4', '天山区', '650100', '830002');
INSERT INTO `gwshop_area_china` VALUES ('650103', '4', '沙依巴克区', '650100', '830000');
INSERT INTO `gwshop_area_china` VALUES ('650104', '4', '新市区', '650100', '830011');
INSERT INTO `gwshop_area_china` VALUES ('650105', '4', '水磨沟区', '650100', '830017');
INSERT INTO `gwshop_area_china` VALUES ('650106', '4', '头屯河区', '650100', '830023');
INSERT INTO `gwshop_area_china` VALUES ('650107', '4', '达坂城区', '650100', '830039');
INSERT INTO `gwshop_area_china` VALUES ('650108', '4', '东山区', '650100', '830019');
INSERT INTO `gwshop_area_china` VALUES ('650109', '4', '米东区', '650100', '831400');
INSERT INTO `gwshop_area_china` VALUES ('650121', '4', '乌鲁木齐县', '650100', '830063');
INSERT INTO `gwshop_area_china` VALUES ('650122', '4', '其它区', '650100', '');
INSERT INTO `gwshop_area_china` VALUES ('650200', '3', '克拉玛依市', '650000', '834000');
INSERT INTO `gwshop_area_china` VALUES ('650202', '4', '独山子区', '650200', '838600');
INSERT INTO `gwshop_area_china` VALUES ('650203', '4', '克拉玛依区', '650200', '834000');
INSERT INTO `gwshop_area_china` VALUES ('650204', '4', '白碱滩区', '650200', '834009');
INSERT INTO `gwshop_area_china` VALUES ('650205', '4', '乌尔禾区', '650200', '834014');
INSERT INTO `gwshop_area_china` VALUES ('650206', '4', '其它区', '650200', '');
INSERT INTO `gwshop_area_china` VALUES ('652100', '3', '吐鲁番地区', '650000', '838000');
INSERT INTO `gwshop_area_china` VALUES ('652101', '4', '吐鲁番市', '652100', '838000');
INSERT INTO `gwshop_area_china` VALUES ('652122', '4', '鄯善县', '652100', '838200');
INSERT INTO `gwshop_area_china` VALUES ('652123', '4', '托克逊县', '652100', '838100');
INSERT INTO `gwshop_area_china` VALUES ('652124', '4', '其它区', '652100', '');
INSERT INTO `gwshop_area_china` VALUES ('652200', '3', '哈密地区', '650000', '839000');
INSERT INTO `gwshop_area_china` VALUES ('652201', '4', '哈密市', '652200', '839000');
INSERT INTO `gwshop_area_china` VALUES ('652222', '4', '巴里坤哈萨克自治县', '652200', '839200');
INSERT INTO `gwshop_area_china` VALUES ('652223', '4', '伊吾县', '652200', '839300');
INSERT INTO `gwshop_area_china` VALUES ('652224', '4', '其它区', '652200', '');
INSERT INTO `gwshop_area_china` VALUES ('652300', '3', '昌吉回族自治州', '650000', '831100');
INSERT INTO `gwshop_area_china` VALUES ('652301', '4', '昌吉市', '652300', '831100');
INSERT INTO `gwshop_area_china` VALUES ('652302', '4', '阜康市', '652300', '831500');
INSERT INTO `gwshop_area_china` VALUES ('652303', '4', '米泉市', '652300', '831400');
INSERT INTO `gwshop_area_china` VALUES ('652323', '4', '呼图壁县', '652300', '831200');
INSERT INTO `gwshop_area_china` VALUES ('652324', '4', '玛纳斯县', '652300', '832200');
INSERT INTO `gwshop_area_china` VALUES ('652325', '4', '奇台县', '652300', '831800');
INSERT INTO `gwshop_area_china` VALUES ('652327', '4', '吉木萨尔县', '652300', '831700');
INSERT INTO `gwshop_area_china` VALUES ('652328', '4', '木垒哈萨克自治县', '652300', '831900');
INSERT INTO `gwshop_area_china` VALUES ('652329', '4', '其它区', '652300', '');
INSERT INTO `gwshop_area_china` VALUES ('652700', '3', '博尔塔拉蒙古自治州', '650000', '833400');
INSERT INTO `gwshop_area_china` VALUES ('652701', '4', '博乐市', '652700', '833400');
INSERT INTO `gwshop_area_china` VALUES ('652722', '4', '精河县', '652700', '833300');
INSERT INTO `gwshop_area_china` VALUES ('652723', '4', '温泉县', '652700', '833500');
INSERT INTO `gwshop_area_china` VALUES ('652724', '4', '其它区', '652700', '');
INSERT INTO `gwshop_area_china` VALUES ('652800', '3', '巴音郭楞蒙古自治州', '650000', '841000');
INSERT INTO `gwshop_area_china` VALUES ('652801', '4', '库尔勒市', '652800', '841000');
INSERT INTO `gwshop_area_china` VALUES ('652822', '4', '轮台县', '652800', '841600');
INSERT INTO `gwshop_area_china` VALUES ('652823', '4', '尉犁县', '652800', '841500');
INSERT INTO `gwshop_area_china` VALUES ('652824', '4', '若羌县', '652800', '841800');
INSERT INTO `gwshop_area_china` VALUES ('652825', '4', '且末县', '652800', '841900');
INSERT INTO `gwshop_area_china` VALUES ('652826', '4', '焉耆回族自治县', '652800', '841100');
INSERT INTO `gwshop_area_china` VALUES ('652827', '4', '和静县', '652800', '841300');
INSERT INTO `gwshop_area_china` VALUES ('652828', '4', '和硕县', '652800', '841200');
INSERT INTO `gwshop_area_china` VALUES ('652829', '4', '博湖县', '652800', '841400');
INSERT INTO `gwshop_area_china` VALUES ('652830', '4', '其它区', '652800', '');
INSERT INTO `gwshop_area_china` VALUES ('652900', '3', '阿克苏地区', '650000', '843000');
INSERT INTO `gwshop_area_china` VALUES ('652901', '4', '阿克苏市', '652900', '843000');
INSERT INTO `gwshop_area_china` VALUES ('652922', '4', '温宿县', '652900', '843100');
INSERT INTO `gwshop_area_china` VALUES ('652923', '4', '库车县', '652900', '842000');
INSERT INTO `gwshop_area_china` VALUES ('652924', '4', '沙雅县', '652900', '842200');
INSERT INTO `gwshop_area_china` VALUES ('652925', '4', '新和县', '652900', '842100');
INSERT INTO `gwshop_area_china` VALUES ('652926', '4', '拜城县', '652900', '842300');
INSERT INTO `gwshop_area_china` VALUES ('652927', '4', '乌什县', '652900', '843400');
INSERT INTO `gwshop_area_china` VALUES ('652928', '4', '阿瓦提县', '652900', '843200');
INSERT INTO `gwshop_area_china` VALUES ('652929', '4', '柯坪县', '652900', '843600');
INSERT INTO `gwshop_area_china` VALUES ('652930', '4', '其它区', '652900', '');
INSERT INTO `gwshop_area_china` VALUES ('653000', '3', '克孜勒苏柯尔克孜自治州', '650000', '845350');
INSERT INTO `gwshop_area_china` VALUES ('653001', '4', '阿图什市', '653000', '845350');
INSERT INTO `gwshop_area_china` VALUES ('653022', '4', '阿克陶县', '653000', '845550');
INSERT INTO `gwshop_area_china` VALUES ('653023', '4', '阿合奇县', '653000', '843500');
INSERT INTO `gwshop_area_china` VALUES ('653024', '4', '乌恰县', '653000', '845450');
INSERT INTO `gwshop_area_china` VALUES ('653025', '4', '其它区', '653000', '');
INSERT INTO `gwshop_area_china` VALUES ('653100', '3', '喀什地区', '650000', '844000');
INSERT INTO `gwshop_area_china` VALUES ('653101', '4', '喀什市', '653100', '844000');
INSERT INTO `gwshop_area_china` VALUES ('653121', '4', '疏附县', '653100', '844100');
INSERT INTO `gwshop_area_china` VALUES ('653122', '4', '疏勒县', '653100', '844200');
INSERT INTO `gwshop_area_china` VALUES ('653123', '4', '英吉沙县', '653100', '844500');
INSERT INTO `gwshop_area_china` VALUES ('653124', '4', '泽普县', '653100', '844800');
INSERT INTO `gwshop_area_china` VALUES ('653125', '4', '莎车县', '653100', '844700');
INSERT INTO `gwshop_area_china` VALUES ('653126', '4', '叶城县', '653100', '844900');
INSERT INTO `gwshop_area_china` VALUES ('653127', '4', '麦盖提县', '653100', '844600');
INSERT INTO `gwshop_area_china` VALUES ('653128', '4', '岳普湖县', '653100', '844400');
INSERT INTO `gwshop_area_china` VALUES ('653129', '4', '伽师县', '653100', '844300');
INSERT INTO `gwshop_area_china` VALUES ('653130', '4', '巴楚县', '653100', '843800');
INSERT INTO `gwshop_area_china` VALUES ('653131', '4', '塔什库尔干塔吉克自治县', '653100', '845250');
INSERT INTO `gwshop_area_china` VALUES ('653132', '4', '其它区', '653100', '');
INSERT INTO `gwshop_area_china` VALUES ('653200', '3', '和田地区', '650000', '848000');
INSERT INTO `gwshop_area_china` VALUES ('653201', '4', '和田市', '653200', '848000');
INSERT INTO `gwshop_area_china` VALUES ('653221', '4', '和田县', '653200', '848000');
INSERT INTO `gwshop_area_china` VALUES ('653222', '4', '墨玉县', '653200', '848100');
INSERT INTO `gwshop_area_china` VALUES ('653223', '4', '皮山县', '653200', '845150');
INSERT INTO `gwshop_area_china` VALUES ('653224', '4', '洛浦县', '653200', '848200');
INSERT INTO `gwshop_area_china` VALUES ('653225', '4', '策勒县', '653200', '848300');
INSERT INTO `gwshop_area_china` VALUES ('653226', '4', '于田县', '653200', '848400');
INSERT INTO `gwshop_area_china` VALUES ('653227', '4', '民丰县', '653200', '848500');
INSERT INTO `gwshop_area_china` VALUES ('653228', '4', '其它区', '653200', '');
INSERT INTO `gwshop_area_china` VALUES ('654000', '3', '伊犁哈萨克自治州', '650000', '835000');
INSERT INTO `gwshop_area_china` VALUES ('654002', '4', '伊宁市', '654000', '835000');
INSERT INTO `gwshop_area_china` VALUES ('654003', '4', '奎屯市', '654000', '833200');
INSERT INTO `gwshop_area_china` VALUES ('654021', '4', '伊宁县', '654000', '835100');
INSERT INTO `gwshop_area_china` VALUES ('654022', '4', '察布查尔锡伯自治县', '654000', '835300');
INSERT INTO `gwshop_area_china` VALUES ('654023', '4', '霍城县', '654000', '835200');
INSERT INTO `gwshop_area_china` VALUES ('654024', '4', '巩留县', '654000', '835400');
INSERT INTO `gwshop_area_china` VALUES ('654025', '4', '新源县', '654000', '835800');
INSERT INTO `gwshop_area_china` VALUES ('654026', '4', '昭苏县', '654000', '835600');
INSERT INTO `gwshop_area_china` VALUES ('654027', '4', '特克斯县', '654000', '835500');
INSERT INTO `gwshop_area_china` VALUES ('654028', '4', '尼勒克县', '654000', '835700');
INSERT INTO `gwshop_area_china` VALUES ('654029', '4', '其它区', '654000', '');
INSERT INTO `gwshop_area_china` VALUES ('654200', '3', '塔城地区', '650000', '834700');
INSERT INTO `gwshop_area_china` VALUES ('654201', '4', '塔城市', '654200', '834700');
INSERT INTO `gwshop_area_china` VALUES ('654202', '4', '乌苏市', '654200', '833000');
INSERT INTO `gwshop_area_china` VALUES ('654221', '4', '额敏县', '654200', '834600');
INSERT INTO `gwshop_area_china` VALUES ('654223', '4', '沙湾县', '654200', '832100');
INSERT INTO `gwshop_area_china` VALUES ('654224', '4', '托里县', '654200', '834500');
INSERT INTO `gwshop_area_china` VALUES ('654225', '4', '裕民县', '654200', '834800');
INSERT INTO `gwshop_area_china` VALUES ('654226', '4', '和布克赛尔蒙古自治县', '654200', '834400');
INSERT INTO `gwshop_area_china` VALUES ('654227', '4', '其它区', '654200', '');
INSERT INTO `gwshop_area_china` VALUES ('654300', '3', '阿勒泰地区', '650000', '836500');
INSERT INTO `gwshop_area_china` VALUES ('654301', '4', '阿勒泰市', '654300', '836500');
INSERT INTO `gwshop_area_china` VALUES ('654321', '4', '布尔津县', '654300', '836600');
INSERT INTO `gwshop_area_china` VALUES ('654322', '4', '富蕴县', '654300', '836100');
INSERT INTO `gwshop_area_china` VALUES ('654323', '4', '福海县', '654300', '836400');
INSERT INTO `gwshop_area_china` VALUES ('654324', '4', '哈巴河县', '654300', '836700');
INSERT INTO `gwshop_area_china` VALUES ('654325', '4', '青河县', '654300', '836200');
INSERT INTO `gwshop_area_china` VALUES ('654326', '4', '吉木乃县', '654300', '836800');
INSERT INTO `gwshop_area_china` VALUES ('654327', '4', '其它区', '654300', '');
INSERT INTO `gwshop_area_china` VALUES ('659001', '4', '石河子市', '650000', '832000');
INSERT INTO `gwshop_area_china` VALUES ('659002', '4', '阿拉尔市', '650000', '843300');
INSERT INTO `gwshop_area_china` VALUES ('659003', '4', '图木舒克市', '650000', '843806');
INSERT INTO `gwshop_area_china` VALUES ('659004', '4', '五家渠市', '650000', '831300');
INSERT INTO `gwshop_area_china` VALUES ('710000', '2', '台湾省', '1', '');
INSERT INTO `gwshop_area_china` VALUES ('710100', '3', '台北市', '710000', '');
INSERT INTO `gwshop_area_china` VALUES ('710101', '4', '中正区', '710100', '100');
INSERT INTO `gwshop_area_china` VALUES ('710102', '4', '大同区', '710100', '103');
INSERT INTO `gwshop_area_china` VALUES ('710103', '4', '中山区', '710100', '104');
INSERT INTO `gwshop_area_china` VALUES ('710104', '4', '松山区', '710100', '105');
INSERT INTO `gwshop_area_china` VALUES ('710105', '4', '大安区', '710100', '106');
INSERT INTO `gwshop_area_china` VALUES ('710106', '4', '万华区', '710100', '108');
INSERT INTO `gwshop_area_china` VALUES ('710107', '4', '信义区', '710100', '110');
INSERT INTO `gwshop_area_china` VALUES ('710108', '4', '士林区', '710100', '111');
INSERT INTO `gwshop_area_china` VALUES ('710109', '4', '北投区', '710100', '112');
INSERT INTO `gwshop_area_china` VALUES ('710110', '4', '内湖区', '710100', '114');
INSERT INTO `gwshop_area_china` VALUES ('710111', '4', '南港区', '710100', '115');
INSERT INTO `gwshop_area_china` VALUES ('710112', '4', '文山区', '710100', '116');
INSERT INTO `gwshop_area_china` VALUES ('710113', '4', '其它区', '710100', '');
INSERT INTO `gwshop_area_china` VALUES ('710200', '3', '高雄市', '710000', '');
INSERT INTO `gwshop_area_china` VALUES ('710201', '4', '新兴区', '710200', '800');
INSERT INTO `gwshop_area_china` VALUES ('710202', '4', '前金区', '710200', '801');
INSERT INTO `gwshop_area_china` VALUES ('710203', '4', '芩雅区', '710200', '802');
INSERT INTO `gwshop_area_china` VALUES ('710204', '4', '盐埕区', '710200', '803');
INSERT INTO `gwshop_area_china` VALUES ('710205', '4', '鼓山区', '710200', '804');
INSERT INTO `gwshop_area_china` VALUES ('710206', '4', '旗津区', '710200', '805');
INSERT INTO `gwshop_area_china` VALUES ('710207', '4', '前镇区', '710200', '806');
INSERT INTO `gwshop_area_china` VALUES ('710208', '4', '三民区', '710200', '807');
INSERT INTO `gwshop_area_china` VALUES ('710209', '4', '左营区', '710200', '813');
INSERT INTO `gwshop_area_china` VALUES ('710210', '4', '楠梓区', '710200', '811');
INSERT INTO `gwshop_area_china` VALUES ('710211', '4', '小港区', '710200', '812');
INSERT INTO `gwshop_area_china` VALUES ('710212', '4', '其它区', '710200', '');
INSERT INTO `gwshop_area_china` VALUES ('710300', '3', '台南市', '710000', '');
INSERT INTO `gwshop_area_china` VALUES ('710301', '4', '中西区', '710300', '703');
INSERT INTO `gwshop_area_china` VALUES ('710302', '4', '东区', '710300', '701');
INSERT INTO `gwshop_area_china` VALUES ('710303', '4', '南区', '710300', '702');
INSERT INTO `gwshop_area_china` VALUES ('710304', '4', '北区', '710300', '704');
INSERT INTO `gwshop_area_china` VALUES ('710305', '4', '安平区', '710300', '708');
INSERT INTO `gwshop_area_china` VALUES ('710306', '4', '安南区', '710300', '709');
INSERT INTO `gwshop_area_china` VALUES ('710307', '4', '其它区', '710300', '');
INSERT INTO `gwshop_area_china` VALUES ('710400', '3', '台中市', '710000', '');
INSERT INTO `gwshop_area_china` VALUES ('710401', '4', '中区', '710400', '400');
INSERT INTO `gwshop_area_china` VALUES ('710402', '4', '东区', '710400', '401');
INSERT INTO `gwshop_area_china` VALUES ('710403', '4', '南区', '710400', '402');
INSERT INTO `gwshop_area_china` VALUES ('710404', '4', '西区', '710400', '403');
INSERT INTO `gwshop_area_china` VALUES ('710405', '4', '北区', '710400', '404');
INSERT INTO `gwshop_area_china` VALUES ('710406', '4', '北屯区', '710400', '406');
INSERT INTO `gwshop_area_china` VALUES ('710407', '4', '西屯区', '710400', '407');
INSERT INTO `gwshop_area_china` VALUES ('710408', '4', '南屯区', '710400', '408');
INSERT INTO `gwshop_area_china` VALUES ('710409', '4', '其它区', '710400', '');
INSERT INTO `gwshop_area_china` VALUES ('710500', '3', '金门县', '710000', '');
INSERT INTO `gwshop_area_china` VALUES ('710600', '3', '南投县', '710000', '');
INSERT INTO `gwshop_area_china` VALUES ('710700', '3', '基隆市', '710000', '');
INSERT INTO `gwshop_area_china` VALUES ('710701', '4', '仁爱区', '710700', '200');
INSERT INTO `gwshop_area_china` VALUES ('710702', '4', '信义区', '710700', '201');
INSERT INTO `gwshop_area_china` VALUES ('710703', '4', '中正区', '710700', '202');
INSERT INTO `gwshop_area_china` VALUES ('710704', '4', '中山区', '710700', '203');
INSERT INTO `gwshop_area_china` VALUES ('710705', '4', '安乐区', '710700', '204');
INSERT INTO `gwshop_area_china` VALUES ('710706', '4', '暖暖区', '710700', '205');
INSERT INTO `gwshop_area_china` VALUES ('710707', '4', '七堵区', '710700', '206');
INSERT INTO `gwshop_area_china` VALUES ('710708', '4', '其它区', '710700', '');
INSERT INTO `gwshop_area_china` VALUES ('710800', '3', '新竹市', '710000', '');
INSERT INTO `gwshop_area_china` VALUES ('710801', '4', '东区', '710800', '');
INSERT INTO `gwshop_area_china` VALUES ('710802', '4', '北区', '710800', '');
INSERT INTO `gwshop_area_china` VALUES ('710803', '4', '香山区', '710800', '');
INSERT INTO `gwshop_area_china` VALUES ('710804', '4', '其它区', '710800', '');
INSERT INTO `gwshop_area_china` VALUES ('710900', '3', '嘉义市', '710000', '');
INSERT INTO `gwshop_area_china` VALUES ('710901', '4', '东区', '710900', '');
INSERT INTO `gwshop_area_china` VALUES ('710902', '4', '西区', '710900', '');
INSERT INTO `gwshop_area_china` VALUES ('710903', '4', '其它区', '710900', '');
INSERT INTO `gwshop_area_china` VALUES ('711100', '4', '新北市', '710000', '');
INSERT INTO `gwshop_area_china` VALUES ('711200', '4', '宜兰县', '710000', '');
INSERT INTO `gwshop_area_china` VALUES ('711300', '4', '新竹县', '710000', '');
INSERT INTO `gwshop_area_china` VALUES ('711400', '4', '桃园县', '710000', '');
INSERT INTO `gwshop_area_china` VALUES ('711500', '4', '苗栗县', '710000', '');
INSERT INTO `gwshop_area_china` VALUES ('711700', '4', '彰化县', '710000', '');
INSERT INTO `gwshop_area_china` VALUES ('711900', '4', '嘉义县', '710000', '');
INSERT INTO `gwshop_area_china` VALUES ('712100', '4', '云林县', '710000', '');
INSERT INTO `gwshop_area_china` VALUES ('712400', '4', '屏东县', '710000', '');
INSERT INTO `gwshop_area_china` VALUES ('712500', '4', '台东县', '710000', '');
INSERT INTO `gwshop_area_china` VALUES ('712600', '4', '花莲县', '710000', '');
INSERT INTO `gwshop_area_china` VALUES ('712700', '4', '澎湖县', '710000', '');
INSERT INTO `gwshop_area_china` VALUES ('810000', '2', '香港特别行政区', '1', '');
INSERT INTO `gwshop_area_china` VALUES ('810100', '3', '香港岛', '810000', '');
INSERT INTO `gwshop_area_china` VALUES ('810101', '4', '中西区', '810100', '810101');
INSERT INTO `gwshop_area_china` VALUES ('810102', '4', '湾仔', '810100', '810102');
INSERT INTO `gwshop_area_china` VALUES ('810103', '4', '东区', '810100', '810103');
INSERT INTO `gwshop_area_china` VALUES ('810104', '4', '南区', '810100', '810104');
INSERT INTO `gwshop_area_china` VALUES ('810200', '3', '九龙', '810000', '');
INSERT INTO `gwshop_area_china` VALUES ('810201', '4', '九龙城区', '810200', '810201');
INSERT INTO `gwshop_area_china` VALUES ('810202', '4', '油尖旺区', '810200', '810202');
INSERT INTO `gwshop_area_china` VALUES ('810203', '4', '深水埗区', '810200', '810203');
INSERT INTO `gwshop_area_china` VALUES ('810204', '4', '黄大仙区', '810200', '810204');
INSERT INTO `gwshop_area_china` VALUES ('810205', '4', '观塘区', '810200', '810205');
INSERT INTO `gwshop_area_china` VALUES ('810300', '3', '新界', '810000', '');
INSERT INTO `gwshop_area_china` VALUES ('810301', '4', '北区', '810300', '810301');
INSERT INTO `gwshop_area_china` VALUES ('810302', '4', '大埔区', '810300', '810302');
INSERT INTO `gwshop_area_china` VALUES ('810303', '4', '沙田区', '810300', '810303');
INSERT INTO `gwshop_area_china` VALUES ('810304', '4', '西贡区', '810300', '810304');
INSERT INTO `gwshop_area_china` VALUES ('810305', '4', '元朗区', '810300', '810305');
INSERT INTO `gwshop_area_china` VALUES ('810306', '4', '屯门区', '810300', '810306');
INSERT INTO `gwshop_area_china` VALUES ('810307', '4', '荃湾区', '810300', '810307');
INSERT INTO `gwshop_area_china` VALUES ('810308', '4', '葵青区', '810300', '810308');
INSERT INTO `gwshop_area_china` VALUES ('810309', '4', '离岛区', '810300', '810309');
INSERT INTO `gwshop_area_china` VALUES ('820000', '2', '澳门特别行政区', '1', '');
INSERT INTO `gwshop_area_china` VALUES ('820100', '3', '澳门半岛', '820000', '');
INSERT INTO `gwshop_area_china` VALUES ('820200', '3', '离岛', '820000', '');
INSERT INTO `gwshop_area_china` VALUES ('1032697', '4', '光明新区', '440300', '518107');
INSERT INTO `gwshop_area_china` VALUES ('1032698', '4', '坪山新区', '440300', '518118');
INSERT INTO `gwshop_area_china` VALUES ('1032699', '4', '大鹏新区', '440300', '518108');
INSERT INTO `gwshop_area_china` VALUES ('1032700', '4', '龙华新区', '440300', '518131');

-- ----------------------------
-- Table structure for gwshop_article
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_article`;
CREATE TABLE `gwshop_article` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `title` varchar(150) NOT NULL COMMENT '文章题目',
  `content` longtext NOT NULL COMMENT '文章内容',
  `author` varchar(30) NOT NULL COMMENT '文章作者',
  `keywords` varchar(255) NOT NULL COMMENT '文章的关键字',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章添加时间',
  `cat_id` smallint(5) NOT NULL DEFAULT '0' COMMENT '列别id',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `publish_time` int(11) NOT NULL DEFAULT '0' COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='文章内容表';

-- ----------------------------
-- Records of gwshop_article
-- ----------------------------
INSERT INTO `gwshop_article` VALUES ('1', '公司介绍', '公司介绍公司介绍公司介绍公司介绍公司介绍', '', '', '1486051200', '2', '0', '0');
INSERT INTO `gwshop_article` VALUES ('2', '企业文化', '&lt;p&gt;				&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;企业文化企业文化企业文化企业文化企业文化				 &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/p&gt;', '', '', '1486051200', '2', '1', '1486051200');
INSERT INTO `gwshop_article` VALUES ('3', '购物流程', '&lt;p&gt;				&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;购物流程购物流程购物流程购物流程购物流程				 &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/p&gt;', '', '', '1486051200', '3', '1', '1483632000');
INSERT INTO `gwshop_article` VALUES ('4', 'aaa', '&lt;p&gt;aaaaa&lt;img src=&quot;/Public/upload/article/2016/08-09/57a9925372e16.jpg&quot; title=&quot;QQ截图20160804134146.jpg&quot;/&gt;&lt;/p&gt;', '', 'aaa', '1470730838', '3', '1', '1470758400');

-- ----------------------------
-- Table structure for gwshop_article_cat
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_article_cat`;
CREATE TABLE `gwshop_article_cat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `cat_name` varchar(20) NOT NULL DEFAULT '' COMMENT '类别名称',
  `cat_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'cat_type',
  `parent_id` smallint(6) NOT NULL DEFAULT '0' COMMENT '父级ID',
  `show_in_nav` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否导航显示',
  `sort_order` smallint(6) NOT NULL DEFAULT '50' COMMENT '排序',
  `cat_desc` varchar(255) NOT NULL COMMENT '分类描述',
  `keywords` varchar(30) NOT NULL COMMENT '搜索关键词',
  `cat_alias` varchar(20) NOT NULL COMMENT '别名',
  `level` smallint(1) DEFAULT '1' COMMENT '级别',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gwshop_article_cat
-- ----------------------------
INSERT INTO `gwshop_article_cat` VALUES ('2', '关于广为', '', '0', '1', '50', '', '', '', '1');
INSERT INTO `gwshop_article_cat` VALUES ('3', '购物指南', '', '0', '1', '50', '', '', '', '1');
INSERT INTO `gwshop_article_cat` VALUES ('4', '配送方式', '', '0', '1', '50', '', '', '', '1');
INSERT INTO `gwshop_article_cat` VALUES ('5', '支付方式', '', '0', '1', '50', '', '', '', '1');
INSERT INTO `gwshop_article_cat` VALUES ('6', 'aaaaa', '', '2', '1', '50', '', '', '', '2');
INSERT INTO `gwshop_article_cat` VALUES ('7', 'bbbbb', '', '2', '1', '50', '', '', '', '2');
INSERT INTO `gwshop_article_cat` VALUES ('8', 'ccccc', '', '2', '0', '50', '', '', '', '2');
INSERT INTO `gwshop_article_cat` VALUES ('9', '购物aaaa', '', '3', '1', '0', '', '', '', '2');
INSERT INTO `gwshop_article_cat` VALUES ('10', 'ddddd', '', '4', '1', '0', '', '', '', '2');

-- ----------------------------
-- Table structure for gwshop_attachment
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_attachment`;
CREATE TABLE `gwshop_attachment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '附件编号',
  `savepath` varchar(100) NOT NULL DEFAULT '' COMMENT '服务器保存路径:路径控制下长度',
  `savename` varchar(100) NOT NULL DEFAULT '' COMMENT '实际保存文件名:随机生成固定固定长度的字符串+后缀',
  `oldname` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `extension` varchar(12) NOT NULL DEFAULT '' COMMENT '文件后缀:jpep,gif,png等',
  `filesize` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `filetype` varchar(60) NOT NULL DEFAULT '' COMMENT '文件类型',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '上传时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '附件状态:0正常,1待审核',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='附件信息';

-- ----------------------------
-- Records of gwshop_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for gwshop_cart
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_cart`;
CREATE TABLE `gwshop_cart` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户登录id，取自session，',
  `session_id` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '登录的sessionid，如果该用户退出，该sessionid对应的购物车中的所有记录都将被删除',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品编号',
  `goods_sn` varchar(60) NOT NULL COMMENT '商品货号',
  `goods_name` varchar(120) NOT NULL COMMENT '商品名称',
  `market_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品原价',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品折扣价',
  `goods_num` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '购买数量',
  `rec_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '购物车商品类型，0，普通；1，团够',
  `is_gift` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '是否是赠品，0 非赠品',
  `spec_key` varchar(64) NOT NULL DEFAULT '' COMMENT '商品规格key 对应tp_spec_goods_price 表',
  `spec_key_name` varchar(64) NOT NULL DEFAULT '' COMMENT '商品规格组合名称',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='购物车信息记录';

-- ----------------------------
-- Records of gwshop_cart
-- ----------------------------
INSERT INTO `gwshop_cart` VALUES ('54', '3', '', '6', 'TP0000142', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', '3000.00', '3200.00', '1', '0', '0', '2_3', '内存:32G 颜色:金色');
INSERT INTO `gwshop_cart` VALUES ('55', '3', '', '6', 'TP0000142', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', '3000.00', '3200.00', '2', '0', '0', '1_3', '内存:16G 颜色:金色');
INSERT INTO `gwshop_cart` VALUES ('56', '3', '', '3', '', '猪肚500g', '25.00', '20.00', '1', '0', '0', '', '');
INSERT INTO `gwshop_cart` VALUES ('57', '19', '', '1', 'TP0000131', '【蚂蚁摄影】单反外观Sony/索尼 DSC-H400高清长焦射月数码照相机', '1798.00', '100.00', '2', '0', '0', '1_3', '内存:16G 颜色:金色');
INSERT INTO `gwshop_cart` VALUES ('58', '19', '', '1', 'TP0000131', '【蚂蚁摄影】单反外观Sony/索尼 DSC-H400高清长焦射月数码照相机', '1798.00', '5000.00', '1', '0', '0', '2_4', '内存:32G 颜色:黑色');
INSERT INTO `gwshop_cart` VALUES ('59', '3', '', '1', 'TP0000131', '【蚂蚁摄影】单反外观Sony/索尼 DSC-H400高清长焦射月数码照相机', '1798.00', '5000.00', '1', '0', '0', '2_4', '内存:32G 颜色:黑色');
INSERT INTO `gwshop_cart` VALUES ('61', '19', '', '1', 'TP0000131', '【蚂蚁摄影】单反外观Sony/索尼 DSC-H400高清长焦射月数码照相机', '1798.00', '5000.00', '1', '0', '0', '2_3', '内存:32G 颜色:金色');
INSERT INTO `gwshop_cart` VALUES ('63', '16', '', '6', 'TP0000142', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', '3000.00', '3200.00', '2', '0', '0', '1_3', '内存:16G 颜色:金色');
INSERT INTO `gwshop_cart` VALUES ('64', '21', '', '6', 'TP0000142', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', '3000.00', '3200.00', '1', '0', '0', '1_3', '内存:16G 颜色:金色');
INSERT INTO `gwshop_cart` VALUES ('65', '17', '', '6', 'TP0000142', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', '3000.00', '3200.00', '1', '0', '0', '1_3', '内存:16G 颜色:金色');
INSERT INTO `gwshop_cart` VALUES ('69', '27', '', '1', 'TP0000131', '【蚂蚁摄影】单反外观Sony/索尼 DSC-H400高清长焦射月数码照相机', '1798.00', '1698.00', '1', '0', '0', '', '');
INSERT INTO `gwshop_cart` VALUES ('70', '27', '', '10', '111', '单反', '1.00', '1.00', '1', '0', '0', '', '');

-- ----------------------------
-- Table structure for gwshop_comments
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_comments`;
CREATE TABLE `gwshop_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论编号',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品编号',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户编号',
  `user_name` varchar(60) NOT NULL COMMENT '评论用户名:此字段用于数据冗余',
  `email` varchar(60) NOT NULL COMMENT 'email地址:此字段用于数据冗余',
  `content` text NOT NULL COMMENT '评论内容',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论时间',
  `ip_address` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ip',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '审核状态，1,已审核；0,未审核',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论的父节点:用于盖楼',
  `comment_img` text NOT NULL COMMENT '评论晒图',
  `lv_goods` tinyint(1) NOT NULL DEFAULT '0' COMMENT '对商品的评论星级',
  `lv_speed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '物流速度评论星级',
  `lv_server` tinyint(1) NOT NULL DEFAULT '0' COMMENT '服务评论星级',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单id',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='商品的评论列表';

-- ----------------------------
-- Records of gwshop_comments
-- ----------------------------
INSERT INTO `gwshop_comments` VALUES ('5', '5', '2', 'wubuze', '22436236@qq.com', '好的', '1469159896', '0', '1', '0', '', '5', '5', '5', '0');
INSERT INTO `gwshop_comments` VALUES ('6', '6', '2', 'wubuze', '22436236@qq.com', '好的', '1469160012', '0', '1', '0', '', '5', '5', '5', '5');
INSERT INTO `gwshop_comments` VALUES ('7', '7', '2', 'wubuze', '22436236@qq.com', '好的', '1469167517', '0', '1', '0', '', '5', '5', '5', '5');
INSERT INTO `gwshop_comments` VALUES ('12', '8', '2', 'wubuze', '22436236@qq.com', 'aaaaaaaaa', '1469169379', '0', '1', '0', 'a:2:{i:0;s:51:\"/Public/upload/comment/2016-08-08/57a84806d11db.png\";i:1;s:51:\"/Public/upload/comment/2016-08-08/57a84808d34c6.png\";}', '5', '5', '5', '5');
INSERT INTO `gwshop_comments` VALUES ('13', '6', '0', '', '', '', '0', '0', '0', '0', '', '3', '0', '0', '0');
INSERT INTO `gwshop_comments` VALUES ('14', '6', '0', '', '', '', '0', '0', '1', '0', '', '4', '0', '0', '0');
INSERT INTO `gwshop_comments` VALUES ('15', '6', '0', '', '', '', '0', '0', '0', '0', '', '2', '0', '0', '0');
INSERT INTO `gwshop_comments` VALUES ('16', '6', '0', '', '', '', '0', '0', '1', '0', '', '4', '0', '0', '0');
INSERT INTO `gwshop_comments` VALUES ('17', '8', '0', '', '', '管理员回复aaaa', '1470648132', '0', '0', '12', 'a:2:{i:0;s:51:\"/Public/upload/comment/2016-08-08/57a84806d11db.png\";i:1;s:51:\"/Public/upload/comment/2016-08-08/57a84808d34c6.png\";}', '0', '0', '0', '0');
INSERT INTO `gwshop_comments` VALUES ('18', '1', '3', 'wx1470821201821', '', '3244', '1471508322', '0', '0', '0', 'a:1:{i:0;s:51:\"/Public/upload/comment/2016-08-18/57b56f5dd8f8c.png\";}', '2', '3', '3', '51');

-- ----------------------------
-- Table structure for gwshop_config
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_config`;
CREATE TABLE `gwshop_config` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `name` varchar(64) DEFAULT NULL COMMENT '配置的key键名',
  `value` varchar(512) DEFAULT NULL COMMENT '配置的val值',
  `inc_type` varchar(64) DEFAULT NULL COMMENT '配置分组',
  `desc` varchar(50) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gwshop_config
-- ----------------------------
INSERT INTO `gwshop_config` VALUES ('1', 'site_url', 'http://www.tp-shop.cn', 'shop_info', null);
INSERT INTO `gwshop_config` VALUES ('2', 'record_no', '粤00-86140485号', 'shop_info', null);
INSERT INTO `gwshop_config` VALUES ('3', 'store_name', '广为网络公司', 'shop_info', null);
INSERT INTO `gwshop_config` VALUES ('4', 'store_logo', '/Public/images/newLogo.png', 'shop_info', null);
INSERT INTO `gwshop_config` VALUES ('5', 'store_title', 'gwshop｜thinkphp shop ｜GWshop 免费开源系统｜ thinkphp 商城 国内最强大的thinkphp shop b2cb2b开源商城', 'shop_info', null);
INSERT INTO `gwshop_config` VALUES ('6', 'store_desc', 'gwshop｜thinkphp shop ｜GWshop 免费开源系统｜ thinkphp 商城 国内最强大的thinkphp shop b2cb2b开源商城', 'shop_info', null);
INSERT INTO `gwshop_config` VALUES ('7', 'store_keyword', 'gwshop｜thinkphp shop ｜GWshop  免费开源系统｜ thinkphp 商城 国内最强大的thinkphp shop b2cb2b开源商城', 'shop_info', null);
INSERT INTO `gwshop_config` VALUES ('8', 'contact', '', 'shop_info', null);
INSERT INTO `gwshop_config` VALUES ('9', 'phone', '15871376283', 'shop_info', null);
INSERT INTO `gwshop_config` VALUES ('10', 'address', '五一中路状元楼', 'shop_info', null);
INSERT INTO `gwshop_config` VALUES ('11', 'qq', '365720009', 'shop_info', null);
INSERT INTO `gwshop_config` VALUES ('12', 'qq2', '1273276548', 'shop_info', null);
INSERT INTO `gwshop_config` VALUES ('13', 'qq3', '703522188', 'shop_info', null);
INSERT INTO `gwshop_config` VALUES ('14', 'freight_free', '1000000', 'shopping', null);
INSERT INTO `gwshop_config` VALUES ('15', 'point_rate', '10', 'shopping', null);
INSERT INTO `gwshop_config` VALUES ('16', 'is_mark', '0', 'water', null);
INSERT INTO `gwshop_config` VALUES ('17', 'mark_txt', '', 'water', null);
INSERT INTO `gwshop_config` VALUES ('18', 'mark_img', '', 'water', null);
INSERT INTO `gwshop_config` VALUES ('19', 'mark_width', '', 'water', null);
INSERT INTO `gwshop_config` VALUES ('20', 'mark_height', '', 'water', null);
INSERT INTO `gwshop_config` VALUES ('21', 'mark_degree', '53', 'water', null);
INSERT INTO `gwshop_config` VALUES ('22', 'mark_quality', '55', 'water', null);
INSERT INTO `gwshop_config` VALUES ('23', 'sel', '9', 'water', null);
INSERT INTO `gwshop_config` VALUES ('24', 'sms_url', 'https://yunpan.cn/OcRgiKWxZFmjSJ', 'sms', null);
INSERT INTO `gwshop_config` VALUES ('25', 'sms_user', '', 'sms', null);
INSERT INTO `gwshop_config` VALUES ('26', 'sms_pwd', '访问密码 080e', 'sms', null);
INSERT INTO `gwshop_config` VALUES ('27', 'regis_sms_enable', '0', 'sms', null);
INSERT INTO `gwshop_config` VALUES ('28', 'sms_time_out', '60', 'sms', null);
INSERT INTO `gwshop_config` VALUES ('29', 'reg_integral', '100', 'basic', null);
INSERT INTO `gwshop_config` VALUES ('30', 'file_size', '1', 'basic', null);
INSERT INTO `gwshop_config` VALUES ('31', 'default_storage', '1', 'basic', null);
INSERT INTO `gwshop_config` VALUES ('32', 'warning_storage', '1', 'basic', null);
INSERT INTO `gwshop_config` VALUES ('33', 'tax', '6', 'basic', null);
INSERT INTO `gwshop_config` VALUES ('34', 'is_remind', '0', 'basic', null);
INSERT INTO `gwshop_config` VALUES ('35', 'order_finish_time', '', 'basic', null);
INSERT INTO `gwshop_config` VALUES ('36', 'order_cancel_time', '', 'basic', null);
INSERT INTO `gwshop_config` VALUES ('37', 'hot_keywords', '手机|小米|iphone|三星|华为', 'basic', null);
INSERT INTO `gwshop_config` VALUES ('38', '__hash__', '8d9fea07e44955760d3407524e469255_6ac8706878aa807db7ffb09dd0b02453', 'sms', null);
INSERT INTO `gwshop_config` VALUES ('39', '__hash__', '8d9fea07e44955760d3407524e469255_6ac8706878aa807db7ffb09dd0b02453', 'sms', null);
INSERT INTO `gwshop_config` VALUES ('40', 'app_test', '0', 'basic', null);
INSERT INTO `gwshop_config` VALUES ('41', 'switch', '0', 'distribut', null);
INSERT INTO `gwshop_config` VALUES ('42', 'condition', '0', 'distribut', null);
INSERT INTO `gwshop_config` VALUES ('43', 'name', '我的分销商', 'distribut', null);
INSERT INTO `gwshop_config` VALUES ('44', 'pattern', '1', 'distribut', null);
INSERT INTO `gwshop_config` VALUES ('45', 'order_rate', '20', 'distribut', null);
INSERT INTO `gwshop_config` VALUES ('46', 'first_name', '我的一级分销', 'distribut', null);
INSERT INTO `gwshop_config` VALUES ('47', 'first_rate', '60', 'distribut', null);
INSERT INTO `gwshop_config` VALUES ('48', 'second_name', '我的二级分销', 'distribut', null);
INSERT INTO `gwshop_config` VALUES ('49', 'second_rate', '25', 'distribut', null);
INSERT INTO `gwshop_config` VALUES ('50', 'third_name', '我的三级分销', 'distribut', null);
INSERT INTO `gwshop_config` VALUES ('51', 'third_rate', '15', 'distribut', null);
INSERT INTO `gwshop_config` VALUES ('52', 'date', '7', 'distribut', null);
INSERT INTO `gwshop_config` VALUES ('53', 'need', '1000', 'distribut', null);
INSERT INTO `gwshop_config` VALUES ('54', 'min', '100', 'distribut', null);

-- ----------------------------
-- Table structure for gwshop_coupons
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_coupons`;
CREATE TABLE `gwshop_coupons` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '优惠券编号',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '优惠券标题',
  `contexts` varchar(200) NOT NULL DEFAULT '' COMMENT '优惠券内容简介',
  `coupons_type_id` smallint(8) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券类型编号',
  `send_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发放时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '有效状态0：有效,1：过期',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '发放类型 1 按订单发放 2 注册 3 邀请 4 按用户发放',
  `code` varchar(10) DEFAULT '' COMMENT '优惠券兑换码',
  `order_id` mediumint(8) NOT NULL DEFAULT '0' COMMENT '订单id',
  `use_time` int(10) NOT NULL DEFAULT '0' COMMENT '使用时间',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='优惠券基础信息';

-- ----------------------------
-- Records of gwshop_coupons
-- ----------------------------
INSERT INTO `gwshop_coupons` VALUES ('8', '', '', '4', '1469082904', '0', '1', '2', '', '0', '0');
INSERT INTO `gwshop_coupons` VALUES ('9', '', '', '5', '1469082904', '0', '1', '2', '', '0', '0');
INSERT INTO `gwshop_coupons` VALUES ('10', '用户注册获得', '', '4', '1469083037', '0', '1', '2', '', '0', '0');
INSERT INTO `gwshop_coupons` VALUES ('11', '用户注册获得', '', '5', '1469083037', '0', '1', '2', '', '0', '0');
INSERT INTO `gwshop_coupons` VALUES ('12', '用户注册获得', '', '4', '1470821201', '0', '3', '2', '', '0', '0');
INSERT INTO `gwshop_coupons` VALUES ('13', '用户注册获得', '', '5', '1470821201', '0', '3', '2', '', '0', '0');
INSERT INTO `gwshop_coupons` VALUES ('14', '用户注册获得', '', '4', '1470822138', '0', '4', '2', '', '0', '0');
INSERT INTO `gwshop_coupons` VALUES ('15', '用户注册获得', '', '5', '1470822138', '0', '4', '2', '', '0', '0');
INSERT INTO `gwshop_coupons` VALUES ('16', '用户注册获得', '', '4', '1470822702', '0', '5', '2', '', '0', '0');
INSERT INTO `gwshop_coupons` VALUES ('17', '用户注册获得', '', '5', '1470822702', '0', '5', '2', '', '0', '0');
INSERT INTO `gwshop_coupons` VALUES ('18', '用户注册获得', '', '4', '1470822781', '0', '6', '2', '', '0', '0');
INSERT INTO `gwshop_coupons` VALUES ('19', '用户注册获得', '', '5', '1470822781', '0', '6', '2', '', '0', '0');
INSERT INTO `gwshop_coupons` VALUES ('20', '用户注册获得', '', '4', '1470827617', '0', '7', '2', '', '0', '0');
INSERT INTO `gwshop_coupons` VALUES ('21', '用户注册获得', '', '5', '1470827617', '0', '7', '2', '', '0', '0');
INSERT INTO `gwshop_coupons` VALUES ('22', '用户注册获得', '', '4', '1470885813', '0', '8', '2', '', '0', '0');
INSERT INTO `gwshop_coupons` VALUES ('23', '用户注册获得', '', '5', '1470885813', '0', '8', '2', '', '0', '0');
INSERT INTO `gwshop_coupons` VALUES ('24', '用户注册获得', '', '4', '1470886794', '0', '9', '2', '', '29', '1471061407');
INSERT INTO `gwshop_coupons` VALUES ('25', '用户注册获得', '', '5', '1470886794', '0', '9', '2', '', '0', '0');
INSERT INTO `gwshop_coupons` VALUES ('26', '用户注册获得', '', '4', '1470886843', '0', '10', '2', '', '0', '0');
INSERT INTO `gwshop_coupons` VALUES ('27', '用户注册获得', '', '5', '1470886843', '0', '10', '2', '', '0', '0');
INSERT INTO `gwshop_coupons` VALUES ('28', '用户注册获得', '', '4', '1470887072', '0', '11', '2', '', '0', '0');
INSERT INTO `gwshop_coupons` VALUES ('29', '用户注册获得', '', '5', '1470887072', '0', '11', '2', '', '0', '0');
INSERT INTO `gwshop_coupons` VALUES ('30', '用户注册获得', '', '4', '1470887434', '0', '12', '2', '', '0', '0');
INSERT INTO `gwshop_coupons` VALUES ('31', '用户注册获得', '', '5', '1470887434', '0', '12', '2', '', '0', '0');
INSERT INTO `gwshop_coupons` VALUES ('32', '用户注册获得', '', '4', '1470888579', '0', '13', '2', '', '0', '0');
INSERT INTO `gwshop_coupons` VALUES ('33', '用户注册获得', '', '5', '1470888579', '0', '13', '2', '', '0', '0');
INSERT INTO `gwshop_coupons` VALUES ('34', '用户注册获得', '', '4', '1470888723', '0', '14', '2', '', '0', '0');
INSERT INTO `gwshop_coupons` VALUES ('35', '用户注册获得', '', '5', '1470888723', '0', '14', '2', '', '0', '0');
INSERT INTO `gwshop_coupons` VALUES ('36', '用户注册获得', '', '4', '1470892857', '0', '15', '2', '', '0', '0');
INSERT INTO `gwshop_coupons` VALUES ('37', '用户注册获得', '', '5', '1470892857', '0', '15', '2', '', '0', '0');
INSERT INTO `gwshop_coupons` VALUES ('38', '用户注册获得', '', '4', '1470965560', '0', '16', '2', '', '0', '0');
INSERT INTO `gwshop_coupons` VALUES ('39', '用户注册获得', '', '5', '1470965560', '0', '16', '2', '', '0', '0');
INSERT INTO `gwshop_coupons` VALUES ('40', '用户注册获得', '', '4', '1470990383', '0', '17', '2', '', '0', '0');
INSERT INTO `gwshop_coupons` VALUES ('41', '用户注册获得', '', '5', '1470990383', '0', '17', '2', '', '0', '0');
INSERT INTO `gwshop_coupons` VALUES ('42', '用户注册获得', '', '4', '1470992301', '0', '18', '2', '', '0', '0');
INSERT INTO `gwshop_coupons` VALUES ('43', '用户注册获得', '', '5', '1470992301', '0', '18', '2', '', '0', '0');
INSERT INTO `gwshop_coupons` VALUES ('44', '用户注册获得', '', '4', '1470994293', '0', '19', '2', '', '31', '1471330880');
INSERT INTO `gwshop_coupons` VALUES ('45', '用户注册获得', '', '5', '1470994293', '0', '19', '2', '', '0', '0');
INSERT INTO `gwshop_coupons` VALUES ('46', '用户注册获得', '', '4', '1471054137', '0', '20', '2', '', '0', '0');
INSERT INTO `gwshop_coupons` VALUES ('47', '用户注册获得', '', '5', '1471054137', '0', '20', '2', '', '24', '1471057154');
INSERT INTO `gwshop_coupons` VALUES ('48', '用户注册获得', '', '4', '1471056088', '0', '21', '2', '', '0', '0');
INSERT INTO `gwshop_coupons` VALUES ('49', '用户注册获得', '', '5', '1471056088', '0', '21', '2', '', '0', '0');
INSERT INTO `gwshop_coupons` VALUES ('50', '用户注册获得', '', '5', '1471159851', '0', '22', '2', '', '0', '0');
INSERT INTO `gwshop_coupons` VALUES ('51', '用户注册获得', '', '5', '1471160191', '0', '23', '2', '', '0', '0');

-- ----------------------------
-- Table structure for gwshop_coupons_log
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_coupons_log`;
CREATE TABLE `gwshop_coupons_log` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '优惠券记录编号',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户编号',
  `coupons_id` mediumint(8) unsigned NOT NULL COMMENT '优惠券编号',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单编号',
  `usage_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `coupons_id` (`coupons_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='优惠券使用记录';

-- ----------------------------
-- Records of gwshop_coupons_log
-- ----------------------------
INSERT INTO `gwshop_coupons_log` VALUES ('1', '20', '47', '24', '0');
INSERT INTO `gwshop_coupons_log` VALUES ('2', '9', '24', '29', '0');
INSERT INTO `gwshop_coupons_log` VALUES ('3', '19', '44', '31', '0');

-- ----------------------------
-- Table structure for gwshop_coupons_type
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_coupons_type`;
CREATE TABLE `gwshop_coupons_type` (
  `id` smallint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '优惠券类型编号',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '类型名称',
  `contexts` varchar(200) NOT NULL DEFAULT '' COMMENT '优惠券使用范围',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '发放类型 0-面额模版 1-按用户发放 2-注册发放 3-邀请发放 4-线下发放',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '优惠券面额',
  `condition` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '消费金额(必需为整数)',
  `createnum` smallint(5) NOT NULL DEFAULT '0' COMMENT '发放数量限制(默认为0则无限制)',
  `send_start_time` int(10) NOT NULL DEFAULT '0' COMMENT '发送优惠券开始时间',
  `send_end_time` int(10) NOT NULL DEFAULT '0' COMMENT '发送优惠券结束时间',
  `use_start_time` int(10) NOT NULL DEFAULT '0' COMMENT '使用优惠券开始时间',
  `use_end_time` int(10) NOT NULL DEFAULT '0' COMMENT '使用优惠券结束时间',
  `add_time` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `send_num` smallint(5) NOT NULL DEFAULT '0' COMMENT '已发放数',
  `use_num` smallint(5) NOT NULL DEFAULT '0' COMMENT '已使用数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='优惠券类型';

-- ----------------------------
-- Records of gwshop_coupons_type
-- ----------------------------
INSERT INTO `gwshop_coupons_type` VALUES ('2', '优惠券名称很长', '', '1', '20.00', '50', '0', '1468425600', '1471017600', '1468425600', '1473696000', '1468402404', '3', '0');
INSERT INTO `gwshop_coupons_type` VALUES ('4', '优惠券分类1', '', '2', '10.00', '50', '0', '1468512000', '1471104000', '1468512000', '1473782400', '1468488823', '23', '2');
INSERT INTO `gwshop_coupons_type` VALUES ('5', '优惠券分类2', '', '2', '10.00', '60', '0', '1468598400', '1471190400', '1468598400', '1473868800', '1468563825', '24', '1');

-- ----------------------------
-- Table structure for gwshop_credit
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_credit`;
CREATE TABLE `gwshop_credit` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '积分编号',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户编号',
  `total_credit` mediumint(8) NOT NULL COMMENT '总积分',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户积分表';

-- ----------------------------
-- Records of gwshop_credit
-- ----------------------------
INSERT INTO `gwshop_credit` VALUES ('1', '1', '10165');
INSERT INTO `gwshop_credit` VALUES ('2', '2', '4138');
INSERT INTO `gwshop_credit` VALUES ('3', '3', '0');

-- ----------------------------
-- Table structure for gwshop_credit_log
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_credit_log`;
CREATE TABLE `gwshop_credit_log` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '积分编号',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户编号',
  `credit_type` smallint(8) NOT NULL COMMENT '积分类型:gwshop_credit_rule:id',
  `credit` mediumint(8) NOT NULL COMMENT '本次积分',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '获取时间',
  `note` varchar(100) NOT NULL COMMENT '备注',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1：加，0：减',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '标题',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='用户积分获取记录';

-- ----------------------------
-- Records of gwshop_credit_log
-- ----------------------------
INSERT INTO `gwshop_credit_log` VALUES ('1', '1', '1', '2009', '1469494681', '订单：1获得积分：2009', '1', '订单获得');
INSERT INTO `gwshop_credit_log` VALUES ('2', '1', '1', '2009', '1469495089', '订单：1获得积分：2009', '1', '');
INSERT INTO `gwshop_credit_log` VALUES ('3', '1', '1', '2009', '1469495157', '订单：1获得积分：2009', '1', '');
INSERT INTO `gwshop_credit_log` VALUES ('4', '1', '1', '2009', '1469495255', '订单：1获得积分：2009', '1', '');
INSERT INTO `gwshop_credit_log` VALUES ('5', '1', '1', '2009', '1469495263', '订单：1获得积分：2009', '1', '');
INSERT INTO `gwshop_credit_log` VALUES ('6', '2', '1', '2009', '1469495286', '订单：4获得积分：2009', '1', '');
INSERT INTO `gwshop_credit_log` VALUES ('7', '2', '1', '2009', '1469495294', '订单：4获得积分：2009', '1', '');
INSERT INTO `gwshop_credit_log` VALUES ('8', '2', '1', '2009', '1469495411', '订单：4获得积分：2009', '1', '');
INSERT INTO `gwshop_credit_log` VALUES ('9', '2', '1', '2009', '1469495423', '订单：4获得积分：2009', '1', '');
INSERT INTO `gwshop_credit_log` VALUES ('10', '3', '1', '120', '1471508322', '订单：51获得积分：120', '1', '');

-- ----------------------------
-- Table structure for gwshop_credit_rule
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_credit_rule`;
CREATE TABLE `gwshop_credit_rule` (
  `id` smallint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则编号',
  `rule_name` varchar(20) NOT NULL COMMENT '规则名称',
  `cycle_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '奖励周期0:一次;1:每天;2:整点;3:间隔分钟;4:不限;',
  `cycle_time` int(10) NOT NULL DEFAULT '0' COMMENT '间隔时间',
  `reward_num` tinyint(1) NOT NULL DEFAULT '1' COMMENT '奖励次数',
  `norepeat` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否去重1：去重;0：不去重',
  `credit` smallint(8) NOT NULL COMMENT '本条规则积分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户积分规则';

-- ----------------------------
-- Records of gwshop_credit_rule
-- ----------------------------
INSERT INTO `gwshop_credit_rule` VALUES ('1', '评论获得积分(比例)', '0', '0', '1', '0', '100');
INSERT INTO `gwshop_credit_rule` VALUES ('2', '付款抵用积分(比例)（暂时不用）', '0', '0', '1', '0', '100');

-- ----------------------------
-- Table structure for gwshop_delivery_doc
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_delivery_doc`;
CREATE TABLE `gwshop_delivery_doc` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '发货单ID',
  `order_id` int(11) unsigned NOT NULL COMMENT '订单ID',
  `order_sn` varchar(64) NOT NULL DEFAULT '' COMMENT '订单编号',
  `user_id` int(11) unsigned NOT NULL COMMENT '用户ID',
  `admin_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `consignee` varchar(64) NOT NULL COMMENT '收货人',
  `zipcode` varchar(6) DEFAULT NULL COMMENT '邮编',
  `mobile` varchar(20) NOT NULL COMMENT '联系手机',
  `country` int(11) unsigned NOT NULL COMMENT '国ID',
  `province` int(11) unsigned NOT NULL COMMENT '省ID',
  `city` int(11) unsigned NOT NULL COMMENT '市ID',
  `district` int(11) unsigned NOT NULL COMMENT '区ID',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `shipping_code` varchar(32) DEFAULT NULL COMMENT '物流code',
  `shipping_name` varchar(64) DEFAULT NULL COMMENT '快递名称',
  `shipping_price` decimal(10,2) DEFAULT '0.00' COMMENT '运费',
  `invoice_no` varchar(255) NOT NULL DEFAULT '' COMMENT '物流单号',
  `tel` varchar(64) DEFAULT NULL COMMENT '座机电话',
  `note` text COMMENT '管理员添加的备注信息',
  `best_time` int(11) DEFAULT NULL COMMENT '友好收货时间',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='发货单';

-- ----------------------------
-- Records of gwshop_delivery_doc
-- ----------------------------
INSERT INTO `gwshop_delivery_doc` VALUES ('1', '14', '1469780548415', '1', '1', 'hehe', null, '18650306102', '0', '0', '0', '0', '', null, null, '0.00', 'aaaa', null, 'bbbb', null, '1470043370', '0');
INSERT INTO `gwshop_delivery_doc` VALUES ('2', '14', '1469780548415', '1', '1', 'hehe', null, '18650306102', '0', '0', '0', '0', '', null, null, '0.00', 'aaaa', null, 'bbbb', null, '1470043428', '0');
INSERT INTO `gwshop_delivery_doc` VALUES ('3', '14', '1469780548415', '1', '1', 'hehe', null, '18650306102', '0', '0', '0', '0', '', null, null, '0.00', 'aaaa', null, 'bbbb', null, '1470043435', '0');
INSERT INTO `gwshop_delivery_doc` VALUES ('4', '14', '1469780548415', '1', '1', 'hehe', null, '18650306102', '0', '0', '0', '0', '', null, null, '0.00', 'aaaa', null, 'bbbb', null, '1470043484', '0');
INSERT INTO `gwshop_delivery_doc` VALUES ('5', '13', '1469780493407', '1', '1', 'hehe', null, '18650306102', '0', '0', '0', '0', '', null, null, '0.00', 'cccccccccccceeeeee', null, 'asdfasdfasasd', null, '1470043613', '0');
INSERT INTO `gwshop_delivery_doc` VALUES ('6', '12', '1469780417136', '1', '1', 'hehe', null, '18650306102', '0', '0', '0', '0', '', null, null, '0.00', 'asdfasdf', null, '发货饿了', null, '1470044099', '0');
INSERT INTO `gwshop_delivery_doc` VALUES ('7', '11', '1469780331454', '1', '1', 'hehe', null, '18650306102', '0', '0', '0', '0', '', null, null, '0.00', 'aaaaaaaaaaaa', null, 'aaaaaaaaaaaaaaa', null, '1470366698', '0');
INSERT INTO `gwshop_delivery_doc` VALUES ('8', '23', '1471056303425', '16', '1', '？', null, '13008796401', '0', '0', '0', '0', '', null, null, '0.00', '88', null, '', null, '1471057096', '0');
INSERT INTO `gwshop_delivery_doc` VALUES ('9', '24', '1471057154263', '20', '1', '姚锦乐', null, '15060151736', '0', '0', '0', '0', '', null, null, '0.00', '4', null, '', null, '1471057492', '0');
INSERT INTO `gwshop_delivery_doc` VALUES ('10', '51', '1471507859914', '3', '1', '我的', null, '13599485726', '0', '0', '0', '0', '', null, null, '0.00', '201608181613', null, '', null, '1471508011', '0');
INSERT INTO `gwshop_delivery_doc` VALUES ('11', '114', '1472710935461', '16', '1', '111', null, '13009876523', '0', '0', '0', '0', '', null, null, '0.00', '1111111', null, '', null, '1472710969', '0');
INSERT INTO `gwshop_delivery_doc` VALUES ('12', '107', '1472025483495', '3', '1', '测试的啦', null, '13599051486', '0', '0', '0', '0', '', null, null, '0.00', '201609011442', null, '', null, '1472712169', '0');
INSERT INTO `gwshop_delivery_doc` VALUES ('13', '119', '2016092311044027992', '27', '1', '小虚1', null, '13675091372', '0', '0', '0', '0', '', null, null, '0.00', '960084906925', null, '', null, '1474609354', '0');

-- ----------------------------
-- Table structure for gwshop_goods
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_goods`;
CREATE TABLE `gwshop_goods` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品编号',
  `goods_sn` varchar(60) NOT NULL COMMENT '商品货号',
  `goods_name` varchar(120) NOT NULL COMMENT '商品名称',
  `goods_title` varchar(120) NOT NULL COMMENT '商品副标题',
  `cat_id` smallint(8) NOT NULL COMMENT '商品类型编号',
  `click_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品点击数',
  `market_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品原价',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品折扣价',
  `goods_brief` varchar(255) NOT NULL COMMENT '商品的简短描述',
  `goods_desc` text NOT NULL COMMENT '商品的详细描述',
  `goods_thumb` varchar(255) NOT NULL COMMENT '商品在前台显示的微缩图片，如在分类筛选时显示的小图片',
  `goods_img` varchar(255) NOT NULL COMMENT '商品的实际大小图片，如进入该商品页时介绍商品属性所显示的大图片',
  `original_img` varchar(255) NOT NULL COMMENT '应该是上传的商品的原始图片',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品的添加时间',
  `sort_order` smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '应该是商品的显示顺序，不过该版程序中没实现该功能',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '商品是否已经删除，0，否；1，已删除',
  `is_best` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是精品；0，否；1，是',
  `is_new` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是新品；0，否；1，是',
  `end_time` int(10) DEFAULT '0' COMMENT '活动结束时间',
  `gtype` tinyint(1) DEFAULT '0' COMMENT '0-普通商品，1-团购商品 ，2-限时抢购',
  `goods_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '商品属性',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否热销，0，否；1，是',
  `is_promote` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否特价促销；0，否；1，是',
  `spec_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '商品规格类型，取值表goods_style的id',
  `last_update` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最近一次更新商品配置的时间',
  `goods_sales` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品销量',
  `store_count` smallint(5) unsigned NOT NULL DEFAULT '10' COMMENT '库存数量',
  `is_on_sale` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否上架',
  `is_recommend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `comment_count` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '商品评论数',
  `favorite_count` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数量',
  `once_distribution_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '一级分销奖金',
  `second_distribution_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '二级分销奖金',
  `third_distribution_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '三级分销奖金',
  PRIMARY KEY (`id`),
  KEY `goods_sn` (`goods_sn`),
  KEY `goods_type_id` (`cat_id`),
  KEY `last_update` (`last_update`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='商品信息';

-- ----------------------------
-- Records of gwshop_goods
-- ----------------------------
INSERT INTO `gwshop_goods` VALUES ('1', 'TP0000131', '【蚂蚁摄影】单反外观Sony/索尼 DSC-H400高清长焦射月数码照相机', '猪蹄500g', '16', '0', '1798.00', '1698.00', '上好猪蹄便宜拍', '&lt;p&gt;&lt;img title=&quot;563a014600063.jpg&quot; src=&quot;/Public/upload/goods/2016/07-25/5795c7c196622.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;猪蹄500g猪蹄500g猪蹄500g猪蹄500g&lt;/p&gt;', '', '/Public/upload/goods/2016/07-02/5777297ff32b7.jpg', '/Public/upload/goods/2016/07-02/5777297ff32b7.jpg', '1474597837', '20', '0', '0', '1', '1467789747', '0', '2', '1', '0', '3', '0', '0', '86', '1', '1', '0', '0', '200.00', '150.00', '100.00');
INSERT INTO `gwshop_goods` VALUES ('2', '', 'iphone6s 蓝牙耳机', '', '11', '0', '85.00', '20.00', 'iphone6s 蓝牙耳机', '&lt;p&gt;iphone6s 蓝牙耳机iphone6s 蓝牙耳机iphone6s 蓝牙耳机iphone6s 蓝牙耳机&lt;/p&gt;', '', '/Public/upload/goods/2016/07-02/5777297ff32b7.jpg', '/Public/upload/goods/2016/07-02/5777297ff32b7.jpg', '1474596230', '0', '0', '0', '0', '1467789747', '0', '2', '1', '0', '3', '0', '0', '25', '1', '1', '0', '0', '0.00', '0.00', '0.00');
INSERT INTO `gwshop_goods` VALUES ('3', '', '猪肚500g', '', '7', '0', '25.00', '20.00', 'ahahha', '', '', '/Public/upload/goods/2016/09-22/57e3fa7ee020b.png', '/Public/upload/goods/2016/09-22/57e3fa7ee020b.png', '1474596145', '0', '0', '0', '0', '1479502803', '0', '1', '1', '0', '0', '0', '0', '10', '1', '1', '0', '0', '0.00', '0.00', '0.00');
INSERT INTO `gwshop_goods` VALUES ('4', '', 'cccccc', '', '9', '0', '120.00', '100.00', '', '', '', '', '', '1471422446', '0', '0', '0', '0', '1467789747', '2', '0', '1', '0', '0', '0', '0', '10', '1', '1', '0', '0', '0.00', '0.00', '0.00');
INSERT INTO `gwshop_goods` VALUES ('5', 'TP0000136', 'aaaa', '', '7', '0', '20.00', '20.00', 'ewerwerhwerhwe', '&lt;p&gt;aaaaaaaaaaa&lt;img src=&quot;http://img.baidu.com/hi/jx2/j_0025.gif&quot;/&gt;&lt;img src=&quot;http://img.baidu.com/hi/jx2/j_0048.gif&quot;/&gt;&lt;img src=&quot;http://img.baidu.com/hi/jx2/j_0008.gif&quot;/&gt;&lt;/p&gt;', '', '/Public/upload/goods/2016/07-02/5777da96d98c4.jpg', '/Public/upload/goods/2016/07-02/5777da96d98c4.jpg', '1474596155', '0', '0', '0', '0', '1467789747', '0', '0', '1', '0', '3', '0', '0', '123', '1', '1', '0', '0', '0.00', '0.00', '0.00');
INSERT INTO `gwshop_goods` VALUES ('6', 'TP0000142', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', '', '9', '0', '3000.00', '2699.00', 'aaaa', '&lt;p&gt;aaaa&lt;br/&gt;&lt;/p&gt;', '', 'aaaa', 'aaaa', '1471333128', '0', '0', '0', '0', '1467789747', '0', '0', '1', '0', '3', '0', '0', '13', '1', '1', '0', '0', '0.00', '0.00', '0.00');
INSERT INTO `gwshop_goods` VALUES ('7', '', '小米MAX', '', '14', '0', '1999.00', '1699.00', '小米MAX', '&lt;p&gt;小米MAX小米MAX小米MAX小米MAX小米MAX&lt;/p&gt;', '', '', '', '1474596284', '0', '0', '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', '40', '1', '1', '0', '0', '0.00', '0.00', '0.00');
INSERT INTO `gwshop_goods` VALUES ('8', '', '红米3s', '', '9', '0', '899.00', '699.00', '', '', '', '', '', '1470919764', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '10', '0', '1', '0', '0', '0.00', '0.00', '0.00');
INSERT INTO `gwshop_goods` VALUES ('9', '', 'xxxx', '', '0', '0', '50.00', '10.00', '', '', '', '', '', '1470919772', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '50', '0', '0', '0', '0', '0.00', '0.00', '0.00');
INSERT INTO `gwshop_goods` VALUES ('10', '111', '单反', '', '1', '0', '1.00', '1.00', '单反', '&lt;p&gt;1111&lt;/p&gt;', '', '/Public/upload/goods/2016/07-02/5777297ff32b7.jpg', '/Public/upload/goods/2016/07-02/5777297ff32b7.jpg', '1471056637', '0', '0', '0', '0', '0', '0', '2', '1', '0', '2', '0', '0', '2', '1', '1', '0', '0', '0.00', '0.00', '0.00');
INSERT INTO `gwshop_goods` VALUES ('11', '111', '单反', '', '1', '0', '1.00', '1.00', '单反', '&lt;p&gt;1111&lt;/p&gt;', '', '', '/Public/upload/goods/2016/07-02/5777297ff32b7.jpg', '0', '0', '0', '0', '1', '0', '0', '0', '1', '0', '0', '0', '0', '2', '1', '1', '0', '0', '0.00', '0.00', '0.00');
INSERT INTO `gwshop_goods` VALUES ('12', '1111', '单反', '', '1', '0', '1.00', '1.00', '11', '&lt;p&gt;11&lt;/p&gt;', '', '', '/Public/upload/goods/2016/07-02/5777297ff32b7.jpg', '0', '0', '0', '0', '1', '0', '0', '0', '1', '0', '0', '0', '0', '3', '1', '1', '0', '0', '0.00', '0.00', '0.00');
INSERT INTO `gwshop_goods` VALUES ('13', '1111111', '1111', '', '1', '0', '1.00', '1.00', '111', '&lt;p&gt;1&lt;/p&gt;', '', '', '', '0', '0', '0', '0', '1', '0', '0', '2', '1', '0', '2', '0', '0', '11', '1', '1', '0', '0', '0.00', '0.00', '0.00');
INSERT INTO `gwshop_goods` VALUES ('14', '22324', '222', '', '1', '0', '11.00', '1.00', '111', '&lt;p&gt;11&lt;/p&gt;', '', '', '', '0', '0', '0', '0', '1', '0', '2', '3', '1', '0', '3', '0', '0', '65535', '1', '1', '0', '0', '0.00', '0.00', '0.00');
INSERT INTO `gwshop_goods` VALUES ('15', '', '', '', '0', '0', '0.00', '0.00', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00');
INSERT INTO `gwshop_goods` VALUES ('16', '13233', '112233', '', '1', '0', '11.00', '1.00', '112', '&lt;p&gt;11&lt;/p&gt;', '', '', '', '0', '0', '0', '0', '0', '0', '2', '0', '0', '0', '3', '0', '0', '11', '0', '0', '0', '0', '0.00', '0.00', '0.00');
INSERT INTO `gwshop_goods` VALUES ('17', '', '', '', '15', '0', '0.00', '0.00', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00');

-- ----------------------------
-- Table structure for gwshop_goods_attribute
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_goods_attribute`;
CREATE TABLE `gwshop_goods_attribute` (
  `attr_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性id',
  `attr_name` varchar(60) NOT NULL DEFAULT '' COMMENT '属性名称',
  `type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '属性分类id',
  `attr_index` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0不需要检索 1关键字检索 2范围检索',
  `attr_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0唯一属性 1单选属性 2复选属性',
  `attr_input_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT ' 0 手工录入 1从列表中选择 2多行文本框',
  `attr_values` text NOT NULL COMMENT '可选值列表',
  `order` tinyint(3) unsigned NOT NULL DEFAULT '50' COMMENT '属性排序',
  PRIMARY KEY (`attr_id`),
  KEY `cat_id` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gwshop_goods_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for gwshop_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_goods_category`;
CREATE TABLE `gwshop_goods_category` (
  `id` smallint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品类型编号',
  `type_name` varchar(50) NOT NULL COMMENT '类型名称',
  `type_desc` varchar(50) NOT NULL COMMENT '类型描述',
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '该分类的父id',
  `sort_order` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '分类排序编号',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型状态:0可用,1不可用',
  `type_img` varchar(225) NOT NULL COMMENT '分类图片',
  `parent_id_path` varchar(128) NOT NULL DEFAULT '' COMMENT '家族图谱',
  `level` tinyint(1) NOT NULL DEFAULT '0' COMMENT '等级',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否显示',
  `cat_group` tinyint(1) NOT NULL DEFAULT '0' COMMENT '分类分组默认0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='商品类型';

-- ----------------------------
-- Records of gwshop_goods_category
-- ----------------------------
INSERT INTO `gwshop_goods_category` VALUES ('1', '手机数码', '', '0', '2', '1', '/Public/upload/category/2016/08-13/57ae843804716.png', '0_1', '1', '1', '0');
INSERT INTO `gwshop_goods_category` VALUES ('2', '家用电器', '', '0', '4', '1', '/Public/upload/category/2016/09-23/57e47bac83781.png', '0_2', '1', '1', '0');
INSERT INTO `gwshop_goods_category` VALUES ('3', '电脑、办公', '', '0', '3', '1', '/Public/upload/category/2016/09-23/57e47ba263759.png', '0_3', '1', '1', '0');
INSERT INTO `gwshop_goods_category` VALUES ('4', '手机配件', '', '1', '0', '1', '', '0_1_4', '2', '0', '0');
INSERT INTO `gwshop_goods_category` VALUES ('5', '数码相机', '', '7', '10', '1', '/Public/upload/category/2016/07-02/5777229c58b80.png', '0_1_7_5', '3', '1', '0');
INSERT INTO `gwshop_goods_category` VALUES ('6', '建材企业', '', '2', '0', '1', '', '0_2_6', '2', '1', '0');
INSERT INTO `gwshop_goods_category` VALUES ('7', '摄影摄像', '', '1', '0', '1', '', '0_1_7', '2', '1', '0');
INSERT INTO `gwshop_goods_category` VALUES ('8', '服装商城', '', '3', '0', '1', '', '_8', '2', '1', '0');
INSERT INTO `gwshop_goods_category` VALUES ('9', '电池 电源 充电器', '', '4', '0', '0', '', '0_1_4_9', '3', '0', '0');
INSERT INTO `gwshop_goods_category` VALUES ('10', '单反相机', '', '7', '0', '0', '', '0_1_7_10', '3', '1', '0');
INSERT INTO `gwshop_goods_category` VALUES ('11', '数据线,耳机', '', '4', '20', '0', '', '0_1_4_11', '3', '0', '0');
INSERT INTO `gwshop_goods_category` VALUES ('12', '贴膜,保护套', '', '4', '0', '0', '', '0_1_4_12', '3', '0', '0');
INSERT INTO `gwshop_goods_category` VALUES ('13', '美容美甲', '', '0', '1', '0', '/Public/upload/category/2016/08-11/57ac704ba8a19.jpg', '0_13', '1', '1', '0');
INSERT INTO `gwshop_goods_category` VALUES ('14', '面膜', '', '13', '0', '0', '', '0_13_14', '2', '1', '0');
INSERT INTO `gwshop_goods_category` VALUES ('15', '卫生巾', '', '0', '0', '0', '/Public/upload/category/2016/09-22/57e3941229b24.png', '0_15', '1', '1', '0');
INSERT INTO `gwshop_goods_category` VALUES ('16', '一号', '', '15', '0', '0', '/Public/upload/category/2016/09-22/57e39643e8b59.png', '0_15_16', '2', '1', '0');
INSERT INTO `gwshop_goods_category` VALUES ('17', '二号', '', '15', '0', '0', '/Public/upload/category/2016/09-22/57e3965d14974.png', '0_15_17', '2', '1', '0');
INSERT INTO `gwshop_goods_category` VALUES ('18', '三号', '', '15', '0', '0', '/Public/upload/category/2016/09-22/57e3967489807.png', '0_15_18', '2', '1', '0');

-- ----------------------------
-- Table structure for gwshop_goods_favorite
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_goods_favorite`;
CREATE TABLE `gwshop_goods_favorite` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '收藏编号',
  `user_id` mediumint(8) NOT NULL COMMENT '用户编号',
  `goods_id` mediumint(8) NOT NULL COMMENT '商品编号',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '收藏时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='用户商品收藏记录';

-- ----------------------------
-- Records of gwshop_goods_favorite
-- ----------------------------
INSERT INTO `gwshop_goods_favorite` VALUES ('1', '1', '4', '1470116852');
INSERT INTO `gwshop_goods_favorite` VALUES ('2', '1', '5', '1470117431');
INSERT INTO `gwshop_goods_favorite` VALUES ('3', '1', '6', '1470117452');
INSERT INTO `gwshop_goods_favorite` VALUES ('5', '11', '1', '1470887186');
INSERT INTO `gwshop_goods_favorite` VALUES ('6', '12', '6', '1470887540');
INSERT INTO `gwshop_goods_favorite` VALUES ('7', '12', '1', '1470887566');
INSERT INTO `gwshop_goods_favorite` VALUES ('8', '12', '5', '1470887673');
INSERT INTO `gwshop_goods_favorite` VALUES ('9', '14', '5', '1470917126');
INSERT INTO `gwshop_goods_favorite` VALUES ('15', '16', '4', '1471055459');
INSERT INTO `gwshop_goods_favorite` VALUES ('19', '20', '4', '1471057711');
INSERT INTO `gwshop_goods_favorite` VALUES ('21', '20', '3', '1471059210');
INSERT INTO `gwshop_goods_favorite` VALUES ('22', '20', '8', '1471059359');
INSERT INTO `gwshop_goods_favorite` VALUES ('23', '20', '2', '1471060706');
INSERT INTO `gwshop_goods_favorite` VALUES ('29', '3', '3', '1472026512');
INSERT INTO `gwshop_goods_favorite` VALUES ('33', '3', '7', '1472112534');
INSERT INTO `gwshop_goods_favorite` VALUES ('34', '3', '12', '1472112851');
INSERT INTO `gwshop_goods_favorite` VALUES ('35', '9', '11', '1472695656');
INSERT INTO `gwshop_goods_favorite` VALUES ('36', '3', '6', '1472700191');
INSERT INTO `gwshop_goods_favorite` VALUES ('37', '3', '1', '1472700402');
INSERT INTO `gwshop_goods_favorite` VALUES ('39', '16', '10', '1472709089');
INSERT INTO `gwshop_goods_favorite` VALUES ('40', '16', '5', '1472709115');
INSERT INTO `gwshop_goods_favorite` VALUES ('41', '16', '6', '1472711433');

-- ----------------------------
-- Table structure for gwshop_goods_images
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_goods_images`;
CREATE TABLE `gwshop_goods_images` (
  `img_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '图片id 自增',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `image_url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  PRIMARY KEY (`img_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gwshop_goods_images
-- ----------------------------
INSERT INTO `gwshop_goods_images` VALUES ('1', '1', '/Public/upload/goods/2016/07-02/5777297ff32b7.jpg');
INSERT INTO `gwshop_goods_images` VALUES ('3', '1', '/Public/upload/goods/2016/07-02/577730b21b7e8.jpg');
INSERT INTO `gwshop_goods_images` VALUES ('5', '5', '/Public/upload/goods/2016/07-02/5777da96d98c4.jpg');
INSERT INTO `gwshop_goods_images` VALUES ('6', '5', '/Public/upload/goods/2016/07-02/5777de661bcf2.jpg');
INSERT INTO `gwshop_goods_images` VALUES ('7', '6', 'aaaa');
INSERT INTO `gwshop_goods_images` VALUES ('8', '6', '/Public/upload/goods/2016/07-02/5777e28188fe7.jpg');
INSERT INTO `gwshop_goods_images` VALUES ('9', '3', '/Public/upload/goods/2016/07-05/577b599eeef18.jpg');
INSERT INTO `gwshop_goods_images` VALUES ('10', '2', '/Public/upload/goods/2016/07-05/577b594ba600c.jpg');
INSERT INTO `gwshop_goods_images` VALUES ('11', '1', '/Public/upload/goods/2016/07-25/5795c13b0d7cd.jpg');
INSERT INTO `gwshop_goods_images` VALUES ('12', '2', '/Public/upload/goods/2016/07-02/5777297ff32b7.jpg');
INSERT INTO `gwshop_goods_images` VALUES ('13', '3', '/Public/upload/goods/2016/09-22/57e3fa7ee020b.png');

-- ----------------------------
-- Table structure for gwshop_goods_type
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_goods_type`;
CREATE TABLE `gwshop_goods_type` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id自增',
  `name` varchar(60) NOT NULL COMMENT '类型名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gwshop_goods_type
-- ----------------------------
INSERT INTO `gwshop_goods_type` VALUES ('1', '运营商');
INSERT INTO `gwshop_goods_type` VALUES ('2', '相机');
INSERT INTO `gwshop_goods_type` VALUES ('3', '手机');
INSERT INTO `gwshop_goods_type` VALUES ('4', '电池、电源、充电器');

-- ----------------------------
-- Table structure for gwshop_goods_type_bak
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_goods_type_bak`;
CREATE TABLE `gwshop_goods_type_bak` (
  `id` smallint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品类型编号',
  `type_name` varchar(50) NOT NULL COMMENT '类型名称',
  `type_desc` varchar(50) NOT NULL COMMENT '类型描述',
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '该分类的父id',
  `sort_order` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '分类排序编号',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型状态:0可用,1不可用',
  `type_img` varchar(225) NOT NULL COMMENT '分类图片',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='商品类型';

-- ----------------------------
-- Records of gwshop_goods_type_bak
-- ----------------------------
INSERT INTO `gwshop_goods_type_bak` VALUES ('1', '网站建设', '', '0', '0', '1', '');
INSERT INTO `gwshop_goods_type_bak` VALUES ('2', '网站改版', '', '0', '0', '1', '');
INSERT INTO `gwshop_goods_type_bak` VALUES ('3', '电商策划', '', '0', '0', '1', '');
INSERT INTO `gwshop_goods_type_bak` VALUES ('4', '热门品类', '', '1', '0', '1', '');
INSERT INTO `gwshop_goods_type_bak` VALUES ('5', '建材商城', '', '4', '0', '1', '');
INSERT INTO `gwshop_goods_type_bak` VALUES ('6', '建材企业', '', '4', '0', '1', '');
INSERT INTO `gwshop_goods_type_bak` VALUES ('7', '农林企业', '', '4', '0', '1', '');
INSERT INTO `gwshop_goods_type_bak` VALUES ('8', '服装商城', '', '4', '0', '1', '');
INSERT INTO `gwshop_goods_type_bak` VALUES ('9', 'aaa', '', '5', '0', '0', '');

-- ----------------------------
-- Table structure for gwshop_goods_visit
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_goods_visit`;
CREATE TABLE `gwshop_goods_visit` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '浏览编号',
  `user_id` mediumint(8) NOT NULL COMMENT '用户编号',
  `goods_id` mediumint(8) NOT NULL COMMENT '商品编号',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '浏览时间',
  `type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品分类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户商品浏览记录';

-- ----------------------------
-- Records of gwshop_goods_visit
-- ----------------------------

-- ----------------------------
-- Table structure for gwshop_loggings
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_loggings`;
CREATE TABLE `gwshop_loggings` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志编号',
  `action` varchar(60) NOT NULL COMMENT '操作类型:添加用户,创建订单,支付订单等',
  `user_id` mediumint(8) NOT NULL COMMENT '用户编号',
  `content` longtext NOT NULL COMMENT '操作内容:详细操作内容序列化后存储',
  `log_time` int(11) NOT NULL DEFAULT '0' COMMENT '操作时间',
  `ip_address` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作者ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='操作日志';

-- ----------------------------
-- Records of gwshop_loggings
-- ----------------------------

-- ----------------------------
-- Table structure for gwshop_messages
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_messages`;
CREATE TABLE `gwshop_messages` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '站内信编号',
  `msg_type` varchar(60) NOT NULL COMMENT '站内信类型:促销信息,订单信息等',
  `title` varchar(60) NOT NULL COMMENT '站内信标题',
  `content` longtext NOT NULL COMMENT '标题内容',
  `msg_from` mediumint(8) NOT NULL COMMENT '发送者编号',
  `msg_to` mediumint(8) NOT NULL DEFAULT '0' COMMENT '接受者编号',
  `send_time` int(11) NOT NULL DEFAULT '0' COMMENT '发送时间',
  `read_time` int(11) NOT NULL DEFAULT '0' COMMENT '读取时间',
  `readed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '留言是否阅读，1，已阅读；0，未阅读',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站内信';

-- ----------------------------
-- Records of gwshop_messages
-- ----------------------------

-- ----------------------------
-- Table structure for gwshop_notice_assistant
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_notice_assistant`;
CREATE TABLE `gwshop_notice_assistant` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '客服助手',
  `topic` varchar(150) NOT NULL COMMENT '文章题目',
  `assistant_id` int(11) NOT NULL DEFAULT '0' COMMENT '客服id',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章添加时间',
  `type` smallint(1) NOT NULL DEFAULT '0' COMMENT 'topic发出者  1-客服人员  2-普通用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='文章内容表';

-- ----------------------------
-- Records of gwshop_notice_assistant
-- ----------------------------
INSERT INTO `gwshop_notice_assistant` VALUES ('1', '你好，我是客服人员aaa', '1', '2', '1467878670', '2');
INSERT INTO `gwshop_notice_assistant` VALUES ('2', '你好', '1', '2', '1467878751', '1');
INSERT INTO `gwshop_notice_assistant` VALUES ('3', '你好', '1', '2', '1467878771', '2');

-- ----------------------------
-- Table structure for gwshop_notice_order
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_notice_order`;
CREATE TABLE `gwshop_notice_order` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `title` varchar(150) NOT NULL COMMENT '文章题目',
  `content` longtext NOT NULL COMMENT '订单通知内容',
  `author` varchar(30) NOT NULL COMMENT '文章作者',
  `keywords` varchar(255) NOT NULL COMMENT '文章的关键字',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章添加时间',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户id',
  `order_id` int(11) unsigned NOT NULL COMMENT '关联的订单id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 COMMENT='文章内容表';

-- ----------------------------
-- Records of gwshop_notice_order
-- ----------------------------
INSERT INTO `gwshop_notice_order` VALUES ('1', '', '订单已经提交成功请尽快支付', '', '', '0', '2', '0');
INSERT INTO `gwshop_notice_order` VALUES ('2', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1469176740', '2', '5');
INSERT INTO `gwshop_notice_order` VALUES ('3', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1469176803', '2', '5');
INSERT INTO `gwshop_notice_order` VALUES ('4', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1469176820', '2', '5');
INSERT INTO `gwshop_notice_order` VALUES ('5', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1469177792', '2', '5');
INSERT INTO `gwshop_notice_order` VALUES ('6', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1469177819', '2', '5');
INSERT INTO `gwshop_notice_order` VALUES ('7', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1469524547', '2', '6');
INSERT INTO `gwshop_notice_order` VALUES ('8', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1469524581', '2', '7');
INSERT INTO `gwshop_notice_order` VALUES ('9', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1469525158', '2', '8');
INSERT INTO `gwshop_notice_order` VALUES ('10', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1469762830', '1', '9');
INSERT INTO `gwshop_notice_order` VALUES ('11', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1469776386', '1', '10');
INSERT INTO `gwshop_notice_order` VALUES ('12', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1469780331', '1', '11');
INSERT INTO `gwshop_notice_order` VALUES ('13', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1469780417', '1', '12');
INSERT INTO `gwshop_notice_order` VALUES ('14', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1469780493', '1', '13');
INSERT INTO `gwshop_notice_order` VALUES ('15', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1469780548', '1', '14');
INSERT INTO `gwshop_notice_order` VALUES ('16', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1470822182', '4', '15');
INSERT INTO `gwshop_notice_order` VALUES ('17', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1470822460', '4', '16');
INSERT INTO `gwshop_notice_order` VALUES ('18', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1470827754', '7', '17');
INSERT INTO `gwshop_notice_order` VALUES ('19', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1470895204', '11', '18');
INSERT INTO `gwshop_notice_order` VALUES ('20', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1470987717', '9', '19');
INSERT INTO `gwshop_notice_order` VALUES ('21', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1470988175', '9', '20');
INSERT INTO `gwshop_notice_order` VALUES ('22', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1470998251', '17', '21');
INSERT INTO `gwshop_notice_order` VALUES ('23', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471054626', '20', '22');
INSERT INTO `gwshop_notice_order` VALUES ('24', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471056303', '16', '23');
INSERT INTO `gwshop_notice_order` VALUES ('25', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471057154', '20', '24');
INSERT INTO `gwshop_notice_order` VALUES ('26', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471057401', '9', '25');
INSERT INTO `gwshop_notice_order` VALUES ('27', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471057993', '16', '26');
INSERT INTO `gwshop_notice_order` VALUES ('28', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471061189', '20', '27');
INSERT INTO `gwshop_notice_order` VALUES ('29', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471061394', '20', '28');
INSERT INTO `gwshop_notice_order` VALUES ('30', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471061407', '9', '29');
INSERT INTO `gwshop_notice_order` VALUES ('31', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471072760', '9', '30');
INSERT INTO `gwshop_notice_order` VALUES ('32', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471330880', '19', '31');
INSERT INTO `gwshop_notice_order` VALUES ('33', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471487203', '3', '32');
INSERT INTO `gwshop_notice_order` VALUES ('34', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471504847', '3', '33');
INSERT INTO `gwshop_notice_order` VALUES ('35', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471504854', '3', '34');
INSERT INTO `gwshop_notice_order` VALUES ('36', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471505222', '3', '35');
INSERT INTO `gwshop_notice_order` VALUES ('37', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471505530', '3', '36');
INSERT INTO `gwshop_notice_order` VALUES ('38', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471505636', '3', '37');
INSERT INTO `gwshop_notice_order` VALUES ('39', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471505696', '3', '38');
INSERT INTO `gwshop_notice_order` VALUES ('40', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471506126', '3', '39');
INSERT INTO `gwshop_notice_order` VALUES ('41', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471506161', '3', '40');
INSERT INTO `gwshop_notice_order` VALUES ('42', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471506281', '3', '41');
INSERT INTO `gwshop_notice_order` VALUES ('43', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471506340', '3', '42');
INSERT INTO `gwshop_notice_order` VALUES ('44', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471506515', '3', '43');
INSERT INTO `gwshop_notice_order` VALUES ('45', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471506713', '3', '44');
INSERT INTO `gwshop_notice_order` VALUES ('46', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471506767', '3', '45');
INSERT INTO `gwshop_notice_order` VALUES ('47', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471507082', '3', '46');
INSERT INTO `gwshop_notice_order` VALUES ('48', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471507149', '3', '47');
INSERT INTO `gwshop_notice_order` VALUES ('49', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471507361', '3', '48');
INSERT INTO `gwshop_notice_order` VALUES ('50', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471507466', '3', '49');
INSERT INTO `gwshop_notice_order` VALUES ('51', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471507641', '3', '50');
INSERT INTO `gwshop_notice_order` VALUES ('52', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471507859', '3', '51');
INSERT INTO `gwshop_notice_order` VALUES ('53', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471595219', '3', '52');
INSERT INTO `gwshop_notice_order` VALUES ('54', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471595296', '3', '53');
INSERT INTO `gwshop_notice_order` VALUES ('55', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471595307', '3', '54');
INSERT INTO `gwshop_notice_order` VALUES ('56', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471595324', '3', '55');
INSERT INTO `gwshop_notice_order` VALUES ('57', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471595330', '3', '56');
INSERT INTO `gwshop_notice_order` VALUES ('58', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471595343', '3', '57');
INSERT INTO `gwshop_notice_order` VALUES ('59', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471595416', '3', '58');
INSERT INTO `gwshop_notice_order` VALUES ('60', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471595456', '3', '59');
INSERT INTO `gwshop_notice_order` VALUES ('61', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471595460', '3', '60');
INSERT INTO `gwshop_notice_order` VALUES ('62', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471595461', '3', '61');
INSERT INTO `gwshop_notice_order` VALUES ('63', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471595466', '3', '62');
INSERT INTO `gwshop_notice_order` VALUES ('64', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471595571', '3', '63');
INSERT INTO `gwshop_notice_order` VALUES ('65', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471595577', '3', '64');
INSERT INTO `gwshop_notice_order` VALUES ('66', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471595582', '3', '65');
INSERT INTO `gwshop_notice_order` VALUES ('67', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471595662', '3', '66');
INSERT INTO `gwshop_notice_order` VALUES ('68', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471595782', '3', '67');
INSERT INTO `gwshop_notice_order` VALUES ('69', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471595798', '3', '68');
INSERT INTO `gwshop_notice_order` VALUES ('70', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471595807', '3', '69');
INSERT INTO `gwshop_notice_order` VALUES ('71', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471595846', '3', '70');
INSERT INTO `gwshop_notice_order` VALUES ('72', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471595877', '3', '71');
INSERT INTO `gwshop_notice_order` VALUES ('73', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471595903', '3', '72');
INSERT INTO `gwshop_notice_order` VALUES ('74', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471595967', '3', '73');
INSERT INTO `gwshop_notice_order` VALUES ('75', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471595971', '3', '74');
INSERT INTO `gwshop_notice_order` VALUES ('76', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471596045', '3', '75');
INSERT INTO `gwshop_notice_order` VALUES ('77', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471596058', '3', '76');
INSERT INTO `gwshop_notice_order` VALUES ('78', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471596097', '3', '77');
INSERT INTO `gwshop_notice_order` VALUES ('79', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471596114', '3', '78');
INSERT INTO `gwshop_notice_order` VALUES ('80', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471596120', '3', '79');
INSERT INTO `gwshop_notice_order` VALUES ('81', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471596138', '3', '80');
INSERT INTO `gwshop_notice_order` VALUES ('82', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471596144', '3', '81');
INSERT INTO `gwshop_notice_order` VALUES ('83', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471596162', '3', '82');
INSERT INTO `gwshop_notice_order` VALUES ('84', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471596163', '3', '83');
INSERT INTO `gwshop_notice_order` VALUES ('85', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471596248', '3', '84');
INSERT INTO `gwshop_notice_order` VALUES ('86', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471596333', '3', '85');
INSERT INTO `gwshop_notice_order` VALUES ('87', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471596351', '3', '86');
INSERT INTO `gwshop_notice_order` VALUES ('88', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471596364', '3', '87');
INSERT INTO `gwshop_notice_order` VALUES ('89', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471596375', '3', '88');
INSERT INTO `gwshop_notice_order` VALUES ('90', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471596424', '3', '89');
INSERT INTO `gwshop_notice_order` VALUES ('91', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471596466', '3', '90');
INSERT INTO `gwshop_notice_order` VALUES ('92', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471596467', '3', '91');
INSERT INTO `gwshop_notice_order` VALUES ('93', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471596472', '3', '92');
INSERT INTO `gwshop_notice_order` VALUES ('94', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471596639', '3', '93');
INSERT INTO `gwshop_notice_order` VALUES ('95', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471596993', '3', '94');
INSERT INTO `gwshop_notice_order` VALUES ('96', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471597799', '3', '95');
INSERT INTO `gwshop_notice_order` VALUES ('97', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471597823', '3', '96');
INSERT INTO `gwshop_notice_order` VALUES ('98', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471597850', '3', '97');
INSERT INTO `gwshop_notice_order` VALUES ('99', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471597899', '3', '98');
INSERT INTO `gwshop_notice_order` VALUES ('100', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471597926', '3', '99');
INSERT INTO `gwshop_notice_order` VALUES ('101', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471597927', '3', '100');
INSERT INTO `gwshop_notice_order` VALUES ('102', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471598114', '3', '101');
INSERT INTO `gwshop_notice_order` VALUES ('103', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471598157', '3', '102');
INSERT INTO `gwshop_notice_order` VALUES ('104', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471599174', '3', '103');
INSERT INTO `gwshop_notice_order` VALUES ('105', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471599317', '3', '104');
INSERT INTO `gwshop_notice_order` VALUES ('106', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1471599403', '3', '105');
INSERT INTO `gwshop_notice_order` VALUES ('107', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1472009184', '3', '106');
INSERT INTO `gwshop_notice_order` VALUES ('108', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1472025483', '3', '107');
INSERT INTO `gwshop_notice_order` VALUES ('109', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1472699029', '16', '108');
INSERT INTO `gwshop_notice_order` VALUES ('110', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1472699213', '16', '109');
INSERT INTO `gwshop_notice_order` VALUES ('111', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1472700396', '16', '110');
INSERT INTO `gwshop_notice_order` VALUES ('112', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1472701248', '16', '111');
INSERT INTO `gwshop_notice_order` VALUES ('113', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1472701671', '16', '112');
INSERT INTO `gwshop_notice_order` VALUES ('114', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1472710853', '21', '113');
INSERT INTO `gwshop_notice_order` VALUES ('115', '用户订单消息', '您好，您的订单已经生成，您的订单号是：1467789747891,应付款：10000.00，请尽快支付', '', '', '1472710935', '16', '114');

-- ----------------------------
-- Table structure for gwshop_notice_sales
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_notice_sales`;
CREATE TABLE `gwshop_notice_sales` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `title` varchar(150) NOT NULL COMMENT '文章题目',
  `content` longtext NOT NULL COMMENT '文章内容',
  `author` varchar(30) NOT NULL COMMENT '文章作者',
  `keywords` varchar(255) NOT NULL COMMENT '文章的关键字',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='文章内容表';

-- ----------------------------
-- Records of gwshop_notice_sales
-- ----------------------------
INSERT INTO `gwshop_notice_sales` VALUES ('2', '活动1', '活动1活动1活动1活动1活动1活动1活动1活动1', '', '', '1468462891');
INSERT INTO `gwshop_notice_sales` VALUES ('3', '活动2', '活动222活动222活动222活动222活动222活动222', '', '', '1468462904');

-- ----------------------------
-- Table structure for gwshop_order
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_order`;
CREATE TABLE `gwshop_order` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `order_sn` varchar(20) NOT NULL COMMENT '订单号，唯一',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户编号',
  `order_status` smallint(5) unsigned NOT NULL DEFAULT '100' COMMENT '订单状态',
  `shipping_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '商品配送情况，0，未发货；1，已发货；2，已收货；3，备货中',
  `pay_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '支付状态；0，未付款；1，付款中；2，已付款',
  `user_address` text NOT NULL COMMENT '收货地址',
  `user_address_id` mediumint(8) unsigned NOT NULL COMMENT '收货地址编号',
  `postscript` varchar(255) NOT NULL COMMENT '订单附言，由用户提交订单前填写',
  `pay_id` tinyint(3) NOT NULL DEFAULT '10' COMMENT '支付方式编号 ',
  `pay_name` varchar(120) NOT NULL COMMENT '支付方式名称',
  `inv_payee` varchar(120) NOT NULL COMMENT '发票抬头',
  `inv_content` varchar(120) NOT NULL COMMENT '发票内容',
  `tax` decimal(10,2) NOT NULL COMMENT '发票税额',
  `goods_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品总金额',
  `shipping_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '配送费用',
  `insure_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '保价费用',
  `pay_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '支付费用',
  `coupon_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '优惠券抵扣多少钱',
  `user_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '使用余额',
  `credit_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '使用积分抵多少钱',
  `money_paid` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '已付款金额',
  `order_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '应付款金额',
  `referer` varchar(255) NOT NULL COMMENT '订单的来源页面',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单生成时间',
  `confirm_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单确认时间',
  `cancel_time` int(10) unsigned NOT NULL COMMENT '取消订单时间',
  `pay_time` int(10) unsigned NOT NULL COMMENT '订单支付时间',
  `goods` text NOT NULL COMMENT '商品列表信息 json格式',
  `shipping_time` int(10) unsigned NOT NULL COMMENT '订单配送时间',
  `invoice_no` varchar(50) NOT NULL COMMENT '发货单号',
  `extension_code` varchar(30) NOT NULL COMMENT '通过活动购买的商品的代号；GROUP_BUY是团购；AUCTION，是拍卖；正常普通产品该处为空',
  `extension_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '通过活动购买的物品的id',
  `pay_note` varchar(255) NOT NULL COMMENT '付款备注',
  `is_separate` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0，未分成或等待分成；1，已分成；2，取消分成；',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '推荐分成的用户编号',
  `discount` decimal(10,2) NOT NULL COMMENT '折扣金额',
  `coupon_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券id',
  `credit_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用积分数量',
  `logistics_tracking` text NOT NULL COMMENT '物流跟踪',
  `mobile` varchar(60) NOT NULL DEFAULT '' COMMENT '收货人手机号',
  `consignee` varchar(60) NOT NULL DEFAULT '' COMMENT '收货人',
  `is_delete` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是被删除的订单  1是',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_sn` (`order_sn`),
  KEY `user_id` (`user_id`),
  KEY `order_status` (`order_status`),
  KEY `shipping_status` (`shipping_status`),
  KEY `pay_status` (`pay_status`),
  KEY `pay_id` (`pay_id`),
  KEY `extension_code` (`extension_code`,`extension_id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8 COMMENT='订单信息';

-- ----------------------------
-- Records of gwshop_order
-- ----------------------------
INSERT INTO `gwshop_order` VALUES ('1', '1467789747891', '2', '222', '0', '0', '', '0', '', '0', '', '', '', '0.00', '10000.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '10000.00', '', '1467789747', '1474609388', '0', '0', '[{\"id\":\"4\",\"goods_id\":\"1\",\"goods_name\":\"\\u3010\\u8682\\u8681\\u6444\\u5f71\\u3011\\u5355\\u53cd\\u5916\\u89c2Sony\\/\\u7d22\\u5c3c DSC-H400\\u9ad8\\u6e05\\u957f\\u7126\\u5c04\\u6708\\u6570\\u7801\\u7167\\u76f8\\u673a\",\"goods_price\":\"5000.00\",\"market_price\":\"1798.00\",\"goods_num\"', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '18620326542', 'www', '0');
INSERT INTO `gwshop_order` VALUES ('2', '1467789824684', '2', '222', '0', '0', '{\"id\":\"1\",\"address_name\":\"wubuze\",\"user_id\":\"1\",\"consignee\":\"wubuze\",\"email\":\"\",\"country\":\"0\",\"province\":\"11111\",\"city\":\"0\",\"district\":\"0\",\"address\":\"\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"18650306103\",\"sign_building\":\"\",\"best_time\":\"\"}', '0', '', '0', '', '', '', '0.00', '10000.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '10000.00', '', '1467789824', '1474609388', '0', '0', '[{\"id\":\"4\",\"goods_id\":\"1\",\"goods_name\":\"\\u3010\\u8682\\u8681\\u6444\\u5f71\\u3011\\u5355\\u53cd\\u5916\\u89c2Sony\\/\\u7d22\\u5c3c DSC-H400\\u9ad8\\u6e05\\u957f\\u7126\\u5c04\\u6708\\u6570\\u7801\\u7167\\u76f8\\u673a\",\"goods_price\":\"5000.00\",\"market_price\":\"1798.00\",\"goods_num\"', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '18620326542', 'aaa', '0');
INSERT INTO `gwshop_order` VALUES ('5', '1467791837759', '2', '222', '0', '0', '{\"id\":\"1\",\"address_name\":\"wubuze\",\"user_id\":\"1\",\"consignee\":\"wubuze\",\"email\":\"\",\"country\":\"0\",\"province\":\"11111\",\"city\":\"福州市\",\"district\":\"台江区\",\"address\":\"aaaaaaaaa\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"18650306102\",\"sign_building\":\"\",\"best_time\":\"\"}', '0', '', '0', '', '', '', '0.00', '10000.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '10000.00', '', '1467791837', '1474609388', '0', '0', '[{\"id\":\"4\",\"goods_id\":\"1\",\"goods_name\":\"\\u3010\\u8682\\u8681\\u6444\\u5f71\\u3011\\u5355\\u53cd\\u5916\\u89c2Sony\\/\\u7d22\\u5c3c DSC-H400\\u9ad8\\u6e05\\u957f\\u7126\\u5c04\\u6708\\u6570\\u7801\\u7167\\u76f8\\u673a\",\"goods_price\":\"5000.00\",\"market_price\":\"1798.00\",\"goods_num\":\"2\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '18620326542', 'ccc', '0');
INSERT INTO `gwshop_order` VALUES ('6', '1469524547956', '2', '222', '0', '1', '{\"id\":\"1\",\"address_name\":\"\",\"user_id\":\"2\",\"consignee\":\"wbz\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\",\"district\":\"\\u53f0\\u6c5f\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"18650306103\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"0\"}', '1', '', '0', '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '1469524547', '1474609388', '0', '1470301431', '[{\"goods_img\":null}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '18650306103', 'wbz', '1');
INSERT INTO `gwshop_order` VALUES ('7', '1469524581275', '2', '222', '0', '0', '{\"id\":\"1\",\"address_name\":\"\",\"user_id\":\"2\",\"consignee\":\"wbz\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\",\"district\":\"\\u53f0\\u6c5f\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"18650306103\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"0\"}', '1', '', '0', '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '1469524581', '1474609388', '0', '0', '[{\"goods_img\":null}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '18650306103', 'wbz', '0');
INSERT INTO `gwshop_order` VALUES ('8', '1469525158274', '2', '222', '0', '1', '{\"id\":\"1\",\"address_name\":\"\",\"user_id\":\"2\",\"consignee\":\"wbz\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\",\"district\":\"\\u53f0\\u6c5f\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"18650306103\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"0\"}', '1', '', '0', '', '', '', '0.00', '10100.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '10100.00', '10100.00', '', '1469525158', '1474609388', '0', '1470301157', '[{\"goods_img\":null},{\"goods_id\":\"1\",\"goods_name\":\"\\u3010\\u8682\\u8681\\u6444\\u5f71\\u3011\\u5355\\u53cd\\u5916\\u89c2Sony\\/\\u7d22\\u5c3c DSC-H400\\u9ad8\\u6e05\\u957f\\u7126\\u5c04\\u6708\\u6570\\u7801\\u7167\\u76f8\\u673a\",\"goods_price\":\"5000.00\",\"market_price\":\"1798.00\",\"goods_num\":\"2\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"1\",\"goods_name\":\"\\u3010\\u8682\\u8681\\u6444\\u5f71\\u3011\\u5355\\u53cd\\u5916\\u89c2Sony\\/\\u7d22\\u5c3c DSC-H400\\u9ad8\\u6e05\\u957f\\u7126\\u5c04\\u6708\\u6570\\u7801\\u7167\\u76f8\\u673a\",\"goods_price\":\"100.00\",\"market_price\":\"1798.00\",\"goods_num\":\"1\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '18650306103', 'wbz', '0');
INSERT INTO `gwshop_order` VALUES ('9', '1469762830596', '1', '222', '0', '0', '{\"id\":\"4\",\"address_name\":\"\",\"user_id\":\"1\",\"consignee\":\"hehe\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u5357\\u5e73\\u5e02\",\"district\":\"\\u5efa\\u74ef\\u5e02\",\"address\":\"aaaaaaaaaaaaa\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"18650306102\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '4', '留言', '0', '', '无不泽', '', '0.00', '10000.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '10000.00', '', '1469762830', '1474609388', '0', '0', '[{\"goods_id\":\"1\",\"goods_name\":\"\\u3010\\u8682\\u8681\\u6444\\u5f71\\u3011\\u5355\\u53cd\\u5916\\u89c2Sony\\/\\u7d22\\u5c3c DSC-H400\\u9ad8\\u6e05\\u957f\\u7126\\u5c04\\u6708\\u6570\\u7801\\u7167\\u76f8\\u673a\",\"goods_price\":\"5000.00\",\"market_price\":\"1798.00\",\"goods_num\":\"2\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '{\"status\":\"shutdown\",\"billstatus\":\"check\",\"message\":\"\",\"autoCheck\":\"0\",\"comOld\":\"\",\"comNew\":\"\",\"lastResult\":{\"message\":\"ok\",\"nu\":\"932134366237\",\"ischeck\":\"1\",\"condition\":\"F00\",\"com\":\"shunfeng\",\"status\":\"200\",\"state\":\"3\",\"data\":[{\"time\":\"2016-04-30 11:04:42\",\"ftime\":\"2016-04-30 11:04:42\",\"context\":\"已签收,感谢使用顺丰,期待再次为您服务\"},{\"time\":\"2016-04-30 09:25:56\",\"ftime\":\"2016-04-30 09:25:56\",\"context\":\"正在派送途中,请您准备签收(派件人:李治君,电话:15228578828)\"},{\"time\":\"2016-04-30 09:14:40\",\"ftime\":\"2016-04-30 09:14:40\",\"context\":\"快件到达 【攀枝花市仁和区正德街营业点】\"},{\"time\":\"2016-04-30 07:26:16\",\"ftime\":\"2016-04-30 07:26:16\",\"context\":\"快件离开【攀枝花市东区现代商贸营业点】,正发往 【攀枝花市仁和区正德街营业点】\"},{\"time\":\"2016-04-30 07:26:16\",\"ftime\":\"2016-04-30 07:26:16\",\"context\":\"快件到达 【攀枝花市东区现代商贸营业点】\"},{\"time\":\"2016-04-29 15:10:09\",\"ftime\":\"2016-04-29 15:10:09\",\"context\":\"快件离开【成都双流集散中心】,正发往 【攀枝花市东区现代商贸营业点】\"},{\"time\":\"2016-04-29 14:16:41\",\"ftime\":\"2016-04-29 14:16:41\",\"context\":\"快件到达 【成都双流集散中心】\"},{\"time\":\"2016-04-29 12:11:06\",\"ftime\":\"2016-04-29 12:11:06\",\"context\":\"快件离开【成都总集散中心】,正发往 【成都双流集散中心】\"},{\"time\":\"2016-04-29 12:10:36\",\"ftime\":\"2016-04-29 12:10:36\",\"context\":\"快件到达 【成都总集散中心】\"},{\"time\":\"2016-04-29 03:24:10\",\"ftime\":\"2016-04-29 03:24:10\",\"context\":\"快件离开【福州总集散中心】,正发往 【成都总集散中心】\"},{\"time\":\"2016-04-29 02:10:50\",\"ftime\":\"2016-04-29 02:10:50\",\"context\":\"快件到达 【福州总集散中心】\"},{\"time\":\"2016-04-29 01:15:41\",\"ftime\":\"2016-04-29 01:15:41\",\"context\":\"快件离开【福州尚干集散中心】,正发往 【福州总集散中心】\"},{\"time\":\"2016-04-28 22:51:16\",\"ftime\":\"2016-04-28 22:51:16\",\"context\":\"快件到达 【福州尚干集散中心】\"},{\"time\":\"2016-04-28 22:06:57\",\"ftime\":\"2016-04-28 22:06:57\",\"context\":\"快件离开【福州晋安台西营业点】,正发往 【福州尚干集散中心】\"},{\"time\":\"2016-04-28 20:34:21\",\"ftime\":\"2016-04-28 20:34:21\",\"context\":\"顺丰速运 已收取快件\"}]}}', '18650306102', 'hehe', '0');
INSERT INTO `gwshop_order` VALUES ('10', '1469776386209', '1', '222', '0', '0', '{\"id\":\"4\",\"address_name\":\"\",\"user_id\":\"1\",\"consignee\":\"hehe\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u5357\\u5e73\\u5e02\",\"district\":\"\\u5efa\\u74ef\\u5e02\",\"address\":\"aaaaaaaaaaaaa\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"18650306102\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '4', '', '0', '', '', '', '0.00', '10000.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '10000.00', '', '1469776386', '1474609388', '0', '0', '[{\"goods_id\":\"1\",\"goods_name\":\"\\u3010\\u8682\\u8681\\u6444\\u5f71\\u3011\\u5355\\u53cd\\u5916\\u89c2Sony\\/\\u7d22\\u5c3c DSC-H400\\u9ad8\\u6e05\\u957f\\u7126\\u5c04\\u6708\\u6570\\u7801\\u7167\\u76f8\\u673a\",\"goods_price\":\"5000.00\",\"market_price\":\"1798.00\",\"goods_num\":\"2\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '18650306102', 'hehe', '0');
INSERT INTO `gwshop_order` VALUES ('11', '1469780331454', '1', '222', '1', '1', '{\"id\":\"4\",\"address_name\":\"\",\"user_id\":\"1\",\"consignee\":\"hehe\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u5357\\u5e73\\u5e02\",\"district\":\"\\u5efa\\u74ef\\u5e02\",\"address\":\"aaaaaaaaaaaaa\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"18650306102\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '4', '', '0', '', '', '', '0.00', '10000.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '10000.00', '10000.00', '', '1469780331', '1474609388', '0', '1470300961', '[{\"goods_id\":\"1\",\"goods_name\":\"\\u3010\\u8682\\u8681\\u6444\\u5f71\\u3011\\u5355\\u53cd\\u5916\\u89c2Sony\\/\\u7d22\\u5c3c DSC-H400\\u9ad8\\u6e05\\u957f\\u7126\\u5c04\\u6708\\u6570\\u7801\\u7167\\u76f8\\u673a\",\"goods_price\":\"5000.00\",\"market_price\":\"1798.00\",\"goods_num\":\"2\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"}]', '1470366698', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '18650306102', 'hehe', '0');
INSERT INTO `gwshop_order` VALUES ('12', '1469780417136', '1', '222', '1', '1', '{\"id\":\"4\",\"address_name\":\"\",\"user_id\":\"1\",\"consignee\":\"hehe\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u5357\\u5e73\\u5e02\",\"district\":\"\\u5efa\\u74ef\\u5e02\",\"address\":\"aaaaaaaaaaaaa\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"18650306102\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '4', '', '0', '', '', '', '0.00', '10000.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '10000.00', '10000.00', '', '1469780417', '1474609388', '0', '1470044063', '[{\"goods_id\":\"1\",\"goods_name\":\"\\u3010\\u8682\\u8681\\u6444\\u5f71\\u3011\\u5355\\u53cd\\u5916\\u89c2Sony\\/\\u7d22\\u5c3c DSC-H400\\u9ad8\\u6e05\\u957f\\u7126\\u5c04\\u6708\\u6570\\u7801\\u7167\\u76f8\\u673a\",\"goods_price\":\"5000.00\",\"market_price\":\"1798.00\",\"goods_num\":\"2\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"}]', '1470044099', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '18650306102', 'hehe', '0');
INSERT INTO `gwshop_order` VALUES ('13', '1469780493407', '1', '222', '1', '1', '{\"id\":\"4\",\"address_name\":\"\",\"user_id\":\"1\",\"consignee\":\"hehe\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u5357\\u5e73\\u5e02\",\"district\":\"\\u5efa\\u74ef\\u5e02\",\"address\":\"aaaaaaaaaaaaa\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"18650306102\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '4', '', '0', '', '', '', '0.00', '10000.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '10000.00', '10000.00', '', '1469780493', '1474609388', '0', '1470040115', '[{\"goods_id\":\"1\",\"goods_name\":\"\\u3010\\u8682\\u8681\\u6444\\u5f71\\u3011\\u5355\\u53cd\\u5916\\u89c2Sony\\/\\u7d22\\u5c3c DSC-H400\\u9ad8\\u6e05\\u957f\\u7126\\u5c04\\u6708\\u6570\\u7801\\u7167\\u76f8\\u673a\",\"goods_price\":\"5000.00\",\"market_price\":\"1798.00\",\"goods_num\":\"2\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"}]', '1470043613', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '18650306102', 'hehe', '0');
INSERT INTO `gwshop_order` VALUES ('14', '1469780548415', '1', '222', '1', '1', '{\"id\":\"4\",\"address_name\":\"\",\"user_id\":\"1\",\"consignee\":\"hehe\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u5357\\u5e73\\u5e02\",\"district\":\"\\u5efa\\u74ef\\u5e02\",\"address\":\"aaaaaaaaaaaaa\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"18650306102\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '4', '', '0', '', '', '', '0.00', '10000.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '10000.00', '10000.00', '', '1469780548', '1474609388', '0', '1470037630', '[{\"goods_id\":\"1\",\"goods_name\":\"\\u3010\\u8682\\u8681\\u6444\\u5f71\\u3011\\u5355\\u53cd\\u5916\\u89c2Sony\\/\\u7d22\\u5c3c DSC-H400\\u9ad8\\u6e05\\u957f\\u7126\\u5c04\\u6708\\u6570\\u7801\\u7167\\u76f8\\u673a\",\"goods_price\":\"5000.00\",\"market_price\":\"1798.00\",\"goods_num\":\"2\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"}]', '1470043484', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '18650306102', 'hehe', '1');
INSERT INTO `gwshop_order` VALUES ('15', '1470822182343', '4', '222', '0', '0', '{\"id\":\"5\",\"address_name\":\"\",\"user_id\":\"4\",\"consignee\":\"\\u54c8\\u54c8\\u54c8\\u54c8\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u5357\\u5e73\\u5e02\",\"district\":\"\\u6d66\\u57ce\\u53bf\",\"address\":\"MSN\\u6444\\u5f71\\u5e08\\u6211\\u8bf4\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"18652358698\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '5', '姐 in 入迷', '0', '', '电子发票', '', '0.00', '5000.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '5000.00', '', '1470822182', '1474609388', '0', '0', '[{\"goods_id\":\"1\",\"goods_name\":\"\\u3010\\u8682\\u8681\\u6444\\u5f71\\u3011\\u5355\\u53cd\\u5916\\u89c2Sony\\/\\u7d22\\u5c3c DSC-H400\\u9ad8\\u6e05\\u957f\\u7126\\u5c04\\u6708\\u6570\\u7801\\u7167\\u76f8\\u673a\",\"goods_price\":\"5000.00\",\"market_price\":\"1798.00\",\"goods_num\":\"1\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '18652358698', '哈哈哈哈', '0');
INSERT INTO `gwshop_order` VALUES ('16', '1470822460389', '4', '222', '0', '0', '{\"id\":\"5\",\"address_name\":\"\",\"user_id\":\"4\",\"consignee\":\"\\u54c8\\u54c8\\u54c8\\u54c8\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u5357\\u5e73\\u5e02\",\"district\":\"\\u6d66\\u57ce\\u53bf\",\"address\":\"MSN\\u6444\\u5f71\\u5e08\\u6211\\u8bf4\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"18652358698\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '5', '', '0', '', '电子发票', '', '0.00', '5000.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '5000.00', '', '1470822460', '1474609388', '0', '0', '[{\"goods_id\":\"1\",\"goods_name\":\"\\u3010\\u8682\\u8681\\u6444\\u5f71\\u3011\\u5355\\u53cd\\u5916\\u89c2Sony\\/\\u7d22\\u5c3c DSC-H400\\u9ad8\\u6e05\\u957f\\u7126\\u5c04\\u6708\\u6570\\u7801\\u7167\\u76f8\\u673a\",\"goods_price\":\"5000.00\",\"market_price\":\"1798.00\",\"goods_num\":\"1\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '18652358698', '哈哈哈哈', '0');
INSERT INTO `gwshop_order` VALUES ('17', '1470827754252', '7', '222', '0', '0', '{\"id\":\"6\",\"address_name\":\"\",\"user_id\":\"7\",\"consignee\":\"1\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u5b89\\u5fbd\\u7701\",\"city\":\"\\u6c60\\u5dde\\u5e02\",\"district\":\"\\u77f3\\u53f0\\u53bf\",\"address\":\"\\u597d\\u4e86\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"18650718184\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '6', '111', '0', '', '个人发票', '', '0.00', '1233.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1233.00', '', '1470827754', '1474609388', '0', '0', '[{\"goods_id\":\"5\",\"goods_name\":\"aaaa\",\"goods_price\":\"1233.00\",\"market_price\":\"20.00\",\"goods_num\":\"1\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '18650718184', '1', '0');
INSERT INTO `gwshop_order` VALUES ('18', '1470895204396', '11', '222', '0', '0', '{\"id\":\"12\",\"address_name\":\"\",\"user_id\":\"11\",\"consignee\":\"johnn\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u54c8\\u54c8\\u54c8\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"15080128528\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"0\"}', '12', '', '0', '', '电子发票', '', '0.00', '244.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '244.00', '', '1470895204', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"2\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-05\\/577b594ba600c.jpg\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '15080128528', 'johnn', '0');
INSERT INTO `gwshop_order` VALUES ('19', '1470987717248', '9', '222', '0', '0', '{\"id\":\"15\",\"address_name\":\"\",\"user_id\":\"9\",\"consignee\":\"alluvial\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u9ed1\\u9f99\\u6c5f\\u7701\",\"city\":\"\\u4e03\\u53f0\\u6cb3\\u5e02\",\"district\":\"\\u65b0\\u5174\\u533a\",\"address\":\"all\\u56fe\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"1558455\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"0\"}', '15', '', '0', '', '电子发票', '', '0.00', '7995.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '7995.00', '', '1470987717', '1474609388', '0', '0', '[{\"goods_id\":\"7\",\"goods_name\":\"\\u5c0f\\u7c73MAX\",\"goods_price\":\"1599.00\",\"market_price\":\"1999.00\",\"goods_num\":\"5\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '1558455', 'alluvial', '1');
INSERT INTO `gwshop_order` VALUES ('20', '1470988175128', '9', '222', '0', '0', '{\"id\":\"15\",\"address_name\":\"\",\"user_id\":\"9\",\"consignee\":\"alluvial\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u9ed1\\u9f99\\u6c5f\\u7701\",\"city\":\"\\u4e03\\u53f0\\u6cb3\\u5e02\",\"district\":\"\\u65b0\\u5174\\u533a\",\"address\":\"all\\u56fe\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"1558455\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"0\"}', '15', '', '0', '', '电子发票', '', '0.00', '5337.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '5337.00', '', '1470988175', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"177.00\",\"market_price\":\"85.00\",\"goods_num\":\"1\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-05\\/577b594ba600c.jpg\"},{\"goods_id\":\"1\",\"goods_name\":\"\\u3010\\u8682\\u8681\\u6444\\u5f71\\u3011\\u5355\\u53cd\\u5916\\u89c2Sony\\/\\u7d22\\u5c3c DSC-H400\\u9ad8\\u6e05\\u957f\\u7126\\u5c04\\u6708\\u6570\\u7801\\u7167\\u76f8\\u673a\",\"goods_price\":\"5000.00\",\"market_price\":\"1798.00\",\"goods_num\":\"1\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"4\",\"goods_name\":\"cccccc\",\"goods_price\":\"100.00\",\"market_price\":\"120.00\",\"goods_num\":\"1\",\"spec_key_name\":\"\",\"goods_img\":\"\"},{\"goods_id\":\"3\",\"goods_name\":\"\\u732a\\u809a500g\",\"goods_price\":\"20.00\",\"market_price\":\"25.00\",\"goods_num\":\"3\",\"spec_key_name\":\"\",\"goods_img\":\"\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '1558455', 'alluvial', '1');
INSERT INTO `gwshop_order` VALUES ('21', '1470998251301', '17', '222', '0', '0', '{\"id\":\"5\",\"address_name\":\"\",\"user_id\":\"4\",\"consignee\":\"\\u54c8\\u54c8\\u54c8\\u54c8\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u5357\\u5e73\\u5e02\",\"district\":\"\\u6d66\\u57ce\\u53bf\",\"address\":\"MSN\\u6444\\u5f71\\u5e08\\u6211\\u8bf4\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"18652358698\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '5', '', '0', '', '电子发票', '', '0.00', '120.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '120.00', '', '1470998251', '1474609388', '0', '0', '[{\"goods_id\":\"1\",\"goods_name\":\"\\u3010\\u8682\\u8681\\u6444\\u5f71\\u3011\\u5355\\u53cd\\u5916\\u89c2Sony\\/\\u7d22\\u5c3c DSC-H400\\u9ad8\\u6e05\\u957f\\u7126\\u5c04\\u6708\\u6570\\u7801\\u7167\\u76f8\\u673a\",\"goods_price\":\"120.00\",\"market_price\":\"1798.00\",\"goods_num\":\"1\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '18652358698', '哈哈哈哈', '1');
INSERT INTO `gwshop_order` VALUES ('22', '1471054626215', '20', '222', '0', '1', '{\"id\":\"16\",\"address_name\":\"\",\"user_id\":\"20\",\"consignee\":\"\\u59da\\u9526\\u4e50\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u95fd\\u4faf\\u53bf\",\"address\":\"\\u798f\\u5dde\\u5927\\u5b66\\u751f\\u6d3b1\\u533a1\\u53f7\\u697c\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"15060151736\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '16', '', '0', '', '', '', '0.00', '1233.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1.00', '1233.00', '', '1471054626', '1474609388', '0', '1471054640', '[{\"goods_id\":\"5\",\"goods_name\":\"aaaa\",\"goods_price\":\"1233.00\",\"market_price\":\"20.00\",\"goods_num\":\"1\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '15060151736', '姚锦乐', '0');
INSERT INTO `gwshop_order` VALUES ('23', '1471056303425', '16', '222', '1', '1', '{\"id\":\"19\",\"address_name\":\"\",\"user_id\":\"16\",\"consignee\":\"\\uff1f\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u5b89\\u5fbd\\u7701\",\"city\":\"\\u5b89\\u5e86\\u5e02\",\"district\":\"\\u6000\\u5b81\\u53bf\",\"address\":\"\\u5bbf\\u820d\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13008796401\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '19', '', '0', '', '电子发票', '', '0.00', '6.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1.00', '6.00', '', '1471056303', '1474609388', '0', '1471056311', '[{\"goods_id\":\"12\",\"goods_name\":\"\\u5355\\u53cd\",\"goods_price\":\"1.00\",\"market_price\":\"1.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\",\"goods_img\":\"\"}]', '1471057096', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13008796401', '？', '1');
INSERT INTO `gwshop_order` VALUES ('24', '1471057154263', '20', '222', '1', '1', '{\"id\":\"16\",\"address_name\":\"\",\"user_id\":\"20\",\"consignee\":\"\\u59da\\u9526\\u4e50\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u95fd\\u4faf\\u53bf\",\"address\":\"\\u798f\\u5dde\\u5927\\u5b66\\u751f\\u6d3b1\\u533a1\\u53f7\\u697c\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"15060151736\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '16', '', '0', '', '个人发票', '', '0.00', '1410.00', '0.00', '0.00', '0.00', '10.00', '0.00', '0.00', '1.00', '1400.00', '', '1471057154', '1474609388', '0', '1471057161', '[{\"goods_id\":\"5\",\"goods_name\":\"aaaa\",\"goods_price\":\"1233.00\",\"market_price\":\"20.00\",\"goods_num\":\"1\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"\"},{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"177.00\",\"market_price\":\"85.00\",\"goods_num\":\"1\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"}]', '1471057492', '', '', '0', '', '0', '0', '0.00', '47', '0', '', '15060151736', '姚锦乐', '0');
INSERT INTO `gwshop_order` VALUES ('25', '1471057401770', '9', '222', '0', '0', '{\"id\":\"15\",\"address_name\":\"\",\"user_id\":\"9\",\"consignee\":\"alluvial\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u9ed1\\u9f99\\u6c5f\\u7701\",\"city\":\"\\u4e03\\u53f0\\u6cb3\\u5e02\",\"district\":\"\\u65b0\\u5174\\u533a\",\"address\":\"all\\u56fe\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"1558455\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"0\"}', '15', '', '0', '', '电子发票', '', '0.00', '177.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '177.00', '', '1471057401', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"177.00\",\"market_price\":\"85.00\",\"goods_num\":\"1\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '1558455', 'alluvial', '1');
INSERT INTO `gwshop_order` VALUES ('26', '1471057993459', '16', '222', '0', '1', '{\"id\":\"22\",\"address_name\":\"\",\"user_id\":\"16\",\"consignee\":\"\\u8d77\\u6765\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u7518\\u8083\\u7701\",\"city\":\"\\u7518\\u5357\\u85cf\\u65cf\\u81ea\\u6cbb\\u5dde\",\"district\":\"\\u4e34\\u6f6d\\u53bf\",\"address\":\"\\uff0c\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13038790401\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"0\"}', '22', '', '0', '', '电子发票', '', '0.00', '354.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1.00', '354.00', '', '1471057993', '1474609388', '0', '1471058000', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"177.00\",\"market_price\":\"85.00\",\"goods_num\":\"2\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13038790401', '起来', '0');
INSERT INTO `gwshop_order` VALUES ('27', '1471061189167', '20', '222', '0', '1', '{\"id\":\"16\",\"address_name\":\"\",\"user_id\":\"20\",\"consignee\":\"\\u59da\\u9526\\u4e50\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u95fd\\u4faf\\u53bf\",\"address\":\"\\u798f\\u5dde\\u5927\\u5b66\\u751f\\u6d3b1\\u533a1\\u53f7\\u697c\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"15060151736\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '16', '', '0', '', '电子发票', '', '0.00', '10298.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1.00', '10298.00', '', '1471061189', '1474609388', '0', '1471061195', '[{\"goods_id\":\"5\",\"goods_name\":\"aaaa\",\"goods_price\":\"1233.00\",\"market_price\":\"20.00\",\"goods_num\":\"1\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"\"},{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"177.00\",\"market_price\":\"85.00\",\"goods_num\":\"1\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"4444.00\",\"market_price\":\"299.01\",\"goods_num\":\"2\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '15060151736', '姚锦乐', '0');
INSERT INTO `gwshop_order` VALUES ('28', '1471061394199', '20', '222', '0', '1', '{\"id\":\"16\",\"address_name\":\"\",\"user_id\":\"20\",\"consignee\":\"\\u59da\\u9526\\u4e50\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u95fd\\u4faf\\u53bf\",\"address\":\"\\u798f\\u5dde\\u5927\\u5b66\\u751f\\u6d3b1\\u533a1\\u53f7\\u697c\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"15060151736\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '16', '', '0', '', '电子发票', '', '0.00', '8888.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1.00', '8888.00', '', '1471061394', '1474609388', '0', '1471061399', '[{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"4444.00\",\"market_price\":\"299.01\",\"goods_num\":\"2\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '15060151736', '姚锦乐', '0');
INSERT INTO `gwshop_order` VALUES ('29', '1471061407110', '9', '222', '0', '1', '{\"id\":\"14\",\"address_name\":\"\",\"user_id\":\"9\",\"consignee\":\"125\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u5e7f\\u897f\\u58ee\\u65cf\\u81ea\\u6cbb\\u533a\",\"city\":\"\\u6842\\u6797\\u5e02\",\"district\":\"\\u4e34\\u6842\\u53bf\",\"address\":\"\\u56fe\\u76d1\\u63a7\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"12\\u52a0577\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '14', '', '0', '', '电子发票', '', '0.00', '177.00', '0.00', '0.00', '0.00', '10.00', '0.00', '0.00', '1.00', '167.00', '', '1471061407', '1474609388', '0', '1471197015', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"177.00\",\"market_price\":\"85.00\",\"goods_num\":\"1\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"}]', '0', '', '', '0', '', '0', '0', '0.00', '24', '0', '', '12加577', '125', '0');
INSERT INTO `gwshop_order` VALUES ('30', '1471072760298', '9', '222', '0', '0', '{\"id\":\"14\",\"address_name\":\"\",\"user_id\":\"9\",\"consignee\":\"125\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u5e7f\\u897f\\u58ee\\u65cf\\u81ea\\u6cbb\\u533a\",\"city\":\"\\u6842\\u6797\\u5e02\",\"district\":\"\\u4e34\\u6842\\u53bf\",\"address\":\"\\u56fe\\u76d1\\u63a7\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"12\\u52a0577\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '14', '', '0', '', '电子发票', '', '0.00', '177.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '177.00', '', '1471072760', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"177.00\",\"market_price\":\"85.00\",\"goods_num\":\"1\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '12加577', '125', '1');
INSERT INTO `gwshop_order` VALUES ('31', '1471330880116', '19', '222', '0', '0', '{\"id\":\"27\",\"address_name\":\"\",\"user_id\":\"19\",\"consignee\":\"w\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u7518\\u8083\\u7701\",\"city\":\"\\u5609\\u5cea\\u5173\\u5e02\",\"district\":\"\\u5e02\\u8f96\\u533a\",\"address\":\"svasdfa\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"18650326210\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '27', '', '0', '', '电子发票', '', '0.00', '100.00', '0.00', '0.00', '0.00', '10.00', '0.00', '0.00', '0.00', '90.00', '', '1471330880', '1474609388', '0', '0', '[{\"goods_id\":\"4\",\"goods_name\":\"cccccc\",\"goods_price\":\"100.00\",\"market_price\":\"120.00\",\"goods_num\":\"1\",\"spec_key_name\":\"\",\"goods_img\":\"\"}]', '0', '', '', '0', '', '0', '0', '0.00', '44', '0', '', '18650326210', 'w', '0');
INSERT INTO `gwshop_order` VALUES ('32', '1471487202132', '3', '222', '0', '0', '{\"id\":\"10\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6211\\u7684\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u5b89\\u5fbd\\u7701\",\"city\":\"\\u6c60\\u5dde\\u5e02\",\"district\":\"\\u9752\\u9633\\u53bf\",\"address\":\"\\u6545\\u4e61\\u7684\\u4e91\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599485726\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '10', '', '0', '', '电子发票', '', '0.00', '1470.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1470.00', '', '1471487202', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"12\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"13\",\"goods_name\":\"1111\",\"goods_price\":\"1.00\",\"market_price\":\"1.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\",\"goods_img\":\"\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599485726', '我的', '1');
INSERT INTO `gwshop_order` VALUES ('33', '1471504847121', '3', '222', '0', '0', '{\"id\":\"10\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6211\\u7684\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u5b89\\u5fbd\\u7701\",\"city\":\"\\u6c60\\u5dde\\u5e02\",\"district\":\"\\u9752\\u9633\\u53bf\",\"address\":\"\\u6545\\u4e61\\u7684\\u4e91\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599485726\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '10', '', '0', '', '电子发票', '', '0.00', '14028.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '14028.00', '', '1471504847', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"13\",\"goods_name\":\"1111\",\"goods_price\":\"1.00\",\"market_price\":\"1.00\",\"goods_num\":\"8\",\"spec_key_name\":\"\",\"goods_img\":\"\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"4\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599485726', '我的', '1');
INSERT INTO `gwshop_order` VALUES ('34', '1471504854126', '3', '222', '0', '0', '{\"id\":\"10\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6211\\u7684\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u5b89\\u5fbd\\u7701\",\"city\":\"\\u6c60\\u5dde\\u5e02\",\"district\":\"\\u9752\\u9633\\u53bf\",\"address\":\"\\u6545\\u4e61\\u7684\\u4e91\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599485726\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '10', '', '0', '', '电子发票', '', '0.00', '14028.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '14028.00', '', '1471504854', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"13\",\"goods_name\":\"1111\",\"goods_price\":\"1.00\",\"market_price\":\"1.00\",\"goods_num\":\"8\",\"spec_key_name\":\"\",\"goods_img\":\"\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"4\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599485726', '我的', '1');
INSERT INTO `gwshop_order` VALUES ('35', '1471505222700', '3', '222', '0', '0', '{\"id\":\"10\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6211\\u7684\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u5b89\\u5fbd\\u7701\",\"city\":\"\\u6c60\\u5dde\\u5e02\",\"district\":\"\\u9752\\u9633\\u53bf\",\"address\":\"\\u6545\\u4e61\\u7684\\u4e91\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599485726\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '10', '', '0', '', '电子发票', '', '0.00', '14028.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '14028.00', '', '1471505222', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"13\",\"goods_name\":\"1111\",\"goods_price\":\"1.00\",\"market_price\":\"1.00\",\"goods_num\":\"8\",\"spec_key_name\":\"\",\"goods_img\":\"\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"4\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599485726', '我的', '1');
INSERT INTO `gwshop_order` VALUES ('36', '1471505530400', '3', '222', '0', '0', '{\"id\":\"10\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6211\\u7684\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u5b89\\u5fbd\\u7701\",\"city\":\"\\u6c60\\u5dde\\u5e02\",\"district\":\"\\u9752\\u9633\\u53bf\",\"address\":\"\\u6545\\u4e61\\u7684\\u4e91\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599485726\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '10', '', '0', '', '电子发票', '', '0.00', '13040.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '13040.00', '', '1471505530', '1474609388', '0', '0', '[{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"4\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"},{\"goods_id\":\"1\",\"goods_name\":\"\\u3010\\u8682\\u8681\\u6444\\u5f71\\u3011\\u5355\\u53cd\\u5916\\u89c2Sony\\/\\u7d22\\u5c3c DSC-H400\\u9ad8\\u6e05\\u957f\\u7126\\u5c04\\u6708\\u6570\\u7801\\u7167\\u76f8\\u673a\",\"goods_price\":\"120.00\",\"market_price\":\"1798.00\",\"goods_num\":\"2\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599485726', '我的', '0');
INSERT INTO `gwshop_order` VALUES ('37', '1471505636967', '3', '222', '0', '0', '{\"id\":\"10\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6211\\u7684\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u5b89\\u5fbd\\u7701\",\"city\":\"\\u6c60\\u5dde\\u5e02\",\"district\":\"\\u9752\\u9633\\u53bf\",\"address\":\"\\u6545\\u4e61\\u7684\\u4e91\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599485726\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '10', '', '0', '', '电子发票', '', '0.00', '13040.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '13040.00', '', '1471505636', '1474609388', '0', '0', '[{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"4\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"},{\"goods_id\":\"1\",\"goods_name\":\"\\u3010\\u8682\\u8681\\u6444\\u5f71\\u3011\\u5355\\u53cd\\u5916\\u89c2Sony\\/\\u7d22\\u5c3c DSC-H400\\u9ad8\\u6e05\\u957f\\u7126\\u5c04\\u6708\\u6570\\u7801\\u7167\\u76f8\\u673a\",\"goods_price\":\"120.00\",\"market_price\":\"1798.00\",\"goods_num\":\"2\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599485726', '我的', '1');
INSERT INTO `gwshop_order` VALUES ('38', '1471505696777', '3', '222', '0', '0', '{\"id\":\"10\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6211\\u7684\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u5b89\\u5fbd\\u7701\",\"city\":\"\\u6c60\\u5dde\\u5e02\",\"district\":\"\\u9752\\u9633\\u53bf\",\"address\":\"\\u6545\\u4e61\\u7684\\u4e91\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599485726\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '10', '', '0', '', '电子发票', '', '0.00', '12808.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '12808.00', '', '1471505696', '1474609388', '0', '0', '[{\"goods_id\":\"13\",\"goods_name\":\"1111\",\"goods_price\":\"1.00\",\"market_price\":\"1.00\",\"goods_num\":\"8\",\"spec_key_name\":\"\",\"goods_img\":\"\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"4\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599485726', '我的', '1');
INSERT INTO `gwshop_order` VALUES ('39', '1471506126838', '3', '222', '0', '0', '{\"id\":\"10\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6211\\u7684\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u5b89\\u5fbd\\u7701\",\"city\":\"\\u6c60\\u5dde\\u5e02\",\"district\":\"\\u9752\\u9633\\u53bf\",\"address\":\"\\u6545\\u4e61\\u7684\\u4e91\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599485726\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '10', '', '0', '', '电子发票', '', '0.00', '14020.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '14020.00', '', '1471506126', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"4\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599485726', '我的', '0');
INSERT INTO `gwshop_order` VALUES ('40', '1471506161428', '3', '222', '0', '0', '{\"id\":\"10\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6211\\u7684\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u5b89\\u5fbd\\u7701\",\"city\":\"\\u6c60\\u5dde\\u5e02\",\"district\":\"\\u9752\\u9633\\u53bf\",\"address\":\"\\u6545\\u4e61\\u7684\\u4e91\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599485726\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '10', '', '0', '', '电子发票', '', '0.00', '240.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '240.00', '', '1471506161', '1474609388', '0', '0', '[{\"goods_id\":\"1\",\"goods_name\":\"\\u3010\\u8682\\u8681\\u6444\\u5f71\\u3011\\u5355\\u53cd\\u5916\\u89c2Sony\\/\\u7d22\\u5c3c DSC-H400\\u9ad8\\u6e05\\u957f\\u7126\\u5c04\\u6708\\u6570\\u7801\\u7167\\u76f8\\u673a\",\"goods_price\":\"120.00\",\"market_price\":\"1798.00\",\"goods_num\":\"2\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599485726', '我的', '1');
INSERT INTO `gwshop_order` VALUES ('41', '1471506281310', '3', '222', '0', '0', '{\"id\":\"10\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6211\\u7684\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u5b89\\u5fbd\\u7701\",\"city\":\"\\u6c60\\u5dde\\u5e02\",\"district\":\"\\u9752\\u9633\\u53bf\",\"address\":\"\\u6545\\u4e61\\u7684\\u4e91\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599485726\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '10', '', '0', '', '电子发票', '', '0.00', '12800.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '12800.00', '', '1471506281', '1474609388', '0', '0', '[{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"4\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599485726', '我的', '1');
INSERT INTO `gwshop_order` VALUES ('42', '1471506340287', '3', '222', '0', '0', '{\"id\":\"10\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6211\\u7684\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u5b89\\u5fbd\\u7701\",\"city\":\"\\u6c60\\u5dde\\u5e02\",\"district\":\"\\u9752\\u9633\\u53bf\",\"address\":\"\\u6545\\u4e61\\u7684\\u4e91\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599485726\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '10', '', '0', '', '电子发票', '', '0.00', '12800.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '12800.00', '', '1471506340', '1474609388', '0', '0', '[{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"4\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599485726', '我的', '1');
INSERT INTO `gwshop_order` VALUES ('43', '1471506515739', '3', '222', '0', '0', '{\"id\":\"10\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6211\\u7684\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u5b89\\u5fbd\\u7701\",\"city\":\"\\u6c60\\u5dde\\u5e02\",\"district\":\"\\u9752\\u9633\\u53bf\",\"address\":\"\\u6545\\u4e61\\u7684\\u4e91\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599485726\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '10', '', '0', '', '电子发票', '', '0.00', '240.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '240.00', '', '1471506515', '1474609388', '0', '0', '[{\"goods_id\":\"1\",\"goods_name\":\"\\u3010\\u8682\\u8681\\u6444\\u5f71\\u3011\\u5355\\u53cd\\u5916\\u89c2Sony\\/\\u7d22\\u5c3c DSC-H400\\u9ad8\\u6e05\\u957f\\u7126\\u5c04\\u6708\\u6570\\u7801\\u7167\\u76f8\\u673a\",\"goods_price\":\"120.00\",\"market_price\":\"1798.00\",\"goods_num\":\"2\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599485726', '我的', '1');
INSERT INTO `gwshop_order` VALUES ('44', '1471506713215', '3', '222', '0', '0', '{\"id\":\"10\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6211\\u7684\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u5b89\\u5fbd\\u7701\",\"city\":\"\\u6c60\\u5dde\\u5e02\",\"district\":\"\\u9752\\u9633\\u53bf\",\"address\":\"\\u6545\\u4e61\\u7684\\u4e91\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599485726\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '10', '', '0', '', '电子发票', '', '0.00', '240.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '240.00', '', '1471506713', '1474609388', '0', '0', '[{\"goods_id\":\"1\",\"goods_name\":\"\\u3010\\u8682\\u8681\\u6444\\u5f71\\u3011\\u5355\\u53cd\\u5916\\u89c2Sony\\/\\u7d22\\u5c3c DSC-H400\\u9ad8\\u6e05\\u957f\\u7126\\u5c04\\u6708\\u6570\\u7801\\u7167\\u76f8\\u673a\",\"goods_price\":\"120.00\",\"market_price\":\"1798.00\",\"goods_num\":\"2\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599485726', '我的', '0');
INSERT INTO `gwshop_order` VALUES ('45', '1471506767466', '3', '222', '0', '0', '{\"id\":\"10\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6211\\u7684\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u5b89\\u5fbd\\u7701\",\"city\":\"\\u6c60\\u5dde\\u5e02\",\"district\":\"\\u9752\\u9633\\u53bf\",\"address\":\"\\u6545\\u4e61\\u7684\\u4e91\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599485726\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '10', '', '0', '', '电子发票', '', '0.00', '240.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '240.00', '', '1471506767', '1474609388', '0', '0', '[{\"goods_id\":\"1\",\"goods_name\":\"\\u3010\\u8682\\u8681\\u6444\\u5f71\\u3011\\u5355\\u53cd\\u5916\\u89c2Sony\\/\\u7d22\\u5c3c DSC-H400\\u9ad8\\u6e05\\u957f\\u7126\\u5c04\\u6708\\u6570\\u7801\\u7167\\u76f8\\u673a\",\"goods_price\":\"120.00\",\"market_price\":\"1798.00\",\"goods_num\":\"2\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599485726', '我的', '1');
INSERT INTO `gwshop_order` VALUES ('46', '1471507082108', '3', '222', '0', '0', '{\"id\":\"10\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6211\\u7684\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u5b89\\u5fbd\\u7701\",\"city\":\"\\u6c60\\u5dde\\u5e02\",\"district\":\"\\u9752\\u9633\\u53bf\",\"address\":\"\\u6545\\u4e61\\u7684\\u4e91\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599485726\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '10', '', '0', '', '电子发票', '', '0.00', '240.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '240.00', '', '1471507082', '1474609388', '0', '0', '[{\"goods_id\":\"1\",\"goods_name\":\"\\u3010\\u8682\\u8681\\u6444\\u5f71\\u3011\\u5355\\u53cd\\u5916\\u89c2Sony\\/\\u7d22\\u5c3c DSC-H400\\u9ad8\\u6e05\\u957f\\u7126\\u5c04\\u6708\\u6570\\u7801\\u7167\\u76f8\\u673a\",\"goods_price\":\"120.00\",\"market_price\":\"1798.00\",\"goods_num\":\"2\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599485726', '我的', '0');
INSERT INTO `gwshop_order` VALUES ('47', '1471507149654', '3', '222', '0', '0', '{\"id\":\"10\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6211\\u7684\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u5b89\\u5fbd\\u7701\",\"city\":\"\\u6c60\\u5dde\\u5e02\",\"district\":\"\\u9752\\u9633\\u53bf\",\"address\":\"\\u6545\\u4e61\\u7684\\u4e91\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599485726\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '10', '', '0', '', '电子发票', '', '0.00', '240.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '240.00', '', '1471507149', '1474609388', '0', '0', '[{\"goods_id\":\"1\",\"goods_name\":\"\\u3010\\u8682\\u8681\\u6444\\u5f71\\u3011\\u5355\\u53cd\\u5916\\u89c2Sony\\/\\u7d22\\u5c3c DSC-H400\\u9ad8\\u6e05\\u957f\\u7126\\u5c04\\u6708\\u6570\\u7801\\u7167\\u76f8\\u673a\",\"goods_price\":\"120.00\",\"market_price\":\"1798.00\",\"goods_num\":\"2\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599485726', '我的', '0');
INSERT INTO `gwshop_order` VALUES ('48', '1471507361170', '3', '222', '0', '0', '{\"id\":\"10\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6211\\u7684\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u5b89\\u5fbd\\u7701\",\"city\":\"\\u6c60\\u5dde\\u5e02\",\"district\":\"\\u9752\\u9633\\u53bf\",\"address\":\"\\u6545\\u4e61\\u7684\\u4e91\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599485726\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '10', '', '0', '', '电子发票', '', '0.00', '240.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '240.00', '', '1471507361', '1474609388', '0', '0', '[{\"goods_id\":\"1\",\"goods_name\":\"\\u3010\\u8682\\u8681\\u6444\\u5f71\\u3011\\u5355\\u53cd\\u5916\\u89c2Sony\\/\\u7d22\\u5c3c DSC-H400\\u9ad8\\u6e05\\u957f\\u7126\\u5c04\\u6708\\u6570\\u7801\\u7167\\u76f8\\u673a\",\"goods_price\":\"120.00\",\"market_price\":\"1798.00\",\"goods_num\":\"2\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599485726', '我的', '1');
INSERT INTO `gwshop_order` VALUES ('49', '1471507466358', '3', '222', '0', '0', '{\"id\":\"10\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6211\\u7684\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u5b89\\u5fbd\\u7701\",\"city\":\"\\u6c60\\u5dde\\u5e02\",\"district\":\"\\u9752\\u9633\\u53bf\",\"address\":\"\\u6545\\u4e61\\u7684\\u4e91\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599485726\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '10', '', '0', '', '电子发票', '', '0.00', '240.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '240.00', '', '1471507466', '1474609388', '0', '0', '[{\"goods_id\":\"1\",\"goods_name\":\"\\u3010\\u8682\\u8681\\u6444\\u5f71\\u3011\\u5355\\u53cd\\u5916\\u89c2Sony\\/\\u7d22\\u5c3c DSC-H400\\u9ad8\\u6e05\\u957f\\u7126\\u5c04\\u6708\\u6570\\u7801\\u7167\\u76f8\\u673a\",\"goods_price\":\"120.00\",\"market_price\":\"1798.00\",\"goods_num\":\"2\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599485726', '我的', '0');
INSERT INTO `gwshop_order` VALUES ('50', '1471507641353', '3', '222', '0', '0', '{\"id\":\"10\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6211\\u7684\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u5b89\\u5fbd\\u7701\",\"city\":\"\\u6c60\\u5dde\\u5e02\",\"district\":\"\\u9752\\u9633\\u53bf\",\"address\":\"\\u6545\\u4e61\\u7684\\u4e91\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599485726\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '10', '', '0', '', '电子发票', '', '0.00', '240.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '240.00', '', '1471507641', '1474609388', '0', '0', '[{\"goods_id\":\"1\",\"goods_name\":\"\\u3010\\u8682\\u8681\\u6444\\u5f71\\u3011\\u5355\\u53cd\\u5916\\u89c2Sony\\/\\u7d22\\u5c3c DSC-H400\\u9ad8\\u6e05\\u957f\\u7126\\u5c04\\u6708\\u6570\\u7801\\u7167\\u76f8\\u673a\",\"goods_price\":\"120.00\",\"market_price\":\"1798.00\",\"goods_num\":\"2\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599485726', '我的', '1');
INSERT INTO `gwshop_order` VALUES ('51', '1471507859914', '3', '222', '1', '1', '{\"id\":\"10\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6211\\u7684\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u5b89\\u5fbd\\u7701\",\"city\":\"\\u6c60\\u5dde\\u5e02\",\"district\":\"\\u9752\\u9633\\u53bf\",\"address\":\"\\u6545\\u4e61\\u7684\\u4e91\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599485726\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '10', '', '0', '', '电子发票', '', '0.00', '240.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '240.00', '240.00', '', '1471507859', '1474609388', '0', '1471507971', '[{\"goods_id\":\"1\",\"goods_name\":\"\\u3010\\u8682\\u8681\\u6444\\u5f71\\u3011\\u5355\\u53cd\\u5916\\u89c2Sony\\/\\u7d22\\u5c3c DSC-H400\\u9ad8\\u6e05\\u957f\\u7126\\u5c04\\u6708\\u6570\\u7801\\u7167\\u76f8\\u673a\",\"goods_price\":\"120.00\",\"market_price\":\"1798.00\",\"goods_num\":\"2\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"}]', '1471508011', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599485726', '我的', '0');
INSERT INTO `gwshop_order` VALUES ('52', '1471595219553', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '20420.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '20420.00', '', '1471595219', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('53', '1471595296788', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '20420.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '20420.00', '', '1471595296', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('54', '1471595307689', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '20420.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '20420.00', '', '1471595307', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('55', '1471595324402', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '20420.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '20420.00', '', '1471595324', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('56', '1471595330472', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '20420.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '20420.00', '', '1471595330', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('57', '1471595343208', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '20420.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '20420.00', '', '1471595343', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('58', '1471595416844', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '20420.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '20420.00', '', '1471595416', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('59', '1471595456380', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '20420.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '20420.00', '', '1471595456', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('60', '1471595460674', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '20420.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '20420.00', '', '1471595460', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('61', '1471595461829', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '20420.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '20420.00', '', '1471595461', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('62', '1471595466984', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '20420.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '20420.00', '', '1471595466', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('63', '1471595571542', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '20420.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '20420.00', '', '1471595571', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('64', '1471595577114', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '20420.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '20420.00', '', '1471595577', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('65', '1471595582190', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '20420.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '20420.00', '', '1471595582', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('66', '1471595662114', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '20420.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '20420.00', '', '1471595662', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('67', '1471595782841', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '20420.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '20420.00', '', '1471595782', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('68', '1471595798133', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '20420.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '20420.00', '', '1471595798', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('69', '1471595807503', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '20420.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '20420.00', '', '1471595807', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('70', '1471595846415', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '20420.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '20420.00', '', '1471595846', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('71', '1471595877600', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '20420.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '20420.00', '', '1471595877', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('72', '1471595903460', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '20420.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '20420.00', '', '1471595903', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('73', '1471595967339', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '20420.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '20420.00', '', '1471595967', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('74', '1471595971637', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '20420.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '20420.00', '', '1471595971', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('75', '1471596045946', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '20420.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '20420.00', '', '1471596045', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('76', '1471596058201', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '20420.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '20420.00', '', '1471596058', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('77', '1471596097573', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '20420.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '20420.00', '', '1471596097', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('78', '1471596114275', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '20420.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '20420.00', '', '1471596114', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('79', '1471596120643', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '20420.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '20420.00', '', '1471596120', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('80', '1471596138703', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '20420.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '20420.00', '', '1471596138', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('81', '1471596144959', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '20420.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '20420.00', '', '1471596144', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('82', '1471596161571', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '20420.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '20420.00', '', '1471596161', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('83', '1471596163619', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '20420.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '20420.00', '', '1471596163', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('84', '1471596248928', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '20420.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '20420.00', '', '1471596248', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('85', '1471596333376', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '20420.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '20420.00', '', '1471596333', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('86', '1471596351347', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '20420.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '20420.00', '', '1471596351', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('87', '1471596364740', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '20420.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '20420.00', '', '1471596364', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('88', '1471596375805', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '20420.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '20420.00', '', '1471596375', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('89', '1471596424479', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '20420.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '20420.00', '', '1471596424', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '1');
INSERT INTO `gwshop_order` VALUES ('90', '1471596466633', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '20420.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '20420.00', '', '1471596466', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('91', '1471596467264', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '20420.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '20420.00', '', '1471596467', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('92', '1471596472289', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '20420.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '20420.00', '', '1471596472', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('93', '1471596639994', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '20420.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '20420.00', '', '1471596639', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('94', '1471596993996', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '19200.00', '0.00', '0.00', '0.00', '0.00', '0.00', '12.00', '0.00', '19188.00', '', '1471596993', '1474609388', '0', '0', '[{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('95', '1471597798965', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '19200.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '19200.00', '', '1471597798', '1474609388', '0', '0', '[{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('96', '1471597823137', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '19200.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '19200.00', '', '1471597823', '1474609388', '0', '0', '[{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('97', '1471597850339', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '19200.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '19200.00', '', '1471597850', '1474609388', '0', '0', '[{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('98', '1471597899833', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '19200.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '19200.00', '', '1471597899', '1474609388', '0', '0', '[{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('99', '1471597926984', '3', '222', '0', '1', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '19200.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1.00', '19200.00', '', '1471597926', '1474609388', '0', '1471597943', '[{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('100', '1471597927368', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '19200.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '19200.00', '', '1471597927', '1474609388', '0', '0', '[{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('101', '1471598114781', '3', '222', '0', '1', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '1220.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1.00', '1220.00', '', '1471598114', '1474609388', '0', '1471598133', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('102', '1471598157121', '3', '222', '0', '1', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '0', '', '0.00', '19200.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1.00', '19200.00', '', '1471598157', '1474609388', '0', '1471598166', '[{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('103', '1471599174864', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '3', '', '0.00', '19200.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '19200.00', '', '1471599174', '1474609388', '0', '0', '[{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('104', '1471599317357', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '3', '', '0.00', '19200.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '19200.00', '', '1471599317', '1474609388', '0', '0', '[{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('105', '1471599403156', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '3', '', '0.00', '19200.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '19200.00', '', '1471599403', '1474609388', '0', '0', '[{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"6\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('106', '1472009184497', '3', '222', '0', '0', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '2', '', '0.00', '1220.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1220.00', '', '1472009184', '1474609388', '0', '0', '[{\"goods_id\":\"2\",\"goods_name\":\"iphone6s \\u84dd\\u7259\\u8033\\u673a\",\"goods_price\":\"122.00\",\"market_price\":\"85.00\",\"goods_num\":\"10\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u9ed1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('107', '1472025483495', '3', '222', '1', '1', '{\"id\":\"29\",\"address_name\":\"\",\"user_id\":\"3\",\"consignee\":\"\\u6d4b\\u8bd5\\u7684\\u5566\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u798f\\u6e05\\u5e02\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13599051486\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '29', '', '0', '', '3', '', '0.00', '16000.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '16000.00', '16000.00', '', '1472025483', '1474609388', '0', '1472712150', '[{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"3\",\"spec_key_name\":\"\\u5185\\u5b58:32G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"},{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"2\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '1472712169', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13599051486', '测试的啦', '0');
INSERT INTO `gwshop_order` VALUES ('108', '1472699029106', '16', '222', '0', '1', '{\"id\":\"30\",\"address_name\":\"\",\"user_id\":\"16\",\"consignee\":\"\\u9017\\u6bd4\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u53f0\\u6c5f\\u533a\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13264285790\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"0\"}', '30', '', '0', '', '2', '', '0.00', '100.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1.00', '100.00', '', '1472699029', '1474609388', '0', '1472699038', '[{\"goods_id\":\"1\",\"goods_name\":\"\\u3010\\u8682\\u8681\\u6444\\u5f71\\u3011\\u5355\\u53cd\\u5916\\u89c2Sony\\/\\u7d22\\u5c3c DSC-H400\\u9ad8\\u6e05\\u957f\\u7126\\u5c04\\u6708\\u6570\\u7801\\u7167\\u76f8\\u673a\",\"goods_price\":\"100.00\",\"market_price\":\"1798.00\",\"goods_num\":\"1\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13264285790', '逗比', '0');
INSERT INTO `gwshop_order` VALUES ('109', '1472699213506', '16', '222', '0', '0', '{\"id\":\"30\",\"address_name\":\"\",\"user_id\":\"16\",\"consignee\":\"\\u9017\\u6bd4\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u53f0\\u6c5f\\u533a\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13264285790\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"0\"}', '30', '', '0', '', '2', '', '0.00', '100.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '100.00', '', '1472699213', '1474609388', '0', '0', '[{\"goods_id\":\"1\",\"goods_name\":\"\\u3010\\u8682\\u8681\\u6444\\u5f71\\u3011\\u5355\\u53cd\\u5916\\u89c2Sony\\/\\u7d22\\u5c3c DSC-H400\\u9ad8\\u6e05\\u957f\\u7126\\u5c04\\u6708\\u6570\\u7801\\u7167\\u76f8\\u673a\",\"goods_price\":\"100.00\",\"market_price\":\"1798.00\",\"goods_num\":\"1\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13264285790', '逗比', '0');
INSERT INTO `gwshop_order` VALUES ('110', '1472700396927', '16', '222', '0', '0', '{\"id\":\"30\",\"address_name\":\"\",\"user_id\":\"16\",\"consignee\":\"\\u9017\\u6bd4\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"district\":\"\\u53f0\\u6c5f\\u533a\",\"address\":\"\\u4e94\\u4e00\\u4e2d\\u8def\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13264285790\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"0\"}', '30', '', '0', '', '1', '', '0.00', '100.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '100.00', '', '1472700396', '1474609388', '0', '0', '[{\"goods_id\":\"1\",\"goods_name\":\"\\u3010\\u8682\\u8681\\u6444\\u5f71\\u3011\\u5355\\u53cd\\u5916\\u89c2Sony\\/\\u7d22\\u5c3c DSC-H400\\u9ad8\\u6e05\\u957f\\u7126\\u5c04\\u6708\\u6570\\u7801\\u7167\\u76f8\\u673a\",\"goods_price\":\"100.00\",\"market_price\":\"1798.00\",\"goods_num\":\"1\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13264285790', '逗比', '0');
INSERT INTO `gwshop_order` VALUES ('111', '1472701248902', '16', '222', '0', '1', '{\"id\":\"31\",\"address_name\":\"\",\"user_id\":\"16\",\"consignee\":\"111\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u5b89\\u5fbd\\u7701\",\"city\":\"\\u5de2\\u6e56\\u5e02\",\"district\":\"\\u5c45\\u5de2\\u533a\",\"address\":\"\\u2026\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13009876523\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"0\"}', '31', '', '0', '', '1', '', '0.00', '100.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1.00', '100.00', '', '1472701248', '1474609388', '0', '1472701358', '[{\"goods_id\":\"1\",\"goods_name\":\"\\u3010\\u8682\\u8681\\u6444\\u5f71\\u3011\\u5355\\u53cd\\u5916\\u89c2Sony\\/\\u7d22\\u5c3c DSC-H400\\u9ad8\\u6e05\\u957f\\u7126\\u5c04\\u6708\\u6570\\u7801\\u7167\\u76f8\\u673a\",\"goods_price\":\"100.00\",\"market_price\":\"1798.00\",\"goods_num\":\"1\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13009876523', '111', '0');
INSERT INTO `gwshop_order` VALUES ('112', '1472701671266', '16', '222', '0', '1', '{\"id\":\"31\",\"address_name\":\"\",\"user_id\":\"16\",\"consignee\":\"111\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u5b89\\u5fbd\\u7701\",\"city\":\"\\u5de2\\u6e56\\u5e02\",\"district\":\"\\u5c45\\u5de2\\u533a\",\"address\":\"\\u2026\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13009876523\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"0\"}', '31', '', '0', '', '1', '', '0.00', '64000.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1.00', '64000.00', '', '1472701671', '1474609388', '0', '1472701680', '[{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"20\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13009876523', '111', '0');
INSERT INTO `gwshop_order` VALUES ('113', '1472710853469', '21', '222', '0', '0', '{\"id\":\"32\",\"address_name\":\"\",\"user_id\":\"21\",\"consignee\":\"1\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u5b89\\u5fbd\\u7701\",\"city\":\"\\u5b89\\u5e86\\u5e02\",\"district\":\"\\u5927\\u89c2\\u533a\",\"address\":\"1\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13086547255\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"1\"}', '32', '', '0', '', '1', '', '0.00', '3200.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '3200.00', '', '1472710853', '1474609388', '0', '0', '[{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"1\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13086547255', '1', '1');
INSERT INTO `gwshop_order` VALUES ('114', '1472710935461', '16', '222', '1', '1', '{\"id\":\"31\",\"address_name\":\"\",\"user_id\":\"16\",\"consignee\":\"111\",\"email\":\"\",\"country\":\"0\",\"province\":\"\\u5b89\\u5fbd\\u7701\",\"city\":\"\\u5de2\\u6e56\\u5e02\",\"district\":\"\\u5c45\\u5de2\\u533a\",\"address\":\"\\u2026\",\"zipcode\":\"\",\"tel\":\"\",\"mobile\":\"13009876523\",\"sign_building\":\"\",\"best_time\":\"\",\"is_default\":\"0\"}', '31', '', '0', '', '1', '', '0.00', '6400.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1.00', '6400.00', '', '1472710935', '1474609388', '0', '1472710944', '[{\"goods_id\":\"6\",\"goods_name\":\"\\u6d77\\u5c14\\uff08Haier\\uff09BCD-251WDGW 251\\u5347 \\u65e0\\u971c\\u4e24\\u95e8\\u51b0\\u7bb1\\uff08\\u767d\\u8272\\uff09\",\"goods_price\":\"3200.00\",\"market_price\":\"3000.00\",\"goods_num\":\"2\",\"spec_key_name\":\"\\u5185\\u5b58:16G \\u989c\\u8272:\\u91d1\\u8272\",\"goods_img\":\"aaaa\"}]', '1472710969', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13009876523', '111', '0');
INSERT INTO `gwshop_order` VALUES ('115', '2016092310561729552', '27', '222', '0', '0', '福建省福州市福清市测试哈哈哈123', '33', '', '10', '微信支付', '', '', '0.00', '1698.00', '0.00', '0.00', '1698.00', '0.00', '0.00', '0.00', '0.00', '1698.00', '', '1474599377', '1474609388', '0', '0', '[{\"id\":\"1\",\"goods_name\":\"\\u3010\\u8682\\u8681\\u6444\\u5f71\\u3011\\u5355\\u53cd\\u5916\\u89c2Sony\\/\\u7d22\\u5c3c DSC-H400\\u9ad8\\u6e05\\u957f\\u7126\\u5c04\\u6708\\u6570\\u7801\\u7167\\u76f8\\u673a\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\",\"goods_brief\":\"\\u4e0a\\u597d\\u732a\\u8e44\\u4fbf\\u5b9c\\u62cd\",\"goods_price\":\"1698.00\",\"once_distribution_price\":\"200.00\",\"second_distribution_price\":\"150.00\",\"third_distribution_price\":\"100.00\",\"goods_num\":1}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13675091372', '小虚1', '0');
INSERT INTO `gwshop_order` VALUES ('116', '2016092310591527830', '27', '222', '0', '0', '福建省福州市福清市测试哈哈哈123', '33', '', '10', '微信支付', '', '', '0.00', '1698.00', '0.00', '0.00', '1698.00', '0.00', '0.00', '0.00', '0.00', '1698.00', '', '1474599555', '1474609388', '0', '0', '[{\"id\":\"1\",\"goods_name\":\"\\u3010\\u8682\\u8681\\u6444\\u5f71\\u3011\\u5355\\u53cd\\u5916\\u89c2Sony\\/\\u7d22\\u5c3c DSC-H400\\u9ad8\\u6e05\\u957f\\u7126\\u5c04\\u6708\\u6570\\u7801\\u7167\\u76f8\\u673a\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\",\"goods_brief\":\"\\u4e0a\\u597d\\u732a\\u8e44\\u4fbf\\u5b9c\\u62cd\",\"goods_price\":\"1698.00\",\"once_distribution_price\":\"200.00\",\"second_distribution_price\":\"150.00\",\"third_distribution_price\":\"100.00\",\"goods_num\":1}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13675091372', '小虚1', '0');
INSERT INTO `gwshop_order` VALUES ('117', '2016092311000313089', '27', '222', '0', '0', '福建省福州市福清市测试哈哈哈123', '33', '', '10', '微信支付', '', '', '0.00', '1698.00', '0.00', '0.00', '1698.00', '0.00', '0.00', '0.00', '0.00', '1698.00', '', '1474599603', '1474609388', '0', '0', '[{\"id\":\"1\",\"goods_name\":\"\\u3010\\u8682\\u8681\\u6444\\u5f71\\u3011\\u5355\\u53cd\\u5916\\u89c2Sony\\/\\u7d22\\u5c3c DSC-H400\\u9ad8\\u6e05\\u957f\\u7126\\u5c04\\u6708\\u6570\\u7801\\u7167\\u76f8\\u673a\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\",\"goods_brief\":\"\\u4e0a\\u597d\\u732a\\u8e44\\u4fbf\\u5b9c\\u62cd\",\"goods_price\":\"1698.00\",\"once_distribution_price\":\"200.00\",\"second_distribution_price\":\"150.00\",\"third_distribution_price\":\"100.00\",\"goods_num\":1}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13675091372', '小虚1', '0');
INSERT INTO `gwshop_order` VALUES ('118', '2016092311002974747', '27', '222', '0', '1', '福建省福州市福清市测试哈哈哈123', '33', '', '10', '微信支付', '', '', '0.00', '1698.00', '0.00', '0.00', '1698.00', '0.00', '0.00', '0.00', '1698.00', '1698.00', '', '1474599629', '1474609388', '0', '1474599699', '[{\"id\":\"1\",\"goods_name\":\"\\u3010\\u8682\\u8681\\u6444\\u5f71\\u3011\\u5355\\u53cd\\u5916\\u89c2Sony\\/\\u7d22\\u5c3c DSC-H400\\u9ad8\\u6e05\\u957f\\u7126\\u5c04\\u6708\\u6570\\u7801\\u7167\\u76f8\\u673a\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777297ff32b7.jpg\",\"goods_brief\":\"\\u4e0a\\u597d\\u732a\\u8e44\\u4fbf\\u5b9c\\u62cd\",\"goods_price\":\"1698.00\",\"once_distribution_price\":\"200.00\",\"second_distribution_price\":\"150.00\",\"third_distribution_price\":\"100.00\",\"goods_num\":1}]', '0', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13675091372', '小虚1', '0');
INSERT INTO `gwshop_order` VALUES ('119', '2016092311044027992', '27', '222', '1', '1', '福建省福州市福清市测试哈哈哈123', '33', '', '10', '微信支付', '', '', '0.00', '20.00', '0.00', '0.00', '20.00', '0.00', '0.00', '0.00', '20.00', '20.00', '', '1474599880', '1474609388', '0', '1474600160', '[{\"id\":\"5\",\"goods_name\":\"aaaa\",\"goods_img\":\"\\/Public\\/upload\\/goods\\/2016\\/07-02\\/5777da96d98c4.jpg\",\"goods_brief\":\"ewerwerhwerhwe\",\"goods_price\":\"20.00\",\"once_distribution_price\":\"0.00\",\"second_distribution_price\":\"0.00\",\"third_distribution_price\":\"0.00\",\"goods_num\":1}]', '1474609354', '', '', '0', '', '0', '0', '0.00', '0', '0', '', '13675091372', '小虚1', '0');

-- ----------------------------
-- Table structure for gwshop_order_action
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_order_action`;
CREATE TABLE `gwshop_order_action` (
  `action_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '订单ID',
  `action_user` int(11) DEFAULT '0' COMMENT '操作人 0 为管理员操作',
  `order_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '订单状态',
  `shipping_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '配送状态',
  `pay_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '支付状态',
  `action_note` varchar(255) NOT NULL DEFAULT '' COMMENT '操作备注',
  `log_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  `status_desc` varchar(255) DEFAULT NULL COMMENT '状态描述',
  PRIMARY KEY (`action_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gwshop_order_action
-- ----------------------------
INSERT INTO `gwshop_order_action` VALUES ('1', '14', '1', '200', '0', '1', '', '1470037630', 'pay');
INSERT INTO `gwshop_order_action` VALUES ('2', '14', '1', '200', '0', '1', '', '1470037639', 'pay');
INSERT INTO `gwshop_order_action` VALUES ('3', '13', '1', '200', '0', '1', 'aaaaaa', '1470038889', 'pay');
INSERT INTO `gwshop_order_action` VALUES ('10', '13', '1', '200', '0', '1', '', '1470039682', 'pay');
INSERT INTO `gwshop_order_action` VALUES ('11', '13', '1', '100', '0', '0', '', '1470040080', 'pay_cancel');
INSERT INTO `gwshop_order_action` VALUES ('12', '13', '1', '200', '0', '1', '已经付款到支付宝', '1470040115', 'pay');
INSERT INTO `gwshop_order_action` VALUES ('13', '14', '1', '200', '1', '1', 'bbbb', '1470043484', 'delivery');
INSERT INTO `gwshop_order_action` VALUES ('14', '13', '1', '200', '1', '1', 'asdfasdfasasd', '1470043613', 'delivery');
INSERT INTO `gwshop_order_action` VALUES ('15', '12', '1', '200', '0', '1', '后台操作', '1470044063', 'pay');
INSERT INTO `gwshop_order_action` VALUES ('16', '12', '1', '210', '1', '1', '发货饿了', '1470044099', 'delivery');
INSERT INTO `gwshop_order_action` VALUES ('17', '7', '1', '101', '0', '0', '订单金额有误', '1470044871', 'invalid');
INSERT INTO `gwshop_order_action` VALUES ('18', '11', '1', '200', '0', '1', '', '1470300961', 'pay');
INSERT INTO `gwshop_order_action` VALUES ('19', '8', '1', '200', '0', '1', '', '1470301157', 'pay');
INSERT INTO `gwshop_order_action` VALUES ('20', '6', '1', '200', '0', '1', '', '1470301431', 'pay');
INSERT INTO `gwshop_order_action` VALUES ('21', '11', '1', '210', '1', '1', 'aaaaaaaaaaaaaaa', '1470366698', 'delivery');
INSERT INTO `gwshop_order_action` VALUES ('22', '14', '1', '101', '1', '1', '', '1470366739', 'invalid');
INSERT INTO `gwshop_order_action` VALUES ('23', '13', '1', '220', '1', '1', '', '1470371894', 'refund_cancel');
INSERT INTO `gwshop_order_action` VALUES ('24', '13', '1', '255', '1', '1', '确认退款', '1470371958', 'refund_confirm');
INSERT INTO `gwshop_order_action` VALUES ('25', '6', '1', '101', '0', '1', '', '1470473403', 'invalid');
INSERT INTO `gwshop_order_action` VALUES ('26', '14', '1', '255', '1', '1', '退换货:退换, 状态:处理中,处理备注：aaaaa', '1470475999', 'refund');
INSERT INTO `gwshop_order_action` VALUES ('27', '14', '1', '255', '1', '1', '退换货:退换, 状态:处理中,处理备注：cccccccccc', '1470476087', 'refund');
INSERT INTO `gwshop_order_action` VALUES ('28', '22', '1', '255', '0', '1', '', '1471057022', 'refund_confirm');
INSERT INTO `gwshop_order_action` VALUES ('29', '23', '1', '210', '1', '1', '', '1471057096', 'delivery');
INSERT INTO `gwshop_order_action` VALUES ('30', '23', '1', '255', '1', '1', '', '1471057304', 'refund_confirm');
INSERT INTO `gwshop_order_action` VALUES ('31', '23', '1', '101', '1', '1', '', '1471057318', 'invalid');
INSERT INTO `gwshop_order_action` VALUES ('32', '24', '1', '210', '1', '1', '', '1471057492', 'delivery');
INSERT INTO `gwshop_order_action` VALUES ('33', '27', '1', '220', '0', '1', '', '1471061242', 'refund_cancel');
INSERT INTO `gwshop_order_action` VALUES ('34', '28', '1', '220', '0', '1', '', '1471061555', 'refund_cancel');
INSERT INTO `gwshop_order_action` VALUES ('35', '51', '1', '200', '0', '1', '', '1471507971', 'pay');
INSERT INTO `gwshop_order_action` VALUES ('36', '51', '1', '210', '1', '1', '', '1471508011', 'delivery');
INSERT INTO `gwshop_order_action` VALUES ('37', '108', '1', '255', '0', '1', '', '1472701054', 'refund_confirm');
INSERT INTO `gwshop_order_action` VALUES ('38', '114', '1', '210', '1', '1', '', '1472710969', 'delivery');
INSERT INTO `gwshop_order_action` VALUES ('39', '107', '1', '200', '0', '1', '', '1472712150', 'pay');
INSERT INTO `gwshop_order_action` VALUES ('40', '107', '1', '210', '1', '1', '', '1472712169', 'delivery');
INSERT INTO `gwshop_order_action` VALUES ('41', '114', '1', '101', '1', '1', '', '1473842069', 'invalid');
INSERT INTO `gwshop_order_action` VALUES ('42', '118', '1', '200', '0', '1', '', '1474599700', 'pay');
INSERT INTO `gwshop_order_action` VALUES ('43', '119', '1', '200', '0', '1', '', '1474600160', 'pay');
INSERT INTO `gwshop_order_action` VALUES ('44', '119', '1', '210', '1', '1', '', '1474609354', 'delivery');

-- ----------------------------
-- Table structure for gwshop_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_order_goods`;
CREATE TABLE `gwshop_order_goods` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id自增',
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_name` varchar(120) NOT NULL DEFAULT '' COMMENT '视频名称',
  `goods_sn` varchar(60) NOT NULL DEFAULT '' COMMENT '商品货号',
  `goods_num` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '购买数量',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '本店价',
  `cost_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品成本价',
  `member_goods_price` decimal(10,2) DEFAULT '0.00' COMMENT '会员折扣价',
  `give_integral` mediumint(8) DEFAULT '0' COMMENT '购买商品赠送积分',
  `spec_key` varchar(128) NOT NULL DEFAULT '' COMMENT '商品规格key',
  `spec_key_name` varchar(128) NOT NULL DEFAULT '' COMMENT '规格对应的中文名字',
  `bar_code` varchar(64) NOT NULL DEFAULT '' COMMENT '条码',
  `is_comment` tinyint(1) DEFAULT '0' COMMENT '是否评价',
  `prom_type` tinyint(1) DEFAULT '0' COMMENT '0 普通订单,1 限时抢购, 2 团购 , 3 促销优惠',
  `prom_id` int(11) DEFAULT '0' COMMENT '活动id',
  `is_send` tinyint(1) DEFAULT '0' COMMENT '0未发货，1已发货，2已换货，3已退货',
  `delivery_id` int(11) DEFAULT '0' COMMENT '发货单ID',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gwshop_order_goods
-- ----------------------------
INSERT INTO `gwshop_order_goods` VALUES ('1', '5', '5', '商品名称', '', '1', '0.00', '120.00', '0.00', '0.00', '0', '', '', '', '1', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('2', '5', '6', '商品名称', '', '1', '0.00', '120.00', '0.00', '0.00', '0', '', '', '', '1', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('3', '5', '7', '商品名称', '', '1', '0.00', '150.00', '0.00', '0.00', '0', '', '', '', '1', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('4', '5', '8', '', '', '1', '0.00', '120.00', '0.00', '0.00', '0', '', '', '', '1', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('5', '8', '1', '【蚂蚁摄影】单反外观Sony/索尼 DSC-H400高清长焦射月数码照相机', 'TP0000131', '1', '1798.00', '100.00', '0.00', '0.00', '0', '1_3', '内存:16G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('6', '9', '1', '【蚂蚁摄影】单反外观Sony/索尼 DSC-H400高清长焦射月数码照相机', 'TP0000131', '2', '1798.00', '5000.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('7', '10', '1', '【蚂蚁摄影】单反外观Sony/索尼 DSC-H400高清长焦射月数码照相机', 'TP0000131', '2', '1798.00', '5000.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('8', '11', '1', '【蚂蚁摄影】单反外观Sony/索尼 DSC-H400高清长焦射月数码照相机', 'TP0000131', '2', '1798.00', '5000.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('9', '12', '1', '【蚂蚁摄影】单反外观Sony/索尼 DSC-H400高清长焦射月数码照相机', 'TP0000131', '2', '1798.00', '5000.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('10', '13', '1', '【蚂蚁摄影】单反外观Sony/索尼 DSC-H400高清长焦射月数码照相机', 'TP0000131', '2', '1798.00', '5000.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('11', '15', '1', '【蚂蚁摄影】单反外观Sony/索尼 DSC-H400高清长焦射月数码照相机', 'TP0000131', '1', '1798.00', '5000.00', '0.00', '0.00', '0', '2_4', '内存:32G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('12', '16', '1', '【蚂蚁摄影】单反外观Sony/索尼 DSC-H400高清长焦射月数码照相机', 'TP0000131', '1', '1798.00', '5000.00', '0.00', '0.00', '0', '2_4', '内存:32G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('13', '17', '5', 'aaaa', 'TP0000136', '1', '20.00', '1233.00', '0.00', '0.00', '0', '1_3', '内存:16G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('14', '18', '2', 'iphone6s 蓝牙耳机', '', '2', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('15', '19', '7', '小米MAX', '', '5', '1999.00', '1599.00', '0.00', '0.00', '0', '1_3', '内存:16G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('16', '20', '2', 'iphone6s 蓝牙耳机', '', '1', '85.00', '177.00', '0.00', '0.00', '0', '1_3', '内存:16G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('17', '20', '1', '【蚂蚁摄影】单反外观Sony/索尼 DSC-H400高清长焦射月数码照相机', 'TP0000131', '1', '1798.00', '5000.00', '0.00', '0.00', '0', '2_4', '内存:32G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('18', '20', '4', 'cccccc', '', '1', '120.00', '100.00', '0.00', '0.00', '0', '', '', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('19', '20', '3', '猪肚500g', '', '3', '25.00', '20.00', '0.00', '0.00', '0', '', '', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('20', '21', '1', '【蚂蚁摄影】单反外观Sony/索尼 DSC-H400高清长焦射月数码照相机', 'TP0000131', '1', '1798.00', '120.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('21', '22', '5', 'aaaa', 'TP0000136', '1', '20.00', '1233.00', '0.00', '0.00', '0', '1_3', '内存:16G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('22', '23', '12', '单反', '1111', '6', '1.00', '1.00', '0.00', '0.00', '0', '', '', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('23', '24', '5', 'aaaa', 'TP0000136', '1', '20.00', '1233.00', '0.00', '0.00', '0', '1_3', '内存:16G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('24', '24', '2', 'iphone6s 蓝牙耳机', '', '1', '85.00', '177.00', '0.00', '0.00', '0', '1_3', '内存:16G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('25', '25', '2', 'iphone6s 蓝牙耳机', '', '1', '85.00', '177.00', '0.00', '0.00', '0', '1_3', '内存:16G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('26', '26', '2', 'iphone6s 蓝牙耳机', '', '2', '85.00', '177.00', '0.00', '0.00', '0', '1_3', '内存:16G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('27', '27', '5', 'aaaa', 'TP0000136', '1', '20.00', '1233.00', '0.00', '0.00', '0', '1_3', '内存:16G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('28', '27', '2', 'iphone6s 蓝牙耳机', '', '1', '85.00', '177.00', '0.00', '0.00', '0', '1_3', '内存:16G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('29', '27', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '2', '299.01', '4444.00', '0.00', '0.00', '0', '1_3', '内存:16G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('30', '28', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '2', '299.01', '4444.00', '0.00', '0.00', '0', '1_3', '内存:16G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('31', '29', '2', 'iphone6s 蓝牙耳机', '', '1', '85.00', '177.00', '0.00', '0.00', '0', '1_3', '内存:16G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('32', '30', '2', 'iphone6s 蓝牙耳机', '', '1', '85.00', '177.00', '0.00', '0.00', '0', '1_3', '内存:16G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('33', '31', '4', 'cccccc', '', '1', '120.00', '100.00', '0.00', '0.00', '0', '', '', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('34', '32', '2', 'iphone6s 蓝牙耳机', '', '12', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('35', '32', '13', '1111', '1111111', '6', '1.00', '1.00', '0.00', '0.00', '0', '', '', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('36', '33', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('37', '33', '13', '1111', '1111111', '8', '1.00', '1.00', '0.00', '0.00', '0', '', '', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('38', '33', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '4', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('39', '34', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('40', '34', '13', '1111', '1111111', '8', '1.00', '1.00', '0.00', '0.00', '0', '', '', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('41', '34', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '4', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('42', '35', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('43', '35', '13', '1111', '1111111', '8', '1.00', '1.00', '0.00', '0.00', '0', '', '', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('44', '35', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '4', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('45', '36', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '4', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('46', '36', '1', '【蚂蚁摄影】单反外观Sony/索尼 DSC-H400高清长焦射月数码照相机', 'TP0000131', '2', '1798.00', '120.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('47', '37', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '4', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('48', '37', '1', '【蚂蚁摄影】单反外观Sony/索尼 DSC-H400高清长焦射月数码照相机', 'TP0000131', '2', '1798.00', '120.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('49', '38', '13', '1111', '1111111', '8', '1.00', '1.00', '0.00', '0.00', '0', '', '', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('50', '38', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '4', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('51', '39', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('52', '39', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '4', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('53', '40', '1', '【蚂蚁摄影】单反外观Sony/索尼 DSC-H400高清长焦射月数码照相机', 'TP0000131', '2', '1798.00', '120.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('54', '41', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '4', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('55', '42', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '4', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('56', '43', '1', '【蚂蚁摄影】单反外观Sony/索尼 DSC-H400高清长焦射月数码照相机', 'TP0000131', '2', '1798.00', '120.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('57', '44', '1', '【蚂蚁摄影】单反外观Sony/索尼 DSC-H400高清长焦射月数码照相机', 'TP0000131', '2', '1798.00', '120.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('58', '45', '1', '【蚂蚁摄影】单反外观Sony/索尼 DSC-H400高清长焦射月数码照相机', 'TP0000131', '2', '1798.00', '120.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('59', '46', '1', '【蚂蚁摄影】单反外观Sony/索尼 DSC-H400高清长焦射月数码照相机', 'TP0000131', '2', '1798.00', '120.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('60', '47', '1', '【蚂蚁摄影】单反外观Sony/索尼 DSC-H400高清长焦射月数码照相机', 'TP0000131', '2', '1798.00', '120.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('61', '48', '1', '【蚂蚁摄影】单反外观Sony/索尼 DSC-H400高清长焦射月数码照相机', 'TP0000131', '2', '1798.00', '120.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('62', '49', '1', '【蚂蚁摄影】单反外观Sony/索尼 DSC-H400高清长焦射月数码照相机', 'TP0000131', '2', '1798.00', '120.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('63', '50', '1', '【蚂蚁摄影】单反外观Sony/索尼 DSC-H400高清长焦射月数码照相机', 'TP0000131', '2', '1798.00', '120.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('64', '51', '1', '【蚂蚁摄影】单反外观Sony/索尼 DSC-H400高清长焦射月数码照相机', 'TP0000131', '2', '1798.00', '120.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '1', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('65', '52', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('66', '52', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('67', '53', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('68', '53', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('69', '54', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('70', '54', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('71', '55', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('72', '55', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('73', '56', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('74', '56', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('75', '57', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('76', '57', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('77', '58', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('78', '58', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('79', '59', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('80', '59', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('81', '60', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('82', '60', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('83', '61', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('84', '61', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('85', '62', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('86', '62', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('87', '63', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('88', '63', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('89', '64', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('90', '64', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('91', '65', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('92', '65', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('93', '66', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('94', '66', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('95', '67', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('96', '67', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('97', '68', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('98', '68', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('99', '69', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('100', '69', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('101', '70', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('102', '70', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('103', '71', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('104', '71', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('105', '72', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('106', '72', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('107', '73', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('108', '73', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('109', '74', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('110', '74', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('111', '75', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('112', '75', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('113', '76', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('114', '76', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('115', '77', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('116', '77', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('117', '78', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('118', '78', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('119', '79', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('120', '79', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('121', '80', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('122', '80', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('123', '81', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('124', '81', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('125', '82', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('126', '82', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('127', '83', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('128', '83', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('129', '84', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('130', '84', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('131', '85', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('132', '85', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('133', '86', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('134', '86', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('135', '87', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('136', '87', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('137', '88', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('138', '88', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('139', '89', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('140', '89', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('141', '90', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('142', '90', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('143', '91', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('144', '91', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('145', '92', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('146', '92', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('147', '93', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('148', '93', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('149', '94', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('150', '95', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('151', '96', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('152', '97', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('153', '98', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('154', '99', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('155', '100', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('156', '101', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('157', '102', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('158', '103', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('159', '104', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('160', '105', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '6', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('161', '106', '2', 'iphone6s 蓝牙耳机', '', '10', '85.00', '122.00', '0.00', '0.00', '0', '1_4', '内存:16G 颜色:黑色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('162', '107', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '3', '3000.00', '3200.00', '0.00', '0.00', '0', '2_3', '内存:32G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('163', '107', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '2', '3000.00', '3200.00', '0.00', '0.00', '0', '1_3', '内存:16G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('164', '108', '1', '【蚂蚁摄影】单反外观Sony/索尼 DSC-H400高清长焦射月数码照相机', 'TP0000131', '1', '1798.00', '100.00', '0.00', '0.00', '0', '1_3', '内存:16G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('165', '109', '1', '【蚂蚁摄影】单反外观Sony/索尼 DSC-H400高清长焦射月数码照相机', 'TP0000131', '1', '1798.00', '100.00', '0.00', '0.00', '0', '1_3', '内存:16G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('166', '110', '1', '【蚂蚁摄影】单反外观Sony/索尼 DSC-H400高清长焦射月数码照相机', 'TP0000131', '1', '1798.00', '100.00', '0.00', '0.00', '0', '1_3', '内存:16G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('167', '111', '1', '【蚂蚁摄影】单反外观Sony/索尼 DSC-H400高清长焦射月数码照相机', 'TP0000131', '1', '1798.00', '100.00', '0.00', '0.00', '0', '1_3', '内存:16G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('168', '112', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '20', '3000.00', '3200.00', '0.00', '0.00', '0', '1_3', '内存:16G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('169', '113', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '1', '3000.00', '3200.00', '0.00', '0.00', '0', '1_3', '内存:16G 颜色:金色', '', '0', '0', '0', '0', '0');
INSERT INTO `gwshop_order_goods` VALUES ('170', '114', '6', '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', '2', '3000.00', '3200.00', '0.00', '0.00', '0', '1_3', '内存:16G 颜色:金色', '', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for gwshop_payment
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_payment`;
CREATE TABLE `gwshop_payment` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT '支付方式编号',
  `pay_code` varchar(20) NOT NULL COMMENT '支付方式的英文缩写',
  `pay_name` varchar(120) NOT NULL COMMENT '支付方式名称',
  `pay_fee` varchar(10) NOT NULL DEFAULT '0' COMMENT '支付费用',
  `pay_desc` text NOT NULL COMMENT '支付方式描述',
  `pay_order` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '支付方式在页面的显示顺序',
  `pay_config` text NOT NULL COMMENT '支付方式的配置信息，包括商户号和密钥什么的',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否可用，0，否；1，是',
  `is_cod` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否货到付款，0，否；1，是',
  `is_online` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否在线支付，0，否；1，是',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pay_code` (`pay_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付方式配置信息';

-- ----------------------------
-- Records of gwshop_payment
-- ----------------------------

-- ----------------------------
-- Table structure for gwshop_pay_log
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_pay_log`;
CREATE TABLE `gwshop_pay_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '支付记录编号',
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '所支付订单编号',
  `order_amount` decimal(10,2) unsigned NOT NULL COMMENT '支付金额',
  `order_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '支付类型；0，订单支付；1，会员预付款支付',
  `is_paid` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否已支付，0，否；1，是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单支付记录';

-- ----------------------------
-- Records of gwshop_pay_log
-- ----------------------------

-- ----------------------------
-- Table structure for gwshop_read_msg
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_read_msg`;
CREATE TABLE `gwshop_read_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '未读消息数量',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '消息类型  order-订单消息； service-客服消息',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '消息数量',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gwshop_read_msg
-- ----------------------------
INSERT INTO `gwshop_read_msg` VALUES ('1', 'order', '5', '2');
INSERT INTO `gwshop_read_msg` VALUES ('2', 'order', '6', '1');
INSERT INTO `gwshop_read_msg` VALUES ('3', 'order', '2', '4');
INSERT INTO `gwshop_read_msg` VALUES ('4', 'order', '1', '7');
INSERT INTO `gwshop_read_msg` VALUES ('5', 'order', '1', '11');
INSERT INTO `gwshop_read_msg` VALUES ('6', 'order', '5', '9');
INSERT INTO `gwshop_read_msg` VALUES ('7', 'order', '1', '17');
INSERT INTO `gwshop_read_msg` VALUES ('8', 'order', '4', '20');
INSERT INTO `gwshop_read_msg` VALUES ('9', 'order', '8', '16');
INSERT INTO `gwshop_read_msg` VALUES ('10', 'order', '1', '19');
INSERT INTO `gwshop_read_msg` VALUES ('11', 'order', '76', '3');
INSERT INTO `gwshop_read_msg` VALUES ('12', 'order', '1', '21');

-- ----------------------------
-- Table structure for gwshop_return_goods
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_return_goods`;
CREATE TABLE `gwshop_return_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '退货申请表id自增',
  `order_id` int(11) DEFAULT '0' COMMENT '订单id',
  `order_sn` varchar(1024) CHARACTER SET utf8 DEFAULT '' COMMENT '订单编号',
  `goods_id` int(11) DEFAULT '0' COMMENT '商品id',
  `type` tinyint(1) DEFAULT '0' COMMENT '0退货1换货',
  `reason` varchar(1024) CHARACTER SET utf8 DEFAULT '' COMMENT '退换货原因',
  `imgs` varchar(512) CHARACTER SET utf8 DEFAULT '' COMMENT '拍照图片路径',
  `add_time` int(11) DEFAULT '0' COMMENT '申请时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '0申请中1客服理中2已完成',
  `remark` varchar(1024) CHARACTER SET utf8 DEFAULT '' COMMENT '客服备注',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of gwshop_return_goods
-- ----------------------------
INSERT INTO `gwshop_return_goods` VALUES ('1', '14', 'aaaa', '8', '0', 'aaaaa', '', '0', '1', 'aaaaa', '2');
INSERT INTO `gwshop_return_goods` VALUES ('2', '14', 'bbbb', '9', '0', 'bbbbb', '', '0', '1', 'cccccccccc', '2');
INSERT INTO `gwshop_return_goods` VALUES ('3', '22', '0', '5', '1', '不喜欢', '', '1471054667', '0', '', '20');
INSERT INTO `gwshop_return_goods` VALUES ('4', '23', '0', '12', '0', '，', '', '1471057268', '0', '', '16');
INSERT INTO `gwshop_return_goods` VALUES ('5', '26', '0', '2', '1', '。', '', '1471058038', '0', '', '16');
INSERT INTO `gwshop_return_goods` VALUES ('6', '27', '0', '2', '1', '很丑', '', '1471061215', '0', '', '20');
INSERT INTO `gwshop_return_goods` VALUES ('7', '28', '0', '6', '1', '不要了', '', '1471061434', '0', '', '20');
INSERT INTO `gwshop_return_goods` VALUES ('8', '108', '0', '1', '1', '不想要了', '', '1472700993', '0', '', '16');

-- ----------------------------
-- Table structure for gwshop_shipping
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_shipping`;
CREATE TABLE `gwshop_shipping` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '快递配送',
  `name` varchar(10) NOT NULL COMMENT '快递公司',
  `free_price` decimal(10,0) NOT NULL COMMENT '免运费价格',
  `note` varchar(100) NOT NULL COMMENT '备注',
  `price` decimal(10,0) NOT NULL COMMENT '运费',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gwshop_shipping
-- ----------------------------
INSERT INTO `gwshop_shipping` VALUES ('1', '韵达', '38', '满38免运费', '12');
INSERT INTO `gwshop_shipping` VALUES ('2', '申通', '30', '满30免运费', '10');

-- ----------------------------
-- Table structure for gwshop_spec
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_spec`;
CREATE TABLE `gwshop_spec` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '规格表',
  `type_id` int(11) DEFAULT '0' COMMENT '规格类型',
  `name` varchar(55) DEFAULT NULL COMMENT '规格名称',
  `order` int(11) DEFAULT '50' COMMENT '排序',
  `search_index` tinyint(1) DEFAULT '0' COMMENT '是否需要检索',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gwshop_spec
-- ----------------------------
INSERT INTO `gwshop_spec` VALUES ('1', '3', '内存', '50', '0');
INSERT INTO `gwshop_spec` VALUES ('2', '3', '颜色', '51', '0');

-- ----------------------------
-- Table structure for gwshop_spec_goods_price
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_spec_goods_price`;
CREATE TABLE `gwshop_spec_goods_price` (
  `goods_id` int(11) DEFAULT '0' COMMENT '商品id',
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '规格键名',
  `key_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '规格键名中文',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `store_count` int(11) unsigned DEFAULT '10' COMMENT '库存数量',
  `bar_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '商品条形码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gwshop_spec_goods_price
-- ----------------------------
INSERT INTO `gwshop_spec_goods_price` VALUES ('6', '1_3', '内存:16G 颜色:金色', '3200.00', '44', '');
INSERT INTO `gwshop_spec_goods_price` VALUES ('6', '2_3', '内存:32G 颜色:金色', '3200.00', '10', '');
INSERT INTO `gwshop_spec_goods_price` VALUES ('5', '1_3', '内存:16G 颜色:金色', '1233.00', '122', '');
INSERT INTO `gwshop_spec_goods_price` VALUES ('2', '1_3', '内存:16G 颜色:金色', '177.00', '12', '');
INSERT INTO `gwshop_spec_goods_price` VALUES ('2', '1_4', '内存:16G 颜色:黑色', '122.00', '12', '');
INSERT INTO `gwshop_spec_goods_price` VALUES ('7', '1_3', '内存:16G 颜色:金色', '1599.00', '10', '');
INSERT INTO `gwshop_spec_goods_price` VALUES ('7', '2_3', '内存:32G 颜色:金色', '1699.00', '10', '');
INSERT INTO `gwshop_spec_goods_price` VALUES ('7', '1_4', '内存:16G 颜色:黑色', '1599.00', '10', '');
INSERT INTO `gwshop_spec_goods_price` VALUES ('7', '2_4', '内存:32G 颜色:黑色', '1699.00', '10', '');
INSERT INTO `gwshop_spec_goods_price` VALUES ('1', '1_3', '内存:16G 颜色:金色', '100.00', '25', '');
INSERT INTO `gwshop_spec_goods_price` VALUES ('1', '2_3', '内存:32G 颜色:金色', '5000.00', '20', '');
INSERT INTO `gwshop_spec_goods_price` VALUES ('1', '1_4', '内存:16G 颜色:黑色', '120.00', '20', '');
INSERT INTO `gwshop_spec_goods_price` VALUES ('1', '2_4', '内存:32G 颜色:黑色', '5000.00', '20', '');

-- ----------------------------
-- Table structure for gwshop_spec_image
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_spec_image`;
CREATE TABLE `gwshop_spec_image` (
  `goods_id` int(11) DEFAULT '0' COMMENT '商品规格图片表id',
  `spec_image_id` int(11) DEFAULT '0' COMMENT '规格项id',
  `src` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '商品规格图片路径'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gwshop_spec_image
-- ----------------------------

-- ----------------------------
-- Table structure for gwshop_spec_item
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_spec_item`;
CREATE TABLE `gwshop_spec_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '规格项id',
  `spec_id` int(11) DEFAULT NULL COMMENT '规格id',
  `item` varchar(54) DEFAULT NULL COMMENT '规格项',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gwshop_spec_item
-- ----------------------------
INSERT INTO `gwshop_spec_item` VALUES ('1', '1', '16G');
INSERT INTO `gwshop_spec_item` VALUES ('2', '1', '32G');
INSERT INTO `gwshop_spec_item` VALUES ('3', '2', '金色');
INSERT INTO `gwshop_spec_item` VALUES ('4', '2', '黑色');
INSERT INTO `gwshop_spec_item` VALUES ('5', '2', '灰色');

-- ----------------------------
-- Table structure for gwshop_sysinfo
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_sysinfo`;
CREATE TABLE `gwshop_sysinfo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '系统设置参数',
  `title` varchar(120) NOT NULL COMMENT '标签名称',
  `key_name` varchar(120) NOT NULL COMMENT '键名称',
  `key_value` text NOT NULL COMMENT '键值',
  `sort` tinyint(3) NOT NULL DEFAULT '0' COMMENT '排序',
  `group` varchar(80) NOT NULL DEFAULT '' COMMENT '数据分组:sys,mail...',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态，0-正常，1-禁用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_name` (`key_name`),
  KEY `group_status` (`group`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统基础信息';

-- ----------------------------
-- Records of gwshop_sysinfo
-- ----------------------------
INSERT INTO `gwshop_sysinfo` VALUES ('1', '积分比例（%）', 'credit_bl', '10', '0', '', '1');

-- ----------------------------
-- Table structure for gwshop_system_module
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_system_module`;
CREATE TABLE `gwshop_system_module` (
  `mod_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `module` enum('top','menu','module') DEFAULT 'module' COMMENT '模块名',
  `level` tinyint(1) DEFAULT '3',
  `ctl` varchar(20) DEFAULT '' COMMENT '控制器',
  `act` varchar(30) DEFAULT '' COMMENT 'action',
  `title` varchar(20) DEFAULT '' COMMENT '菜单名称',
  `visible` tinyint(1) DEFAULT '1' COMMENT '是否显示',
  `parent_id` smallint(6) DEFAULT '0' COMMENT '父类菜单',
  `orderby` smallint(6) DEFAULT '50' COMMENT '排序',
  `icon` varchar(30) DEFAULT NULL COMMENT '图标',
  PRIMARY KEY (`mod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gwshop_system_module
-- ----------------------------
INSERT INTO `gwshop_system_module` VALUES ('1', 'top', '1', '', '', '系统', '1', '0', '50', '0');
INSERT INTO `gwshop_system_module` VALUES ('2', 'top', '1', '', '', '设置', '1', '0', '50', '0');
INSERT INTO `gwshop_system_module` VALUES ('3', 'top', '1', '', '', '会员', '1', '0', '50', '0');
INSERT INTO `gwshop_system_module` VALUES ('4', 'top', '1', '', '', '商家', '1', '0', '50', '0');
INSERT INTO `gwshop_system_module` VALUES ('5', 'top', '1', '', '', '内容', '1', '0', '50', '0');
INSERT INTO `gwshop_system_module` VALUES ('6', 'top', '1', '', '', '运营', '1', '0', '50', 'fa-home');
INSERT INTO `gwshop_system_module` VALUES ('7', 'menu', '2', '', '', '权限管理', '1', '1', '2', 'fa-cog');
INSERT INTO `gwshop_system_module` VALUES ('8', 'menu', '2', '', '', '模块管理', '1', '1', '3', 'fa-table');
INSERT INTO `gwshop_system_module` VALUES ('9', 'menu', '2', '', '', '网站设置', '1', '2', '50', 'fa-pencil');
INSERT INTO `gwshop_system_module` VALUES ('10', 'menu', '2', '', '', '会员管理', '1', '3', '50', 'fa-user');
INSERT INTO `gwshop_system_module` VALUES ('11', 'menu', '2', '', '', '商品管理', '1', '4', '50', 'fa-tasks');
INSERT INTO `gwshop_system_module` VALUES ('12', 'menu', '2', '', '', '内容管理', '1', '5', '50', 'fa-navicon');
INSERT INTO `gwshop_system_module` VALUES ('13', 'menu', '2', '', '', '广告管理', '1', '6', '50', 'fa-star');
INSERT INTO `gwshop_system_module` VALUES ('14', 'menu', '2', '', '', '促销管理', '1', '4', '50', 'fa-retweet');
INSERT INTO `gwshop_system_module` VALUES ('15', 'menu', '2', '', '', '插件工具', '1', '6', '20', 'fa-plug');
INSERT INTO `gwshop_system_module` VALUES ('16', 'menu', '2', '', '', '微信管理', '1', '6', '50', 'fa-home');
INSERT INTO `gwshop_system_module` VALUES ('17', 'menu', '2', '', '', '订单管理', '1', '4', '50', 'fa-flag');
INSERT INTO `gwshop_system_module` VALUES ('18', 'module', '3', 'Comments', 'index', '评论管理', '1', '10', '50', '0');
INSERT INTO `gwshop_system_module` VALUES ('19', 'module', '3', 'Admin', 'role', '角色管理', '1', '7', '50', '0');
INSERT INTO `gwshop_system_module` VALUES ('20', 'module', '3', 'Admin', 'index', '管理员列表', '1', '7', '50', '0');
INSERT INTO `gwshop_system_module` VALUES ('21', 'module', '3', 'System', 'menu', '菜单管理', '0', '8', '50', '0');
INSERT INTO `gwshop_system_module` VALUES ('22', 'module', '3', 'System', 'module', '模块管理', '0', '8', '50', '0');
INSERT INTO `gwshop_system_module` VALUES ('23', 'module', '3', 'Admin', 'log', '管理员日志', '0', '7', '50', '0');
INSERT INTO `gwshop_system_module` VALUES ('24', 'module', '3', 'Goods', 'categoryList', '商品分类', '1', '11', '50', '0');
INSERT INTO `gwshop_system_module` VALUES ('25', 'module', '3', 'Goods', 'goodsList', '商品列表', '1', '11', '50', '0');
INSERT INTO `gwshop_system_module` VALUES ('26', 'module', '3', 'Goods', 'goodsTypeList', '商品类型', '1', '11', '50', '0');
INSERT INTO `gwshop_system_module` VALUES ('27', 'module', '3', 'Goods', 'specList', '商品规格', '1', '11', '50', '0');
INSERT INTO `gwshop_system_module` VALUES ('28', 'module', '3', 'Goods', 'goodsAttributeList', '商品属性', '0', '11', '50', '0');
INSERT INTO `gwshop_system_module` VALUES ('29', 'module', '3', 'Goods', 'brandList', '商品品牌', '0', '11', '50', '0');
INSERT INTO `gwshop_system_module` VALUES ('30', 'module', '3', 'Order', 'index', '订单列表', '1', '17', '50', '0');
INSERT INTO `gwshop_system_module` VALUES ('31', 'module', '3', 'Order', 'delivery_list', '发货单列表', '1', '17', '50', '0');
INSERT INTO `gwshop_system_module` VALUES ('32', 'module', '3', 'Order', 'return_list', '退货单列表', '1', '17', '50', '0');
INSERT INTO `gwshop_system_module` VALUES ('33', 'module', '3', 'User', 'levelList', '会员等级', '0', '10', '50', '0');
INSERT INTO `gwshop_system_module` VALUES ('34', 'module', '3', 'User', 'index', '会员列表', '1', '10', '50', '0');
INSERT INTO `gwshop_system_module` VALUES ('35', 'module', '3', 'System', 'index', '网站设置', '1', '9', '50', '0');
INSERT INTO `gwshop_system_module` VALUES ('36', 'module', '3', 'System', 'navigationList', '导航设置', '0', '9', '50', '0');
INSERT INTO `gwshop_system_module` VALUES ('37', 'module', '3', 'Ad', 'positionList', '广告位', '1', '13', '50', '0');
INSERT INTO `gwshop_system_module` VALUES ('38', 'module', '3', 'Ad', 'adList', '广告列表', '1', '13', '50', '0');
INSERT INTO `gwshop_system_module` VALUES ('39', 'module', '3', 'Article', 'categoryList', '文章分类', '1', '12', '50', '0');
INSERT INTO `gwshop_system_module` VALUES ('40', 'module', '3', 'Article', 'articleList', '文章列表', '1', '12', '50', '0');
INSERT INTO `gwshop_system_module` VALUES ('41', 'module', '3', 'Article', 'linkList', '友情链接', '0', '12', '50', '0');
INSERT INTO `gwshop_system_module` VALUES ('42', 'module', '3', 'Topic', 'topicList', '专题列表', '0', '12', '50', '0');
INSERT INTO `gwshop_system_module` VALUES ('43', 'module', '3', 'Coupon', 'index', '优惠券', '1', '14', '50', '0');
INSERT INTO `gwshop_system_module` VALUES ('44', 'module', '3', 'Wechat', 'index', '公众号管理', '1', '16', '50', '0');
INSERT INTO `gwshop_system_module` VALUES ('45', 'module', '3', 'Wechat', 'menu', '微信菜单管理', '1', '16', '50', '0');
INSERT INTO `gwshop_system_module` VALUES ('46', 'module', '3', 'Wechat', 'text', '文本回复', '1', '16', '50', '0');
INSERT INTO `gwshop_system_module` VALUES ('47', 'module', '3', 'Wechat', 'img', '图文回复', '0', '16', '50', '0');
INSERT INTO `gwshop_system_module` VALUES ('48', 'module', '3', 'Wechat', 'nes', '组合回复', '0', '16', '50', '0');
INSERT INTO `gwshop_system_module` VALUES ('49', 'module', '3', 'Plugin', 'index', '插件列表', '0', '15', '50', '0');
INSERT INTO `gwshop_system_module` VALUES ('50', 'module', '3', 'Promotion', 'index', '组合促销', '0', '14', '50', '0');
INSERT INTO `gwshop_system_module` VALUES ('51', 'menu', '2', '', '', '模板管理', '1', '2', '50', 'fa-book');
INSERT INTO `gwshop_system_module` VALUES ('52', 'module', '3', 'Template', 'templateList?t=pc', 'PC端模板', '0', '51', '50', '0');
INSERT INTO `gwshop_system_module` VALUES ('53', 'module', '3', 'Template', 'templateList?t=mobile', '手机端模板', '0', '51', '50', '0');
INSERT INTO `gwshop_system_module` VALUES ('54', 'module', '3', 'Tools', 'index', '数据备份', '0', '15', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('55', 'menu', '2', '', '', '报表统计', '1', '6', '50', 'fa-bar-chart');
INSERT INTO `gwshop_system_module` VALUES ('56', 'module', '3', 'report', 'index', '销售概况', '0', '55', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('57', 'module', '3', 'report', 'saleTop', '销售排行', '0', '55', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('58', 'module', '3', 'report', 'userTop', '会员排行', '0', '55', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('59', 'module', '3', 'Promotion', 'group_buy_list', '团购管理', '0', '14', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('60', 'module', '3', 'report', 'saleList', '销售明细', '0', '55', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('61', 'module', '3', 'report', 'user', '会员统计', '0', '55', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('62', 'module', '3', 'Promotion', 'flash_sale', '限时抢购', '0', '14', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('63', 'module', '3', 'Tools', 'restore', '数据还原', '0', '15', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('64', 'module', '3', 'Order', 'add_order', '添加订单', '0', '17', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('65', 'module', '3', 'report', 'finance', '财务统计', '0', '55', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('66', 'module', '3', 'Admin', 'role_info', '编辑角色', '0', '7', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('67', 'module', '3', 'Admin', 'role_save', '保存角色', '0', '7', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('68', 'module', '3', 'Admin', 'roleDel', '删除角色', '0', '7', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('69', 'module', '3', 'Admin', 'admin_info', '编辑管理员', '0', '7', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('70', 'module', '3', 'Admin', 'adminHandle', '保存管理员', '0', '7', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('71', 'module', '3', 'System', 'create_menu', '添加菜单', '0', '8', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('72', 'module', '3', 'System', 'menuSave', '保存菜单', '0', '8', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('73', 'module', '3', 'System', 'ctl_detail', '添加控制模块', '0', '8', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('74', 'module', '3', 'System', 'ctlSave', '保存控制模块', '0', '8', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('75', 'module', '3', 'System', 'handle', '保存设置', '0', '9', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('76', 'module', '3', 'System', 'addEditNav', '保存导航', '0', '9', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('77', 'module', '3', 'Template', 'changeTemplate', '切换模板', '0', '51', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('78', 'module', '3', 'System', 'delNav', '删除导航', '0', '9', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('79', 'module', '3', 'Comment', 'detail', '评论详情', '0', '10', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('80', 'module', '3', 'Comment', 'op', '评论回复', '0', '10', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('81', 'module', '3', 'Comment', 'del', '删除评论', '0', '10', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('82', 'module', '3', 'User', 'level', '新增等级', '0', '10', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('83', 'module', '3', 'User', 'levelHandle', '保存等级', '0', '10', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('84', 'module', '3', 'User', 'detail', '查看会员', '0', '10', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('85', 'module', '3', 'User', 'account_log', '会员消费记录', '0', '10', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('86', 'module', '3', 'User', 'account_edit', '会员资金调节', '0', '10', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('87', 'module', '3', 'User', 'address', '会员收货地址', '0', '10', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('88', 'module', '3', 'Goods', 'addEditGoods', '新增商品', '0', '11', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('89', 'module', '3', 'Goods', 'addEditCategory', '编辑商品分类', '0', '11', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('90', 'module', '3', 'Goods', 'delGoodsCategory', '删除商品分类', '0', '11', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('91', 'module', '3', 'Goods', 'changeGoodsField', '修改商品字段', '0', '11', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('92', 'module', '3', 'Goods', 'addEditGoodsType', '编辑商品类型', '0', '11', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('93', 'module', '3', 'Goods', 'addEditGoodsAttribute', '编辑商品属性', '0', '11', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('94', 'module', '3', 'Goods', 'delGoods', '删除商品', '0', '11', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('95', 'module', '3', 'Goods', 'delGoodsType', '删除商品类型', '0', '11', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('96', 'module', '3', 'Goods', 'delGoodsAttribute', '删除商品属性', '0', '11', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('97', 'module', '3', 'Goods', 'delGoodsSpec', '删除商品规格', '0', '11', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('98', 'module', '3', 'Goods', 'addEditSpec', '编辑商品规格', '0', '11', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('99', 'module', '3', 'Goods', 'addEditBrand', '编辑品牌', '0', '11', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('100', 'module', '3', 'Goods', 'delBrand', '删除品牌', '0', '11', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('101', 'module', '3', 'Coupon', 'coupon_info', '添加优惠券', '0', '14', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('102', 'module', '3', 'Promotion', 'group_buy', '添加团购', '0', '14', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('103', 'module', '3', 'Promotion', 'groupbuyHandle', '保存团购', '0', '14', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('104', 'module', '3', 'Promotion', 'get_goods', '选择商品', '0', '14', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('105', 'module', '3', 'Coupon', 'coupon_info', '编辑优惠券', '0', '14', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('106', 'module', '3', 'Coupon', 'del_coupon', '删除优惠券', '0', '14', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('107', 'module', '3', 'Coupon', 'send_coupon', '发放优惠券', '0', '14', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('108', 'module', '3', 'Order', 'edit_order', '编辑订单', '0', '17', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('109', 'module', '3', 'Order', 'split_order', '拆分订单', '0', '17', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('110', 'module', '3', 'Order', 'deatil', '订单详情', '0', '17', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('111', 'module', '3', 'Order', 'editprice', '修改订单金额', '0', '17', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('112', 'module', '3', 'Order', 'delete_order', '删除订单', '0', '17', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('113', 'module', '3', 'Order', 'pay_cancel', '取消付款', '0', '17', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('114', 'module', '3', 'Order', 'order_print', '订单打印', '0', '17', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('115', 'module', '3', 'Order', 'shipping_print', '打印快递', '0', '17', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('116', 'module', '3', 'Order', 'deliveryHandle', '发货处理', '0', '17', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('117', 'module', '3', 'Order', 'delivery_info', '发货单详情', '0', '17', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('118', 'module', '3', 'Order', 'return_info', '退货单信息', '0', '17', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('119', 'module', '3', 'Order', 'return_del', '删除退货单', '0', '17', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('120', 'module', '3', 'Order', 'order_action', '订单流程处理', '0', '17', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('121', 'module', '3', 'Order', 'export_order', '导出订单', '0', '17', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('122', 'module', '3', 'Order', 'search_goods', '搜索商品', '0', '17', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('123', 'module', '3', 'Order', 'add_return_goods', '生成退货单', '0', '17', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('124', 'module', '3', 'Article', 'category', '编辑文章分类', '0', '12', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('125', 'module', '3', 'Article', 'categoryHandle', '保存文章分类', '0', '12', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('126', 'module', '3', 'Article', 'article', '编辑文章', '0', '12', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('127', 'module', '3', 'Article', 'aticleHandle', '保存文章', '0', '12', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('128', 'module', '3', 'Article', 'link', '编辑友情链接', '0', '12', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('129', 'module', '3', 'Article', 'linkHandle', '保存友情链接', '0', '12', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('130', 'module', '3', 'Topic', 'topic', '新增专题', '0', '12', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('131', 'module', '3', 'Topic', 'topicHandle', '保存专题', '0', '12', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('132', 'module', '3', 'Ad', 'position', '添加广告位', '0', '13', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('133', 'module', '3', 'Ad', 'positionHandle', '保存广告位', '0', '13', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('134', 'module', '3', 'Ad', 'ad', '添加广告', '0', '13', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('135', 'module', '3', 'Ad', 'adHandle', '保存广告', '0', '13', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('136', 'module', '3', 'Tools', 'backup', '生成备份文件', '0', '15', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('137', 'module', '3', 'Tools', 'restoreData', '还原SQL文件', '0', '15', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('138', 'module', '3', 'Tools', 'optimize', '优化数据表', '0', '15', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('139', 'module', '3', 'Tools', 'repair', '修改数据表', '0', '15', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('140', 'module', '3', 'Tools', 'restoreUpload', '上传SQL文件', '0', '15', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('141', 'module', '3', 'Tools', 'downFile', '下载SQL文件', '0', '15', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('142', 'module', '3', 'Tools', 'delSqlFiles', '删除SQL文件', '0', '15', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('143', 'module', '3', 'Promotion', 'prom_order_list', '订单促销', '0', '14', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('144', 'module', '3', 'Promotion', 'bargain', '砍价管理', '0', '14', '50', null);
INSERT INTO `gwshop_system_module` VALUES ('146', 'module', '3', 'Promotion', 'prom_goods_list', '商品促销', '0', '14', '50', null);

-- ----------------------------
-- Table structure for gwshop_user
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_user`;
CREATE TABLE `gwshop_user` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `email` varchar(60) NOT NULL COMMENT '会员邮箱',
  `user_name` varchar(60) NOT NULL COMMENT '用户名',
  `nick_name` varchar(60) NOT NULL DEFAULT '' COMMENT '昵称',
  `headimgurl` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `password` varchar(32) NOT NULL COMMENT '用户密码',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别，0，保密；1，男；2，女',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日日期',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次登录时间',
  `last_ip` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次登录ip',
  `login_count` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `parent_id` mediumint(9) NOT NULL DEFAULT '0' COMMENT '推荐人会员id，',
  `qq` varchar(20) NOT NULL COMMENT 'qq号',
  `mobile` varchar(20) NOT NULL COMMENT '手机',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态0，正常，1，锁定',
  `wx_uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '微信用户编号',
  `openid` varchar(60) NOT NULL DEFAULT '' COMMENT '微信openid',
  `user_number` varchar(32) NOT NULL DEFAULT '' COMMENT '用户编号',
  `account_balance` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '账户余额',
  `wechat_qrcode` varchar(100) NOT NULL DEFAULT '' COMMENT '微信二维码链接',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`),
  KEY `email` (`email`),
  KEY `parent_id` (`parent_id`),
  KEY `wx_uid` (`wx_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of gwshop_user
-- ----------------------------
INSERT INTO `gwshop_user` VALUES ('3', '', 'wx1470821201821', '好的的', '/Public/upload/user/2016-08-11/57abf9d59e81b.jpg', '', '0', '2016-06-17', '1470821201', '0', '0', '0', '0', '', '', '0', '1', 'oG7KGwIDMYmM8W_xv2gjOpCpKH0I', '', '0.00', '');
INSERT INTO `gwshop_user` VALUES ('9', '', 'wx1470886794653', '我和', '/Public/upload/user/2016-08-12/57ad79eb3966f.jpeg', '', '1', '2016-08-12', '1470886794', '0', '0', '0', '0', '', '', '0', '1', 'oG7KGwGPwLnOrdzzNce1K_fm5rP4', '', '0.00', '');
INSERT INTO `gwshop_user` VALUES ('11', '', 'wx1470887072856', 'jjjjjjjjoookio', '/Public/upload/user/2016-08-11/57abf86980fd8.jpg', '', '2', '2018-05-13', '1470887072', '0', '0', '0', '0', '', '', '0', '1', 'oG7KGwN5Q81Y1Qq9NkjoazP2GjyM', '', '0.00', '');
INSERT INTO `gwshop_user` VALUES ('12', '', 'wx1470887433864', '', '', '', '0', '0000-00-00', '1470887433', '0', '0', '0', '0', '', '', '0', '1', 'oG7KGwCsjQm3uh5K4S5ACybY5mjU', '', '0.00', '');
INSERT INTO `gwshop_user` VALUES ('15', '', 'wx1470892857166', '', '', '', '0', '0000-00-00', '1470892857', '0', '0', '0', '0', '', '', '0', '1', 'oG7KGwPjI_DD8MUxiyE_BDBnkoh8', '', '0.00', '');
INSERT INTO `gwshop_user` VALUES ('16', '', 'wx1470965559932', '567', '/Public/upload/user/2016-09-01/57c7d8290e076.jpeg', '', '1', '2016-08-12', '1470965559', '0', '0', '0', '0', '', '', '0', '1', 'oG7KGwHigN--JhuOdQxMPEa5iWGY', '', '0.00', '');
INSERT INTO `gwshop_user` VALUES ('17', '', 'wx1470990383725', '', '', '', '0', '0000-00-00', '1470990383', '0', '0', '0', '0', '', '', '0', '1', 'oG7KGwLZKaKo82UmbNuqrc_DopP8', '', '0.00', '');
INSERT INTO `gwshop_user` VALUES ('19', '', 'wx1470994293393', '我本初心', 'http://wx.qlogo.cn/mmopen/jpmAzM3fnicOXC9u8oeJic7ibplicfskE1YJHDL55AAaXJ6UJ7Nxv9VNx1mhW07oI4skYJTiaModMZyW4X8cuEib2v9w/0', '', '0', '0000-00-00', '1470994293', '0', '0', '0', '0', '', '', '0', '1', 'oG7KGwJcCoAWHzZJTACiY4LL95M8', '', '0.00', '');
INSERT INTO `gwshop_user` VALUES ('20', '', 'wx1471054137766', '粤', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDbThpFbsfX1D2o0RrHnA56hGlaOKhOsJrI1nWD0hkJnGfgRtJtNZdvHYxRuV2J066okVicIEDCb7A/0', '', '2', '2016-08-13', '1471054137', '0', '0', '0', '0', '', '', '0', '1', 'oG7KGwE_9PB7omC2HE83VrvKS8io', '', '0.00', '');
INSERT INTO `gwshop_user` VALUES ('21', '', 'wx1471056088333', '广为网络-技术部助理', 'http://wx.qlogo.cn/mmopen/LIUI5tJGiauA4DmM9C7bdvLafrdAu5Z54bgNicQNTq3Z146eCCZ3iajefXyVYMQk3gAyoZYVJGjiaMjUqxmM9ibDicx0kmGffdpJ4jggpBZL6k3e4/0', '', '0', '0000-00-00', '1471056088', '0', '0', '0', '0', '', '', '0', '1', 'oG7KGwNcKsSN0leXj3mtICdrFO18', '', '0.00', '');
INSERT INTO `gwshop_user` VALUES ('22', '', 'wx1471159851200', '广为网络沈', 'http://wx.qlogo.cn/mmopen/jpmAzM3fnicP9DTOEGtr0Wbh6QKmk1bp0ANH3qnUrbg7Wia6pjOVAXb3kB2eWSKR6BNffABAs3tEhvW7TibV08jOLfR9iarBWxh5/0', '', '0', '0000-00-00', '1471159851', '0', '0', '0', '0', '', '', '0', '1', 'oG7KGwBMMLLD_i6YAnoEFbRP6-Vw', '', '0.00', '');
INSERT INTO `gwshop_user` VALUES ('23', '', 'wx1471160191228', 'songyihong', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKNN5g2vZuzwvPMRb0wHf7rHBRAY5ANzIibeZPkt6eE0UZ87UtmF2opx2IWJeneG0KcPUPUbwjMcww/0', '', '0', '0000-00-00', '1471160191', '0', '0', '0', '0', '', '', '0', '1', 'oG7KGwLbSA0qjSpSh13Aimh2bSYU', '', '0.00', '');
INSERT INTO `gwshop_user` VALUES ('24', '', 'wx1471270091335', 'en', 'http://wx.qlogo.cn/mmopen/LIUI5tJGiauAlTREcyvvXvBDerSS6oEibMvGeYadxiaG2T8hvt4XKKQMqRhgLrxszj8xiaibria9F478AmYnAaxaJZIicic0tV2p2WQ9/0', '', '0', '2016-08-18', '1471270091', '0', '0', '0', '0', '', '', '0', '1', 'oG7KGwIZwcIU6ooq2yIHNeTk8pG4', '', '0.00', '');
INSERT INTO `gwshop_user` VALUES ('25', '', 'wx1472817798857', '佛福', 'http://wx.qlogo.cn/mmopen/LIUI5tJGiauCwPoTqaoWibZ7DmicHaNv9ASxaundpeVuHyVfydRhJBKq8RPBuicanib2neJic5sbQic8hgia4JOWK6AHfQ/0', '', '0', '0000-00-00', '1472817798', '0', '0', '0', '0', '', '', '0', '1', 'oG7KGwA0k6jic-NxVi7LreONYCiI', '', '0.00', '');
INSERT INTO `gwshop_user` VALUES ('26', '', 'wx1472817810710', 'fzu张南湖-广为网络创始人', 'http://wx.qlogo.cn/mmopen/xxOG8S7UFmu5E53devElZ059DT7BicX71ztT6eOv8MKw0361AFsPty2vyEXiaUq7jUgR4nFVDOulcdibaGKO1icPAzJ23ObcEzFL/0', '', '0', '0000-00-00', '1472817810', '0', '0', '0', '0', '', '', '0', '1', 'oG7KGwAEQ50hh5SjdvA2T6OH1BBY', '', '0.00', '');
INSERT INTO `gwshop_user` VALUES ('27', '', 'wx1472817844364', '小虚', 'http://wx.qlogo.cn/mmopen/LIUI5tJGiauDs7eNyz7LXIKVtV9XBic1hiacm8RkLxJ6UskFWxaic1NsfDZDMB9zvIXaMm5H7yibMiclNzUhIzjST22A/0', '', '0', '0000-00-00', '1472817844', '0', '0', '0', '0', '', '', '0', '1', 'oG7KGwEOgvIwBCN_bA4QAxb1UZ-w', 'lUaOQeaSl5aZdpl2mdK6AdwKPpA0aQCv', '0.00', '/uploads/qrcode/201609152151396674.jpg');
INSERT INTO `gwshop_user` VALUES ('28', '', 'wx1472817925388', '志凡', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELH0oYBfbEJibYQW46cwlqeuKqS3Y0Mmhc8D72WabtwNn37VicIaz9p7rMsx8icpbu1Pbf6UO389P7ww/0', '', '0', '0000-00-00', '1472817925', '0', '0', '0', '0', '', '', '0', '1', 'oG7KGwEcF2GiQGopkkEcEuKd93fM', '', '0.00', '');

-- ----------------------------
-- Table structure for gwshop_user_address
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_user_address`;
CREATE TABLE `gwshop_user_address` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '收货编号',
  `address_name` varchar(50) NOT NULL COMMENT '收货名称:办公地址,家庭地址等',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户编号',
  `consignee` varchar(60) NOT NULL COMMENT '收货人的名字',
  `email` varchar(60) NOT NULL COMMENT '收货人的email',
  `country` smallint(5) NOT NULL DEFAULT '0' COMMENT '收货人的国家',
  `province` varchar(20) NOT NULL DEFAULT '' COMMENT '收货人的省份',
  `city` varchar(20) NOT NULL DEFAULT '' COMMENT '收货人的城市',
  `district` varchar(20) NOT NULL DEFAULT '' COMMENT '收货人的地区',
  `address` varchar(120) NOT NULL COMMENT '收货人的详细地址',
  `zipcode` varchar(60) NOT NULL COMMENT '收货人的邮编',
  `tel` varchar(60) NOT NULL COMMENT '收货人的电话',
  `mobile` varchar(60) NOT NULL COMMENT '收货人的手机',
  `sign_building` varchar(120) NOT NULL COMMENT '收货地址的标志性建筑名',
  `best_time` varchar(120) NOT NULL COMMENT '收货人的最佳收货时间',
  `is_default` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否默认  1默认',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否默认  0默认',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='收货人的信息表';

-- ----------------------------
-- Records of gwshop_user_address
-- ----------------------------
INSERT INTO `gwshop_user_address` VALUES ('1', '', '2', 'wbz', '', '0', '福建省', '福州', '台江', '五一中路', '', '', '18650306103', '', '', '0', '0');
INSERT INTO `gwshop_user_address` VALUES ('2', '', '1', 'wbz', '', '0', 'aaa', 'bbb', 'ccc', 'ddddd', '350021', '', '235232724', '', '', '0', '0');
INSERT INTO `gwshop_user_address` VALUES ('4', '', '1', 'wbz', '', '0', 'aaa', 'bbb', 'ccc', 'ddddd', '', '', '235232724', '', '', '1', '0');
INSERT INTO `gwshop_user_address` VALUES ('5', '', '4', '哈哈哈哈', '', '0', '福建省', '南平市', '浦城县', 'MSN摄影师我说', '', '', '18652358698', '', '', '1', '0');
INSERT INTO `gwshop_user_address` VALUES ('6', '', '7', '12', '', '0', '安徽省', '池州市', '石台县', '好了', '', '', '18650718184', '', '', '1', '0');
INSERT INTO `gwshop_user_address` VALUES ('7', '', '12', '廖钰桃', '', '0', '福建省', '福州市', '台江区', '五一中路145号状元楼B座205', '', '', '13670685432', '', '', '1', '0');
INSERT INTO `gwshop_user_address` VALUES ('8', '', '12', '廖钰桃', '', '0', '福建省', '福州市', '台江区', '五一中路145号状元楼B座205', '', '', '13670685432', '', '', '0', '0');
INSERT INTO `gwshop_user_address` VALUES ('11', '', '11', 'john', '', '0', '福建省', '福州市', '马尾区', '日期都能干大概', '', '', '150888800001111111111111111', '', '', '1', '0');
INSERT INTO `gwshop_user_address` VALUES ('12', '', '11', 'johnn', '', '0', '福建省', '福州市', '福清市', '哈哈哈', '', '', '15080128528', '', '', '0', '0');
INSERT INTO `gwshop_user_address` VALUES ('16', '', '20', '姚锦乐', '', '0', '福建省', '福州市', '闽侯县', '福州大学生活1区1号楼', '', '', '15060151736', '', '', '1', '0');
INSERT INTO `gwshop_user_address` VALUES ('18', '', '20', '鼓励了', '', '0', '福建省', '福州市', '闽侯县', '闽侯县女子第一中学', '', '', '15060151736', '', '', '0', '0');
INSERT INTO `gwshop_user_address` VALUES ('19', '', '16', '？', '', '0', '安徽省', '安庆市', '怀宁县', '宿舍', '', '', '13008796401', '', '', '1', '0');
INSERT INTO `gwshop_user_address` VALUES ('20', '', '16', '好', '', '0', '安徽省', '巢湖市', '居巢区', '111', '', '', '13003879011', '', '', '0', '0');
INSERT INTO `gwshop_user_address` VALUES ('21', '', '16', '图', '', '0', '安徽省', '蚌埠市', '怀远县', '图他', '', '', '13098534884', '', '', '0', '0');
INSERT INTO `gwshop_user_address` VALUES ('22', '', '16', '起来', '', '0', '甘肃省', '甘南藏族自治州', '临潭县', '，', '', '', '13038790401', '', '', '0', '0');
INSERT INTO `gwshop_user_address` VALUES ('24', '', '9', 'jfh ', '', '0', '广西壮族自治区', '贵港市', '覃塘区', 'sajhdas d', '', '', '13763528526', '', '', '1', '0');
INSERT INTO `gwshop_user_address` VALUES ('25', '', '16', '舅舅家', '', '0', '安徽省', '安庆市', '大观区', '11', '', '', '13003879999', '', '', '0', '0');
INSERT INTO `gwshop_user_address` VALUES ('27', '', '19', 'w', '', '0', '甘肃省', '嘉峪关市', '市辖区', 'svasdfa', '', '', '18650326210', '', '', '1', '0');
INSERT INTO `gwshop_user_address` VALUES ('28', '', '24', '11', '', '0', '北京市', '市辖区', '大兴区', '帝国大道', '', '', '15394401111', '', '', '1', '0');
INSERT INTO `gwshop_user_address` VALUES ('29', '', '3', '测试的啦', '', '0', '福建省', '福州市', '福清市', '五一中路', '', '', '13599051486', '', '', '1', '0');
INSERT INTO `gwshop_user_address` VALUES ('30', '', '16', '逗比', '', '0', '福建省', '福州市', '台江区', '五一中路', '', '', '13264285790', '', '', '0', '0');
INSERT INTO `gwshop_user_address` VALUES ('31', '', '16', '111', '', '0', '安徽省', '巢湖市', '居巢区', '…', '', '', '13009876523', '', '', '0', '0');
INSERT INTO `gwshop_user_address` VALUES ('32', '', '21', '1', '', '0', '安徽省', '安庆市', '大观区', '1', '', '', '13086547255', '', '', '1', '0');
INSERT INTO `gwshop_user_address` VALUES ('33', '', '27', '小虚1', '', '0', '福建省', '福州市', '福清市', '测试哈哈哈123', '', '', '13675091372', '', '', '1', '0');
INSERT INTO `gwshop_user_address` VALUES ('34', '', '27', '小虚', '', '0', '福建省', '宁德市', '蕉城区', '哈哈哈12312', '', '', '13675091372', '', '', '0', '0');

-- ----------------------------
-- Table structure for gwshop_user_log
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_user_log`;
CREATE TABLE `gwshop_user_log` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户编号',
  `user_name` varchar(60) NOT NULL COMMENT '用户名',
  `error_counts` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '登录失败次数',
  `last_login` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次尝试时间',
  PRIMARY KEY (`id`),
  KEY `user_name` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户登录错误记录';

-- ----------------------------
-- Records of gwshop_user_log
-- ----------------------------

-- ----------------------------
-- Table structure for gwshop_user_passport
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_user_passport`;
CREATE TABLE `gwshop_user_passport` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户票据',
  `passport` varchar(32) NOT NULL COMMENT '用户票据',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户登录id',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `type` varchar(10) NOT NULL COMMENT '用户类型 ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of gwshop_user_passport
-- ----------------------------
INSERT INTO `gwshop_user_passport` VALUES ('4', '3ee8f69c3f1997e48453817706c37260', '2', '1466391787', 'web');
INSERT INTO `gwshop_user_passport` VALUES ('43', '1fcb5c4c068ab273a14f94d2bf31a665', '4', '1470839702', 'weixin');
INSERT INTO `gwshop_user_passport` VALUES ('45', '974e4141b8c8d4b2258921e42b810595', '8', '1470885813', 'weixin');
INSERT INTO `gwshop_user_passport` VALUES ('46', '75ca239fd09eb2535c3b9d0e30eede59', '6', '1470886167', 'weixin');
INSERT INTO `gwshop_user_passport` VALUES ('47', '5305891e9f4181f619781432e815dd5e', '7', '1470886262', 'weixin');
INSERT INTO `gwshop_user_passport` VALUES ('49', '531611d86be16795756cc18c593afc4a', '5', '1470886648', 'weixin');
INSERT INTO `gwshop_user_passport` VALUES ('50', 'ad846fd1138e66a1cacd0fb4b8644671', '9', '1470886794', 'weixin');
INSERT INTO `gwshop_user_passport` VALUES ('63', 'd2ab2b971ff0dc34b54c0eaa664873f0', '1', '1470887867', 'weixin');
INSERT INTO `gwshop_user_passport` VALUES ('67', '4d0b954f0bef437c29dfa73fafdf3fa5', '12', '1470888079', 'weixin');
INSERT INTO `gwshop_user_passport` VALUES ('73', 'c39b9a47811f1eaf3244a63ae8c22734', '13', '1470888580', 'weixin');
INSERT INTO `gwshop_user_passport` VALUES ('82', 'e5826e5ffaef4aaecc93d1067d94c985', '15', '1470892857', 'weixin');
INSERT INTO `gwshop_user_passport` VALUES ('86', '5205c14c4266e36ad2a12bc2c629c547', '11', '1470895200', 'weixin');
INSERT INTO `gwshop_user_passport` VALUES ('90', 'd76fbe3f9c1f23538ea8f8f022a45651', '10', '1470897775', 'weixin');
INSERT INTO `gwshop_user_passport` VALUES ('92', '005c03bfd9d4df48aa46f6e6dfb92439', '3', '1470906915', 'weixin');
INSERT INTO `gwshop_user_passport` VALUES ('95', '35b729b42782ce151f53d08c954284dd', '16', '1470965560', 'weixin');
INSERT INTO `gwshop_user_passport` VALUES ('96', 'ff10c0edfa5c94211960970ec02f0331', '17', '1470990383', 'weixin');
INSERT INTO `gwshop_user_passport` VALUES ('98', 'bf6d486087171d602533976bd4939c81', '19', '1470994294', 'weixin');
INSERT INTO `gwshop_user_passport` VALUES ('99', 'd1700affc61c3f7bcde1cc36603e8ac9', '20', '1471054138', 'weixin');
INSERT INTO `gwshop_user_passport` VALUES ('100', 'bf6055077ad393192cb34e27b607e4f2', '21', '1471056088', 'weixin');
INSERT INTO `gwshop_user_passport` VALUES ('101', 'f51f497e2c9d4a67f6d50d70a3d13ee2', '22', '1471159851', 'weixin');
INSERT INTO `gwshop_user_passport` VALUES ('102', '9b2a084225d184770748a90c42a7b760', '23', '1471160191', 'weixin');
INSERT INTO `gwshop_user_passport` VALUES ('103', 'd66d0d00bb7f294c9a9127f437dd3702', '24', '1471270092', 'weixin');
INSERT INTO `gwshop_user_passport` VALUES ('104', '0c9fd755f1e941587cabab631a81f89e', '25', '1472817798', 'weixin');
INSERT INTO `gwshop_user_passport` VALUES ('105', 'a4965216e237306510bc0e0f2dc67a79', '26', '1472817811', 'weixin');
INSERT INTO `gwshop_user_passport` VALUES ('106', '21675fc8afec8db716b774649f566ce3', '27', '1472817844', 'weixin');
INSERT INTO `gwshop_user_passport` VALUES ('107', '12fb22dc8c218ee27d53d2d42bfc1ffe', '28', '1472817925', 'weixin');

-- ----------------------------
-- Table structure for gwshop_weixin_user
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_weixin_user`;
CREATE TABLE `gwshop_weixin_user` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `nickname` varchar(60) NOT NULL COMMENT '用户昵称',
  `subscribe` int(9) NOT NULL DEFAULT '0' COMMENT '用户是否订阅该公众号标识，值为0时，代表此用户没有关注该公众号，拉取不到其余信息',
  `openid` varchar(20) NOT NULL COMMENT '用户的标识，对当前公众号唯一',
  `city` varchar(20) NOT NULL COMMENT '用户所在城市',
  `country` varchar(20) NOT NULL COMMENT '用户所在国家',
  `province` varchar(20) NOT NULL COMMENT '用户所在省份',
  `language` varchar(20) NOT NULL COMMENT '用户的语言，简体中文为zh_CN',
  `headimgurl` varchar(100) NOT NULL COMMENT '用户头像',
  `subscribe_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户关注时间，为时间戳。如果用户曾多次关注，则取最后关注时间',
  `unionid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '只有在用户将公众号绑定到微信开放平台帐号后，才会出现该字段。',
  `remark` varchar(200) NOT NULL COMMENT '公众号运营者对粉丝的备注，公众号运营者可在微信公众平台用户管理界面对粉丝添加备注',
  `groupid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户所在的分组ID（兼容旧的用户分组接口）',
  `tagid_list` varchar(20) NOT NULL COMMENT '用户被打上的标签ID列表',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nickname` (`nickname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信用户表';

-- ----------------------------
-- Records of gwshop_weixin_user
-- ----------------------------

-- ----------------------------
-- Table structure for gwshop_wx_img
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_wx_img`;
CREATE TABLE `gwshop_wx_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `keyword` char(255) NOT NULL COMMENT '关键词',
  `desc` text NOT NULL COMMENT '简介',
  `pic` char(255) NOT NULL COMMENT '封面图片',
  `url` char(255) NOT NULL COMMENT '图文外链地址',
  `createtime` varchar(13) NOT NULL COMMENT '创建时间',
  `uptatetime` varchar(13) NOT NULL COMMENT '更新时间',
  `token` char(30) NOT NULL COMMENT 'token',
  `title` varchar(60) NOT NULL COMMENT '标题',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_name` varchar(50) DEFAULT NULL COMMENT '商品名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='微信图文';

-- ----------------------------
-- Records of gwshop_wx_img
-- ----------------------------
INSERT INTO `gwshop_wx_img` VALUES ('1', '图文1', '图文1图文1图文1图文1', 'http://gwshop.wbzz.comhttp://m.baidu.com/', 'http://m.baidu.com/', '1470735079', '', 'sliyly1470731499', '图文1', '0', '');

-- ----------------------------
-- Table structure for gwshop_wx_keyword
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_wx_keyword`;
CREATE TABLE `gwshop_wx_keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `keyword` char(255) NOT NULL COMMENT '关键词',
  `pid` int(11) NOT NULL COMMENT '对应表ID',
  `token` varchar(60) NOT NULL COMMENT 'token',
  `type` varchar(30) DEFAULT 'TEXT' COMMENT '关键词操作类型',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `token` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gwshop_wx_keyword
-- ----------------------------
INSERT INTO `gwshop_wx_keyword` VALUES ('1', '图文1', '1', 'sliyly1470731499', 'IMG');
INSERT INTO `gwshop_wx_keyword` VALUES ('2', '你好', '1', 'sliyly1470731499', 'TEXT');
INSERT INTO `gwshop_wx_keyword` VALUES ('3', '美女', '2', 'sliyly1470731499', 'TEXT');

-- ----------------------------
-- Table structure for gwshop_wx_menu
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_wx_menu`;
CREATE TABLE `gwshop_wx_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `level` tinyint(1) DEFAULT '1' COMMENT '菜单级别',
  `name` varchar(50) NOT NULL COMMENT 'name',
  `sort` int(5) DEFAULT '0' COMMENT '排序',
  `type` varchar(20) DEFAULT '' COMMENT '0 view 1 click',
  `value` varchar(255) DEFAULT NULL COMMENT 'value',
  `token` varchar(50) NOT NULL COMMENT 'token',
  `pid` int(11) DEFAULT '0' COMMENT '上级菜单',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gwshop_wx_menu
-- ----------------------------
INSERT INTO `gwshop_wx_menu` VALUES ('1', '1', 'aaa', '0', 'view', 'http://m.baidu.com', 'sliyly1470731499', '0');
INSERT INTO `gwshop_wx_menu` VALUES ('2', '1', 'gnwai', '0', 'view', 'http://gnwai.com/wap', 'sliyly1470731499', '1');
INSERT INTO `gwshop_wx_menu` VALUES ('3', '1', 'bbb', '0', 'view', 'http://m.baidu.com', 'sliyly1470731499', '0');

-- ----------------------------
-- Table structure for gwshop_wx_text
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_wx_text`;
CREATE TABLE `gwshop_wx_text` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `uname` varchar(90) NOT NULL COMMENT '用户名',
  `keyword` char(255) NOT NULL COMMENT '关键词',
  `precisions` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'precisions',
  `text` text NOT NULL COMMENT 'text',
  `createtime` varchar(13) NOT NULL COMMENT '创建时间',
  `updatetime` varchar(13) NOT NULL COMMENT '更新时间',
  `click` int(11) NOT NULL COMMENT '点击',
  `token` char(30) NOT NULL COMMENT 'token',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='文本回复表';

-- ----------------------------
-- Records of gwshop_wx_text
-- ----------------------------
INSERT INTO `gwshop_wx_text` VALUES ('1', '0', '', '你好', '0', '你好', '1470735178', '', '0', 'sliyly1470731499');
INSERT INTO `gwshop_wx_text` VALUES ('2', '0', '', '美女', '0', '你好坏，不约', '1471339192', '', '0', 'sliyly1470731499');

-- ----------------------------
-- Table structure for gwshop_wx_user
-- ----------------------------
DROP TABLE IF EXISTS `gwshop_wx_user`;
CREATE TABLE `gwshop_wx_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `uid` int(11) NOT NULL COMMENT 'uid',
  `wxname` varchar(60) NOT NULL COMMENT '公众号名称',
  `aeskey` varchar(256) NOT NULL DEFAULT '' COMMENT 'aeskey',
  `encode` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'encode',
  `appid` varchar(50) NOT NULL DEFAULT '' COMMENT 'appid',
  `appsecret` varchar(50) NOT NULL DEFAULT '' COMMENT 'appsecret',
  `wxid` varchar(20) NOT NULL COMMENT '公众号原始ID',
  `weixin` char(20) NOT NULL COMMENT '微信号',
  `headerpic` char(255) NOT NULL COMMENT '头像地址',
  `token` char(255) NOT NULL COMMENT 'token',
  `w_token` varchar(150) NOT NULL DEFAULT '' COMMENT '微信对接token',
  `create_time` varchar(13) NOT NULL COMMENT 'create_time',
  `updatetime` varchar(13) NOT NULL COMMENT 'updatetime',
  `tplcontentid` varchar(2) NOT NULL COMMENT '内容模版ID',
  `share_ticket` varchar(150) NOT NULL COMMENT '分享ticket',
  `share_dated` char(15) NOT NULL COMMENT 'share_dated',
  `authorizer_access_token` varchar(200) NOT NULL COMMENT 'authorizer_access_token',
  `authorizer_refresh_token` varchar(200) NOT NULL COMMENT 'authorizer_refresh_token',
  `authorizer_expires` char(10) NOT NULL COMMENT 'authorizer_expires',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型',
  `web_access_token` varchar(200) NOT NULL COMMENT ' 网页授权token',
  `web_refresh_token` varchar(200) NOT NULL COMMENT 'web_refresh_token',
  `web_expires` char(10) NOT NULL COMMENT '过期时间',
  `qr` varchar(200) NOT NULL COMMENT 'qr',
  `menu_config` text COMMENT '菜单',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE,
  KEY `uid_2` (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='微信公共帐号';

-- ----------------------------
-- Records of gwshop_wx_user
-- ----------------------------
INSERT INTO `gwshop_wx_user` VALUES ('1', '0', '车主百事帮', '', '0', 'wx06a6433b23500a37', 'fd315e930e64408f441166a755d8bb49', 'gh_2964de6834de', 'chezhubaishibang', '/Public/upload/weixin/2016/09-15/57da3fb20238d.jpg', 'zujafi1473946152', 'gwshop', '1466391787', '', '', '', '', '', '', '', '4', 'AOjx8bt3UXOEFUnedQTOf5XMDjw73pg6dTJ7bmRtpuJSn1dfWjeUMHmgAnmVe_pb7uHvW3HilXFq7zSNGpKSye3WWUgkX0HzxGQHwZwQHhsKSQkCCADLJ', '', '1473954212', 'https://mp.weixin.qq.com/misc/getqrcode?fakeid=3297213916&token=1217909515&style=1', null);
