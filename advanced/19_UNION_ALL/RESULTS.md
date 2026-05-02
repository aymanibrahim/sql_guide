# SQL UNION ALL
- combines the result sets of two or more queries into a single result set, including all duplicate rows.

## 1. Show all employee first_name values from the employees table and also again from the dept_manager table using UNION ALL (so duplicates remain).

```sql
SELECT first_name
FROM employees

UNION ALL

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

## 2. Combine two salary ranges: show employee IDs who ever earned < 40000 and employee IDs who ever earned > 100000 in one result set (with duplicates allowed).

```sql
SELECT emp_no
FROM salaries
WHERE salary < 40000

UNION ALL

SELECT emp_no
FROM salaries
WHERE salary > 100000;
```

| emp_no |
| :--- |
| 10022 |
| 10027 |
| 10037 |
| ... |
| 499986 |
| 499986 |
| 499988 |
