# 复课
SELECT @api_id := `id` FROM `ol_admin_menu` WHERE `title` = '缺勤补课';

DELETE FROM `ol_admin_menu` WHERE `url_key` = 'api_ClasssDropout_resumeInfo';
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
	'获取停课复课记录',
	'module_admin',
	'api_ClasssDropout_resumeInfo',
	'api/classs_dropout/resumeinfo',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);