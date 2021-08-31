SELECT @cr_module_id := `id` FROM `ol_admin_menu` WHERE `url_key` = 'api_cr_index';

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
	@cr_module_id,
	'api',
	'自动排课-重新排课',
	'module_admin',
	'api_courseSchedule_createNewGradeAndAddStudent',
	'api/course_schedule/createnewgradeandaddstudent',
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
	@cr_module_id,
	'api',
	'自动排课-获取适用课类&阶段',
	'module_admin',
	'api_courseSchedule_getCateTree',
	'api/course_schedule/getcatetree',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);