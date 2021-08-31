-- 教师资源查看器 API 节点
SELECT @api_id := `id` FROM `ol_admin_menu` WHERE `title` = 'api管理' AND `pid` = 0;
SELECT @issue_module_id := `id` FROM `ol_admin_menu` WHERE `title` = '班课管理' AND `pid` = @api_id;

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
	@issue_module_id,
	'api',
	'获取教师课程表详情列表（教师资源查看器）',
	'module_admin',
	'api_teacher_resource_listplan',
	'api/teacher_resource/listPlan',
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
	@issue_module_id,
	'api',
	'筛选教师列表（教师资源查看器）',
	'module_admin',
	'api_teacher_resource_search',
	'api/teacher_resource/search',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
); 
