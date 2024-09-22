SELECT * FROM (
    SELECT "first_name", "last_name"
    FROM "salaries"
    JOIN "players" ON "players"."id" = "salaries"."player_id"
    JOIN "performances" ON "salaries"."player_id" = "performances"."player_id"
    AND "salaries"."year" = "performances"."year"
    WHERE "H" > 0 AND "salaries"."year" = 2001
    ORDER BY ("salary" / "H"), "first_name", "last_name"
    LIMIT 10
) AS t1
INTERSECT
SELECT * FROM (
    SELECT "first_name", "last_name"
    FROM "players"
    JOIN "salaries" ON "players"."id" = "salaries"."player_id"
    JOIN "performances" ON "performances"."player_id" = "players"."id"
    AND "salaries"."year" = "performances"."year"
    WHERE "salaries"."year" = 2001 AND "performances"."RBI" > 0
    ORDER BY ("salary" / "RBI"), "first_name", "last_name"
    LIMIT 10
) AS t2;
ORDER BY "players"."id";
