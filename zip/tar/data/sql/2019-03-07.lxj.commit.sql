SELECT @cc_apply_module_id := `id` FROM `ol_admin_menu` WHERE `url_key` = 'api_courseSchedule_temp';
DELETE FROM `ol_admin_menu` WHERE `url_value` = 'api/student/setstudentbasicinfo';
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
	@cc_apply_module_id,
	'api',
	'cc-排课申请-设置学生基本信息',
	'module_admin',
    'api_student_setStudentBasicInfo',
    'api/student/setstudentbasicinfo',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);
DELETE FROM `ol_admin_menu` WHERE `url_value` = 'api/live_grade_apply/setstudentaddress';
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
	@cc_apply_module_id,
	'api',
	'cc-排课申请-设置学员寄送地址接口',
	'module_admin',
	'api_liveGradeApply_setStudentAddress',
	'api/live_grade_apply/setstudentaddress',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);
DELETE FROM `ol_admin_menu` WHERE `url_value` = 'api/live_grade_apply/setstudenttags';
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
	@cc_apply_module_id,
	'api',
	'cc-排课申请-设置/修改学员标签',
	'module_admin',
	'api_liveGradeApply_setStudentTags',
	'api/live_grade_apply/setstudenttags',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);
DELETE FROM `ol_admin_menu` WHERE `url_value` = 'api/live_grade_apply/setapplyprofile';
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
	@cc_apply_module_id,
	'api',
	'cc-排课申请-完善信息',
	'module_admin',
	'api_liveGradeApply_setApplyProfile',
	'api/live_grade_apply/setapplyprofile',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);
DELETE FROM `ol_admin_menu` WHERE `url_value` = 'api/student/getstudenttags';
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
	@cc_apply_module_id,
	'api',
	'获取系统配置学员标签',
	'module_admin',
	'api_student_getStudentTags',
	'api/student/getstudenttags',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);
DELETE FROM `ol_admin_menu` WHERE `url_value` = 'api/live_grade_apply/getUserApplyLog';
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
	@cc_apply_module_id,
	'api',
	'cc-排课申请-获取排课进度',
	'module_admin',
	'api_liveGradeApply_getUserApplyLog',
	'api/live_grade_apply/getUserApplyLog',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);

SELECT @cr_module_id := `id` FROM `ol_admin_menu` WHERE `url_key` = 'api_cr_index';
DELETE FROM `ol_admin_menu` WHERE `url_value` = 'api/cr/getcrwithgrade';
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
	@cr_module_id,
	'api',
	'cr-获取cr带班信息',
	'module_admin',
	'api_cr_getCrWithGrade',
	'api/cr/getcrwithgrade',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);

DELETE FROM `ol_admin_action` WHERE `name` = 'setCrWithGrade';
INSERT INTO `ol_admin_action`(`module`, `name`, `title`, `remark`, `rule`, `log`, `status`, `create_time`, `update_time`) VALUES ('api', 'setCrWithGrade', '编辑cr带班设置', '编辑cr带班设置', '', '[user|get_nickname] 编辑了带班设置：[details]', 1, unix_timestamp(), unix_timestamp());
DELETE FROM `ol_admin_action` WHERE `name` = 'setStudentInfo';
INSERT INTO `ol_admin_action`(`module`, `name`, `title`, `remark`, `rule`, `log`, `status`, `create_time`, `update_time`) VALUES ('api', 'setStudentInfo', '排课-修改学员信息', '排课-修改学员信息', '', '[user|get_nickname] 修改了学员的基本信息：[details]', 1, unix_timestamp(), unix_timestamp());

DELETE FROM `ol_admin_config` WHERE `name` = 'student_tags_type';
INSERT INTO `ol_admin_config`(`name`, `title`, `group`, `type`, `value`, `options`, `tips`, `ajax_url`, `next_items`, `param`, `format`, `table`, `level`, `key`, `option`, `pid`, `ak`, `create_time`, `update_time`, `sort`, `status`)
 VALUES ('student_tags_type', '学员标签大类', 'type', 'array',
'student_tags_list_character\nstudent_tags_list_basis\nstudent_tags_list_ability\nstudent_tags_list_parent\nstudent_tags_list_learning',
'', '', '', '', '', '', '', 0, '', '', '', '', unix_timestamp(), unix_timestamp(), 100, 1);

