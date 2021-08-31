alter table ol_live_issue modify column room_place varchar(64) NOT NULL DEFAULT '' COMMENT '直播间位置';
alter table ol_live_issue add column `last_update_time` datetime DEFAULT NULL COMMENT '最后一次状态更新的时间时间（冗余字段）' after `accept_time`;

update ol_live_issue_follow_map_user set issue_ids = '' where issue_type != 1;
update ol_admin_config set `options` = '1:处理中\r\n2:已解决\r\n3:无法处理\r\n4:无效呼救' where name = 'live_issue_follow_status_add';

INSERT INTO `ol_admin_config` VALUES (null,'live_issue_report_options_teacher','直播课故障上报参数-教师','type','select','2','1:老师网络卡，延迟高\r\n2:课件加载有问题\r\n3:课件应用有问题\r\n4:其他（请务必留言说明）','','','','','','',0,'','','','',unix_timestamp(),unix_timestamp(),100,1);

INSERT INTO `ol_admin_config` VALUES (null,'live_issue_report_options_student','直播课故障上报参数-学生','type','select','2','1:老师听不到学生说话\r\n2:老师看不到学生\r\n3:学生看不到老师\r\n4:学生听不到老师说话\r\n5:学生网络卡，延迟高\r\n6:课件加载有问题\r\n7:课件应用有问题\r\n8:其他（请务必留言说明）','','','','','','',0,'','','','',unix_timestamp(),unix_timestamp(),100,1);

SELECT @api_id := `id` FROM `ol_admin_menu` WHERE `title` = 'api管理' AND `pid` = 0;
SELECT @issue_module_id := `id` FROM `ol_admin_menu` WHERE `title` = 'IT客服工单' AND `pid` = @api_id;

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
	'获取所有客服的在线状态(不是登录状态)',
	'module_admin',
	'api_customer_service_onlineStatusBatch',
	'api/customer_service/onlineStatusBatch',
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
	'获取直播工单的操作历史记录',
	'module_admin',
	'api_live_issue_log',
	'api/live_issue/log',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);
