-- 缺勤补课记录表
drop table if exists `ol_class_absence_makeup`;
create table if not exists `ol_class_absence_makeup` (
    `id` bigint(20) NOT NULL AUTO_INCREMENT,
    `user_id` int(10) unsigned NOT NULL COMMENT '缺勤的学生ID',
    `class_id` int(10) unsigned NOT NULL COMMENT '缺勤的课节ID',
    `live_id` int(10) unsigned NOT NULL COMMENT '缺勤的班级ID',
    `live_day` int(10) unsigned NOT NULL COMMENT '缺勤的日期',
    `live_time_start` char(5) NOT NULL COMMENT '缺勤课节的开始时间',
    `live_time_end` char(5) NOT NULL COMMENT '缺勤课节的结束时间',
    `courseware_id` int(10) unsigned NOT NULL COMMENT '缺勤的课件ID',
    `courseware_progress` varchar(32) NOT NULL COMMENT '缺勤的课件进度，比如:Step3_1',
    `courseware_title` varchar(32) NOT NULL COMMENT '缺勤的课件名称，比如:森林舞会',
    `teacher_id` int(10) unsigned NOT NULL COMMENT '缺勤课件的上课老师ID',
    `mode_teacher` tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '缺勤课节的上课模式：老师个数',
    `mode_student` tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '缺勤课节的上课模式：学生个数',
    `reason_type` tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '缺勤学生的缺勤原因: 0请假/1旷课',
    `reason_detail` varchar(255) NOT NULL DEFAULT '' COMMENT '缺勤学生的缺勤原因描述',
    `ignore_reason` varchar(255) NOT NULL DEFAULT '' COMMENT '设置不补课的原因',
    `madeup_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '补课类型：0-未补课/1-一对一补课/2-新开班补课/3-插班补课/4-AI补课',
    `madeup_live_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '当前缺勤记录学生的补课课节ID',
    `madeup_class_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '当前缺勤记录学生的补课班级ID(冗余字段)',
    `madeup_teacher_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '补课课件的上课老师ID(冗余字段)',
    `madeup_live_day` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '补课的日期(冗余字段)',
    `madeup_live_time_start` char(5) NOT NULL DEFAULT '' COMMENT '补课课节的开始时间(冗余字段)',
    `madeup_live_time_end` char(5) NOT NULL DEFAULT '' COMMENT '补课课节的结束时间(冗余字段)',
    `madeup_courseware_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '补课的课件ID',
    `madeup_courseware_progress` varchar(32) NOT NULL DEFAULT '' COMMENT '补课课件进度，比如:Step3_1(冗余字段)',
    `madeup_courseware_title` varchar(32) NOT NULL DEFAULT '' COMMENT '补课的课件名称，比如:森林舞会(冗余字段)',
    `status` tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '缺勤学生的补课状态：0待安排/1已安排/2不安排',
    `is_notified` tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否发送过补课信息给家长：1是0否',
    PRIMARY KEY (`id`),
    KEY `idx_user_id` (`user_id`) USING BTREE,
    KEY `idx_live_id` (`live_id`) USING BTREE,
    KEY `idx_class_id` (`class_id`) USING BTREE,
    KEY `idx_live_time` (`live_day`, `live_time_start`, `live_time_end`) USING BTREE,
    KEY `idx_teacher` (`teacher_id`) USING BTREE,
    KEY `idx_live_id_madeup` (`madeup_live_id`) USING BTREE,
    KEY `idx_class_id_madeup` (`madeup_class_id`) USING BTREE,
    KEY `idx_courseware_id` (`courseware_id`) USING BTREE,
    KEY `idx_courseware_id_madeup` (`madeup_courseware_id`) USING BTREE,
    KEY `idx_live_time_madeup` (`madeup_live_day`, `madeup_live_time_start`, `madeup_live_time_end`) USING BTREE,
    KEY `idx_teacher_madeup` (`madeup_teacher_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='缺勤补课记录表';

-- 缺勤补课记录设置不补课记录表
drop table if exists `ol_class_absence_makeup_ignore_log`;
create table if not exists `ol_class_absence_makeup_ignore_log` (
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `absence_id` int(10) unsigned NOT NULL COMMENT '缺勤记录 ID',
    `operator_id` int(10) unsigned NOT NULL COMMENT '操作人ID',
    `create_time` int(10) unsigned NOT NULL COMMENT '操作人时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='缺勤补课记录设置不补课记录表';

-- 缺勤补课记录补课记录操作日志表
drop table if exists `ol_class_absence_makeup_action_log`;
create table if not exists `ol_class_absence_makeup_action_log` (
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `absence_id` int(10) unsigned NOT NULL COMMENT '缺勤记录 ID',
    `user_id` int(10) unsigned NOT NULL COMMENT '补课的学员 ID',
    `live_id` int(10) unsigned NOT NULL COMMENT '补课的课节 ID',
    `operator_id` int(10) unsigned NOT NULL COMMENT '操作人ID',
    `madeup_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '补课类型：0-未补课/1-一对一补课/2-新开班补课/3-插班补课/4-AI补课',
    `create_time` int(10) unsigned NOT NULL COMMENT '操作人时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='缺勤补课记录补课记录操作日志表';

-- 缺勤补课 API 节点
delete from ol_admin_menu where url_key like 'api_class_absence%' or title = '缺勤补课';
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
	'缺勤补课',
	'module_admin',
	'api_missed_lessons_makeup_module',
	'',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
); 
SELECT @class_absence_makeup_module_id := `id` FROM `ol_admin_menu` WHERE `title` = '缺勤补课' AND `pid` = @api_id;
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
	@class_absence_makeup_module_id,
	'api',
	'获取待安排补课的缺勤学员列表',
	'module_admin',
	'api_class_absence_list_waiting',
	'api/class_absence/listWaiting',
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
	@class_absence_makeup_module_id,
	'api',
	'获取已安排补课的缺勤学员列表',
	'module_admin',
	'api_class_absence_list_arranged',
	'api/class_absence/listArranged',
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
	@class_absence_makeup_module_id,
	'api',
	'获取不进行补课安排的缺勤学员列表',
	'module_admin',
	'api_class_absence_list_ignored',
	'api/class_absence/listIgnored',
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
	@class_absence_makeup_module_id,
	'api',
	'设置学员缺勤记录不补课',
	'module_admin',
	'api_class_absence_set_ignore',
	'api/class_absence/setIgnore',
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
	@class_absence_makeup_module_id,
	'api',
	'给已安排补课的学员发送通知',
	'module_admin',
	'api_class_absence_notifyarranged',
	'api/class_absence/notifyArranged',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);