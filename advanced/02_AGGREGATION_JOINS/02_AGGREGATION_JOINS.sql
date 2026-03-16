-- Aggregation + Join

USE employees;

-- 1. For each department, count how many current employees it has. Order by the count descending.

SELECT 
	d.dept_name AS Department,
	COUNT(e.emp_no) AS employees_count
FROM employees e
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments d
ON de.dept_no = d.dept_no
WHERE de.to_date = '9999-01-01'
GROUP BY d.dept_no
ORDER BY COUNT(e.emp_no) DESC;

-- 2. For each department, show the average current salary. Order by average descending.
-- Hint: join dept_emp (current) → salaries (current).

SELECT 
	d.dept_name AS Department,
	AVG(s.salary) AS average_current_salary
FROM salaries s
JOIN dept_emp de
ON s.emp_no = de.emp_no
JOIN departments d
ON de.dept_no = d.dept_no
WHERE de.to_date = '9999-01-01'
AND s.to_date = '9999-01-01'
GROUP BY d.dept_no
ORDER BY AVG(s.salary) DESC;

-- 3. For each title, show the average current salary, and only include titles with average > 70000.

SELECT
	t.title AS Title,
	AVG(s.salary) AS average_current_salary
FROM titles t
JOIN salaries s
ON t.emp_no = s.emp_no
WHERE t.to_date = '9999-01-01'
AND s.to_date = '9999-01-01'
GROUP BY t.title
HAVING AVG(s.salary) > 70000
ORDER BY AVG(s.salary) DESC;

-- 4. For each department, show the min and max current salary and the number of current employees.

SELECT 
	d.dept_name AS Department,
	MIN(s.salary) AS min_current_salary,
    MAX(s.salary) AS max_current_salary,
	COUNT(e.emp_no) AS employees_count
FROM employees e
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments d
ON de.dept_no = d.dept_no
JOIN salaries s
ON s.emp_no = de.emp_no
WHERE de.to_date = '9999-01-01'
AND s.to_date = '9999-01-01'
GROUP BY d.dept_no
ORDER BY COUNT(e.emp_no) DESC;

-- 5. Find the top 10 highest-paid current employees (show name, salary, department).

SELECT
	CONCAT(e.first_name,' ',e.last_name) AS Employee,
    s.salary AS Salary,
    d.dept_name AS Department
FROM employees e
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments d
ON de.dept_no = d.dept_no
JOIN salaries s
ON s.emp_no = de.emp_no
WHERE de.to_date = '9999-01-01'
AND s.to_date = '9999-01-01'
ORDER BY s.salary DESC
LIMIT 10;

-- 6. For each department, list the most recently hired employee (name, hire_date).
-- Hint: window function alternative or subquery with MAX(hire_date) per department.

SELECT Department, Employee, Hire_date
FROM (
    SELECT 
        d.dept_name AS Department,
        CONCAT(e.first_name, ' ', e.last_name) AS Employee,
        e.hire_date AS Hire_date,
        ROW_NUMBER() OVER(PARTITION BY d.dept_no ORDER BY e.hire_date DESC) as ranking
    FROM employees e
    JOIN dept_emp de 
    ON e.emp_no = de.emp_no
    JOIN departments d 
    ON de.dept_no = d.dept_no
    WHERE de.to_date = '9999-01-01'
) AS ranked_employees
WHERE ranking = 1;