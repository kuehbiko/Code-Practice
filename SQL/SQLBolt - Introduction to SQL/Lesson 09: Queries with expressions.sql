-- SQL Lesson 9: Queries with expressions

-- List all movies and their combined sales in millions of dollars
SELECT *, (domestic_sales + international_sales)/1000000 AS Total_sales
FROM movies
JOIN boxoffice
ON id = movie_id;

-- List all movies and their ratings in percent
SELECT *, (10.0 * rating) AS "% Rating"
FROM movies
JOIN boxoffice
ON id = movie_id;

-- List all movies that were released on even number years
SELECT * FROM movies
WHERE year%2 = 0;
