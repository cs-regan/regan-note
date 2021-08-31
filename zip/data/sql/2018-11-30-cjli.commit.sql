-- 在线状态(客服)
ALTER TABLE `ol_admin_user` ADD COLUMN `is_online` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否在线（非登录状态）';

-- 直播工单后台 API 节点
SELECT @api_id := `id` FROM `ol_admin_menu` WHERE `title` = 'api管理' AND `pid` = 0;
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
	'IT客服工单',
	'module_admin',
	'api_live_issues_module',
	'',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
); 
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
	'获取直播工单列表',
	'module_admin',
	'api_live_issue_list',
	'api/live_issue/list',
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
	'创建直播课工单',
	'module_admin',
	'api_live_issue_create',
	'api/live_issue/create',
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
	'获取IT客服的在线状态',
	'module_admin',
	'api_customer_service_online_status',
	'api/customer_service/onlinestatus',
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
	'获取IT客服列表',
	'module_admin',
	'api_customer_service_list',
	'api/customer_service/list',
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
	'设置客服在线状态',
	'module_admin',
	'api_customer_service_online_setting',
	'api/customer_service/setOnline',
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
	'设置客服离线状态',
	'module_admin',
	'api_customer_service_offline_setting',
	'api/customer_service/setOffline',
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
	'批量设置离线状态',
	'module_admin',
	'api_customer_service_offline_setting_batch',
	'api/customer_service/setOfflineBatch',
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
	'批量设置在线状态',
	'module_admin',
	'api_customer_service_online_setting_batch',
	'api/customer_service/setOnlineBatch',
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
	'判断今日客服在线状态是否已设置',
	'module_admin',
	'api_customer_service_online_setting_today',
	'api/customer_service/onlineSettingToday',
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
	'获取某个直播课工单详情',
	'module_admin',
	'api_live_issue_detail',
	'api/live_issue/detail',
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
	'获取某个直播课工单跟进记录',
	'module_admin',
	'api_live_issue_follow_list',
	'api/live_issue_follow/list',
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
	'添加直播工单跟进记录',
	'module_admin',
	'api_live_issue_follow_add',
	'api/live_issue_follow/add',
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
	'更新工单跟进记录',
	'module_admin',
	'api_live_issue_follow_update',
	'api/live_issue_follow/update',
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
	'转移直播课工单到其他 IT 客服',
	'module_admin',
	'api_live_issue_transfer',
	'api/live_issue/transfer',
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
	'领取直播课工单',
	'module_admin',
	'api_live_issue_accept',
	'api/live_issue/accept',
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
	'分配直播课工单给其他客服',
	'module_admin',
	'api_live_issue_allocate',
	'api/live_issue/allocate',
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
	'获取某个用户的直播工单客服记录',
	'module_admin',
	'api_live_issue_userlog',
	'api/live_issue/userlog',
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
	'获取某个用户的直播工单客服记录',
	'module_admin',
	'api_live_issue_follow_userlog',
	'api/live_issue_follow/userlog',
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
	'获取直播课故障上报参数选项',
	'module_admin',
	'api_live_issue_get_report_options',
	'api/live_issue/getReportOptions',
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
	'获取直播工单状态对应的记录数量',
	'module_admin',
	'api_live_issue_count_of_status',
	'api/live_issue/countOfStatus',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);

INSERT INTO `ol_admin_config` VALUES (null,'teacher_work_type','教师职位角色 ID 关系','type','select','2','1:全职\r\n2:兼职','','','','','','',0,'','','','',unix_timestamp(),unix_timestamp(),100,1);
INSERT INTO `ol_admin_config` VALUES (null,'it_cs_manager_role_id','IT客服主管角色ID','type','text','1','','','','','','','',0,'','','','',unix_timestamp(),unix_timestamp(),100,1);
INSERT INTO `ol_admin_config` VALUES (null,'it_cs_role_id','IT客服角色ID','type','text','1','','','','','','','',0,'','','','',unix_timestamp(),unix_timestamp(),100,1);
INSERT INTO `ol_admin_config` VALUES (null,'live_issue_follow_status_query','直播工单跟进状态-查询参数选项','type','masked','0','0:待处理\r\n1:处理中\r\n2:已解决\r\n3:无法处理\r\n4:无效呼救\r\n-1:全部\r\n-2:转移','','','','','','',0,'','','','',unix_timestamp(),unix_timestamp(),100,1);
INSERT INTO `ol_admin_config` VALUES (null,'live_issue_follow_status_add','直播工单跟进状态-添加跟进记录时选项','type','masked','0','0:待处理\r\n1:处理中\r\n2:已解决\r\n3:无法处理\r\n4:无效呼救','','','','','','',0,'','','','',unix_timestamp(),unix_timestamp(),100,1);
INSERT INTO `ol_admin_config` VALUES (null,'contact_or_follow_tool','通讯工具/跟进方式','type','text','1','1:电话\r\n2:远程工具\r\n3:社交软件','','','','','','',0,'','','','',unix_timestamp(),unix_timestamp(),100,1);
INSERT INTO `ol_admin_config` VALUES (null,'live_issue_follow_reason','直播课工单跟进选择故障原因','type','select','6','1:学生端Mac\r\n2:学生端iPad\r\n3:学生端Win\r\n4:学生设备\r\n5:学生网络\r\n6:教师端\r\n7:教师设备\r\n8:教师网络\r\n9:游戏课件\r\n10:平台系统\r\n11:教学教务\r\n12:其他\r\n13:无故障','','','','','','',0,'','','','',unix_timestamp(),unix_timestamp(),100,1);

