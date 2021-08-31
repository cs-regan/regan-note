SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE `ol_order_class_apply_log` ADD COLUMN `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '其他备注' AFTER `submit_time`;

drop table if exists `ol_class_apply_operation_log`;
CREATE TABLE IF NOT EXISTS `ol_class_apply_operation_log`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `apply_id` int(11) UNSIGNED NOT NULL COMMENT '排班申请id',
  `progress` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1:排课申请|2:分配CR|3:排课|4:寄送教具',
  `operator_id` int(11) NOT NULL DEFAULT -1 COMMENT '-1:为系统，正数为管理员id',
  `operator_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人名称；冗余字段，操作者名称更新可以不更新该字段（看情况）',
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '动作描述（如: \"操作排课\"）',
  `extra` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT ' 附加数据(如：\"首课时间：2019‑01‑02 1300 首课课件：xxx课件 首课老师：xxx老师\")',
  `update_time` int(11) UNSIGNED NOT NULL,
  `create_time` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `apply_id`(`apply_id`) USING BTREE,
  INDEX `operator_id`(`operator_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '排班申请操作记录表' ROW_FORMAT = Dynamic;

drop table if exists `ol_cr_class_grade_setting`;
CREATE TABLE IF NOT EXISTS `ol_cr_class_grade_setting`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cr_id` int(11) UNSIGNED NOT NULL COMMENT '班主任id',
  `grade_id` int(11) UNSIGNED NOT NULL COMMENT '年级 ID',
  `grade_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '年级标题',
  `update_time` int(11) UNSIGNED NOT NULL,
  `create_time` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cr_id`(`cr_id`) USING BTREE,
  INDEX `grade_id`(`grade_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CR 带班年级设置表' ROW_FORMAT = Dynamic;

drop table if exists `ol_cr_class_setting`;
CREATE TABLE IF NOT EXISTS `ol_cr_class_setting`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cr_id` int(11) UNSIGNED NOT NULL COMMENT '班主任id',
  `max_classes` int(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大带班数',
  `is_active` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '是否带班',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `update_time` int(11) UNSIGNED NOT NULL,
  `create_time` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `cr_id`(`cr_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CR 带班设置表' ROW_FORMAT = Dynamic;

drop table if exists `ol_cr_tag`;
CREATE TABLE IF NOT EXISTS `ol_cr_tag`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cr_id` int(11) UNSIGNED NOT NULL COMMENT '班主任id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标签名称',
  `update_time` int(11) UNSIGNED NOT NULL,
  `create_time` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cr_id`(`cr_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CR 标签表' ROW_FORMAT = Dynamic;

drop table if exists `ol_student_tag`;
CREATE TABLE IF NOT EXISTS `ol_student_tag`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) UNSIGNED NOT NULL,
  `type` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '1:排课意向',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标签名',
  `update_time` int(11) UNSIGNED NOT NULL,
  `create_time` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学员标签表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS=1;

ALTER TABLE `ol_student_tag`
ADD COLUMN `config_name` varchar(255) NOT NULL COMMENT '对应的配置名称' AFTER `type`,
ADD COLUMN `config_key` int(11) NOT NULL COMMENT '配置下的key' AFTER `config_name`;

DELETE FROM `ol_plugin_sms` WHERE `tpl` = 'apply_class_success';
INSERT INTO `ol_plugin_sms`(`type`, `tpl`, `title`, `remark`, `code`, `qcloud_code`, `yunpian_code`, `sign_name`, `create_time`, `update_time`, `status`) VALUES
( 0, 'apply_class_success', '排课成功通知家长', '家长您好，您孩子的课已经安排好了，首课时间：{1}，您有任何问题可关注【豌豆思维服务号】或联系您的专属班主任：{2}','', '287035', '', '豌豆思维VIPThink', 0, 0, 1);

DELETE FROM `ol_plugin_sms` WHERE `tpl` = 'assign_cr_success';
INSERT INTO `ol_plugin_sms`(`type`, `tpl`, `title`, `remark`, `code`, `qcloud_code`, `yunpian_code`, `sign_name`, `create_time`, `update_time`, `status`) VALUES
( 0, 'assign_cr_success', '学员分配CR成功通知', '家长您好，已经为您的孩子分配专属班主任，您有任何问题可关注【豌豆思维服务号】或联系您的专属班主任：{1}','', '287038', '', '豌豆思维VIPThink', 0, 0, 1);
