DROP TABLE IF EXISTS `recurring_content`;

CREATE TABLE `recurring_content` (
`subscription_plan_id` INT NOT NULL,
`language_id` INT NOT NULL,
`name` TEXT NOT NULL,
PRIMARY KEY (`subscription_plan_id`,`language_id`)
);





