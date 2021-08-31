SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for ol_class_apply_cycle
-- ----------------------------
DROP TABLE IF EXISTS `ol_class_apply_cycle`;
CREATE TABLE `ol_class_apply_cycle` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `apply_id` int(11) NOT NULL DEFAULT '0' COMMENT '申请表id order_class_apply_log',
  `week_date` tinyint(1) NOT NULL DEFAULT '0' COMMENT '上课周期',
  `hour_date` tinyint(2) NOT NULL DEFAULT '0' COMMENT '周期小时',
  `minute_date` tinyint(4) NOT NULL DEFAULT '0' COMMENT '分钟',
  `teacher_id` int(11) NOT NULL DEFAULT '0' COMMENT '上课老师',
  PRIMARY KEY (`id`),
  KEY `idx_apply_id` (`apply_id`),
  KEY `idx_week` (`week_date`),
  KEY `idx_hour` (`hour_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='正课上课申请周期表';
-- ----------------------------
-- Table structure for ol_class_apply_user_log
-- ----------------------------
DROP TABLE IF EXISTS `ol_class_apply_user_log`;
CREATE TABLE `ol_class_apply_user_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `apply_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ol_order_class_apply_log id',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '学员id',
  `class_id` int(11) NOT NULL,
  `cycle` varchar(120) NOT NULL DEFAULT '' COMMENT '上课周期',
  `cate_sid` int(10) NOT NULL DEFAULT '0' COMMENT '阶段',
  `start_cn_id` int(10) NOT NULL DEFAULT '0' COMMENT '初始化上课章节',
  `teacher_id` int(10) NOT NULL DEFAULT '0' COMMENT '首课老师',
  `hour_id` int(10) NOT NULL DEFAULT '0' COMMENT '对应课时包',
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1提交申请未排课 2提交且生成课节 ',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `audit_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1已处理 state=2 才需要处理其他状态暂不考虑处理',
  `review_id` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '定级评测id，备注：0时表示未评测',
  PRIMARY KEY (`id`),
  KEY `idx_apply_id` (`apply_id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学员自主约正课记录';

INSERT INTO `ol_classs_dropout` (`student_id` , `class_id` , `cate_sid` , `cycle` , `teacher_id` , `next_live_time` , `next_cn_id` , `hour_id` , `start_time` , `end_time` , `reason` , `oper_id` , `state` , `update_time` , `create_time`) VALUES (20921003 , 2508 , 38 , '周六:16:00/周日:16:00' , 648 , 1551600000 , 262 , 1571 , 0 , 0 , 'cr停课' , -1 , 1 , 1557742445 , 1557742445);
INSERT INTO `ol_classs_dropout` (`student_id` , `class_id` , `cate_sid` , `cycle` , `teacher_id` , `next_live_time` , `next_cn_id` , `hour_id` , `start_time` , `end_time` , `reason` , `oper_id` , `state` , `update_time` , `create_time`) VALUES (20954724 , 3587 , 40 , '周五:20:00/周日:20:00' , 678 , 1553860800 , 468 , 3529 , 0 , 0 , 'cr停课' , -1 , 1 , 1557742445 , 1557742445);
INSERT INTO `ol_classs_dropout` (`student_id` , `class_id` , `cate_sid` , `cycle` , `teacher_id` , `next_live_time` , `next_cn_id` , `hour_id` , `start_time` , `end_time` , `reason` , `oper_id` , `state` , `update_time` , `create_time`) VALUES (20961614 , 2046 , 39 , '周二:20:00/周四:20:00' , 429 , 1552392000 , 363 , 12119 , 0 , 0 , 'cr停课' , -1 , 1 , 1557742445 , 1557742445);
INSERT INTO `ol_classs_dropout` (`student_id` , `class_id` , `cate_sid` , `cycle` , `teacher_id` , `next_live_time` , `next_cn_id` , `hour_id` , `start_time` , `end_time` , `reason` , `oper_id` , `state` , `update_time` , `create_time`) VALUES (20964394 , 2253 , 38 , '周六:09:00' , 185 , 1554512400 , 264 , 5419 , 0 , 0 , 'cr停课' , -1 , 1 , 1557742445 , 1557742445);
INSERT INTO `ol_classs_dropout` (`student_id` , `class_id` , `cate_sid` , `cycle` , `teacher_id` , `next_live_time` , `next_cn_id` , `hour_id` , `start_time` , `end_time` , `reason` , `oper_id` , `state` , `update_time` , `create_time`) VALUES (20965583 , 1985 , 38 , '周二:20:00/周五:20:00' , 460 , 1547812800 , 260 , 10715 , 0 , 0 , 'cr停课' , -1 , 1 , 1557742445 , 1557742445);
INSERT INTO `ol_classs_dropout` (`student_id` , `class_id` , `cate_sid` , `cycle` , `teacher_id` , `next_live_time` , `next_cn_id` , `hour_id` , `start_time` , `end_time` , `reason` , `oper_id` , `state` , `update_time` , `create_time`) VALUES (20969192 , 1926 , 38 , '周三:18:00/周日:18:00' , 259 , 1545818400 , 254 , 7219 , 0 , 0 , 'cr停课' , -1 , 1 , 1557742445 , 1557742445);
INSERT INTO `ol_classs_dropout` (`student_id` , `class_id` , `cate_sid` , `cycle` , `teacher_id` , `next_live_time` , `next_cn_id` , `hour_id` , `start_time` , `end_time` , `reason` , `oper_id` , `state` , `update_time` , `create_time`) VALUES (20969220 , 4097 , 37 , '周二:19:00/周四:19:00' , 1076 , 1554375600 , 180 , 7047 , 0 , 0 , 'cr停课' , -1 , 1 , 1557742445 , 1557742445);
INSERT INTO `ol_classs_dropout` (`student_id` , `class_id` , `cate_sid` , `cycle` , `teacher_id` , `next_live_time` , `next_cn_id` , `hour_id` , `start_time` , `end_time` , `reason` , `oper_id` , `state` , `update_time` , `create_time`) VALUES (20982848 , 2524 , 40 , '周五:18:00/周日:10:00' , 461 , 1552183200 , 458 , 10446 , 0 , 0 , 'cr停课' , -1 , 1 , 1557742445 , 1557742445);
INSERT INTO `ol_classs_dropout` (`student_id` , `class_id` , `cate_sid` , `cycle` , `teacher_id` , `next_live_time` , `next_cn_id` , `hour_id` , `start_time` , `end_time` , `reason` , `oper_id` , `state` , `update_time` , `create_time`) VALUES (20985590 , 1900 , 39 , '周二:20:00/周日:20:00' , 71 , 1550404800 , 358 , 13216 , 0 , 0 , 'cr停课' , -1 , 1 , 1557742445 , 1557742445);
INSERT INTO `ol_classs_dropout` (`student_id` , `class_id` , `cate_sid` , `cycle` , `teacher_id` , `next_live_time` , `next_cn_id` , `hour_id` , `start_time` , `end_time` , `reason` , `oper_id` , `state` , `update_time` , `create_time`) VALUES (20989487 , 3984 , 38 , '周三:19:00/周六:10:00' , 957 , 1555498800 , 280 , 42363 , 0 , 0 , 'cr停课' , -1 , 1 , 1557742445 , 1557742445);
INSERT INTO `ol_classs_dropout` (`student_id` , `class_id` , `cate_sid` , `cycle` , `teacher_id` , `next_live_time` , `next_cn_id` , `hour_id` , `start_time` , `end_time` , `reason` , `oper_id` , `state` , `update_time` , `create_time`) VALUES (20992296 , 2357 , 40 , '周四:19:00/周日:19:00' , 487 , 1555585200 , 473 , 16371 , 0 , 0 , 'cr停课' , -1 , 1 , 1557742445 , 1557742445);
INSERT INTO `ol_classs_dropout` (`student_id` , `class_id` , `cate_sid` , `cycle` , `teacher_id` , `next_live_time` , `next_cn_id` , `hour_id` , `start_time` , `end_time` , `reason` , `oper_id` , `state` , `update_time` , `create_time`) VALUES (20992440 , 2132 , 38 , '周三:20:00/周五:20:00' , 539 , 1555675200 , 280 , 13779 , 0 , 0 , 'cr停课' , -1 , 1 , 1557742445 , 1557742445);
INSERT INTO `ol_classs_dropout` (`student_id` , `class_id` , `cate_sid` , `cycle` , `teacher_id` , `next_live_time` , `next_cn_id` , `hour_id` , `start_time` , `end_time` , `reason` , `oper_id` , `state` , `update_time` , `create_time`) VALUES (20993534 , 2120 , 40 , '周二:20:00/周六:20:00' , 501 , 1556020800 , 473 , 16682 , 0 , 0 , 'cr停课' , -1 , 1 , 1557742445 , 1557742445);
INSERT INTO `ol_classs_dropout` (`student_id` , `class_id` , `cate_sid` , `cycle` , `teacher_id` , `next_live_time` , `next_cn_id` , `hour_id` , `start_time` , `end_time` , `reason` , `oper_id` , `state` , `update_time` , `create_time`) VALUES (20993873 , 2929 , 40 , '周二:18:00/周四:18:00' , 421 , 1553594400 , 464 , 17522 , 0 , 0 , 'cr停课' , -1 , 1 , 1557742445 , 1557742445);
INSERT INTO `ol_classs_dropout` (`student_id` , `class_id` , `cate_sid` , `cycle` , `teacher_id` , `next_live_time` , `next_cn_id` , `hour_id` , `start_time` , `end_time` , `reason` , `oper_id` , `state` , `update_time` , `create_time`) VALUES (20996013 , 2755 , 98 , '周二:20:00/周四:20:00' , 829 , 1552564800 , 1848 , 15933 , 0 , 0 , 'cr停课' , -1 , 1 , 1557742446 , 1557742446);
INSERT INTO `ol_classs_dropout` (`student_id` , `class_id` , `cate_sid` , `cycle` , `teacher_id` , `next_live_time` , `next_cn_id` , `hour_id` , `start_time` , `end_time` , `reason` , `oper_id` , `state` , `update_time` , `create_time`) VALUES (21002316 , 2275 , 39 , '周二:19:00/周六:19:00' , 574 , 1551178800 , 360 , 20921 , 0 , 0 , 'cr停课' , -1 , 1 , 1557742446 , 1557742446);
INSERT INTO `ol_classs_dropout` (`student_id` , `class_id` , `cate_sid` , `cycle` , `teacher_id` , `next_live_time` , `next_cn_id` , `hour_id` , `start_time` , `end_time` , `reason` , `oper_id` , `state` , `update_time` , `create_time`) VALUES (21005396 , 2755 , 98 , '周二:20:00/周四:20:00' , 829 , 1556193600 , 1859 , 21859 , 0 , 0 , 'cr停课' , -1 , 1 , 1557742446 , 1557742446);
INSERT INTO `ol_classs_dropout` (`student_id` , `class_id` , `cate_sid` , `cycle` , `teacher_id` , `next_live_time` , `next_cn_id` , `hour_id` , `start_time` , `end_time` , `reason` , `oper_id` , `state` , `update_time` , `create_time`) VALUES (21005779 , 2174 , 38 , '周一:19:00/周四:19:00' , 550 , 1555326000 , 273 , 21831 , 0 , 0 , 'cr停课' , -1 , 1 , 1557742446 , 1557742446);
INSERT INTO `ol_classs_dropout` (`student_id` , `class_id` , `cate_sid` , `cycle` , `teacher_id` , `next_live_time` , `next_cn_id` , `hour_id` , `start_time` , `end_time` , `reason` , `oper_id` , `state` , `update_time` , `create_time`) VALUES (21008188 , 2727 , 39 , '周一:19:00/周四:19:00' , 756 , 1555930800 , 380 , 34359 , 0 , 0 , 'cr停课' , -1 , 1 , 1557742446 , 1557742446);
INSERT INTO `ol_classs_dropout` (`student_id` , `class_id` , `cate_sid` , `cycle` , `teacher_id` , `next_live_time` , `next_cn_id` , `hour_id` , `start_time` , `end_time` , `reason` , `oper_id` , `state` , `update_time` , `create_time`) VALUES (21014723 , 2755 , 98 , '周二:20:00/周四:20:00' , 829 , 1554984000 , 1855 , 25334 , 0 , 0 , 'cr停课' , -1 , 1 , 1557742446 , 1557742446);
INSERT INTO `ol_classs_dropout` (`student_id` , `class_id` , `cate_sid` , `cycle` , `teacher_id` , `next_live_time` , `next_cn_id` , `hour_id` , `start_time` , `end_time` , `reason` , `oper_id` , `state` , `update_time` , `create_time`) VALUES (21034306 , 2476 , 38 , '周四:19:00/周六:10:00' , 678 , 1553306400 , 272 , 38997 , 0 , 0 , 'cr停课' , -1 , 1 , 1557742446 , 1557742446);
INSERT INTO `ol_classs_dropout` (`student_id` , `class_id` , `cate_sid` , `cycle` , `teacher_id` , `next_live_time` , `next_cn_id` , `hour_id` , `start_time` , `end_time` , `reason` , `oper_id` , `state` , `update_time` , `create_time`) VALUES (21048165 , 3656 , 40 , '周一:20:00/周六:20:00' , 545 , 1557144000 , 474 , 42004 , 0 , 0 , 'cr停课' , -1 , 1 , 1557742446 , 1557742446);
INSERT INTO `ol_classs_dropout` (`student_id` , `class_id` , `cate_sid` , `cycle` , `teacher_id` , `next_live_time` , `next_cn_id` , `hour_id` , `start_time` , `end_time` , `reason` , `oper_id` , `state` , `update_time` , `create_time`) VALUES (21052275 , 3346 , 39 , '周五:17:00/周日:09:00' , 317 , 1553850000 , 366 , 42292 , 0 , 0 , 'cr停课' , -1 , 1 , 1557742446 , 1557742446);
INSERT INTO `ol_classs_dropout` (`student_id` , `class_id` , `cate_sid` , `cycle` , `teacher_id` , `next_live_time` , `next_cn_id` , `hour_id` , `start_time` , `end_time` , `reason` , `oper_id` , `state` , `update_time` , `create_time`) VALUES (21100310 , 5235 , 38 , '周一:18:00/周四:18:00' , 958 , 1555581600 , 275 , 77553 , 0 , 0 , 'cr停课' , -1 , 1 , 1557742446 , 1557742446);