DELETE FROM `ol_admin_config` WHERE `name` = 'student_tags_list_character';
INSERT INTO `ol_admin_config`(`name`, `title`, `group`, `type`, `value`, `options`, `tips`, `ajax_url`, `next_items`, `param`, `format`, `table`, `level`, `key`, `option`, `pid`, `ak`, `create_time`, `update_time`, `sort`, `status`)
 VALUES ('student_tags_list_character', '性格方面', 'type', 'checkbox', '1',
'1:活泼好动\n2:内敛慢热\n3:开朗热情\n4:内心不爱说话',
'', '', '', '', '', '', 0, '', '', '', '', unix_timestamp(), unix_timestamp(), 100, 1);

DELETE FROM `ol_admin_config` WHERE `name` = 'student_tags_list_basis';
INSERT INTO `ol_admin_config`(`name`, `title`, `group`, `type`, `value`, `options`, `tips`, `ajax_url`, `next_items`, `param`, `format`, `table`, `level`, `key`, `option`, `pid`, `ak`, `create_time`, `update_time`, `sort`, `status`)
 VALUES ('student_tags_list_basis', '基础方面', 'type', 'radio', '1',
'1:学过一年类似课程\n2:学过半年类似课程\n3:学过三个月类似课程\n4:刚接触\n5:零基础',
'', '', '', '', '', '', 0, '', '', '', '', unix_timestamp(), unix_timestamp(), 100, 1);

DELETE FROM `ol_admin_config` WHERE `name` = 'student_tags_list_ability';
INSERT INTO `ol_admin_config`(`name`, `title`, `group`, `type`, `value`, `options`, `tips`, `ajax_url`, `next_items`, `param`, `format`, `table`, `level`, `key`, `option`, `pid`, `ak`, `create_time`, `update_time`, `sort`, `status`)
 VALUES ('student_tags_list_ability', '能力方面', 'type', 'checkbox', '1',
'1:逻辑推理\n2:空间几何\n3:数与计算\n4:生活与认知\n5:概率统计\n6:其他',
 '', '', '', '', '', '', 0, '', '', '', '', unix_timestamp(), unix_timestamp(), 100, 1);

DELETE FROM `ol_admin_config` WHERE `name` = 'student_tags_list_parent';
INSERT INTO `ol_admin_config`(`name`, `title`, `group`, `type`, `value`, `options`, `tips`, `ajax_url`, `next_items`, `param`, `format`, `table`, `level`, `key`, `option`, `pid`, `ak`, `create_time`, `update_time`, `sort`, `status`)
 VALUES ('student_tags_list_parent', '家长教学', 'type', 'radio', '1',
'1:需要借助教具\n2:不需要借助教具',
'', '', '', '', '', '', 0, '', '', '', '', unix_timestamp(), unix_timestamp(), 100, 1);

DELETE FROM `ol_admin_config` WHERE `name` = 'student_tags_list_learning';
INSERT INTO `ol_admin_config`(`name`, `title`, `group`, `type`, `value`, `options`, `tips`, `ajax_url`, `next_items`, `param`, `format`, `table`, `level`, `key`, `option`, `pid`, `ak`, `create_time`, `update_time`, `sort`, `status`)
 VALUES ('student_tags_list_learning', '学习能力', 'type', 'radio', '1',
'1:强\n2:中等\n3:偏慢',
'', '', '', '', '', '', 0, '', '', '', '', unix_timestamp(), unix_timestamp(), 100, 1);

DELETE FROM `ol_plugin_sms` WHERE `tpl` = 'enter_classromm';
INSERT INTO `ol_plugin_sms`(`type`, `tpl`, `title`, `remark`, `code`, `qcloud_code`, `yunpian_code`, `sign_name`, `create_time`, `update_time`, `status`)
 VALUES ( 0, 'enter_classromm', '学生进入课室通知', '您的孩子已进入教室上课~上课时间：{1}、上课老师：{2}、上课课件：{3}','', '291263', '', '豌豆思维VIPThink', unix_timestamp(), unix_timestamp(), 1);