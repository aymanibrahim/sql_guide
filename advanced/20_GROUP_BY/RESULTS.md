# SQL GROUP BY
- arranges identical data into groups, typically for use with aggregate functions like COUNT, SUM, or AVG.

## 1. Find the number of employees in each department (using dept_emp).

```sql
SELECT 
	dept_no,
    COUNT(emp_no) AS employees_count
FROM dept_emp
GROUP BY dept_no;
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

## 2. Show the average salary per job title.

```sql
SELECT 
	t.title,
    AVG(s.salary) AS avg_salary
FROM titles t
JOIN salaries s
ON t.emp_no = s.emp_no
GROUP BY t.title;
```

| title | avg_salary |
| :--- | :--- |
| Technique Leader | 59294.3742 |
| Assistant Engineer | 59304.9863 |
| Engineer | 59508.0397 |
| Senior Engineer | 60543.2191 |
| Manager | 66924.2706 |
| Staff | 69309.1023 |
| Senior Staff | 70470.8353 |

## 3. Find how many employees were hired each year (group by YEAR(hire_date)).

```sql
SELECT 
	YEAR(hire_date) AS hire_year,
    COUNT(emp_no) AS employees_count
FROM employees
GROUP BY YEAR(hire_date)
ORDER BY YEAR(hire_date);
```

| hire_year | employees_count |
| :--- | :--- |
| 1985 | 35316 |
| 1986 | 36150 |
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
| 1998 | 4155 |
| 1999 | 1514 |
| 2000 | 13 |
