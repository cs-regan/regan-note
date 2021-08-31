DELETE FROM `ol_admin_action` where `name` = 'edu_teach_disabled';
INSERT INTO `ol_admin_action` (
	`module`,
	`name`,
	`title`,
	`remark`,
	`rule`,
	`log`,
	`status`,
	`create_time`,
	`update_time`
	)VALUES(
	'api',
	'edu_teach_disabled',
	'教师排班状态设置',
	'教师排班状态设置',
	'',
	'[user|get_nickname] 编辑了老师排班状态：[details]',
	1,
	unix_timestamp(),
	unix_timestamp()
);

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for ol_edu_hour_list
-- ----------------------------
DROP TABLE IF EXISTS `ol_edu_hour_list`;
CREATE TABLE `ol_edu_hour_list` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `start_date` varchar(24) NOT NULL DEFAULT '' COMMENT '开课时间配置 17:40',
  `end_date` varchar(24) DEFAULT NULL,
  `cate_sids` varchar(255) NOT NULL DEFAULT '' COMMENT '半点阶段',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1 热选时间',
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1整点数据 2 s1段半点组合',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COMMENT='可约半点时间段';

-- ----------------------------
-- Records of ol_edu_hour_list
-- ----------------------------
INSERT INTO `ol_edu_hour_list` VALUES ('1', '10:00', '10:40', '62,63', '1', '0', '1', '0', '0');
INSERT INTO `ol_edu_hour_list` VALUES ('2', '11:00', '11:40', '62,63', '1', '0', '1', '0', '0');
INSERT INTO `ol_edu_hour_list` VALUES ('3', '14:00', '14:40', '62,63', '1', '0', '1', '0', '0');
INSERT INTO `ol_edu_hour_list` VALUES ('4', '15:00', '15:40', '62,63', '1', '0', '1', '0', '0');
INSERT INTO `ol_edu_hour_list` VALUES ('5', '16:00', '16:40', '62,63', '1', '0', '1', '0', '0');
INSERT INTO `ol_edu_hour_list` VALUES ('6', '17:00', '17:40', '62,63', '1', '0', '1', '0', '0');
INSERT INTO `ol_edu_hour_list` VALUES ('7', '18:00', '18:40', '62,63', '1', '0', '1', '0', '0');
INSERT INTO `ol_edu_hour_list` VALUES ('8', '19:00', '19:40', '62,63', '1', '0', '1', '0', '0');
INSERT INTO `ol_edu_hour_list` VALUES ('9', '20:00', '20:40', '62,63', '1', '0', '1', '0', '0');
INSERT INTO `ol_edu_hour_list` VALUES ('10', '21:00', '21:40', '62,63', '1', '0', '1', '0', '0');
INSERT INTO `ol_edu_hour_list` VALUES ('11', '10:00', '10:40', '61', '1', '0', '2', '0', '0');
INSERT INTO `ol_edu_hour_list` VALUES ('12', '11:00', '11:40', '61', '1', '0', '2', '0', '0');
INSERT INTO `ol_edu_hour_list` VALUES ('13', '14:00', '14:40', '61', '1', '0', '2', '0', '0');
INSERT INTO `ol_edu_hour_list` VALUES ('14', '15:00', '15:40', '61', '1', '0', '2', '0', '0');
INSERT INTO `ol_edu_hour_list` VALUES ('15', '16:00', '16:40', '61', '1', '0', '2', '0', '0');
INSERT INTO `ol_edu_hour_list` VALUES ('16', '17:00', '17:30', '61', '1', '1', '2', '1', '0');
INSERT INTO `ol_edu_hour_list` VALUES ('17', '17:40', '18:10', '61', '1', '1', '2', '1', '0');
INSERT INTO `ol_edu_hour_list` VALUES ('18', '18:20', '18:50', '61', '1', '1', '2', '1', '0');
INSERT INTO `ol_edu_hour_list` VALUES ('19', '19:00', '19:30', '61', '1', '1', '2', '1', '0');
INSERT INTO `ol_edu_hour_list` VALUES ('20', '19:40', '20:10', '61', '1', '1', '2', '1', '0');
INSERT INTO `ol_edu_hour_list` VALUES ('21', '20:20', '20:50', '61', '1', '1', '2', '0', '0');
INSERT INTO `ol_edu_hour_list` VALUES ('22', '21:00', '21:30', '61', '1', '1', '2', '0', '0');


SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for ol_edu_plan_resource
-- ----------------------------
DROP TABLE IF EXISTS `ol_edu_plan_resource`;
CREATE TABLE `ol_edu_plan_resource` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` int(11) NOT NULL DEFAULT '0' COMMENT '时间戳 天',
  `json` longtext COMMENT '时间点资源',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1整点资源 2 半点资源（课节时长30分钟）',
  `cate_sid` int(11) NOT NULL DEFAULT '0' COMMENT '阶段id',
  `create_time` int(11) NOT NULL,
  `tmp_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `timestamp` (`timestamp`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='cc约课资源表';
