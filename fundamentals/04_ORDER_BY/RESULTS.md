# SQL ORDER BY Results

- The `ORDER BY` keyword is used to sort the result-set in ascending or descending order.
- `ASC` (default) sorts from smallest to largest (A-Z, oldest date to newest).
- `DESC` sorts from largest to smallest (Z-A, newest date to oldest).

## 1. Employees ordered by hire_date ascending.

```sql
SELECT emp_no, first_name, last_name
FROM employees
ORDER BY hire_date ASC;
```

| emp_no | first_name | last_name |
| :--- | :--- | :--- |
| 111035 | Przemyslawa | Kaelbling |
| 111400 | Arie | Staelin |
| 110303 | Krassimir | Wegerle |
| ... | ... | ... |
| 58248 | Menkae | Krzyzanowski |
| 237234 | Martins | Stavenow |
| 37868 | Rosine | Yoshimura |


## 2. 20 Most Recent Hires (hire_date DESC)

```sql
SELECT emp_no, first_name, last_name, hire_date
FROM employees
ORDER BY hire_date DESC
LIMIT 20;
```
| emp_no | first_name | last_name | hire_date |
| :--- | :--- | :--- | :--- |
| 463807 | Bikash | Covnot | 2000-01-28 |
| 428377 | Yucai | Gerlach | 2000-01-23 |
| 499553 | Hideyuki | Delgrande | 2000-01-22 |
| 222965 | Volkmar | Perko | 2000-01-13 |
| 47291 | Ulf | Flexer | 2000-01-12 |
| 422990 | Jaana | Verspoor | 2000-01-11 |
| 227544 | Shahab | Demeyer | 2000-01-08 |
| 205048 | Ennio | Alblas | 2000-01-06 |
| 226633 | Xuejun | Benzmuller | 2000-01-04 |
| 424445 | Jeong | Boreale | 2000-01-03 |
| 72329 | Randi | Luit | 2000-01-02 |
| 60134 | Seshu | Rathonyi | 2000-01-02 |
| 108201 | Mariangiola | Boreale | 2000-01-01 |
| 13246 | Adil | Siepmann | 1999-12-31 |
| 294732 | Karlis | Orsini | 1999-12-31 |
| 242381 | Garnik | Kolvik | 1999-12-30 |
| 71159 | Manton | Ghemri | 1999-12-30 |
| 73925 | Vasilii | Stavenow | 1999-12-30 |
| 220951 | Mang | Kohling | 1999-12-28 |
| 246589 | Murthy | Duclos | 1999-12-26 |


## 3. Departments ordered alphabetically by dept_name.

```sql
SELECT *
FROM departments
ORDER BY dept_name ASC;
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