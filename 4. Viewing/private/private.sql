CREATE TABLE "triplets" (
    "sentence_id" INTEGER,
    "start_char" INTEGER,
    "length_of_string" INTEGER,
    PRIMARY KEY ("sentence_id")
);
INSERT INTO "triplets" ("sentence_id", "start_char", "length_of_string")
 VALUES ('14' , '98' , '4'),
        ('114' , '3' , '5'),
        ('618' , '72' , '9'),
        ('630' , '7' , '3'),
        ('932' , '12' , '5'),
        ('2230' , '50' , '7'),
        ('2346' , '44' , '10'),
        ('3041' , '14' , '5');
CREATE VIEW "message" AS
SELECT substr("sentence", "start_char", "length_of_string") AS "phrase"
FROM "sentences"
JOIN "triplets" ON "triplets"."sentence_id" = "sentences"."id";
