-- SQL LIKE

USE employees;

-- 1. Find all employees whose first_name starts with 'Al'.

SELECT DISTINCT(first_name)
FROM employees
WHERE first_name LIKE 'Al%';

-- 2. Find employees whose last_name ends with 'son'.

SELECT DISTINCT(last_name)
FROM employees
WHERE last_name LIKE '%son';

-- 3.List employees whose first_name contains the substring 'mar'.

SELECT DISTINCT(first_name)
FROM employees
WHERE first_name LIKE '%mar%';

-- 4.Show all employees whose last_name has exactly 5 characters.

SELECT DISTINCT(last_name)
FROM employees
WHERE last_name LIKE '_____';