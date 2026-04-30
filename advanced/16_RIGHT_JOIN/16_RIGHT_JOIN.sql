-- SQL RIGHT JOIN

USE employees;

-- 1. Show all departments and their employees, ensuring departments appear even if no employees are assigned.

SELECT 
	d.dept_name,
    e.first_name,
    e.last_name    
FROM employees e
RIGHT JOIN dept_emp de
ON e.emp_no = de.emp_no
RIGHT JOIN departments d
ON de.dept_no = d.dept_no;

-- 2. Show all departments and their managers (even if no manager is assigned).

SELECT
	d.dept_name,
    e.first_name,
    e.last_name
FROM employees e
RIGHT JOIN dept_manager dm
ON e.emp_no = dm.emp_no
RIGHT JOIN departments d
ON dm.dept_no = d.dept_no
WHERE dm.to_date = '9999-01-01';

-- 3. Show all titles and the employees holding them, but ensure all titles appear.

SELECT
	t.title,
    e.first_name,
    e.last_name
FROM employees e
RIGHT JOIN titles t
ON e.emp_no = t.emp_no
WHERE t.to_date = '9999-01-01';