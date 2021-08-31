CREATE TABLE `ol_wechat_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attachment_id` int(11) NOT NULL DEFAULT '0' COMMENT 'attachment表id',
  `type` varchar(10) NOT NULL DEFAULT '' COMMENT '素材类型',
  `media_id` varchar(50) NOT NULL DEFAULT '' COMMENT '素材id',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '素材url',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `create_uid` int(11) NOT NULL DEFAULT '0' COMMENT '创建人id',
  PRIMARY KEY (`id`),
  KEY `media_id` (`media_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='微信素材管理';

CREATE TABLE `ol_wechat_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父id',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '菜单类型，1=发送消息，2=跳转网页，3=跳转小程序',
  `channel` tinyint(1) NOT NULL DEFAULT '1' COMMENT '发送内容类型，1=文本，2=图片',
  `content` text NOT NULL COMMENT '消息内容或跳转链接',
  `spare_url` varchar(50) NOT NULL DEFAULT '' COMMENT '小程序跳转备用地址',
  `sort` int(11) unsigned NOT NULL DEFAULT '99' COMMENT '排序',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `create_uid` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `update_uid` int(11) NOT NULL DEFAULT '0' COMMENT '更新人id',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '上下架状态，1=上架，2=下架',
  `keyword` varchar(50) NOT NULL DEFAULT '' COMMENT '发送消息的关键词',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='自定义菜单管理';

CREATE TABLE `ol_wechat_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_name` varchar(60) NOT NULL DEFAULT '' COMMENT '规则名称',
  `keyword` varchar(255) NOT NULL DEFAULT '' COMMENT '关键词',
  `content` text NOT NULL COMMENT '回复内容',
  `create_uid` int(11) NOT NULL DEFAULT '0' COMMENT '创建人uid',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `update_uid` int(11) NOT NULL DEFAULT '0' COMMENT '更新人id',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '自动回复类型，1=关键词回复，2=默认回复，3=关注回复，4=海报上传回复',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '上下架状态，1=上架，2=下架',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='服务号自动回复管理';

SELECT @api_id := `id` FROM `ol_admin_menu` WHERE `title` = '营销中心';
INSERT INTO `online`.`ol_admin_menu`(`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@api_id, 'api', '服务号管理', '', 'module_admin', 'api_WechatReply_index', 'api/wechat_reply/index', '_self', 0, 1559556899, 1559556899, 100, 0, 1, '', 'no_limit', 1);

SELECT @api_id1 := `id` FROM `ol_admin_menu` WHERE `title` = '服务号管理';

INSERT INTO ``(`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@api_id1, 'api', '自动回复更新上下架状态', '', 'module_admin', 'api_WechatReply_updateStatus', 'api/wechat_reply/updatestatus', '_self', 0, 1559557013, 1559557194, 100, 0, 1, '', 'no_limit', 1);
INSERT INTO ``(`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@api_id1, 'api', '自动回复详情', '', 'module_admin', 'api_WechatReply_details', 'api/wechat_reply/details', '_self', 0, 1559557059, 1559557059, 100, 0, 1, '', 'no_limit', 1);
INSERT INTO ``(`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@api_id1, 'api', '自动回复增加', '', 'module_admin', 'api_WechatReply_add', 'api/wechat_reply/add', '_self', 0, 1559557120, 1559557120, 100, 0, 1, '', 'no_limit', 1);
INSERT INTO ``(`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@api_id1, 'api', '自动回复更新', '', 'module_admin', 'api_WechatReply_update', 'api/wechat_reply/update', '_self', 0, 1559557174, 1559557174, 100, 0, 1, '', 'no_limit', 1);
INSERT INTO ``(`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@api_id1, 'api', '上传微信素材', '', 'module_admin', 'api_WechatMaterial_upload', 'api/wechat_material/upload', '_self', 0, 1559635077, 1559635077, 100, 0, 1, '', 'no_limit', 1);
INSERT INTO ``(`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@api_id1, 'api', '微信素材管理列表', '', 'module_admin', 'api_WechatMaterial_index', 'api/wechat_material/index', '_self', 0, 1559639143, 1559639143, 100, 0, 1, '', 'no_limit', 1);
INSERT INTO ``(`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@api_id1, 'api', '微信自定义菜单列表', '', 'module_admin', 'api_WechatMenu_index', 'api/wechat_menu/index', '_self', 0, 1559642058, 1559642058, 100, 0, 1, '', 'no_limit', 1);
INSERT INTO ``(`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@api_id1, 'api', '添加自定义菜单', '', 'module_admin', 'api_WechatMenu_add', 'api/wechat_menu/add', '_self', 0, 1559706513, 1559706513, 100, 0, 1, '', 'no_limit', 1);
INSERT INTO ``(`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@api_id1, 'api', '更新自定义菜单', '', 'module_admin', 'api_WechatMenu_update', 'api/wechat_menu/update', '_self', 0, 1559706567, 1559706567, 100, 0, 1, '', 'no_limit', 1);
INSERT INTO ``(`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@api_id1, 'api', '获取自定义菜单详情', '', 'module_admin', 'api_WechatMenu_details', 'api/wechat_menu/details', '_self', 0, 1559706613, 1559706613, 100, 0, 1, '', 'no_limit', 1);
INSERT INTO ``(`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@api_id1, 'api', '删除自定义菜单', '', 'module_admin', 'api_WechatMenu_deleteMenu', 'api/wechat_menu/deletemenu', '_self', 0, 1559718068, 1559718068, 100, 0, 1, '', 'no_limit', 1);
INSERT INTO ``(`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@api_id1, 'api', '设置服务号菜单', '', 'module_admin', 'api_WechatMenu_setMenuCreate', 'api/wechat_menu/setmenucreate', '_self', 0, 1559720848, 1559720848, 100, 0, 1, '', 'no_limit', 1);
INSERT INTO ``(`pid`, `module`, `title`, `icon`, `url_type`, `url_key`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`, `data_access_type`, `is_check_auth`) VALUES (@api_id1, 'api', '自定义一级菜单排序', '', 'module_admin', 'api_WechatMenu_sortMenu', 'api/wechat_menu/sortmenu', '_self', 0, 1560338324, 1560338324, 100, 0, 1, '', 'no_limit', 1);

INSERT INTO `online`.`ol_wechat_reply`(`rule_name`, `keyword`, `content`, `create_uid`, `create_time`, `update_time`, `update_uid`, `type`, `status`) VALUES ('收到信息回复', 'test1', '<a href=\"https://www.vipthink.cn/index.html\" >豌豆思维</a>收到信息/色\n豌豆思维收到信息/色/咖啡\n<a href=\"https://www.vipthink.cn/index.html\" >豌豆思维</a>收到信息/色/右哼哼/炸弹\nabcd\n', 0, 0, 1560851797, 2411, 2, 1);
INSERT INTO `online`.`ol_wechat_reply`(`rule_name`, `keyword`, `content`, `create_uid`, `create_time`, `update_time`, `update_uid`, `type`, `status`) VALUES ('被关注回复', 'test2', '豌豆思维\n豌豆思维\n豌豆思维\nces\n', 0, 0, 1560847726, 261, 3, 1);
INSERT INTO `online`.`ol_wechat_reply`(`rule_name`, `keyword`, `content`, `create_uid`, `create_time`, `update_time`, `update_uid`, `type`, `status`) VALUES ('海报上传回复', 'test3', '收到你的海报上传 <a href=\"about:blank\" >豌豆思维</a>的课程体系基于认知心理学、脑科学及学科教育等研究，采用美国 NCTM 评价标准，通过提炼出生活化的场景来教授数学知识，引导孩子自我探索、主动表达、激发兴趣、持续创新，全面培养孩子的「多元思维」和「解决问题」的能力。\n<a href=\"about:blank\" >豌豆思维</a>结合中国教育国情，沿用国际先进有效的6E教学法，通过引导、参与的形式来激发学生对数学的兴趣、强化儿童对知识点的理解。\n<a href=\"about:blank\" >豌豆思维</a>采用动画与游戏的互动式教学，将强反馈、<a href=\"about:blank\" >代入感</a>、等级体系代入到课程体系设计当中，在课件中加入了很多色彩鲜明、形象生动的元素，制作精美的动画以及开发游戏式的解题模式，增加课程内容对孩子的吸引力。\n /晕/抠鼻/啤酒/示爱/凋谢/街舞/右太极/差劲/爱你/转圈 /示爱 /街舞/左太极/左太极/街舞/街舞/街舞/拳头/拳头/咖啡/饭\n', 0, 0, 1560849661, 2411, 4, 1);









