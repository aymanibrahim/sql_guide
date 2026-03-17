# Filtering Logic (AND / OR / NOT)
- combines or exclude specific conditions to include or omit rows.

## 1. List all current employees in departments whose name contains 'Engineering' and whose current salary is between 80,000 and 100,000 inclusive.

```sql
SELECT
	CONCAT(e.first_name, ' ', e.last_name) AS Employee,
    d.dept_name AS Department,
    s.salary AS Salary
FROM employees e
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments d
ON de.dept_no = d.dept_no
JOIN salaries s
ON s.emp_no = e.emp_no
WHERE de.to_date = '9999-01-01'
AND s.to_date = '9999-01-01'
AND d.dept_name LIKE '%Engineering%'
AND s.salary BETWEEN 80000 AND 100000;
```

| Employee | Department | Salary |
| :--- | :--- | :--- |
| (null)| (null) | (null) |


## 2. Show all current employees who are not in any department with 'Sales' in the name.

```sql
SELECT
	CONCAT(e.first_name, ' ', e.last_name) AS Employee,
    d.dept_name AS Department
FROM employees e
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments d
ON de.dept_no = d.dept_no
WHERE de.to_date = '9999-01-01'
AND NOT d.dept_name LIKE '%Sales%';
```

| Employee | Department |
| :--- | :--- |
| Huan Lortz | Customer Service |
| Basil Tramer | Customer Service |
| Breannda Billingsley | Customer Service |
| ... | ... |