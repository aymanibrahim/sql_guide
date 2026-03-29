-- SQL WILDCARDS

USE employees;

-- 1. Find employees whose first_name is 2 letters only, like 'Jo' or 'Li'.

SELECT DISTINCT(first_name)
FROM employees
WHERE first_name LIKE '__';

-- 2. List employees whose last_name starts with 'K' and has any 6 characters total.

SELECT DISTINCT(last_name)
FROM employees
WHERE last_name LIKE 'K_____';

-- 3. Find all employees whose first_name has '__a%' (3rd letter is a).

SELECT DISTINCT(first_name)
FROM employees
WHERE first_name LIKE '__a%';