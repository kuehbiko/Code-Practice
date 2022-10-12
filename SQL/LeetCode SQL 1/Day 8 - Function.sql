-- 586. Customer Placing the Largest Number of Orders
-- Write an SQL query to find the customer_number for the customer who has placed the largest number of orders.
-- The test cases are generated so that exactly one customer will have placed more orders than any other customer.

SELECT customer_number FROM orders
GROUP BY customer_number
ORDER BY COUNT(order_number) DESC
LIMIT 1;


-- 511. Game Play Analysis I
-- Write an SQL query to report the first login date for each player.
-- Return the result table in any order.

SELECT player_id, MIN(event_date) AS first_login
FROM activity
GROUP BY player_id;


-- 1890. The Latest Login in 2020
-- Write an SQL query to report the latest login for all users in the year 2020. 
-- Do not include the users who did not login in 2020.
-- Return the result table in any order.

SELECT user_id,  MAX(time_stamp) AS last_stamp FROM logins
WHERE YEAR(time_stamp) = '2020'
GROUP BY user_id;


-- 1741. Find Total Time Spent by Each Employee
-- Write an SQL query to calculate the total time in minutes spent by each employee on each day at the office. 
-- Note that within one day, an employee can enter and leave more than once. 
-- The time spent in the office for a single entry is out_time - in_time.
-- Return the result table in any order.

SELECT event_day AS day, emp_id, SUM((out_time-in_time)) AS total_time 
FROM employees
GROUP BY event_day, emp_id;
