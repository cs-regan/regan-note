delete from `ol_admin_config` where `name`='demo_switch_reason';
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
	'demo_switch_reason', 
	'demo调课原因', 
	'list', 
	'select',
	'' ,
	'1:老师有其它安排不能上课\r\n2:老师请假\r\n3:老师身体不适\r\n4:老师当天课太多', 
  	unix_timestamp(),
	unix_timestamp(),
	'100', 
	'1'
);