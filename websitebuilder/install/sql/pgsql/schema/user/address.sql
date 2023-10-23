DROP TABLE IF EXISTS address;

DROP SEQUENCE IF EXISTS address_seq;
CREATE SEQUENCE address_seq;

CREATE TABLE address (
  "address_id" int check ("address_id" > 0) NOT NULL DEFAULT NEXTVAL ('address_seq'),
  "user_id" int check ("user_id" > 0) NOT NULL,
  "first_name" varchar(32) NOT NULL,
  "last_name" varchar(32) NOT NULL,
  "company" varchar(60) NOT NULL,
  "address_1" varchar(128) NOT NULL,
  "address_2" varchar(128) NOT NULL,
  "city" varchar(128) NOT NULL,
  "post_code" varchar(10) NOT NULL,
  "country_id" int check ("country_id" > 0) NOT NULL DEFAULT 0,
  "region_id" int check ("region_id" > 0) NOT NULL DEFAULT 0,
  "fields" text NOT NULL,
  PRIMARY KEY ("address_id")
);

CREATE INDEX "user_id" ON address ("user_id");