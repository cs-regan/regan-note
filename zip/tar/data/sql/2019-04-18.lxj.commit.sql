drop table if exists `ol_class_apply_setting`;
create table if not exists `ol_class_apply_setting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '课程大类',
  `category_sid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '课程阶段',
  `oper_id` int(11) unsigned NOT NULL COMMENT '操作人id',
  `start_value` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '允许的值区间',
  `end_value` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '允许的值区间- 该值为0表示整个阶段禁用',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='可排课设置表';

SELECT @api_id := `id` FROM `ol_admin_menu` WHERE `title` = '排课模块';

DELETE FROM `ol_admin_menu` WHERE `url_value` = 'api/class_apply_setting/saveall';
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
	'批量设置允许排课的课节',
	'module_admin',
	'api_ClassApplySetting_saveAll',
	'api/class_apply_setting/saveall',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);

DELETE FROM `ol_admin_menu` WHERE `url_value` = 'api/class_apply_setting/list';
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
	'获取允许排课配置列表',
	'module_admin',
	'api_ClassApplySetting_list',
	'api/class_apply_setting/list',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);