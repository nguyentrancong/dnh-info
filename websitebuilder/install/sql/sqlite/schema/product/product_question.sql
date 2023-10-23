DROP TABLE IF EXISTS `product_question`;

CREATE TABLE `product_question` (
`product_question_id` INTEGER PRIMARY KEY AUTOINCREMENT,
`product_id` INT NOT NULL,
`user_id` INT NOT NULL,
`author` TEXT NOT NULL,
`content` text NOT NULL,
`status` TINYINT NOT NULL DEFAULT '0',
`parent_id` INT NOT NULL DEFAULT '0',
`created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
`updated_at` datetime NOT NULL
-- PRIMARY KEY (`product_question_id`)
);



CREATE INDEX `product_question_product_id` ON `product_question` (`product_id`);

