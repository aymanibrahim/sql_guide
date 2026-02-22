# SELECT Results

## 1. Show all columns for any 10 rows from employees.

```sql
SELECT *
FROM employees
```

| emp_no | birth_date | first_name | last_name | gender | hire_date |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 10001 | 1953-09-02 | Georgi | Facello | M | 1986-06-26 |
| 10002 | 1964-06-02 | Bezalel | Simmel | F | 1985-11-21 |
| 10003 | 1959-12-03 | Parto | Bamford | M | 1986-08-28 |
| 10004 | 1954-05-01 | Chirstian | Koblick | M | 1986-12-01 |
| 10005 | 1955-01-21 | Kyoichi | Maliniak | M | 1989-09-12 |
| 10006 | 1953-04-20 | Anneke | Preusig | F | 1989-06-02 |
| 10007 | 1957-05-23 | Tzvetan | Zielinski | F | 1989-02-10 |
| 10008 | 1958-02-19 | Saniya | Kalloufi | M | 1994-09-15 |
| 10009 | 1952-04-19 | Sumant | Peac | F | 1985-02-18 |
| 10010 | 1963-06-01 | Duangkaew | Piveteau | F | 1989-08-24 |

## 2. Show only emp_no, first_name, last_name from employees.

```sql
SELECT emp_no, first_name, last_name
FROM employees
LIMIT 10;
```

| emp_no | first_name | last_name |
| :--- | :--- | :--- |
| 10001 | Georgi | Facello |
| 10002 | Bezalel | Simmel |
| 10003 | Parto | Bamford |
| 10004 | Chirstian | Koblick |
| 10005 | Kyoichi | Maliniak |
| 10006 | Anneke | Preusig |
| 10007 | Tzvetan | Zielinski |
| 10008 | Saniya | Kalloufi |
| 10009 | Sumant | Peac |
| 10010 | Duangkaew | Piveteau |

## 3. From departments, list dept_no and dept_name.

```sql
SELECT dept_no, dept_name
FROM departments;
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

## 4. From salaries, show emp_no, salary, from_date, to_date for any 5 rows.

```sql
SELECT emp_no, salary, from_date, to_date
FROM salaries
LIMIT 5;
```

| emp_no | salary | from_date | to_date |
| :--- | :--- | :--- | :--- |
| 10001 | 60117 | 1986-06-26 | 1987-06-26 |
| 10001 | 62102 | 1987-06-26 | 1988-06-25 |
| 10001 | 66074 | 1988-06-25 | 1989-06-25 |
| 10001 | 66596 | 1989-06-25 | 1990-06-25 |
| 10001 | 66961 | 1990-06-25 | 1991-06-25 |