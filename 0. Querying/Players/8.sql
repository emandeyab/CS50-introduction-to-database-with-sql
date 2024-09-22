SELECT AVG(ROUND("height", 2)) AS 'Average Height' , AVG(ROUND("weight", 2)) AS 'Average Weight'
FROM 'players' WHERE "debut" >= '2000-01-01';
