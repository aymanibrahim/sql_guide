# SQL WINDOW FUNCTIONS
- perform calculations across a set of table rows related to the current row without grouping them into a single output row.

## 1. For current salaries, show each employee’s salary and the department average as dept_avg using AVG() OVER (PARTITION BY dept_no).

```sql
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
```

| emp_no | dept_no | salary | dept_avg |
| :--- | :--- | :--- | :--- |
| 10001 | d005 | 88958 | 67657.92 |
| 10002 | d007 | 72527 | 88852.97 |
| 10003 | d004 | 43311 | 67843.30 |
| 10004 | d004 | 74057 | 67843.30 |
| 10005 | d003 | 94692 | 63921.90 |
| 10006 | d005 | 59755 | 67657.92 |
| 10007 | d008 | 88070 | 67913.38 |
| 10009 | d006 | 94409 | 65441.99 |
| 10010 | d006 | 80324 | 65441.99 |
| ... | ... | ... | ... |

## 2. Rank the top current salaries per department using DENSE_RANK() OVER (PARTITION BY dept_no ORDER BY salary DESC), then filter to rank ≤ 3.

```sql
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
```

| dept_no | salary | salary_rank |
| :--- | :--- | :--- |
| d001 | 145128 | 1 |
| d001 | 143644 | 2 |
| d001 | 142506 | 3 |
| d002 | 142395 | 1 |
| d002 | 140742 | 2 |
| d002 | 138775 | 3 |
| d003 | 141953 | 1 |
| d003 | 128308 | 2 |
| d003 | 125263 | 3 |
| d004 | 138273 | 1 |
| d004 | 137563 | 2 |
| d004 | 132552 | 3 |
| d005 | 144434 | 1 |
| d005 | 140784 | 2 |
| d005 | 136130 | 3 |
| d006 | 132103 | 1 |
| d006 | 123225 | 2 |
| d006 | 122965 | 3 |
| d007 | 158220 | 1 |
| d007 | 156286 | 2 |
| d007 | 155709 | 3 |
| d008 | 130211 | 1 |
| d008 | 127240 | 2 |
| d008 | 124356 | 3 |
| d009 | 144866 | 1 |
| d009 | 143950 | 2 |
| d009 | 143937 | 3 |

## 3. Show each employee’s tenure in days and the running total of hires by hire_date using COUNT(*) OVER (ORDER BY hire_date).

```sql
SELECT 
    emp_no,
    hire_date,
    CURRENT_DATE - hire_date AS tenure_in_days, 
    COUNT(*) OVER(ORDER BY hire_date) AS running_total_hires
FROM employees
ORDER BY hire_date;
```

| emp_no | hire_date | tenure_in_days | running_total_hires |
| :--- | :--- | :--- | :--- |
| 110022 | 1985-01-01 | 410418 | 9 |
| 110085 | 1985-01-01 | 410418 | 9 |
| 110183 | 1985-01-01 | 410418 | 9 |
| 110303 | 1985-01-01 | 410418 | 9 |
| 110511 | 1985-01-01 | 410418 | 9 |
| 110725 | 1985-01-01 | 410418 | 9 |
| 111035 | 1985-01-01 | 410418 | 9 |
| 111400 | 1985-01-01 | 410418 | 9 |
| 111692 | 1985-01-01 | 410418 | 9 |
| 110114 | 1985-01-14 | 410405 | 10 |
| 102004 | 1985-02-01 | 410318 | 25 |
| ... | ... | ... | ... |

## 4. For each department, show the most recent hire using ROW_NUMBER() OVER (PARTITION BY dept_no ORDER BY hire_date DESC) = 1.

```sql
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
```

| dept_no | emp_no | hire_date |
| :--- | :--- | :--- |
| d001 | 226633 | 2000-01-04 |
| d002 | 205048 | 2000-01-06 |
| d003 | 222965 | 2000-01-13 |
| d004 | 428377 | 2000-01-23 |
| d005 | 499553 | 2000-01-22 |
| d006 | 69036 | 1999-12-02 |
| d007 | 13246 | 1999-12-31 |
| d008 | 247746 | 1999-12-10 |
| d009 | 73925 | 1999-12-30 |

## 5. Compute salary growth per employee: MAX(salary) - MIN(salary) and also the percentile of their current salary within their department using PERCENT_RANK() or CUME_DIST() over dept partition.

```sql
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
```

| emp_no | dept_no | current_salary | salary_growth | dept_salary_percentile |
| :--- | :--- | :--- | :--- | :--- |
| 65337 | d001 | 39821 | 396 | 0 |
| 107931 | d001 | 39871 | 498 | 0.01 |
| 290305 | d001 | 39926 | 439 | 0.01 |
| 266476 | d001 | 40434 | 1027 | 0.02 |
| 15715 | d001 | 40817 | 1266 | 0.03 |
| 469688 | d001 | 40988 | 1316 | 0.03 |
| 476136 | d001 | 41039 | 1453 | 0.04 |
| 295740 | d001 | 41400 | 1614 | 0.05 |
| 289899 | d001 | 41507 | 1507 | 0.05 |
| 474856 | d001 | 41615 | 1874 | 0.06 |
| 404128 | d001 | 41658 | 1658 | 0.07 |
| 103596 | d001 | 41705 | 1974 | 0.07 |
| 229573 | d001 | 41745 | 1927 | 0.08 |
| 401044 | d001 | 41945 | 1945 | 0.09 |
| 233068 | d001 | 41960 | 2211 | 0.09 |
| 472527 | d001 | 41986 | 1986 | 0.1 |
| ... | ... | ... | ... | ... |

## 6. Show per-title current average salary and add a column with the overall average salary using AVG() OVER (), then show the difference.

```sql
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
```

| title | title_avg_salary | global_avg_salary | difference_from_global |
| :--- | :--- | :--- | :--- |
| Senior Staff | 80706 | 68716 | 11990 |
| Manager | 77724 | 68716 | 9008 |
| Senior Engineer | 70823 | 68716 | 2107 |
| Technique Leader | 67507 | 68716 | -1209 |
| Staff | 67331 | 68716 | -1385 |
| Engineer | 59603 | 68716 | -9113 |
| Assistant Engineer | 57318 | 68716 | -11398 |
