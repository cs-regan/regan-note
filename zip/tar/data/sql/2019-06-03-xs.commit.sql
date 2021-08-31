ALTER TABLE `ol_edu_plan` ADD INDEX class_date ( `class_date` );
DELETE FROM `ol_admin_action` where `name`='add_user_hour';
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
	'add_user_hour',
	'增加课时包',
	'增加课时包-记录',
	'',
	'[user|get_nickname] 新增课时包：[details]',
	1,
	unix_timestamp(),
	unix_timestamp()
);