DROP TABLE IF EXISTS `order_recurring`;

CREATE TABLE `order_recurring` (
  `order_subscription_plan_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` INT UNSIGNED NOT NULL,
  `reference` varchar(191) NOT NULL,
  `product_id` INT UNSIGNED NOT NULL,
  `product_name` varchar(191) NOT NULL,
  `product_quantity` INT UNSIGNED NOT NULL,
  `subscription_plan_id` INT UNSIGNED NOT NULL,
  `recurring_name` varchar(191) NOT NULL,
  `recurring_content` varchar(191) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_subscription_plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;