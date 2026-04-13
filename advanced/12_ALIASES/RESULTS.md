# SQL ALIASES
- assigns temporary names  to tables or columns in a query to improve readability

## 1. Show employees’ emp_no as ID, first_name as First, and last_name as Last.

```sql
SELECT 
	emp_no AS ID, 
    first_name AS First,
    last_name AS Last
FROM employees;
```

| ID | First | Last |
| :--- | :--- | :--- |
| 10001 | Georgi | Facello |
| 10002 | Bezalel | Simmel |
| 10003 | Parto | Bamford |
| ... | ... | ... |

## 2. Show average current salary as AvgSalary for all employees.

```sql
SELECT AVG(salary) AS AvgSalary
FROM salaries
WHERE to_date = '9999-01-01';
```

| AvgSalary |
| :--- |
| 72012.2359 |

## 3. Join employees with departments and alias them as e and d, then show e.first_name, e.last_name, d.dept_name.

```sql
SELECT 
	e.first_name AS First, 
    e.last_name AS Last, 
    d.dept_name AS Department
FROM employees e
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments d
ON de.dept_no = d.dept_no;
```

| First | Last | Department |
| :--- | :--- | :--- |
| Mary | Sluis | Customer Service |
| Huan | Lortz | Customer Service |
| Basil | Tramer | Customer Service |
| ... | ... | ... |