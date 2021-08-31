DROP TABLE IF EXISTS `ol_poster_share_log`;
CREATE TABLE IF NOT EXISTS `ol_poster_share_log` (
	`id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`user_id` int(10) UNSIGNED NOT NULL COMMENT '用户 ID',
	`no` mediumint(8) UNSIGNED NOT NULL COMMENT '用户生成过海报的序号',
	`share_media` varchar(16) NOT NULL DEFAULT 'wechat' COMMENT '分享到的媒体平台',
	`is_callbacked` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分享平台是否回调过本次分享',
	`is_confirmed` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '系统是否已确认本次分享',
	`callback_time` int(10) UNSIGNED DEFAULT 0 COMMENT '分享平台回调系统的时间',
	`confirm_time` int(10) UNSIGNED DEFAULT 0 COMMENT '系统确认本次分享的时间',
	`create_time` int(10) UNSIGNED NOT NULL COMMENT '生成海报的时间',
	PRIMARY KEY (`id`),
	UNIQUE KEY uni_user_no(`user_id`,`no`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='海报分享历史表';
