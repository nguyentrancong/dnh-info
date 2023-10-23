DROP TABLE IF EXISTS `order_recurring_transaction`;

CREATE TABLE `order_recurring_transaction` (
`order_recurring_transaction_id` INTEGER PRIMARY KEY AUTOINCREMENT,
`order_subscription_plan_id` INT NOT NULL,
`reference` TEXT NOT NULL,
`type` INT NOT NULL,
`quantity` decimal(10,4) NOT NULL,
`created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
-- PRIMARY KEY (`order_recurring_transaction_id`)
);





