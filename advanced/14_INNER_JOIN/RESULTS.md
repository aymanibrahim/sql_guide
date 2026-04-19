# SQL INNER JOIN
- returns only the rows where there is a matching value in both tables.

## 1. Show employees with their current department names.

```sql
SELECT	
	e.first_name,
    e.last_name,
    d.dept_name
FROM employees e
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments d
ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01';
```

| first_name | last_name | dept_name |
| :--- | :--- | :--- |
| Huan | Lortz | Customer Service |
| Basil | Tramer | Customer Service |
| Breannda | Billingsley | Customer Service |
| ... | ... | ... |

## 2. List current managers with their department names.

```sql
SELECT	
	e.first_name,
    e.last_name,
    d.dept_name
FROM employees e
JOIN dept_manager dm
ON e.emp_no = dm.emp_no
JOIN departments d
ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01';
```

| first_name | last_name | dept_name |
| :--- | :--- | :--- |
| Vishwani | Minakawa | Marketing |
| Isamu | Legleitner | Finance |
| Karsten | Sigstam | Human Resources |
| Oscar | Ghazalie | Production |
| Leon | DasSarma | Development |
| Dung | Pesch | Quality Management |
| Hauke | Zhang | Sales |
| Hilary | Kambil | Research |
| Yuchang | Weedman | Customer Service |

## 3. Show all employees who currently have the title 'Engineer'.

```sql
SELECT
	e.first_name,
    e.last_name,
    t.title
FROM employees e
JOIN titles t
ON e.emp_no = t.emp_no
WHERE t.to_date = '9999-01-01' AND title LIKE 'Engineer';
```

| first_name | last_name | title |
| :--- | :--- | :--- |
| Duangkaew | Piveteau | Engineer |
| Berni | Genin | Engineer |
| Mayuko | Warwick | Engineer |
| ... | ... | ... |
