-- SQL ALIASES

USE employees;

-- 1. Show each employee with the department number from dept_emp (basic join).

SELECT
	e.first_name,
    e.last_name,
    de.dept_no
FROM employees e
JOIN dept_emp de
ON e.emp_no = de.emp_no;

-- 2. Show each department and the employees assigned to it.

SELECT
	d.dept_name,
	e.first_name,
    e.last_name
FROM employees e
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments d
ON d.dept_no = de.dept_no;

-- 3. Show employees with their titles.

SELECT
	e.first_name,
    e.last_name,
    t.title
FROM employees e
JOIN titles t
ON e.emp_no = t.emp_no;