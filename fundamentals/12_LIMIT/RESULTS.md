# SQL LIMIT
- specify the maximum number of records after all other filters and ordering are applied.

## 1. Show the first 10 employees (any ordering).
```sql
 SELECT *
FROM employees
LIMIT 10;
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

## 2. Show the top 5 highest current salaries (to_date = '9999-01-01') using ORDER BY salary DESC LIMIT 5.
```sql
SELECT *
FROM salaries
WHERE to_date = '9999-01-01'
ORDER BY salary DESC
LIMIT 5; 
```

| emp_no | salary | from_date | to_date |
| :--- | :--- | :--- | :--- |
| 43624 | 158220 | 2002-03-22 | 9999-01-01 |
| 254466 | 156286 | 2001-08-04 | 9999-01-01 |
| 47978 | 155709 | 2002-07-14 | 9999-01-01 |
| 253939 | 155513 | 2002-04-11 | 9999-01-01 |
| 109334 | 155190 | 2002-02-11 | 9999-01-01 |
