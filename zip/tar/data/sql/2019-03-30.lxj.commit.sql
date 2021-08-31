ALTER TABLE  `ol_order_class_apply_log`
ADD COLUMN `first_class_time_end` varchar(20) NULL COMMENT '首次课日期范围' AFTER `first_class_time`;

ALTER TABLE  `ol_order_class_apply_log`
ADD COLUMN `first_class_time_start` varchar(20) NULL COMMENT '首次课日期范围-开始' AFTER `first_class_time`,
MODIFY COLUMN `first_class_time_end` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '首次课日期范围-结束' AFTER `first_class_time`;

SELECT @api_id := `id` FROM `ol_admin_menu` WHERE `url_key` = 'api_courseSchedule_temp';

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
	@api_id,
	'api',
	'提交排课申请',
	'module_admin',
	'api_liveGradeApply_setStudentGradeApply',
	'api/live_grade_apply/setstudentgradeapply',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);