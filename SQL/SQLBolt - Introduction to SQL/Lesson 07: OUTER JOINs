-- SQL Lesson 7: OUTER JOINs

-- Find the list of all buildings that have employees
SELECT DISTINCT building_name FROM buildings
LEFT JOIN employees
ON building_name = building
WHERE name IS NOT NULL;

-- Find the list of all buildings and their capacity
SELECT * FROM buildings;

-- List all buildings and the distinct employee roles in each building (including empty buildings)
SELECT DISTINCT building_name, role FROM buildings
LEFT JOIN employees
ON building_name = building;
