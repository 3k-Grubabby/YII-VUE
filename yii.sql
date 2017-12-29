/*
Navicat MySQL Data Transfer

Source Server         : shop
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : yii

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-12-29 18:50:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `clients`
-- ----------------------------
DROP TABLE IF EXISTS `clients`;
CREATE TABLE `clients` (
  `client_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_appid` varchar(255) DEFAULT NULL,
  `client_appkey` varchar(255) DEFAULT NULL,
  `client_token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clients
-- ----------------------------
INSERT INTO `clients` VALUES ('1', 'jhe87fkjj', 'aab73kjj', '7lPLx9xutdPFtfFa8kDdX5qH2D92aTNL');
INSERT INTO `clients` VALUES ('2', 'admin', 'admin', 'jku9hs9pvWEq_CgeBqXzURlCVQ0O2ZoH');

-- ----------------------------
-- Table structure for `navbar`
-- ----------------------------
DROP TABLE IF EXISTS `navbar`;
CREATE TABLE `navbar` (
  `nav_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nav_text` varchar(255) DEFAULT NULL,
  `nav_url` varchar(255) DEFAULT NULL,
  `nav_order` int(10) unsigned DEFAULT NULL COMMENT '排序',
  `nav_pid` int(11) DEFAULT NULL COMMENT '父id',
  PRIMARY KEY (`nav_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of navbar
-- ----------------------------
INSERT INTO `navbar` VALUES ('1', '首页', '/', '1', '0');
INSERT INTO `navbar` VALUES ('2', '健身', '/fitness', '1', '0');
INSERT INTO `navbar` VALUES ('3', '饮食', '/diet', '1', '0');
INSERT INTO `navbar` VALUES ('4', '私人定制', '/pt', '1', '0');

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `news_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `news_title` varchar(100) DEFAULT NULL,
  `news_classid` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '测试新闻', '2', '3');
INSERT INTO `news` VALUES ('2', 'yii', '2', '2');
INSERT INTO `news` VALUES ('3', 'yii', '2', '2');
INSERT INTO `news` VALUES ('4', 'yii', '2', '5');

-- ----------------------------
-- Table structure for `news_class`
-- ----------------------------
DROP TABLE IF EXISTS `news_class`;
CREATE TABLE `news_class` (
  `class_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news_class
-- ----------------------------
INSERT INTO `news_class` VALUES ('1', '焦点新闻');
INSERT INTO `news_class` VALUES ('2', '内部新闻');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `user_pass` varchar(255) DEFAULT NULL,
  `user_date` date DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_name` (`user_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'wang', '123', '2017-11-23');
INSERT INTO `users` VALUES ('6', 'admin', '123456', null);
INSERT INTO `users` VALUES ('7', null, null, null);
INSERT INTO `users` VALUES ('8', null, null, null);
INSERT INTO `users` VALUES ('9', null, null, null);
INSERT INTO `users` VALUES ('10', 'wangyocheng', null, null);

-- ----------------------------
-- Table structure for `videos`
-- ----------------------------
DROP TABLE IF EXISTS `videos`;
CREATE TABLE `videos` (
  `v_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `v_title` varchar(255) DEFAULT NULL,
  `v_class` int(11) DEFAULT NULL,
  `v_intr` text COMMENT '视频简介',
  `v_userid` int(11) DEFAULT NULL,
  `v_addtime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '入库时间',
  `v_lastmod` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `v_playlist` int(11) DEFAULT NULL COMMENT '播放列表',
  `v_pic` varchar(50) NOT NULL COMMENT '视频封面',
  `v_money` int(11) DEFAULT NULL,
  `v_file` varchar(200) DEFAULT NULL,
  `v_tags` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`v_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of videos
-- ----------------------------

-- ----------------------------
-- Table structure for `videos_files`
-- ----------------------------
DROP TABLE IF EXISTS `videos_files`;
CREATE TABLE `videos_files` (
  `vf_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vf_key` varchar(100) DEFAULT NULL,
  `vf_uptime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`vf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of videos_files
-- ----------------------------
INSERT INTO `videos_files` VALUES ('1', 'Fluf3EH1oBDzr_noXXGWxIl6HnGF', null);
INSERT INTO `videos_files` VALUES ('2', 'Fluf3EH1oBDzr_noXXGWxIl6HnGF', null);
INSERT INTO `videos_files` VALUES ('3', 'Fs_UaoI_yvzHBWZU1E77C8XqCd6A', null);
INSERT INTO `videos_files` VALUES ('4', 'Fluf3EH1oBDzr_noXXGWxIl6HnGF', null);
INSERT INTO `videos_files` VALUES ('5', 'Fluf3EH1oBDzr_noXXGWxIl6HnGF', null);
INSERT INTO `videos_files` VALUES ('6', 'Fluf3EH1oBDzr_noXXGWxIl6HnGF', null);
INSERT INTO `videos_files` VALUES ('7', 'Fs_UaoI_yvzHBWZU1E77C8XqCd6A', null);
INSERT INTO `videos_files` VALUES ('8', 'Fluf3EH1oBDzr_noXXGWxIl6HnGF', null);
INSERT INTO `videos_files` VALUES ('9', 'Fs_UaoI_yvzHBWZU1E77C8XqCd6A', null);
INSERT INTO `videos_files` VALUES ('10', 'Fs_UaoI_yvzHBWZU1E77C8XqCd6A', null);
INSERT INTO `videos_files` VALUES ('11', 'Fs_UaoI_yvzHBWZU1E77C8XqCd6A', null);
INSERT INTO `videos_files` VALUES ('12', 'Fs_UaoI_yvzHBWZU1E77C8XqCd6A', null);
INSERT INTO `videos_files` VALUES ('13', 'Fs_UaoI_yvzHBWZU1E77C8XqCd6A', null);
INSERT INTO `videos_files` VALUES ('14', 'Fluf3EH1oBDzr_noXXGWxIl6HnGF', null);
INSERT INTO `videos_files` VALUES ('15', 'Fs_UaoI_yvzHBWZU1E77C8XqCd6A', null);
INSERT INTO `videos_files` VALUES ('16', 'Fs_UaoI_yvzHBWZU1E77C8XqCd6A', null);
INSERT INTO `videos_files` VALUES ('17', 'FiIsklLgOpoCMeub3uS301P7PaFs', null);
INSERT INTO `videos_files` VALUES ('18', 'FiIsklLgOpoCMeub3uS301P7PaFs', null);
INSERT INTO `videos_files` VALUES ('19', 'Fluf3EH1oBDzr_noXXGWxIl6HnGF', null);
INSERT INTO `videos_files` VALUES ('20', 'Fluf3EH1oBDzr_noXXGWxIl6HnGF', null);
INSERT INTO `videos_files` VALUES ('21', 'Fluf3EH1oBDzr_noXXGWxIl6HnGF', null);
INSERT INTO `videos_files` VALUES ('22', 'Fs_UaoI_yvzHBWZU1E77C8XqCd6A', null);
INSERT INTO `videos_files` VALUES ('23', 'Fs_UaoI_yvzHBWZU1E77C8XqCd6A', null);
INSERT INTO `videos_files` VALUES ('24', 'Fluf3EH1oBDzr_noXXGWxIl6HnGF', null);

-- ----------------------------
-- Table structure for `videos_img`
-- ----------------------------
DROP TABLE IF EXISTS `videos_img`;
CREATE TABLE `videos_img` (
  `img_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `img_name` varchar(255) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `img_uptime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `isuploaded` bit(1) DEFAULT b'0',
  PRIMARY KEY (`img_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of videos_img
-- ----------------------------
INSERT INTO `videos_img` VALUES ('1', '201712271050110.jpg', 'http://p1ly8xazk.bkt.clouddn.com/201712271050110.jpg', null, null, '');
INSERT INTO `videos_img` VALUES ('2', '201712271051030.jpg', 'http://p1ly8xazk.bkt.clouddn.com/201712271051030.jpg', null, null, '');
INSERT INTO `videos_img` VALUES ('3', '201712271052580.jpg', 'http://p1ly8xazk.bkt.clouddn.com/201712271052580.jpg', null, null, '');
INSERT INTO `videos_img` VALUES ('4', '201712280159100.jpg', 'http://p1ly8xazk.bkt.clouddn.com/201712280159100.jpg', null, null, '');
INSERT INTO `videos_img` VALUES ('5', '201712290410130.jpg', 'http://p1ly8xazk.bkt.clouddn.com/201712290410130.jpg', null, null, '');
INSERT INTO `videos_img` VALUES ('6', '201712290420570.jpg', 'http://p1ly8xazk.bkt.clouddn.com/201712290420570.jpg', null, '2017-12-29 11:21:12', '');
INSERT INTO `videos_img` VALUES ('7', '201712290421390.jpg', 'http://p1ly8xazk.bkt.clouddn.com/201712290421390.jpg', null, '2017-12-29 11:21:52', '');
INSERT INTO `videos_img` VALUES ('8', '201712290426350.jpg', 'http://p1ly8xazk.bkt.clouddn.com/201712290426350.jpg', null, '2017-12-29 11:26:47', '');
INSERT INTO `videos_img` VALUES ('9', '201712290430270.jpg', 'http://p1ly8xazk.bkt.clouddn.com/201712290430270.jpg', null, '2017-12-29 11:30:39', '');
INSERT INTO `videos_img` VALUES ('10', '201712290433590.jpg', 'http://p1ly8xazk.bkt.clouddn.com/201712290433590.jpg', null, '2017-12-29 11:34:19', '');
INSERT INTO `videos_img` VALUES ('11', '201712290435380.jpg', 'http://p1ly8xazk.bkt.clouddn.com/201712290435380.jpg', null, '2017-12-29 11:35:58', '');
INSERT INTO `videos_img` VALUES ('12', '201712290439050.jpg', 'http://p1ly8xazk.bkt.clouddn.com/201712290439050.jpg', null, '2017-12-29 11:39:16', '');
INSERT INTO `videos_img` VALUES ('13', '201712290440110.jpg', 'http://p1ly8xazk.bkt.clouddn.com/201712290440110.jpg', null, '2017-12-29 11:40:22', '');
INSERT INTO `videos_img` VALUES ('14', '201712290447140.jpg', 'http://p1ly8xazk.bkt.clouddn.com/201712290447140.jpg', null, '2017-12-29 11:47:29', '');
INSERT INTO `videos_img` VALUES ('15', '201712290448480.jpg', 'http://p1ly8xazk.bkt.clouddn.com/201712290448480.jpg', null, '2017-12-29 11:49:14', '');
INSERT INTO `videos_img` VALUES ('16', '201712290451130.jpg', 'http://p1ly8xazk.bkt.clouddn.com/201712290451130.jpg', null, '2017-12-29 11:51:54', '');
INSERT INTO `videos_img` VALUES ('17', '201712290453150.jpg', 'http://p1ly8xazk.bkt.clouddn.com/201712290453150.jpg', null, '2017-12-29 11:53:37', '');
INSERT INTO `videos_img` VALUES ('18', '201712291109430.jpg', 'http://p1ly8xazk.bkt.clouddn.com/201712291109430.jpg', null, '2017-12-29 18:09:56', '');
INSERT INTO `videos_img` VALUES ('19', '201712291134420.jpg', 'http://p1ly8xazk.bkt.clouddn.com/201712291134420.jpg', null, '2017-12-29 18:34:53', '');
INSERT INTO `videos_img` VALUES ('20', '201712291137180.jpg', 'http://p1ly8xazk.bkt.clouddn.com/201712291137180.jpg', null, '2017-12-29 18:37:29', '');
INSERT INTO `videos_img` VALUES ('21', '201712291138540.jpg', 'http://p1ly8xazk.bkt.clouddn.com/201712291138540.jpg', null, '2017-12-29 18:39:05', '');
INSERT INTO `videos_img` VALUES ('22', '201712291142070.jpg', 'http://p1ly8xazk.bkt.clouddn.com/201712291142070.jpg', null, '2017-12-29 18:42:20', '');
INSERT INTO `videos_img` VALUES ('23', '201712291147500.jpg', 'http://p1ly8xazk.bkt.clouddn.com/201712291147500.jpg', null, '2017-12-29 18:48:02', '');
INSERT INTO `videos_img` VALUES ('24', '201712291149020.jpg', 'http://p1ly8xazk.bkt.clouddn.com/201712291149020.jpg', null, '2017-12-29 18:49:15', '');
