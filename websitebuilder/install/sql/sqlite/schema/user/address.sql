DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
`address_id` INTEGER PRIMARY KEY AUTOINCREMENT,
`user_id` INT NOT NULL,
`first_name` TEXT NOT NULL,
`last_name` TEXT NOT NULL,
`company` TEXT NOT NULL,
`address_1` TEXT NOT NULL,
`address_2` TEXT NOT NULL,
`city` TEXT NOT NULL,
`post_code` TEXT NOT NULL,
`country_id` INT NOT NULL DEFAULT '0',
`region_id` INT NOT NULL DEFAULT '0',
`fields` text NOT NULL,
`default_address` tinyint unsigned NOT NULL DEFAULT 0
-- PRIMARY KEY (`address_id`)
);

CREATE INDEX `address_user_id` ON `address` (`user_id`);

