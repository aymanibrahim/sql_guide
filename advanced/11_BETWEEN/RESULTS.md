# SQL BETWEEN
- filters the result set to include only values that fall within a specified range, inclusive of both the start and end values.

## 1. List employees born between 1960-01-01 and 1965-12-31.

```sql
SELECT first_name, last_name, birth_date
FROM employees
WHERE birth_date BETWEEN '1960-01-01' AND '1965-12-31';
```

| first_name | last_name | birth_date |
| :--- | :--- | :--- |
| Bezalel | Simmel | 1964-06-02 |
| Duangkaew | Piveteau | 1963-06-01 |
| Patricio | Bridgland | 1960-10-04 |
| ... | ... | ... |
| Stamatina | Escriba | 1963-01-18 |
| Berry | Lung | 1962-03-04 |
| Caolyn | Roisin | 1962-02-09 |

## 2. Show salaries between 50,000 and 60,000.

```sql
SELECT emp_no, salary
FROM salaries
WHERE salary BETWEEN 50000 AND 60000
AND to_date = '9999-01-01';
```

| emp_no | salary |
| :--- | :--- |
| 10006 | 59755 |
| 10012 | 54423 |
| 10019 | 50032 |
| ... | ... |

## 3. List employees hired between 1990 and 1995.

```sql
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1995-12-31';
```

| first_name | last_name | hire_date |
| :--- | :--- | :--- |
| Saniya | Kalloufi | 1994-09-15 |
| Mary | Sluis | 1990-01-22 |
| Patricio | Bridgland | 1992-12-18 |
| ... | ... | ... |

## 4. Show all dept_emp rows where from_date is between '1995-01-01' and '2000-01-01'.

```sql
SELECT *
FROM dept_emp
WHERE from_date BETWEEN '1995-01-01' AND '2000-01-01';
```

| emp_no | dept_no | from_date | to_date |
| :--- | :--- | :--- | :--- |
| 10002 | d007 | 1996-08-03 | 9999-01-01 |
| 10003 | d004 | 1995-12-03 | 9999-01-01 |
| 10008 | d005 | 1998-03-11 | 2000-07-31 |
| ... | ... | ... | ... |