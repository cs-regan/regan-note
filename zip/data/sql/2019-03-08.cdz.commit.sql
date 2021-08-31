ALTER TABLE `ol_user`
ADD COLUMN `sms_send_type`  tinyint(1) NULL DEFAULT 1 COMMENT '短信发送类型，1=允许发送，2=禁止发送' AFTER `first_sign_time`,
ADD COLUMN `mobile_call_type`  tinyint(1) NULL DEFAULT 1 COMMENT '电话拨打类型，1=允许拨打，2=禁止拨打' AFTER `sms_send_type`;

ALTER TABLE `ol_cms_column`
ADD COLUMN `img_url`  varchar(255) NULL DEFAULT '' COMMENT '栏目图标地址' AFTER `type`;