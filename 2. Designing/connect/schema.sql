CREATE TABLE "users" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "user_name" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    PRIMARY KEY("user_name", "id")
);
CREATE TABLE "school" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "year" INTEGER NOT NULL,
    PRIMARY KEY("id")
);
CREATE TABLE "company" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "industry" TEXT NOT NULL,
    "location" TEXT NOT NULL,
     PRIMARY KEY("id")
);
CREATE TABLE "connect_with_people" (
    "user1" TEXT,
    "user2" TEXT,
    FOREIGN KEY ("user1") REFERENCES "users" ("user_name"),
    FOREIGN KEY ("user2") REFERENCES "users" ("user_name")
);
CREATE TABLE "connect_with_schools" (
    "user_id" INTEGER,
    "school_id" INTEGER,
    "start_date" INTEGER,
    "end_date" INTEGER,
    "type" TEXT,
    FOREIGN KEY ("user_id") REFERENCES "users" ("id"),
    FOREIGN KEY ("school_id") REFERENCES "school" ("id")
);
CREATE TABLE "connect_with_company" (
    "user_id" INTEGER,
    "company_id" INTEGER,
    "start_date" INTEGER,
    "end_date" INTEGER,
    "title" TEXT,
    FOREIGN KEY ("user_id") REFERENCES "users" ("id"),
    FOREIGN KEY ("company_id") REFERENCES "company" ("id")
);
