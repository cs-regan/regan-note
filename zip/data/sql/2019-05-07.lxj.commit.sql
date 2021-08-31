#自助约课
 DELETE FROM `ol_admin_config` WHERE `name` = 'parent_apply_class_url';
INSERT INTO `online`.`ol_admin_config` (`name`, `title`, `group`, `type`, `value`, `options`, `tips`, `ajax_url`, `next_items`, `param`, `format`, `table`, `level`, `key`, `option`, `pid`, `ak`, `create_time`, `update_time`, `sort`, `status`, `cc_system_flag`) VALUES ('parent_apply_class_url', '自助约课地址', 'type', 'textarea', '0', '1:cdn.vipthink.cn/klzz_static/live/demo\r\n2:cdn.vipthink.cn/klzz_static/live/formal', '自助约课地址', '', '', '', '', '', '0', '', '', '', '', '1557219943', '1557220736', '100', '1', '0');

 DELETE FROM `ol_msg_template` WHERE `template_id` = 'cQaStvoGHBk9c2ciNmwczpjc1aJH42wbcS2IlY_NkM0';
INSERT INTO `online`.`ol_msg_template` ( `template_id`, `title`, `primary_industry`, `deputy_industry`, `url`, `content`, `example`, `create_time`, `tmp_at`, `remark`, `first`, `body`)
VALUES ( 'cQaStvoGHBk9c2ciNmwczpjc1aJH42wbcS2IlY_NkM0', '排课通知', 'IT科技', '互联网|电子商务', '', '{{first.DATA}}课程：{{keyword1.DATA}}用户名：{{keyword2.DATA}}{{remark.DATA}}', '', '0', '2019-05-06 16:02:26', '宝贝已经等不及上课了吗？您可以点击详情，给宝贝自助排课哦~', '亲爱的家长您好！感谢你购买豌豆思维课程。', '1');


#学员列表
SELECT @api_id := `id` FROM `ol_admin_menu` WHERE `title` = '学员模块';

 DELETE FROM `ol_admin_menu` WHERE `url_key` = 'api_Student_getNotAssignedStudent';
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
	'获取未分配的学员',
	'module_admin',
	'api_Student_getNotAssignedStudent',
	'api/student/getnotassignedstudent',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);

 DELETE FROM `ol_admin_menu` WHERE `url_key` = 'api_Student_alloCRNotify';
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
	'分配CR(带通知)',
	'module_admin',
	'api_Student_alloCRNotify',
	'api/student/allocrnotify',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);


#复课
drop table if exists `ol_classs_dropout`;
create table if not exists `ol_classs_dropout` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '听课表',
  `student_id` int(11) NOT NULL DEFAULT '0' COMMENT '学员id',
  `class_id` int(11) NOT NULL DEFAULT '0' COMMENT '停课班级id',
  `cate_sid` int(11) NOT NULL DEFAULT '0' COMMENT '停课阶段',
  `cycle` varchar(120) NOT NULL DEFAULT '' COMMENT '停课上课周期字符串',
  `teacher_id` int(11) NOT NULL DEFAULT '0' COMMENT '停课老师',
  `next_live_time` int(11) NOT NULL DEFAULT '0' COMMENT '下节课时间',
  `next_cn_id` int(11) NOT NULL DEFAULT '0' COMMENT '下节课课件',
  `hour_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '停课适用的课时包',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '开始停课时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '停课结束时间',
  `reason` varchar(120) NOT NULL DEFAULT '' COMMENT '停课理由',
  `stop_reason` varchar(120) NOT NULL DEFAULT '' COMMENT '不复课理由',
  `oper_id` int(11) NOT NULL DEFAULT '0' COMMENT '操作人',
  `resume_hour_id` int(11) unsigned DEFAULT '0' COMMENT '复课使用的课时包',
  `resume_time` int(11) NOT NULL DEFAULT '0' COMMENT '复课时间 执行复课时间',
  `resume_class_id` int(11) NOT NULL DEFAULT '0' COMMENT '复课班级id',
  `resume_teacher_id` int(11) unsigned DEFAULT '0' COMMENT '复课老师',
  `resume_cycle` varchar(120) NOT NULL DEFAULT '' COMMENT '复课上课周期',
  `resume_cn_id` int(10) NOT NULL DEFAULT '0' COMMENT '复课开始课件',
  `resume_cate_sid` int(10) NOT NULL DEFAULT '0' COMMENT '复课阶段',
  `resume_first_time` int(10) NOT NULL DEFAULT '0' COMMENT '复课首课时间',
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1:已停课\r\n2:已复课\r\n3:不复课',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `is_notified` tinyint(1) DEFAULT '0' COMMENT '是否已经通知',
  PRIMARY KEY (`id`),
  KEY `idx_student_id` (`student_id`) USING BTREE,
  KEY `idx_class_id` (`class_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COMMENT='停课、复课记录表';

drop table if exists `ol_classs_dropout_log`;
create table if not exists`ol_classs_dropout_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `dropout_id` int(11) unsigned NOT NULL COMMENT '记录表id',
  `user_id` int(11) unsigned NOT NULL COMMENT '用户id',
  `oper_id` int(11) unsigned NOT NULL COMMENT '操作人id',
  `old_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '旧值',
  `new_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '新值',
  `action` varchar(200) DEFAULT NULL COMMENT '动作',
  `msg` varchar(200) DEFAULT NULL COMMENT '记录',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `dropout_id` (`dropout_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='停课复课操作记录表';

SELECT @api_id := `id` FROM `ol_admin_menu` WHERE `title` = '缺勤补课';

 DELETE FROM `ol_admin_menu` WHERE `url_key` = 'api_ClasssSwitch_notifyswitch';
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
	'发送调课通知给家长',
	'module_admin',
	'api_ClasssSwitch_notifyswitch',
	'api/classs_switch/notifyswitch',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);

 DELETE FROM `ol_admin_menu` WHERE `url_key` = 'api_ClasssDropout_renewGrade';
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
	'提交复课申请',
	'module_admin',
	'api_ClasssDropout_renewGrade',
	'api/classs_dropout/renewgrade',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);

 DELETE FROM `ol_admin_menu` WHERE `url_key` = 'api_ClasssDropout_resumeClassList';
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
	'复课列表',
	'module_admin',
	'api_ClasssDropout_resumeClassList',
	'api/classs_dropout/resumeclasslist',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);

 DELETE FROM `ol_admin_menu` WHERE `url_key` = 'api_ClasssDropout_stopGrade';
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
	'设置记录为不复课',
	'module_admin',
	'api_ClasssDropout_stopGrade',
	'api/classs_dropout/stopGrade',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);