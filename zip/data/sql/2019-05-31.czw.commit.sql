DROP TABLE IF EXISTS `ol_cms_demo_show`;
CREATE TABLE `ol_cms_demo_show`  (
                                   `id` int(11) NOT NULL AUTO_INCREMENT,
                                   `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
                                   `course_sid` int(11) NULL DEFAULT NULL COMMENT '课程阶段id',
                                   `course_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程阶段名称',
                                   `chapter_id` int(11) NULL DEFAULT NULL COMMENT '课件id',
                                   `chapter_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课件名',
                                   `content_img` int(11) NULL DEFAULT NULL COMMENT '学习内容附件',
                                   `link_img` int(11) NULL DEFAULT NULL COMMENT '知识链接附件',
                                   `detail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '课堂表现',
                                   `adminid` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '创建人id',
                                   `create_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '操作时间',
                                   `update_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '更新时间',
                                   `status` int(1) NULL DEFAULT NULL COMMENT '状态 1:成功2:失败',
                                   `course_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程阶段id数组',
                                   PRIMARY KEY (`id`) USING BTREE,
                                   INDEX `id`(`id`) USING BTREE,
                                   INDEX `course_id`(`course_sid`) USING BTREE,
                                   INDEX `chapter_id`(`chapter_id`) USING BTREE,
                                   INDEX `title`(`title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'demo课后评价课堂表现-陈忠伟' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ol_cms_demo_start
-- ----------------------------
DROP TABLE IF EXISTS `ol_cms_demo_start`;
CREATE TABLE `ol_cms_demo_start`  (
                                    `id` int(11) NOT NULL AUTO_INCREMENT,
                                    `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                    `course_id` int(11) NULL DEFAULT NULL COMMENT '课程阶段id',
                                    `course_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程阶段名称',
                                    `detail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '课堂表现',
                                    `adminid` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '创建人id',
                                    `create_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '操作时间',
                                    `update_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '更新时间',
                                    `status` int(1) NULL DEFAULT NULL COMMENT '状态 1:成功2:失败',
                                    PRIMARY KEY (`id`) USING BTREE,
                                    INDEX `id`(`id`) USING BTREE,
                                    INDEX `course_id`(`course_id`) USING BTREE,
                                    INDEX `title`(`title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'demo课后评价建议起始级别-陈忠伟' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ol_cms_demo_suggest
-- ----------------------------
DROP TABLE IF EXISTS `ol_cms_demo_suggest`;
CREATE TABLE `ol_cms_demo_suggest`  (
                                      `id` int(11) NOT NULL AUTO_INCREMENT,
                                      `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                      `course_sid` int(11) NULL DEFAULT NULL COMMENT '课程阶段id',
                                      `course_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程阶段名称',
                                      `detail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '课堂表现',
                                      `adminid` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '创建人id',
                                      `create_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '操作时间',
                                      `update_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '更新时间',
                                      `status` int(1) NULL DEFAULT NULL COMMENT '状态 1:成功2:失败',
                                      `course_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程阶段id数组',
                                      PRIMARY KEY (`id`) USING BTREE,
                                      INDEX `id`(`id`) USING BTREE,
                                      INDEX `course_id`(`course_sid`) USING BTREE,
                                      INDEX `title`(`title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'demo课后评价建议起始级别-陈忠伟' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

SELECT @api_id := `id` FROM `ol_admin_menu` WHERE `title` = 'api管理' AND `pid` = 0;
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
           'demo课后评价管理',
          '	module_admin',
           'api_cms_demo',
           'api/cms_demo',
           '_self',
           0,
           unix_timestamp(),
           unix_timestamp(),
           100,
           0,
           1
         );

SELECT @demo_id := `id` FROM `ol_admin_menu` WHERE `title` = 'demo课后评价管理' AND `pid` = @api_id;

INSERT INTO `ol_admin_menu`(`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@demo_id, 'api', '获取课堂表现列表', '', 'module_admin', 'api_cms_demo_show_getList', 'api/cms_demo_show/getlist', '_self', 0,  unix_timestamp(),  unix_timestamp(), 100, 0, 1, '', 'no_limit', 1);
INSERT INTO `ol_admin_menu`(`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@demo_id, 'api', '添加课堂表现', '', 'module_admin', 'api_cms_demo_show_add', 'api/cms_demo_show/add', '_self', 0,  unix_timestamp(),  unix_timestamp(), 100, 0, 1, '', 'no_limit', 1);
INSERT INTO `ol_admin_menu`(`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@demo_id, 'api', '获取课堂表现', '', 'module_admin', 'api_cms_demo_show_getData', 'api/cms_demo_show/getdata', '_self', 0,  unix_timestamp(),  unix_timestamp(), 100, 0, 1, '', 'no_limit', 1);
INSERT INTO `ol_admin_menu`(`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@demo_id, 'api', '编辑课堂表现', '', 'module_admin', 'api_cms_demo_show_editShow', 'api/cms_demo_show/editshow', '_self', 0,  unix_timestamp(),  unix_timestamp(), 100, 0, 1, '', 'no_limit', 1);
INSERT INTO `ol_admin_menu`(`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@demo_id, 'api', '编辑课堂表现状态', '', 'module_admin', 'api_cms_demo_show_editStatus', 'api/cms_demo_show/editstatus', '_self', 0,  unix_timestamp(),  unix_timestamp(), 100, 0, 1, '', 'no_limit', 1);
INSERT INTO `ol_admin_menu`(`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@demo_id, 'api', '删除课堂表现', '', 'module_admin', 'api_cms_demo_show_del', 'api/cms_demo_show/del', '_self', 0,  unix_timestamp(),  unix_timestamp(), 100, 0, 1, '', 'no_limit', 1);
INSERT INTO `ol_admin_menu`(`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@demo_id, 'api', '删除建议起始级别', '', 'module_admin', 'api_cms_demo_start_del', 'api/cms_demo_start/del', '_self', 0,  unix_timestamp(),  unix_timestamp(), 100, 0, 1, '', 'no_limit', 1);
INSERT INTO `ol_admin_menu`(`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@demo_id, 'api', '编辑建议起始级别状态', '', 'module_admin', 'api_cms_demo_start_editStatus', 'api/cms_demo_start/editstatus', '_self', 0,  unix_timestamp(),  unix_timestamp(), 100, 0, 1, '', 'no_limit', 1);
INSERT INTO `ol_admin_menu`(`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@demo_id, 'api', '编辑建议起始级别', '', 'module_admin', 'api_cms_demo_start_editShow', 'api/cms_demo_start/editshow', '_self', 0,  unix_timestamp(),  unix_timestamp(), 100, 0, 1, '', 'no_limit', 1);
INSERT INTO `ol_admin_menu`(`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@demo_id, 'api', '获取建议起始级别', '', 'module_admin', 'api_cms_demo_start_getData', 'api/cms_demo_start/getdata', '_self', 0,  unix_timestamp(),  unix_timestamp(), 100, 0, 1, '', 'no_limit', 1);
INSERT INTO `ol_admin_menu`(`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@demo_id, 'api', '添加建议起始级别', '', 'module_admin', 'api_cms_demo_start_add', 'api/cms_demo_start/add', '_self', 0,  unix_timestamp(),  unix_timestamp(), 100, 0, 1, '', 'no_limit', 1);
INSERT INTO `ol_admin_menu`(`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@demo_id, 'api', '获取建议起始级别列表', '', 'module_admin', 'api_cms_demo_start_getList', 'api/cms_demo_start/getlist', '_self', 0,  unix_timestamp(),  unix_timestamp(), 100, 0, 1, '', 'no_limit', 1);
INSERT INTO `ol_admin_menu`(`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@demo_id, 'api', '删除学习建议', '', 'module_admin', 'api_cms_demo_suggest_del', 'api/cms_demo_suggest/del', '_self', 0,  unix_timestamp(),  unix_timestamp(), 100, 0, 1, '', 'no_limit', 1);
INSERT INTO `ol_admin_menu`(`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@demo_id, 'api', '编辑学习建议状态', '', 'module_admin', 'api_cms_demo_suggest_editStatus', 'api/cms_demo_suggest/editstatus', '_self', 0,  unix_timestamp(),  unix_timestamp(), 100, 0, 1, '', 'no_limit', 1);
INSERT INTO `ol_admin_menu`(`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@demo_id, 'api', '编辑学习建议', '', 'module_admin', 'api_cms_demo_suggest_editShow', 'api/cms_demo_suggest/editshow', '_self', 0,  unix_timestamp(),  unix_timestamp(), 100, 0, 1, '', 'no_limit', 1);
INSERT INTO `ol_admin_menu`(`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@demo_id, 'api', '获取学习建议', '', 'module_admin', 'api_cms_demo_suggest_getData', 'api/cms_demo_suggest/getdata', '_self', 0,  unix_timestamp(),  unix_timestamp(), 100, 0, 1, '', 'no_limit', 1);
INSERT INTO `ol_admin_menu`(`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@demo_id, 'api', '添加学习建议', '', 'module_admin', 'api_cms_demo_suggest_add', 'api/cms_demo_suggest/add', '_self', 0,  unix_timestamp(),  unix_timestamp(), 100, 0, 1, '', 'no_limit', 1);
INSERT INTO `ol_admin_menu`(`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@demo_id, 'api', '获取学习建议列表', '', 'module_admin', 'api_cms_demo_suggest_getList', 'api/cms_demo_suggest/getlist', '_self', 0,  unix_timestamp(),  unix_timestamp(), 100, 0, 1, '', 'no_limit', 1);
INSERT INTO `ol_admin_menu`(`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@demo_id, 'api', '获取课程列表', '', 'module_admin', 'api_cms_demo_show_categoryCascader', 'api/cms_demo_show/categorycascader', '_self', 0,  unix_timestamp(),  unix_timestamp(), 100, 0, 1, '', 'no_limit', 1);
INSERT INTO `ol_admin_menu`(`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@demo_id, 'api', '获取课件列表', '', 'module_admin', 'api_cms_demo_show_getChapter', 'api/cms_demo_show/getchapter', '_self', 0,  unix_timestamp(),  unix_timestamp(), 100, 0, 1, '', 'no_limit', 1);