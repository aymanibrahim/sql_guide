# SQL MIN and MAX
- MIN returns the smallest value in a column, while MAX returns the largest value

## 1. Show the earliest hire_date and the latest hire_date from employees.

```sql
SELECT 
	MIN(from_date) AS earliest_hire_date,
    MAX(from_date) AS latest_hire_date
FROM dept_emp;
```

| earliest_hire_date | latest_hire_date |
| :--- | :--- |
| 1985-01-01 | 2002-08-01 |

## 2. Show the minimum and maximum current salary per whole table (not per person).

```sql
SELECT
	MIN(salary) AS minimum_salary,
    MAX(salary) AS maximum_salary
FROM salaries;
```

| minimum_salary | maximum_salary |
| :--- | :--- |
| 38623 | 158220 |
