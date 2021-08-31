
drop table if exists `ol_teacher_tag_config`;
create table if not exists `ol_teacher_tag_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '标签',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '1 正常 2 禁用',
  `oper_id` int(11) unsigned NOT NULL COMMENT '0 系统',
  `update_oper_id` int(11) NOT NULL DEFAULT '0' COMMENT '0 为没有更新',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COMMENT='教师标签配置表';

drop table if exists `ol_teacher_tag`;
create table if not exists `ol_teacher_tag` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) unsigned NOT NULL COMMENT '教师id',
  `tag_id` int(11) unsigned NOT NULL COMMENT '标签id',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '1 正常 2 禁用',
  `oper_id` int(11) unsigned NOT NULL COMMENT '0 系统',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `teacher_id` (`teacher_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COMMENT='教师标签关联表';

ALTER TABLE  `ol_user_source`
ADD COLUMN `teach_tag` varchar(255) NOT null DEFAULT '' COMMENT '设置老师标签';

SELECT @api_id := `id` FROM `ol_admin_menu` WHERE `title` = '排班管理-教师管理-获取教师组';

DELETE FROM `ol_admin_menu` WHERE `url_value` = 'api/teacher_tag/gettaglist';
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
	'标签列表',
	'module_admin',
	'api_teacherTag_getTagList',
	'api/teacher_tag/gettaglist',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);

DELETE FROM `ol_admin_menu` WHERE `url_value` = 'api/teacher/getteachertimetablebaseinfo';
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
	'获取老师课表基础信息',
	'module_admin',
	'api_teacher_getTeacherTimeTableBaseInfo',
	'api/teacher/getteachertimetablebaseinfo',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);

DELETE FROM `ol_admin_menu` WHERE `url_value` = 'api/teacher_tag/getteachertagconfiglist';
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
	'获取老师标签配置列表',
	'module_admin',
	'api_teacherTag_getTeacherTagConfigList',
	'api/teacher_tag/getteachertagconfiglist',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);

DELETE FROM `ol_admin_menu` WHERE `url_value` = 'api/teacher_tag/addteachertagconfig';
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
	'增加老师标签配置',
	'module_admin',
	'api_teacherTag__addTeacherTagConfig',
	'api/teacher_tag/addteachertagconfig',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);

DELETE FROM `ol_admin_menu` WHERE `url_value` = 'api/teacher_tag/deleteteachertagConfig';
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
	'删除老师标签配置',
	'module_admin',
	'api_teacherTag_deleteteachertagConfig',
	'api/teacher_tag/deleteteachertagConfig',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);