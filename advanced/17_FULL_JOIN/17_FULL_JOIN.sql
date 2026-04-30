-- SQL FULL JOIN (MySQL simulation using UNION)
-- since MySQL doesn’t support FULL JOIN directly, you can use UNION of LEFT + RIGHT

USE employees;

-- 1. Combine employees and departments to list all employees with their departments, 
-- but also include departments with no employees.

SELECT 
    e.first_name, 
    e.last_name, 
    d.dept_name
FROM employees e
LEFT JOIN dept_emp de 
ON e.emp_no = de.emp_no
LEFT JOIN departments d 
ON de.dept_no = d.dept_no

UNION

SELECT 
    e.first_name, 
    e.last_name, 
    d.dept_name
FROM employees e
RIGHT JOIN dept_emp de 
ON e.emp_no = de.emp_no
RIGHT JOIN departments d 
ON de.dept_no = d.dept_no;

-- 2. Show all employees and managers, 
-- including those employees who are not managers and departments without managers.

SELECT 
    e.first_name, 
    e.last_name
FROM employees e
LEFT JOIN dept_manager dm 
ON e.emp_no = dm.emp_no

UNION

SELECT 
    e.first_name, 
    e.last_name
FROM employees e
RIGHT JOIN dept_manager dm 
ON e.emp_no = dm.emp_no;

-- 3. Show all employees and their salary info, 
-- including employees without salary records and salary records without matching employees (test data case).

SELECT 
    se.emp_no, 
    se.first_name, 
    se.last_name, 
    s.salary
FROM scratch_employees se
LEFT JOIN salaries s 
ON se.emp_no = s.emp_no

UNION

SELECT 
    s.emp_no, 
    se.first_name, 
    se.last_name, 
    s.salary
FROM scratch_employees se
RIGHT JOIN salaries s 
ON se.emp_no = s.emp_no;