alter table `ol_live` add column `notify_status` tinyint(1) DEFAULT '0' COMMENT '通知状态:0等待通知/1正在通知/2已经通知' after `is_send`;

DROP TABLE IF EXISTS `ol_live_voice_call`;
CREATE TABLE IF NOT EXISTS `ol_live_voice_call` (
    `id` bigint(20) NOT NULL AUTO_INCREMENT,
    `live_id` int(10) unsigned NOT NULL COMMENT '直播课ID',
    `user_id` int(10) unsigned NOT NULL COMMENT '该直播课ID下的关联的用户ID',
    `create_time` int(10) unsigned NOT NULL COMMENT '语音拨打任务创建答时间(用户超时判断)',
    `answer_time` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '用户手机应答时间',
    `start_time` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '开始呼叫时间',
    `end_time` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '通话结束时间',
    `duration` smallint(4) unsigned NOT NULL DEFAULT 0 COMMENT '通话时长; 秒（冗余字段，可由 end_time-start_time 计算得出）',
    `callback_time` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '异步任务回调系统时间',
    `mobile` char(16) NOT NULL COMMENT '实际拨打的手机号（冗余字段）',
    `status` tinyint(1) NOT NULL default 0 COMMENT '拨打状态: 0创建拨打任务失败；1拨打中; 2拨打成功；3拨打失败; 4回调超时',
    `service_return` varchar(191) NOT NULL DEFAULT '' COMMENT '语音服务商接口返回(业务代码可能格式化最终结果)',
    `service_provider` varchar(32) NOT NULL DEFAULT 'trrt' COMMENT '语音服务商类型',
    `service_log_id` varchar(128) NOT NULL DEFAULT '' COMMENT '语音服务商的拨打记录ID',
    `no` varchar(64) NOT NULL DEFAULT '' COMMENT '日志记录hash(不强调唯一性)',
    `version` smallint(4) NOT NULL DEFAULT 1 COMMENT '乐观锁字段',
    PRIMARY KEY (`id`),
    KEY `idx_live_id` (`live_id`) USING BTREE,
    KEY `idx_create_at` (`create_time`) USING BTREE,
    KEY `idx_mobile` (`mobile`) USING BTREE,
    KEY `idx_service_log` (`service_log_id`) USING BTREE,
    KEY `idx_no` (`no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='直播课语音电话通知日志';
