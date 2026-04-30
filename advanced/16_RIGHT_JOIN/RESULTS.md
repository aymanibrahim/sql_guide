# SQL RIGHT JOIN
- returns all records from the right table and the matched records from the left table, 
- filling in NULL values for the left side where no match exists.

## 1. Show all departments and their employees, ensuring departments appear even if no employees are assigned.

```sql
SELECT 
	d.dept_name,
    e.first_name,
    e.last_name    
FROM employees e
RIGHT JOIN dept_emp de
ON e.emp_no = de.emp_no
RIGHT JOIN departments d
ON de.dept_no = d.dept_no;
```

| dept_name | first_name | last_name |
| :--- | :--- | :--- |
| Customer Service | Mary | Sluis |
| Customer Service | Huan | Lortz |
| Customer Service | Basil | Tramer |
| ... | ... | ... |
## 2. Show all departments and their managers (even if no manager is assigned).

```sql
SELECT
	d.dept_name,
    e.first_name,
    e.last_name
FROM employees e
RIGHT JOIN dept_manager dm
ON e.emp_no = dm.emp_no
RIGHT JOIN departments d
ON dm.dept_no = d.dept_no
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

## 3. Show all titles and the employees holding them, but ensure all titles appear.

```sql
SELECT
	t.title,
    e.first_name,
    e.last_name
FROM employees e
RIGHT JOIN titles t
ON e.emp_no = t.emp_no
WHERE t.to_date = '9999-01-01';
```

| title | first_name | last_name |
| :--- | :--- | :--- |
| Senior Engineer | Georgi | Facello |
| Staff | Bezalel | Simmel |
| Senior Engineer | Parto | Bamford |
| ... | ... | ... |
