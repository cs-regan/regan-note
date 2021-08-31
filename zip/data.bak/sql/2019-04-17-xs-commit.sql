-- ----------------------------
-- Table structure for ol_edu_teach_work_cate
-- ----------------------------
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `ol_edu_teach_work_cate`;
CREATE TABLE `ol_edu_teach_work_cate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '老師指定時間點可開課課類',
  `teach_work_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'edu_teach_work表id',
  `cate_pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'course_category 階段id cate_sid',
  `cate_sid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'course_category 階段id cate_pid',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `cate_pid` (`cate_pid`),
  KEY `cate_sid` (`cate_sid`),
  KEY `teach_work_id` (`teach_work_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
DROP TABLE IF EXISTS `ol_edu_plan_cate`;
CREATE TABLE `ol_edu_plan_cate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `edu_plan_id` int(11) unsigned NOT NULL COMMENT 'edu_plan 表id',
  `cate_sid` int(11) unsigned NOT NULL DEFAULT '0',
  `cate_pid` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `edu_plan_id` (`edu_plan_id`),
  KEY `cate_sid`	(`cate_sid`),
  KEY `cate_pid` (`cate_pid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ol_classs_switch`;
CREATE TABLE `ol_classs_switch` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '停课、调课、复课表',
  `student_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '学员id',
  `old_class_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '原班级id',
  `old_cate_sid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '原班级阶段',
  `old_next_cn_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '原班级下节课id',
  `old_next_live_time` int(11) unsigned NOT NULL DEFAULT '0',
  `old_cycle` varchar(120) NOT NULL DEFAULT '',
  `new_class_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '新班级id',
  `new_cate_sid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '新班级阶段',
  `new_first_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '新班级首课时间',
  `new_next_cn_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '新班级下节课阶段',
  `new_cycle` varchar(120) NOT NULL DEFAULT '',
  `reason` varchar(255) NOT NULL COMMENT '原因',
  `switch_type` tinyint(4) NOT NULL COMMENT '调课类型 后台配置 ：grade_switch_type\r\n1:升阶\r\n2:降阶\r\n3:换老师\r\n4:换时间',
  `oper_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发起人',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '调课状态\r\n1:调课\r\n2:停课',
  `is_notified` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已经通知',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`student_id`) USING BTREE,
  KEY `idx_oclass_id` (`old_class_id`) USING BTREE,
  KEY `idx_new_class_id` (`new_class_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='学员调课记录表';

DROP TABLE IF EXISTS `ol_classs_switch_cycle`;
CREATE TABLE `ol_classs_switch_cycle` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '停课调课班级上课记录',
  `week_date` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '周期',
  `hour_date` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '小时',
  `minute_date` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '分钟',
  `teacher_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '老师id',
  `switch_id` int(11) NOT NULL COMMENT '更换班级id',
  `type` tinyint(4) NOT NULL COMMENT '1旧班 2新班',
  PRIMARY KEY (`id`),
  KEY `week_date` (`week_date`) USING BTREE,
  KEY `hour_date` (`hour_date`) USING BTREE,
  KEY `teacher_id` (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='学员调课记录附表 记录上课个班级上课周期和下一个周期';
alter table ol_edu_live_property add `cate_ids` text COMMENT '关联的课类ID';
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
	'调课管理列表',
	'module_admin',
	'api_ClasssSwitch_switchList',
	'api/classs_switch/switchlist',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);

SELECT @switch_id := `id` FROM `ol_admin_menu` WHERE `url_key` = 'api_ClasssSwitch_switchList';

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
	@switch_id,
	'api',
	'学员选择调课班级',
	'module_admin',
	'api_ClasssSwitch_getClassToStudentId',
	'api/classs_switch/getclasstostudentid',
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
	@switch_id,
	'api',
	'学员选择调课班级',
	'module_admin',
	'api_ClasssSwitch_switchGrade',
	'api/classs_switch/switchgrade',
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
	@switch_id,
	'api',
	'停课列表',
	'module_admin',
	'api_ClasssDropout_dropoutList',
	'api/classs_dropout/dropoutlist',
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
	@switch_id,
	'api',
	'学员停课',
	'module_admin',
	'api_ClasssDropout_setDropoutToStudent',
	'api/classs_dropout/setdropouttostudent',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);

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
    ) VALUES(
    'api',
    'student_switch_grade',
    '学员调班',
    '学员调班',
    '',
    '[user|get_nickname] 发起调班：[details]',
    1,
    unix_timestamp(),
	unix_timestamp()
);
delete from `ol_admin_config` where `name`='grade_dropout_reason';
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
	'grade_dropout_reason', 
	'停课原因配置', 
	'type', 
	'select',
	'' ,
	'1:孩子学业忙\r\n2:外出旅游\r\n3:孩子生病了', 
    unix_timestamp(),
	unix_timestamp(),
	'100', 
	'1'
);

delete from `ol_admin_config` where `name`='grade_switch_type';
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
	'grade_switch_type', 
	'调课原因配置', 
	'type', 
	'select',
	'' ,
	'1:升阶\r\n2:降阶\r\n3:换老师\r\n4:换时间\r\n5:换班型', 
    unix_timestamp(),
	unix_timestamp(),
	'100', 
	'1'
);

delete from `ol_admin_config` where `name`='grade_switch_reason';
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
	'grade_switch_reason', 
	'调课原因配置', 
	'type', 
	'select',
	'' ,
	'1:课程太简单\r\n2:课程难度大,孩子更不上\r\n3:老师教学不好\r\n4:有其他事情安排\r\n5:一对多上课效果不好', 
    unix_timestamp(),
	unix_timestamp(),
	'100', 
	'1'
);

INSERT INTO `ol_department_conf`(
	`title`,
	`action_name`,
	`group_list`,
	`create_time`,
	`update_time`
) VALUES (
	'教务中心-排班部门',
	'teach_department_tree',
	'[39]',
	unix_timestamp(),
	unix_timestamp()
);