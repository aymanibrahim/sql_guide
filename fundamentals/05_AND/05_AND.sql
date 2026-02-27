-- SQL AND

USE employees;

-- Show employees with gender = 'F' and hire_date >= '2000-01-01'.

SELECT *
FROM employees
WHERE gender = 'F' AND hire_date >= '2000-01-01';

-- From salaries, show rows with salary >= 100000 and to_date = '9999-01-01' (current high earners).

SELECT *
FROM salaries
WHERE salary >= 100000 AND to_date = '9999-01-01';