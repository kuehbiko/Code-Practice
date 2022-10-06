-- SQL Lesson 6: Multi-table queries with JOINs

-- Find the domestic and international sales for each movie
SELECT * FROM movies
JOIN boxoffice
ON id = movie_id;

-- Show the sales numbers for each movie that did better internationally rather than domestically
SELECT * FROM movies
JOIN boxoffice
ON id = movie_id
WHERE domestic_sales < international_sales;

-- List all the movies by their ratings in descending order
SELECT * FROM movies
JOIN boxoffice
ON id = movie_id
ORDER BY rating DESC;
