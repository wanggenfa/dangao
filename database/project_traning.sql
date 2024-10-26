/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : localhost:3306
 Source Schema         : project_traning

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 20/11/2021 18:14:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for class_know
-- ----------------------------
DROP TABLE IF EXISTS `class_know`;
CREATE TABLE `class_know`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `schedule_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `schedule_id`(`schedule_id`) USING BTREE,
  CONSTRAINT `class_know_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class_know
-- ----------------------------
INSERT INTO `class_know` VALUES (1, '要讲武德，耗子尾汁', 3);
INSERT INTO `class_know` VALUES (2, '一定要好好学习', 4);
INSERT INTO `class_know` VALUES (3, '小米', NULL);

-- ----------------------------
-- Table structure for curricula_variable
-- ----------------------------
DROP TABLE IF EXISTS `curricula_variable`;
CREATE TABLE `curricula_variable`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule_id` int(11) NULL DEFAULT NULL,
  `student_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `schedule_id`(`schedule_id`) USING BTREE,
  INDEX `student_id`(`student_id`) USING BTREE,
  CONSTRAINT `curricula_variable_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `curricula_variable_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of curricula_variable
-- ----------------------------
INSERT INTO `curricula_variable` VALUES (1, 1, 1);
INSERT INTO `curricula_variable` VALUES (2, 3, 1);
INSERT INTO `curricula_variable` VALUES (3, 4, 1);

-- ----------------------------
-- Table structure for proficiency
-- ----------------------------
DROP TABLE IF EXISTS `proficiency`;
CREATE TABLE `proficiency`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proficiency` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `estimate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `class_know_id` int(11) NULL DEFAULT NULL,
  `student_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `class_know_id`(`class_know_id`) USING BTREE,
  INDEX `student_id`(`student_id`) USING BTREE,
  CONSTRAINT `proficiency_ibfk_1` FOREIGN KEY (`class_know_id`) REFERENCES `class_know` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `proficiency_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of proficiency
-- ----------------------------
INSERT INTO `proficiency` VALUES (1, '基本掌握', '应该是年轻人要讲武德', 1, 1);

-- ----------------------------
-- Table structure for root
-- ----------------------------
DROP TABLE IF EXISTS `root`;
CREATE TABLE `root`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(11) NOT NULL,
  `name` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of root
-- ----------------------------
INSERT INTO `root` VALUES (1, 123, '王老师', '123');
INSERT INTO `root` VALUES (2, 234, '李老师', '234');

-- ----------------------------
-- Table structure for schedule
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `major` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `classes` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `college` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacher_id` int(11) NULL DEFAULT NULL,
  `grade` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `random_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trem` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `teacher_id`(`teacher_id`) USING BTREE,
  INDEX `ix_schedule_trem`(`trem`) USING BTREE,
  CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule
-- ----------------------------
INSERT INTO `schedule` VALUES (1, '小米', '高数', '理工', '计算机', 1, '90', '123', '2020-11-29');
INSERT INTO `schedule` VALUES (3, '计算机科学技术', '物联网工程', '1', '计算机工程技术学院', 1, '2020', '179972', '2020-11-29');
INSERT INTO `schedule` VALUES (4, '物联网', '物联网工程', '1', '计算机工程技术学院', 1, '2020', '350007', '2020-11-29');
INSERT INTO `schedule` VALUES (5, '要讲武德，耗子尾汁', '计算机科学', '1', '计算机工程技术学院', 1, '2020', '455977', '2020-11-30');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(11) NOT NULL,
  `name` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `major` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `grade` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `college` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `num`(`num`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, 111, '小米', '什么', '90', '计算机', '123');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(11) NOT NULL,
  `name` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `college` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_root` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `num`(`num`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, 222, '老王', '计算机', '123', 1);
INSERT INTO `teacher` VALUES (2, 333, '老李', '外国语', '123', 0);

-- ----------------------------
-- Table structure for tmp_curricula
-- ----------------------------
DROP TABLE IF EXISTS `tmp_curricula`;
CREATE TABLE `tmp_curricula`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule_id` int(11) NULL DEFAULT NULL,
  `student_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `schedule_id`(`schedule_id`) USING BTREE,
  INDEX `student_id`(`student_id`) USING BTREE,
  CONSTRAINT `tmp_curricula_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `tmp_curricula_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tmp_curricula
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
