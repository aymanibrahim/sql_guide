-- SQL NOT

USE employees;

-- 1. Show employees not of gender 'M'.

SELECT *
FROM employees
WHERE NOT gender = 'M';

-- 2. Show departments whose name does not contain the word 'Sales'.

SELECT *
FROM departments
WHERE NOT dept_name = 'Sales';
