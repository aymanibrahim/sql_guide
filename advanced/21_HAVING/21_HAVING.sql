-- SQL HAVING

USE employees;

-- 1. Show departments with more than 1000 current employees.

SELECT 
	dept_no,
    COUNT(emp_no) AS employees_count
FROM dept_emp
GROUP BY dept_no
HAVING COUNT(emp_no) > 1000;

-- 2. Show job titles where the average salary is greater than 80,000.

SELECT 
	t.title,
    AVG(s.salary) AS avg_salary
FROM titles t
JOIN salaries s
ON t.emp_no = s.emp_no
GROUP BY t.title
HAVING AVG(s.salary) > 80000
ORDER BY avg_salary;

-- 3. Find all hire years where the count of employees hired is greater than 5000.

SELECT 
	YEAR(hire_date) AS hire_year,
    COUNT(emp_no) AS employees_count
FROM employees
GROUP BY YEAR(hire_date)
HAVING COUNT(emp_no) > 5000
ORDER BY employees_count DESC;