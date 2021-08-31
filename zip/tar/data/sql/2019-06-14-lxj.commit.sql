ALTER TABLE `ol_package`
ADD COLUMN `give_package`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '逗号分割' AFTER `camp_id`;

# 订单
SELECT @api_id := `id` FROM `ol_admin_menu` WHERE `url_key` = 'api_order_index';
# 获取订单套餐详情
DELETE FROM `ol_admin_menu` WHERE `url_key` = 'api_order_orderDetail';
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
	'获取订单详情',
	'module_admin',
	'api_order_orderDetail',
	'api/order/orderDetail',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);

# 订单系统优化1.0
# 套餐父节点
SELECT @api_id := `id` FROM `ol_admin_menu` WHERE `url_key` = 'api_package_index';
# 获取套餐课树形结构
DELETE FROM `ol_admin_menu` WHERE `url_key` = 'api_package_getPackageListTree';
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
	'获取套餐课树形结构',
	'module_admin',
	'api_package_getPackageListTree',
	'api/package/getpackagelistTree',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);

# 获取订单套餐详情
DELETE FROM `ol_admin_menu` WHERE `url_key` = 'api_package_getOrderPackageDetails';
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
	'获取订单套餐详情',
	'module_admin',
	'api_package_getOrderPackageDetails',
	'api/package/getorderpackagedetails',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);

# 获取套餐配置可赠送课类列表
DELETE FROM `ol_admin_menu` WHERE `url_key` = 'api_package_getPackageGiveHourList';
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
	'获取套餐配置可赠送课类列表',
	'module_admin',
	'api_package_getPackageGiveHourList',
	'api/package/getpackagegivehourlist',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);

#增加/修改套餐课时包关联
  DELETE FROM `ol_admin_menu` WHERE `url_key` = 'api_package_setPackageHour';
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
	'增加/修改套餐课时包关联',
	'module_admin',
	'api_package_setPackageHour',
	'api/package/setPackageHour',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);

#删除套餐课时包关联
  DELETE FROM `ol_admin_menu` WHERE `url_key` = 'api_package_deletePackageHour';
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
	'删除套餐课时包关联',
	'module_admin',
	'api_package_deletePackageHour',
	'api/package/deletePackageHour',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);

#获取套餐课时包数据
DELETE FROM `ol_admin_menu` WHERE `url_key` = 'api_package_getPackageHourDetail';
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
	'获取套餐课时包数据',
	'module_admin',
	'api_package_getPackageHourDetail',
	'api/package/getPackageHourDetail',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);

CREATE TABLE  IF NOT EXISTS `ol_package_hour` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `package_id` int(11) unsigned NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '套餐名称',
  `price` decimal(10,2) NOT NULL COMMENT '原价',
  `sale_price` decimal(10,2) NOT NULL COMMENT '活动价',
  `base_class` smallint(4) NOT NULL COMMENT '基础课时',
  `give_class` smallint(3) NOT NULL COMMENT '赠送课时',
  `package_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '套餐类型 1= 1V1, 2= 1V2 3= 1V4',
  `package_course_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '套餐类型 1正课 2活动课 （废弃）',
  `remedial_teach_class` int(11) DEFAULT '0' COMMENT 'AI互动补课课时',
  `expiry_date` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '有效期单位：月',
  `camp_id` int(11) DEFAULT '0' COMMENT '录播营ID',
  `cate_ids` text CHARACTER SET utf8 NOT NULL COMMENT '适用课类',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1正常 2删除',
  `update_time` int(11) unsigned DEFAULT '0',
  `create_time` int(11) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `package_id` (`package_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COMMENT='套餐关联课时表(需要兼容之前的package)';

CREATE TABLE  IF NOT EXISTS `ol_order_package_hour` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned NOT NULL COMMENT '订单id',
  `package_id` int(11) unsigned NOT NULL COMMENT '套餐id',
  `package_name` varchar(100) NOT NULL COMMENT '套餐名称',
  `name` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '课包名称',
  `price` decimal(10,2) NOT NULL COMMENT '原价',
  `sale_price` decimal(10,2) NOT NULL COMMENT '活动价',
  `base_class` smallint(4) NOT NULL COMMENT '基础课时',
  `give_class` smallint(3) NOT NULL COMMENT '赠送课时',
  `package_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '套餐类型 1= 1V1, 2= 1V2 3= 1V4',
  `package_course_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '套餐类型 1正课 2活动课 （废弃）',
  `remedial_teach_class` int(11) DEFAULT '0' COMMENT 'AI互动补课课时',
  `camp_id` int(11) DEFAULT '0' COMMENT '录播营ID',
  `expiry_date` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '有效期单位：月',
  `cate_ids` text CHARACTER SET utf8 NOT NULL COMMENT '适用课类',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1正常 2删除',
  `update_time` int(11) unsigned DEFAULT '0',
  `create_time` int(11) unsigned DEFAULT '0' COMMENT '创建时间',
  `pay_time` int(11) DEFAULT NULL COMMENT '支付时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=476 DEFAULT CHARSET=utf8mb4 COMMENT='订单关联套餐课时表';