CREATE TABLE IF NOT EXISTS `ol_customer_service_online_setting_log` (
	`id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`date_num` char(8) COMMENT '日期数（只含年月日数字不含分隔符，如：20181128）',
	`operator_id` int(10) UNSIGNED NOT NULL COMMENT '设置上班时间的客服主管ID',
	`user_id_list` text NOT NULL COMMENT '客服在线设置记录表',
	`is_online` tinyint(2) UNSIGNED NOT NULL COMMENT '是否设置在线：1是0否；默认1',
	`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='IT客服上班记录设置历史表';

DROP TABLE IF EXISTS `ol_live_issue`;
CREATE TABLE `ol_live_issue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `live_id` int(10) unsigned NOT NULL COMMENT '直播课 ID',
  `reporter_id` int(10) unsigned NOT NULL COMMENT '报障人 ID',
  `reporter_type` tinyint(1) NOT NULL COMMENT '报障设备类型:    1/teacher/教师端; 2/watcher/旁听端; ...',
  `room_place` varchar(64) NOT NULL COMMENT '直播间位置',
  `room_remote_id` varchar(64) DEFAULT '' COMMENT '直播间远程 ID ',
  `room_remote_passwd` varchar(64) DEFAULT '' COMMENT '直播间远程密码',
  `comments` text COMMENT '报障人留言',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '报障时间',
  `task_handler_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '处理人/客服 ID',
  `task_origin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '任务来源: 0/尚未分配；1/系统分配；2/主管分配；3/转移；4/领取',
  `accept_time` datetime DEFAULT NULL COMMENT '接受/获取任务时间',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '工单（跟进）状态: 待处理/waiting/0、处理中/processing/1、已解决/success/2、无法处理/error/3、无效呼救/null/4、...',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='直播工单表';

DROP TABLE IF EXISTS `ol_live_issue_log`;
CREATE TABLE IF NOT EXISTS `ol_live_issue_log` (
	`id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`issue_id` int(10) UNSIGNED NOT NULL COMMENT '直播工单 ID',
	`operator_id` int(10) UNSIGNED NOT NULL COMMENT '操作者 ID',
	`reference_id` int(10) UNSIGNED NOT NULL COMMENT '本次操作关联的 ID',
	`type` tinyint(2) NOT NULL COMMENT '操作类型: 1/系统分配；2/主管分配；3/转移；4/领取；...',
	`create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='直播工单操作历史表';

DROP TABLE IF EXISTS `ol_live_issue_detail`;
CREATE TABLE IF NOT EXISTS `ol_live_issue_detail` (
	`id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`issue_id` int(10) UNSIGNED NOT NULL COMMENT '直播工单 ID',
	`user_id` int(10) UNSIGNED NOT NULL COMMENT '故障方 ID',
	`user_type` tinyint(1) NOT NULL COMMENT '故障方类型：1/老师；2/学生',
	`detail` text NOT NULL COMMENT '故障详情',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='直播工单详情表';

DROP TABLE IF EXISTS `ol_live_issue_follow`;
CREATE TABLE IF NOT EXISTS `ol_live_issue_follow` (
	`id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`issue_id` int(10) UNSIGNED NOT NULL COMMENT '直播工单 ID',
	`handler_id` int(10) UNSIGNED NOT NULL COMMENT '处理人/客服 ID',
	`tool` tinyint(1) NOT NULL COMMENT '跟进方式：1/电话；2/远程工具；3/社交软件',
	`status` tinyint(1) NOT NULL COMMENT '跟进结果/状态：0/待处理；1/处理中；2/已解决；3/无法处理；4/无效呼叫；...',
	`reasons` varchar(32) NOT NULL COMMENT '故障原因',
	`create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '跟进时间',
	`description` text NOT NULL COMMENT '故障描述',
	`detail` text NOT NULL COMMENT '处理方法',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='直播工单跟进表';

DROP TABLE IF EXISTS `ol_live_issue_follow_map_user`;
CREATE TABLE IF NOT EXISTS `ol_live_issue_follow_map_user` (
	`id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`follow_id` int(10) UNSIGNED NOT NULL COMMENT '直播工单跟进记录 ID',
	`issue_type` tinyint(1) NOT NULL COMMENT '故障方类型：1/学生问题；2/教师问题；3/平台问题；4/教学教务；5/其他',
	`issue_ids` varchar(191) DEFAULT '' COMMENT '关联的ID列表',
	`extra` text NOT NULL COMMENT '故障方附加多选项数据(冗余字段)',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='直播工单跟进记录与故障方(问题方)关系表';

