/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50627
Source Host           : localhost:3306
Source Database       : work

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2016-08-28 20:12:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `g_id` int(10) NOT NULL AUTO_INCREMENT,
  `introduction` text,
  `name` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `goods_type_id` int(10) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `money` double(255,0) DEFAULT NULL,
  PRIMARY KEY (`g_id`),
  KEY `FK_rl0q5dmoa0uieho7le4uoji6c` (`goods_type_id`),
  CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`goods_type_id`) REFERENCES `goods_type` (`gt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('3', '<p>芝士黄金鸡球的介绍咯</p>', '芝士黄金鸡球', '2016-08-08 18:34:14', '8', '45ecd4bc-67bc-4adb-a7ef-ec4ea1796f65.jpg', '10');
INSERT INTO `goods` VALUES ('4', '<p>纯牛奶的介绍咯</p>', '纯牛奶', '2016-08-08 18:34:29', '7', 'b01cccf5-5c32-4759-bad1-ee33a2df16a5.jpg', '8');
INSERT INTO `goods` VALUES ('5', '<p>9寸</p>', '超级至尊比萨', '2016-08-08 18:34:32', '9', '0e152e7a-ffe5-4bdd-b2a8-5f52c831e1db.jpg', '65');
INSERT INTO `goods` VALUES ('6', '<p>9寸</p>', '新奥尔良风情烤肉比萨', '2016-08-08 18:35:49', '9', 'a42b7c05-0d98-4eb9-a020-8650ad5237d4.jpg', '61');
INSERT INTO `goods` VALUES ('8', '<p>百事可乐</p>', '百事可乐', '2016-08-09 18:56:27', '7', '740afb1f-0693-45db-85c3-bde87ec3a43d.jpg', '3');
INSERT INTO `goods` VALUES ('9', '<p>随便比萨的介绍</p>', '随便比萨', '2016-08-09 22:27:05', '9', 'bb3401eb-afda-4106-9cc3-f17932959b67.jpg', '65');
INSERT INTO `goods` VALUES ('10', '<p>秘制喷香烤鸡肉比萨 的介绍咯</p>', '秘制喷香烤鸡肉比萨', '2016-08-09 22:28:07', '9', 'befcdac3-cd21-4738-8dc9-a4f7989387ee.jpg', '42');
INSERT INTO `goods` VALUES ('11', '<p>意式培根卷扇贝比萨 (纯珍)的介绍...&nbsp;</p>', '意式培根卷扇贝比萨', '2016-08-09 22:28:47', '9', 'bf6ce2be-0c60-4c2d-93bd-48d43777dcde.jpg', '72');
INSERT INTO `goods` VALUES ('12', '<p>普罗旺斯风情烤鸡比萨 (纯珍)的介绍咯</p>', '普罗旺斯风情烤鸡比萨', '2016-08-09 22:29:14', '9', 'd0103c9c-08d8-4a35-a911-d37118d0d0dc.jpg', '59');
INSERT INTO `goods` VALUES ('13', '<p>随便随便</p>', '随便比萨二号', '2016-08-09 22:30:26', '9', '4de055ce-4cbc-4e95-a041-d176f56fd3cc.jpg', '56');
INSERT INTO `goods` VALUES ('14', '<p>随便饮料的介绍咯</p>', '随便饮料', '2016-08-09 22:31:00', '7', '3d3503b7-93d6-4a18-a2ff-890abbb09082.jpg', '10');
INSERT INTO `goods` VALUES ('15', '<p>随便饮料二号的介绍</p>', '随便饮料二号', '2016-08-11 15:11:31', '7', 'cc66bd74-982e-4da4-82d1-e409ae0436a8.jpg', '12');
INSERT INTO `goods` VALUES ('16', '<p>随便比萨三号的介绍</p>', '随便比萨三号', '2016-08-11 15:12:04', '9', '66d4fa4e-c449-4517-af67-9bc68ef7543d.jpg', '76');
INSERT INTO `goods` VALUES ('17', '<p>9寸</p>', '随便比萨四号', '2016-08-11 17:46:23', '9', '7bde3628-5d56-4aa7-96d6-8d2456814839.jpg', '74');
INSERT INTO `goods` VALUES ('18', '<p>9寸</p>', '芝爱榴莲比萨', '2016-08-11 17:47:06', '9', '5d5a90ee-ba34-4752-958c-bdc6b47ca654.jpg', '78');
INSERT INTO `goods` VALUES ('19', '<p>随便小吃介绍</p>', '随便小吃', '2016-08-11 17:47:40', '8', '0698c79b-ad95-4541-848e-fb3ac3b0359b.jpg', '14');
INSERT INTO `goods` VALUES ('20', '<p>12寸</p>', '随便比萨五号', '2016-08-11 17:48:12', '9', '5b1139de-86aa-4449-a287-833c5f753673.jpg', '67');
INSERT INTO `goods` VALUES ('23', '<p style=\"margin-bottom: 5px; line-height: normal;\"><span style=\"color: rgb(0, 112, 192); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">蓝色蓝色 &nbsp;微软雅黑 &nbsp;<span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; color: rgb(255, 0, 0);\">红色 &nbsp;试一下长一点的字多长呢 &nbsp; <span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; color: rgb(255, 0, 0); font-size: 24px;\"><em><strong>大字 </strong></em></span><strong>&nbsp; &nbsp;</strong></span></span><span style=\"color: rgb(0, 112, 192); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; text-decoration: underline;\"><strong>下划线 &nbsp; </strong></span><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; text-decoration: none; color: rgb(146, 208, 80);\"><strong>别的颜色 &nbsp;<span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; text-decoration: none; color: rgb(146, 208, 80); font-size: 10px;\"> 小字</span></strong></span></p><p style=\"margin-bottom: 5px; line-height: normal;\"><strong><span style=\"text-decoration: underline;\"><em><span style=\"text-decoration: underline; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px; color: rgb(23, 54, 93); background-color: rgb(255, 255, 0);\">再试试别的</span></em></span></strong><span style=\"text-decoration: underline;\"><em><span style=\"text-decoration: underline; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px; color: rgb(23, 54, 93); background-color: rgb(255, 255, 0);\"></span></em></span></p>', '测试编辑器比萨', '2016-08-17 23:08:03', '9', '8fe439e0-9c4a-40dd-9838-53a94e2a5710.jpg', '56');
INSERT INTO `goods` VALUES ('24', '<p><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">微软雅黑</span><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; text-decoration: line-through;\"><sub>下标</sub></span></p>', '测试编辑器比萨二号', '2016-08-26 16:01:50', '9', '31c91ae0-f296-4741-9f95-fc9f6211c2ba.jpg', '50');

-- ----------------------------
-- Table structure for `goods_type`
-- ----------------------------
DROP TABLE IF EXISTS `goods_type`;
CREATE TABLE `goods_type` (
  `gt_id` int(10) NOT NULL AUTO_INCREMENT,
  `gt_introduction` varchar(255) DEFAULT NULL,
  `gt_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`gt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_type
-- ----------------------------
INSERT INTO `goods_type` VALUES ('1', '/碗', '米线');
INSERT INTO `goods_type` VALUES ('3', '/碗', '汤');
INSERT INTO `goods_type` VALUES ('7', '/杯', '饮料');
INSERT INTO `goods_type` VALUES ('8', '/盘', '小吃');
INSERT INTO `goods_type` VALUES ('9', '/9寸', '比萨');
INSERT INTO `goods_type` VALUES ('10', '/碗', '饭食');
INSERT INTO `goods_type` VALUES ('11', '/盘', '沙拉和鲜蔬');
INSERT INTO `goods_type` VALUES ('13', '/个', '甜点');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `o_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `o_time` timestamp NULL DEFAULT NULL,
  `o_sign` int(11) DEFAULT NULL,
  `o_integrate` int(11) DEFAULT NULL,
  `piece` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`o_id`),
  KEY `FK8D444F0538DED96D` (`goods_id`),
  KEY `FK8D444F057922F007` (`user_id`),
  CONSTRAINT `FK8D444F0538DED96D` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`g_id`),
  CONSTRAINT `FK8D444F057922F007` FOREIGN KEY (`user_id`) REFERENCES `work_user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('62', '4', '6', '2016-08-25 15:53:21', '5', '5', '1', 'ss');
INSERT INTO `orders` VALUES ('63', '8', '6', '2016-08-25 15:53:21', '5', '0', '2', 'ss');
INSERT INTO `orders` VALUES ('64', '18', '6', '2016-08-26 10:12:56', '6', '6', '10', '备注');
INSERT INTO `orders` VALUES ('65', '20', '6', '2016-08-26 10:12:56', '6', '0', '1', '备注');
INSERT INTO `orders` VALUES ('66', '23', '6', '2016-08-26 10:12:56', '6', '0', '1', '备注');
INSERT INTO `orders` VALUES ('67', '10', '6', '2016-08-26 10:12:56', '6', '0', '1', '备注');
INSERT INTO `orders` VALUES ('68', '8', '6', '2016-08-26 10:12:56', '6', '0', '1', '备注');
INSERT INTO `orders` VALUES ('69', '15', '6', '2016-08-26 10:12:56', '6', '0', '1', '备注');
INSERT INTO `orders` VALUES ('70', '19', '6', '2016-08-26 10:12:56', '6', '0', '1', '备注');
INSERT INTO `orders` VALUES ('78', '15', '57', '2016-08-27 12:39:23', '7', '7', '2', '23');
INSERT INTO `orders` VALUES ('79', '3', '57', '2016-08-27 12:39:23', '7', '0', '1', '23');
INSERT INTO `orders` VALUES ('80', '8', '57', '2016-08-27 12:39:23', '7', '0', '1', '23');
INSERT INTO `orders` VALUES ('81', '11', '57', '2016-08-27 12:40:12', '8', '8', '2', '123');
INSERT INTO `orders` VALUES ('82', '12', '57', '2016-08-27 12:40:12', '8', '0', '2', '123');
INSERT INTO `orders` VALUES ('83', '8', '6', '2016-08-27 12:40:49', '9', '9', '1', 'asd');
INSERT INTO `orders` VALUES ('84', '14', '6', '2016-08-27 12:40:49', '9', '0', '1', 'asd');
INSERT INTO `orders` VALUES ('89', '24', '85', '2016-08-28 15:25:04', '10', '10', '5', '456');
INSERT INTO `orders` VALUES ('90', '16', '85', '2016-08-28 15:25:04', '10', '0', '1', '456');
INSERT INTO `orders` VALUES ('91', '18', '85', '2016-08-28 15:25:04', '10', '0', '1', '456');

-- ----------------------------
-- Table structure for `shoppingcart`
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcart`;
CREATE TABLE `shoppingcart` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_time` datetime DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `piece` int(11) DEFAULT NULL,
  PRIMARY KEY (`s_id`),
  KEY `FKABBC40C838DED96D` (`goods_id`),
  KEY `FKABBC40C87922F007` (`user_id`),
  CONSTRAINT `FKABBC40C838DED96D` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`g_id`),
  CONSTRAINT `FKABBC40C87922F007` FOREIGN KEY (`user_id`) REFERENCES `work_user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shoppingcart
