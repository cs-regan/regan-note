// 地址管理
ALTER TABLE `ol_user_address`
ADD COLUMN `country_id`  int(10) UNSIGNED NULL DEFAULT 0 COMMENT '国家id 默认0是中国' AFTER `user_id`;

ALTER TABLE `ol_user_address`
MODIFY COLUMN `phone`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '联系电话' AFTER `name`;

ALTER TABLE `ol_user_address`
ADD COLUMN `area_code`  varchar(10) NULL COMMENT '区号' AFTER `name`;

SELECT @api_id := `id` FROM `ol_admin_menu` WHERE `title` = '学员模块';

DELETE FROM `ol_admin_menu` WHERE `url_value` = 'api/user_address/getOverseasCountryList';
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
	'国外地址库联动查询',
	'module_admin',
	'api_userAddress_getOverseasCountryList',
	'api/user_address/getoverseascountryList',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);

DELETE FROM `ol_admin_menu` WHERE `url_value` = 'api/user_address/useraddresslist';
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
	'获取学员地址列表',
	'module_admin',
	'api_userAddress_userAddressList',
	'api/user_address/useraddresslist',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);

  DELETE FROM `ol_admin_menu` WHERE `url_value` = 'api/user_address/setuseraddress';
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
	'修改/新增学员地址',
	'module_admin',
	'api_userAddress_setUserAddress',
	'api/user_address/setuseraddress',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);

  DELETE FROM `ol_admin_menu` WHERE `url_value` = 'api/user_address/deleteuseraddress';
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
	'删除学员地址',
	'module_admin',
	'api_userAddress_deleteUserAddress',
	'api/user_address/deleteuseraddress',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);

  DELETE FROM `ol_admin_menu` WHERE `url_value` = 'api/user_address/setdefaultuseraddress';
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
	'设置用户地址为默认地址',
	'module_admin',
	'api_userAddress_setDefaultUserAddress',
	'api/user_address/setdefaultuseraddress',
	'_self',
	0,
	unix_timestamp(),
	unix_timestamp(),
	100,
	0,
	1
);