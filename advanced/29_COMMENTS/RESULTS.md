# SQL COMMENTS
- annotations used to document code logic, temporarily disable statements during debugging, and make queries easier to read and maintain.

## 1. Write a query listing current employees and their departments, adding a header block comment explaining the join logic.

```sql
/*
Lists all current employees alongside their assigned department.
Join logic:
  - Start with the 'employees' table.
  - Use JOIN 'dept_emp' to map employees to their department IDs.
    The condition `de.to_date = '9999-01-01'` ensures that we only return the active assignment.
  - Use LEFT JOIN 'departments' to translate the department code (e.g., d001)
    into its human-readable name (e.g., 'Marketing').
=============================================================================
*/

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    d.dept_name
FROM employees e
JOIN dept_emp de 
ON e.emp_no = de.emp_no 
AND de.to_date = '9999-01-01'
LEFT JOIN departments d 
ON de.dept_no = d.dept_no;
```

| emp_no | first_name | last_name | dept_name |
| :--- | :--- | :--- | :--- |
| 10001 | Georgi | Facello | Development |
| 10002 | Bezalel | Simmel | Sales |
| 10003 | Parto | Bamford | Production |
| ... | ... | ... | ... |

## 2. Annotate an aggregate query with inline comments to explain each expression.

```sql
SELECT 
    de.dept_no,
    COUNT(de.emp_no) AS total_employees,       -- Counts total active employees
    AVG(s.salary) AS average_salary,           -- Calculates the average of current salaries
    MAX(s.salary) - MIN(s.salary) AS pay_gap   -- Calculates the difference between highest and lowest salaries
FROM salaries s
JOIN dept_emp de 
ON s.emp_no = de.emp_no
WHERE s.to_date = '9999-01-01'
AND de.to_date = '9999-01-01'
GROUP BY dept_no
ORDER BY pay_gap DESC;
```

| dept_no | total_employees | average_salary | pay_gap |
| :--- | :--- | :--- | :--- |
| d007 | 37701 | 88852.9695 | 118794 |
| d009 | 17569 | 67285.2302 | 105493 |
| d005 | 61386 | 67657.9196 | 105398 |
| d001 | 14842 | 80058.8488 | 105307 |
| d002 | 12437 | 78559.9370 | 103383 |
| d003 | 12898 | 63921.8998 | 103017 |
| d004 | 53304 | 67843.3020 | 99650 |
| d006 | 14546 | 65441.9934 | 93161 |
| d008 | 15441 | 67913.3750 | 91025 |

## 3. Comment out one of two WHERE conditions (to compare results) using ##.

```sql
SELECT 
    emp_no, 
    first_name, 
    last_name, 
    gender,
    hire_date
FROM employees
WHERE hire_date >= '1990-01-01'
--  AND gender = 'F' -- Commented out to compare the full workforce size against female-only employees
;
```

| emp_no | first_name | last_name | gender | hire_date |
| :--- | :--- | :--- | :--- | :--- |
| 10008 | Saniya | Kalloufi | M | 1994-09-15 |
| 10011 | Mary | Sluis | F | 1990-01-22 |
| 10012 | Patricio | Bridgland | M | 1992-12-18 |
| ... | ... | ... | ... | ... |

## 4. Use # to tag the date/author of the query.

```sql
# DATE: 2026-01-01
# AUTHOR: Ayman Ibrahim

SELECT 
    emp_no, 
    first_name, 
    last_name, 
    hire_date
FROM employees
WHERE hire_date > '1990-01-01';
```

| emp_no | first_name | last_name | hire_date |
| :--- | :--- | :--- | :--- |
| 10008 | Saniya | Kalloufi | 1994-09-15 |
| 10011 | Mary | Sluis | 1990-01-22 |
| 10012 | Patricio | Bridgland | 1992-12-18 |
| ... | ... | ... | ... |

## 5. Wrap a multi-line explanation using /* ... */ above a window function query.

```sql
/*
  Assigns a sequential row number to every employee within their specific department, 
  ordered chronologically by their start date.
  
  This allows the business to isolate organizational pioneers 
  (where ranking = 1) from later team additions 
*/

SELECT 
    de.dept_no,
    e.emp_no,
    e.first_name,
    e.last_name,
    de.from_date AS start_date,
    ROW_NUMBER() OVER (
        PARTITION BY de.dept_no 
        ORDER BY de.from_date 
    ) AS seniority_rank
FROM employees e
JOIN dept_emp de 
ON e.emp_no = de.emp_no
WHERE de.to_date = '9999-01-01';
```

| dept_no | emp_no | first_name | last_name | start_date | seniority_rank |
| :--- | :--- | :--- | :--- | :--- | :--- |
| d001 | 110022 | Margareta | Markovitch | 1985-01-01 | 1 |
| d001 | 430759 | Fumiko | Buchter | 1985-02-02 | 2 |
| d001 | 98351 | Florina | Setia | 1985-02-02 | 3 |
| ... | ... | ... | ... | ... | ... |

