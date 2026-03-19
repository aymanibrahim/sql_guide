

-- Date Logic

USE employees;

-- 1. Count how many employees were hired per year; list the 5 years with the highest hires.

SELECT
	YEAR(hire_date) AS hire_year,
    COUNT(*) AS total_hires
FROM employees
GROUP BY hire_year
ORDER BY total_hires DESC
LIMIT 5;
          
-- 2. For each department, show the current manager and how long (in years) they’ve been manager.
-- Hint: TIMESTAMPDIFF(YEAR, from_date, CURDATE()) on current manager rows.

SELECT
	d.dept_name AS department,
    CONCAT(e.first_name, ' ', e.last_name) AS current_manager,
    TIMESTAMPDIFF(YEAR, dm.from_date, CURDATE()) AS years_in_role
FROM departments d
JOIN dept_manager dm
ON d.dept_no = dm.dept_no 
JOIN employees e
ON dm.emp_no = e.emp_no
WHERE dm.to_date = '9999-01-01'
ORDER BY years_in_role DESC;
