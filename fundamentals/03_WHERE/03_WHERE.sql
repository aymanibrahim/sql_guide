


-- SQL WHERE

USE employees;

-- Show employees whose first_name is exactly 'Georgi'.

SELECT *
FROM employees
WHERE first_name = 'Georgi';

-- Show employees hired after 1999-01-01.

SELECT *
FROM employees
WHERE hire_date > '1999-01-01';

-- Show salaries greater than 120000 from salaries.

SELECT *
FROM salaries
WHERE salary > 120000;

-- Show titles where title contains the word 'Engineer'.

SELECT *
FROM titles
WHERE title = 'Engineer';

-- Show employees with birth_date between 1960-01-01 and 1965-12-31.

SELECT *
FROM employees
WHERE birth_date BETWEEN '1960-01-01' AND '1965-12-31';