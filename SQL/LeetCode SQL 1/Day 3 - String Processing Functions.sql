-- 1667. Fix Names in a Table
-- Write an SQL query to fix the names so that only the first character is uppercase and the rest are lowercase.
-- Return the result table ordered by user_id.

SELECT user_id,
CONCAT(UCASE(LEFT(name, 1)), LCASE(SUBSTR(name, 2))) AS name
FROM users
ORDER BY user_id;


-- 1484. Group Sold Products By The Date
-- Write an SQL query to find for each date the number of different products sold and their names.
-- The sold products names for each date should be 

SELECT sell_date,
COUNT(DISTINCT product) AS num_sold,
GROUP_CONCAT(DISTINCT product ORDER BY product) AS products
FROM activities
GROUP BY sell_date


-- 1527. Patients With a Condition
-- Write an SQL query to report the patient_id, patient_name all conditions of patients who have Type I Diabetes. 
-- Type I Diabetes always starts with DIAB1 prefix
-- Return the result table in any order.

SELECT * FROM patients 
WHERE conditions LIKE 'DIAB1%' OR conditions LIKE '% DIAB1%'
