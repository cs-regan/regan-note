-- ----------------------------
-- Table structure for ol_edu_teach_work_cate
-- ----------------------------
DROP TABLE IF EXISTS `ol_edu_teach_work_cate`;
CREATE TABLE `ol_edu_teach_work_cate`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '老師指定時間點可開課課類',
  `teach_work_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'edu_teach_work表id',
  `cate_pid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'course_category 階段id cate_sid',
  `cate_sid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'course_category 階段id cate_pid',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
-- ----------------------------
-- Table structure for ol_edu_plan_cate
-- ----------------------------
DROP TABLE IF EXISTS `ol_edu_plan_cate`;
CREATE TABLE `ol_edu_plan_cate`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `edu_plan_id` int(11) UNSIGNED NOT NULL COMMENT 'edu_plan 表id',
  `cate_sid` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `cate_pid` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;
SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------
-- Table structure for ol_edu_holidays
-- ----------------------------
DROP TABLE IF EXISTS `ol_edu_holidays`;
CREATE TABLE `ol_edu_holidays`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '节假日记录表',
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '节假日名称',
  `start_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '开始放假日期',
  `end_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '结束日期',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '0不生效 1生效',
  `cate_sids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '跳过创建阶段',
  `class_join` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '正课跳过此节假日 1正课放假 0正课不放假',
  `oper_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT ' 创建人',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

SELECT @eduTeachId := `id` FROM `ol_admin_menu` WHERE `url_key` = 'api_EduGroup_index';

INSERT INTO `ol_admin_menu`(
	`pid`,
	`module`,
	`title`,
	`url_type`,
	`url_key`,
	`url_value`,
	`url_target`,
	`online_hide`,
	`create_time`,
	`update_time`,
	`sort`,
	`system_menu`,
	`status`
) VALUES (
	@eduTeachId,
	'api',
	'设置老师排期按周&小时',
	'module_admin',
    'api_EduTeachWork_setTeacherToWorkHour',
    'api/edu_teach_work/setteachertoworkhour',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);
INSERT INTO `ol_admin_menu`(
	`pid`,
	`module`,
	`title`,
	`url_type`,
	`url_key`,
	`url_value`,
	`url_target`,
	`online_hide`,
	`create_time`,
	`update_time`,
	`sort`,
	`system_menu`,
	`status`,
	`is_check_auth`
 	) VALUES (
	@eduTeachId,
	'api',
	'设置老师排班状态（是否参与排班）',
	'module_admin',
    'api_EduTeach_setState',
    'api/edu_teach/setstate',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1,
	0
);

INSERT INTO `ol_admin_menu`(
	`pid`,
	`module`,
	`title`,
	`url_type`,
	`url_key`,
	`url_value`,
	`url_target`,
	`online_hide`,
	`create_time`,
	`update_time`,
	`sort`,
	`system_menu`,
	`status`
) VALUES (
	@eduTeachId,
	'api',
	'节假日列表',
	'module_admin',
    'api_EduHolidays_index',
    'api/edu_holidays/index',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);

INSERT INTO `ol_admin_menu`(
	`pid`,
	`module`,
	`title`,
	`url_type`,
	`url_key`,
	`url_value`,
	`url_target`,
	`online_hide`,
	`create_time`,
	`update_time`,
	`sort`,
	`system_menu`,
	`status`
) VALUES (
	@eduTeachId,
	'api',
	'新增节假日',
	'module_admin',
    'api_EduHolidays_addHolidays',
    'api/edu_holidays/addholidays',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);

INSERT INTO `ol_admin_menu`(
	`pid`,
	`module`,
	`title`,
	`url_type`,
	`url_key`,
	`url_value`,
	`url_target`,
	`online_hide`,
	`create_time`,
	`update_time`,
	`sort`,
	`system_menu`,
	`status`
) VALUES (
	@eduTeachId,
	'api',
	'编辑节假日',
	'module_admin',
    'api_EduHolidays_editHolidays',
    'api/edu_holidays/editholidays',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);

INSERT INTO `ol_admin_menu`(
	`pid`,
	`module`,
	`title`,
	`url_type`,
	`url_key`,
	`url_value`,
	`url_target`,
	`online_hide`,
	`create_time`,
	`update_time`,
	`sort`,
	`system_menu`,
	`status`
) VALUES (
	@eduTeachId,
	'api',
	'删除节假日',
	'module_admin',
    'api_EduHolidays_deleteHoliday',
    'api/edu_holidays/deleteholiday',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);

INSERT INTO `ol_admin_menu`(
	`pid`,
	`module`,
	`title`,
	`url_type`,
	`url_key`,
	`url_value`,
	`url_target`,
	`online_hide`,
	`create_time`,
	`update_time`,
	`sort`,
	`system_menu`,
	`status`,
	`is_check_auth`
 	) VALUES (
	1104,
	'api',
	'按部门结构返回老师',
	'module_admin',
    'api_Teacher_getTeacherTreeToDepa',
    'api/teacher/getteachertreetodepa',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1,
	0
);


INSERT INTO `ol_admin_action`(
	`module`,
	`name`,
	`title`,
	`remark`,
	'rule',
	`log`,
	`status`,
	`create_time`,
	`update_time`
) VALUES (
	'api',
	'edu_teach_set_state',
	'老师排班状态设置',
	'老师排班状态设置',
	'',
	'[user|get_nickname] 设置了老师排班状态：[details]',
	1,
	unix_timestamp(),
	unix_timestamp()
);


INSERT INTO `ol_admin_action`(
	`module`,
	`name`,
	`title`,
	`remark`,
	'rule',
	`log`,
	`status`,
	`create_time`,
	`update_time`
) VALUES (
	'api',
	'edu_holidays_log',
	'节假日管理',
	'节假日设置管理',
	'',
	'[user|get_nickname] 设置了节假日：[details]',
	1,
	unix_timestamp(),
	unix_timestamp()
);

INSERT INTO `ol_department_conf`(
	`title`,
	`action_name`,
	`group_list`,
	`create_time`,
	`update_time`
) VALUES (
	'教务中心-排班部门',
	'teach_department_tree',
	'[39]',
	unix_timestamp(),
	unix_timestamp()
);




