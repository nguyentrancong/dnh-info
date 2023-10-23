DROP TABLE IF EXISTS recurring_content;
CREATE TABLE recurring_content (
  "subscription_plan_id" int check ("subscription_plan_id" > 0) NOT NULL,
  "language_id" int check ("language_id" > 0) NOT NULL,
  "name" varchar(191) NOT NULL,
  PRIMARY KEY ("subscription_plan_id","language_id")
);