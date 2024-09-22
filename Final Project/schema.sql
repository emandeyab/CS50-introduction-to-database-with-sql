CREATE TABLE "users"(
    "id" INTEGER,
    "username" TEXT UNIQUE NOT NULL,
    "email" TEXT UNIQUE NOT NULL,
    "password" TEXT NOT NULL,
    "time_created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id")
);
CREATE TABLE "posts" (
    "id" INTEGER,
    "user_id" INTEGER,
    "time_created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("user_id") REFERENCES "users"("id")
);
CREATE TABLE "comments"(
    "id" INTEGER,
    "post_id" INTEGER,
    "user_id" INTEGER,
    "comment_text" TEXT,
    "time_created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("post_id") REFERENCES "posts"("id"),
    FOREIGN KEY ("user_id") REFERENCES "users"("id")
);
CREATE TABLE "likes"(
    "id" INTEGER,
    "post_id" INTEGER,
    "user_id" INTEGER,
    "time_created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("post_id") REFERENCES "posts"("id"),
    FOREIGN KEY ("user_id") REFERENCES "users"("id")
);
CREATE TABLE "followers" (
    "id" INTEGER
    "username" TEXT UNIQUE NOT NULL,
    "user_id" INTEGER, -- The user being followed
    "followed_at" TggIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE,
);
CREATE TABLE "messages" (
    "id" INTEGER,
    "sender_id" INTEGER,
    "receiver_id" INTEGER,
    "message_text" TEXT NOT NULL,
    "sent_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "is_read" BOOLEAN DEFAULT FALSE,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("sender_id") REFERENCES "users"("id") ON DELETE CASCADE,
    FOREIGN KEY ("receiver_id") REFERENCES "users"("id") ON DELETE CASCADE
);
-- a view to show user profiles with follower count and post count
CREATE VIEW "user_profiles" AS
SELECT "users"."id" AS "user_id",
       "users"."username",
       "users"."email",
       "users"."time_created_at",
       (SELECT COUNT(*) FROM "followers" WHERE "followers"."user_id" = "users"."id") AS "follower_count",
       (SELECT COUNT(*) FROM "posts" WHERE "posts"."user_id" = "users"."id") AS "post_count"
FROM "users";
-- a view to show post details including the number of likes and comments
CREATE VIEW "post_details" AS
SELECT "posts"."id" AS "post_id",
       "posts"."time_created_at",
       "users"."username" AS "author",
       (SELECT COUNT(*) FROM "comments" WHERE "comments"."post_id" = "posts"."id") AS "comment_count",
       (SELECT COUNT(*) FROM "likes" WHERE "likes"."post_id" = "posts"."id") AS "like_count"
FROM "posts"
JOIN "users" ON "posts"."user_id" = "users"."id";
-- an index on the username column to speed up lookups
CREATE INDEX "idx_users_username" ON "users"("username");
-- an index on user_id in the posts table
CREATE INDEX "idx_posts_user_id" ON "posts"("user_id");
-- an index on user_id in the followers table to improve follower lookups
CREATE INDEX "idx_followers_user_id" ON "followers"("user_id");


