SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `ol_summer_course_user_msg_log`;
CREATE TABLE `ol_summer_course_user_msg_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '被通知用户id',
  `oper_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发送通知用户id',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `tmp_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `ids_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='暑假班微信通知记录';

DROP TABLE IF EXISTS `ol_summer_course_user`;
CREATE TABLE `ol_summer_course_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hour_id` int(11) NOT NULL DEFAULT '0' COMMENT '课时包id',
  `cate_pid` int(11) NOT NULL DEFAULT '0' COMMENT '课类id',
  `cate_sid` int(11) NOT NULL DEFAULT '0' COMMENT '阶段',
  `class_id` int(11) NOT NULL DEFAULT '0' COMMENT '排课班级id',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '学员id',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '时间戳 开始上课日期且待开始时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '节课日期',
  `hour_date` varchar(24) NOT NULL DEFAULT '' COMMENT '每天上课时间 字符串',
  `oper_id` int(11) NOT NULL DEFAULT '0' COMMENT '提交人',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_hour_id` (`hour_id`),
  KEY `class_id` (`class_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='暑假班报名学员列表';

delete from `ol_admin_menu` where `url_key` = 'api_SummerCourse_getUserList';
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
	535,
	'api',
	'暑假报名学员',
	'module_admin',
	'api_SummerCourse_getUserList',
	'api/summer_course/getuserlist',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);
delete from `ol_admin_menu` where `url_key` = 'api_SummerCourse_pushWechat';
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
	535,
	'api',
	'暑假报名学员',
	'module_admin',
	'api_SummerCourse_pushWechat',
	'api/summer_course/pushwechat',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);
DELETE FROM `ol_admin_config` where `name`='summercourse_startday_list_l1';
INSERT INTO `ol_admin_config` (
    `name`,
    `title`,
    `group`,
    `type`,
    `value`,
    `options`,
    `create_time`,
    `update_time`
    ) VALUES(
    'summercourse_startday_list_l1',
    '暑假课开课日期',
    'type',
    'select',
    '',
    '0:2019-07-01\r\n1:2019-07-15\r\n2:2019-07-29',
    unix_timestamp(),
	unix_timestamp()
);
DELETE FROM `ol_admin_config` where `name`='summercourse_startday_list_l2';
INSERT INTO `ol_admin_config` (
    `name`,
    `title`,
    `group`,
    `type`,
    `value`,
    `options`,
    `create_time`,
    `update_time`
    ) VALUES(
    'summercourse_startday_list_l2',
    '暑假课开课日期',
    'type',
    'select',
    '',
    '0:2019-07-08\r\n1:2019-07-29',
    unix_timestamp(),
	unix_timestamp()
);
DELETE FROM `ol_admin_config` where `name` = 'summercourse_starthour_list';
INSERT INTO `ol_admin_config` (
    `name`,
    `title`,
    `group`,
    `type`,
    `value`,
    `options`,
    `create_time`,
    `update_time`
    ) VALUES(
    'summercourse_starthour_list',
    '暑假课上课时间',
    'type',
    'select',
    '',
    '0:09_00\r\n1:11_00\r\n2:14_00\r\n3:18_00',
    unix_timestamp(),
	unix_timestamp()
);
DELETE FROM `ol_admin_action` where `name`='summer_course_log';
INSERT INTO `ol_admin_action` (
	`module`,
	`name`,
	`title`,
	`remark`,
	`rule`,
	`log`,
	`status`,
	`create_time`,
	`update_time`
	)VALUES(
	'api',
	'summer_course_log',
	'暑假班提交记录',
	'暑假班提交记录',
	'',
	'[user|get_nickname] 暑假班提交：[details]',
	1,
	unix_timestamp(),
	unix_timestamp()
);
