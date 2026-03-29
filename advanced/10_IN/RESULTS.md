# SQL IN
- specify multiple values in a WHERE clause

## 1. Show employees whose first_name is in the set ('Georgi', 'Parto', 'Bezalel').

```sql
SELECT first_name
FROM employees
WHERE first_name IN ('Georgi', 'Parto', 'Bezalel');
```

| first_name |
| :--- |
| Georgi |
| Bezalel |
| Parto |
| ... |
| Parto |
| Georgi |
| Bezalel |

## 2. Find departments whose dept_name is in ('Sales', 'Marketing', 'Finance').

```sql
SELECT dept_name
FROM departments
WHERE dept_name IN ('Sales', 'Marketing', 'Finance');
```

| dept_name |
| :--- |
| Finance |
| Marketing |
| Sales |

## 3. Show titles where title is in ('Engineer', 'Senior Engineer', 'Manager').

```sql
SELECT title
FROM titles
WHERE title IN ('Engineer', 'Senior Engineer', 'Manager');
```

| title |
| :--- |
| Senior Engineer |
| Senior Engineer |
| Engineer |
| ... |
