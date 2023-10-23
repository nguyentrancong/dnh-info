DROP TABLE IF EXISTS recurring;

DROP SEQUENCE IF EXISTS recurring_seq;
CREATE SEQUENCE recurring_seq;


CREATE TABLE recurring (
  "subscription_plan_id" int check ("subscription_plan_id" > 0) NOT NULL DEFAULT NEXTVAL ('recurring_seq'),
  "price" decimal(10,4) NOT NULL,
  "frequency" varchar(32) NOT NULL, -- enum('day','week','biweekly','month','year') NOT NULL,
  "duration" int NOT NULL,
  "cycle" int NOT NULL,
  "trial_status" smallint NOT NULL,
  "trial_price" decimal(10,4) NOT NULL,
  "trial_frequency"  varchar(32) NOT NULL, -- enum('day','week','biweekly','month','year') NOT NULL,
  "trial_duration" int NOT NULL,
  "trial_cycle" int NOT NULL,
  "status" smallint NOT NULL,
  "sort_order" int check ("sort_order" > 0) NOT NULL,
  PRIMARY KEY ("subscription_plan_id")
);