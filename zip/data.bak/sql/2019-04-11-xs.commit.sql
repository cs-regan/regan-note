
SELECT @absence_id := `id` FROM `ol_admin_menu` WHERE `url_key` = 'api_missed_lessons_makeup_module';
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
	@absence_id,
	'api',
	'学员开新班补课',
	'module_admin',
	'api_ClassAbsence_tutorToNewLive',
	'api/class_absence/tutortonewlive',
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
	@absence_id,
	'api',
	'学员插班补课',
	'module_admin',
	'api_ClassAbsence_tutorToLive',
	'api/class_absence/tutortolive',
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
	@absence_id,
	'api',
	'课节资源-获取空闲老师',
	'module_admin',
	'api_liveResource_getTeachList',
	'api/live_resource/getteachlist',
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
	@absence_id,
	'api',
	'课节资源-老师周期排课状态',
	'module_admin',
	'api_liveResource_getLiveToTeacher',
	'api/live_resource/getlivetoteacher',
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
	@absence_id,
	'api',
	'课节资源-老师周期排课状态',
	'module_admin',
	'api_liveResource_getLiveDetail',
	'api/live_resource/getlivedetail',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);



INSERT INTO `ol_admin_action`(
	`module`,
	`name`,
	`title`,
	`remark`,
	`rule`,
	`log`,
	`status`,
	`create_time`,
	`update_time`
) VALUES (
	'api',
	'live_absence',
	'缺勤补课记录',
	'缺勤补课记录',
	'',
	'[user|get_nickname] 安排学员补课：[details]',
	1,
	unix_timestamp(),
	unix_timestamp()
);
