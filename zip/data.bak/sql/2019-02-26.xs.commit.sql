alter table ol_classs add insertable_time INT(11) NOT NULL DEFAULT 0 comment '可插入学员授课时间';
alter table ol_course_category add course_type tinyint(1) NOT NULL DEFAULT 0 comment '课类类型，暂时用于管理显示正课课类';
update ol_course_category set course_type=1 where id=36;

SELECT @api_id := `id` FROM `ol_admin_menu` WHERE `title` = 'api管理' AND `pid` = 0;

SELECT @cr_module_id := `id` FROM `ol_admin_menu` WHERE `url_key` = 'api_cr_index';

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
	'cc-学员合同列表',
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
	'cr-待排课学员列表',
	'module_admin',
	'api_cr_getUserApplyList',
	'api/cr/getuserapplylist',
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
	@cr_module_id,
	'api',
	'cr-待排课学员列表',
	'module_admin',
	'api_cr_getApplyUserDetail',
	'api/cr/getapplyuserdetail',
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
	@cr_module_id,
	'api',
	'cr-待排课学员列表',
	'module_admin',
	'api_cr_manageGradeList',
	'api/cr/managegradelist',
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
	@cr_module_id,
	'api',
	'cr-待排课学员列表',
	'module_admin',
	'api_cr_setCrWithGrade',
	'api/cr/setcrwithgrade',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);


