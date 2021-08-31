SELECT @api_id := `id` FROM `ol_admin_menu` WHERE `title` = '学员模块';

DELETE FROM `ol_admin_menu` WHERE `url_key` = 'api_Student_getFirstClassFollow';
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
	'获取首课跟进学员列表',
	'module_admin',
	'api_Student_getFirstClassFollow',
	'api/student/getFirstClassFollow',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);



DELETE FROM `ol_admin_menu` WHERE `url_key` = 'api_postPackage_getPackageTracking';
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
	'获取包裹物流信息',
	'module_admin',
	'api_postPackage_getPackageTracking',
	'api/post_package/getpackagetracking',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);