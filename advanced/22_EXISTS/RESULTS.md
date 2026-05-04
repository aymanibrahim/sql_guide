# SQL EXISTS
- evaluates to TRUE if the subquery returns at least one row, and FALSE otherwise.

## 1. List employees who currently belong to any department (use EXISTS with dept_emp).

```sql
SELECT 
    e.emp_no, 
    e.first_name, 
    e.last_name
FROM 
    employees e
WHERE EXISTS (
    SELECT 1
    FROM dept_emp de 
    WHERE de.emp_no = e.emp_no 
    AND de.to_date = '9999-01-01'
);
```

| emp_no | first_name | last_name |
| :--- | :--- | :--- |
| 10001 | Georgi | Facello |
| 10002 | Bezalel | Simmel |
| 10003 | Parto | Bamford |
| 10004 | Chirstian | Koblick |
| 10005 | Kyoichi | Maliniak |
| 10006 | Anneke | Preusig |
| 10007 | Tzvetan | Zielinski |
| 10009 | Sumant | Peac |
| 10010 | Duangkaew | Piveteau |
| 10012 | Patricio | Bridgland |
| ... | ... | ... |


## 2. List employees who are not currently assigned to a department (use NOT EXISTS).

```sql
SELECT 
    e.emp_no, 
    e.first_name, 
    e.last_name
FROM 
    employees e
WHERE NOT EXISTS (
    SELECT 1 
    FROM dept_emp de 
    WHERE de.emp_no = e.emp_no 
    AND de.to_date = '9999-01-01'
);
```

| emp_no | first_name | last_name |
| :--- | :--- | :--- |
| 10008 | Saniya | Kalloufi |
| 10011 | Mary | Sluis |
| 10015 | Guoxiang | Nooteboom |
| ... | ... | ... |

## 3. Show departments that currently have at least one manager (use dept_manager and EXISTS).

```sql
SELECT 
    d.dept_name 
FROM 
    departments d
WHERE EXISTS (
    SELECT 1 
    FROM dept_manager dm
    WHERE dm.dept_no = d.dept_no 
    AND dm.to_date = '9999-01-01'
);
```

| dept_name |
| :--- |
| Customer Service |
| Development |
| Finance |
| Human Resources |
| Marketing |
| Production |
| Quality Management |
| Research |
| Sales |

## 4. Show employees who currently hold the title 'Senior Engineer' and currently earn > 90,000 (two EXISTS subqueries).

```sql
SELECT 
    e.emp_no, 
    e.first_name, 
    e.last_name
FROM 
    employees e
WHERE EXISTS (
    SELECT 1 
    FROM titles t
    WHERE t.emp_no = e.emp_no 
    AND t.title = 'Senior Engineer'
    AND t.to_date = '9999-01-01'
)
AND EXISTS (
    SELECT 1 
    FROM salaries s
    WHERE s.emp_no = e.emp_no 
    AND s.salary > 90000
    AND s.to_date = '9999-01-01'
);
```

| emp_no | first_name | last_name |
| :--- | :--- | :--- |
| 10009 | Sumant | Peac |
| 10066 | Kwee | Schusler |
| 10084 | Tuval | Kalloufi |
| ... | ... | ... |

## 5. Show employees for whom a salary change occurred on the same date as a title change (use EXISTS to test a matching from_date).

```sql
SELECT 
    e.emp_no, 
    e.first_name, 
    e.last_name
FROM employees e
WHERE EXISTS (
    SELECT 1 
    FROM titles t
	JOIN salaries s 
    ON t.emp_no = s.emp_no
    WHERE t.emp_no = e.emp_no 
    AND t.from_date = s.from_date
);
```

| emp_no | first_name | last_name |
| :--- | :--- | :--- |
| 10001 | Georgi | Facello |
| 10002 | Bezalel | Simmel |
| 10003 | Parto | Bamford |
| ... | ... | ... |

## 6. Show employees who never had a salary < 40,000 (use NOT EXISTS on salaries).

```sql
SELECT 
    e.emp_no, 
    e.first_name, 
    e.last_name
FROM 
    employees e
WHERE NOT EXISTS (
    SELECT 1 
    FROM salaries s
    WHERE s.emp_no = e.emp_no 
    AND s.salary < 40000    
);
```

| emp_no | first_name | last_name |
| :--- | :--- | :--- |
| 10001 | Georgi | Facello |
| 10002 | Bezalel | Simmel |
| 10003 | Parto | Bamford |
| ... | ... | ... |
