-- SQL AVG

USE employees;

-- 1. Compute the average current salary (to_date = '9999-01-01').

SELECT AVG(salary) AS avg_salary
FROM salaries
WHERE to_date = '9999-01-01';

-- 2. Compute the average salary per title (using all history in titles joined to salaries).

SELECT 
	t.title, 
    AVG(s.salary) AS avg_salary
FROM titles t
JOIN salaries s
ON t.emp_no = s.emp_no
GROUP BY t.title;
