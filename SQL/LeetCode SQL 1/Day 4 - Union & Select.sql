-- 1965. Employees With Missing Information
-- Write an SQL query to report the IDs of all the employees with missing information. 
-- > The information of an employee is missing if:
-- > The employee's name is missing, or
-- > The employee's salary is missing.
-- Return the result table ordered by employee_id in ascending order.

SELECT e.employee_id FROM employees e
LEFT JOIN salaries s
ON e.employee_id = s.employee_id
WHERE s.salary IS NULL

UNION

SELECT s.employee_id FROM salaries s
LEFT JOIN employees e
ON s.employee_id = e.employee_id
WHERE e.name IS NULL

ORDER BY employee_id;


-- 1795. Rearrange Products Table
-- Write an SQL query to rearrange the Products table so that each row has (product_id, store, price). 
-- If a product is not available in a store, do not include a row with that product_id and store combination in the result table.
-- Return the result table in any order.

SELECT product_id, store1 AS price, "store1" as store
FROM products
WHERE store1 IS NOT NULL

UNION

SELECT product_id, store2 AS price, "store2" as store
FROM products
WHERE store2 IS NOT NULL

UNION

SELECT product_id, store3 AS price, "store3" as store
FROM products
WHERE store3 IS NOT NULL;


-- 608. Tree Node


-- 176. Second Highest Salary
-- Write an SQL query to report the second highest salary from the Employee table. 
-- If there is no second highest salary, the query should report null.

SELECT MAX(salary) AS secondhighestsalary FROM employee
WHERE salary NOT IN (SELECT MAX(salary)
                     FROM employee)
ORDER BY salary DESC;
