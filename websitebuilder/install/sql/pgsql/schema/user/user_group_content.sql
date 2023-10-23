DROP SEQUENCE IF EXISTS "user_group_content_seq";
CREATE SEQUENCE "user_group_content_seq";


DROP TABLE IF EXISTS "user_group_content;
CREATE TABLE user_group_content (
  "user_group_content_id" int check ("user_group_content_id" > 0) NOT NULL DEFAULT NEXTVAL ('user_group_content_seq'),
  "language_id" int check ("language_id" > 0) NOT NULL,
  "name" varchar(32) NOT NULL,
  "content" text NOT NULL,
  PRIMARY KEY ("user_group_content_id","language_id")
);
