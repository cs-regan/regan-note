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
	'自助排课--列表',
	'module_admin',
	'api_LiveGradeApply_userApplyList',
	'api/live_grade_apply/userApplyList',
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
	'自助排课--确认处理',
	'module_admin',
	'api_LiveGradeApply_confirmUserApply',
	'api/live_grade_apply/confirmUserApply',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
); 
-- ol_order_class_apply_log.submit_uid，修改默认值(null>>0)
-- SELECT COUNT(id) FROM ol_order_class_apply_log_copy1 WHERE submit_uid IS NULL;
ALTER TABLE ol_order_class_apply_log MODIFY submit_uid INT(1) DEFAULT 0 COMMENT '提交用户ID';
UPDATE ol_order_class_apply_log SET submit_uid = 0 WHERE submit_uid IS NULL;

-- 2019-05-20,start
SELECT @api_id := `id` FROM `ol_admin_menu` WHERE `title` = 'api管理' AND `pid` = 0;
SELECT @issue_module_id := `id` FROM `ol_admin_menu` WHERE `title` = '员工模块' AND `pid` = @api_id;
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
	'员工--摘要信息',
	'module_admin',
	'api_adminUser_abstractInfo',
	'api/admin_user/abstractInfo',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
); 
-- 2019-05-20,start