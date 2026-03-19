# Date Logic
- use date functions to extract specific time units, calculate durations between dates, and filter records
- based on their active status at a given point in time.

## 1. Count how many employees were hired per year; list the 5 years with the highest hires.

```sql
SELECT
	YEAR(hire_date) AS hire_year,
    COUNT(*) AS total_hires
FROM employees
GROUP BY hire_year
ORDER BY total_hires DESC
LIMIT 5;
```

| hire_year | total_hires |
| :--- | :--- |
| 1986 | 36150 |
| 1985 | 35316 |
| 1987 | 33501 |
| 1988 | 31436 |
| 1989 | 28394 |

## 2. For each department, show the current manager and how long (in years) they’ve been manager.
- Hint: TIMESTAMPDIFF(YEAR, from_date, CURDATE()) on current manager rows.

```sql
SELECT
	d.dept_name AS department,
    CONCAT(e.first_name, ' ', e.last_name) AS current_manager,
    TIMESTAMPDIFF(YEAR, dm.from_date, CURDATE()) AS years_in_role
FROM departments d
JOIN dept_manager dm
ON d.dept_no = dm.dept_no 
JOIN employees e
ON dm.emp_no = e.emp_no
WHERE dm.to_date = '9999-01-01'
ORDER BY years_in_role DESC;
```

| department | current_manager | years_in_role |
| :--- | :--- | :--- |
| Finance | Isamu Legleitner | 36 |
| Sales | Hauke Zhang | 35 |
| Marketing | Vishwani Minakawa | 34 |
| Research | Hilary Kambil | 34 |
| Human Resources | Karsten Sigstam | 33 |
| Development | Leon DasSarma | 33 |
| Quality Management | Dung Pesch | 31 |
| Customer Service | Yuchang Weedman | 30 |
| Production | Oscar Ghazalie | 29 |
