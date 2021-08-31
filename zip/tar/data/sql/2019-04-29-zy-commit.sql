UPDATE `ol_package` set package_course_type_sub = 1 where package_course_type = 1 and base_class >= 88;
UPDATE `ol_package` set package_course_type_sub = 2 where package_course_type = 1 and base_class > 24;
UPDATE `ol_package` set package_course_type_sub = 3 where package_course_type = 1 and base_class <= 24;


CREATE TABLE `ol_activity_sudoku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '姓名',
  `age` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '年龄',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='数独游戏记录表';

