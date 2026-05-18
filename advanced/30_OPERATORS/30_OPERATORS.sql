-- SQL OPERATORS

USE employees;

-- 1. Comparison: list employees with hire_date >= '2000-01-01'.

SELECT 
	emp_no, 
    first_name, 
    last_name, 
    hire_date
FROM employees
WHERE hire_date >= '2000-01-01';

-- 2. Logical: list employees where first name starts with 'A' AND gender = 'F'.

SELECT 
	emp_no, 
    first_name, 
    last_name,
    gender
FROM employees
WHERE first_name LIKE 'A%'
AND gender = 'F';

-- 3. Pattern: titles LIKE '%Engineer%'.

SELECT emp_no, title
FROM titles
WHERE title LIKE '%Engineer%'
AND to_date = '9999-01-01';

-- 4. Set: employees with first_name IN ('Georgi','Bezalel','Chirstian').

SELECT 
	emp_no, 
    first_name, 
    last_name
FROM employees
WHERE first_name IN ('Georgi','Bezalel','Chirstian');

-- 5. Range: salaries BETWEEN 60000 AND 80000.

SELECT emp_no, salary
FROM salaries
WHERE salary BETWEEN 60000 AND 80000
AND to_date = '9999-01-01';

-- 6. Arithmetic: show current salaries plus a 5% computed raise as a new column.

SELECT 
	emp_no, 
    salary AS current_salary,
    salary * 1.05 AS new_salary
FROM salaries
WHERE to_date = '9999-01-01';

-- 7. Negation: employees NOT in a department containing 'Sales'.

SELECT 
	e.emp_no, 
    e.first_name,
    e.last_name,
    d.dept_name
FROM employees e
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments d 
ON de.dept_no = d.dept_no
WHERE d.dept_name NOT LIKE '%Sales%';

-- 8. Null-safe equality: demonstrate <=> on a scratch table with some NULLs.

SELECT 
	emp_no, 
    first_name, 
    last_name,
    hire_date 
FROM scratch_employees 
WHERE hire_date <=> NULL;
