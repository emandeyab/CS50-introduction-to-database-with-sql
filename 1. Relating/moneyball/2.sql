SELECT "year", "salary" FROM "salaries"
JOIN "players" ON "salaries"."player_id" = "players"."id"
WHERE "first_name" = 'Cal' AND "last_name" = 'Ripken'
ORDER BY "year" DESC;
