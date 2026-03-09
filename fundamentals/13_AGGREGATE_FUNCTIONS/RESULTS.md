# SQL Aggregate Functions
- perform a calculation on a set of values and return a single value.

## 1. Count how many rows are in employees.

```sql
SELECT COUNT(*) AS rows_num
FROM employees;
```

| rows_num |
| :--- |
| 300024 |

## 2. Find the minimum, maximum, and average salary across all salaries.

```sql
SELECT 
	MAX(salary) AS max_salary,
    MIN(salary) AS min_salary,
    AVG(salary) AS avg_salary
FROM salaries;
```

| max_salary | min_salary | avg_salary |
| :--- | :--- | :--- |
| 158220 | 38623 | 63810.7448 |

## 3. Count how many distinct titles exist in titles.

```sql
SELECT COUNT(DISTINCT title) AS titles_num
FROM titles;
```

| titles_num |
| :--- |
| 7 |

## 4. For current salaries only (to_date = '9999-01-01'), compute min, max, avg salary.

```sql
SELECT 
	MAX(salary) AS max_salary,
    MIN(salary) AS min_salary,
    AVG(salary) AS avg_salary
FROM salaries
WHERE to_date = '9999-01-01';
```

| max_salary | min_salary | avg_salary |
| :--- | :--- | :--- |
| 158220 | 38623 | 72012.2359 |
