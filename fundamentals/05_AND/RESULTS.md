# SQL AND
- The `AND` operator is used to filter records based on more than one condition. 
- It displays a record if all the conditions separated by `AND` are **TRUE**.

## 1. Show employees with gender = 'F' and hire_date >= '2000-01-01'.
```sql
SELECT *
FROM employees
WHERE gender = 'F' AND hire_date >= '2000-01-01';
```
| emp_no | birth_date | first_name | last_name | gender | hire_date |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 60134 | 1964-04-21 | Seshu | Rathonyi | F | 2000-01-02 |
| 72329 | 1953-02-09 | Randi | Luit | F | 2000-01-02 |
| 205048 | 1960-09-12 | Ennio | Alblas | F | 2000-01-06 |
| 222965 | 1959-08-07 | Volkmar | Perko | F | 2000-01-13 |
| 226633 | 1958-06-10 | Xuejun | Benzmuller | F | 2000-01-04 |
| 422990 | 1953-04-09 | Jaana | Verspoor | F | 2000-01-11 |
| 499553 | 1954-05-06 | Hideyuki | Delgrande | F | 2000-01-22 |


## 2. From salaries, show rows with salary >= 100000 and to_date = '9999-01-01' (current high earners).
```sql
SELECT *
FROM salaries
WHERE salary >= 100000 AND to_date = '9999-01-01';
```
| emp_no | salary | from_date | to_date |
| :--- | :--- | :--- | :--- |
| 10066 | 103672 | 2002-02-22 | 9999-01-01 |
| 10068 | 113229 | 2001-08-03 | 9999-01-01 |
| 10107 | 101676 | 2002-03-29 | 9999-01-01 |
| ... | ... | ... | ... |
| 27313 | 102551 | 2001-11-09 | 9999-01-01 |
| 27322 | 101114 | 2002-01-08 | 9999-01-01 |
| 27349 | 110201 | 2002-03-19 | 9999-01-01 |
