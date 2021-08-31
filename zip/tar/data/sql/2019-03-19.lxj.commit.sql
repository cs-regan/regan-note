SELECT @api_id := `id` FROM `ol_admin_menu` WHERE `title` = '排班管理-教师管理-获取教师组';

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
	'设置教师基本信息',
	'module_admin',
	'api_teacher_setTeacherRecordBase',
	'api/teacher/setteacherrecordbase',
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
	@api_id,
	'api',
	'获取教师档案基础信息',
	'module_admin',
	'api_teacher_getTeacherRecordBase',
	'api/teacher/getteacherrecordbase',
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
	@api_id,
	'api',
	'获取教师档案带班详情',
	'module_admin',
	'api_teacher_getTeacherRecordClass',
	'api/teacher/getteacherrecordclass',
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
	@api_id,
	'api',
	'获取教师档案带班数据',
	'module_admin',
	'api_teacher_getTeacherRecordDate',
	'api/teacher/getteacherrecorddate',
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
	@api_id,
	'api',
	'检查教师name和nickname是否存在',
	'module_admin',
	'api_teacher_checkTeacherValue',
	'api/teacher/checkteachervalue',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);

ALTER TABLE `ol_admin_user`
ADD COLUMN `teacher_certificate` varchar(255)  NULL COMMENT '教师资格证号 ',
ADD COLUMN `accent` varchar(255) NULL COMMENT '口音  (广东)' AFTER `teacher_certificate`,
ADD COLUMN `introduction` varchar(255) NULL COMMENT '自我介绍' AFTER `accent`,
ADD COLUMN `educational_concept` varchar(255) NULL COMMENT '教育理念' AFTER `teacher_certificate`,
ADD COLUMN `province` int(11) NULL DEFAULT NULL COMMENT '省份',
ADD COLUMN `city` int(11) NULL DEFAULT NULL COMMENT '城市' AFTER `province`,
ADD COLUMN `area` int(11) NULL DEFAULT NULL COMMENT '区/县' AFTER `city`;


INSERT INTO `ol_admin_config`(`name`, `title`, `group`, `type`, `value`, `options`, `tips`, `ajax_url`, `next_items`, `param`, `format`, `table`, `level`, `key`, `option`, `pid`, `ak`, `create_time`, `update_time`, `sort`, `status`)
VALUES ('teacher_education', '教师学历', 'type', 'checkbox', '1', '1:研究生\n2:本科\n3:大专\n4:高中', '', '', '', '', '', '', 0, '', '', '', '', unix_timestamp(), unix_timestamp(), 100, 1);

ALTER TABLE `ol_live_student`
ADD COLUMN `is_notice` tinyint(1) NULL COMMENT '是否已经发送进入教室通知';