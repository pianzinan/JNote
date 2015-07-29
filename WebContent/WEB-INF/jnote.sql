/*
Navicat MySQL Data Transfer

Source Server         : 本机
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : jnote

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2015-07-29 23:35:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_article`
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article` (
  `id` int(11) NOT NULL COMMENT '主键自增id',
  `title` varchar(256) NOT NULL COMMENT '标题',
  `markdown` text COMMENT 'markdown语法内容',
  `html` text COMMENT 'html内容',
  `post_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `category_id` int(11) NOT NULL COMMENT '分类id',
  `tags` varchar(256) DEFAULT NULL COMMENT '标签',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_article
-- ----------------------------
INSERT INTO `t_article` VALUES ('1', 'Java中如何倒序输入或者随机访问文本(txt)文件', null, '由于业务需求，需要对一个txt文本文件进行倒序输入，比如文本内容为 \"我是一个需要倒序输入的文本内容\"，需要输出为 “容内本文的入输序倒要需个一是我”。 实现方法有一下几种： 1、将文本文件读入到内存为String、StringBuffer或者StringBuilder，然后进行逆向遍历，此方法比较简单，对于小文本比较有效，如果文本文件比较大，比如GB级别则一次性读入内存不现实。 2、采用RandomAccessFile进行读取，开始将文件指针定位到文件结尾，每次读取一个字符，采用seek方法将位置当前指针位置往回指个单位，这个方法需要可以实现逆向读取文本，但是当文本中含有Unicode双字节字符或者多字节字符时候，将会面临读取错误，非常大的可能会造成乱码，且频繁的操作io，会降低程序性能。 3、采用内存映射文件的方式实现，即采用RandomAccessFile + MappedByteBuffer实现，先将RandomAccessFile映射成一个MappedByteBuffer，再采用Charset进行decode成相应的编码变成CharBuffer，进而可以采用CharBuffer对文件的字符进行逆向读取，不但可以进行你想读取，还可以随机访问任意一个字符，代码如下：', '2015-07-29 13:38:07', '1', 'java,倒序');

-- ----------------------------
-- Table structure for `t_category`
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `id` int(11) NOT NULL COMMENT '键主自增id',
  `name` varchar(256) NOT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES ('1', 'Android');
INSERT INTO `t_category` VALUES ('2', 'Cocos2dx');
INSERT INTO `t_category` VALUES ('3', 'Java');

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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES ('1', 'xxx', 'xxxxx', 'xxxxx', '2015-07-29 15:00:18', '1');
INSERT INTO `t_comment` VALUES ('2', '骗子男<>', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 22:23:09', '1');
INSERT INTO `t_comment` VALUES ('3', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:31', '1');
INSERT INTO `t_comment` VALUES ('4', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:40', '1');
INSERT INTO `t_comment` VALUES ('5', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:47', '1');
INSERT INTO `t_comment` VALUES ('6', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:47', '1');
INSERT INTO `t_comment` VALUES ('7', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:47', '1');
INSERT INTO `t_comment` VALUES ('8', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:47', '1');
INSERT INTO `t_comment` VALUES ('9', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:48', '1');
INSERT INTO `t_comment` VALUES ('10', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:48', '1');
INSERT INTO `t_comment` VALUES ('11', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:48', '1');
INSERT INTO `t_comment` VALUES ('12', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:48', '1');
INSERT INTO `t_comment` VALUES ('13', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:48', '1');
INSERT INTO `t_comment` VALUES ('14', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:49', '1');
INSERT INTO `t_comment` VALUES ('15', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:49', '1');
INSERT INTO `t_comment` VALUES ('16', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:49', '1');
INSERT INTO `t_comment` VALUES ('17', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:49', '1');
INSERT INTO `t_comment` VALUES ('18', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:49', '1');
INSERT INTO `t_comment` VALUES ('19', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:50', '1');
INSERT INTO `t_comment` VALUES ('20', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:50', '1');
INSERT INTO `t_comment` VALUES ('21', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:50', '1');
INSERT INTO `t_comment` VALUES ('22', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:50', '1');
INSERT INTO `t_comment` VALUES ('23', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:50', '1');
INSERT INTO `t_comment` VALUES ('24', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:51', '1');
INSERT INTO `t_comment` VALUES ('25', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:51', '1');
INSERT INTO `t_comment` VALUES ('26', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:51', '1');
INSERT INTO `t_comment` VALUES ('27', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:51', '1');
INSERT INTO `t_comment` VALUES ('28', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:51', '1');
INSERT INTO `t_comment` VALUES ('29', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:52', '1');
INSERT INTO `t_comment` VALUES ('30', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:52', '1');
INSERT INTO `t_comment` VALUES ('31', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:52', '1');
INSERT INTO `t_comment` VALUES ('32', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:52', '1');
INSERT INTO `t_comment` VALUES ('33', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:52', '1');
INSERT INTO `t_comment` VALUES ('34', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:53', '1');
INSERT INTO `t_comment` VALUES ('35', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:53', '1');
INSERT INTO `t_comment` VALUES ('36', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:53', '1');
INSERT INTO `t_comment` VALUES ('37', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:53', '1');
INSERT INTO `t_comment` VALUES ('38', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:53', '1');
INSERT INTO `t_comment` VALUES ('39', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:54', '1');
INSERT INTO `t_comment` VALUES ('40', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:54', '1');
INSERT INTO `t_comment` VALUES ('41', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:54', '1');
INSERT INTO `t_comment` VALUES ('42', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:54', '1');
INSERT INTO `t_comment` VALUES ('43', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:54', '1');
INSERT INTO `t_comment` VALUES ('44', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:55', '1');
INSERT INTO `t_comment` VALUES ('45', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:55', '1');
INSERT INTO `t_comment` VALUES ('46', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:55', '1');
INSERT INTO `t_comment` VALUES ('47', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:55', '1');
INSERT INTO `t_comment` VALUES ('48', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:55', '1');
INSERT INTO `t_comment` VALUES ('49', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:56', '1');
INSERT INTO `t_comment` VALUES ('50', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:56', '1');
INSERT INTO `t_comment` VALUES ('51', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:56', '1');
INSERT INTO `t_comment` VALUES ('52', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:56', '1');
INSERT INTO `t_comment` VALUES ('53', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:57', '1');
INSERT INTO `t_comment` VALUES ('54', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:57', '1');
INSERT INTO `t_comment` VALUES ('55', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:57', '1');
INSERT INTO `t_comment` VALUES ('56', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:57', '1');
INSERT INTO `t_comment` VALUES ('57', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:57', '1');
INSERT INTO `t_comment` VALUES ('58', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:58', '1');
INSERT INTO `t_comment` VALUES ('59', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:58', '1');
INSERT INTO `t_comment` VALUES ('60', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:58', '1');
INSERT INTO `t_comment` VALUES ('61', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:58', '1');
INSERT INTO `t_comment` VALUES ('62', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:58', '1');
INSERT INTO `t_comment` VALUES ('63', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:59', '1');
INSERT INTO `t_comment` VALUES ('64', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:59', '1');
INSERT INTO `t_comment` VALUES ('65', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:59', '1');
INSERT INTO `t_comment` VALUES ('66', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:59', '1');
INSERT INTO `t_comment` VALUES ('67', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:04:00', '1');
INSERT INTO `t_comment` VALUES ('68', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:04:00', '1');
INSERT INTO `t_comment` VALUES ('69', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:04:00', '1');
INSERT INTO `t_comment` VALUES ('70', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:04:00', '1');
INSERT INTO `t_comment` VALUES ('71', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:04:01', '1');
INSERT INTO `t_comment` VALUES ('72', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:04:01', '1');
INSERT INTO `t_comment` VALUES ('73', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:04:01', '1');
INSERT INTO `t_comment` VALUES ('74', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:04:01', '1');
INSERT INTO `t_comment` VALUES ('75', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:04:01', '1');
INSERT INTO `t_comment` VALUES ('76', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:04:02', '1');
INSERT INTO `t_comment` VALUES ('77', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:04:02', '1');
INSERT INTO `t_comment` VALUES ('78', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:04:02', '1');
INSERT INTO `t_comment` VALUES ('79', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:04:02', '1');
INSERT INTO `t_comment` VALUES ('80', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:04:02', '1');
INSERT INTO `t_comment` VALUES ('81', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:04:03', '1');
INSERT INTO `t_comment` VALUES ('82', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:04:03', '1');
INSERT INTO `t_comment` VALUES ('83', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:04:03', '1');
INSERT INTO `t_comment` VALUES ('84', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:04:03', '1');
INSERT INTO `t_comment` VALUES ('85', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:04:04', '1');
INSERT INTO `t_comment` VALUES ('86', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:04:04', '1');
INSERT INTO `t_comment` VALUES ('87', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:04:04', '1');
INSERT INTO `t_comment` VALUES ('88', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:04:04', '1');
INSERT INTO `t_comment` VALUES ('89', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:04:05', '1');
INSERT INTO `t_comment` VALUES ('90', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:04:05', '1');
INSERT INTO `t_comment` VALUES ('91', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:04:05', '1');
INSERT INTO `t_comment` VALUES ('92', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:04:05', '1');
INSERT INTO `t_comment` VALUES ('93', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:04:05', '1');
INSERT INTO `t_comment` VALUES ('94', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:04:06', '1');
INSERT INTO `t_comment` VALUES ('95', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:04:06', '1');
INSERT INTO `t_comment` VALUES ('96', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:04:06', '1');
INSERT INTO `t_comment` VALUES ('97', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:04:06', '1');
INSERT INTO `t_comment` VALUES ('98', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:04:08', '1');
INSERT INTO `t_comment` VALUES ('99', '程序猿', '1023400273@qq.com', 'good beset', '2015-07-29 22:12:45', '1');
