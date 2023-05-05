/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : forum

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `postid` int(11) NOT NULL AUTO_INCREMENT,
  `postpartition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `postuser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `posttitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `posttext` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `posttime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `lasttime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `postremarks` int(255) NULL DEFAULT 0,
  PRIMARY KEY (`postid`) USING BTREE,
  INDEX `postuser`(`postuser`) USING BTREE,
  INDEX `posttitle`(`posttitle`) USING BTREE,
  CONSTRAINT `postuser` FOREIGN KEY (`postuser`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 15479 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for remarks
-- ----------------------------
DROP TABLE IF EXISTS `remarks`;
CREATE TABLE `remarks`  (
  `remarksid` int(11) NOT NULL AUTO_INCREMENT,
  `remarkspostid` int(11) NOT NULL,
  `remarksuser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remarkstext` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remarkstime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`remarksid`) USING BTREE,
  INDEX `remarksuser`(`remarksuser`) USING BTREE,
  INDEX `remarkspostid`(`remarkspostid`) USING BTREE,
  CONSTRAINT `remarkspostid` FOREIGN KEY (`remarkspostid`) REFERENCES `post` (`postid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `root` int(255) NULL DEFAULT 0,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
