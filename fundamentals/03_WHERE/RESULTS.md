# SQL WHERE Clause Results

- The `WHERE` clause is used to filter records.
- It extracts only those records that fulfill a specified condition.

## 1. Show employees whose first_name is exactly 'Georgi'.
```sql
SELECT *
FROM employees
WHERE first_name = 'Georgi';
```
| emp_no | birth_date | first_name | last_name | gender | hire_date |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 10001 | 1953-09-02 | Georgi | Facello | M | 1986-06-26 |
| 10909 | 1954-11-11 | Georgi | Atchley | M | 1985-04-21 |
| 11029 | 1962-07-12 | Georgi | Itzfeldt | M | 1992-12-27 |
| ... | ... | ... | ... | ... | ... |
| 497609 | 1956-06-19 | Georgi | Rosiles | M | 1986-02-24 |
| 498809 | 1961-10-24 | Georgi | Ferriere | M | 1993-02-21 |
| 499814 | 1960-12-28 | Georgi | Wielonsky | M | 1989-01-31 |

-- Show employees hired after 1999-01-01.
```sql
SELECT *
FROM employees
WHERE hire_date > '1999-01-01';
```
| emp_no | birth_date | first_name | last_name | gender | hire_date |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 10019 | 1953-01-23 | Lillian | Haddadi | M | 1999-04-30 |
| 10105 | 1962-02-05 | Hironoby | Piveteau | M | 1999-03-23 |
| 10298 | 1954-07-06 | Dietrich | DuCasse | F | 1999-03-30 |
| ... | ... | ... | ... | ... | ... |
| 403319 | 1954-06-12 | Ymte | Bain | M | 1999-03-25 |
| 403335 | 1963-08-18 | Odinaldo | Famili | M | 1999-10-14 |
| 403438 | 1961-09-20 | Yannis | Naudin | F | 1999-12-01 |

## 2. Show salaries greater than 120000 from salaries.
```sql
SELECT *
FROM salaries
WHERE salary > 120000;
```
| emp_no | salary | from_date | to_date |
| :--- | :--- | :--- | :--- |
| 10237 | 122275 | 1998-08-09 | 1999-08-09 |
| 10237 | 125947 | 1999-08-09 | 2000-02-21 |
| 10304 | 121296 | 1999-11-15 | 2000-11-14 |
| ... | ... | ... | ... |
| 42190 | 124671 | 1998-06-08 | 1999-06-08 |
| 42190 | 128241 | 1999-06-08 | 2000-06-07 |
| 42190 | 130308 | 2000-06-07 | 2001-06-07 |

## 3. Show titles where title contains the word 'Engineer'.
```sql
SELECT *
FROM titles
WHERE title = 'Engineer';
```
| emp_no | title | from_date | to_date |
| :--- | :--- | :--- | :--- |
| 10004 | Engineer | 1986-12-01 | 1995-12-01 |
| 10009 | Engineer | 1990-02-18 | 1995-02-18 |
| 10010 | Engineer | 1996-11-24 | 9999-01-01 |
| ... | ... | ... | ... |
| 12661 | Engineer | 1993-12-12 | 2001-12-12 |
| 12662 | Engineer | 1994-08-27 | 9999-01-01 |
| 12666 | Engineer | 1998-04-19 | 9999-01-01 |

## 4. Show employees with birth_date between 1960-01-01 and 1965-12-31.
```sql
SELECT *
FROM employees
WHERE birth_date BETWEEN '1960-01-01' AND '1965-12-31';
```
| emp_no | birth_date | first_name | last_name | gender | hire_date |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 10002 | 1964-06-02 | Bezalel | Simmel | F | 1985-11-21 |
| 10010 | 1963-06-01 | Duangkaew | Piveteau | F | 1989-08-24 |
| 10012 | 1960-10-04 | Patricio | Bridgland | M | 1992-12-18 |
| ... | ... | ... | ... | ... | ... |
| 12660 | 1963-01-18 | Stamatina | Escriba | F | 1990-11-23 |
| 12661 | 1962-03-04 | Berry | Lung | M | 1986-07-27 |
| 12669 | 1962-02-09 | Caolyn | Roisin | F | 1987-05-30 |
