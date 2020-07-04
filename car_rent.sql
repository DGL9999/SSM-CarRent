/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : car_rent

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 04/07/2020 11:46:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bus_car
-- ----------------------------
DROP TABLE IF EXISTS `bus_car`;
CREATE TABLE `bus_car`  (
  `carnumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cartype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` double(10, 2) NULL DEFAULT NULL,
  `rentprice` double(10, 2) NULL DEFAULT NULL,
  `deposit` double NULL DEFAULT NULL,
  `isrenting` int(11) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `carimg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`carnumber`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bus_car
-- ----------------------------
INSERT INTO `bus_car` VALUES ('沪A00000', '布加迪威龙', '蓝色', 10000000.00, 50000.00, 500000, 1, '牛逼就完事了', '2020-06-24/202006241641306064137.PNG', '2020-06-24 14:33:26');
INSERT INTO `bus_car` VALUES ('鄂A66666', 'SUV', '白色', 280000.00, 500.00, 5000, 0, '宝马X1', 'images/001.png', '2020-06-23 22:31:02');
INSERT INTO `bus_car` VALUES ('鄂A77777', 'SUV', '白色', 350000.00, 1500.00, 12000, 0, '宝马X3', 'images/002.png', '2020-06-23 22:31:04');
INSERT INTO `bus_car` VALUES ('鄂A88888', '轿车', '黑色', 880000.00, 1000.00, 10000, 0, '保时捷 卡宴', 'images/003.png', '2020-06-23 22:31:06');
INSERT INTO `bus_car` VALUES ('鄂A99999', '渣土车', '黄色', 500000.00, 3000.00, 20000, 0, '动力强劲', 'images/defaultCarImage.jpg', '2020-06-23 22:31:52');

-- ----------------------------
-- Table structure for bus_check
-- ----------------------------
DROP TABLE IF EXISTS `bus_check`;
CREATE TABLE `bus_check`  (
  `checkid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `checkdate` datetime(0) NULL DEFAULT NULL,
  `checkdesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `problem` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `paymoney` double(255, 0) NULL DEFAULT NULL,
  `opername` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rentid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`checkid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bus_check
-- ----------------------------
INSERT INTO `bus_check` VALUES ('JC_20200627_141728_601_63148', '2020-06-27 14:17:28', '在中山路第二个红绿灯闯红灯，扣6分，罚款200', '闯红灯', 800, '丁国梁', 'CZ_20200626_194143_500_44463', '2020-06-27 14:18:45');
INSERT INTO `bus_check` VALUES ('JC_20200627_142518_682_29290', '2020-06-27 15:56:53', '没问题', '没问题', 0, '丁国梁', 'CZ_20200626_194157_166_22318', '2020-06-27 14:25:30');
INSERT INTO `bus_check` VALUES ('JC_20200627_142624_705_92407', '2020-06-27 15:56:22', '在市区超速百分之50，扣12分，罚款1000元', '超速', 5000, '丁国梁', 'CZ_20200626_194205_798_87302', '2020-06-27 14:26:43');

-- ----------------------------
-- Table structure for bus_customer
-- ----------------------------
DROP TABLE IF EXISTS `bus_customer`;
CREATE TABLE `bus_customer`  (
  `identity` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证',
  `custname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `sex` int(255) NULL DEFAULT NULL COMMENT '性别',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `career` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位',
  `createtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`identity`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bus_customer
-- ----------------------------
INSERT INTO `bus_customer` VALUES ('421087133414144412', '张小明', 1, '崇川区', '13456788987', '程序员', '2020-06-23 21:01:30');
INSERT INTO `bus_customer` VALUES ('43131334113331131', '习大大', 1, '港闸区', '13888888888', '国家最高领导人', '2020-06-23 21:01:22');
INSERT INTO `bus_customer` VALUES ('431321199291331131', '张三', 0, '开发区', '13431334113', '程序员', '2020-06-23 21:02:06');
INSERT INTO `bus_customer` VALUES ('431321199291331132', '孙中山', 1, '如东', '134131314131', '总统', '2020-06-23 21:01:35');
INSERT INTO `bus_customer` VALUES ('431341134191311311', '李四', 0, '通州', '13451313113', 'CEO', '2020-06-23 21:01:38');
INSERT INTO `bus_customer` VALUES ('431341134191311314', '王小明', 1, '海安', '13413131113', 'CEO', '2020-06-23 21:01:41');

-- ----------------------------
-- Table structure for bus_rent
-- ----------------------------
DROP TABLE IF EXISTS `bus_rent`;
CREATE TABLE `bus_rent`  (
  `rentid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` double(10, 2) NULL DEFAULT NULL,
  `begindate` datetime(0) NULL DEFAULT NULL,
  `returndate` datetime(0) NULL DEFAULT NULL,
  `rentflag` int(11) NULL DEFAULT NULL,
  `identity` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `carnumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `opername` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`rentid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bus_rent
-- ----------------------------
INSERT INTO `bus_rent` VALUES ('CZ_20200626_155807_770_53530', 5.00, '2020-06-25 23:58:07', '2020-06-26 00:00:00', 1, '431321199291331131', '沪A00000', '丁国梁', '2020-06-26 15:58:36');
INSERT INTO `bus_rent` VALUES ('CZ_20200626_194143_500_44463', 1000.00, '2020-06-26 19:41:43', '2020-06-28 00:00:00', 1, '431321199291331132', '鄂A88888', '丁国梁', '2020-06-26 19:41:49');
INSERT INTO `bus_rent` VALUES ('CZ_20200626_194157_166_22318', 500.00, '2020-06-27 19:41:57', '2020-06-29 00:00:00', 1, '431321199291331132', '鄂A66666', '丁国梁', '2020-06-26 19:42:02');
INSERT INTO `bus_rent` VALUES ('CZ_20200626_194205_798_87302', 1500.00, '2020-06-26 19:42:05', '2020-06-29 00:00:00', 1, '431321199291331132', '鄂A77777', '丁国梁', '2020-06-26 19:42:13');
INSERT INTO `bus_rent` VALUES ('CZ_20200703_213257_210_30946', 50000.00, '2020-07-03 21:32:57', '2020-07-15 00:00:00', 0, '431341134191311311', '沪A00000', '丁国梁', '2020-07-03 21:33:04');

-- ----------------------------
-- Table structure for sys_log_login
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_login`;
CREATE TABLE `sys_log_login`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `loginip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `logintime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1055 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log_login
-- ----------------------------
INSERT INTO `sys_log_login` VALUES (2, '李四-ls', '0:0:0:0:0:0:0:1', '2020-06-22 19:16:58');
INSERT INTO `sys_log_login` VALUES (3, '王五-ww', '0:0:0:0:0:0:0:1', '2020-06-22 19:17:03');
INSERT INTO `sys_log_login` VALUES (4, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 19:17:08');
INSERT INTO `sys_log_login` VALUES (5, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 19:17:31');
INSERT INTO `sys_log_login` VALUES (8, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 19:17:45');
INSERT INTO `sys_log_login` VALUES (9, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 19:50:22');
INSERT INTO `sys_log_login` VALUES (10, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 21:53:33');
INSERT INTO `sys_log_login` VALUES (11, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 21:54:27');
INSERT INTO `sys_log_login` VALUES (12, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 21:54:47');
INSERT INTO `sys_log_login` VALUES (13, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 21:55:50');
INSERT INTO `sys_log_login` VALUES (14, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 21:58:16');
INSERT INTO `sys_log_login` VALUES (15, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 21:58:23');
INSERT INTO `sys_log_login` VALUES (16, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 21:59:11');
INSERT INTO `sys_log_login` VALUES (17, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 22:00:44');
INSERT INTO `sys_log_login` VALUES (18, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 22:03:51');
INSERT INTO `sys_log_login` VALUES (19, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 22:04:26');
INSERT INTO `sys_log_login` VALUES (20, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 22:08:13');
INSERT INTO `sys_log_login` VALUES (21, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 22:08:35');
INSERT INTO `sys_log_login` VALUES (22, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 22:10:06');
INSERT INTO `sys_log_login` VALUES (23, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 22:10:41');
INSERT INTO `sys_log_login` VALUES (24, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 22:11:06');
INSERT INTO `sys_log_login` VALUES (25, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 22:11:29');
INSERT INTO `sys_log_login` VALUES (26, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 22:12:14');
INSERT INTO `sys_log_login` VALUES (27, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 22:13:32');
INSERT INTO `sys_log_login` VALUES (28, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 22:34:42');
INSERT INTO `sys_log_login` VALUES (29, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 22:35:33');
INSERT INTO `sys_log_login` VALUES (30, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 22:35:52');
INSERT INTO `sys_log_login` VALUES (31, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 22:37:00');
INSERT INTO `sys_log_login` VALUES (32, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 22:37:14');
INSERT INTO `sys_log_login` VALUES (33, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 22:37:29');
INSERT INTO `sys_log_login` VALUES (34, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 22:37:53');
INSERT INTO `sys_log_login` VALUES (35, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 22:40:30');
INSERT INTO `sys_log_login` VALUES (36, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 22:45:25');
INSERT INTO `sys_log_login` VALUES (37, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 22:47:10');
INSERT INTO `sys_log_login` VALUES (38, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 22:50:00');
INSERT INTO `sys_log_login` VALUES (39, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 22:52:52');
INSERT INTO `sys_log_login` VALUES (40, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 23:03:20');
INSERT INTO `sys_log_login` VALUES (41, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 23:11:36');
INSERT INTO `sys_log_login` VALUES (42, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 23:23:01');
INSERT INTO `sys_log_login` VALUES (43, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 23:24:34');
INSERT INTO `sys_log_login` VALUES (44, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 23:24:49');
INSERT INTO `sys_log_login` VALUES (45, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 23:31:08');
INSERT INTO `sys_log_login` VALUES (46, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 23:31:22');
INSERT INTO `sys_log_login` VALUES (47, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 23:32:26');
INSERT INTO `sys_log_login` VALUES (48, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 23:33:20');
INSERT INTO `sys_log_login` VALUES (49, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 23:41:58');
INSERT INTO `sys_log_login` VALUES (50, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 23:43:10');
INSERT INTO `sys_log_login` VALUES (51, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 23:45:12');
INSERT INTO `sys_log_login` VALUES (52, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 23:45:57');
INSERT INTO `sys_log_login` VALUES (53, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 23:46:10');
INSERT INTO `sys_log_login` VALUES (54, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 23:46:56');
INSERT INTO `sys_log_login` VALUES (55, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 23:47:55');
INSERT INTO `sys_log_login` VALUES (56, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 23:49:20');
INSERT INTO `sys_log_login` VALUES (57, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-22 23:50:09');
INSERT INTO `sys_log_login` VALUES (58, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 10:12:45');
INSERT INTO `sys_log_login` VALUES (59, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 10:14:11');
INSERT INTO `sys_log_login` VALUES (60, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 10:14:36');
INSERT INTO `sys_log_login` VALUES (61, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 10:17:13');
INSERT INTO `sys_log_login` VALUES (62, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 10:22:57');
INSERT INTO `sys_log_login` VALUES (63, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 10:25:48');
INSERT INTO `sys_log_login` VALUES (64, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 10:28:01');
INSERT INTO `sys_log_login` VALUES (65, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 10:28:36');
INSERT INTO `sys_log_login` VALUES (66, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 10:30:16');
INSERT INTO `sys_log_login` VALUES (67, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 10:31:38');
INSERT INTO `sys_log_login` VALUES (68, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 10:33:09');
INSERT INTO `sys_log_login` VALUES (69, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 10:38:49');
INSERT INTO `sys_log_login` VALUES (70, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 10:43:21');
INSERT INTO `sys_log_login` VALUES (71, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 11:00:05');
INSERT INTO `sys_log_login` VALUES (72, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 11:05:10');
INSERT INTO `sys_log_login` VALUES (73, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 11:12:40');
INSERT INTO `sys_log_login` VALUES (74, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 11:13:56');
INSERT INTO `sys_log_login` VALUES (75, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 11:19:24');
INSERT INTO `sys_log_login` VALUES (76, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 11:20:57');
INSERT INTO `sys_log_login` VALUES (77, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 11:23:39');
INSERT INTO `sys_log_login` VALUES (78, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 11:27:46');
INSERT INTO `sys_log_login` VALUES (79, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 11:37:18');
INSERT INTO `sys_log_login` VALUES (80, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 11:38:07');
INSERT INTO `sys_log_login` VALUES (81, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 11:40:54');
INSERT INTO `sys_log_login` VALUES (82, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 11:41:17');
INSERT INTO `sys_log_login` VALUES (83, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 11:44:56');
INSERT INTO `sys_log_login` VALUES (84, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 11:45:22');
INSERT INTO `sys_log_login` VALUES (85, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 11:49:05');
INSERT INTO `sys_log_login` VALUES (86, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 11:50:59');
INSERT INTO `sys_log_login` VALUES (87, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 11:58:58');
INSERT INTO `sys_log_login` VALUES (88, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 11:59:41');
INSERT INTO `sys_log_login` VALUES (89, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:03:03');
INSERT INTO `sys_log_login` VALUES (90, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:04:06');
INSERT INTO `sys_log_login` VALUES (91, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:04:42');
INSERT INTO `sys_log_login` VALUES (92, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:05:13');
INSERT INTO `sys_log_login` VALUES (93, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:06:35');
INSERT INTO `sys_log_login` VALUES (94, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:07:21');
INSERT INTO `sys_log_login` VALUES (95, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:09:02');
INSERT INTO `sys_log_login` VALUES (96, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:09:26');
INSERT INTO `sys_log_login` VALUES (97, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:09:45');
INSERT INTO `sys_log_login` VALUES (98, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:10:00');
INSERT INTO `sys_log_login` VALUES (99, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:11:10');
INSERT INTO `sys_log_login` VALUES (100, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:11:42');
INSERT INTO `sys_log_login` VALUES (101, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:12:02');
INSERT INTO `sys_log_login` VALUES (102, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:15:48');
INSERT INTO `sys_log_login` VALUES (103, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:17:00');
INSERT INTO `sys_log_login` VALUES (104, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:17:57');
INSERT INTO `sys_log_login` VALUES (105, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:18:27');
INSERT INTO `sys_log_login` VALUES (106, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:18:42');
INSERT INTO `sys_log_login` VALUES (107, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:18:56');
INSERT INTO `sys_log_login` VALUES (108, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:19:14');
INSERT INTO `sys_log_login` VALUES (109, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:19:31');
INSERT INTO `sys_log_login` VALUES (110, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:19:38');
INSERT INTO `sys_log_login` VALUES (111, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:21:25');
INSERT INTO `sys_log_login` VALUES (112, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:22:20');
INSERT INTO `sys_log_login` VALUES (113, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:24:04');
INSERT INTO `sys_log_login` VALUES (114, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:24:51');
INSERT INTO `sys_log_login` VALUES (115, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:25:46');
INSERT INTO `sys_log_login` VALUES (116, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:26:13');
INSERT INTO `sys_log_login` VALUES (117, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:26:33');
INSERT INTO `sys_log_login` VALUES (118, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:27:39');
INSERT INTO `sys_log_login` VALUES (119, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:27:52');
INSERT INTO `sys_log_login` VALUES (120, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:27:59');
INSERT INTO `sys_log_login` VALUES (121, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:28:02');
INSERT INTO `sys_log_login` VALUES (122, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:28:54');
INSERT INTO `sys_log_login` VALUES (123, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:29:12');
INSERT INTO `sys_log_login` VALUES (124, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:30:03');
INSERT INTO `sys_log_login` VALUES (125, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:31:20');
INSERT INTO `sys_log_login` VALUES (126, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:32:00');
INSERT INTO `sys_log_login` VALUES (127, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:32:45');
INSERT INTO `sys_log_login` VALUES (128, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:33:04');
INSERT INTO `sys_log_login` VALUES (129, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:33:31');
INSERT INTO `sys_log_login` VALUES (130, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:33:50');
INSERT INTO `sys_log_login` VALUES (131, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:35:06');
INSERT INTO `sys_log_login` VALUES (132, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:35:37');
INSERT INTO `sys_log_login` VALUES (133, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:35:53');
INSERT INTO `sys_log_login` VALUES (134, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:38:40');
INSERT INTO `sys_log_login` VALUES (135, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:39:45');
INSERT INTO `sys_log_login` VALUES (136, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:41:00');
INSERT INTO `sys_log_login` VALUES (137, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:45:33');
INSERT INTO `sys_log_login` VALUES (138, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:47:48');
INSERT INTO `sys_log_login` VALUES (139, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:49:35');
INSERT INTO `sys_log_login` VALUES (140, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:49:56');
INSERT INTO `sys_log_login` VALUES (141, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:50:12');
INSERT INTO `sys_log_login` VALUES (142, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:50:27');
INSERT INTO `sys_log_login` VALUES (143, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:50:39');
INSERT INTO `sys_log_login` VALUES (144, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:51:08');
INSERT INTO `sys_log_login` VALUES (145, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:51:30');
INSERT INTO `sys_log_login` VALUES (146, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 12:52:04');
INSERT INTO `sys_log_login` VALUES (147, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 13:36:38');
INSERT INTO `sys_log_login` VALUES (148, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 13:37:23');
INSERT INTO `sys_log_login` VALUES (149, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 13:44:40');
INSERT INTO `sys_log_login` VALUES (150, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 13:46:33');
INSERT INTO `sys_log_login` VALUES (151, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 13:48:08');
INSERT INTO `sys_log_login` VALUES (152, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 14:00:38');
INSERT INTO `sys_log_login` VALUES (153, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 14:01:13');
INSERT INTO `sys_log_login` VALUES (154, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 14:02:23');
INSERT INTO `sys_log_login` VALUES (155, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 14:03:11');
INSERT INTO `sys_log_login` VALUES (156, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 14:05:46');
INSERT INTO `sys_log_login` VALUES (157, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 14:06:17');
INSERT INTO `sys_log_login` VALUES (158, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 14:10:34');
INSERT INTO `sys_log_login` VALUES (159, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 14:11:45');
INSERT INTO `sys_log_login` VALUES (160, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 14:14:08');
INSERT INTO `sys_log_login` VALUES (161, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 14:14:59');
INSERT INTO `sys_log_login` VALUES (162, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 14:16:54');
INSERT INTO `sys_log_login` VALUES (163, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 14:17:05');
INSERT INTO `sys_log_login` VALUES (164, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 14:26:18');
INSERT INTO `sys_log_login` VALUES (165, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 14:28:05');
INSERT INTO `sys_log_login` VALUES (166, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 14:37:14');
INSERT INTO `sys_log_login` VALUES (167, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 14:39:30');
INSERT INTO `sys_log_login` VALUES (168, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 14:42:11');
INSERT INTO `sys_log_login` VALUES (169, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 14:43:34');
INSERT INTO `sys_log_login` VALUES (170, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 14:44:22');
INSERT INTO `sys_log_login` VALUES (171, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 14:47:15');
INSERT INTO `sys_log_login` VALUES (172, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 14:50:34');
INSERT INTO `sys_log_login` VALUES (173, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 15:02:49');
INSERT INTO `sys_log_login` VALUES (174, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 15:06:14');
INSERT INTO `sys_log_login` VALUES (175, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 15:07:02');
INSERT INTO `sys_log_login` VALUES (176, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 15:07:19');
INSERT INTO `sys_log_login` VALUES (177, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 15:10:35');
INSERT INTO `sys_log_login` VALUES (178, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 15:11:33');
INSERT INTO `sys_log_login` VALUES (179, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 15:12:28');
INSERT INTO `sys_log_login` VALUES (180, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 15:13:27');
INSERT INTO `sys_log_login` VALUES (181, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 15:15:17');
INSERT INTO `sys_log_login` VALUES (182, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 15:17:00');
INSERT INTO `sys_log_login` VALUES (183, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 15:17:29');
INSERT INTO `sys_log_login` VALUES (184, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 15:17:50');
INSERT INTO `sys_log_login` VALUES (185, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 15:20:00');
INSERT INTO `sys_log_login` VALUES (186, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 15:20:30');
INSERT INTO `sys_log_login` VALUES (187, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 15:21:02');
INSERT INTO `sys_log_login` VALUES (188, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 15:22:08');
INSERT INTO `sys_log_login` VALUES (189, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 15:23:04');
INSERT INTO `sys_log_login` VALUES (190, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 15:23:48');
INSERT INTO `sys_log_login` VALUES (191, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 15:24:12');
INSERT INTO `sys_log_login` VALUES (192, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 15:24:17');
INSERT INTO `sys_log_login` VALUES (193, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 15:25:12');
INSERT INTO `sys_log_login` VALUES (194, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 15:26:34');
INSERT INTO `sys_log_login` VALUES (195, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 15:27:36');
INSERT INTO `sys_log_login` VALUES (196, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 15:29:04');
INSERT INTO `sys_log_login` VALUES (197, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 15:33:54');
INSERT INTO `sys_log_login` VALUES (198, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 15:36:37');
INSERT INTO `sys_log_login` VALUES (199, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 15:36:55');
INSERT INTO `sys_log_login` VALUES (200, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 15:37:59');
INSERT INTO `sys_log_login` VALUES (201, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 15:39:19');
INSERT INTO `sys_log_login` VALUES (202, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 15:39:35');
INSERT INTO `sys_log_login` VALUES (203, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 15:40:16');
INSERT INTO `sys_log_login` VALUES (204, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 15:41:36');
INSERT INTO `sys_log_login` VALUES (205, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 15:42:39');
INSERT INTO `sys_log_login` VALUES (206, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 15:52:24');
INSERT INTO `sys_log_login` VALUES (207, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 16:07:20');
INSERT INTO `sys_log_login` VALUES (208, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 17:15:25');
INSERT INTO `sys_log_login` VALUES (209, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 17:39:37');
INSERT INTO `sys_log_login` VALUES (210, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 17:46:02');
INSERT INTO `sys_log_login` VALUES (211, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 17:47:04');
INSERT INTO `sys_log_login` VALUES (212, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 17:54:02');
INSERT INTO `sys_log_login` VALUES (213, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 17:54:48');
INSERT INTO `sys_log_login` VALUES (214, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 19:32:36');
INSERT INTO `sys_log_login` VALUES (215, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 20:13:57');
INSERT INTO `sys_log_login` VALUES (216, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 20:14:57');
INSERT INTO `sys_log_login` VALUES (217, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 20:16:28');
INSERT INTO `sys_log_login` VALUES (218, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 20:17:31');
INSERT INTO `sys_log_login` VALUES (219, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 20:20:10');
INSERT INTO `sys_log_login` VALUES (220, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 20:23:50');
INSERT INTO `sys_log_login` VALUES (221, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 20:31:51');
INSERT INTO `sys_log_login` VALUES (222, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 21:01:06');
INSERT INTO `sys_log_login` VALUES (223, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 22:23:05');
INSERT INTO `sys_log_login` VALUES (224, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 22:24:15');
INSERT INTO `sys_log_login` VALUES (225, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-23 22:30:43');
INSERT INTO `sys_log_login` VALUES (226, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 09:54:18');
INSERT INTO `sys_log_login` VALUES (227, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 10:28:19');
INSERT INTO `sys_log_login` VALUES (228, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 10:28:47');
INSERT INTO `sys_log_login` VALUES (229, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 10:29:07');
INSERT INTO `sys_log_login` VALUES (230, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 10:31:51');
INSERT INTO `sys_log_login` VALUES (231, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 10:32:31');
INSERT INTO `sys_log_login` VALUES (232, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 10:34:04');
INSERT INTO `sys_log_login` VALUES (233, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 10:34:31');
INSERT INTO `sys_log_login` VALUES (234, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 10:35:08');
INSERT INTO `sys_log_login` VALUES (235, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 10:37:38');
INSERT INTO `sys_log_login` VALUES (236, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 10:39:33');
INSERT INTO `sys_log_login` VALUES (237, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 10:40:37');
INSERT INTO `sys_log_login` VALUES (238, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 10:51:41');
INSERT INTO `sys_log_login` VALUES (239, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 12:34:25');
INSERT INTO `sys_log_login` VALUES (240, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 12:38:59');
INSERT INTO `sys_log_login` VALUES (241, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 12:48:52');
INSERT INTO `sys_log_login` VALUES (242, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 12:50:01');
INSERT INTO `sys_log_login` VALUES (243, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 13:02:17');
INSERT INTO `sys_log_login` VALUES (244, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 13:09:13');
INSERT INTO `sys_log_login` VALUES (245, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 13:32:45');
INSERT INTO `sys_log_login` VALUES (246, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 13:33:08');
INSERT INTO `sys_log_login` VALUES (247, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 13:34:56');
INSERT INTO `sys_log_login` VALUES (248, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 13:35:25');
INSERT INTO `sys_log_login` VALUES (249, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 13:35:49');
INSERT INTO `sys_log_login` VALUES (250, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 13:36:07');
INSERT INTO `sys_log_login` VALUES (251, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 13:36:32');
INSERT INTO `sys_log_login` VALUES (252, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 13:36:41');
INSERT INTO `sys_log_login` VALUES (253, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 13:38:38');
INSERT INTO `sys_log_login` VALUES (254, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 13:41:15');
INSERT INTO `sys_log_login` VALUES (255, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 13:42:03');
INSERT INTO `sys_log_login` VALUES (256, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 13:48:18');
INSERT INTO `sys_log_login` VALUES (257, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 13:54:00');
INSERT INTO `sys_log_login` VALUES (258, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 13:54:49');
INSERT INTO `sys_log_login` VALUES (259, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 13:56:23');
INSERT INTO `sys_log_login` VALUES (260, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 13:56:57');
INSERT INTO `sys_log_login` VALUES (261, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 14:03:18');
INSERT INTO `sys_log_login` VALUES (262, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 14:04:04');
INSERT INTO `sys_log_login` VALUES (263, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 14:11:23');
INSERT INTO `sys_log_login` VALUES (264, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 14:13:05');
INSERT INTO `sys_log_login` VALUES (265, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 14:15:20');
INSERT INTO `sys_log_login` VALUES (266, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 14:18:50');
INSERT INTO `sys_log_login` VALUES (267, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 14:29:57');
INSERT INTO `sys_log_login` VALUES (268, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 14:32:31');
INSERT INTO `sys_log_login` VALUES (269, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 14:32:50');
INSERT INTO `sys_log_login` VALUES (270, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 14:41:17');
INSERT INTO `sys_log_login` VALUES (271, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 14:56:04');
INSERT INTO `sys_log_login` VALUES (272, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 15:03:45');
INSERT INTO `sys_log_login` VALUES (273, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 15:04:25');
INSERT INTO `sys_log_login` VALUES (274, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 15:19:04');
INSERT INTO `sys_log_login` VALUES (275, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 15:20:22');
INSERT INTO `sys_log_login` VALUES (276, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 16:39:13');
INSERT INTO `sys_log_login` VALUES (277, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 16:39:49');
INSERT INTO `sys_log_login` VALUES (278, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 16:44:32');
INSERT INTO `sys_log_login` VALUES (279, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 16:45:16');
INSERT INTO `sys_log_login` VALUES (280, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 16:46:29');
INSERT INTO `sys_log_login` VALUES (281, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 16:50:40');
INSERT INTO `sys_log_login` VALUES (282, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 16:54:56');
INSERT INTO `sys_log_login` VALUES (283, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 16:57:58');
INSERT INTO `sys_log_login` VALUES (284, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 17:01:02');
INSERT INTO `sys_log_login` VALUES (285, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 17:03:08');
INSERT INTO `sys_log_login` VALUES (286, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 17:05:31');
INSERT INTO `sys_log_login` VALUES (287, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 17:08:10');
INSERT INTO `sys_log_login` VALUES (288, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 17:09:28');
INSERT INTO `sys_log_login` VALUES (289, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 17:11:42');
INSERT INTO `sys_log_login` VALUES (290, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 17:26:02');
INSERT INTO `sys_log_login` VALUES (291, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 18:49:20');
INSERT INTO `sys_log_login` VALUES (292, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 18:50:40');
INSERT INTO `sys_log_login` VALUES (293, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 18:51:08');
INSERT INTO `sys_log_login` VALUES (294, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 18:51:59');
INSERT INTO `sys_log_login` VALUES (295, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 18:53:07');
INSERT INTO `sys_log_login` VALUES (296, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 18:53:28');
INSERT INTO `sys_log_login` VALUES (297, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 19:01:19');
INSERT INTO `sys_log_login` VALUES (298, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 19:02:14');
INSERT INTO `sys_log_login` VALUES (299, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 19:08:37');
INSERT INTO `sys_log_login` VALUES (300, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 19:11:14');
INSERT INTO `sys_log_login` VALUES (301, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 19:13:36');
INSERT INTO `sys_log_login` VALUES (302, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 19:14:00');
INSERT INTO `sys_log_login` VALUES (303, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 19:14:11');
INSERT INTO `sys_log_login` VALUES (304, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 19:15:01');
INSERT INTO `sys_log_login` VALUES (305, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 19:15:44');
INSERT INTO `sys_log_login` VALUES (306, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 19:17:29');
INSERT INTO `sys_log_login` VALUES (307, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 19:18:33');
INSERT INTO `sys_log_login` VALUES (308, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 19:22:23');
INSERT INTO `sys_log_login` VALUES (309, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 19:29:56');
INSERT INTO `sys_log_login` VALUES (310, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 19:31:11');
INSERT INTO `sys_log_login` VALUES (311, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 19:31:23');
INSERT INTO `sys_log_login` VALUES (312, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 19:32:47');
INSERT INTO `sys_log_login` VALUES (313, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 19:35:19');
INSERT INTO `sys_log_login` VALUES (314, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 19:39:40');
INSERT INTO `sys_log_login` VALUES (315, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 19:40:26');
INSERT INTO `sys_log_login` VALUES (316, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 19:43:01');
INSERT INTO `sys_log_login` VALUES (317, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 19:43:47');
INSERT INTO `sys_log_login` VALUES (318, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 19:44:01');
INSERT INTO `sys_log_login` VALUES (319, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 19:44:12');
INSERT INTO `sys_log_login` VALUES (320, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 19:44:20');
INSERT INTO `sys_log_login` VALUES (321, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 19:44:28');
INSERT INTO `sys_log_login` VALUES (322, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 19:45:36');
INSERT INTO `sys_log_login` VALUES (323, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 19:46:19');
INSERT INTO `sys_log_login` VALUES (324, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 19:48:51');
INSERT INTO `sys_log_login` VALUES (325, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 19:49:26');
INSERT INTO `sys_log_login` VALUES (326, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 19:50:08');
INSERT INTO `sys_log_login` VALUES (327, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 19:50:42');
INSERT INTO `sys_log_login` VALUES (328, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 19:52:35');
INSERT INTO `sys_log_login` VALUES (329, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 19:53:56');
INSERT INTO `sys_log_login` VALUES (330, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 19:54:03');
INSERT INTO `sys_log_login` VALUES (331, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 19:55:02');
INSERT INTO `sys_log_login` VALUES (332, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 19:56:03');
INSERT INTO `sys_log_login` VALUES (333, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 19:56:14');
INSERT INTO `sys_log_login` VALUES (334, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 19:57:39');
INSERT INTO `sys_log_login` VALUES (335, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 19:58:54');
INSERT INTO `sys_log_login` VALUES (336, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 19:59:38');
INSERT INTO `sys_log_login` VALUES (337, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 20:01:10');
INSERT INTO `sys_log_login` VALUES (338, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 20:02:11');
INSERT INTO `sys_log_login` VALUES (339, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 20:03:34');
INSERT INTO `sys_log_login` VALUES (340, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 20:05:32');
INSERT INTO `sys_log_login` VALUES (341, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 20:06:45');
INSERT INTO `sys_log_login` VALUES (342, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 20:08:42');
INSERT INTO `sys_log_login` VALUES (343, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 20:09:12');
INSERT INTO `sys_log_login` VALUES (344, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 20:09:31');
INSERT INTO `sys_log_login` VALUES (345, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 20:13:56');
INSERT INTO `sys_log_login` VALUES (346, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 20:15:32');
INSERT INTO `sys_log_login` VALUES (347, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 20:19:09');
INSERT INTO `sys_log_login` VALUES (348, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 20:19:49');
INSERT INTO `sys_log_login` VALUES (349, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 20:20:06');
INSERT INTO `sys_log_login` VALUES (350, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 20:20:35');
INSERT INTO `sys_log_login` VALUES (351, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 20:24:42');
INSERT INTO `sys_log_login` VALUES (352, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 20:28:43');
INSERT INTO `sys_log_login` VALUES (353, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 20:29:18');
INSERT INTO `sys_log_login` VALUES (354, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 20:30:29');
INSERT INTO `sys_log_login` VALUES (355, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 20:32:13');
INSERT INTO `sys_log_login` VALUES (356, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 20:34:16');
INSERT INTO `sys_log_login` VALUES (357, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 20:35:49');
INSERT INTO `sys_log_login` VALUES (358, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 20:40:55');
INSERT INTO `sys_log_login` VALUES (359, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 20:43:02');
INSERT INTO `sys_log_login` VALUES (360, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 20:44:11');
INSERT INTO `sys_log_login` VALUES (361, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 20:45:01');
INSERT INTO `sys_log_login` VALUES (362, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 20:54:03');
INSERT INTO `sys_log_login` VALUES (363, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 20:54:40');
INSERT INTO `sys_log_login` VALUES (364, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 20:56:23');
INSERT INTO `sys_log_login` VALUES (365, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 20:58:21');
INSERT INTO `sys_log_login` VALUES (366, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 20:59:12');
INSERT INTO `sys_log_login` VALUES (367, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 21:02:23');
INSERT INTO `sys_log_login` VALUES (368, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 21:04:25');
INSERT INTO `sys_log_login` VALUES (369, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 21:04:46');
INSERT INTO `sys_log_login` VALUES (370, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 21:05:36');
INSERT INTO `sys_log_login` VALUES (371, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 21:13:57');
INSERT INTO `sys_log_login` VALUES (372, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 21:15:20');
INSERT INTO `sys_log_login` VALUES (373, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 21:20:26');
INSERT INTO `sys_log_login` VALUES (374, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 21:28:07');
INSERT INTO `sys_log_login` VALUES (375, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 21:28:52');
INSERT INTO `sys_log_login` VALUES (376, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 21:29:45');
INSERT INTO `sys_log_login` VALUES (377, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 21:30:11');
INSERT INTO `sys_log_login` VALUES (378, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 21:30:59');
INSERT INTO `sys_log_login` VALUES (379, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 21:33:34');
INSERT INTO `sys_log_login` VALUES (380, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 21:34:29');
INSERT INTO `sys_log_login` VALUES (381, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 21:39:16');
INSERT INTO `sys_log_login` VALUES (382, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 21:39:38');
INSERT INTO `sys_log_login` VALUES (383, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 21:43:46');
INSERT INTO `sys_log_login` VALUES (384, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 21:44:03');
INSERT INTO `sys_log_login` VALUES (385, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 21:44:41');
INSERT INTO `sys_log_login` VALUES (386, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 21:45:49');
INSERT INTO `sys_log_login` VALUES (387, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 21:47:49');
INSERT INTO `sys_log_login` VALUES (388, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 21:48:54');
INSERT INTO `sys_log_login` VALUES (389, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 21:49:14');
INSERT INTO `sys_log_login` VALUES (390, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 21:49:37');
INSERT INTO `sys_log_login` VALUES (391, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 21:50:43');
INSERT INTO `sys_log_login` VALUES (392, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 21:51:44');
INSERT INTO `sys_log_login` VALUES (393, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 21:52:24');
INSERT INTO `sys_log_login` VALUES (394, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 21:53:37');
INSERT INTO `sys_log_login` VALUES (395, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 21:53:52');
INSERT INTO `sys_log_login` VALUES (396, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 21:54:56');
INSERT INTO `sys_log_login` VALUES (397, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 21:56:32');
INSERT INTO `sys_log_login` VALUES (398, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 21:56:54');
INSERT INTO `sys_log_login` VALUES (399, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 22:10:22');
INSERT INTO `sys_log_login` VALUES (400, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 22:10:56');
INSERT INTO `sys_log_login` VALUES (401, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 22:11:34');
INSERT INTO `sys_log_login` VALUES (402, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 22:12:00');
INSERT INTO `sys_log_login` VALUES (403, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 22:12:38');
INSERT INTO `sys_log_login` VALUES (404, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 22:12:50');
INSERT INTO `sys_log_login` VALUES (405, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 22:15:48');
INSERT INTO `sys_log_login` VALUES (406, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 22:20:03');
INSERT INTO `sys_log_login` VALUES (407, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 22:20:16');
INSERT INTO `sys_log_login` VALUES (408, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 22:21:04');
INSERT INTO `sys_log_login` VALUES (409, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 22:21:34');
INSERT INTO `sys_log_login` VALUES (410, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 22:21:40');
INSERT INTO `sys_log_login` VALUES (411, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 22:22:04');
INSERT INTO `sys_log_login` VALUES (412, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 22:22:20');
INSERT INTO `sys_log_login` VALUES (413, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 22:24:41');
INSERT INTO `sys_log_login` VALUES (414, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 22:32:14');
INSERT INTO `sys_log_login` VALUES (415, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 22:32:30');
INSERT INTO `sys_log_login` VALUES (416, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 22:33:17');
INSERT INTO `sys_log_login` VALUES (417, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 22:35:42');
INSERT INTO `sys_log_login` VALUES (418, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 22:36:04');
INSERT INTO `sys_log_login` VALUES (419, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 22:36:15');
INSERT INTO `sys_log_login` VALUES (420, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 22:37:56');
INSERT INTO `sys_log_login` VALUES (421, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 22:38:18');
INSERT INTO `sys_log_login` VALUES (422, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 22:39:14');
INSERT INTO `sys_log_login` VALUES (423, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 22:39:42');
INSERT INTO `sys_log_login` VALUES (424, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 22:41:00');
INSERT INTO `sys_log_login` VALUES (425, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 22:42:50');
INSERT INTO `sys_log_login` VALUES (426, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 22:43:00');
INSERT INTO `sys_log_login` VALUES (427, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 22:43:48');
INSERT INTO `sys_log_login` VALUES (428, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 22:48:24');
INSERT INTO `sys_log_login` VALUES (429, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 22:49:25');
INSERT INTO `sys_log_login` VALUES (430, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 22:53:53');
INSERT INTO `sys_log_login` VALUES (431, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 22:54:43');
INSERT INTO `sys_log_login` VALUES (432, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 22:54:59');
INSERT INTO `sys_log_login` VALUES (433, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 22:55:42');
INSERT INTO `sys_log_login` VALUES (434, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 22:56:06');
INSERT INTO `sys_log_login` VALUES (435, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 22:57:23');
INSERT INTO `sys_log_login` VALUES (436, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 22:58:03');
INSERT INTO `sys_log_login` VALUES (437, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 23:01:31');
INSERT INTO `sys_log_login` VALUES (438, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 23:02:02');
INSERT INTO `sys_log_login` VALUES (439, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 23:03:06');
INSERT INTO `sys_log_login` VALUES (440, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 23:03:22');
INSERT INTO `sys_log_login` VALUES (441, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 23:06:54');
INSERT INTO `sys_log_login` VALUES (442, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 23:07:40');
INSERT INTO `sys_log_login` VALUES (443, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 23:09:16');
INSERT INTO `sys_log_login` VALUES (444, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 23:09:25');
INSERT INTO `sys_log_login` VALUES (445, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 23:09:42');
INSERT INTO `sys_log_login` VALUES (446, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 23:10:19');
INSERT INTO `sys_log_login` VALUES (447, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 23:10:34');
INSERT INTO `sys_log_login` VALUES (448, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 23:14:27');
INSERT INTO `sys_log_login` VALUES (449, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-24 23:29:59');
INSERT INTO `sys_log_login` VALUES (450, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 12:01:51');
INSERT INTO `sys_log_login` VALUES (451, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 12:02:25');
INSERT INTO `sys_log_login` VALUES (452, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 12:03:39');
INSERT INTO `sys_log_login` VALUES (453, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 12:04:15');
INSERT INTO `sys_log_login` VALUES (454, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 12:04:56');
INSERT INTO `sys_log_login` VALUES (455, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 12:05:18');
INSERT INTO `sys_log_login` VALUES (456, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 12:05:38');
INSERT INTO `sys_log_login` VALUES (457, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 12:05:49');
INSERT INTO `sys_log_login` VALUES (458, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 12:05:55');
INSERT INTO `sys_log_login` VALUES (459, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 12:06:21');
INSERT INTO `sys_log_login` VALUES (460, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 12:08:30');
INSERT INTO `sys_log_login` VALUES (461, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 12:13:03');
INSERT INTO `sys_log_login` VALUES (462, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 12:21:33');
INSERT INTO `sys_log_login` VALUES (463, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 13:04:46');
INSERT INTO `sys_log_login` VALUES (464, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 13:05:12');
INSERT INTO `sys_log_login` VALUES (465, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 13:08:01');
INSERT INTO `sys_log_login` VALUES (466, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 13:10:34');
INSERT INTO `sys_log_login` VALUES (467, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 13:11:13');
INSERT INTO `sys_log_login` VALUES (468, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 13:12:26');
INSERT INTO `sys_log_login` VALUES (469, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 13:12:46');
INSERT INTO `sys_log_login` VALUES (470, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 13:13:24');
INSERT INTO `sys_log_login` VALUES (471, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 13:14:34');
INSERT INTO `sys_log_login` VALUES (472, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 13:15:16');
INSERT INTO `sys_log_login` VALUES (473, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 13:15:38');
INSERT INTO `sys_log_login` VALUES (474, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 13:15:53');
INSERT INTO `sys_log_login` VALUES (475, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 13:16:13');
INSERT INTO `sys_log_login` VALUES (476, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 13:17:56');
INSERT INTO `sys_log_login` VALUES (477, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 13:18:34');
INSERT INTO `sys_log_login` VALUES (478, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 13:18:40');
INSERT INTO `sys_log_login` VALUES (479, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 13:21:10');
INSERT INTO `sys_log_login` VALUES (480, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 13:21:52');
INSERT INTO `sys_log_login` VALUES (481, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 13:23:59');
INSERT INTO `sys_log_login` VALUES (482, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 13:26:00');
INSERT INTO `sys_log_login` VALUES (483, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 13:26:52');
INSERT INTO `sys_log_login` VALUES (484, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 13:29:10');
INSERT INTO `sys_log_login` VALUES (485, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 13:32:53');
INSERT INTO `sys_log_login` VALUES (486, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 13:35:17');
INSERT INTO `sys_log_login` VALUES (487, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 13:38:06');
INSERT INTO `sys_log_login` VALUES (488, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 13:38:26');
INSERT INTO `sys_log_login` VALUES (489, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 13:40:27');
INSERT INTO `sys_log_login` VALUES (490, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 13:43:25');
INSERT INTO `sys_log_login` VALUES (491, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 13:46:23');
INSERT INTO `sys_log_login` VALUES (492, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 13:48:39');
INSERT INTO `sys_log_login` VALUES (493, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 13:50:42');
INSERT INTO `sys_log_login` VALUES (494, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 13:51:33');
INSERT INTO `sys_log_login` VALUES (495, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 13:53:14');
INSERT INTO `sys_log_login` VALUES (496, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 13:54:23');
INSERT INTO `sys_log_login` VALUES (497, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 13:55:19');
INSERT INTO `sys_log_login` VALUES (498, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 13:58:10');
INSERT INTO `sys_log_login` VALUES (499, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 13:59:50');
INSERT INTO `sys_log_login` VALUES (500, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 14:01:03');
INSERT INTO `sys_log_login` VALUES (501, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 14:02:51');
INSERT INTO `sys_log_login` VALUES (502, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 14:03:15');
INSERT INTO `sys_log_login` VALUES (503, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 14:08:46');
INSERT INTO `sys_log_login` VALUES (504, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 14:10:47');
INSERT INTO `sys_log_login` VALUES (505, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 14:13:46');
INSERT INTO `sys_log_login` VALUES (506, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 14:30:12');
INSERT INTO `sys_log_login` VALUES (507, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 14:31:10');
INSERT INTO `sys_log_login` VALUES (508, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 14:31:55');
INSERT INTO `sys_log_login` VALUES (509, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 14:32:59');
INSERT INTO `sys_log_login` VALUES (510, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 14:36:35');
INSERT INTO `sys_log_login` VALUES (511, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 14:37:09');
INSERT INTO `sys_log_login` VALUES (512, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 14:37:32');
INSERT INTO `sys_log_login` VALUES (513, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 14:59:03');
INSERT INTO `sys_log_login` VALUES (514, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 15:04:09');
INSERT INTO `sys_log_login` VALUES (515, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 15:14:28');
INSERT INTO `sys_log_login` VALUES (516, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 15:15:40');
INSERT INTO `sys_log_login` VALUES (517, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 15:16:28');
INSERT INTO `sys_log_login` VALUES (518, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 15:16:55');
INSERT INTO `sys_log_login` VALUES (519, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 15:17:26');
INSERT INTO `sys_log_login` VALUES (520, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 15:19:02');
INSERT INTO `sys_log_login` VALUES (521, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 15:24:13');
INSERT INTO `sys_log_login` VALUES (522, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 15:25:01');
INSERT INTO `sys_log_login` VALUES (523, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 15:26:08');
INSERT INTO `sys_log_login` VALUES (524, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 15:26:32');
INSERT INTO `sys_log_login` VALUES (525, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 15:28:31');
INSERT INTO `sys_log_login` VALUES (526, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 15:31:03');
INSERT INTO `sys_log_login` VALUES (527, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 15:31:53');
INSERT INTO `sys_log_login` VALUES (528, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 15:33:19');
INSERT INTO `sys_log_login` VALUES (529, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 15:57:18');
INSERT INTO `sys_log_login` VALUES (530, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 16:01:19');
INSERT INTO `sys_log_login` VALUES (531, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 17:12:06');
INSERT INTO `sys_log_login` VALUES (532, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 17:13:16');
INSERT INTO `sys_log_login` VALUES (533, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 17:13:29');
INSERT INTO `sys_log_login` VALUES (534, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 17:14:33');
INSERT INTO `sys_log_login` VALUES (535, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 17:17:47');
INSERT INTO `sys_log_login` VALUES (536, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 17:20:41');
INSERT INTO `sys_log_login` VALUES (537, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 17:21:20');
INSERT INTO `sys_log_login` VALUES (538, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 17:25:38');
INSERT INTO `sys_log_login` VALUES (539, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 17:26:22');
INSERT INTO `sys_log_login` VALUES (540, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 17:26:56');
INSERT INTO `sys_log_login` VALUES (541, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 17:27:35');
INSERT INTO `sys_log_login` VALUES (542, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 17:28:02');
INSERT INTO `sys_log_login` VALUES (543, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 17:28:20');
INSERT INTO `sys_log_login` VALUES (544, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 17:29:12');
INSERT INTO `sys_log_login` VALUES (545, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 17:30:20');
INSERT INTO `sys_log_login` VALUES (546, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 17:30:45');
INSERT INTO `sys_log_login` VALUES (547, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 17:31:04');
INSERT INTO `sys_log_login` VALUES (548, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 17:31:40');
INSERT INTO `sys_log_login` VALUES (549, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 17:34:37');
INSERT INTO `sys_log_login` VALUES (550, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 17:37:02');
INSERT INTO `sys_log_login` VALUES (551, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 17:45:46');
INSERT INTO `sys_log_login` VALUES (552, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 17:48:04');
INSERT INTO `sys_log_login` VALUES (553, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 17:49:28');
INSERT INTO `sys_log_login` VALUES (554, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 18:00:51');
INSERT INTO `sys_log_login` VALUES (555, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 18:14:26');
INSERT INTO `sys_log_login` VALUES (556, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 18:15:05');
INSERT INTO `sys_log_login` VALUES (557, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 18:15:25');
INSERT INTO `sys_log_login` VALUES (558, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 18:15:43');
INSERT INTO `sys_log_login` VALUES (559, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 18:16:14');
INSERT INTO `sys_log_login` VALUES (560, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 18:20:38');
INSERT INTO `sys_log_login` VALUES (561, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 18:21:58');
INSERT INTO `sys_log_login` VALUES (562, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 18:23:25');
INSERT INTO `sys_log_login` VALUES (563, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 18:28:10');
INSERT INTO `sys_log_login` VALUES (564, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 18:31:35');
INSERT INTO `sys_log_login` VALUES (565, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 18:32:10');
INSERT INTO `sys_log_login` VALUES (566, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 18:33:43');
INSERT INTO `sys_log_login` VALUES (567, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 18:34:15');
INSERT INTO `sys_log_login` VALUES (568, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 18:35:01');
INSERT INTO `sys_log_login` VALUES (569, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 19:01:14');
INSERT INTO `sys_log_login` VALUES (570, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 19:04:10');
INSERT INTO `sys_log_login` VALUES (571, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 19:06:21');
INSERT INTO `sys_log_login` VALUES (572, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 19:07:09');
INSERT INTO `sys_log_login` VALUES (573, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 19:07:34');
INSERT INTO `sys_log_login` VALUES (574, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 19:09:32');
INSERT INTO `sys_log_login` VALUES (575, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 19:18:15');
INSERT INTO `sys_log_login` VALUES (576, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 19:35:00');
INSERT INTO `sys_log_login` VALUES (577, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 19:39:55');
INSERT INTO `sys_log_login` VALUES (578, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 19:56:39');
INSERT INTO `sys_log_login` VALUES (579, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 19:59:46');
INSERT INTO `sys_log_login` VALUES (580, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-26 21:53:14');
INSERT INTO `sys_log_login` VALUES (581, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 10:13:30');
INSERT INTO `sys_log_login` VALUES (582, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 10:15:22');
INSERT INTO `sys_log_login` VALUES (583, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 10:16:18');
INSERT INTO `sys_log_login` VALUES (584, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 10:17:22');
INSERT INTO `sys_log_login` VALUES (585, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 10:18:15');
INSERT INTO `sys_log_login` VALUES (586, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 10:19:03');
INSERT INTO `sys_log_login` VALUES (587, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 10:20:56');
INSERT INTO `sys_log_login` VALUES (588, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 10:24:37');
INSERT INTO `sys_log_login` VALUES (589, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 10:26:25');
INSERT INTO `sys_log_login` VALUES (590, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 10:27:17');
INSERT INTO `sys_log_login` VALUES (591, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 10:29:26');
INSERT INTO `sys_log_login` VALUES (592, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 10:30:17');
INSERT INTO `sys_log_login` VALUES (593, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 10:31:54');
INSERT INTO `sys_log_login` VALUES (594, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 10:39:20');
INSERT INTO `sys_log_login` VALUES (595, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 10:45:18');
INSERT INTO `sys_log_login` VALUES (596, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 10:46:05');
INSERT INTO `sys_log_login` VALUES (597, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 10:46:32');
INSERT INTO `sys_log_login` VALUES (598, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 10:47:11');
INSERT INTO `sys_log_login` VALUES (599, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 10:47:29');
INSERT INTO `sys_log_login` VALUES (600, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 10:51:19');
INSERT INTO `sys_log_login` VALUES (601, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 10:57:35');
INSERT INTO `sys_log_login` VALUES (602, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 10:59:47');
INSERT INTO `sys_log_login` VALUES (603, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 11:00:14');
INSERT INTO `sys_log_login` VALUES (604, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 11:00:46');
INSERT INTO `sys_log_login` VALUES (605, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 11:01:04');
INSERT INTO `sys_log_login` VALUES (606, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 11:01:21');
INSERT INTO `sys_log_login` VALUES (607, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 11:02:01');
INSERT INTO `sys_log_login` VALUES (608, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 11:02:16');
INSERT INTO `sys_log_login` VALUES (609, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 11:04:52');
INSERT INTO `sys_log_login` VALUES (610, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 11:05:26');
INSERT INTO `sys_log_login` VALUES (611, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 11:17:30');
INSERT INTO `sys_log_login` VALUES (612, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 11:19:08');
INSERT INTO `sys_log_login` VALUES (613, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 11:20:58');
INSERT INTO `sys_log_login` VALUES (614, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 11:22:01');
INSERT INTO `sys_log_login` VALUES (615, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 11:23:54');
INSERT INTO `sys_log_login` VALUES (616, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 11:29:36');
INSERT INTO `sys_log_login` VALUES (617, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 11:34:08');
INSERT INTO `sys_log_login` VALUES (618, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 13:31:02');
INSERT INTO `sys_log_login` VALUES (619, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 13:34:00');
INSERT INTO `sys_log_login` VALUES (620, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 13:37:33');
INSERT INTO `sys_log_login` VALUES (621, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 13:40:14');
INSERT INTO `sys_log_login` VALUES (622, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 13:41:23');
INSERT INTO `sys_log_login` VALUES (623, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 13:42:09');
INSERT INTO `sys_log_login` VALUES (624, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 13:42:42');
INSERT INTO `sys_log_login` VALUES (625, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 13:43:56');
INSERT INTO `sys_log_login` VALUES (626, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 13:45:19');
INSERT INTO `sys_log_login` VALUES (627, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 13:45:36');
INSERT INTO `sys_log_login` VALUES (628, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 13:52:48');
INSERT INTO `sys_log_login` VALUES (629, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 13:53:55');
INSERT INTO `sys_log_login` VALUES (630, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 13:55:07');
INSERT INTO `sys_log_login` VALUES (631, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 13:59:39');
INSERT INTO `sys_log_login` VALUES (632, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 14:00:23');
INSERT INTO `sys_log_login` VALUES (633, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 14:01:26');
INSERT INTO `sys_log_login` VALUES (634, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 14:02:15');
INSERT INTO `sys_log_login` VALUES (635, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 14:02:31');
INSERT INTO `sys_log_login` VALUES (636, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 14:17:07');
INSERT INTO `sys_log_login` VALUES (637, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 14:20:13');
INSERT INTO `sys_log_login` VALUES (638, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 14:23:41');
INSERT INTO `sys_log_login` VALUES (639, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 14:24:37');
INSERT INTO `sys_log_login` VALUES (640, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 14:25:33');
INSERT INTO `sys_log_login` VALUES (641, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 14:26:46');
INSERT INTO `sys_log_login` VALUES (642, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 15:21:34');
INSERT INTO `sys_log_login` VALUES (643, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 15:22:07');
INSERT INTO `sys_log_login` VALUES (644, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 15:25:48');
INSERT INTO `sys_log_login` VALUES (645, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 15:27:14');
INSERT INTO `sys_log_login` VALUES (646, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 15:28:21');
INSERT INTO `sys_log_login` VALUES (647, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 15:29:25');
INSERT INTO `sys_log_login` VALUES (648, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 15:33:45');
INSERT INTO `sys_log_login` VALUES (649, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 15:37:04');
INSERT INTO `sys_log_login` VALUES (650, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 15:46:15');
INSERT INTO `sys_log_login` VALUES (651, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 15:47:20');
INSERT INTO `sys_log_login` VALUES (652, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 15:55:06');
INSERT INTO `sys_log_login` VALUES (653, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 15:59:09');
INSERT INTO `sys_log_login` VALUES (654, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 16:00:01');
INSERT INTO `sys_log_login` VALUES (655, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 17:45:41');
INSERT INTO `sys_log_login` VALUES (656, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 17:47:02');
INSERT INTO `sys_log_login` VALUES (657, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 17:47:40');
INSERT INTO `sys_log_login` VALUES (658, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 17:50:22');
INSERT INTO `sys_log_login` VALUES (659, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 17:52:56');
INSERT INTO `sys_log_login` VALUES (660, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 18:23:20');
INSERT INTO `sys_log_login` VALUES (661, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 18:27:14');
INSERT INTO `sys_log_login` VALUES (662, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 18:30:51');
INSERT INTO `sys_log_login` VALUES (663, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 18:34:06');
INSERT INTO `sys_log_login` VALUES (664, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 18:35:26');
INSERT INTO `sys_log_login` VALUES (665, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 21:55:48');
INSERT INTO `sys_log_login` VALUES (666, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 22:13:29');
INSERT INTO `sys_log_login` VALUES (667, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 22:14:11');
INSERT INTO `sys_log_login` VALUES (668, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 22:14:44');
INSERT INTO `sys_log_login` VALUES (669, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 22:15:53');
INSERT INTO `sys_log_login` VALUES (670, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 22:16:04');
INSERT INTO `sys_log_login` VALUES (671, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 22:16:31');
INSERT INTO `sys_log_login` VALUES (672, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 22:44:47');
INSERT INTO `sys_log_login` VALUES (673, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 22:48:19');
INSERT INTO `sys_log_login` VALUES (674, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 22:48:57');
INSERT INTO `sys_log_login` VALUES (675, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 22:49:38');
INSERT INTO `sys_log_login` VALUES (676, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 22:50:23');
INSERT INTO `sys_log_login` VALUES (677, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 22:50:38');
INSERT INTO `sys_log_login` VALUES (678, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 22:51:02');
INSERT INTO `sys_log_login` VALUES (679, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 22:51:29');
INSERT INTO `sys_log_login` VALUES (680, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 22:52:21');
INSERT INTO `sys_log_login` VALUES (681, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 22:54:42');
INSERT INTO `sys_log_login` VALUES (682, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 22:55:40');
INSERT INTO `sys_log_login` VALUES (683, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 22:56:12');
INSERT INTO `sys_log_login` VALUES (684, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 22:59:48');
INSERT INTO `sys_log_login` VALUES (685, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 23:00:18');
INSERT INTO `sys_log_login` VALUES (686, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 23:00:40');
INSERT INTO `sys_log_login` VALUES (687, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 23:01:24');
INSERT INTO `sys_log_login` VALUES (688, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 23:02:10');
INSERT INTO `sys_log_login` VALUES (689, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 23:09:11');
INSERT INTO `sys_log_login` VALUES (690, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 23:10:02');
INSERT INTO `sys_log_login` VALUES (691, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 23:10:59');
INSERT INTO `sys_log_login` VALUES (692, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 23:12:12');
INSERT INTO `sys_log_login` VALUES (693, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 23:14:15');
INSERT INTO `sys_log_login` VALUES (694, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 23:17:38');
INSERT INTO `sys_log_login` VALUES (695, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 23:18:09');
INSERT INTO `sys_log_login` VALUES (696, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 23:19:50');
INSERT INTO `sys_log_login` VALUES (697, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 23:20:47');
INSERT INTO `sys_log_login` VALUES (698, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 23:21:49');
INSERT INTO `sys_log_login` VALUES (699, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 23:30:53');
INSERT INTO `sys_log_login` VALUES (700, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 23:31:41');
INSERT INTO `sys_log_login` VALUES (701, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 23:33:51');
INSERT INTO `sys_log_login` VALUES (702, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 23:36:46');
INSERT INTO `sys_log_login` VALUES (703, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 23:38:08');
INSERT INTO `sys_log_login` VALUES (704, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 23:40:02');
INSERT INTO `sys_log_login` VALUES (705, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 23:40:29');
INSERT INTO `sys_log_login` VALUES (706, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 23:41:10');
INSERT INTO `sys_log_login` VALUES (707, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 23:41:34');
INSERT INTO `sys_log_login` VALUES (708, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 23:43:54');
INSERT INTO `sys_log_login` VALUES (709, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 23:47:39');
INSERT INTO `sys_log_login` VALUES (710, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-27 23:48:52');
INSERT INTO `sys_log_login` VALUES (711, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 09:07:03');
INSERT INTO `sys_log_login` VALUES (712, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 09:10:32');
INSERT INTO `sys_log_login` VALUES (713, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 09:10:51');
INSERT INTO `sys_log_login` VALUES (714, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 09:11:17');
INSERT INTO `sys_log_login` VALUES (715, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 09:11:45');
INSERT INTO `sys_log_login` VALUES (716, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 09:18:32');
INSERT INTO `sys_log_login` VALUES (717, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 09:30:54');
INSERT INTO `sys_log_login` VALUES (718, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 09:31:51');
INSERT INTO `sys_log_login` VALUES (719, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 09:32:20');
INSERT INTO `sys_log_login` VALUES (720, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 09:34:41');
INSERT INTO `sys_log_login` VALUES (721, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 09:35:56');
INSERT INTO `sys_log_login` VALUES (722, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 09:38:06');
INSERT INTO `sys_log_login` VALUES (723, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 09:39:02');
INSERT INTO `sys_log_login` VALUES (724, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 09:40:08');
INSERT INTO `sys_log_login` VALUES (725, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 09:40:44');
INSERT INTO `sys_log_login` VALUES (726, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 09:41:56');
INSERT INTO `sys_log_login` VALUES (727, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 10:35:21');
INSERT INTO `sys_log_login` VALUES (728, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 10:37:53');
INSERT INTO `sys_log_login` VALUES (729, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 10:38:31');
INSERT INTO `sys_log_login` VALUES (730, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 10:40:22');
INSERT INTO `sys_log_login` VALUES (731, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 10:41:08');
INSERT INTO `sys_log_login` VALUES (732, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 10:42:03');
INSERT INTO `sys_log_login` VALUES (733, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 10:42:12');
INSERT INTO `sys_log_login` VALUES (734, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 10:43:22');
INSERT INTO `sys_log_login` VALUES (735, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 10:43:50');
INSERT INTO `sys_log_login` VALUES (736, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 10:45:23');
INSERT INTO `sys_log_login` VALUES (737, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 10:46:17');
INSERT INTO `sys_log_login` VALUES (738, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 10:47:13');
INSERT INTO `sys_log_login` VALUES (739, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 10:48:04');
INSERT INTO `sys_log_login` VALUES (740, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 10:48:24');
INSERT INTO `sys_log_login` VALUES (741, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 10:48:40');
INSERT INTO `sys_log_login` VALUES (742, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 10:49:18');
INSERT INTO `sys_log_login` VALUES (743, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 10:51:04');
INSERT INTO `sys_log_login` VALUES (744, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 10:52:21');
INSERT INTO `sys_log_login` VALUES (745, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 10:52:39');
INSERT INTO `sys_log_login` VALUES (746, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 10:53:42');
INSERT INTO `sys_log_login` VALUES (747, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 10:54:45');
INSERT INTO `sys_log_login` VALUES (748, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 10:55:08');
INSERT INTO `sys_log_login` VALUES (749, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 10:55:56');
INSERT INTO `sys_log_login` VALUES (750, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 10:58:18');
INSERT INTO `sys_log_login` VALUES (751, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 10:59:02');
INSERT INTO `sys_log_login` VALUES (752, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 11:09:51');
INSERT INTO `sys_log_login` VALUES (753, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 11:10:23');
INSERT INTO `sys_log_login` VALUES (754, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 11:10:52');
INSERT INTO `sys_log_login` VALUES (755, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 11:12:51');
INSERT INTO `sys_log_login` VALUES (756, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-28 11:14:24');
INSERT INTO `sys_log_login` VALUES (757, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 12:18:42');
INSERT INTO `sys_log_login` VALUES (758, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 12:48:25');
INSERT INTO `sys_log_login` VALUES (759, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 12:48:39');
INSERT INTO `sys_log_login` VALUES (760, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 12:48:53');
INSERT INTO `sys_log_login` VALUES (761, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 12:49:18');
INSERT INTO `sys_log_login` VALUES (762, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 12:51:31');
INSERT INTO `sys_log_login` VALUES (763, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 14:27:01');
INSERT INTO `sys_log_login` VALUES (764, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 18:30:26');
INSERT INTO `sys_log_login` VALUES (765, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 18:33:10');
INSERT INTO `sys_log_login` VALUES (766, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 18:35:24');
INSERT INTO `sys_log_login` VALUES (767, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 18:36:30');
INSERT INTO `sys_log_login` VALUES (768, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 18:47:49');
INSERT INTO `sys_log_login` VALUES (769, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 18:54:45');
INSERT INTO `sys_log_login` VALUES (770, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 18:59:44');
INSERT INTO `sys_log_login` VALUES (771, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 19:04:27');
INSERT INTO `sys_log_login` VALUES (772, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 19:06:56');
INSERT INTO `sys_log_login` VALUES (773, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 19:10:49');
INSERT INTO `sys_log_login` VALUES (774, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 19:13:04');
INSERT INTO `sys_log_login` VALUES (775, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 19:21:46');
INSERT INTO `sys_log_login` VALUES (776, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 19:25:16');
INSERT INTO `sys_log_login` VALUES (777, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 19:31:36');
INSERT INTO `sys_log_login` VALUES (778, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 19:32:39');
INSERT INTO `sys_log_login` VALUES (779, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 19:35:56');
INSERT INTO `sys_log_login` VALUES (780, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 19:40:26');
INSERT INTO `sys_log_login` VALUES (781, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 19:50:08');
INSERT INTO `sys_log_login` VALUES (782, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 19:55:32');
INSERT INTO `sys_log_login` VALUES (783, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 19:56:48');
INSERT INTO `sys_log_login` VALUES (784, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 20:02:00');
INSERT INTO `sys_log_login` VALUES (785, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 20:08:51');
INSERT INTO `sys_log_login` VALUES (786, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 20:11:00');
INSERT INTO `sys_log_login` VALUES (787, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 20:11:27');
INSERT INTO `sys_log_login` VALUES (788, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 20:17:41');
INSERT INTO `sys_log_login` VALUES (789, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 20:30:55');
INSERT INTO `sys_log_login` VALUES (790, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 20:32:30');
INSERT INTO `sys_log_login` VALUES (791, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 20:34:14');
INSERT INTO `sys_log_login` VALUES (792, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 21:02:32');
INSERT INTO `sys_log_login` VALUES (793, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 21:12:30');
INSERT INTO `sys_log_login` VALUES (794, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 21:14:22');
INSERT INTO `sys_log_login` VALUES (795, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 21:15:59');
INSERT INTO `sys_log_login` VALUES (796, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 21:22:15');
INSERT INTO `sys_log_login` VALUES (797, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 21:24:35');
INSERT INTO `sys_log_login` VALUES (798, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 21:31:13');
INSERT INTO `sys_log_login` VALUES (799, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 21:47:52');
INSERT INTO `sys_log_login` VALUES (800, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 21:50:27');
INSERT INTO `sys_log_login` VALUES (801, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 21:54:26');
INSERT INTO `sys_log_login` VALUES (802, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 21:57:06');
INSERT INTO `sys_log_login` VALUES (803, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 21:59:09');
INSERT INTO `sys_log_login` VALUES (804, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 22:04:00');
INSERT INTO `sys_log_login` VALUES (805, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 22:07:36');
INSERT INTO `sys_log_login` VALUES (806, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 22:13:03');
INSERT INTO `sys_log_login` VALUES (807, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-29 22:14:07');
INSERT INTO `sys_log_login` VALUES (808, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 14:18:05');
INSERT INTO `sys_log_login` VALUES (809, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 14:25:54');
INSERT INTO `sys_log_login` VALUES (810, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 14:29:00');
INSERT INTO `sys_log_login` VALUES (811, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 14:29:08');
INSERT INTO `sys_log_login` VALUES (812, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 14:33:44');
INSERT INTO `sys_log_login` VALUES (813, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 14:36:07');
INSERT INTO `sys_log_login` VALUES (814, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 14:36:13');
INSERT INTO `sys_log_login` VALUES (815, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 14:43:53');
INSERT INTO `sys_log_login` VALUES (816, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 14:52:44');
INSERT INTO `sys_log_login` VALUES (817, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 14:55:05');
INSERT INTO `sys_log_login` VALUES (818, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 14:55:48');
INSERT INTO `sys_log_login` VALUES (819, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 17:59:23');
INSERT INTO `sys_log_login` VALUES (820, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 18:01:05');
INSERT INTO `sys_log_login` VALUES (821, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 18:02:07');
INSERT INTO `sys_log_login` VALUES (822, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 18:04:39');
INSERT INTO `sys_log_login` VALUES (823, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 18:05:24');
INSERT INTO `sys_log_login` VALUES (824, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 18:09:23');
INSERT INTO `sys_log_login` VALUES (825, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 18:09:50');
INSERT INTO `sys_log_login` VALUES (826, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 18:11:58');
INSERT INTO `sys_log_login` VALUES (827, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 18:13:20');
INSERT INTO `sys_log_login` VALUES (828, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 18:14:10');
INSERT INTO `sys_log_login` VALUES (829, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 18:14:41');
INSERT INTO `sys_log_login` VALUES (830, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 18:15:26');
INSERT INTO `sys_log_login` VALUES (831, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 18:17:24');
INSERT INTO `sys_log_login` VALUES (832, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 18:18:16');
INSERT INTO `sys_log_login` VALUES (833, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 18:20:16');
INSERT INTO `sys_log_login` VALUES (834, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 18:21:23');
INSERT INTO `sys_log_login` VALUES (835, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 18:22:49');
INSERT INTO `sys_log_login` VALUES (836, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 18:23:07');
INSERT INTO `sys_log_login` VALUES (837, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 18:24:36');
INSERT INTO `sys_log_login` VALUES (838, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 18:25:28');
INSERT INTO `sys_log_login` VALUES (839, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 18:26:13');
INSERT INTO `sys_log_login` VALUES (840, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 18:27:51');
INSERT INTO `sys_log_login` VALUES (841, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 18:28:10');
INSERT INTO `sys_log_login` VALUES (842, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 18:28:46');
INSERT INTO `sys_log_login` VALUES (843, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 18:29:37');
INSERT INTO `sys_log_login` VALUES (844, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 18:32:46');
INSERT INTO `sys_log_login` VALUES (845, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 18:37:24');
INSERT INTO `sys_log_login` VALUES (846, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 18:38:26');
INSERT INTO `sys_log_login` VALUES (847, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 18:39:28');
INSERT INTO `sys_log_login` VALUES (848, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 18:39:51');
INSERT INTO `sys_log_login` VALUES (849, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 18:42:14');
INSERT INTO `sys_log_login` VALUES (850, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 18:42:51');
INSERT INTO `sys_log_login` VALUES (851, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 18:43:44');
INSERT INTO `sys_log_login` VALUES (852, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 18:44:04');
INSERT INTO `sys_log_login` VALUES (853, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 18:45:05');
INSERT INTO `sys_log_login` VALUES (854, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 18:45:42');
INSERT INTO `sys_log_login` VALUES (855, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 18:46:38');
INSERT INTO `sys_log_login` VALUES (856, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 18:48:50');
INSERT INTO `sys_log_login` VALUES (857, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 18:49:24');
INSERT INTO `sys_log_login` VALUES (858, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 18:56:33');
INSERT INTO `sys_log_login` VALUES (859, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 18:57:21');
INSERT INTO `sys_log_login` VALUES (860, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 18:59:06');
INSERT INTO `sys_log_login` VALUES (861, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 19:00:03');
INSERT INTO `sys_log_login` VALUES (862, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 19:00:52');
INSERT INTO `sys_log_login` VALUES (863, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 19:01:15');
INSERT INTO `sys_log_login` VALUES (864, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 19:01:40');
INSERT INTO `sys_log_login` VALUES (865, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 19:02:01');
INSERT INTO `sys_log_login` VALUES (866, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 19:02:47');
INSERT INTO `sys_log_login` VALUES (867, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 19:03:15');
INSERT INTO `sys_log_login` VALUES (868, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 19:07:22');
INSERT INTO `sys_log_login` VALUES (869, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 19:07:56');
INSERT INTO `sys_log_login` VALUES (870, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 19:09:08');
INSERT INTO `sys_log_login` VALUES (871, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 19:12:20');
INSERT INTO `sys_log_login` VALUES (872, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 19:12:44');
INSERT INTO `sys_log_login` VALUES (873, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 19:14:16');
INSERT INTO `sys_log_login` VALUES (874, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 19:15:58');
INSERT INTO `sys_log_login` VALUES (875, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 19:30:42');
INSERT INTO `sys_log_login` VALUES (876, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 19:31:12');
INSERT INTO `sys_log_login` VALUES (877, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 19:31:46');
INSERT INTO `sys_log_login` VALUES (878, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 19:43:22');
INSERT INTO `sys_log_login` VALUES (879, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 19:43:47');
INSERT INTO `sys_log_login` VALUES (880, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 19:47:14');
INSERT INTO `sys_log_login` VALUES (881, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 19:49:49');
INSERT INTO `sys_log_login` VALUES (882, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 19:50:50');
INSERT INTO `sys_log_login` VALUES (883, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 19:52:00');
INSERT INTO `sys_log_login` VALUES (884, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 19:52:39');
INSERT INTO `sys_log_login` VALUES (885, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 19:53:45');
INSERT INTO `sys_log_login` VALUES (886, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 19:53:49');
INSERT INTO `sys_log_login` VALUES (887, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 19:55:31');
INSERT INTO `sys_log_login` VALUES (888, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 19:56:02');
INSERT INTO `sys_log_login` VALUES (889, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 19:56:27');
INSERT INTO `sys_log_login` VALUES (890, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 19:57:27');
INSERT INTO `sys_log_login` VALUES (891, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 20:01:22');
INSERT INTO `sys_log_login` VALUES (892, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 20:04:56');
INSERT INTO `sys_log_login` VALUES (893, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 20:06:22');
INSERT INTO `sys_log_login` VALUES (894, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 20:08:03');
INSERT INTO `sys_log_login` VALUES (895, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 20:13:42');
INSERT INTO `sys_log_login` VALUES (896, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 20:14:45');
INSERT INTO `sys_log_login` VALUES (897, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 20:15:36');
INSERT INTO `sys_log_login` VALUES (898, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 20:23:44');
INSERT INTO `sys_log_login` VALUES (899, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 20:26:08');
INSERT INTO `sys_log_login` VALUES (900, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 20:26:38');
INSERT INTO `sys_log_login` VALUES (901, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 20:27:30');
INSERT INTO `sys_log_login` VALUES (902, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 20:32:06');
INSERT INTO `sys_log_login` VALUES (903, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 20:33:45');
INSERT INTO `sys_log_login` VALUES (904, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 20:36:25');
INSERT INTO `sys_log_login` VALUES (905, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 20:38:44');
INSERT INTO `sys_log_login` VALUES (906, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 20:39:58');
INSERT INTO `sys_log_login` VALUES (907, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 20:41:31');
INSERT INTO `sys_log_login` VALUES (908, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 20:44:56');
INSERT INTO `sys_log_login` VALUES (909, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 20:45:27');
INSERT INTO `sys_log_login` VALUES (910, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 20:47:08');
INSERT INTO `sys_log_login` VALUES (911, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 20:49:30');
INSERT INTO `sys_log_login` VALUES (912, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 20:49:52');
INSERT INTO `sys_log_login` VALUES (913, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 20:50:41');
INSERT INTO `sys_log_login` VALUES (914, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 20:55:19');
INSERT INTO `sys_log_login` VALUES (915, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 20:56:45');
INSERT INTO `sys_log_login` VALUES (916, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 20:58:39');
INSERT INTO `sys_log_login` VALUES (917, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 21:00:47');
INSERT INTO `sys_log_login` VALUES (918, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 21:02:22');
INSERT INTO `sys_log_login` VALUES (919, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 21:02:41');
INSERT INTO `sys_log_login` VALUES (920, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 21:03:26');
INSERT INTO `sys_log_login` VALUES (921, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 21:04:13');
INSERT INTO `sys_log_login` VALUES (922, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 21:05:52');
INSERT INTO `sys_log_login` VALUES (923, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 21:06:29');
INSERT INTO `sys_log_login` VALUES (924, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 21:07:29');
INSERT INTO `sys_log_login` VALUES (925, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 21:08:03');
INSERT INTO `sys_log_login` VALUES (926, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 21:08:29');
INSERT INTO `sys_log_login` VALUES (927, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 21:38:09');
INSERT INTO `sys_log_login` VALUES (928, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 21:39:03');
INSERT INTO `sys_log_login` VALUES (929, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 21:41:40');
INSERT INTO `sys_log_login` VALUES (930, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 21:44:07');
INSERT INTO `sys_log_login` VALUES (931, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 21:44:34');
INSERT INTO `sys_log_login` VALUES (932, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 21:45:15');
INSERT INTO `sys_log_login` VALUES (933, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 21:45:44');
INSERT INTO `sys_log_login` VALUES (934, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 21:51:00');
INSERT INTO `sys_log_login` VALUES (935, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 21:51:14');
INSERT INTO `sys_log_login` VALUES (936, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 21:52:33');
INSERT INTO `sys_log_login` VALUES (937, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 21:53:28');
INSERT INTO `sys_log_login` VALUES (938, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 21:53:56');
INSERT INTO `sys_log_login` VALUES (939, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 21:54:23');
INSERT INTO `sys_log_login` VALUES (940, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 21:55:09');
INSERT INTO `sys_log_login` VALUES (941, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 21:55:41');
INSERT INTO `sys_log_login` VALUES (942, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 21:56:55');
INSERT INTO `sys_log_login` VALUES (943, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 22:00:33');
INSERT INTO `sys_log_login` VALUES (944, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 22:16:48');
INSERT INTO `sys_log_login` VALUES (945, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 22:16:57');
INSERT INTO `sys_log_login` VALUES (946, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 22:17:51');
INSERT INTO `sys_log_login` VALUES (947, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 22:19:26');
INSERT INTO `sys_log_login` VALUES (948, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 22:19:51');
INSERT INTO `sys_log_login` VALUES (949, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 22:20:24');
INSERT INTO `sys_log_login` VALUES (950, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 22:26:43');
INSERT INTO `sys_log_login` VALUES (951, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 22:27:37');
INSERT INTO `sys_log_login` VALUES (952, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 22:32:00');
INSERT INTO `sys_log_login` VALUES (953, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 22:32:38');
INSERT INTO `sys_log_login` VALUES (954, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 22:33:33');
INSERT INTO `sys_log_login` VALUES (955, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 22:34:33');
INSERT INTO `sys_log_login` VALUES (956, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 22:35:55');
INSERT INTO `sys_log_login` VALUES (957, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 22:36:12');
INSERT INTO `sys_log_login` VALUES (958, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 22:38:25');
INSERT INTO `sys_log_login` VALUES (959, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 22:38:40');
INSERT INTO `sys_log_login` VALUES (960, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 22:39:26');
INSERT INTO `sys_log_login` VALUES (961, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 22:43:35');
INSERT INTO `sys_log_login` VALUES (962, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 22:44:34');
INSERT INTO `sys_log_login` VALUES (963, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 22:45:28');
INSERT INTO `sys_log_login` VALUES (964, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 22:45:45');
INSERT INTO `sys_log_login` VALUES (965, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 22:48:19');
INSERT INTO `sys_log_login` VALUES (966, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 22:52:46');
INSERT INTO `sys_log_login` VALUES (967, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-06-30 23:10:14');
INSERT INTO `sys_log_login` VALUES (968, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 13:32:53');
INSERT INTO `sys_log_login` VALUES (969, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 13:35:11');
INSERT INTO `sys_log_login` VALUES (970, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 13:36:10');
INSERT INTO `sys_log_login` VALUES (971, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 13:38:45');
INSERT INTO `sys_log_login` VALUES (972, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 13:39:42');
INSERT INTO `sys_log_login` VALUES (973, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 13:40:41');
INSERT INTO `sys_log_login` VALUES (974, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 13:41:36');
INSERT INTO `sys_log_login` VALUES (975, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 13:42:38');
INSERT INTO `sys_log_login` VALUES (976, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 13:43:16');
INSERT INTO `sys_log_login` VALUES (977, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 13:46:39');
INSERT INTO `sys_log_login` VALUES (978, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 13:47:38');
INSERT INTO `sys_log_login` VALUES (979, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 13:48:27');
INSERT INTO `sys_log_login` VALUES (980, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 13:53:14');
INSERT INTO `sys_log_login` VALUES (981, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 13:53:44');
INSERT INTO `sys_log_login` VALUES (982, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 13:56:54');
INSERT INTO `sys_log_login` VALUES (983, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 13:57:51');
INSERT INTO `sys_log_login` VALUES (984, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 13:58:22');
INSERT INTO `sys_log_login` VALUES (985, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 14:01:05');
INSERT INTO `sys_log_login` VALUES (986, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 14:02:08');
INSERT INTO `sys_log_login` VALUES (987, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 14:03:09');
INSERT INTO `sys_log_login` VALUES (988, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 14:03:56');
INSERT INTO `sys_log_login` VALUES (989, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 14:04:30');
INSERT INTO `sys_log_login` VALUES (990, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 14:06:15');
INSERT INTO `sys_log_login` VALUES (991, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 14:17:02');
INSERT INTO `sys_log_login` VALUES (992, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 14:18:34');
INSERT INTO `sys_log_login` VALUES (993, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 14:19:17');
INSERT INTO `sys_log_login` VALUES (994, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 14:19:40');
INSERT INTO `sys_log_login` VALUES (995, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 14:20:37');
INSERT INTO `sys_log_login` VALUES (996, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 14:21:36');
INSERT INTO `sys_log_login` VALUES (997, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 14:22:42');
INSERT INTO `sys_log_login` VALUES (998, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 14:23:37');
INSERT INTO `sys_log_login` VALUES (999, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 14:24:03');
INSERT INTO `sys_log_login` VALUES (1000, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 14:26:45');
INSERT INTO `sys_log_login` VALUES (1001, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 14:27:18');
INSERT INTO `sys_log_login` VALUES (1002, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 14:28:22');
INSERT INTO `sys_log_login` VALUES (1003, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 14:29:31');
INSERT INTO `sys_log_login` VALUES (1004, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 14:34:56');
INSERT INTO `sys_log_login` VALUES (1005, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 14:36:10');
INSERT INTO `sys_log_login` VALUES (1006, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 14:37:06');
INSERT INTO `sys_log_login` VALUES (1007, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 14:39:51');
INSERT INTO `sys_log_login` VALUES (1008, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 14:40:59');
INSERT INTO `sys_log_login` VALUES (1009, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 17:19:36');
INSERT INTO `sys_log_login` VALUES (1010, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 17:26:57');
INSERT INTO `sys_log_login` VALUES (1011, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 17:28:53');
INSERT INTO `sys_log_login` VALUES (1012, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 17:30:08');
INSERT INTO `sys_log_login` VALUES (1013, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 17:30:28');
INSERT INTO `sys_log_login` VALUES (1014, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 17:31:57');
INSERT INTO `sys_log_login` VALUES (1015, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 17:32:22');
INSERT INTO `sys_log_login` VALUES (1016, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 17:39:27');
INSERT INTO `sys_log_login` VALUES (1017, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 17:40:21');
INSERT INTO `sys_log_login` VALUES (1018, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 17:41:05');
INSERT INTO `sys_log_login` VALUES (1019, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 17:41:28');
INSERT INTO `sys_log_login` VALUES (1020, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 17:41:53');
INSERT INTO `sys_log_login` VALUES (1021, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 17:42:19');
INSERT INTO `sys_log_login` VALUES (1022, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 17:43:29');
INSERT INTO `sys_log_login` VALUES (1023, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 17:46:44');
INSERT INTO `sys_log_login` VALUES (1024, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 17:47:42');
INSERT INTO `sys_log_login` VALUES (1025, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 17:48:31');
INSERT INTO `sys_log_login` VALUES (1026, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 17:49:22');
INSERT INTO `sys_log_login` VALUES (1027, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 17:49:37');
INSERT INTO `sys_log_login` VALUES (1028, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 17:53:14');
INSERT INTO `sys_log_login` VALUES (1029, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 17:55:37');
INSERT INTO `sys_log_login` VALUES (1030, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 17:59:28');
INSERT INTO `sys_log_login` VALUES (1031, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 18:00:31');
INSERT INTO `sys_log_login` VALUES (1032, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 18:01:53');
INSERT INTO `sys_log_login` VALUES (1033, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 18:04:47');
INSERT INTO `sys_log_login` VALUES (1034, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 18:06:11');
INSERT INTO `sys_log_login` VALUES (1035, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 18:06:56');
INSERT INTO `sys_log_login` VALUES (1036, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 18:09:18');
INSERT INTO `sys_log_login` VALUES (1037, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 18:11:42');
INSERT INTO `sys_log_login` VALUES (1038, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 18:13:05');
INSERT INTO `sys_log_login` VALUES (1039, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 18:13:28');
INSERT INTO `sys_log_login` VALUES (1040, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 18:16:29');
INSERT INTO `sys_log_login` VALUES (1041, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 18:22:55');
INSERT INTO `sys_log_login` VALUES (1042, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 18:26:31');
INSERT INTO `sys_log_login` VALUES (1043, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 18:27:35');
INSERT INTO `sys_log_login` VALUES (1044, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 18:32:38');
INSERT INTO `sys_log_login` VALUES (1045, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 18:34:13');
INSERT INTO `sys_log_login` VALUES (1046, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 18:34:55');
INSERT INTO `sys_log_login` VALUES (1047, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 18:43:53');
INSERT INTO `sys_log_login` VALUES (1048, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 18:46:41');
INSERT INTO `sys_log_login` VALUES (1049, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 18:47:20');
INSERT INTO `sys_log_login` VALUES (1050, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 18:51:00');
INSERT INTO `sys_log_login` VALUES (1051, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 18:51:41');
INSERT INTO `sys_log_login` VALUES (1052, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 18:52:35');
INSERT INTO `sys_log_login` VALUES (1053, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-01 18:53:17');
INSERT INTO `sys_log_login` VALUES (1054, '丁国梁-admin', '0:0:0:0:0:0:0:1', '2020-07-03 21:09:55');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `href` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `spread` int(255) NULL DEFAULT NULL COMMENT '0不展开1展开',
  `target` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `available` int(255) NULL DEFAULT NULL COMMENT '0不可用1可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '汽车租赁系统', '', 1, NULL, '&#xe68e;', 1);
INSERT INTO `sys_menu` VALUES (2, 1, '基础管理', '', 1, '', '&#xe621;', 1);
INSERT INTO `sys_menu` VALUES (3, 1, '业务管理', '', 0, '', '&#xe663;', 1);
INSERT INTO `sys_menu` VALUES (4, 1, '系统管理', NULL, 0, NULL, '&#xe716;', 1);
INSERT INTO `sys_menu` VALUES (5, 1, '统计分析', '', 0, '', '&#xe629;', 1);
INSERT INTO `sys_menu` VALUES (6, 2, '客户管理', '../bus/toCustomerManager', 0, '', '&#xe770;', 1);
INSERT INTO `sys_menu` VALUES (7, 2, '车辆管理', '../bus/toCarManager', 0, '', '&#xe657;', 1);
INSERT INTO `sys_menu` VALUES (8, 3, '汽车出租', '../bus/toRentCarManager', 0, '', '&#xe65b;', 1);
INSERT INTO `sys_menu` VALUES (9, 3, '出租单管理', '../bus/toRentManager', 0, '', '&#xe6b2;', 1);
INSERT INTO `sys_menu` VALUES (10, 3, '汽车入库', '../bus/toCheckCarManager', 0, '', '&#xe65a;', 1);
INSERT INTO `sys_menu` VALUES (11, 3, '检查单管理', '../bus/toCheckManager', 0, '', '&#xe705', 1);
INSERT INTO `sys_menu` VALUES (12, 4, '菜单管理', '../sys/toMenuManager', 0, '', '&#xe60f', 1);
INSERT INTO `sys_menu` VALUES (13, 4, '角色管理', '../sys/toRoleManager', 0, '', '&#xe66f;', 1);
INSERT INTO `sys_menu` VALUES (14, 4, '用户管理', '../sys/toUserManager', 0, '', '&#xe770;', 1);
INSERT INTO `sys_menu` VALUES (15, 4, '日志管理', '../sys/toLoginInfoManager', 0, '', '&#xe655;', 1);
INSERT INTO `sys_menu` VALUES (16, 4, '系统公告', '../sys/toNewsManager', 0, '', '&#xe645;', 1);
INSERT INTO `sys_menu` VALUES (17, 4, '数据源监控', '../druid/', 0, '', '&#xe857;', 1);
INSERT INTO `sys_menu` VALUES (18, 5, '客户地区统计', '../stat/toCustomerAreaStat', 0, '', '&#xe63c;', 1);
INSERT INTO `sys_menu` VALUES (19, 5, '公司年度月份销售额', '../stat/toCompanySaleStat', 0, '', '&#xe62c;', 1);
INSERT INTO `sys_menu` VALUES (20, 5, '业务员销售额统计', '../stat/toOpernameSaleStat', 0, '', '&#xe62d;', 1);

-- ----------------------------
-- Table structure for sys_news
-- ----------------------------
DROP TABLE IF EXISTS `sys_news`;
CREATE TABLE `sys_news`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` datetime(0) NULL DEFAULT NULL,
  `opername` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_news
-- ----------------------------
INSERT INTO `sys_news` VALUES (17, '我的第一个ssm项目', '<p>hello,world</p>', '2020-06-22 22:45:32', '丁国梁');
INSERT INTO `sys_news` VALUES (18, '注意事项', '2222', '2020-06-23 10:14:45', '丁国梁');
INSERT INTO `sys_news` VALUES (19, '还行把', '3333', '2020-06-23 10:43:49', '丁国梁');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `roleid` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roledesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `available` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', '拥有所有菜单权限', 1);
INSERT INTO `sys_role` VALUES (2, '业务管理员', '拥有所有业务权限', 1);
INSERT INTO `sys_role` VALUES (3, '系统管理员', '管理系统', 1);
INSERT INTO `sys_role` VALUES (4, '数据统计管理员', '数据统计管理员', 1);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `rid` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  PRIMARY KEY (`rid`, `mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1);
INSERT INTO `sys_role_menu` VALUES (1, 2);
INSERT INTO `sys_role_menu` VALUES (1, 3);
INSERT INTO `sys_role_menu` VALUES (1, 4);
INSERT INTO `sys_role_menu` VALUES (1, 5);
INSERT INTO `sys_role_menu` VALUES (1, 6);
INSERT INTO `sys_role_menu` VALUES (1, 7);
INSERT INTO `sys_role_menu` VALUES (1, 8);
INSERT INTO `sys_role_menu` VALUES (1, 9);
INSERT INTO `sys_role_menu` VALUES (1, 10);
INSERT INTO `sys_role_menu` VALUES (1, 11);
INSERT INTO `sys_role_menu` VALUES (1, 12);
INSERT INTO `sys_role_menu` VALUES (1, 13);
INSERT INTO `sys_role_menu` VALUES (1, 14);
INSERT INTO `sys_role_menu` VALUES (1, 15);
INSERT INTO `sys_role_menu` VALUES (1, 16);
INSERT INTO `sys_role_menu` VALUES (1, 17);
INSERT INTO `sys_role_menu` VALUES (1, 18);
INSERT INTO `sys_role_menu` VALUES (1, 19);
INSERT INTO `sys_role_menu` VALUES (1, 20);
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 6);
INSERT INTO `sys_role_menu` VALUES (2, 7);
INSERT INTO `sys_role_menu` VALUES (2, 8);
INSERT INTO `sys_role_menu` VALUES (2, 9);
INSERT INTO `sys_role_menu` VALUES (2, 10);
INSERT INTO `sys_role_menu` VALUES (2, 11);
INSERT INTO `sys_role_menu` VALUES (3, 1);
INSERT INTO `sys_role_menu` VALUES (3, 4);
INSERT INTO `sys_role_menu` VALUES (3, 12);
INSERT INTO `sys_role_menu` VALUES (3, 13);
INSERT INTO `sys_role_menu` VALUES (3, 14);
INSERT INTO `sys_role_menu` VALUES (3, 15);
INSERT INTO `sys_role_menu` VALUES (3, 16);
INSERT INTO `sys_role_menu` VALUES (3, 17);
INSERT INTO `sys_role_menu` VALUES (4, 1);
INSERT INTO `sys_role_menu` VALUES (4, 5);
INSERT INTO `sys_role_menu` VALUES (4, 18);
INSERT INTO `sys_role_menu` VALUES (4, 19);
INSERT INTO `sys_role_menu` VALUES (4, 20);

-- ----------------------------
-- Table structure for sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user`  (
  `uid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  PRIMARY KEY (`uid`, `rid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------
INSERT INTO `sys_role_user` VALUES (1, 1);
INSERT INTO `sys_role_user` VALUES (1, 2);
INSERT INTO `sys_role_user` VALUES (1, 3);
INSERT INTO `sys_role_user` VALUES (1, 4);
INSERT INTO `sys_role_user` VALUES (3, 1);
INSERT INTO `sys_role_user` VALUES (4, 3);
INSERT INTO `sys_role_user` VALUES (5, 2);
INSERT INTO `sys_role_user` VALUES (6, 4);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `identity` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` int(255) NULL DEFAULT NULL COMMENT '0女1男',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(255) NULL DEFAULT 2 COMMENT '1，超级管理员,2，系统用户',
  `available` int(255) NULL DEFAULT NULL,
  `userimg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '4313341334413', '丁国梁', 1, '衡阳', '18112271721', 'e10adc3949ba59abbe56e057f20f883e', 'CEO', 1, 1, '2020-06-30用户头像/202006302245409287794.PNG');
INSERT INTO `sys_user` VALUES (3, 'zhangsan', '3413334134131131', '张三', 1, '长沙', '134131313111', 'e10adc3949ba59abbe56e057f20f883e', 'BA', 2, 1, NULL);
INSERT INTO `sys_user` VALUES (4, 'ls', '43311341311314341', '李四', 0, '上海', '1341314113131', 'e10adc3949ba59abbe56e057f20f883e', '扫厕所', 2, 1, NULL);
INSERT INTO `sys_user` VALUES (5, 'ww', '4313133131331312', '王五', 1, '武汉', '13413131131', 'e10adc3949ba59abbe56e057f20f883e', '领导', 2, 1, NULL);
INSERT INTO `sys_user` VALUES (6, 'xm', '45113141331131131', '小明', 0, '南通', '13451333131', 'e10adc3949ba59abbe56e057f20f883e', '扫地的', 2, 1, NULL);
INSERT INTO `sys_user` VALUES (20, '1', '1', '1', 1, '1', '1', 'e10adc3949ba59abbe56e057f20f883e', '1', 2, 1, NULL);
INSERT INTO `sys_user` VALUES (21, '1', '1', '1', 1, '1', '1', 'e10adc3949ba59abbe56e057f20f883e', '1', 2, 1, NULL);
INSERT INTO `sys_user` VALUES (22, '1', '1', '1', 1, '1', '1', 'e10adc3949ba59abbe56e057f20f883e', '1', 2, 1, NULL);

SET FOREIGN_KEY_CHECKS = 1;
