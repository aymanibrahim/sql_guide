-- SQL INNER JOIN

USE employees;

-- 1. Show employees with their current department names.

SELECT	
	e.first_name,
    e.last_name,
    d.dept_name
FROM employees e
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments d
ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01';

-- 2. List current managers with their department names.

SELECT	
	e.first_name,
    e.last_name,
    d.dept_name
FROM employees e
JOIN dept_manager dm
ON e.emp_no = dm.emp_no
JOIN departments d
ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01';

-- 3. Show all employees who currently have the title 'Engineer'.

SELECT
	e.first_name,
    e.last_name,
    t.title
FROM employees e
JOIN titles t
ON e.emp_no = t.emp_no
WHERE t.to_date = '9999-01-01' AND title LIKE 'Engineer';