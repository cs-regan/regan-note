#学员列表
SELECT @api_id := `id` FROM `ol_admin_menu` WHERE `title` = '学员模块';

DELETE FROM `ol_admin_menu` WHERE `url_key` = 'api_adminUser_getGroupAdminUserList';
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
	'获取下属的用户列表-下拉框数据',
	'module_admin',
	'api_adminUser_getGroupAdminUserList',
	'api/admin_user/getgroupadminuserlist',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);

DELETE FROM `ol_admin_menu` WHERE `url_key` = 'api_Student_getstudentdemoList';
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
	'获取学员上过的DEMO课',
	'module_admin',
	'api_Student_getstudentdemoList',
	'api/student/getStudentDemoList',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);

DELETE FROM `ol_admin_menu` WHERE `url_key` = 'api_Student_getPackageHourList';
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
	'获取套餐课时列表',
	'module_admin',
	'api_Student_getPackageHourList',
	'api/student/getpackagehourList',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);

DELETE FROM `ol_admin_menu` WHERE `url_key` = 'api_Student_getNotFirstFollowStudent';
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
	'获取待首通用户列表',
	'module_admin',
	'api_Student_getNotFirstFollowStudent',
	'api/student/getnotfirstfollowstudent',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);

DELETE FROM `ol_admin_menu` WHERE `url_key` = 'api_Student_getMyStudentList';
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
	'获取我的学员列表',
	'module_admin',
	'api_Student_getMyStudentList',
	'api/student/getmystudentlist',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);

DELETE FROM `ol_admin_menu` WHERE `url_key` = 'api_Student_getMySubStudentList';
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
	'获取我下属的学员列表',
	'module_admin',
	'api_Student_getMySubStudentList',
	'api/student/getmysubstudentList',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);

DELETE FROM `ol_admin_menu` WHERE `url_key` = 'api_Student_getAllStudentList';
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
	'获取全部学员列表',
	'module_admin',
	'api_Student_getAllStudentList',
	'api/student/getallstudentlist',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);

DELETE FROM `ol_admin_config` WHERE `name` = 'send_notify_order_source';
INSERT INTO `ol_admin_config`
(`name`, `title`, `group`, `type`, `value`, `options`, `tips`, `ajax_url`, `next_items`, `param`, `format`, `table`, `level`, `key`, `option`, `pid`, `ak`, `create_time`, `update_time`, `sort`, `status`, `cc_system_flag`)
 VALUES ( 'send_notify_order_source', '允许发送自助约课通知的渠道', 'type', 'text', '10062,10114', '', '', '', '', '', '', '', '0', '', '', '', '', '1557727482', '1557728435', '100', '1', '0');
