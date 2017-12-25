/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : yii

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-12-26 00:31:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for navbar
-- ----------------------------
DROP TABLE IF EXISTS `navbar`;
CREATE TABLE `navbar` (
  `nav_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nav_text` varchar(255) DEFAULT NULL,
  `nav_url` varchar(255) DEFAULT NULL,
  `nav_order` int(255) unsigned DEFAULT NULL,
  `nav_pid` int(10) unsigned DEFAULT NULL,
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
-- Table structure for videos
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
  PRIMARY KEY (`v_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of videos
-- ----------------------------
