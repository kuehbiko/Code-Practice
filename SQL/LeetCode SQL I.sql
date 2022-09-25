/*LeetCode SQL I (Using MySQL)*/

/*DAY 1 - 24 Sep 2022*/

/*595. Big Countries
A country is big if:
it has an area of at least three million (i.e., 3000000 km2), or
it has a population of at least twenty-five million (i.e., 25000000).
Write an SQL query to report the name, population, and area of the big countries.
Return the result table in any order.*/

SELECT name, population, area FROM world
WHERE area >= 3000000 OR population >= 25000000

/*1757. Recyclable and Low Fat Products
Write an SQL query to find the ids of products that are both low fat and recyclable.
Return the result table in any order.*/

SELECT product_id FROM products
WHERE low_fats = 'Y' AND recyclable = 'Y'

/*584. Find Customer Referee
Write an SQL query to report the names of the customer that are not referred by the customer with id = 2.
Return the result table in any order.*/

SELECT name FROM customer
WHERE IFNULL(referee_id,0) <> 2;

/*Note: NULL entries cannot be queried with the usual operators >,<,=. use IFNULL/ISNULL (MySQL, MS SQL) to replace the null values before querying.*/

/*183. Customers Who Never Order
Write an SQL query to report all customers who never order anything.
Return the result table in any order.*/

SELECT name as customers FROM customers
LEFT JOIN orders ON customers.id = orders.customerid
WHERE orders.customerid IS NULL;

/*Note: Turns out you CAN have a column name be the same as a table name...*/

/*DAY 2 - 25 Sep 2022*/

/*1873. Calculate Special Bonus
Write an SQL query to calculate the bonus of each employee. The bonus of an employee is 100% of their salary if 
the ID of the employee is an odd number and the employee name does not start with the character 'M'. The bonus of an employee is 0 otherwise.
Return the result table ordered by employee_id.*/

SELECT employee_id, IF(employee_id%2 = 1 AND name NOT LIKE 'M%', salary, 0) AS bonus 
FROM employees
ORDER BY employee_id

/*627. Swap Salary*/

/*Write an SQL query to swap all 'f' and 'm' values (i.e., change all 'f' values to 'm' and vice versa) with a single 
update statement and no intermediate temporary tables.*/

UPDATE salary
SET sex = IF(sex = 'f', 'm', 'f');

/*196. Delete Duplicate Emails*/

/*Write an SQL query to delete all the duplicate emails, keeping only one unique email with the smallest id. 
Note that you are supposed to write a DELETE statement and not a SELECT one*/

DELETE person2
FROM person AS person1, person AS person2
WHERE person1.email = person2.email AND person2.id > person1.id;

/*https://www.quora.com/Do-SQL-joins-change-the-original-tables --> DELETE-JOIN will change the original table*/
