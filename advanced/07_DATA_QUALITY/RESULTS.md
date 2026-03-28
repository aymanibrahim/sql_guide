# Data Quality / Sanity Checks 
- verify data integrity such as identifying duplicate active records or overlapping timeframes.

## 1. Verify there are no current employees with multiple current departments (should be rare).
- Hint: group by emp_no on current dept_emp and check counts > 1.

```sql
SELECT 
    emp_no AS employee_no, 
    COUNT(dept_no) AS active_department_count
FROM dept_emp 
WHERE to_date = '9999-01-01'
GROUP BY emp_no
HAVING COUNT(dept_no) > 1;
```

| employee_no | active_department_count |
| :--- | :--- |
| (null) | (null) |

## 2. Verify there are no current salaries overlapping per employee (overlapping date ranges).
- Hint: more advanced; encourage reasoning about temporal constraints.

```sql
SELECT 
    s1.emp_no,
    s1.from_date AS start_a, 
    s1.to_date AS end_a,
    s2.from_date AS start_b, 
    s2.to_date AS end_b
FROM salaries s1
JOIN salaries s2 
ON s1.emp_no = s2.emp_no 
AND s1.from_date < s2.from_date -- Avoids duplicate pairs and self-comparison
WHERE s1.from_date < s2.to_date 
AND s2.from_date < s1.to_date;
```

| emp_no | start_a | end_a | start_b | end_b |
| :--- | :--- | :--- | :--- | :--- |
| (null) | (null) | (null) | (null) | (null) |
