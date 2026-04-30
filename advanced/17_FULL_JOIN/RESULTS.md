# SQL FULL JOIN (MySQL simulation using UNION)
- returns all records when there is a match in either the left or the right table, 
- filling in NULL values for the missing side whenever a match is not found.
- since MySQL doesn’t support FULL JOIN directly, you can use UNION of LEFT + RIGHT

## 1. Combine employees and departments to list all employees with their departments, but also include departments with no employees.

```sql
SELECT 
    e.first_name, 
    e.last_name, 
    d.dept_name
FROM employees e
LEFT JOIN dept_emp de 
ON e.emp_no = de.emp_no
LEFT JOIN departments d 
ON de.dept_no = d.dept_no

UNION

SELECT 
    e.first_name, 
    e.last_name, 
    d.dept_name
FROM employees e
RIGHT JOIN dept_emp de 
ON e.emp_no = de.emp_no
RIGHT JOIN departments d 
ON de.dept_no = d.dept_no;
```

| first_name | last_name | dept_name |
| :--- | :--- | :--- |
| Aamer | Anger | Customer Service |
| Aamer | Armand | Quality Management |
| Aamer | Azevdeo | Customer Service |
| ... | ... | ... |

## 2. Show all employees and managers, including those employees who are not managers and departments without managers.

```sql
SELECT 
    e.first_name, 
    e.last_name
FROM employees e
LEFT JOIN dept_manager dm 
ON e.emp_no = dm.emp_no

UNION

SELECT 
    e.first_name, 
    e.last_name
FROM employees e
RIGHT JOIN dept_manager dm 
ON e.emp_no = dm.emp_no;
```

| first_name | last_name |
| :--- | :--- |
| Aamer | Anger |
| Aamer | Armand |
| Aamer | Azevdeo |
| ... | ... |

## 3. Show all employees and their salary info, including employees without salary records and salary records without matching employees (test data case).

```sql
SELECT 
    se.emp_no, 
    se.first_name, 
    se.last_name, 
    s.salary
FROM scratch_employees se
LEFT JOIN salaries s 
ON se.emp_no = s.emp_no

UNION

SELECT 
    s.emp_no, 
    se.first_name, 
    se.last_name, 
    s.salary
FROM scratch_employees se
RIGHT JOIN salaries s 
ON se.emp_no = s.emp_no;
```

| emp_no | first_name | last_name | salary |
| :--- | :--- | :--- | :--- |
| 10001 | Georgi | Facello | 60117 |
| 10001 | Georgi | Facello | 62102 |
| 10001 | Georgi | Facello | 66074 |
| ... | ... | ... | ... |
| 499999 | (null) | (null) | 70745 |
| 499999 | (null) | (null) | 74327 |
| 499999 | (null) | (null) | 77303 |
| 9999901 | Alice | Testuser | (null) |
| 9999902 | Bob | Example | (null) |
| 9999903 | Charlie | Demo | (null) |
