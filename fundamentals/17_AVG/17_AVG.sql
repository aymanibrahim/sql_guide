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



/*
# emp_no	title	from_date	to_date
10001	Senior Engineer	1986-06-26	9999-01-01
10002	Staff	1996-08-03	9999-01-01
10003	Senior Engineer	1995-12-03	9999-01-01

# emp_no	salary	from_date	to_date
10001	60117	1986-06-26	1987-06-26
10001	62102	1987-06-26	1988-06-25
10001	66074	1988-06-25	1989-06-25




*/