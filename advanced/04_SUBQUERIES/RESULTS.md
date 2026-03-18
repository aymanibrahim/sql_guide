# Subqueries
- A subquery is a nested SQL query inside a larger query (the outer query) 
- Subqueries are used to calculate a specific value or set of data required for the main operation.

## 1. Show employees whose current salary is above the overall current average salary.

```sql
SELECT 
    CONCAT(e.first_name, ' ', e.last_name) AS Employee,
    ROUND(s.salary, 2) AS Salary,
    ROUND(avg_table.overall_avg, 2) AS Overall_Average_Salary
FROM employees e
JOIN salaries s 
ON e.emp_no = s.emp_no
JOIN (
    SELECT AVG(salary) AS overall_avg 
    FROM salaries 
    WHERE to_date = '9999-01-01'
) AS avg_table
ON s.salary > avg_table.overall_avg
WHERE s.to_date = '9999-01-01';
```

| Employee | Salary | Overall_Average_Salary |
| :--- | :--- | :--- |
| Tokuyasu Pesch | 158220 | 72012.24 |
| Honesty Mukaidono | 156286 | 72012.24 |
| Xiahua Whitcomb | 155709 | 72012.24 |
| ... | ... | ... |

## 2. Show departments whose average current salary is above the global average current salary.

```sql
SELECT 
    d.dept_name AS Department,
    ROUND(AVG(s.salary), 2) AS Department_Average_Salary,
    ROUND(avg_table.overall_avg, 2) AS Overall_Average_Salary
FROM departments d
JOIN dept_emp de 
ON d.dept_no = de.dept_no
JOIN salaries s 
ON de.emp_no = s.emp_no
CROSS JOIN (
    SELECT 
		AVG(salary) AS overall_avg 
    FROM salaries 
    WHERE to_date = '9999-01-01'
) AS avg_table
WHERE s.to_date = '9999-01-01' 
  AND de.to_date = '9999-01-01'
GROUP BY d.dept_name, avg_table.overall_avg
HAVING AVG(s.salary) > avg_table.overall_avg
ORDER BY AVG(s.salary) DESC;
```

| Department | Department_Average_Salary | Overall_Average_Salary |
| :--- | :--- | :--- |
| Sales | 88852.97 | 72012.24 |
| Marketing | 80058.85 | 72012.24 |
| Finance | 78559.94 | 72012.24 |

## 3. Show titles whose count of current holders is above the average current title count.

```sql
SELECT 
    t.title AS Title,
    COUNT(t.emp_no) AS Title_Count,
    avg_table.avg_per_title AS Average_Title_Count
FROM titles t
CROSS JOIN (
    -- Calculate the average of (count per title)
    SELECT 
		ROUND(AVG(title_counts.overall_count), 0) AS avg_per_title
    FROM (
        SELECT COUNT(*) AS overall_count
        FROM titles
        WHERE to_date = '9999-01-01'
        GROUP BY title
    ) AS title_counts
) AS avg_table
WHERE t.to_date = '9999-01-01'
GROUP BY t.title, avg_table.avg_per_title
HAVING COUNT(t.emp_no) > avg_table.avg_per_title
ORDER BY Title_Count DESC;
```

| Title | Title_Count | Average_Title_Count |
| :--- | :--- | :--- |
| Senior Engineer | 85939 | 34303 |
| Senior Staff | 82024 | 34303|