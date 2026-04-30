# SQL LEFT JOIN
- returns all records from the left table and the matched records from the right table, 
- filling in NULL values for the right side where no match exists.

## 1. Show all employees and their department names 
- (include employees who might not be currently assigned to a department).

```sql
SELECT 
	e.first_name,
    e.last_name,
    d.dept_name
FROM employees e
LEFT JOIN dept_emp de
ON e.emp_no = de.emp_no
LEFT JOIN departments d
ON de.dept_no = d.dept_no;
```

| first_name | last_name | dept_name |
| :--- | :--- | :--- |
| Georgi | Facello | Development |
| Bezalel | Simmel | Sales |
| Parto | Bamford | Production |
| ... | ... | ... |

## 2. Show all departments and their managers, 
- but include departments even if they don’t have a current manager.

```sql
SELECT
	d.dept_name,
    e.first_name,
    e.last_name
FROM departments d
LEFT JOIN dept_manager dm
ON dm.dept_no = d.dept_no
LEFT JOIN employees e
ON e.emp_no = dm.emp_no
WHERE dm.to_date = '9999-01-01';
```

| dept_name | first_name | last_name |
| :--- | :--- | :--- |
| Marketing | Vishwani | Minakawa |
| Finance | Isamu | Legleitner |
| Human Resources | Karsten | Sigstam |
| Production | Oscar | Ghazalie |
| Development | Leon | DasSarma |
| Quality Management | Dung | Pesch |
| Sales | Hauke | Zhang |
| Research | Hilary | Kambil |
| Customer Service | Yuchang | Weedman |

## 3. Show all employees and their salaries, including employees without a salary record.

```sql
SELECT 
	e.first_name,
    e.last_name,
    s.salary
FROM employees e
LEFT JOIN salaries s
ON e.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01';
```

| first_name | last_name | salary |
| :--- | :--- | :--- |
| Georgi | Facello | 88958 |
| Bezalel | Simmel | 72527 |
| Parto | Bamford | 43311 |
| ... | ... | ... |
...