# SQL SUM
- 

## 1. Sum all current salaries (to_date = '9999-01-01').

```sql
SELECT SUM(salary) AS total_salaries
FROM salaries
WHERE to_date = '9999-01-01';
```

# total_salaries
17291866123

## 2. For a chosen employee (pick an emp_no), sum all salary amounts they’ve ever had.

```sql
SELECT SUM(salary) AS emp_no_10001_total_salary_amounts
FROM salaries
WHERE emp_no = 10001;
```

# emp_no_10001_total_salary_amounts
1281612
