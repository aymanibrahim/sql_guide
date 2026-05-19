-- SQL WINDOW FUNCTIONS

USE employees;

-- 1. For current salaries, show each employee’s salary and the department average as dept_avg using AVG() OVER (PARTITION BY dept_no).

SELECT 
    de.emp_no,
    de.dept_no,
    s.salary,
    ROUND(AVG(s.salary) OVER(PARTITION BY de.dept_no), 2) AS dept_avg
FROM dept_emp de
JOIN salaries s 
ON de.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01'  
AND de.to_date = '9999-01-01'
ORDER BY de.emp_no;

-- 2. Rank the top current salaries per department using DENSE_RANK() OVER (PARTITION BY dept_no ORDER BY salary DESC), then filter to rank ≤ 3.

WITH RankedSalaries AS (
    SELECT 
        de.dept_no,
        s.salary,
        DENSE_RANK() OVER(PARTITION BY de.dept_no ORDER BY s.salary DESC) AS salary_rank
    FROM dept_emp de
    JOIN salaries s 
    ON de.emp_no = s.emp_no
    WHERE s.to_date = '9999-01-01'
    AND de.to_date = '9999-01-01'
)
SELECT 
    dept_no, 
    salary, 
    salary_rank
FROM RankedSalaries
WHERE salary_rank <= 3;

-- 3. Show each employee’s tenure in days and the running total of hires by hire_date using COUNT(*) OVER (ORDER BY hire_date).

SELECT 
    emp_no,
    hire_date,
    CURRENT_DATE - hire_date AS tenure_in_days, 
    COUNT(*) OVER(ORDER BY hire_date) AS running_total_hires
FROM employees
ORDER BY hire_date;

-- 4. For each department, show the most recent hire using ROW_NUMBER() OVER (PARTITION BY dept_no ORDER BY hire_date DESC) = 1.

WITH LatestHires AS (
    SELECT 
        de.dept_no,
        de.emp_no,
        e.hire_date,
        ROW_NUMBER() OVER(PARTITION BY de.dept_no ORDER BY e.hire_date DESC) AS row_num
    FROM dept_emp de
    JOIN employees e 
    ON de.emp_no = e.emp_no
    WHERE de.to_date = '9999-01-01'
)
SELECT 
	dept_no, 
    emp_no, 
    hire_date
FROM LatestHires
WHERE row_num = 1;

-- 5. Compute salary growth per employee: MAX(salary) - MIN(salary) and also the percentile of their current salary within their department using PERCENT_RANK() or CUME_DIST() over dept partition.

WITH SalaryGrowth AS (
    SELECT 
        emp_no,
        MAX(salary) - MIN(salary) AS salary_growth
    FROM salaries
    GROUP BY emp_no
),
CurrentPercentile AS (
    SELECT 
        de.emp_no,
        de.dept_no,
        s.salary,
        PERCENT_RANK() OVER(PARTITION BY de.dept_no ORDER BY s.salary) AS salary_percentile
    FROM dept_emp de
    JOIN salaries s 
    ON de.emp_no = s.emp_no
    WHERE s.to_date = '9999-01-01'
    AND de.to_date = '9999-01-01'
)
SELECT 
    cp.emp_no,
    cp.dept_no,
    cp.salary AS current_salary,
    sg.salary_growth,
    ROUND(cp.salary_percentile * 100, 2) AS dept_salary_percentile
FROM CurrentPercentile cp
JOIN SalaryGrowth sg 
ON cp.emp_no = sg.emp_no
ORDER BY cp.dept_no, current_salary;

-- 6. Show per-title current average salary and add a column with the overall average salary using AVG() OVER (), then show the difference.

WITH TitleAverages AS (
    SELECT 
        t.title,
		ROUND(AVG(s.salary), 0) AS title_avg_salary
    FROM titles t
    JOIN salaries s 
    ON t.emp_no = s.emp_no
    WHERE t.to_date = '9999-01-01'
    AND s.to_date = '9999-01-01'
    GROUP BY t.title
)
SELECT 
    title,
    title_avg_salary,
    ROUND(AVG(title_avg_salary) OVER(), 0) AS global_avg_salary,
    ROUND(title_avg_salary - AVG(title_avg_salary) OVER(), 0) AS difference_from_global
FROM TitleAverages
ORDER BY title_avg_salary DESC;