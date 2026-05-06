-- SQL SELECT INTO

USE employees;

-- 1. Create a backup table backup_departments from departments.

CREATE TABLE backup_departments AS 
SELECT *
FROM departments;

SELECT *
FROM backup_departments;

-- 2. Create current_payroll with emp_no, salary for current salaries only.

CREATE TABLE current_payroll AS
SELECT 
	emp_no, 
    salary
FROM salaries
WHERE to_date = '9999-01-01';

SELECT *
FROM current_payroll;

-- 3. Create engineering_roster with current employees (name + dept) for departments whose name contains 'Engineer'.

CREATE TABLE engineering_roster AS
SELECT 
	e.first_name, 
	e.last_name, 
	d.dept_name
FROM employees e
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments d
ON de.dept_no = d.dept_no
WHERE de.to_date = '9999-01-01'
AND d.dept_name LIKE '%Engineer%';

SELECT *
FROM engineering_roster;

-- 4. Create top_paid_50 table containing the top 50 highest current salaries (include name + dept).

CREATE TABLE top_paid_50 AS
SELECT
	e.first_name, 
	e.last_name, 
	d.dept_name,
    s.salary
FROM employees e
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments d
ON de.dept_no = d.dept_no
JOIN salaries s
ON e.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01'
ORDER BY s.salary DESC
LIMIT 50;

SELECT *
FROM top_paid_50;

-- 5. Create hired_1999 table with employees hired in 1999.

CREATE TABLE hired_1999 AS
SELECT *
FROM employees
WHERE YEAR(hire_date) = 1999;

SELECT *
FROM hired_1999;
