# SQL UNION
- 

## 1. Write a query to show a combined list of all department names from the departments table and all distinct job titles from the titles table.

```sql
SELECT dept_name AS combined_list
FROM departments

UNION

SELECT DISTINCT title
FROM titles;
```

| combined_list |
| :--- |
| Customer Service |
| Development |
| Finance |
| Human Resources |
| Marketing |
| Production |
| Quality Management |
| Research |
| Sales |
| Senior Engineer |
| Staff |
| Engineer |
| Senior Staff |
| Assistant Engineer |
| Technique Leader |
| Manager |

## 2. List all employee first_name values that are either in employees table or in dept_manager (as employees).

```sql
SELECT first_name
FROM employees

UNION

SELECT e.first_name
FROM employees e
JOIN dept_manager dm 
ON e.emp_no = dm.emp_no;
```

| first_name |
| :--- |
| Georgi |
| Bezalel |
| Parto |
| ... |
