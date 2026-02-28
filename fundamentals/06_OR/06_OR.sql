-- SQL OR

USE employees;

-- Show employees whose first_name = 'Georgi' or first_name = 'Parto'.

SELECT *
FROM employees
WHERE first_name = 'Georgi' OR first_name = 'Parto';

-- Show titles where title is 'Engineer' or 'Senior Engineer'.

SELECT *
FROM titles
WHERE title = 'Engineer' OR title = 'Senior Engineer';