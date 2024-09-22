SELECT "year", ROUND(AVG("salary"), 2) AS "average salary" FROM "salaries"
JOIN "players" ON "salaries"."player_id" = "players"."id"
GROUP BY "year"
ORDER BY "year" DESC;
