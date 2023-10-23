DROP TABLE IF EXISTS `subscription_plan`;

CREATE TABLE `subscription_plan` (
  `subscription_plan_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `frequency` enum('day','week','biweekly','month','year') NOT NULL,
  `duration` int(10) UNSIGNED NOT NULL,
  `cycle` int(10) UNSIGNED NOT NULL,
  `trial_frequency` enum('day','week','biweekly','month','year') NOT NULL,
  `trial_duration` int(10) UNSIGNED NOT NULL,
  `trial_cycle` int(10) UNSIGNED NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `status` tinyint NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`subscription_plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
