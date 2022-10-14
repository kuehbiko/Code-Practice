-- 182. Duplicate Emails
-- Write an SQL query to report all the duplicate emails.
-- Return the result table in any order.

SELECT email AS Email 
FROM person
GROUP BY email
HAVING COUNT(email) > 1;


-- 1050. Actors and Directors Who Cooperated At Least Three Times
-- Write a SQL query for a report that provides the pairs (actor_id, director_id) where the actor has cooperated with the director at least three times.
-- Return the result table in any order.

SELECT actor_id, director_id 
FROM actordirector
GROUP BY actor_id, director_id
HAVING COUNT(timestamp) >= 3;


-- 1587. Bank Account Summary II
-- Write an SQL query to report the name and balance of users with a balance higher than 10000. 
-- The balance of an account is equal to the sum of the amounts of all transactions involving that account.
-- Return the result table in any order.

SELECT name, SUM(amount) AS balance 
FROM users
JOIN transactions ON users.account = transactions.account
GROUP BY name
HAVING SUM(amount) > 10000;


-- 1084. Sales Analysis III
-- Write an SQL query that reports the products that were only sold in the first quarter of 2019. 
-- That is, between 2019-01-01 and 2019-03-31 inclusive.
-- Return the result table in any order.

SELECT s.product_id, product_name FROM sales s
LEFT JOIN product p ON s.product_id = p.product_id
GROUP BY s.product_id
HAVING MIN(sale_date)>='2019-01-01' AND MAX(sale_date)<='2019-03-31';
