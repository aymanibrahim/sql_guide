# SQL Aggregation + Join
- merge data from multiple related tables and then perform mathematical calculations—like counting, averaging, or totaling—on the combined dataset

## 1. For each department, count how many current employees it has. Order by the count descending.

```sql
SELECT 
	d.dept_name AS Department,
	COUNT(e.emp_no) AS employees_count
FROM employees e
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments d
ON de.dept_no = d.dept_no
WHERE de.to_date = '9999-01-01'
GROUP BY d.dept_no
ORDER BY COUNT(e.emp_no) DESC;
```

| Department | employees_count |
| :--- | :--- |
| Development | 61386 |
| Production | 53304 |
| Sales | 37701 |
| Customer Service | 17569 |
| Research | 15441 |
| Marketing | 14842 |
| Quality Management | 14546 |
| Human Resources | 12898 |
| Finance | 12437 |

## 2. For each department, show the average current salary. Order by average descending.
- Hint: join dept_emp (current) → salaries (current).

```sql
SELECT 
	d.dept_name AS Department,
	AVG(s.salary) AS average_current_salary
FROM salaries s
JOIN dept_emp de
ON s.emp_no = de.emp_no
JOIN departments d
ON de.dept_no = d.dept_no
WHERE de.to_date = '9999-01-01'
AND s.to_date = '9999-01-01'
GROUP BY d.dept_no
ORDER BY AVG(s.salary) DESC;
```

| Department | average_current_salary |
| :--- | :--- |
| Sales | 88852.9695 |
| Marketing | 80058.8488 |
| Finance | 78559.9370 |
| Research | 67913.3750 |
| Production | 67843.3020 |
| Development | 67657.9196 |
| Customer Service | 67285.2302 |
| Quality Management | 65441.9934 |
| Human Resources | 63921.8998 |

## 3. For each title, show the average current salary, and only include titles with average > 70000.

```sql
SELECT
	t.title AS Title,
	AVG(s.salary) AS average_current_salary
FROM titles t
JOIN salaries s
ON t.emp_no = s.emp_no
WHERE t.to_date = '9999-01-01'
AND s.to_date = '9999-01-01'
GROUP BY t.title
HAVING AVG(s.salary) > 70000
ORDER BY AVG(s.salary) DESC;
```

| Title | average_current_salary |
| :--- | :--- |
| Senior Staff | 80706.4959 |
| Manager | 77723.6667 |
| Senior Engineer | 70823.4376 |

## 4. For each department, show the min and max current salary and the number of current employees.

```sql
SELECT 
	d.dept_name AS Department,
	MIN(s.salary) AS min_current_salary,
    MAX(s.salary) AS max_current_salary,
	COUNT(e.emp_no) AS employees_count
FROM employees e
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments d
ON de.dept_no = d.dept_no
JOIN salaries s
ON s.emp_no = de.emp_no
WHERE de.to_date = '9999-01-01'
AND s.to_date = '9999-01-01'
GROUP BY d.dept_no
ORDER BY COUNT(e.emp_no) DESC;
```

| Department | min_current_salary | max_current_salary | employees_count |
| :--- | :--- | :--- | :--- |
| Development | 39036 | 144434 | 61386 |
| Production | 38623 | 138273 | 53304 |
| Sales | 39426 | 158220 | 37701 |
| Customer Service | 39373 | 144866 | 17569 |
| Research | 39186 | 130211 | 15441 |
| Marketing | 39821 | 145128 | 14842 |
| Quality Management | 38942 | 132103 | 14546 |
| Human Resources | 38936 | 141953 | 12898 |
| Finance | 39012 | 142395 | 12437 |

## 5. Find the top 10 highest-paid current employees (show name, salary, department).

```sql
SELECT
	CONCAT(e.first_name,' ',e.last_name) AS Employee,
    s.salary AS Salary,
    d.dept_name AS Department
FROM employees e
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments d
ON de.dept_no = d.dept_no
JOIN salaries s
ON s.emp_no = de.emp_no
WHERE de.to_date = '9999-01-01'
AND s.to_date = '9999-01-01'
ORDER BY s.salary DESC
LIMIT 10;
```
| Employee | Salary | Department |
| :--- | :--- | :--- |
| Tokuyasu Pesch | 158220 | Sales |
| Honesty Mukaidono | 156286 | Sales |
| Xiahua Whitcomb | 155709 | Sales |
| Sanjai Luders | 155513 | Sales |
| Tsutomu Alameldin | 155190 | Sales |
| Willard Baca | 154459 | Sales |
| Lidong Meriste | 154376 | Sales |
| Charmane Griswold | 153715 | Sales |
| Weijing Chenoweth | 152710 | Sales |
| Weicheng Hatcliff | 152687 | Sales |

## 6. For each department, list the most recently hired employee (name, hire_date).
-- Hint: window function alternative or subquery with MAX(hire_date) per department.

```sql
SELECT Department, Employee, Hire_date
FROM (
    SELECT 
        d.dept_name AS Department,
        CONCAT(e.first_name, ' ', e.last_name) AS Employee,
        e.hire_date AS Hire_date,
        ROW_NUMBER() OVER(PARTITION BY d.dept_no ORDER BY e.hire_date DESC) as ranking
    FROM employees e
    JOIN dept_emp de 
    ON e.emp_no = de.emp_no
    JOIN departments d 
    ON de.dept_no = d.dept_no
    WHERE de.to_date = '9999-01-01'
) AS ranked_employees
WHERE ranking = 1;
```

| Department | Employee | Hire_date |
| :--- | :--- | :--- |
| Marketing | Xuejun Benzmuller | 2000-01-04 |
| Finance | Ennio Alblas | 2000-01-06 |
| Human Resources | Volkmar Perko | 2000-01-13 |
| Production | Yucai Gerlach | 2000-01-23 |
| Development | Hideyuki Delgrande | 2000-01-22 |
| Quality Management | Turgut Flasterstein | 1999-12-02 |
| Sales | Adil Siepmann | 1999-12-31 |
| Research | Frederique Lagarias | 1999-12-10 |
| Customer Service | Vasilii Stavenow | 1999-12-30 |
