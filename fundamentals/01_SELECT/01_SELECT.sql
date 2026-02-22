USE employees;

-- Show all columns for any 10 rows from employees.
SELECT *
FROM employees
LIMIT 10;

-- Show only emp_no, first_name, last_name from employees.
SELECT emp_no, first_name, last_name
FROM employees
LIMIT 10;

-- From departments, list dept_no and dept_name.
SELECT dept_no, dept_name
FROM departments;

-- From salaries, show emp_no, salary, from_date, to_date for any 5 rows.
SELECT emp_no, salary, from_date, to_date
FROM salaries
LIMIT 5;
