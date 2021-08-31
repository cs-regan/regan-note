-- 学员管理后台 API 节点
SELECT @api_id := `id` FROM `ol_admin_menu` WHERE `title` = 'api管理' AND `pid` = 0;
SELECT @issue_module_id := `id` FROM `ol_admin_menu` WHERE `title` = '学员模块' AND `pid` = @api_id;
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
	'待续费学员列表',
	'module_admin',
	'api_student_renewal_list',
	'api/student_renewal/list',
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
	'更新学员续费意愿',
	'module_admin',
	'api_student_renewal_updateRenewalIntent',
	'api/student_renewal/updateRenewalIntent',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
); 

-- 添加学员续费意愿字段
alter table `ol_user` add column `renewal_intent` tinyint(1) unsigned DEFAULT 0 COMMENT '学员续费意向:0 未设置；1低；2中；3高';
