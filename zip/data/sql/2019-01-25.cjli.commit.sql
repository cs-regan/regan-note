SELECT @pid := `pid` FROM `ol_admin_menu` WHERE `title` = '班级老师列表';

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
	@pid,
	'api',
	'取指定时间段内无正课的老师列表',
	'module_admin',
	'api_teacher_getAvailableTeachersByStartDateAndTimeRange',
	'api/teacher/getAvailableTeachersByStartDateAndTimeRange',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);

--  DROP TABLE IF EXISTS `ol_curriculum`;
--  CREATE TABLE IF NOT EXISTS `ol_curriculum` (
    --  `id` int(11) NOT NULL AUTO_INCREMENT,
    --  `class_id` int(11) unsigned NOT NULL COMMENT '班级ID',
    --  `teacher_id` int(11) unsigned NOT NULL COMMENT '老师ID',
    --  `is_valid` tinyint(1) unsigned DEFAULT 1 NOT NULL COMMENT '是否有效：已经是正课或者等待审核，其余无效（比如预排课审核失败）',
    --  `week` tinyint(1) unsigned NOT NULL COMMENT '星期:1~7',
    --  `class_time` int(11) unsigned NOT NULL COMMENT '开班时间',
    --  `start_time` int(11) unsigned NOT NULL COMMENT '上课时间',
    --  `end_time` int(11) unsigned NOT NULL COMMENT '下课时间',
    --  PRIMARY KEY (`id`),
    --  KEY `idx_teacher_id` (`teacher_id`) USING BTREE,
    --  KEY `idx_week` (`week`) USING BTREE,
    --  KEY `idx_class_time` (`class_time`) USING BTREE,
    --  KEY `idx_start_time` (`start_time`) USING BTREE,
    --  KEY `idx_end_time` (`end_time`) USING BTREE
--  )  ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT '课程表(实际会执行的记录)';
