# SQL CASE
- acts as a logical conditional (like if-then-else) that returns a specific value when a condition is met.

## 1. Show employees with a derived column Seniority: 'Veteran' if hired before 1990, 'Experienced' if 1990–1999, 'New' otherwise.

```sql
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
```

| emp_no | first_name | last_name | Seniority |
| :--- | :--- | :--- | :--- |
| 10001 | Georgi | Facello | Veteran |
| 10002 | Bezalel | Simmel | Veteran |
| 10003 | Parto | Bamford | Veteran |
| ... | ... | ... | ... |
| 10011 | Mary | Sluis | Experienced |
| 10012 | Patricio | Bridgland | Experienced |
| ... | ... | ... | ... |

## 2. Show salaries with a band: < 50k = 'Low', 50–100k = 'Mid', > 100k = 'High'.

```sql
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
```

| emp_no | salary | band |
| :--- | :--- | :--- |
| 10001 | 88958 | Mid |
| 10002 | 72527 | Mid |
| 10003 | 43311 | Low |
| ... | ... | ... |
| 10019 | 50032 | Mid |
| 10020 | 47017 | Low |
| 10022 | 41348 | Low |
| ... | ... | ... |

## 3. For current employees, show a column 'PayVsAvg': 'Above Avg' if current salary > global current average salary, else 'At/Below Avg'.

```sql
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
```

| emp_no | salary | PayVsAvg |
| :--- | :--- | :--- |
| 10001 | 88958 | Above Avg |
| 10002 | 72527 | Above Avg |
| 10003 | 43311 | At/Below Avg |
| ... | ... | ... |
| 10010 | 80324 | Above Avg |
| 10012 | 54423 | At/Below Avg |
| 10013 | 68901 | At/Below Avg |
| ... | ... | ... |

## 4. For current titles, show a column 'RoleGroup' mapping 'Engineer'/'Senior Engineer' to 'Engineering', 'Staff'/'Senior Staff' to 'Staffing', 'Manager' to 'Leadership', else 'Other'.

```sql
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
```

| emp_no | title | RoleGroup |
| :--- | :--- | :--- |
| 10001 | Senior Engineer | Engineering |
| 10002 | Staff | Staffing |
| 10003 | Senior Engineer | Engineering |
| ... | ... | ... |
| 10041 | Senior Staff | Staffing |
| 10043 | Senior Engineer | Engineering |
| 10044 | Technique Leader | Other |
| ... | ... | ... |

## 5. For each department, show 'SizeClass': 'Small' (< 1000 current), 'Medium' (1000–5000), 'Large' (> 5000).

```sql
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
```

| Department_no | Size | SizeClass |
| :--- | :--- | :--- |
| d001 | 14842 | Large |
| d002 | 12437 | Large |
| d003 | 12898 | Large |
| d004 | 53304 | Large |
| d005 | 61386 | Large |
| d006 | 14546 | Large |
| d007 | 37701 | Large |
| d008 | 15441 | Large |
| d009 | 17569 | Large |
