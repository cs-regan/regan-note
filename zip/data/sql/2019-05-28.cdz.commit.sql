ALTER TABLE `ol_live_student_comment_count`
ADD COLUMN `link_registration_num`  int(11) NOT NULL DEFAULT 0 COMMENT '通过课后评价链接注册人数' AFTER `share_after_class_num`,
ADD COLUMN `total_attendance_num`  int(11) NOT NULL DEFAULT 0 COMMENT '总出席人数' AFTER `link_registration_num`,
ADD COLUMN `poster_user_register_num`  int(11) NOT NULL DEFAULT 0 COMMENT '通过课后评价海报注册人数' AFTER `total_attendance_num`,
ADD COLUMN `share_activity_num`  int(11) NOT NULL DEFAULT 0 COMMENT '活动总参与任务' AFTER `poster_user_register_num`,
ADD COLUMN `link_user_num`  int(11) NOT NULL DEFAULT 0 COMMENT '通过链接成功推荐购买课程人数' AFTER `share_activity_num`;
