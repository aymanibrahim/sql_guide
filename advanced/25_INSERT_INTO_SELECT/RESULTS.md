# SQL INSERT INTO SELECT
- copies data from one table and appends it into an existing table without affecting any prior records

## 1. Create a table dept_heads (emp_no INT, dept_no CHAR(4)), then insert all current managers into it using a SELECT from dept_manager.

```sql
CREATE TABLE  dept_heads (
	emp_no INT, 
    dept_no CHAR(4)
);

INSERT INTO dept_heads
SELECT 
	emp_no, 
	dept_no
FROM dept_manager
WHERE to_date = '9999-01-01';

SELECT *
FROM dept_heads;
```

| emp_no | dept_no |
| :--- | :--- |
| 110039 | d001 |
| 110114 | d002 |
| 110228 | d003 |
| 110420 | d004 |
| 110567 | d005 |
| 110854 | d006 |
| 111133 | d007 |
| 111534 | d008 |
| 111939 | d009 |

## 2. Create senior_eng (emp_no, from_date) and insert all current Senior Engineers.

```sql
CREATE TABLE  senior_eng (
	emp_no INT, 
    from_date DATE
);

INSERT INTO senior_eng
SELECT 
	emp_no, 
	from_date
FROM titles
WHERE to_date = '9999-01-01'
AND title = 'Senior Engineer';

SELECT *
FROM senior_eng;
```

| emp_no | from_date |
| :--- | :--- |
| 10001 | 1986-06-26 |
| 10003 | 1995-12-03 |
| 10004 | 1995-12-01 |
| ... | ... |

## 3. Create payroll_over_120k(emp_no, salary) and insert all current salaries ≥ 120000.

```sql
CREATE TABLE  payroll_over_120k (
	emp_no INT, 
    salary INT
);

INSERT INTO payroll_over_120k
SELECT 
	emp_no, 
	salary
FROM salaries
WHERE to_date = '9999-01-01'
AND salary >= 120000;

SELECT *
FROM payroll_over_120k;
```

| emp_no | salary |
| :--- | :--- |
| 10521 | 120116 |
| 10532 | 122653 |
| 10539 | 126614 |
| ... | ... |

## 4. Create hire_anniv (emp_no, hire_year) and insert (emp_no, YEAR(hire_date)) for all employees.

```sql
CREATE TABLE  hire_anniv (
	emp_no INT, 
    hire_year INT
);

INSERT INTO hire_anniv
SELECT 
	emp_no, 
	YEAR(hire_date)
FROM employees;

SELECT *
FROM hire_anniv;
```

| emp_no | hire_year |
| :--- | :--- |
| 10001 | 1986 |
| 10002 | 1985 |
| 10003 | 1986 |
| ... | ... |

## 5. Insert into engineering_roster (created earlier) the current employees in Development too (append rows via INSERT ... SELECT).

```sql
INSERT INTO engineering_roster
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
AND d.dept_name LIKE '%Development%';

SELECT * 
FROM engineering_roster;
```

| first_name | last_name | dept_name |
| :--- | :--- | :--- |
| Georgi | Facello | Development |
| Anneke | Preusig | Development |
| Patricio | Bridgland | Development |
| ... | ... | ... |

