-- SQL ALIASES

USE employees;

-- 1. Show employees’ emp_no as ID, first_name as First, and last_name as Last.

SELECT 
	emp_no AS ID, 
    first_name AS First,
    last_name AS Last
FROM employees;

-- 2. Show average current salary as AvgSalary for all employees.

SELECT AVG(salary) AS AvgSalary
FROM salaries
WHERE to_date = '9999-01-01';

-- 3. Join employees with departments and alias them as e and d, then show e.first_name, e.last_name, d.dept_name.

SELECT 
	e.first_name AS First, 
    e.last_name AS Last, 
    d.dept_name AS Department
FROM employees e
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments d
ON de.dept_no = d.dept_no;