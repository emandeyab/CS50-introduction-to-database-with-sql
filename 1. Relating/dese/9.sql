SELECT "name" FROM "districts"
JOIN "expenditures" ON "districtS"."id" = "expenditures"."district_id"
WHERE "pupils" = (SELECT MIN("pupils") FROM "expenditures");
