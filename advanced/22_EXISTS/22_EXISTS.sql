-- SQL EXISTS

USE employees;

-- 1. List employees who currently belong to any department (use EXISTS with dept_emp).

SELECT 
    e.emp_no, 
    e.first_name, 
    e.last_name
FROM 
    employees e
WHERE EXISTS (
    SELECT 1 
    FROM dept_emp de 
    WHERE de.emp_no = e.emp_no 
    AND de.to_date = '9999-01-01'
);

-- 2. List employees who are not currently assigned to a department (use NOT EXISTS).

SELECT 
    e.emp_no, 
    e.first_name, 
    e.last_name
FROM 
    employees e
WHERE NOT EXISTS (
    SELECT 1 
    FROM dept_emp de 
    WHERE de.emp_no = e.emp_no 
    AND de.to_date = '9999-01-01'
);

-- 3. Show departments that currently have at least one manager (use dept_manager and EXISTS).

SELECT 
    d.dept_name 
FROM 
    departments d
WHERE EXISTS (
    SELECT 1 
    FROM dept_manager dm
    WHERE dm.dept_no = d.dept_no 
    AND dm.to_date = '9999-01-01'
);

-- 4. Show employees who currently hold the title 'Senior Engineer' and currently earn > 90,000 (two EXISTS subqueries).

SELECT 
    e.emp_no, 
    e.first_name, 
    e.last_name
FROM 
    employees e
WHERE EXISTS (
    SELECT 1 
    FROM titles t
    WHERE t.emp_no = e.emp_no 
    AND t.title = 'Senior Engineer'
    AND t.to_date = '9999-01-01'
)
AND EXISTS (
    SELECT 1 
    FROM salaries s
    WHERE s.emp_no = e.emp_no 
    AND s.salary > 90000
    AND s.to_date = '9999-01-01'
);

-- 5. Show employees for whom a salary change occurred on the same date as a title change (use EXISTS to test a matching from_date).

SELECT 
    e.emp_no, 
    e.first_name, 
    e.last_name
FROM employees e
WHERE EXISTS (
    SELECT 1 
    FROM titles t
	JOIN salaries s 
    ON t.emp_no = s.emp_no
    WHERE t.emp_no = e.emp_no 
    AND t.from_date = s.from_date
);

-- 6. Show employees who never had a salary < 40,000 (use NOT EXISTS on salaries).

SELECT 
    e.emp_no, 
    e.first_name, 
    e.last_name
FROM 
    employees e
WHERE NOT EXISTS (
    SELECT 1 
    FROM salaries s
    WHERE s.emp_no = e.emp_no 
    AND s.salary < 40000    
);