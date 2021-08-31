
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ol_promotion_apply
-- ----------------------------
DROP TABLE IF EXISTS `ol_promotion_apply`;
CREATE TABLE `ol_promotion_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '姓名',
  `wx_name` varchar(64) NOT NULL DEFAULT '' COMMENT '微信昵称',
  `wx_avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '微信头像',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '时间',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `wx_number` varchar(64) NOT NULL DEFAULT '' COMMENT '微信号',
  `sex` tinyint(2) NOT NULL DEFAULT '1' COMMENT '性别',
  `birthday` date NOT NULL COMMENT '生日',
  `wx_code` int(11) NOT NULL DEFAULT '0' COMMENT '微信二维码',
  `openid` varchar(255) NOT NULL DEFAULT '' COMMENT '微信openID',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0：待审核 1：通过 2：不通过',
  `approval_uid` int(11) NOT NULL DEFAULT '0' COMMENT '审核人',
  `approval_time` int(11) NOT NULL DEFAULT '0' COMMENT '审核时间',
  `ago_is_sale` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否从事销售',
  `ago_is_operation` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否运营过微信群',
  `scale` tinyint(2) NOT NULL DEFAULT '1' COMMENT '微信群规模',
  `msg` varchar(556) NOT NULL DEFAULT '' COMMENT '审核详情',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='推广顾问申请表';

