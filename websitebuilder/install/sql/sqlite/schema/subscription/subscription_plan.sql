DROP TABLE IF EXISTS `subscription_plan`;

CREATE TABLE `subscription_plan` (
  `subscription_plan_id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `frequency` TEXT CHECK( frequency IN ('day','week','biweekly','month','year') ) NOT NULL DEFAULT 'month',
  `duration` INT NOT NULL,
  `cycle` INT NOT NULL,
  `trial_frequency` TEXT CHECK( trial_frequency IN ('day','week','biweekly','month','year') ) NOT NULL DEFAULT 'month',
  `trial_duration` INT NOT NULL,
  `trial_cycle` INT NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `status` tinyint NOT NULL,
  `sort_order` int(3) NOT NULL
--  PRIMARY KEY (`subscription_plan_id`)
);
