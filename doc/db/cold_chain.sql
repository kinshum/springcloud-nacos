/*
Navicat MySQL Data Transfer

Source Server         : 103
Source Server Version : 50725
Source Host           : 192.168.1.103:3306
Source Database       : cold_chain

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-08-09 16:31:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for file_info
-- ----------------------------
DROP TABLE IF EXISTS `file_info`;
CREATE TABLE `file_info` (
  `id` varchar(32) NOT NULL COMMENT '文件md5',
  `contentType` varchar(128) NOT NULL,
  `size` int(11) NOT NULL,
  `path` varchar(255) NOT NULL COMMENT '物理路径',
  `url` varchar(1024) NOT NULL,
  `type` int(1) NOT NULL,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of file_info
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_NAME` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_GROUP` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `CALENDAR_NAME` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_NAME` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_GROUP` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `CRON_EXPRESSION` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `TIME_ZONE_ID` varchar(80) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `ENTRY_ID` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_NAME` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_GROUP` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `INSTANCE_NAME` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) COLLATE utf8mb4_bin NOT NULL,
  `JOB_NAME` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `JOB_GROUP` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `JOB_NAME` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `JOB_GROUP` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPTION` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `IS_DURABLE` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `IS_NONCONCURRENT` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `IS_UPDATE_DATA` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `LOCK_NAME` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('adminQuartzScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('adminQuartzScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_GROUP` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `INSTANCE_NAME` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('adminQuartzScheduler', 'DESKTOP-PJ2GTFK1565336211556', '1565339513798', '15000');
INSERT INTO `qrtz_scheduler_state` VALUES ('adminQuartzScheduler', 'DESKTOP-U8JCM5C1565339411366', '1565339518741', '15000');
INSERT INTO `qrtz_scheduler_state` VALUES ('adminQuartzScheduler', 'fs01.ikats.com1565320611509', '1565339516458', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_NAME` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_GROUP` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_NAME` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_GROUP` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `STR_PROP_1` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL,
  `STR_PROP_2` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL,
  `STR_PROP_3` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_NAME` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_GROUP` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `JOB_NAME` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `JOB_GROUP` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPTION` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_TYPE` varchar(8) COLLATE utf8mb4_bin NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logs
-- ----------------------------
DROP TABLE IF EXISTS `sys_logs`;
CREATE TABLE `sys_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `module` varchar(50) DEFAULT NULL COMMENT '模块名',
  `flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '成功失败',
  `remark` text COMMENT '备注',
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `createTime` (`createTime`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_logs
-- ----------------------------
INSERT INTO `sys_logs` VALUES ('1', '1', '登陆', '1', null, '2019-08-03 01:37:53');
INSERT INTO `sys_logs` VALUES ('2', '1', '退出', '1', null, '2019-08-03 01:41:41');
INSERT INTO `sys_logs` VALUES ('3', '1', '登陆', '1', null, '2019-08-03 01:41:54');
INSERT INTO `sys_logs` VALUES ('4', '1', '退出', '1', null, '2019-08-03 01:42:06');
INSERT INTO `sys_logs` VALUES ('5', '1', '登陆', '1', null, '2019-08-03 01:51:30');
INSERT INTO `sys_logs` VALUES ('6', '1', '登陆', '1', null, '2019-08-03 02:20:18');
INSERT INTO `sys_logs` VALUES ('7', '1', '登陆', '1', null, '2019-08-03 02:27:48');
INSERT INTO `sys_logs` VALUES ('8', '1', '登陆', '1', null, '2019-08-03 02:28:10');
INSERT INTO `sys_logs` VALUES ('9', '1', '登陆', '1', null, '2019-08-03 03:03:38');
INSERT INTO `sys_logs` VALUES ('10', '1', '登陆', '1', null, '2019-08-03 03:25:50');
INSERT INTO `sys_logs` VALUES ('11', '1', '登陆', '1', null, '2019-08-03 03:26:43');
INSERT INTO `sys_logs` VALUES ('12', '1', '登陆', '1', null, '2019-08-03 03:34:25');
INSERT INTO `sys_logs` VALUES ('13', '1', '登陆', '1', null, '2019-08-03 03:40:30');
INSERT INTO `sys_logs` VALUES ('14', '1', '登陆', '1', null, '2019-08-03 04:47:14');
INSERT INTO `sys_logs` VALUES ('15', '1', '登陆', '1', null, '2019-08-03 04:51:42');
INSERT INTO `sys_logs` VALUES ('16', '1', '退出', '1', null, '2019-08-03 04:55:08');
INSERT INTO `sys_logs` VALUES ('17', '1', '登陆', '1', null, '2019-08-03 04:55:25');
INSERT INTO `sys_logs` VALUES ('18', '1', '登陆', '1', null, '2019-08-03 04:58:41');
INSERT INTO `sys_logs` VALUES ('19', '1', '登陆', '1', null, '2019-08-03 04:59:32');
INSERT INTO `sys_logs` VALUES ('20', '1', '登陆', '1', null, '2019-08-03 05:03:36');
INSERT INTO `sys_logs` VALUES ('21', '1', '登陆', '1', null, '2019-08-03 05:04:12');
INSERT INTO `sys_logs` VALUES ('22', '1', '登陆', '1', null, '2019-08-03 05:19:06');
INSERT INTO `sys_logs` VALUES ('23', '1', '登陆', '1', null, '2019-08-03 05:28:59');
INSERT INTO `sys_logs` VALUES ('24', '1', '登陆', '1', null, '2019-08-03 05:29:05');
INSERT INTO `sys_logs` VALUES ('25', '1', '登陆', '1', null, '2019-08-03 05:29:07');
INSERT INTO `sys_logs` VALUES ('26', '1', '登陆', '1', null, '2019-08-03 05:49:37');
INSERT INTO `sys_logs` VALUES ('27', '1', '登陆', '1', null, '2019-08-03 05:50:49');
INSERT INTO `sys_logs` VALUES ('28', '1', '登陆', '1', null, '2019-08-03 05:51:05');
INSERT INTO `sys_logs` VALUES ('29', '1', '登陆', '1', null, '2019-08-03 05:54:29');
INSERT INTO `sys_logs` VALUES ('30', '1', '登陆', '1', null, '2019-08-05 19:47:29');
INSERT INTO `sys_logs` VALUES ('31', '1', '登陆', '1', null, '2019-08-05 20:17:43');
INSERT INTO `sys_logs` VALUES ('32', '1', '登陆', '1', null, '2019-08-05 20:19:23');
INSERT INTO `sys_logs` VALUES ('33', '1', '登陆', '1', null, '2019-08-05 20:21:43');
INSERT INTO `sys_logs` VALUES ('34', '1', '登陆', '1', null, '2019-08-05 20:50:11');
INSERT INTO `sys_logs` VALUES ('35', '1', '登陆', '1', null, '2019-08-05 22:21:25');
INSERT INTO `sys_logs` VALUES ('36', '1', '登陆', '1', null, '2019-08-05 22:32:41');
INSERT INTO `sys_logs` VALUES ('37', '1', '登陆', '1', null, '2019-08-05 22:35:04');
INSERT INTO `sys_logs` VALUES ('38', '1', '登陆', '1', null, '2019-08-05 22:35:08');
INSERT INTO `sys_logs` VALUES ('39', '1', '登陆', '1', null, '2019-08-05 22:35:40');
INSERT INTO `sys_logs` VALUES ('40', '1', '登陆', '1', null, '2019-08-05 22:43:40');
INSERT INTO `sys_logs` VALUES ('41', '1', '登陆', '1', null, '2019-08-05 22:48:21');
INSERT INTO `sys_logs` VALUES ('42', '1', '登陆', '1', null, '2019-08-06 00:40:32');
INSERT INTO `sys_logs` VALUES ('43', '1', '登陆', '1', null, '2019-08-06 00:42:11');
INSERT INTO `sys_logs` VALUES ('44', '1', '登陆', '1', null, '2019-08-06 01:19:18');
INSERT INTO `sys_logs` VALUES ('45', '1', '登陆', '1', null, '2019-08-06 01:23:52');
INSERT INTO `sys_logs` VALUES ('46', '1', '登陆', '1', null, '2019-08-06 01:26:11');
INSERT INTO `sys_logs` VALUES ('47', '1', '登陆', '1', null, '2019-08-06 01:27:36');
INSERT INTO `sys_logs` VALUES ('48', '1', '登陆', '1', null, '2019-08-06 01:31:07');
INSERT INTO `sys_logs` VALUES ('49', '1', '登陆', '1', null, '2019-08-06 02:24:33');
INSERT INTO `sys_logs` VALUES ('50', '1', '登陆', '1', null, '2019-08-06 02:29:59');
INSERT INTO `sys_logs` VALUES ('51', '1', '登陆', '1', null, '2019-08-06 02:36:43');
INSERT INTO `sys_logs` VALUES ('52', '1', '登陆', '1', null, '2019-08-06 02:44:09');
INSERT INTO `sys_logs` VALUES ('53', '1', '登陆', '1', null, '2019-08-06 02:55:30');
INSERT INTO `sys_logs` VALUES ('54', '1', '登陆', '1', null, '2019-08-06 02:58:00');
INSERT INTO `sys_logs` VALUES ('55', '1', '登陆', '1', null, '2019-08-06 04:22:12');
INSERT INTO `sys_logs` VALUES ('56', '1', '登陆', '1', null, '2019-08-06 04:33:40');
INSERT INTO `sys_logs` VALUES ('57', '1', '登陆', '1', null, '2019-08-06 05:16:59');
INSERT INTO `sys_logs` VALUES ('58', '1', '登陆', '1', null, '2019-08-06 05:17:15');
INSERT INTO `sys_logs` VALUES ('59', '1', '登陆', '1', null, '2019-08-06 05:17:58');
INSERT INTO `sys_logs` VALUES ('60', '1', '登陆', '1', null, '2019-08-06 05:38:17');
INSERT INTO `sys_logs` VALUES ('61', '1', '登陆', '1', null, '2019-08-06 05:38:27');
INSERT INTO `sys_logs` VALUES ('62', '1', '登陆', '1', null, '2019-08-06 05:59:05');
INSERT INTO `sys_logs` VALUES ('63', '1', '登陆', '1', null, '2019-08-06 06:03:20');
INSERT INTO `sys_logs` VALUES ('64', '1', '登陆', '1', null, '2019-08-06 18:21:32');
INSERT INTO `sys_logs` VALUES ('65', '1', '登陆', '1', null, '2019-08-06 18:28:03');
INSERT INTO `sys_logs` VALUES ('66', '1', '登陆', '1', null, '2019-08-06 19:42:05');
INSERT INTO `sys_logs` VALUES ('67', '1', '登陆', '1', null, '2019-08-06 21:18:35');
INSERT INTO `sys_logs` VALUES ('68', '1', '登陆', '1', null, '2019-08-06 21:41:19');
INSERT INTO `sys_logs` VALUES ('69', '1', '登陆', '1', null, '2019-08-07 00:02:19');
INSERT INTO `sys_logs` VALUES ('70', '1', '登陆', '1', null, '2019-08-07 00:02:42');
INSERT INTO `sys_logs` VALUES ('71', '1', '登陆', '1', null, '2019-08-07 00:04:13');
INSERT INTO `sys_logs` VALUES ('72', '1', '登陆', '1', null, '2019-08-07 00:05:33');
INSERT INTO `sys_logs` VALUES ('73', '1', '登陆', '1', null, '2019-08-07 00:07:17');
INSERT INTO `sys_logs` VALUES ('74', '1', '登陆', '1', null, '2019-08-07 00:28:45');
INSERT INTO `sys_logs` VALUES ('75', '1', '登陆', '1', null, '2019-08-07 00:29:13');
INSERT INTO `sys_logs` VALUES ('76', '1', '登陆', '1', null, '2019-08-07 00:30:07');
INSERT INTO `sys_logs` VALUES ('77', '1', '登陆', '1', null, '2019-08-07 00:32:56');
INSERT INTO `sys_logs` VALUES ('78', '1', '登陆', '1', null, '2019-08-07 00:40:37');
INSERT INTO `sys_logs` VALUES ('79', '1', '登陆', '1', null, '2019-08-07 00:49:19');
INSERT INTO `sys_logs` VALUES ('80', '1', '登陆', '1', null, '2019-08-07 00:49:40');
INSERT INTO `sys_logs` VALUES ('81', '1', '登陆', '1', null, '2019-08-07 00:50:07');
INSERT INTO `sys_logs` VALUES ('82', '1', '登陆', '1', null, '2019-08-07 00:53:37');
INSERT INTO `sys_logs` VALUES ('83', '1', '登陆', '1', null, '2019-08-07 01:18:55');
INSERT INTO `sys_logs` VALUES ('84', '1', '登陆', '1', null, '2019-08-07 01:19:17');
INSERT INTO `sys_logs` VALUES ('85', '1', '登陆', '1', null, '2019-08-07 03:05:10');
INSERT INTO `sys_logs` VALUES ('86', '1', '登陆', '1', null, '2019-08-07 03:08:34');
INSERT INTO `sys_logs` VALUES ('87', '1', '登陆', '1', null, '2019-08-07 03:13:46');
INSERT INTO `sys_logs` VALUES ('88', '1', '登陆', '1', null, '2019-08-07 03:16:10');
INSERT INTO `sys_logs` VALUES ('89', '1', '登陆', '1', null, '2019-08-07 03:17:04');
INSERT INTO `sys_logs` VALUES ('90', '1', '登陆', '1', null, '2019-08-07 03:27:36');
INSERT INTO `sys_logs` VALUES ('91', '1', '登陆', '1', null, '2019-08-07 03:28:33');
INSERT INTO `sys_logs` VALUES ('92', '1', '登陆', '1', null, '2019-08-07 03:28:51');
INSERT INTO `sys_logs` VALUES ('93', '1', '登陆', '1', null, '2019-08-07 03:30:23');
INSERT INTO `sys_logs` VALUES ('94', '1', '登陆', '1', null, '2019-08-07 03:36:55');
INSERT INTO `sys_logs` VALUES ('95', '1', '登陆', '1', null, '2019-08-07 03:38:49');
INSERT INTO `sys_logs` VALUES ('96', '1', '登陆', '1', null, '2019-08-07 03:39:02');
INSERT INTO `sys_logs` VALUES ('97', '1', '登陆', '1', null, '2019-08-07 03:39:32');
INSERT INTO `sys_logs` VALUES ('98', '1', '登陆', '1', null, '2019-08-07 03:43:34');
INSERT INTO `sys_logs` VALUES ('99', '1', '登陆', '1', null, '2019-08-07 04:24:08');
INSERT INTO `sys_logs` VALUES ('100', '1', '登陆', '1', null, '2019-08-07 04:26:37');
INSERT INTO `sys_logs` VALUES ('101', '1', '登陆', '1', null, '2019-08-07 04:28:10');
INSERT INTO `sys_logs` VALUES ('102', '1', '登陆', '1', null, '2019-08-07 04:29:38');
INSERT INTO `sys_logs` VALUES ('103', '1', '登陆', '1', null, '2019-08-07 04:29:55');
INSERT INTO `sys_logs` VALUES ('104', '1', '登陆', '1', null, '2019-08-07 04:30:20');
INSERT INTO `sys_logs` VALUES ('105', '1', '登陆', '1', null, '2019-08-07 05:41:10');
INSERT INTO `sys_logs` VALUES ('106', '1', '登陆', '1', null, '2019-08-07 05:42:01');
INSERT INTO `sys_logs` VALUES ('107', '1', '登陆', '1', null, '2019-08-07 05:54:39');
INSERT INTO `sys_logs` VALUES ('108', '1', '登陆', '1', null, '2019-08-07 06:01:11');
INSERT INTO `sys_logs` VALUES ('109', '1', '登陆', '1', null, '2019-08-07 19:10:37');
INSERT INTO `sys_logs` VALUES ('110', '1', '登陆', '1', null, '2019-08-07 19:28:51');
INSERT INTO `sys_logs` VALUES ('111', '1', '登陆', '1', null, '2019-08-07 23:53:17');
INSERT INTO `sys_logs` VALUES ('112', '1', '登陆', '1', null, '2019-08-08 00:02:07');
INSERT INTO `sys_logs` VALUES ('113', '1', '登陆', '1', null, '2019-08-08 00:13:12');
INSERT INTO `sys_logs` VALUES ('114', '1', '登陆', '1', null, '2019-08-07 16:44:00');
INSERT INTO `sys_logs` VALUES ('115', '1', '登陆', '1', null, '2019-08-07 18:37:13');
INSERT INTO `sys_logs` VALUES ('116', '1', '登陆', '1', null, '2019-08-08 09:39:51');
INSERT INTO `sys_logs` VALUES ('117', '1', '登陆', '1', null, '2019-08-08 09:40:04');
INSERT INTO `sys_logs` VALUES ('118', '1', '登陆', '1', null, '2019-08-08 09:46:01');
INSERT INTO `sys_logs` VALUES ('119', '1', '登陆', '1', null, '2019-08-08 09:49:08');
INSERT INTO `sys_logs` VALUES ('120', '1', '登陆', '1', null, '2019-08-08 10:07:16');
INSERT INTO `sys_logs` VALUES ('121', '1', '登陆', '1', null, '2019-08-08 10:09:44');
INSERT INTO `sys_logs` VALUES ('122', '1', '登陆', '1', null, '2019-08-08 11:26:50');
INSERT INTO `sys_logs` VALUES ('123', '1', '登陆', '1', null, '2019-08-08 12:12:05');
INSERT INTO `sys_logs` VALUES ('124', '1', '登陆', '1', null, '2019-08-08 12:13:21');
INSERT INTO `sys_logs` VALUES ('125', '1', '登陆', '1', null, '2019-08-08 12:14:07');
INSERT INTO `sys_logs` VALUES ('126', '1', '登陆', '1', null, '2019-08-08 12:33:38');
INSERT INTO `sys_logs` VALUES ('127', '1', '登陆', '1', null, '2019-08-08 13:57:49');
INSERT INTO `sys_logs` VALUES ('128', '1', '登陆', '1', null, '2019-08-08 14:55:49');
INSERT INTO `sys_logs` VALUES ('129', '1', '登陆', '1', null, '2019-08-08 16:52:31');
INSERT INTO `sys_logs` VALUES ('130', '1', '登陆', '1', null, '2019-08-08 16:53:00');
INSERT INTO `sys_logs` VALUES ('131', '1', '登陆', '1', null, '2019-08-08 16:54:23');
INSERT INTO `sys_logs` VALUES ('132', '1', '登陆', '1', null, '2019-08-08 16:58:36');
INSERT INTO `sys_logs` VALUES ('133', '1', '登陆', '1', null, '2019-08-08 17:38:14');
INSERT INTO `sys_logs` VALUES ('134', '1', '登陆', '1', null, '2019-08-08 18:11:21');
INSERT INTO `sys_logs` VALUES ('135', '1', '登陆', '1', null, '2019-08-08 19:09:55');
INSERT INTO `sys_logs` VALUES ('136', '1', '登陆', '1', null, '2019-08-09 09:53:12');
INSERT INTO `sys_logs` VALUES ('137', '1', '登陆', '1', null, '2019-08-09 09:57:13');
INSERT INTO `sys_logs` VALUES ('138', '1', '登陆', '1', null, '2019-08-09 09:57:51');
INSERT INTO `sys_logs` VALUES ('139', '1', '登陆', '1', null, '2019-08-09 10:12:43');
INSERT INTO `sys_logs` VALUES ('140', '1', '登陆', '1', null, '2019-08-09 10:17:28');
INSERT INTO `sys_logs` VALUES ('141', '1', '登陆', '1', null, '2019-08-09 10:23:40');
INSERT INTO `sys_logs` VALUES ('142', '1', '登陆', '1', null, '2019-08-09 10:24:49');
INSERT INTO `sys_logs` VALUES ('143', '1', '登陆', '1', null, '2019-08-09 10:28:01');
INSERT INTO `sys_logs` VALUES ('144', '1', '登陆', '1', null, '2019-08-09 10:29:03');
INSERT INTO `sys_logs` VALUES ('145', '1', '登陆', '1', null, '2019-08-09 10:53:29');
INSERT INTO `sys_logs` VALUES ('146', '1', '登陆', '1', null, '2019-08-09 10:55:56');
INSERT INTO `sys_logs` VALUES ('147', '1', '登陆', '1', null, '2019-08-09 12:02:35');
INSERT INTO `sys_logs` VALUES ('148', '1', '登陆', '1', null, '2019-08-09 13:35:08');
INSERT INTO `sys_logs` VALUES ('149', '1', '登陆', '1', null, '2019-08-09 13:36:40');
INSERT INTO `sys_logs` VALUES ('150', '1', '登陆', '1', null, '2019-08-09 13:38:03');
INSERT INTO `sys_logs` VALUES ('151', '1', '登陆', '1', null, '2019-08-09 13:39:30');
INSERT INTO `sys_logs` VALUES ('152', '1', '登陆', '1', null, '2019-08-09 14:09:51');
INSERT INTO `sys_logs` VALUES ('153', '1', '登陆', '1', null, '2019-08-09 14:15:31');
INSERT INTO `sys_logs` VALUES ('154', '1', '登陆', '1', null, '2019-08-09 15:38:56');
INSERT INTO `sys_logs` VALUES ('155', '1', '登陆', '1', null, '2019-08-09 15:40:09');
INSERT INTO `sys_logs` VALUES ('156', '1', '登陆', '1', null, '2019-08-09 15:42:27');
INSERT INTO `sys_logs` VALUES ('157', '1', '登陆', '1', null, '2019-08-09 15:47:38');

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `css` varchar(30) DEFAULT NULL,
  `href` varchar(1000) DEFAULT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1:资源2:按钮',
  `permission` varchar(50) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('1', '0', '用户管理', 'fa-users', '', '1', '', '1');
INSERT INTO `sys_permission` VALUES ('2', '1', '账户管理', 'fa-user', '/Frame/User', '1', '', '2');
INSERT INTO `sys_permission` VALUES ('3', '2', '查询', '', '', '2', 'sys:user:query', '100');
INSERT INTO `sys_permission` VALUES ('4', '2', '添加', '', '', '2', 'sys:user:add', '100');
INSERT INTO `sys_permission` VALUES ('42', '2', '编辑', null, null, '2', 'sys:user:edit', '100');
INSERT INTO `sys_permission` VALUES ('43', '1', '角色管理', 'fa-user', '/Frame/Role', '1', null, '3');
INSERT INTO `sys_permission` VALUES ('44', '43', '查询', null, null, '2', 'sys:role:query', '100');
INSERT INTO `sys_permission` VALUES ('45', '43', '添加', null, null, '2', 'sys:role:add', '100');
INSERT INTO `sys_permission` VALUES ('46', '43', '编辑', null, null, '2', 'sys:role:edit', '100');
INSERT INTO `sys_permission` VALUES ('47', '43', '删除', null, null, '2', 'sys:role:del', '100');
INSERT INTO `sys_permission` VALUES ('48', '0', '设备管理', 'fa-users', null, '1', null, '4');
INSERT INTO `sys_permission` VALUES ('49', '48', '供应商管理', null, '/Frame/Supplier', '1', null, '5');
INSERT INTO `sys_permission` VALUES ('50', '48', '设备维护', null, '/Frame/Capital', '1', null, '6');
INSERT INTO `sys_permission` VALUES ('51', '50', '添加', null, '', '2', 'sys:equipment:add', '100');
INSERT INTO `sys_permission` VALUES ('52', '50', '编辑', null, null, '2', 'sys:equipment:edit', '100');
INSERT INTO `sys_permission` VALUES ('53', '50', '查询', null, null, '2', 'sys:equipment:query', '100');
INSERT INTO `sys_permission` VALUES ('54', '50', '删除', null, null, '2', 'sys:equipment:del', '100');
INSERT INTO `sys_permission` VALUES ('55', '49', '查询', null, null, '2', 'sys:supplier:query', '100');
INSERT INTO `sys_permission` VALUES ('56', '49', '编辑', null, null, '2', 'sys:supplier:edit', '100');
INSERT INTO `sys_permission` VALUES ('57', '49', '删除', null, null, '2', 'sys:supplier:del', '100');
INSERT INTO `sys_permission` VALUES ('58', '49', '添加', null, null, '2', 'sys:supplier:add', '100');
INSERT INTO `sys_permission` VALUES ('59', '50', '导出', null, null, '2', 'sys:equipment:export', '100');
INSERT INTO `sys_permission` VALUES ('60', '0', '业务管理', 'fa-users', '', '1', '', '7');
INSERT INTO `sys_permission` VALUES ('61', '60', '主数据管理', 'fa-user', '', '1', '', '8');
INSERT INTO `sys_permission` VALUES ('62', '61', '货主管理', 'fa-user', '/Frame/CargoOwner', '1', '', '9');
INSERT INTO `sys_permission` VALUES ('63', '62', '查询', null, null, '2', 'sys:cargoowner:query', '100');
INSERT INTO `sys_permission` VALUES ('64', '62', '编辑', null, null, '2', 'sys:cargoowner:edit', '100');
INSERT INTO `sys_permission` VALUES ('65', '62', '删除', null, null, '2', 'sys:cargoowner:del', '100');
INSERT INTO `sys_permission` VALUES ('66', '62', '添加', null, null, '2', 'sys:cargoowner:add', '100');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'ADMIN', '管理员', '2017-05-01 13:25:39', '2017-10-05 21:59:18');
INSERT INTO `sys_role` VALUES ('2', 'USER', '', '2017-08-01 21:47:31', '2017-10-05 21:59:26');
INSERT INTO `sys_role` VALUES ('3', '供应商', null, '2019-08-06 20:18:04', '2019-08-06 20:18:04');
INSERT INTO `sys_role` VALUES ('4', '供应商1', null, '2019-08-06 20:18:30', '2019-08-06 20:18:30');
INSERT INTO `sys_role` VALUES ('5', '角色1', null, '2019-08-06 20:23:47', '2019-08-06 20:23:47');
INSERT INTO `sys_role` VALUES ('6', '角色2', null, '2019-08-06 20:25:18', '2019-08-06 20:25:18');
INSERT INTO `sys_role` VALUES ('7', '供应商2', null, '2019-08-06 20:38:56', '2019-08-06 20:38:56');
INSERT INTO `sys_role` VALUES ('8', '111', null, '2019-08-06 23:16:58', '2019-08-06 23:16:58');
INSERT INTO `sys_role` VALUES ('9', '222', null, '2019-08-06 23:19:46', '2019-08-06 23:19:46');
INSERT INTO `sys_role` VALUES ('10', '33', null, '2019-08-06 23:31:17', '2019-08-06 23:31:17');
INSERT INTO `sys_role` VALUES ('11', '333', null, '2019-08-06 23:32:40', '2019-08-06 23:32:40');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `roleId` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  PRIMARY KEY (`roleId`,`permissionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('1', '1');
INSERT INTO `sys_role_permission` VALUES ('1', '2');
INSERT INTO `sys_role_permission` VALUES ('1', '3');
INSERT INTO `sys_role_permission` VALUES ('1', '4');
INSERT INTO `sys_role_permission` VALUES ('1', '6');
INSERT INTO `sys_role_permission` VALUES ('1', '7');
INSERT INTO `sys_role_permission` VALUES ('1', '8');
INSERT INTO `sys_role_permission` VALUES ('1', '9');
INSERT INTO `sys_role_permission` VALUES ('1', '10');
INSERT INTO `sys_role_permission` VALUES ('1', '11');
INSERT INTO `sys_role_permission` VALUES ('1', '12');
INSERT INTO `sys_role_permission` VALUES ('1', '13');
INSERT INTO `sys_role_permission` VALUES ('1', '14');
INSERT INTO `sys_role_permission` VALUES ('1', '15');
INSERT INTO `sys_role_permission` VALUES ('1', '16');
INSERT INTO `sys_role_permission` VALUES ('1', '17');
INSERT INTO `sys_role_permission` VALUES ('1', '18');
INSERT INTO `sys_role_permission` VALUES ('1', '19');
INSERT INTO `sys_role_permission` VALUES ('1', '20');
INSERT INTO `sys_role_permission` VALUES ('1', '21');
INSERT INTO `sys_role_permission` VALUES ('1', '22');
INSERT INTO `sys_role_permission` VALUES ('1', '23');
INSERT INTO `sys_role_permission` VALUES ('1', '24');
INSERT INTO `sys_role_permission` VALUES ('1', '25');
INSERT INTO `sys_role_permission` VALUES ('1', '26');
INSERT INTO `sys_role_permission` VALUES ('1', '27');
INSERT INTO `sys_role_permission` VALUES ('1', '28');
INSERT INTO `sys_role_permission` VALUES ('1', '29');
INSERT INTO `sys_role_permission` VALUES ('1', '30');
INSERT INTO `sys_role_permission` VALUES ('1', '31');
INSERT INTO `sys_role_permission` VALUES ('1', '32');
INSERT INTO `sys_role_permission` VALUES ('1', '33');
INSERT INTO `sys_role_permission` VALUES ('1', '34');
INSERT INTO `sys_role_permission` VALUES ('1', '35');
INSERT INTO `sys_role_permission` VALUES ('1', '36');
INSERT INTO `sys_role_permission` VALUES ('1', '37');
INSERT INTO `sys_role_permission` VALUES ('1', '38');
INSERT INTO `sys_role_permission` VALUES ('1', '39');
INSERT INTO `sys_role_permission` VALUES ('1', '40');
INSERT INTO `sys_role_permission` VALUES ('1', '60');
INSERT INTO `sys_role_permission` VALUES ('1', '61');
INSERT INTO `sys_role_permission` VALUES ('1', '62');
INSERT INTO `sys_role_permission` VALUES ('1', '63');
INSERT INTO `sys_role_permission` VALUES ('1', '64');
INSERT INTO `sys_role_permission` VALUES ('1', '65');
INSERT INTO `sys_role_permission` VALUES ('1', '66');
INSERT INTO `sys_role_permission` VALUES ('2', '1');
INSERT INTO `sys_role_permission` VALUES ('2', '2');
INSERT INTO `sys_role_permission` VALUES ('2', '3');
INSERT INTO `sys_role_permission` VALUES ('2', '4');
INSERT INTO `sys_role_permission` VALUES ('2', '6');
INSERT INTO `sys_role_permission` VALUES ('2', '7');
INSERT INTO `sys_role_permission` VALUES ('2', '8');
INSERT INTO `sys_role_permission` VALUES ('2', '9');
INSERT INTO `sys_role_permission` VALUES ('2', '10');
INSERT INTO `sys_role_permission` VALUES ('2', '11');
INSERT INTO `sys_role_permission` VALUES ('2', '12');
INSERT INTO `sys_role_permission` VALUES ('2', '13');
INSERT INTO `sys_role_permission` VALUES ('2', '14');
INSERT INTO `sys_role_permission` VALUES ('2', '15');
INSERT INTO `sys_role_permission` VALUES ('2', '16');
INSERT INTO `sys_role_permission` VALUES ('2', '17');
INSERT INTO `sys_role_permission` VALUES ('2', '18');
INSERT INTO `sys_role_permission` VALUES ('2', '19');
INSERT INTO `sys_role_permission` VALUES ('2', '20');
INSERT INTO `sys_role_permission` VALUES ('2', '21');
INSERT INTO `sys_role_permission` VALUES ('2', '22');
INSERT INTO `sys_role_permission` VALUES ('2', '23');
INSERT INTO `sys_role_permission` VALUES ('2', '24');
INSERT INTO `sys_role_permission` VALUES ('2', '25');
INSERT INTO `sys_role_permission` VALUES ('2', '30');
INSERT INTO `sys_role_permission` VALUES ('2', '31');
INSERT INTO `sys_role_permission` VALUES ('2', '34');
INSERT INTO `sys_role_permission` VALUES ('2', '36');
INSERT INTO `sys_role_permission` VALUES ('3', '1');
INSERT INTO `sys_role_permission` VALUES ('3', '2');
INSERT INTO `sys_role_permission` VALUES ('4', '1');
INSERT INTO `sys_role_permission` VALUES ('4', '2');
INSERT INTO `sys_role_permission` VALUES ('5', '8');
INSERT INTO `sys_role_permission` VALUES ('5', '9');
INSERT INTO `sys_role_permission` VALUES ('6', '9');
INSERT INTO `sys_role_permission` VALUES ('6', '10');
INSERT INTO `sys_role_permission` VALUES ('7', '1');
INSERT INTO `sys_role_permission` VALUES ('7', '2');
INSERT INTO `sys_role_permission` VALUES ('8', '4');
INSERT INTO `sys_role_permission` VALUES ('8', '6');
INSERT INTO `sys_role_permission` VALUES ('9', '9');
INSERT INTO `sys_role_permission` VALUES ('9', '10');
INSERT INTO `sys_role_permission` VALUES ('9', '11');
INSERT INTO `sys_role_permission` VALUES ('10', '10');
INSERT INTO `sys_role_permission` VALUES ('10', '11');
INSERT INTO `sys_role_permission` VALUES ('11', '1');
INSERT INTO `sys_role_permission` VALUES ('11', '2');

-- ----------------------------
-- Table structure for sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user` (
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------
INSERT INTO `sys_role_user` VALUES ('1', '1');
INSERT INTO `sys_role_user` VALUES ('2', '2');
INSERT INTO `sys_role_user` VALUES ('3', '1');
INSERT INTO `sys_role_user` VALUES ('4', '3');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(60) NOT NULL COMMENT '密码',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称',
  `headImgUrl` varchar(255) DEFAULT NULL COMMENT '头像地址',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号',
  `telephone` varchar(30) DEFAULT NULL COMMENT '电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `security` varchar(50) DEFAULT NULL COMMENT '公共接口安全参数security',
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '$2a$10$iYM/H7TrSaLs7XyIWQdGwe1xf4cdmt3nwMja6RT0wxG5YY1RjN0EK', '管理员', null, '', '', '', '1998-07-01', '0', '1', '1', '2017-04-10 15:21:38', '2017-07-06 09:20:19');
INSERT INTO `sys_user` VALUES ('2', 'user', '$2a$10$ooGb4wjT7Hg3zgU2RhZp6eVu3jvG29i/U4L6VRwiZZ4.DZ0OOEAHu', '用户', null, '', '', '', null, '1', '1', '1', '2017-08-01 21:47:18', '2017-08-01 21:47:18');
INSERT INTO `sys_user` VALUES ('3', 'shenjian@ikats.com', '$2a$10$HKZP487xalI8WTDLUugGpOX78.QnEMmiDtes76paSgE8kXOsznHkW', '管理员', null, '17610055555', '', 'shenjian@ikats.com', '2019-08-08', '1', '1', null, '2019-08-08 17:22:42', '2019-08-08 18:26:21');
INSERT INTO `sys_user` VALUES ('4', 'name', '$2a$10$Rvfv0Ocohhedpa70BVRhqewx8q5nrs0YXEFZ2krmmlc2Vu7N1eJIW', 'tian', null, '1', null, null, null, null, '1', null, '2019-08-08 19:56:18', '2019-08-08 19:56:18');

-- ----------------------------
-- Table structure for t_cargo_owner
-- ----------------------------
DROP TABLE IF EXISTS `t_cargo_owner`;
CREATE TABLE `t_cargo_owner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ownerCode` varchar(255) DEFAULT '' COMMENT '货主编码',
  `ownerName` varchar(255) DEFAULT '' COMMENT '货主名称',
  `status` int(1) DEFAULT '1' COMMENT '0不可用1可用',
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `createName` varchar(255) DEFAULT '' COMMENT '创建人',
  `updateName` varchar(255) DEFAULT '' COMMENT '更新人',
  `isDelete` varchar(255) DEFAULT '1' COMMENT '是否删除 1正常 0删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cargo_owner
-- ----------------------------
INSERT INTO `t_cargo_owner` VALUES ('28', 'ownercode1', 'ownername1', '1', '2019-08-08 17:17:55', '2019-08-08 17:18:49', 'admin', 'admin', '1');
INSERT INTO `t_cargo_owner` VALUES ('29', 'ownercode2', 'ownername2', '1', '2019-08-08 17:18:05', null, 'admin', '', '1');
INSERT INTO `t_cargo_owner` VALUES ('30', 'ownercode', 'ownername', '1', '2019-08-09 14:25:53', '2019-08-09 14:26:10', 'admin', 'admin', '0');

-- ----------------------------
-- Table structure for t_carriers
-- ----------------------------
DROP TABLE IF EXISTS `t_carriers`;
CREATE TABLE `t_carriers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carriersCode` varchar(255) DEFAULT '' COMMENT '货主编码',
  `carriersName` varchar(255) DEFAULT '' COMMENT '货主名称',
  `status` int(1) DEFAULT '1' COMMENT '0不可用1可用',
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `createName` varchar(255) DEFAULT '' COMMENT '创建人',
  `updateName` varchar(255) DEFAULT '' COMMENT '更新人',
  `isDelete` varchar(255) DEFAULT '1' COMMENT '是否删除 1正常 0删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_carriers
-- ----------------------------
INSERT INTO `t_carriers` VALUES ('4', 'carrierscode', 'carriersname', '1', '2019-08-09 16:19:11', null, 'admin', '', '1');

-- ----------------------------
-- Table structure for t_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_dict`;
CREATE TABLE `t_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(16) NOT NULL,
  `k` varchar(16) NOT NULL,
  `val` varchar(64) NOT NULL,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`,`k`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_dict
-- ----------------------------
INSERT INTO `t_dict` VALUES ('1', 'sex', '0', '女', '2017-11-17 09:58:24', '2017-11-18 14:21:05');
INSERT INTO `t_dict` VALUES ('2', 'sex', '1', '男', '2017-11-17 10:03:46', '2017-11-17 10:03:46');
INSERT INTO `t_dict` VALUES ('3', 'userStatus', '0', '无效', '2017-11-17 16:26:06', '2017-11-17 16:26:09');
INSERT INTO `t_dict` VALUES ('4', 'userStatus', '1', '正常', '2017-11-17 16:26:06', '2017-11-17 16:26:09');
INSERT INTO `t_dict` VALUES ('5', 'userStatus', '2', '锁定', '2017-11-17 16:26:06', '2017-11-17 16:26:09');
INSERT INTO `t_dict` VALUES ('6', 'noticeStatus', '0', '草稿', '2017-11-17 16:26:06', '2017-11-17 16:26:09');
INSERT INTO `t_dict` VALUES ('7', 'noticeStatus', '1', '发布', '2017-11-17 16:26:06', '2017-11-17 16:26:09');
INSERT INTO `t_dict` VALUES ('8', 'isRead', '0', '未读', '2017-11-17 16:26:06', '2017-11-17 16:26:09');
INSERT INTO `t_dict` VALUES ('9', 'isRead', '1', '已读', '2017-11-17 16:26:06', '2017-11-17 16:26:09');
INSERT INTO `t_dict` VALUES ('10', 'equipmentType', '1', '冷链车便携式记录仪', '2019-08-05 14:46:12', '2019-08-05 14:46:14');
INSERT INTO `t_dict` VALUES ('11', 'equipmentType', '2', '方舱', '2019-08-05 14:46:49', '2019-08-05 14:46:52');
INSERT INTO `t_dict` VALUES ('12', 'warehouse', '1', '北京仓库', '2019-08-05 14:57:11', '2019-08-05 14:57:14');
INSERT INTO `t_dict` VALUES ('13', 'warehouse', '2', '深圳仓库', '2019-08-05 14:57:23', '2019-08-05 14:57:25');
INSERT INTO `t_dict` VALUES ('14', 'warehouse', '3', '南京仓库', '2019-08-05 14:57:54', '2019-08-05 14:57:56');
INSERT INTO `t_dict` VALUES ('15', 'equipmentType', '3', '泡沫箱', '2019-08-07 13:05:07', '2019-08-07 13:05:09');
INSERT INTO `t_dict` VALUES ('16', 'equipmentStatus', '1', '入库待检', '2019-08-07 13:06:46', '2019-08-07 13:06:50');
INSERT INTO `t_dict` VALUES ('17', 'equipmentStatus', '2', '可用', '2019-08-07 13:06:59', '2019-08-07 13:07:02');
INSERT INTO `t_dict` VALUES ('18', 'equipmentStatus', '3', '报废', '2019-08-07 13:07:33', '2019-08-07 13:07:36');
INSERT INTO `t_dict` VALUES ('19', 'equipmentStatus', '4', '报修', '2019-08-07 13:07:56', '2019-08-07 13:07:58');

-- ----------------------------
-- Table structure for t_equipment
-- ----------------------------
DROP TABLE IF EXISTS `t_equipment`;
CREATE TABLE `t_equipment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) DEFAULT '' COMMENT '设备编号 例如:HD0001',
  `name` varchar(255) DEFAULT '' COMMENT '设备组名称',
  `supplierNumber` varchar(255) DEFAULT '' COMMENT '供应商名称',
  `createTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `createName` varchar(255) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updateName` varchar(255) DEFAULT NULL,
  `isDelete` varchar(255) DEFAULT '1' COMMENT '1正常0失败',
  `supplierName` varchar(255) DEFAULT '' COMMENT '供应商名称',
  `orgNumber` varchar(255) DEFAULT '' COMMENT '关联设备组id',
  `type` int(3) DEFAULT '1' COMMENT '箱子类型， 见t_dict表',
  `model` varchar(255) DEFAULT '' COMMENT '型号',
  `SN` varchar(255) DEFAULT NULL COMMENT 'SN编码',
  `warehouse` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT '1' COMMENT '设备状态',
  `isStart` int(1) DEFAULT '0' COMMENT '1启用0停用',
  `manufacturer` varchar(255) DEFAULT '' COMMENT '生产厂商',
  `productionDate` date DEFAULT NULL COMMENT '生产日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_equipment
-- ----------------------------
INSERT INTO `t_equipment` VALUES ('3', 'HD0001', '设备HD00012', '222222', '2019-08-08 16:05:47', null, '2019-08-08 16:05:47', 'admin', '0', '供应1', '111111', '3', 'h112', 'sn1212121212', '3', '2', '1', '北京电气1厂', '2016-05-05');
INSERT INTO `t_equipment` VALUES ('4', 'HD0003', '设备1', '111111', '2019-08-08 16:06:57', null, '2019-08-08 16:06:57', null, '0', '供应1', '111111', '1', 'h11', 'sn121212121', '2', '2', '1', '北京电气1厂', '2016-05-05');
INSERT INTO `t_equipment` VALUES ('5', 'HD0004', '设备1', '111111', '2019-08-09 10:19:52', null, '2019-08-09 10:19:52', null, '0', '供应1', '111111', '2', 'h11', 'sn121212121', '2', '2', '0', '北京电气1厂', '2016-05-05');
INSERT INTO `t_equipment` VALUES ('6', 'HD0005', '设备1', '111111', '2019-08-09 16:07:52', null, '2019-08-09 16:17:07', 'admin', '1', '供应1', '222222', '1', 'h11', 'sn121212121', '2', '1', '1', '北京电气1厂', '2016-05-05');
INSERT INTO `t_equipment` VALUES ('7', 'HD0006', '设备1', '', '2019-08-09 10:24:04', null, '2019-08-09 10:24:04', null, '1', '供应1', '111111', '1', 'h11', 'sn121212121', '2', '1', '1', '北京电气1厂', '2016-05-05');
INSERT INTO `t_equipment` VALUES ('8', 'HD0007', '设备1', '111111', '2019-08-09 10:19:46', 'admin', '2019-08-09 10:19:46', 'admin', '0', '供应1', '', '2', 'h11', 'sn121212121', '2', '4', '0', '北京电气1厂', '2016-05-05');
INSERT INTO `t_equipment` VALUES ('9', 'HD0008', '设备1', '111111', '2019-08-07 20:53:43', 'admin', '2019-08-07 20:53:43', 'admin', '0', '供应1', '', '1', 'h11', 'sn121212121', '2', '1', '0', '北京电气1厂', '2016-05-05');
INSERT INTO `t_equipment` VALUES ('10', 'HD0009', '设备1333', '222222', '2019-08-09 10:47:09', 'admin', '2019-08-09 10:56:23', 'admin', '1', '供应1', '555555', '3', 'h11', 'sn12121212144', '2', '1', '1', '北京电气1厂', '2016-05-05');
INSERT INTO `t_equipment` VALUES ('11', 'HD00010', '设备1', '111111', '2019-08-07 20:53:43', 'admin', '2019-08-07 20:53:43', 'admin', '0', '供应1', '5555', '1', 'h11', 'sn121212121', '2', '1', '0', '北京电气1厂', '2016-05-05');
INSERT INTO `t_equipment` VALUES ('12', 'HD00011', '111', '111111', '2019-08-07 20:53:26', null, '2019-08-07 20:53:26', null, '0', '', '', '1', '111', 'sn', 'ck', '0', '0', '', '2019-08-29');
INSERT INTO `t_equipment` VALUES ('13', 'HD00012', '1112', '111111', '2019-08-07 23:11:54', null, '2019-08-07 23:11:54', null, '0', '', '', '2', '1112', 'sn', 'ck', '0', '0', '', '2019-08-06');
INSERT INTO `t_equipment` VALUES ('14', '001', '设备1', '222222', '2019-08-09 10:24:04', 'admin', '2019-08-09 10:24:04', 'admin', '1', '', '', '3', '型号1', 'sn1', '1', '1', '1', '', '2019-08-07');
INSERT INTO `t_equipment` VALUES ('15', '111333', 'tttttttttt', '111111', '2019-08-09 10:20:11', 'admin', '2019-08-09 10:20:11', 'admin', '0', '', '', '1', '111', 'sn', null, '2', '0', '', '2019-08-07');
INSERT INTO `t_equipment` VALUES ('16', '20190808001', '美丽的可可西里', '222222', '2019-08-09 10:57:04', 'admin', '2019-08-09 10:57:04', 'admin', '1', '', '', '2', 'CN-001', '7890000111', '1', '1', '1', '', '2019-08-29');
INSERT INTO `t_equipment` VALUES ('17', '0011', '111', '111111', '2019-08-09 15:44:07', 'admin', '2019-08-09 15:44:07', 'admin', '1', '', '', '1', '111', 'sn1', '1', '3', '1', '', '2019-08-09');

-- ----------------------------
-- Table structure for t_equipment_log
-- ----------------------------
DROP TABLE IF EXISTS `t_equipment_log`;
CREATE TABLE `t_equipment_log` (
  `id` int(11) NOT NULL,
  `operation` varchar(255) DEFAULT '' COMMENT '操作动作',
  `operationDate` datetime DEFAULT NULL,
  `equiomentOrgName` varchar(255) DEFAULT '' COMMENT '设备组名称',
  `equiomentName` varchar(255) DEFAULT '' COMMENT '设备名称',
  `equiomentNumber` varchar(255) DEFAULT '' COMMENT '关联设备编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_equipment_log
-- ----------------------------

-- ----------------------------
-- Table structure for t_equipment_operation
-- ----------------------------
DROP TABLE IF EXISTS `t_equipment_operation`;
CREATE TABLE `t_equipment_operation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `equipmentCode` varchar(50) DEFAULT NULL COMMENT '设备编码，对应设备表number',
  `equipmentOrderNO` varchar(50) DEFAULT NULL COMMENT '设备订单号',
  `equipmentTime` datetime DEFAULT NULL COMMENT '设备当时时间',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，也是收到数据时间',
  `operationTime` varchar(50) DEFAULT NULL COMMENT '执行开始时间',
  `finishTime` varchar(50) DEFAULT NULL COMMENT '执行结束时间',
  `actionName` varchar(50) DEFAULT NULL COMMENT '执行操作名称',
  `actionCode` int(11) DEFAULT NULL COMMENT '执行操作代码',
  `operater` varchar(50) DEFAULT NULL COMMENT '操作员',
  `temperatureIn` double DEFAULT NULL COMMENT '箱内温度 单位摄氏度',
  `temperatureOut` double DEFAULT NULL COMMENT '箱外温度 单位摄氏度',
  `humidity` double DEFAULT NULL COMMENT '设备湿度',
  `voltage` double DEFAULT NULL COMMENT '设备电量',
  `longitude` double DEFAULT NULL COMMENT '经度',
  `latitude` double DEFAULT NULL COMMENT '纬度',
  `openStatus` tinyint(4) DEFAULT NULL COMMENT '开箱状态 0: 开箱 1: 关箱',
  `compressorStatus` tinyint(4) DEFAULT NULL COMMENT '压缩机状态  0:开机 1: 关机',
  `temperatureUpperLimit` double DEFAULT NULL COMMENT '设备温度上限',
  `temperatureLowerLimit` double DEFAULT NULL COMMENT '设备温度下限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='远程上传设备操作日志记录表';

-- ----------------------------
-- Records of t_equipment_operation
-- ----------------------------
INSERT INTO `t_equipment_operation` VALUES ('1', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-08 17:00:35', '2019 / 8 / 6 15: 31 ', null, 'run ', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_equipment_operation` VALUES ('2', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-08 17:21:38', '2019/8/6 15:31 ', null, 'run', null, null, '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2');
INSERT INTO `t_equipment_operation` VALUES ('3', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-08 17:38:22', '2019/8/6 15:31 ', '2019/8/6 15:35', 'run', '1', '张三', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2');
INSERT INTO `t_equipment_operation` VALUES ('4', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-08 17:38:42', '2019/8/6 15:31 ', '2019/8/6 15:35', 'run', '1', '张三', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2');
INSERT INTO `t_equipment_operation` VALUES ('5', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-08 18:29:31', '2019/8/6 15:31 ', '2019/8/6 15:35', 'run', '1', '张三', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2');

-- ----------------------------
-- Table structure for t_equipment_org
-- ----------------------------
DROP TABLE IF EXISTS `t_equipment_org`;
CREATE TABLE `t_equipment_org` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(11) DEFAULT '' COMMENT '设备组id',
  `equipmentName` varchar(255) DEFAULT '' COMMENT '设备名称',
  `supplierNumber` varchar(255) DEFAULT '' COMMENT '关联设备number',
  `isDelete` varchar(255) DEFAULT '1' COMMENT '1正常0删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_equipment_org
-- ----------------------------
INSERT INTO `t_equipment_org` VALUES ('1', '111111', '设备组1', '111111', '1');
INSERT INTO `t_equipment_org` VALUES ('2', '222222', '设备组2', '111111', '1');
INSERT INTO `t_equipment_org` VALUES ('3', '333333', '设备组3', '111111', '1');
INSERT INTO `t_equipment_org` VALUES ('4', '444444', '设备组1', '222222', '1');
INSERT INTO `t_equipment_org` VALUES ('5', '555555', '设备组2', '222222', '1');

-- ----------------------------
-- Table structure for t_equipment_status
-- ----------------------------
DROP TABLE IF EXISTS `t_equipment_status`;
CREATE TABLE `t_equipment_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `equipmentCode` varchar(255) DEFAULT NULL COMMENT '设备编码，对应设备表number',
  `equipmentOrderNO` varchar(255) DEFAULT NULL COMMENT '设备订单号',
  `equipmentTime` datetime DEFAULT NULL COMMENT '设备当时时间',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，也是收到数据时间',
  `temperatureIn` double DEFAULT NULL COMMENT '箱内温度 单位摄氏度',
  `temperatureOut` double DEFAULT NULL COMMENT '箱外温度 单位摄氏度',
  `humidity` double DEFAULT NULL COMMENT '设备湿度',
  `voltage` double DEFAULT NULL COMMENT '设备电量',
  `longitude` double DEFAULT NULL COMMENT '经度',
  `latitude` double DEFAULT NULL COMMENT '纬度',
  `openStatus` tinyint(4) DEFAULT NULL COMMENT '开箱状态 0: 开箱 1: 关箱',
  `compressorStatus` tinyint(4) DEFAULT NULL COMMENT '压缩机状态  0:开机 1: 关机',
  `temperatureUpperLimit` double DEFAULT NULL COMMENT '设备温度上限',
  `temperatureLowerLimit` double DEFAULT NULL COMMENT '设备温度下限',
  `openPassword` varchar(255) DEFAULT NULL COMMENT '开箱密码',
  `adminPassword` varchar(255) DEFAULT NULL COMMENT '管理密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COMMENT='设备推送状态信息表';

-- ----------------------------
-- Records of t_equipment_status
-- ----------------------------
INSERT INTO `t_equipment_status` VALUES ('1', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-07 05:42:01', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('2', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-07 05:54:40', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('3', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-07 06:01:12', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('4', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-08 00:41:36', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('5', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-08 00:42:48', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('6', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-07 15:41:21', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('7', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-07 15:42:46', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('8', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-07 15:42:46', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('9', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-07 15:42:46', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('10', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-07 15:42:46', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('11', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-07 15:50:13', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('12', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-07 15:50:13', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('13', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-07 15:50:13', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('14', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-07 15:50:13', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('15', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-07 15:50:32', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('16', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-07 15:50:32', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('17', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-07 15:50:32', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('18', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-07 15:50:32', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('19', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-07 15:52:19', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('20', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-07 15:52:19', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('21', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-07 15:52:19', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('22', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-07 15:52:19', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('23', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-07 15:53:17', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('24', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-07 15:53:17', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('25', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-07 15:53:17', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('26', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-07 15:53:17', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('27', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-07 15:54:06', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('28', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-07 15:54:06', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('29', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-07 15:54:06', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('30', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-07 15:54:06', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('31', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-07 15:55:21', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('32', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-07 15:55:21', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('33', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-07 15:55:21', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('34', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-07 15:55:21', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('35', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-07 15:56:38', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('36', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-07 15:56:38', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('37', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-07 15:56:38', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('38', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-07 15:56:39', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('39', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-07 15:57:18', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('40', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-07 15:57:18', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('41', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-07 15:57:18', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('42', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-07 15:57:18', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('43', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-07 15:57:26', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('44', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-07 15:57:26', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('45', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-07 15:57:26', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('46', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-07 15:57:26', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('47', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-08 11:27:42', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('48', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-08 11:27:42', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('49', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-08 11:27:42', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('50', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-08 11:27:42', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('51', null, null, null, '2019-08-08 16:41:57', null, null, null, null, null, null, '0', '0', null, null, '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('52', null, null, null, '2019-08-08 16:41:57', null, null, null, null, null, null, '0', '0', null, null, '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('53', null, null, null, '2019-08-08 16:41:57', null, null, null, null, null, null, '0', '0', null, null, '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('54', null, null, null, '2019-08-08 16:41:57', null, null, null, null, null, null, '0', '0', null, null, '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('55', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-08 16:43:56', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('56', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-08 16:43:56', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('57', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-08 16:43:56', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('58', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-08 16:43:56', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('59', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-08 18:58:47', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('60', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-08 19:03:17', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('61', 'T283283', '1235645', '2019-08-06 16:31:00', '2019-08-08 19:03:17', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('62', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-09 11:11:45', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('63', 'T283283', '1235645', '2019-08-06 16:31:00', '2019-08-09 11:11:45', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('64', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-09 11:11:48', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('65', 'T283283', '1235645', '2019-08-06 16:31:00', '2019-08-09 11:11:48', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('66', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-09 13:39:30', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('67', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-09 13:40:00', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('68', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-09 13:41:53', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('69', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-09 15:03:07', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('70', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-09 15:03:26', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('71', 'T283283', '1235645', '2019-08-06 16:31:00', '2019-08-09 15:15:52', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('72', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-09 15:15:52', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('73', 'T283283', '1235645', '2019-08-06 14:31:00', '2019-08-09 15:15:52', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('74', 'T283283', '1235645', null, '2019-08-09 15:15:52', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('75', 'T283283', '1235645', '2019-08-06 16:31:00', '2019-08-09 15:28:37', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('76', 'T283283', '1235645', '2019-08-06 15:31:00', '2019-08-09 15:28:37', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('77', 'T283283', '1235645', '2019-08-06 14:31:00', '2019-08-09 15:28:37', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');
INSERT INTO `t_equipment_status` VALUES ('78', 'T283283', '1235645', null, '2019-08-09 15:28:37', '5', '23', '56', '45', '130.3232', '40.3203', '0', '0', '10', '2', '123456', '654321');

-- ----------------------------
-- Table structure for t_job
-- ----------------------------
DROP TABLE IF EXISTS `t_job`;
CREATE TABLE `t_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jobName` varchar(64) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `cron` varchar(64) NOT NULL,
  `springBeanName` varchar(64) NOT NULL COMMENT 'springBean名',
  `methodName` varchar(64) NOT NULL COMMENT '方法名',
  `isSysJob` tinyint(1) NOT NULL COMMENT '是否是系统job',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jobName` (`jobName`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_job
-- ----------------------------

-- ----------------------------
-- Table structure for t_mail
-- ----------------------------
DROP TABLE IF EXISTS `t_mail`;
CREATE TABLE `t_mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL COMMENT '发送人',
  `subject` varchar(255) NOT NULL COMMENT '标题',
  `content` longtext NOT NULL COMMENT '正文',
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_mail
-- ----------------------------

-- ----------------------------
-- Table structure for t_mail_to
-- ----------------------------
DROP TABLE IF EXISTS `t_mail_to`;
CREATE TABLE `t_mail_to` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mailId` int(11) NOT NULL,
  `toUser` varchar(128) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1成功，0失败',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_mail_to
-- ----------------------------

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `content` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_notice
-- ----------------------------

-- ----------------------------
-- Table structure for t_notice_read
-- ----------------------------
DROP TABLE IF EXISTS `t_notice_read`;
CREATE TABLE `t_notice_read` (
  `noticeId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`noticeId`,`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_notice_read
-- ----------------------------

-- ----------------------------
-- Table structure for t_supplier
-- ----------------------------
DROP TABLE IF EXISTS `t_supplier`;
CREATE TABLE `t_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) DEFAULT '' COMMENT '序号',
  `supplierName` varchar(255) DEFAULT '' COMMENT '供应商名称',
  `status` int(1) DEFAULT '0' COMMENT '0不可用1可用',
  `createTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updateTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `createName` varchar(255) DEFAULT '' COMMENT '创建人',
  `updateName` varchar(255) DEFAULT '' COMMENT '更新人',
  `isDelete` varchar(255) DEFAULT '1' COMMENT '是否删除 1正常 0删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_supplier
-- ----------------------------
INSERT INTO `t_supplier` VALUES ('1', '111111', '供应商1', '0', '2019-08-05 23:37:03', '2019-08-05 23:37:03', '小明', '小明', '1');
INSERT INTO `t_supplier` VALUES ('2', '222222', '供应商2', '0', '2019-08-05 23:37:20', '2019-08-05 23:37:20', '小红', '小红', '1');

-- ----------------------------
-- Table structure for t_user_org
-- ----------------------------
DROP TABLE IF EXISTS `t_user_org`;
CREATE TABLE `t_user_org` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) DEFAULT NULL COMMENT '用户id',
  `orgNumbeer` varchar(255) DEFAULT NULL COMMENT '组织Number',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_org
-- ----------------------------
INSERT INTO `t_user_org` VALUES ('1', '1', '1');
