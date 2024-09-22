SELECT "city", COUNT(*) AS "num_of_public_schools" FROM "schools"
WHERE "type" = 'Public School'
GROUP BY "city"
ORDER BY "num_of_public_schools" DESC, "city" ASC LIMIT 10;
