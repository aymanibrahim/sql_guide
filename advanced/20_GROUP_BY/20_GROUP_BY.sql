-- SQL GROUP BY

USE employees;

-- 1. Find the number of employees in each department (using dept_emp).

SELECT 
	dept_no,
    COUNT(emp_no) AS employees_count
FROM dept_emp
GROUP BY dept_no;

-- 2. Show the average salary per job title.

SELECT 
	t.title,
    AVG(s.salary) AS avg_salary
FROM titles t
JOIN salaries s
ON t.emp_no = s.emp_no
GROUP BY t.title
ORDER BY avg_salary;

-- 3. Find how many employees were hired each year (group by YEAR(hire_date)).

SELECT 
	YEAR(hire_date) AS hire_year,
    COUNT(emp_no) AS employees_count
FROM employees
GROUP BY YEAR(hire_date)
ORDER BY YEAR(hire_date);