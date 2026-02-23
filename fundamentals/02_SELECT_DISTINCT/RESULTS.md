# SQL SELECT DISTINCT Results

- `DISTINCT` keyword is used to return only unique (different) values. 
- see the "categories" available without duplicates.

## 1. List the distinct title values from titles.
```sql
SELECT DISTINCT title 
FROM titles;
```

| title |
| : |
| Senior Engineer |
| Staff |
| Engineer |
| Senior Staff |
| Assistant Engineer |
| Technique Leader |
| Manager |

## 2. List distinct gender values from employees

```sql
SELECT DISTINCT gender 
FROM employees;
```

| gender |
| : |
| M |
| F |



## 3. List distinct department names (dept_name) from departments.

```sql
SELECT DISTINCT dept_name 
FROM departments;
```

| dept_name |
| : |
| Customer Service |
| Development |
| Finance |
| Human Resources |
| IT |
| Marketing |
| Production |
| Quality Management |
| Research |
| Sales |