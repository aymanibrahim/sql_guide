# SQL SELECT INTO
- creates a new table and populates it with the result set of a query.
- MySQL nuance: there’s no SELECT INTO new_table; use CREATE TABLE new_table AS SELECT ....

## 1. Create a backup table backup_departments from departments.

```sql
CREATE TABLE backup_departments AS 
SELECT *
FROM departments;

SELECT *
FROM backup_departments;
```

| dept_no | dept_name |
| :--- | :--- |
| d009 | Customer Service |
| d005 | Development |
| d002 | Finance |
| d003 | Human Resources |
| d001 | Marketing |
| d004 | Production |
| d006 | Quality Management |
| d008 | Research |
| d007 | Sales |

## 2. Create current_payroll with emp_no, salary for current salaries only.

```sql
CREATE TABLE current_payroll AS
SELECT 
	emp_no, 
    salary
FROM salaries
WHERE to_date = '9999-01-01';

SELECT *
FROM current_payroll;
```

| emp_no | salary |
| :--- | :--- |
| 10001 | 88958 |
| 10002 | 72527 |
| 10003 | 43311 |
| ... | ... |

## 3. Create engineering_roster with current employees (name + dept) for departments whose name contains 'Engineer'.

```sql
CREATE TABLE engineering_roster AS
SELECT 
	e.first_name, 
	e.last_name, 
	d.dept_name
FROM employees e
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments d
ON de.dept_no = d.dept_no
WHERE de.to_date = '9999-01-01'
AND d.dept_name LIKE '%Engineer%';

SELECT *
FROM engineering_roster;
```

| first_name | last_name | dept_name |
| :--- | :--- | :--- |
| (null) | (null) | (null) |

## 4. Create top_paid_50 table containing the top 50 highest current salaries (include name + dept).

```sql
CREATE TABLE top_paid_50 AS
SELECT
	e.first_name, 
	e.last_name, 
	d.dept_name,
    s.salary
FROM employees e
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments d
ON de.dept_no = d.dept_no
JOIN salaries s
ON e.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01'
ORDER BY s.salary DESC
LIMIT 50;

SELECT *
FROM top_paid_50;
```

| first_name | last_name | dept_name | salary |
| :--- | :--- | :--- | :--- |
| Tokuyasu | Pesch | Sales | 158220 |
| Honesty | Mukaidono | Sales | 156286 |
| Xiahua | Whitcomb | Sales | 155709 |
| ... | ... | ... | ... |
| Seongbin | Mitsuhashi | Sales | 143937 |
| Seongbin | Mitsuhashi | Customer Service | 143937 |
| Bedrich | Luft | Sales | 143832 |

## 5. Create hired_1999 table with employees hired in 1999.

```sql
CREATE TABLE hired_1999 AS
SELECT *
FROM employees
WHERE YEAR(hire_date) = 1999;

SELECT *
FROM hired_1999;
```

| emp_no | birth_date | first_name | last_name | gender | hire_date |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 10019 | 1953-01-23 | Lillian | Haddadi | M | 1999-04-30 |
| 10105 | 1962-02-05 | Hironoby | Piveteau | M | 1999-03-23 |
| 10298 | 1954-07-06 | Dietrich | DuCasse | F | 1999-03-30 |
| ... | ... | ... | ... | ... | ... |
