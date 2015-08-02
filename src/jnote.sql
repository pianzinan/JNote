/*
Navicat MySQL Data Transfer

Source Server         : 本机
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : jnote

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2015-08-02 23:15:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_article`
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增id',
  `title` varchar(256) NOT NULL COMMENT '标题',
  `content` text COMMENT 'html内容',
  `post_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `category_id` int(11) NOT NULL COMMENT '分类id',
  `tags` varchar(256) DEFAULT NULL COMMENT '标签',
  `content_type` int(11) NOT NULL DEFAULT '1' COMMENT '1-markdown  2-umeditor',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0-草稿 1-发布',
  PRIMARY KEY (`id`),
  KEY `FK_CATEGORY` (`category_id`),
  CONSTRAINT `FK_CATEGORY` FOREIGN KEY (`category_id`) REFERENCES `t_category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_article
-- ----------------------------

-- ----------------------------
-- Table structure for `t_category`
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '键主自增id',
  `name` varchar(256) NOT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_category
-- ----------------------------

-- ----------------------------
-- Table structure for `t_comment`
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `username` varchar(64) DEFAULT NULL COMMENT '用户名',
  `contact` varchar(64) DEFAULT NULL COMMENT '联系方式',
  `message` varchar(1024) NOT NULL COMMENT '留言内容',
  `post_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '留言时间',
  `article_id` int(11) NOT NULL COMMENT '章文id',
  PRIMARY KEY (`id`),
  KEY `FK_ARTICLE` (`article_id`),
  CONSTRAINT `FK_ARTICLE` FOREIGN KEY (`article_id`) REFERENCES `t_article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `t_config`
-- ----------------------------
DROP TABLE IF EXISTS `t_config`;
CREATE TABLE `t_config` (
  `key` varchar(128) NOT NULL COMMENT '键',
  `value` varchar(1024) NOT NULL COMMENT '值',
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_config
-- ----------------------------
INSERT INTO `t_config` VALUES ('note_name', 'JNote');
