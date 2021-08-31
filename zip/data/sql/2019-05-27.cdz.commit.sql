ALTER TABLE `ol_sudoku_user_confirm`
ADD COLUMN `type`  tinyint(2) NOT NULL DEFAULT 1 COMMENT '报名确认类型，1=数独，2=计算营，3=衔接' AFTER `cancel_uid`,
ADD COLUMN `package_status`  tinyint(1) NOT NULL DEFAULT 1 COMMENT '套餐课时转换状态,1=未转换，2=已转换' AFTER `type`;