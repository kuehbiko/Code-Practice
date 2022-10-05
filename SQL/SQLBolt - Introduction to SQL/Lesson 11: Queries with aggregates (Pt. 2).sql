-- SQL Lesson 11: Queries with aggregates (Pt. 2)

-- Find the number of Artists in the studio (without a HAVING clause)
SELECT COUNT(role) 
FROM employees 
WHERE role = 'Artist';

-- Find the number of Employees of each role in the studio
SELECT role, count(*) 
FROM employees 
GROUP BY role;

-- Find the total number of years employed by all Engineers
SELECT role, SUM(years_employed) 
FROM employees 
WHERE role = 'Engineer';
