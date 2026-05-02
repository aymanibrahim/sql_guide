-- SQL UNION ALL

USE employees;

-- 1. Show all employee first_name values from the employees table and also again from the dept_manager table using UNION ALL (so duplicates remain).

SELECT first_name
FROM employees

UNION ALL

SELECT e.first_name
FROM employees e
JOIN dept_manager dm 
ON e.emp_no = dm.emp_no;

-- 2. Combine two salary ranges: show employee IDs who ever earned < 40000 and employee IDs who ever earned > 100000 in one result set (with duplicates allowed).

SELECT emp_no
FROM salaries
WHERE salary < 40000

UNION ALL

SELECT emp_no
FROM salaries
WHERE salary > 100000;