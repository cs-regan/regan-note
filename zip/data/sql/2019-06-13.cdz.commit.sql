CREATE TABLE `ol_demo_self_help_course_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型',
  `openid` varchar(60) NOT NULL DEFAULT '' COMMENT 'openid',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `source` int(11) NOT NULL DEFAULT '0' COMMENT '渠道',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '预约状态，1=未约课，2=已自助约课，3=已人工约课',
  `oper_time` int(11) NOT NULL DEFAULT '0' COMMENT '用户操作时间',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `create_date` varchar(20) NOT NULL DEFAULT '' COMMENT '创建日期',
  PRIMARY KEY (`id`),
  KEY `create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='demo自助约课数据记录';