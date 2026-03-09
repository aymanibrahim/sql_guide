-- SQL LIMIT
-- 

USE employees;

-- 1. Show the first 10 employees (any ordering).

SELECT *
FROM employees
LIMIT 10;

-- 2. Show the top 5 highest current salaries (to_date = '9999-01-01') using ORDER BY salary DESC LIMIT 5.

SELECT *
FROM salaries
WHERE to_date = '9999-01-01'
ORDER BY salary DESC
LIMIT 5;