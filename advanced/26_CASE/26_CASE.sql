-- SQL CASE

USE employees;

-- 1. Show employees with a derived column Seniority: 'Veteran' if hired before 1990, 'Experienced' if 1990–1999, 'New' otherwise.

SELECT 
	emp_no,
    first_name,
    last_name,
    CASE
		WHEN YEAR(hire_date) < 1990 THEN 'Veteran'
        WHEN YEAR(hire_date) BETWEEN 1990 AND 1999 THEN 'Experienced'
        ELSE 'New'
    END AS Seniority
FROM employees;

-- 2. Show salaries with a band: < 50k = 'Low', 50–100k = 'Mid', > 100k = 'High'.

SELECT 
	emp_no,
    salary,
    CASE
		WHEN salary < 50000 THEN 'Low'
        WHEN salary BETWEEN 50000 AND 100000 THEN 'Mid'
        ELSE 'High'
    END AS band
FROM salaries
WHERE to_date = '9999-01-01';

-- 3. For current employees, show a column 'PayVsAvg': 'Above Avg' if current salary > global current average salary, else 'At/Below Avg'.

SELECT
	emp_no,
    salary,
    CASE
		WHEN salary > (SELECT AVG(salary)
					   FROM salaries
                       WHERE to_date = '9999-01-01') 
        THEN 'Above Avg'
        ELSE 'At/Below Avg'
    END AS PayVsAvg
FROM salaries
WHERE to_date = '9999-01-01';

-- 4. For current titles, show a column 'RoleGroup' mapping 'Engineer'/'Senior Engineer' to 'Engineering', 'Staff'/'Senior Staff' to 'Staffing', 'Manager' to 'Leadership', else 'Other'.

SELECT
	emp_no,
    title,
    CASE
		WHEN title LIKE '%Engineer%' THEN 'Engineering'
        WHEN title LIKE '%Staff%' THEN 'Staffing'
        WHEN title LIKE '%Manager%' THEN 'Leadership'
        ELSE 'Other'
    END AS RoleGroup
FROM titles
WHERE to_date = '9999-01-01';

-- 5. For each department, show 'SizeClass': 'Small' (< 1000 current), 'Medium' (1000–5000), 'Large' (> 5000).

SELECT 
	dept_no AS Department_no,
    COUNT(emp_no) AS Size,
    CASE
		WHEN COUNT(emp_no) < 1000 THEN 'Small'
        WHEN COUNT(emp_no) BETWEEN 1000 AND 5000 THEN 'Medium'
        ELSE 'Large'
    END AS SizeClass
FROM dept_emp
WHERE to_date = '9999-01-01'
GROUP BY dept_no;