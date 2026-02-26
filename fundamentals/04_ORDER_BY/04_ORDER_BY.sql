-- SQL ORDER BY

USE employees;

-- List employees (emp_no, first_name, last_name) ordered by hire_date ascending.

SELECT emp_no, first_name, last_name
FROM employees
ORDER BY hire_date ASC;

-- List the 20 most recent hires (emp_no, name, hire_date) ordered by hire_date descending.

SELECT emp_no, first_name, last_name, hire_date
FROM employees
ORDER BY hire_date DESC
LIMIT 20;

-- List departments ordered alphabetically by dept_name.

SELECT *
FROM departments
ORDER BY dept_name ASC;
