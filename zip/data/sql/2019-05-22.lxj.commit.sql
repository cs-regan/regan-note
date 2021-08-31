SELECT @api_id := `id` FROM `ol_admin_menu` WHERE `title` = '学员模块';

DELETE FROM `ol_admin_menu` WHERE `url_value` = 'api/student/getnotrenewstudent';
INSERT INTO `ol_admin_menu`(
`pid`,
`module`,
`title`,
`url_type`,
`url_key`,
`url_value`,
`url_target`,
`online_hide`,
`create_time`,
`update_time`,
`sort`,
`system_menu`,
`status`
) VALUES (
@api_id,
'api',
'获取待续费学员列表',
'module_admin',
'api_Student_getNotRenewStudent',
'api/student/getnotrenewstudent',
'_self',
0,
unix_timestamp(),
unix_timestamp(),
100,
0,
1
);