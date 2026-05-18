# SQL OPERATORS
- reserved words and characters used in a WHERE clause to perform mathematical calculations, filter rows, and compare values.
- cover arithmetic, comparison, logical, pattern, set, and range operators.

## 1. Comparison: list employees with hire_date >= '2000-01-01'.

```sql
SELECT 
	emp_no, 
    first_name, 
    last_name, 
    hire_date
FROM employees
WHERE hire_date >= '2000-01-01';
```

| emp_no | first_name | last_name | hire_date |
| :--- | :--- | :--- | :--- |
| 47291 | Ulf | Flexer | 2000-01-12 |
| 60134 | Seshu | Rathonyi | 2000-01-02 |
| 72329 | Randi | Luit | 2000-01-02 |
| 108201 | Mariangiola | Boreale | 2000-01-01 |
| 205048 | Ennio | Alblas | 2000-01-06 |
| 222965 | Volkmar | Perko | 2000-01-13 |
| 226633 | Xuejun | Benzmuller | 2000-01-04 |
| 227544 | Shahab | Demeyer | 2000-01-08 |
| 422990 | Jaana | Verspoor | 2000-01-11 |
| 424445 | Jeong | Boreale | 2000-01-03 |
| 428377 | Yucai | Gerlach | 2000-01-23 |
| 463807 | Bikash | Covnot | 2000-01-28 |
| 499553 | Hideyuki | Delgrande | 2000-01-22 |

## 2. Logical: list employees where first name starts with 'A' AND gender = 'F'.

```sql
SELECT 
	emp_no, 
    first_name 
    last_name,
    gender
FROM employees
WHERE first_name LIKE 'A%'
AND gender = 'F';
```

| emp_no | first_name | last_name | gender |
| :--- | :--- | :--- | :--- |
| 10006 | Anneke | Preusig | F |
| 10059 | Alejandro | McAlpine | F |
| 10094 | Arumugam | Ossenbruggen | F |
| ... | ... | ... | ... |

## 3. Pattern: titles LIKE '%Engineer%'.

```sql
SELECT emp_no, title
FROM titles
WHERE title LIKE '%Engineer%'
AND to_date = '9999-01-01';
```

| emp_no | title |
| :--- | :--- |
| 10001 | Senior Engineer |
| ... | ... |
| 10010 | Engineer |
| ... | ... |
| 10024 | Assistant Engineer |
| ... | ... |

## 4. Set: employees with first_name IN ('Georgi','Bezalel','Chirstian').

```sql
SELECT 
	emp_no, 
    first_name, 
    last_name
FROM employees
WHERE first_name IN ('Georgi','Bezalel','Chirstian');
```

| emp_no | first_name | last_name |
| :--- | :--- | :--- |
| 10001 | Georgi | Facello |
| 10002 | Bezalel | Simmel |
| 10004 | Chirstian | Koblick |
| ... | ... | ... |
| 499342 | Bezalel | Limongiello |
| 499814 | Georgi | Wielonsky |
| 499846 | Bezalel | Ranon |

## 5. Range: salaries BETWEEN 60000 AND 80000.

```sql
SELECT emp_no, salary
FROM salaries
WHERE salary BETWEEN 60000 AND 80000
AND to_date = '9999-01-01';
```

| emp_no | salary |
| :--- | :--- |
| 10002 | 72527 |
| 10004 | 74057 |
| 10013 | 68901 |
| ... | ... |

## 6. Arithmetic: show current salaries plus a 5% computed raise as a new column.

```sql
SELECT 
	emp_no, 
    salary AS current_salary,
    salary * 1.05 AS new_salary
FROM salaries
WHERE to_date = '9999-01-01';
```

| emp_no | current_salary | new_salary |
| :--- | :--- | :--- |
| 10001 | 88958 | 93405.90 |
| 10002 | 72527 | 76153.35 |
| 10003 | 43311 | 45476.55 |
| ... | ... | ... |

## 7. Negation: employees NOT in a department containing 'Sales'.

```sql
SELECT 
	e.emp_no, 
    e.first_name,
    e.last_name,
    d.dept_name
FROM employees e
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments d 
ON de.dept_no = d.dept_no
WHERE d.dept_name NOT LIKE '%Sales%';
```

| emp_no | first_name | last_name | dept_name |
| :--- | :--- | :--- | :--- |
| 10011 | Mary | Sluis | Customer Service |
| 10038 | Huan | Lortz | Customer Service |
| 10049 | Basil | Tramer | Customer Service |
| ... | ... | ... | ... |

## 8. Null-safe equality: demonstrate <=> on a scratch table with some NULLs.

```sql
SELECT 
	emp_no, 
    first_name, 
    last_name,
    hire_date 
FROM scratch_employees 
WHERE hire_date <=> NULL;
```

| emp_no | first_name | last_name | hire_date |
| :--- | :--- | :--- | :--- |
| 9999901 | Alice | Testuser | *(null)* |
| 9999903 | Charlie | Demo | *(null)* |
