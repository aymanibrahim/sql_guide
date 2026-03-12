-- SQL COUNT

USE employees;

-- 1. Count how many employees were hired in the year 1990.

SELECT COUNT(*) AS hired_in_1990_num
FROM dept_emp
WHERE from_date BETWEEN '1990-01-01' AND '1990-12-31';

-- 2. Count how many employees currently hold the title 'Senior Engineer' (to_date = '9999-01-01').

SELECT COUNT(*) AS senior_engineer_num
FROM titles
WHERE title = 'Senior Engineer' AND to_date = '9999-01-01';