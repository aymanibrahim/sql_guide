# SQL COUNT
- returns the total number of rows that match a specific criteria

## 1. Count how many employees were hired in the year 1990.

```sql
SELECT COUNT(*) AS hired_in_1990_num
FROM dept_emp
WHERE from_date BETWEEN '1990-01-01' AND '1990-12-31';
```

| hired_in_1990_num |
| :--- |
| 21039 |

## 2. Count how many employees currently hold the title 'Senior Engineer' (to_date = '9999-01-01').

```sql
SELECT COUNT(*) AS senior_engineer_num
FROM titles
WHERE title = 'Senior Engineer' AND to_date = '9999-01-01';
```

| senior_engineer_num |
| :--- |
| 85939 |
