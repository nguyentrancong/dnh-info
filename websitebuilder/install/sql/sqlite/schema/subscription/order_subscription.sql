DROP TABLE IF EXISTS `order_subscription`;

CREATE TABLE `order_subscription` (
  `order_subscription_id`  INTEGER PRIMARY KEY AUTOINCREMENT,
  `order_product_id` INT NOT NULL,
  `order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `subscription_plan_id` INT NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_tax` decimal(15,4) NOT NULL,
  `trial_frequency` TEXT CHECK( trial_frequency IN ('day','week','biweekly','month','year') ) NOT NULL DEFAULT 'month',
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_remaining` smallint(6) NOT NULL,
  `trial_status` tinyint NOT NULL,
  `price` decimal(10,4) NOT NULL,
  `tax` decimal(15,4) NOT NULL,
  `frequency` TEXT CHECK( frequency IN ('day','week','biweekly','month','year') ) NOT NULL DEFAULT 'month',
  `cycle` smallint(6) NOT NULL,
  `duration` smallint(6) NOT NULL
--  PRIMARY KEY (`order_subscription_id`),
--  KEY `order_id` (`order_id`)
);

CREATE INDEX `order_subscription_order_id` ON `order_subscription` (`order_id`);
