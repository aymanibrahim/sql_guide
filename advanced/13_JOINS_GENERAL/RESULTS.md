# SQL JOINS General
- combine rows from two or more tables based on a related column between them.

## 1. Show each employee with the department number from dept_emp (basic join).

```sql
SELECT
	e.first_name,
    e.last_name,
    de.dept_no
FROM employees e
JOIN dept_emp de
ON e.emp_no = de.emp_no;
```

| first_name | last_name | dept_no |
| :--- | :--- | :--- |
| Georgi | Facello | d005 |
| Bezalel | Simmel | d007 |
| Parto | Bamford | d004 |
| ... | ... | ... |

## 2. Show each department and the employees assigned to it.

```sql
SELECT
	d.dept_name,
	e.first_name,
    e.last_name
FROM employees e
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments d
ON d.dept_no = de.dept_no;
```

| dept_name | first_name | last_name |
| :--- | :--- | :--- |
| Customer Service | Mary | Sluis |
| Customer Service | Huan | Lortz |
| Customer Service | Basil | Tramer |
| ... | ... | ... |

## 3. Show employees with their titles.

```sql
SELECT
	e.first_name,
    e.last_name,
    t.title
FROM employees e
JOIN titles t
ON e.emp_no = t.emp_no;
```

| first_name | last_name | title |
| :--- | :--- | :--- |
| Georgi | Facello | Senior Engineer |
| Bezalel | Simmel | Staff |
| Parto | Bamford | Senior Engineer |
| ... | ... | ... |
