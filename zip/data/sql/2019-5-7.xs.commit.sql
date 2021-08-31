delete from `ol_admin_config` where `name` = 'get_all_demo_teacher_role';
INSERT INTO `ol_admin_config` (
	`name`,
	`title`,
	`group`,
	`type`,
	`value`,
	`options`,
	`create_time`,
	`update_time`,
	`sort`,
	`status`
	) VALUES (
	'get_all_demo_teacher_role', 
	'demo约课返回所有老师的角色', 
	'type', 
	'text',
	'6,20' ,
	'', 
  unix_timestamp(),
	unix_timestamp(),
	'100', 
	'1'
);
