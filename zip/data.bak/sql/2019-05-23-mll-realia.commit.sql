# 撤销索引 realia_code 的唯一性限制
ALTER TABLE `online`.`ol_realia` 
DROP INDEX `realia_code`,
ADD INDEX `realia_code`(`realia_code`) USING BTREE;

# 修改字段备注，更正新需求关于“唯一”的说明
ALTER TABLE `online`.`ol_realia` 
MODIFY COLUMN `realia_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '教具编码，status为1的保持唯一' AFTER `create_time`;