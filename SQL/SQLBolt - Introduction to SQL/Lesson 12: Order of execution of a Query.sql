-- SQL Lesson 12: Order of execution of a Query

-- Find the number of movies each director has directed
SELECT COUNT(Title), director 
FROM movies 
GROUP BY director;

-- Find the total domestic and international sales that can be attributed to each director
SELECT director, SUM(domestic_sales + international_sales) AS total_sales
FROM movies
JOIN boxoffice
ON id = movie_id
GROUP BY director
