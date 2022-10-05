-- 595. Big Countries
-- A country is big if:
-- > It has an area of at least three million (i.e., 3000000 km2), or
-- > It has a population of at least twenty-five million (i.e., 25000000).
-- Write an SQL query to report the name, population, and area of the big countries.
-- Return the result table in any order.

SELECT name, population, area FROM world
WHERE area >= 3000000 OR population >= 25000000;


-- 1757. Recyclable and Low Fat Products
-- Write an SQL query to find the ids of products that are both low fat and recyclable.
-- Return the result table in any order.

SELECT product_id FROM products
WHERE low_fats = 'Y' AND recyclable = 'Y';


-- 584. Find Customer Referee
-- Write an SQL query to report the names of the customer that are not referred by the customer with id = 2.
-- Return the result table in any order.

SELECT name FROM customer
WHERE IFNULL(referee_id,0) <> 2;


-- 183. Customers Who Never Order
-- Write an SQL query to report all customers who never order anything.
-- Return the result table in any order.

SELECT name as customers FROM customers
LEFT JOIN orders ON customers.id = orders.customerid
WHERE orders.customerid IS NULL;
