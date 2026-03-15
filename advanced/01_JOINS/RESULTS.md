# SQL Joins Basics
- Joins combine rows from two or more tables based on a related column between them.

## 1. Show each employee with their current department name.
- Hint: dept_emp.to_date = '9999-01-01', join with departments.

```sql
SElECT 
	CONCAT(e.first_name,' ',e.last_name) AS Employee,
	d.dept_name AS Department
FROM employees e
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments d
ON de.dept_no = d.dept_no
WHERE de.to_date = '9999-01-01';
```

| Employee | Department |
| :--- | :--- |
| Georgi Facello | Development |
| Bezalel Simmel | Sales |
| Parto Bamford | Production |
|  ...   |  ...  |

## 2. Show each current manager (employee name) and the department they manage.
- Hint: dept_manager.to_date = '9999-01-01', join employees, departments.

```sql
SELECT 
	CONCAT(e.first_name,' ',e.last_name) AS Manager,
	d.dept_name AS Department
FROM employees e
JOIN dept_manager dm
ON dm.emp_no = e.emp_no
JOIN departments d
ON dm.dept_no = d.dept_no
WHERE dm.to_date = '9999-01-01';
```

| Manager | Department |
| :--- | :--- |
| Vishwani Minakawa | Marketing |
| Isamu Legleitner | Finance |
| Karsten Sigstam | Human Resources |
| Oscar Ghazalie | Production |
| Leon DasSarma | Development |
| Dung Pesch | Quality Management |
| Hauke Zhang | Sales |
| Hilary Kambil | Research |
| Yuchang Weedman | Customer Service |

## 3. Show each employee and their current title.
- Hint: titles.to_date = '9999-01-01'.

```sql
SElECT 
	CONCAT(e.first_name,' ',e.last_name) AS Employee,
	t.title AS Title
FROM employees e
JOIN titles t
ON e.emp_no = t.emp_no
WHERE t.to_date = '9999-01-01';
```

| Employee | Title |
| :--- | :--- |
| Georgi Facello | Senior Engineer |
| Bezalel Simmel | Staff |
| Parto Bamford | Senior Engineer |
|  ...   |  ...  |