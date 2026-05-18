# SQL VIEWS
- virtual tables defined by a stored query that dynamically fetch and format data from underlying physical tables.

## 1. Create a view v_current_employees (emp_no, name, dept_no, dept_name) for current assignments.

```sql
CREATE OR REPLACE VIEW v_current_employees AS
SELECT 
    e.emp_no,
    CONCAT(e.first_name, ' ', e.last_name) AS name,
    d.dept_no,
    d.dept_name
FROM employees e
JOIN dept_emp de 
ON e.emp_no = de.emp_no
JOIN departments d 
ON de.dept_no = d.dept_no
WHERE de.to_date = '9999-01-01';

SELECT *
FROM v_current_employees;
```

| emp_no | name | dept_no | dept_name |
| :--- | :--- | :--- | :--- |
| 10038 | Huan Lortz | d009 | Customer Service |
| 10049 | Basil Tramer | d009 | Customer Service |
| 10060 | Breannda Billingsley | d009 | Customer Service |
| ... | ... | ... | ... |

## 2. Create v_current_payroll with current salaries only.

```sql
SELECT 
    e.emp_no,
    CONCAT(e.first_name, ' ', e.last_name) AS name,
    s.salary
FROM employees e
JOIN salaries s 
ON e.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01';

SELECT *
FROM v_current_payroll;
```

| emp_no | name | salary |
| :--- | :--- | :--- |
| 10001 | Georgi Facello | 88958 |
| 10002 | Bezalel Simmel | 72527 |
| 10003 | Parto Bamford | 43311 |
| ... | ... | ... |

## 3. Create v_dept_stats showing per-department current headcount, min/max/avg salary.

```sql
CREATE OR REPLACE VIEW v_dept_stats AS
SELECT 
    d.dept_name,
    COUNT(de.emp_no) AS headcount,
    MIN(s.salary) AS min_salary,
    MAX(s.salary) AS max_salary,
    ROUND(AVG(s.salary), 2) AS avg_salary
FROM departments d
JOIN dept_emp de 
ON d.dept_no = de.dept_no
JOIN salaries s 
ON de.emp_no = s.emp_no
WHERE de.to_date = '9999-01-01' 
AND s.to_date = '9999-01-01'
GROUP BY d.dept_no, d.dept_name
ORDER BY headcount DESC;

SELECT *
FROM v_dept_stats;
```

| dept_name | headcount | min_salary | max_salary | avg_salary |
| :--- | :--- | :--- | :--- | :--- |
| Development | 61386 | 39036 | 144434 | 67657.92 |
| Production | 53304 | 38623 | 138273 | 67843.30 |
| Sales | 37701 | 39426 | 158220 | 88852.97 |
| Customer Service | 17569 | 39373 | 144866 | 67285.23 |
| Research | 15441 | 39186 | 130211 | 67913.37 |
| Marketing | 14842 | 39821 | 145128 | 80058.85 |
| Quality Management | 14546 | 38942 | 132103 | 65441.99 |
| Human Resources | 12898 | 38936 | 141953 | 63921.90 |
| Finance | 12437 | 39012 | 142395 | 78559.94 |


## 4. Create v_engineering_only for all current employees in departments whose name contains 'Engineer'.

```sql
CREATE OR REPLACE VIEW v_engineering_only AS
SELECT 
	emp_no, 
    name,
    dept_name
FROM v_current_employees
WHERE dept_name LIKE '%Engineer%';

SELECT *
FROM v_engineering_only;
```

| emp_no | name | dept_name |
| :--- | :--- | :--- |
| *(null)* | *(null)* | *(null)* |

## 5. Query the above views together to list the top 10 highest-paid current employees (name, dept, salary).

```sql
SELECT 
    ce.name,
    ce.dept_name AS dept,
    cp.salary
FROM v_current_employees ce
JOIN v_current_payroll cp 
ON ce.emp_no = cp.emp_no
ORDER BY cp.salary DESC
LIMIT 10;
```

| name | dept | salary |
| :--- | :--- | :--- |
| Tokuyasu Pesch | Sales | 158220 |
| Honesty Mukaidono | Sales | 156286 |
| Xiahua Whitcomb | Sales | 155709 |
| Sanjai Luders | Sales | 155513 |
| Tsutomu Alameldin | Sales | 155190 |
| Willard Baca | Sales | 154459 |
| Lidong Meriste | Sales | 154376 |
| Charmane Griswold | Sales | 153715 |
| Weijing Chenoweth | Sales | 152710 |
| Weicheng Hatcliff | Sales | 152687 |

## 6. Alter one view to include hire_date and re-run a query that uses it.

```sql
CREATE OR REPLACE VIEW v_current_employees AS
SELECT 
    e.emp_no,
    CONCAT(e.first_name, ' ', e.last_name) AS name,
    e.hire_date, -- Added hire_date
    d.dept_no,
    d.dept_name
FROM employees e
JOIN dept_emp de 
ON e.emp_no = de.emp_no
JOIN departments d 
ON de.dept_no = d.dept_no
WHERE de.to_date = '9999-01-01';

SELECT *
FROM v_current_employees;
```

| emp_no | name | hire_date | dept_no | dept_name |
| :--- | :--- | :--- | :--- | :--- |
| 10038 | Huan Lortz | 1989-09-20 | d009 | Customer Service |
| 10049 | Basil Tramer | 1992-05-04 | d009 | Customer Service |
| 10060 | Breannda Billingsley | 1987-11-02 | d009 | Customer Service |
| ... | ... | ... | ... | ... |
