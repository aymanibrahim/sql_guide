-- SQL COMMENTS

USE employees;

-- 1. Write a query listing current employees and their departments, adding a header block comment explaining the join logic.

/*
Lists all current employees alongside their assigned department.
Join logic:
  - Start with the 'employees' table.
  - Use JOIN 'dept_emp' to map employees to their department IDs.
    The condition `de.to_date = '9999-01-01'` ensures that we only return the active assignment.
  - Use LEFT JOIN 'departments' to translate the department code (e.g., d001)
    into its human-readable name (e.g., 'Marketing').
=============================================================================
*/

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    d.dept_name
FROM employees e
JOIN dept_emp de 
ON e.emp_no = de.emp_no 
AND de.to_date = '9999-01-01'
LEFT JOIN departments d 
ON de.dept_no = d.dept_no;

-- 2. Annotate an aggregate query with inline comments to explain each expression.

SELECT 
    de.dept_no,
    COUNT(de.emp_no) AS total_employees,       -- Counts total active employees
    AVG(s.salary) AS average_salary,           -- Calculates the average of current salaries
    MAX(s.salary) - MIN(s.salary) AS pay_gap   -- Calculates the difference between highest and lowest salaries
FROM salaries s
JOIN dept_emp de 
ON s.emp_no = de.emp_no
WHERE s.to_date = '9999-01-01'
AND de.to_date = '9999-01-01'
GROUP BY dept_no
ORDER BY pay_gap DESC;

-- 3. Comment out one of two WHERE conditions (to compare results) using --.

SELECT 
    emp_no, 
    first_name, 
    last_name, 
    gender,
    hire_date
FROM employees
WHERE hire_date >= '1990-01-01'
--  AND gender = 'F' -- Commented out to compare the full workforce size against female-only employees
;

-- 4. Use # to tag the date/author of the query.

# DATE: 2026-01-01
# AUTHOR: Ayman Ibrahim

SELECT 
    emp_no, 
    first_name, 
    last_name, 
    hire_date
FROM employees
WHERE hire_date > '1990-01-01';

-- 5. Wrap a multi-line explanation using /* ... */ above a window function query.

/*
  Assigns a sequential row number to every employee within their specific department, 
  ordered chronologically by their start date.
  
  This allows the business to isolate organizational pioneers 
  (where ranking = 1) from later team additions 
*/

SELECT 
    de.dept_no,
    e.emp_no,
    e.first_name,
    e.last_name,
    de.from_date AS start_date,
    ROW_NUMBER() OVER (
        PARTITION BY de.dept_no 
        ORDER BY de.from_date 
    ) AS seniority_rank
FROM employees e
JOIN dept_emp de 
ON e.emp_no = de.emp_no
WHERE de.to_date = '9999-01-01';
