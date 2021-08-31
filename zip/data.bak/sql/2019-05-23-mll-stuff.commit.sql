ALTER TABLE ol_stuff DROP INDEX `sn`;

ALTER TABLE `online`.`ol_stuff` 
ADD INDEX `sn`(`sn`);