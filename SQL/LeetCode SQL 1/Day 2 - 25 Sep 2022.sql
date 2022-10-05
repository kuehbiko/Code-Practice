-- 1873. Calculate Special Bonus
-- Write an SQL query to calculate the bonus of each employee. 
-- The bonus of an employee is 100% of their salary if: 
-- > The ID of the employee is an odd number and 
-- > The employee name does not start with the character 'M'. 
-- The bonus of an employee is 0 otherwise.
-- Return the result table ordered by employee_id.*/

SELECT employee_id, IF(employee_id%2 = 1 AND name NOT LIKE 'M%', salary, 0) AS bonus 
FROM employees
ORDER BY employee_id


-- 27. Swap Salary

-- Write an SQL query to swap all 'f' and 'm' values (i.e., change all 'f' values to 'm' and vice versa). 
-- Use a single update statement and no intermediate temporary tables.

UPDATE salary
SET sex = IF(sex = 'f', 'm', 'f');


-- 196. Delete Duplicate Emails

-- Write an SQL query to delete all the duplicate emails, keeping only one unique email with the smallest id. 
-- Note that you are supposed to write a DELETE statement and not a SELECT one

DELETE person2
FROM person AS person1, person AS person2
WHERE person1.email = person2.email AND person2.id > person1.id;
