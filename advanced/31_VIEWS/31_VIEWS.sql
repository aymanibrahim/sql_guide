-- SQL VIEWS

USE employees;

-- 1. Create a view v_current_employees (emp_no, name, dept_no, dept_name) for current assignments.

CREATE OR REPLACE VIEW v_current_employees AS
SELECT 
    e.emp_no,
    CONCAT(e.first_name, ' ', e.last_name) AS name,
    d.dept_no,
    d.dept_name
FROM employees e
JOIN dept_emp de 
ON e.emp_no = de.emp_no
JOIN departments d 
ON de.dept_no = d.dept_no
WHERE de.to_date = '9999-01-01';

SELECT *
FROM v_current_employees;

-- 2. Create v_current_payroll with current salaries only.

CREATE OR REPLACE VIEW v_current_payroll AS
SELECT 
    e.emp_no,
    CONCAT(e.first_name, ' ', e.last_name) AS name,
    s.salary
FROM employees e
JOIN salaries s 
ON e.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01';

SELECT *
FROM v_current_payroll;

-- 3. Create v_dept_stats showing per-department current headcount, min/max/avg salary.

CREATE OR REPLACE VIEW v_dept_stats AS
SELECT 
    d.dept_name,
    COUNT(de.emp_no) AS headcount,
    MIN(s.salary) AS min_salary,
    MAX(s.salary) AS max_salary,
    ROUND(AVG(s.salary), 2) AS avg_salary
FROM departments d
JOIN dept_emp de 
ON d.dept_no = de.dept_no
JOIN salaries s 
ON de.emp_no = s.emp_no
WHERE de.to_date = '9999-01-01' 
AND s.to_date = '9999-01-01'
GROUP BY d.dept_no, d.dept_name
ORDER BY headcount DESC;

SELECT *
FROM v_dept_stats;

-- 4. Create v_engineering_only for all current employees in departments whose name contains 'Engineer'.

CREATE OR REPLACE VIEW v_engineering_only AS
SELECT 
	emp_no, 
    name,
    dept_name
FROM v_current_employees
WHERE dept_name LIKE '%Engineer%';

SELECT *
FROM v_engineering_only;

-- 5. Query the above views together to list the top 10 highest-paid current employees (name, dept, salary).

SELECT 
    ce.name,
    ce.dept_name AS dept,
    cp.salary
FROM v_current_employees ce
JOIN v_current_payroll cp 
ON ce.emp_no = cp.emp_no
ORDER BY cp.salary DESC
LIMIT 10;

-- 6. Alter one view to include hire_date and re-run a query that uses it.

CREATE OR REPLACE VIEW v_current_employees AS
SELECT 
    e.emp_no,
    CONCAT(e.first_name, ' ', e.last_name) AS name,
    e.hire_date, -- Added hire_date
    d.dept_no,
    d.dept_name
FROM employees e
JOIN dept_emp de 
ON e.emp_no = de.emp_no
JOIN departments d 
ON de.dept_no = d.dept_no
WHERE de.to_date = '9999-01-01';

SELECT *
FROM v_current_employees;