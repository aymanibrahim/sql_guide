-- Joins Basics

USE employees;

-- 1. Show each employee with their current department name.
-- Hint: dept_emp.to_date = '9999-01-01', join with departments.

SElECT 
	CONCAT(e.first_name,' ',e.last_name) AS Employee,
	d.dept_name AS Department
FROM employees e
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments d
ON de.dept_no = d.dept_no
WHERE de.to_date = '9999-01-01';

-- 2. Show each current manager (employee name) and the department they manage.
-- Hint: dept_manager.to_date = '9999-01-01', join employees, departments.

SELECT 
	CONCAT(e.first_name,' ',e.last_name) AS Manager,
	d.dept_name AS Department
FROM employees e
JOIN dept_manager dm
ON dm.emp_no = e.emp_no
JOIN departments d
ON dm.dept_no = d.dept_no
WHERE dm.to_date = '9999-01-01';

-- 3. Show each employee and their current title.
-- Hint: titles.to_date = '9999-01-01'.

SElECT 
	CONCAT(e.first_name,' ',e.last_name) AS Employee,
	t.title AS Title
FROM employees e
JOIN titles t
ON e.emp_no = t.emp_no
WHERE t.to_date = '9999-01-01';
