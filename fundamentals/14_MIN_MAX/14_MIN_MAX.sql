-- SQL MIN and MAX

USE employees;

-- 1. Show the earliest hire_date and the latest hire_date from employees.
-- If looking at the dept_emp table

SELECT 
	MIN(from_date) AS earliest_hire_date,
    MAX(from_date) AS latest_hire_date
FROM dept_emp;

-- 2. Show the minimum and maximum current salary per whole table (not per person).

SELECT
	MIN(salary) AS minimum_salary,
    MAX(salary) AS maximum_salary
FROM salaries;