-- ----------------------------
INSERT INTO `shoppingcart` VALUES ('58', '2016-08-27 16:05:10', '8', '6', '1');

-- ----------------------------
-- Table structure for `work_admin`
-- ----------------------------
DROP TABLE IF EXISTS `work_admin`;
CREATE TABLE `work_admin` (
  `a_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_admin
-- ----------------------------
INSERT INTO `work_admin` VALUES ('5', '11111', 'e10adc3949ba59abbe56e057f20f883e', '1111', '1111@qoo.ww', '13423964446');
INSERT INTO `work_admin` VALUES ('9', '123hhqqqwe', 'e10adc3949ba59abbe56e057f20f883e', '123', '', '13423964446');
INSERT INTO `work_admin` VALUES ('10', '1', null, null, null, null);
INSERT INTO `work_admin` VALUES ('11', '1', null, null, null, null);
INSERT INTO `work_admin` VALUES ('12', '22', null, null, null, null);
INSERT INTO `work_admin` VALUES ('13', '123', 'e10adc3949ba59abbe56e057f20f883e', 'hhbbz', '1111@qoo.ww', '213');
INSERT INTO `work_admin` VALUES ('14', '113', 'e10adc3949ba59abbe56e057f20f883e', '测试', '1111@qoo.ww', '1');
INSERT INTO `work_admin` VALUES ('15', 'llssz', 'e10adc3949ba59abbe56e057f20f883e', 'llssz', '1111@qoo.ww', '13423964446');
INSERT INTO `work_admin` VALUES ('16', '213', 'e10adc3949ba59abbe56e057f20f883e', '21341', '1111@qoo.ww', '13423964446');
INSERT INTO `work_admin` VALUES ('17', '123213', 'e10adc3949ba59abbe56e057f20f883e', '3213214', '1111@qoo.ww', '13423964446');

-- ----------------------------
-- Table structure for `work_user`
-- ----------------------------
DROP TABLE IF EXISTS `work_user`;
CREATE TABLE `work_user` (
  `u_id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `introduction` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_user
-- ----------------------------
INSERT INTO `work_user` VALUES ('1', '6546214', '林智2 ', null, '男', '13423964446', '739769483@qq.com', '213', 'qq', '2016-07-03 20:13:12');
INSERT INTO `work_user` VALUES ('3', '1213', '123123', null, '男', '13423964446', '1111@qoo.ww', '1241', 'ada', '2016-07-19 12:01:51');
INSERT INTO `work_user` VALUES ('5', 'hhbbz', '林智 ', 'e10adc3949ba59abbe56e057f20f883e', '未选择', '13621410597', '', '', '', null);
INSERT INTO `work_user` VALUES ('6', 'llssz', '林智   ', 'e10adc3949ba59abbe56e057f20f883e', '男', '13621410597', '1111@qoo.ww', '东软', '213', null);
INSERT INTO `work_user` VALUES ('11', 'llss', '林智', 'e10adc3949ba59abbe56e057f20f883e', null, '13621410597', null, null, null, null);
INSERT INTO `work_user` VALUES ('13', '222', '22 ', 'e10adc3949ba59abbe56e057f20f883e', null, '12312313', '', '', '', '2016-08-01 18:04:25');
INSERT INTO `work_user` VALUES ('16', 'zzzhu', '注册', 'e10adc3949ba59abbe56e057f20f883e', null, '13621410597', null, '123', null, '2016-08-07 15:37:19');
INSERT INTO `work_user` VALUES ('17', 'zzzzz', '林智', 'e10adc3949ba59abbe56e057f20f883e', null, '13621410597', null, '11', null, '2016-08-07 19:27:14');
INSERT INTO `work_user` VALUES ('18', 'qweqwe', 'qwe', 'e10adc3949ba59abbe56e057f20f883e', null, '11', null, 'qwe', null, '2016-08-07 19:27:32');
INSERT INTO `work_user` VALUES ('39', 'aa134', '林智', 'e10adc3949ba59abbe56e057f20f883e', null, '13621410597', null, '东软', null, '2016-08-22 22:57:28');
INSERT INTO `work_user` VALUES ('40', 'cesHi', '林智', 'e10adc3949ba59abbe56e057f20f883e', null, '13621410597', null, '东软', null, '2016-08-24 15:23:49');
INSERT INTO `work_user` VALUES ('41', '12323123', '林智', 'e10adc3949ba59abbe56e057f20f883e', null, '13621410597', null, '东软', null, '2016-08-24 15:25:37');
INSERT INTO `work_user` VALUES ('42', '2134214', '12 ', 'e10adc3949ba59abbe56e057f20f883e', '女', '13621410597', '', '12', '', '2016-08-24 15:31:14');
INSERT INTO `work_user` VALUES ('43', 'qweqw', '123', 'e10adc3949ba59abbe56e057f20f883e', null, '13621410597', null, '1', null, '2016-08-24 15:32:19');
INSERT INTO `work_user` VALUES ('46', '456141', '123', 'e10adc3949ba59abbe56e057f20f883e', null, '13621410597', null, '123', null, '2016-08-24 20:32:07');
INSERT INTO `work_user` VALUES ('48', '15220210235', '123', 'e10adc3949ba59abbe56e057f20f883e', null, '13621410597', null, '123', null, '2016-08-24 20:38:55');
INSERT INTO `work_user` VALUES ('50', '12123', '123', 'e10adc3949ba59abbe56e057f20f883e', null, '13621410597', null, '1123', null, '2016-08-24 20:41:09');
INSERT INTO `work_user` VALUES ('53', '4987468465', '林智', 'e10adc3949ba59abbe56e057f20f883e', null, '13621410597', null, '东软', null, '2016-08-25 22:36:26');
INSERT INTO `work_user` VALUES ('54', '1545641325', '123', 'e10adc3949ba59abbe56e057f20f883e', null, '13621410597', null, '1564', null, '2016-08-25 22:38:34');
INSERT INTO `work_user` VALUES ('55', '23213421', '156', 'e10adc3949ba59abbe56e057f20f883e', null, '13621410597', null, '213', null, '2016-08-25 22:46:46');
INSERT INTO `work_user` VALUES ('56', '1234548', ' 12354', 'e10adc3949ba59abbe56e057f20f883e', null, '13621410597', '1111@qoo.ww', '11345', '1564123', '2016-08-26 15:56:07');
INSERT INTO `work_user` VALUES ('57', 'llsszzz', '小智', 'e10adc3949ba59abbe56e057f20f883e', null, '13621410597', null, '东软', null, '2016-08-27 12:01:20');
INSERT INTO `work_user` VALUES ('85', 'xiaoxiaozhi', '小小智', 'e10adc3949ba59abbe56e057f20f883e', null, '13621410597', null, '东软', null, '2016-08-28 15:23:36');
