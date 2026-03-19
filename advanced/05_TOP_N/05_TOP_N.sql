



-- ORDER BY + LIMIT (Top-N patterns)

USE employees;

-- 1. Show the top 5 departments by headcount growth between 1995 and 2000.
-- Hint: count employees who had a dept_emp row active in 1995 vs. 2000 (treat overlap carefully), 
-- then compute difference.

SELECT 
    d.dept_name AS Department,
    COUNT(CASE 
			WHEN '1995-01-01' BETWEEN de.from_date AND de.to_date THEN 1 
            END) AS headcount_1995,
    COUNT(CASE 
			WHEN '2000-01-01' BETWEEN de.from_date AND de.to_date THEN 1 
            END) AS headcount_2000,
    (COUNT(CASE 
			WHEN '2000-01-01' BETWEEN de.from_date AND de.to_date THEN 1 
            END) - 
     COUNT(CASE 
			WHEN '1995-01-01' BETWEEN de.from_date AND de.to_date THEN 1 
            END)) AS headcount_growth
FROM departments d
JOIN dept_emp de 
ON d.dept_no = de.dept_no
GROUP BY d.dept_name
ORDER BY headcount_growth DESC
LIMIT 5;

-- 2. Show the top 10 employees with the largest salary increase between their earliest and latest recorded salaries.
-- Hint: per emp_no, compare MIN(salary) vs MAX(salary) in salaries.

SELECT 
    CONCAT(e.first_name, ' ', e.last_name) AS Employee,
    s_start.salary AS earliest_salary,
    s_end.salary AS latest_salary,
    (s_end.salary - s_start.salary) AS salary_increase
FROM employees e
-- Join to get the EARLIEST salary based on the minimum date
JOIN salaries s_start ON e.emp_no = s_start.emp_no
    AND s_start.from_date = (
        SELECT MIN(from_date) 
        FROM salaries 
        WHERE emp_no = e.emp_no
    )
-- Join to get the LATEST salary based on the maximum date
JOIN salaries s_end ON e.emp_no = s_end.emp_no
    AND s_end.from_date = (
        SELECT MAX(from_date) 
        FROM salaries 
        WHERE emp_no = e.emp_no
    )
ORDER BY salary_increase DESC
LIMIT 10;

# Employee	earliest_salary	latest_salary	salary_increase
Fumino Frijda	42514	96389	53875
Nimmagadda Crouzet	51734	105159	53425
Ishfaq Iisaku	53533	106794	53261
Khosrow Sgarro	91420	144434	53014
Gregory Makinen	50339	103166	52827
Lucian Werthner	71011	123732	52721
Zsolt McAffer	76953	129468	52515
Rasiah Yemenis	73635	125959	52324
Akemi Warwick	93082	145128	52046
Magy Aamodt	40000	91762	51762
