# SQL AVG
- calculates the arithmetic mean of a numeric column by dividing the sum of values by the total count of rows.

## 1. Compute the average current salary (to_date = '9999-01-01').

```sql
SELECT AVG(salary) AS avg_salary
FROM salaries
WHERE to_date = '9999-01-01';
```

| avg_salary |
| :--- |
| 72012.2359 |

## 2. Compute the average salary per title (using all history in titles joined to salaries).

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
| Senior Engineer | 60543.2191 |
| Staff | 69309.1023 |
| Engineer | 59508.0397 |
| Senior Staff | 70470.8353 |
| Assistant Engineer | 59304.9863 |
| Technique Leader | 59294.3742 |
| Manager | 66924.2706 |
