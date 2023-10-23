DROP TABLE IF EXISTS `product_recurring`;

CREATE TABLE `product_recurring` (
`product_id` INT NOT NULL,
`subscription_plan_id` INT NOT NULL,
`user_group_id` INT NOT NULL,
PRIMARY KEY (`product_id`,`subscription_plan_id`,`user_group_id`)
);
