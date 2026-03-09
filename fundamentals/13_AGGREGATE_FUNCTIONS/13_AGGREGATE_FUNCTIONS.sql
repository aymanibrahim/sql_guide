-- SQL Aggregate Functions

USE employees;

-- 1. Count how many rows are in employees.

SELECT COUNT(*) AS rows_num
FROM employees;

-- 2. Find the minimum, maximum, and average salary across all salaries.

SELECT 
	MAX(salary) AS max_salary,
    MIN(salary) AS min_salary,
    AVG(salary) AS avg_salary
FROM salaries;

-- 3. Count how many distinct titles exist in titles.

SELECT COUNT(DISTINCT title) AS titles_num
FROM titles;

-- 4. For current salaries only (to_date = '9999-01-01'), compute min, max, avg salary.

SELECT 
	MAX(salary) AS max_salary,
    MIN(salary) AS min_salary,
    AVG(salary) AS avg_salary
FROM salaries
WHERE to_date = '9999-01-01';
