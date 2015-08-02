/*
Navicat MySQL Data Transfer

Source Server         : 本机
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : jnote

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2015-08-02 22:12:42
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
) ENGINE=InnoDB AUTO_INCREMENT=545 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_article
-- ----------------------------
INSERT INTO `t_article` VALUES ('1', 'Java中如何倒序输入或者随机访问文本(txt)文件', '由于业务需求，需要对一个txt文本文件进行倒序输入，比如文本内容为 \"我是一个需要倒序输入的文本内容\"，需要输出为 “容内本文的入输序倒要需个一是我”。 实现方法有一下几种： 1、将文本文件读入到内存为String、StringBuffer或者StringBuilder，然后进行逆向遍历，此方法比较简单，对于小文本比较有效，如果文本文件比较大，比如GB级别则一次性读入内存不现实。 2、采用RandomAccessFile进行读取，开始将文件指针定位到文件结尾，每次读取一个字符，采用seek方法将位置当前指针位置往回指个单位，这个方法需要可以实现逆向读取文本，但是当文本中含有Unicode双字节字符或者多字节字符时候，将会面临读取错误，非常大的可能会造成乱码，且频繁的操作io，会降低程序性能。 3、采用内存映射文件的方式实现，即采用RandomAccessFile + MappedByteBuffer实现，先将RandomAccessFile映射成一个MappedByteBuffer，再采用Charset进行decode成相应的编码变成CharBuffer，进而可以采用CharBuffer对文件的字符进行逆向读取，不但可以进行你想读取，还可以随机访问任意一个字符，代码如下：', '2015-08-01 23:35:56', '1', 'java,倒序', '1', '1');
INSERT INTO `t_article` VALUES ('4', 'Java中如何倒序输入或者随机访问文本(txt)文件', '由于业务需求，需要对一个txt文本文件进行倒序输入，比如文本内容为 \"我是一个需要倒序输入的文本内容\"，需要输出为 “容内本文的入输序倒要需个一是我”。 实现方法有一下几种： 1、将文本文件读入到内存为String、StringBuffer或者StringBuilder，然后进行逆向遍历，此方法比较简单，对于小文本比较有效，如果文本文件比较大，比如GB级别则一次性读入内存不现实。 2、采用RandomAccessFile进行读取，开始将文件指针定位到文件结尾，每次读取一个字符，采用seek方法将位置当前指针位置往回指个单位，这个方法需要可以实现逆向读取文本，但是当文本中含有Unicode双字节字符或者多字节字符时候，将会面临读取错误，非常大的可能会造成乱码，且频繁的操作io，会降低程序性能。 3、采用内存映射文件的方式实现，即采用RandomAccessFile + MappedByteBuffer实现，先将RandomAccessFile映射成一个MappedByteBuffer，再采用Charset进行decode成相应的编码变成CharBuffer，进而可以采用CharBuffer对文件的字符进行逆向读取，不但可以进行你想读取，还可以随机访问任意一个字符，代码如下：', '2015-08-01 23:35:57', '1', 'java,倒序', '1', '1');
INSERT INTO `t_article` VALUES ('5', 'Java中如何倒序输入或者随机访问文本(txt)文件', '由于业务需求，需要对一个txt文本文件进行倒序输入，比如文本内容为 \"我是一个需要倒序输入的文本内容\"，需要输出为 “容内本文的入输序倒要需个一是我”。 实现方法有一下几种： 1、将文本文件读入到内存为String、StringBuffer或者StringBuilder，然后进行逆向遍历，此方法比较简单，对于小文本比较有效，如果文本文件比较大，比如GB级别则一次性读入内存不现实。 2、采用RandomAccessFile进行读取，开始将文件指针定位到文件结尾，每次读取一个字符，采用seek方法将位置当前指针位置往回指个单位，这个方法需要可以实现逆向读取文本，但是当文本中含有Unicode双字节字符或者多字节字符时候，将会面临读取错误，非常大的可能会造成乱码，且频繁的操作io，会降低程序性能。 3、采用内存映射文件的方式实现，即采用RandomAccessFile + MappedByteBuffer实现，先将RandomAccessFile映射成一个MappedByteBuffer，再采用Charset进行decode成相应的编码变成CharBuffer，进而可以采用CharBuffer对文件的字符进行逆向读取，不但可以进行你想读取，还可以随机访问任意一个字符，代码如下：', '2015-08-01 23:35:55', '1', 'java,倒序', '1', '1');
INSERT INTO `t_article` VALUES ('6', 'Java中如何倒序输入或者随机访问文本(txt)文件', '由于业务需求，需要对一个txt文本文件进行倒序输入，比如文本内容为 \"我是一个需要倒序输入的文本内容\"，需要输出为 “容内本文的入输序倒要需个一是我”。 实现方法有一下几种： 1、将文本文件读入到内存为String、StringBuffer或者StringBuilder，然后进行逆向遍历，此方法比较简单，对于小文本比较有效，如果文本文件比较大，比如GB级别则一次性读入内存不现实。 2、采用RandomAccessFile进行读取，开始将文件指针定位到文件结尾，每次读取一个字符，采用seek方法将位置当前指针位置往回指个单位，这个方法需要可以实现逆向读取文本，但是当文本中含有Unicode双字节字符或者多字节字符时候，将会面临读取错误，非常大的可能会造成乱码，且频繁的操作io，会降低程序性能。 3、采用内存映射文件的方式实现，即采用RandomAccessFile + MappedByteBuffer实现，先将RandomAccessFile映射成一个MappedByteBuffer，再采用Charset进行decode成相应的编码变成CharBuffer，进而可以采用CharBuffer对文件的字符进行逆向读取，不但可以进行你想读取，还可以随机访问任意一个字符，代码如下：', '2015-08-01 23:35:59', '1', 'java,倒序', '1', '1');
INSERT INTO `t_article` VALUES ('7', 'Java中如何倒序输入或者随机访问文本(txt)文件', '由于业务需求，需要对一个txt文本文件进行倒序输入，比如文本内容为 \"我是一个需要倒序输入的文本内容\"，需要输出为 “容内本文的入输序倒要需个一是我”。 实现方法有一下几种： 1、将文本文件读入到内存为String、StringBuffer或者StringBuilder，然后进行逆向遍历，此方法比较简单，对于小文本比较有效，如果文本文件比较大，比如GB级别则一次性读入内存不现实。 2、采用RandomAccessFile进行读取，开始将文件指针定位到文件结尾，每次读取一个字符，采用seek方法将位置当前指针位置往回指个单位，这个方法需要可以实现逆向读取文本，但是当文本中含有Unicode双字节字符或者多字节字符时候，将会面临读取错误，非常大的可能会造成乱码，且频繁的操作io，会降低程序性能。 3、采用内存映射文件的方式实现，即采用RandomAccessFile + MappedByteBuffer实现，先将RandomAccessFile映射成一个MappedByteBuffer，再采用Charset进行decode成相应的编码变成CharBuffer，进而可以采用CharBuffer对文件的字符进行逆向读取，不但可以进行你想读取，还可以随机访问任意一个字符，代码如下：', '2015-08-01 23:35:53', '1', 'java,倒序', '1', '1');
INSERT INTO `t_article` VALUES ('541', '测试', '<p>更新啦啦啦啦啦</p>', '2015-08-01 23:35:52', '2', '测试', '2', '1');
INSERT INTO `t_article` VALUES ('542', '新的文章', '新的文章', '2015-07-31 15:00:10', '2', '新的文章', '1', '1');
INSERT INTO `t_article` VALUES ('543', '测试markdown', '![mahua](mahua-logo.jpg)\r\n##MaHua是什么?\r\n一个在线编辑markdown文档的编辑器\r\n\r\n向Mac下优秀的markdown编辑器mou致敬\r\n\r\n##MaHua有哪些功能？\r\n\r\n* 方便的`导入导出`功能\r\n    *  直接把一个markdown的文本文件拖放到当前这个页面就可以了\r\n    *  导出为一个html格式的文件，样式一点也不会丢失\r\n* 编辑和预览`同步滚动`，所见即所得（右上角设置）\r\n* `VIM快捷键`支持，方便vim党们快速的操作 （右上角设置）\r\n* 强大的`自定义CSS`功能，方便定制自己的展示\r\n* 有数量也有质量的`主题`,编辑器和预览区域\r\n* 完美兼容`Github`的markdown语法\r\n* 预览区域`代码高亮`\r\n* 所有选项自动记忆\r\n\r\n##有问题反馈\r\n在使用中有任何问题，欢迎反馈给我，可以用以下联系方式跟我交流\r\n\r\n* 邮件(dev.hubo#gmail.com, 把#换成@)\r\n* QQ: 287759234\r\n* weibo: [@草依山](http://weibo.com/ihubo)\r\n* twitter: [@ihubo](http://twitter.com/ihubo)\r\n\r\n##捐助开发者\r\n在兴趣的驱动下,写一个`免费`的东西，有欣喜，也还有汗水，希望你喜欢我的作品，同时也能支持一下。\r\n当然，有钱捧个钱场（右上角的爱心标志，支持支付宝和PayPal捐助），没钱捧个人场，谢谢各位。\r\n\r\n##感激\r\n感谢以下的项目,排名不分先后\r\n\r\n* [mou](http://mouapp.com/) \r\n* [ace](http://ace.ajax.org/)\r\n* [jquery](http://jquery.com)\r\n\r\n##关于作者\r\n\r\n```javascript\r\n  var ihubo = {\r\n    nickName  : \"草依山\",\r\n    site : \"http://jser.me\"\r\n  }\r\n```', '2015-08-01 23:28:55', '1', '测试markdown', '1', '1');

-- ----------------------------
-- Table structure for `t_category`
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '键主自增id',
  `name` varchar(256) NOT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES ('1', 'Android');
INSERT INTO `t_category` VALUES ('2', 'Cocos2dx');

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
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES ('1', 'xxx', 'xxxxx', 'xxxxx', '2015-07-29 15:00:18', '1');
INSERT INTO `t_comment` VALUES ('2', '骗子男<>', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 22:23:09', '1');
INSERT INTO `t_comment` VALUES ('3', '骗子男', '1023400273@qq.com', '搭建费拉飞机的萨菲辣的飞机安德鲁', '2015-07-29 15:03:31', '1');
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
INSERT INTO `t_comment` VALUES ('100', 'anonymous', '', 'no bad', '2015-08-02 14:09:36', '543');
INSERT INTO `t_comment` VALUES ('101', 'anonymous', '', 'no bad', '2015-08-02 14:11:37', '543');

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
INSERT INTO `t_config` VALUES ('domain', '');
INSERT INTO `t_config` VALUES ('html_head', '');
INSERT INTO `t_config` VALUES ('meta_description', 'asdfasf');
INSERT INTO `t_config` VALUES ('meta_keywords', 'dgasdfas');
INSERT INTO `t_config` VALUES ('note_name', 'ffff');
INSERT INTO `t_config` VALUES ('password', '123456');
