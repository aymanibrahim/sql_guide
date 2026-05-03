# SQL HAVING
- filters the results of a query based on conditions applied to aggregate functions, acting like a WHERE clause for groups.

## 1. Show departments with more than 1000 current employees.

```sql
SELECT 
	dept_no,
    COUNT(emp_no) AS employees_count
FROM dept_emp
GROUP BY dept_no
HAVING COUNT(emp_no) > 1000;
```

| dept_no | employees_count |
| :--- | :--- |
| d001 | 20211 |
| d002 | 17346 |
| d003 | 17786 |
| d004 | 73485 |
| d005 | 85707 |
| d006 | 20117 |
| d007 | 52245 |
| d008 | 21126 |
| d009 | 23580 |

## 2. Show job titles where the average salary is greater than 80,000.

```sql
SELECT 
	t.title,
    AVG(s.salary) AS avg_salary
FROM titles t
JOIN salaries s
ON t.emp_no = s.emp_no
GROUP BY t.title
HAVING AVG(s.salary) > 80000
ORDER BY avg_salary;
```

| title | avg_salary |
| :--- | :--- |
| (null) | (null) |

## 3. Find all hire years where the count of employees hired is greater than 5000.

```sql
SELECT 
	YEAR(hire_date) AS hire_year,
    COUNT(emp_no) AS employees_count
FROM employees
GROUP BY YEAR(hire_date)
HAVING COUNT(emp_no) > 5000
ORDER BY employees_count DESC;
```

| hire_year | employees_count |
| :--- | :--- |
| 1986 | 36150 |
| 1985 | 35316 |
| 1987 | 33501 |
| 1988 | 31436 |
| 1989 | 28394 |
| 1990 | 25610 |
| 1991 | 22568 |
| 1992 | 20402 |
| 1993 | 17772 |
| 1994 | 14835 |
| 1995 | 12115 |
| 1996 | 9574 |
| 1997 | 6669 |
