ALTER TABLE ol_textbook DROP INDEX `教材编码唯一`;

ALTER TABLE `online`.`ol_textbook` 
ADD INDEX `textbook_code`(`textbook_code`);