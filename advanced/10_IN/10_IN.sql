


-- SQL IN

USE employees;

-- 1. Show employees whose first_name is in the set ('Georgi', 'Parto', 'Bezalel').

SELECT first_name
FROM employees
WHERE first_name IN ('Georgi', 'Parto', 'Bezalel');

-- 2. Find departments whose dept_name is in ('Sales', 'Marketing', 'Finance').

SELECT dept_name
FROM departments
WHERE dept_name IN ('Sales', 'Marketing', 'Finance');

-- 3. Show titles where title is in ('Engineer', 'Senior Engineer', 'Manager').

SELECT title
FROM titles
WHERE title IN ('Engineer', 'Senior Engineer', 'Manager');