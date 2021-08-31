CREATE TABLE `ol_present_share_log` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id' ,
`user_id`  int(11) NULL DEFAULT 0 COMMENT '用户id' ,
`present_id`  int(11) NULL DEFAULT 0 COMMENT '创意Id' ,
`channel_id`  int(11) NULL DEFAULT 0 COMMENT '渠道ID' ,
`market_uid`  int(11) NULL DEFAULT 0 COMMENT '市场人员id' ,
`create_time`  int(11) NULL DEFAULT 0 COMMENT '创建时间' ,
`present_name`  varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创意id' ,
`channel_name`  varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '渠道名称' ,
`market_name`  varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '市场id' ,
`openid`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '微信openID' ,
`type`  tinyint(4) NULL DEFAULT 0 COMMENT '分享类型，1=朋友，2=朋友圈，3=手机QQ,,4=QQ空间' ,
`page_source`  tinyint(4) NULL DEFAULT 0 COMMENT '页面来源，0=未知，1=9.9元1次课，2=派发红包得大礼，3=推荐有礼' ,
`create_date`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '创建日期' ,
PRIMARY KEY (`id`),
INDEX `create_date` (`create_date`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
COMMENT='新带新数据转发进行日志储存'
AUTO_INCREMENT=1
ROW_FORMAT=DYNAMIC
;