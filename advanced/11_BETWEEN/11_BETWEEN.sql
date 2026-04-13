-- SQL BETWEEN

USE employees;

-- 1. List employees born between 1960-01-01 and 1965-12-31.

SELECT first_name, last_name, birth_date
FROM employees
WHERE birth_date BETWEEN '1960-01-01' AND '1965-12-31';

-- 2. Show salaries between 50,000 and 60,000.

SELECT emp_no, salary
FROM salaries
WHERE salary BETWEEN 50000 AND 60000
AND to_date = '9999-01-01';

-- 3. List employees hired between 1990 and 1995.

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1995-12-31';

-- 4. Show all dept_emp rows where from_date is between '1995-01-01' and '2000-01-01'.

SELECT *
FROM dept_emp
WHERE from_date BETWEEN '1995-01-01' AND '2000-01-01';