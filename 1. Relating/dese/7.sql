SELECT "name" FROM "schools"
WHERE "district_id" IN (SELECT "id" FROM "districtS"
 WHERE "name" = 'Cambridge');
