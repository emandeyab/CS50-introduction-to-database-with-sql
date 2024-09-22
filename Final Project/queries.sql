-- Insert users
INSERT INTO "users" ("id", "username", "email", "password", "time_created_at")
VALUES ("1", "eman_deyab", "emandeyab@gmail.com", "123456", "22-11-2022");

-- Insert followers
INSERT INTO "followers" ("id", "username", "user_id", "followed_at")
VALUES ("2", "farah", "1", "30-11-2022"),
VALUES ("3", "mhmd.deyab", "1", "5-12-2022"),
VALUES ("4", "Nada_ahmed", "1", "1-1-2023"),
VALUES ("5", "Ahmed_H", "1", "30-2-2023"),
VALUES ("6", "nesma.ali", "1", "15-3-2023"),
VALUES ("7", "yehia.j", "1", "2-3-2023");

-- Insert posts
INSERT INTO "posts" ("id", "user_id")
VALUES ("1", "1"),
       ("2", "2"),
       ("3", "3");

-- Insert a new like for a specific post by a user
INSERT INTO "likes" ("post_id", "user_id")
VALUES ("1", "2"),
VALUES ("1", "3"),
VALUES ("1", "4"),
VALUES ("1", "5"),
VALUES ("1", "6");

-- Get the total number of likes for a specific post
SELECT COUNT(*) AS "total_likes"
FROM "likes"
WHERE "post_id" = 1;

-- Select all followers of a specific user
SELECT "users"."username"
FROM "followers"
JOIN "users" ON "followers"."user_id" = "users"."id"
WHERE "followers"."user_id" = 1;

-- Insert a new message from user 2 to user 1
INSERT INTO "messages" ("id", "sender_id", "receiver_id", "message_text")
VALUES ("1", "2", "1", 'Hello Eman! How are you?');

-- Insert a comment on a specific post by a user
INSERT INTO "comments" ("post_id", "user_id", "comment_text")
VALUES ("1", "1", 'Very beautiful');

-- Update a specific message to mark it as read
UPDATE "messages"
SET "is_read" = TRUE
WHERE "id" = 1;

-- Delete a specific post
DELETE FROM "posts"
WHERE "id" = 1;
