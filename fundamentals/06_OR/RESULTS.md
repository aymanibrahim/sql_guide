# SQL OR
- The `OR` operator is used to filter records based on more than one condition. 
- It displays a record if any of the conditions separated by `OR` are **TRUE**.

## 1. Shows employees whose first_name = 'Georgi' or first_name = 'Parto'.

```sql
SELECT *
FROM employees
WHERE first_name = 'Georgi' OR first_name = 'Parto';
```

| emp_no | birth_date | first_name | last_name | gender | hire_date |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 10001 | 1953-09-02 | Georgi | Facello | M | 1986-06-26 |
| 10003 | 1959-12-03 | Parto | Bamford | M | 1986-08-28 |
| 10387 | 1952-11-03 | Parto | Wrigley | F | 1987-02-19 |
| ... | ... | ... | ... | ... | ... |
| 498908 | 1961-02-06 | Parto | Hiyoshi | M | 1991-09-02 |
| 499529 | 1958-05-06 | Parto | Kambil | M | 1995-03-08 |
| 499814 | 1960-12-28 | Georgi | Wielonsky | M | 1989-01-31 |

## 2. Show titles where title is 'Engineer' or 'Senior Engineer'.

```sql
SELECT *
FROM titles
WHERE title = 'Engineer' OR title = 'Senior Engineer';
```

| emp_no | title | from_date | to_date |
| :--- | :--- | :--- | :--- |
| 10001 | Senior Engineer | 1986-06-26 | 9999-01-01 |
| 10003 | Senior Engineer | 1995-12-03 | 9999-01-01 |
| 10004 | Engineer | 1986-12-01 | 1995-12-01 |
| ... | ... | ... | ... |
| 11450 | Senior Engineer | 1995-10-07 | 2000-07-13 |
| 11451 | Senior Engineer | 1990-05-20 | 9999-01-01 |
| 11454 | Senior Engineer | 1998-07-12 | 9999-01-01 |