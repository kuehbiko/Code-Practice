-- SQLBolt - Introduction to SQL 
-- (Using SQLite)

-- SQL Lesson 1: SELECT queries 101
-- Find the title of each film
SELECT title FROM movies;
-- Find the director of each film
SELECT director FROM movies;
-- Find the title and director of each film
SELECT title, director FROM movies;
-- Find the title and year of each film
SELECT title, year FROM movies;
-- Find all the information about each film
SELECT * FROM movies;

-- SQL Lesson 2: Queries with constraints (Pt. 1)
-- Find the movie with a row id of 6
-- Find the movies released in the years between 2000 and 2010
-- Find the movies not released in the years between 2000 and 2010
-- Find the first 5 Pixar movies and their release year

-- SQL Lesson 3: Queries with constraints (Pt. 2)
-- Find all the Toy Story movies
-- Find all the movies directed by John Lasseter
-- Find all the movies (and director) not directed by John Lasseter
-- Find all the WALL-* movies

-- SQL Lesson 4: Filtering and sorting Query results
-- List all directors of Pixar movies (alphabetically), without duplicates
-- List the last four Pixar movies released (ordered from most recent to least)
-- List the first five Pixar movies sorted alphabetically
-- List the next five Pixar movies sorted alphabetically

-- SQL Review: Simple SELECT Queries
-- List all the Canadian cities and their populations
-- Order all the cities in the United States by their latitude from north to south
-- List all the cities west of Chicago, ordered from west to east
-- List the two largest cities in Mexico (by population)
-- List the third and fourth largest cities (by population) in the United States and their population

-- SQL Lesson 6: Multi-table queries with JOINs
-- Find the domestic and international sales for each movie
-- Show the sales numbers for each movie that did better internationally rather than domestically
-- List all the movies by their ratings in descending order

-- SQL Lesson 7: OUTER JOINs
-- Find the list of all buildings that have employees
-- Find the list of all buildings and their capacity
-- List all buildings and the distinct employee roles in each building (including empty buildings)

-- SQL Lesson 8: A short note on NULLs
-- Find the name and role of all employees who have not been assigned to a building
-- Find the names of the buildings that hold no employees

-- SQL Lesson 9: Queries with expressions
-- List all movies and their combined sales in millions of dollars
-- List all movies and their ratings in percent
-- List all movies that were released on even number years

-- 21 Sep 2022
-- SQL Lesson 10: Queries with aggregates (Pt. 1)
-- Find the longest time that an employee has been at the studio
-- For each role, find the average number of years employed by employees in that role
-- Find the total number of employee years worked in each building

-- 22 Sep 2022
-- SQL Lesson 11: Queries with aggregates (Pt. 2)
-- Find the number of Artists in the studio (without a HAVING clause)
SELECT COUNT(role) FROM employees WHERE role = 'Artist'
-- Find the number of Employees of each role in the studio
SELECT role, count(*) FROM employees GROUP BY role
-- Find the total number of years employed by all Engineers
SELECT role, SUM(years_employed) FROM employees WHERE role = 'Engineer'

-- 22 Sep 2022
-- SQL Lesson 12: Order of execution of a Query
-- Find the number of movies each director has directed
SELECT COUNT(Title), director FROM movies GROUP BY director;
-- Find the total domestic and international sales that can be attributed to each director
SELECT director, SUM(domestic_sales + international_sales) AS total_sales
FROM movies
JOIN boxoffice
ON id = movie_id
GROUP BY director

-- 22 Sep 2022
-- SQL Lesson 13: Inserting rows
-- Add the studio's new production, Toy Story 4 to the list of movies (you can use any director)
INSERT INTO movies
(title, director, year, length_minutes)
VALUES ('Toy Story 4', 'Pete Docter', 2022, 100 )
-- Toy Story 4 has been released to critical acclaim! It had a rating of 8.7, and made 340 million domestically and 270 million internationally. Add the record to the BoxOffice table.
INSERT INTO boxoffice
VALUES (4, 8.7, 340*1000000, 270*1000000);

-- 24 Sep 2022
-- SQL Lesson 14: Updating rows
-- The director for A Bug's Life is incorrect, it was actually directed by John Lasseter
UPDATE movies
SET director = "John Lasseter"
WHERE title = "A Bug's Life"; 
-- The year that Toy Story 2 was released is incorrect, it was actually released in 1999
UPDATE movies
SET year = 1999
WHERE title = "Toy Story 2";
-- Both the title and director for Toy Story 8 is incorrect! The title should be "Toy Story 3" and it was directed by Lee Unkrich
UPDATE movies
SET title = "Toy Story 3", director = "Lee Unkrich"
WHERE title = "Toy Story 8"

-- 24 Sep 2022
-- SQL Lesson 15: Deleting rows
-- This database is getting too big, lets remove all movies that were released before 2005.
DELETE FROM movies
WHERE year < 2005;
-- Andrew Stanton has also left the studio, so please remove all movies directed by him.
DELETE FROM movies
WHERE director = "Andrew Stanton";

-- 24 Sep 2022
-- SQL Lesson 16: Creating tables
-- Create a new table named Database with the following columns:
-- – Name A string (text) describing the name of the database
-- – Version A number (floating point) of the latest version of this database
-- – Download_count An integer count of the number of times this database was downloaded
-- This table has no constraints.
CREATE TABLE database (
name TEXT,
version FLOAT,
download_count INTEGER
);

-- 24 Sep 2022
-- SQL Lesson 17: Altering tables
-- Add a column named Aspect_ratio with a FLOAT data type to store the aspect-ratio each movie was released in.
ALTER TABLE movies
ADD aspect_ratio FLOAT
-- Add another column named Language with a TEXT data type to store the language that the movie was released in. Ensure that the default for this language is English.
ALTER TABLE movies
ADD language TEXT 
DEFAULT 'English';

-- 24 Sep 2022
-- SQL Lesson 18: Dropping tables
-- We've sadly reached the end of our lessons, lets clean up by removing the Movies table
DROP TABLE IF EXISTS movies;
-- And drop the BoxOffice table as well
DROP TABLE IF EXISTS boxoffice;