-- ----------------------------
-- Table structure for ol_promotion_poster_log
-- ----------------------------
DROP TABLE IF EXISTS `ol_promotion_poster_log`;
CREATE TABLE `ol_promotion_poster_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `promotion_id` int(11) NOT NULL DEFAULT '0' COMMENT '推广顾问ID',
  `file_path` varchar(255) NOT NULL DEFAULT '' COMMENT '文件路径',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='推广顾问海报生成记录表';

-- ----------------------------
-- Table structure for ol_promotion_present_user
-- ----------------------------
DROP TABLE IF EXISTS `ol_promotion_present_user`;
CREATE TABLE `ol_promotion_present_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `promotion_id` int(11) NOT NULL DEFAULT '0' COMMENT '顾问ID',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `promotion_id` (`promotion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='推广顾问推荐用户表';

-- ----------------------------
-- Table structure for ol_promotion_user
-- ----------------------------
DROP TABLE IF EXISTS `ol_promotion_user`;
CREATE TABLE `ol_promotion_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '姓名',
  `wx_name` varchar(64) NOT NULL DEFAULT '' COMMENT '微信昵称',
  `wx_avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '微信头像',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '时间',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `wx_number` varchar(64) NOT NULL DEFAULT '' COMMENT '微信号',
  `sex` tinyint(2) NOT NULL DEFAULT '1' COMMENT '性别',
  `birthday` date NOT NULL COMMENT '生日',
  `wx_code` int(11) NOT NULL DEFAULT '0' COMMENT '微信二维码',
  `openid` varchar(255) NOT NULL DEFAULT '' COMMENT '微信openID',
  `ago_is_sale` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否从事销售',
  `ago_is_operation` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否运营过微信群',
  `scale` tinyint(2) NOT NULL DEFAULT '1' COMMENT '微信群规模',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父级ID',
  `alg` smallint(5) NOT NULL DEFAULT '1' COMMENT '代数',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：在职 2：离职',
  `province` varchar(56) NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(56) NOT NULL DEFAULT '' COMMENT '市',
  `area` varchar(56) NOT NULL DEFAULT '' COMMENT '区',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `bank_number` varchar(20) NOT NULL DEFAULT '' COMMENT '银行卡号',
  `bank_user` varchar(64) NOT NULL DEFAULT '' COMMENT '银行收款人',
  `bank` varchar(255) NOT NULL DEFAULT '' COMMENT '开户行',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid` (`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='推广顾问表';

ALTER TABLE `ol_msg_template` ADD COLUMN `body`  tinyint(2) UNSIGNED NULL DEFAULT 1 COMMENT '微信主体 1：豌豆思维服务号 2：推广顾问';
INSERT INTO `ol_msg_template` (`template_id`, `title`, `primary_industry`, `deputy_industry`, `url`, `content`, `example`, `create_time`, `tmp_at`, `remark`, `first`, `body`) VALUES ('OPYybFbIXZ1EyOc-jXztloLrZy5FxgvoO3EBYs64kyw', '成员加入通知', 'IT科技', '  互联网|电子商务', NULL, '{{first.DATA}}姓名：{{keyword1.DATA}}时间：{{keyword2.DATA}}{{remark.DATA}}', NULL, 0, '2019-4-9 18:14:56', '', '您有一位新学员注册，请及时跟进并排课', 2);
INSERT INTO `ol_msg_template` (`template_id`, `title`, `primary_industry`, `deputy_industry`, `url`, `content`, `example`, `create_time`, `tmp_at`, `remark`, `first`, `body`) VALUES ('RifQNo43mI2S5zj9lah7mbbcrs_sPOSUakMkF7AKqME', '课程结束通知', 'IT科技', '  互联网|电子商务', '', '{{first.DATA}}课程名称：{{keyword1.DATA}}结束时间：{{keyword2.DATA}}{{remark.DATA}}', '', 0, '2019-4-9 18:14:56', '', '您有一位新学员今天上课，请及时跟进', 2);
INSERT INTO `ol_msg_template` (`template_id`, `title`, `primary_industry`, `deputy_industry`, `url`, `content`, `example`, `create_time`, `tmp_at`, `remark`, `first`, `body`) VALUES ('llwCHYeKJqCX-jklJj-tgHp3r9DAfN9Wh_P2PjOQaJE', '购买成功通知', 'IT科技', '  互联网|电子商务', '', '{{first.DATA}}商品名称：{{keyword1.DATA}}消费金额：{{keyword2.DATA}}购买时间：{{keyword3.DATA}}{{remark.DATA}}', '', 0, '2019-4-9 18:14:56', '', '您有一位新学员已支付', 2);
INSERT INTO `ol_msg_template` (`template_id`, `title`, `primary_industry`, `deputy_industry`, `url`, `content`, `example`, `create_time`, `tmp_at`, `remark`, `first`, `body`) VALUES ('p2dq8fPEQmdCvpEFSiyKDciPculhCcBjMg57AwPwP64', '审核结果通知', 'IT科技', '  互联网|电子商务', '', '{{first.DATA}}会员名称：{{keyword1.DATA}}审核结果：{{keyword2.DATA}}处理时间：{{keyword3.DATA}}{{remark.DATA}}', '', 0, '2019-4-9 18:14:56', '', '您的申请结果已经出来啦', 2);


INSERT INTO `online`.`ol_admin_menu` (`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES ('0', 'promotion', '推广顾问管理', '', 'module_admin', 'promotion_index_aaa', 'promotion/index/aaa', '_self', '0', unix_timestamp(), unix_timestamp(), '100', '0', '1', '', 'no_limit', '1');


SELECT @a := `id` FROM `ol_admin_menu` WHERE `url_key` = 'promotion_index_aaa';
INSERT INTO `online`.`ol_admin_menu` (`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@a, 'promotion', '推广顾问列表', '', 'module_admin', 'promotion_index_index', 'promotion/index/index', '_self', '0', unix_timestamp(), unix_timestamp(), '100', '0', '1', '', 'no_limit', '1');
INSERT INTO `online`.`ol_admin_menu` (`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@a, 'promotion', '推广顾问学员列表', '', 'module_admin', 'promotion_student_index', 'promotion/student/index', '_self', '0', unix_timestamp(), unix_timestamp(), '100', '0', '1', '', 'no_limit', '1');




SELECT @b := `id` FROM `ol_admin_menu` WHERE `url_key` = 'promotion_index_index';
INSERT INTO `online`.`ol_admin_menu` (`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@b, 'promotion', '推广顾问申请列表', '', 'module_admin', 'promotion_index_apply', 'promotion/index/apply', '_self', '0', unix_timestamp(), unix_timestamp(), '100', '0', '1', '', 'no_limit', '1');
INSERT INTO `online`.`ol_admin_menu` (`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@b, 'promotion', '推广顾问详情', '', 'module_admin', 'promotion_index_detail', 'promotion/index/detail', '_self', '0', unix_timestamp(), unix_timestamp(), '100', '0', '1', '', 'no_limit', '1');
INSERT INTO `online`.`ol_admin_menu` (`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@b, 'promotion', '推广顾问推荐的人', '', 'module_admin', 'promotion_index_present', 'promotion/index/present', '_self', '0', unix_timestamp(), unix_timestamp(), '100', '0', '1', '', 'no_limit', '1');
INSERT INTO `online`.`ol_admin_menu` (`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@b, 'promotion', '推广顾问申请详情', '', 'module_admin', 'promotion_index_applyDetail', 'promotion/index/applyDetail', '_self', '0', unix_timestamp(), unix_timestamp(), '100', '0', '1', '', 'no_limit', '1');
INSERT INTO `online`.`ol_admin_menu` (`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@b, 'promotion', '推广顾问审核', '', 'module_admin', 'promotion_index_approval', 'promotion/index/approval', '_self', '0', unix_timestamp(), unix_timestamp(), '100', '0', '1', '', 'no_limit', '1');



SELECT @c := `id` FROM `ol_admin_menu` WHERE `url_key` = 'promotion_student_index';
INSERT INTO `online`.`ol_admin_menu` (`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@c, 'promotion', '推广顾问学员详情', '', 'module_admin', 'promotion_student_detail', 'promotion/student/detail', '_self', '0', unix_timestamp(), unix_timestamp(), '100', '0', '1', '', 'no_limit', '1');
INSERT INTO `online`.`ol_admin_menu` (`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@c, 'promotion', '推广顾问学员详情', '', 'module_admin', 'promotion_student_userClassLog', 'promotion/student/userClassLog', '_self', '0', unix_timestamp(), unix_timestamp(), '100', '0', '1', '', 'no_limit', '1');
INSERT INTO `online`.`ol_admin_menu` (`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@c, 'promotion', '推广顾问修改用户信息', '', 'module_admin', 'promotion_student_updateUserInfo', 'promotion/student/updateUserInfo', '_self', '0', unix_timestamp(), unix_timestamp(), '100', '0', '1', '', 'no_limit', '1');
INSERT INTO `online`.`ol_admin_menu` (`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@c, 'promotion', '推广顾问demo课选项', '', 'module_admin', 'promotion_student_demoLiveOption', 'promotion/student/demoLiveOption', '_self', '0', unix_timestamp(), unix_timestamp(), '100', '0', '1', '', 'no_limit', '1');
INSERT INTO `online`.`ol_admin_menu` (`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@c, 'promotion', '推广顾问demo课提交', '', 'module_admin', 'promotion_student_demoLiveSelect', 'promotion/student/demoLiveSelect', '_self', '0', unix_timestamp(), unix_timestamp(), '100', '0', '1', '', 'no_limit', '1');
INSERT INTO `online`.`ol_admin_menu` (`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@c, 'promotion', '推广顾问加入demo课', '', 'module_admin', 'promotion_student_joinDemoLive', 'promotion/student/joinDemoLive', '_self', '0', unix_timestamp(), unix_timestamp(), '100', '0', '1', '', 'no_limit', '1');
INSERT INTO `online`.`ol_admin_menu` (`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@c, 'promotion', '推广顾问获取课件详情', '', 'module_admin', 'promotion_student_getchapterAbout', 'promotion/student/getchapterAbout', '_self', '0', unix_timestamp(), unix_timestamp(), '100', '0', '1', '', 'no_limit', '1');
