# SQL ANY, ALL
- ANY returns true if the comparison matches at least one value in the result set, whereas ALL returns true only if the comparison matches every single value in the set.

## 1. Find employees whose current salary is greater than ANY current salary in the Sales department.

```sql
SELECT 
    e.emp_no, 
    e.first_name, 
    e.last_name
FROM employees e
JOIN salaries s1 
ON e.emp_no = s1.emp_no
WHERE s1.to_date = '9999-01-01'
AND s1.salary > ANY (
    SELECT s2.salary
    FROM salaries s2
    JOIN dept_emp de 
    ON s2.emp_no = de.emp_no
    JOIN departments d 
    ON de.dept_no = d.dept_no
);
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
| 10009 | Sumant | Peac |
| 10010 | Duangkaew | Piveteau |
| 10012 | Patricio | Bridgland |
| ... | ... | ... |

## 2. Find employees whose current salary is greater than ALL current salaries in the Customer Service department.

```sql
SELECT 
    e.emp_no, 
    e.first_name, 
    e.last_name
FROM employees e
JOIN salaries s1 
ON e.emp_no = s1.emp_no
WHERE s1.to_date = '9999-01-01'
AND s1.salary > ALL (
    SELECT s2.salary
    FROM salaries s2
    JOIN dept_emp de 
    ON s2.emp_no = de.emp_no
    JOIN departments d 
    ON de.dept_no = d.dept_no
    WHERE d.dept_name = 'Customer Service'
    AND s2.to_date = '9999-01-01'
    AND de.to_date = '9999-01-01'
);
```

| emp_no | first_name | last_name |
| :--- | :--- | :--- |
| 11486 | Itzchak | Ramaiah |
| 18997 | Basim | Tischendorf |
| 36219 | Vivian | Minakawa |
| ... | ... | ... |
| 466852 | Akemi | Warwick |
| 492164 | Ghassan | Birta |
| 493158 | Lidong | Meriste |
| ... | ... | ... |

## 3. Show departments whose average current salary is > ALL average current salaries of departments with 'Engineer' in the name.

```sql
SELECT 
    d.dept_name
FROM departments d
JOIN dept_emp de ON d.dept_no = de.dept_no
JOIN salaries s ON de.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01' 
  AND de.to_date = '9999-01-01'
GROUP BY d.dept_name
HAVING AVG(s.salary) > ALL (
    SELECT AVG(s2.salary)
    FROM salaries s2
    JOIN dept_emp de2 ON s2.emp_no = de2.emp_no
    JOIN departments d2 ON de2.dept_no = d2.dept_no
    WHERE d2.dept_name LIKE '%Engineer%'
      AND s2.to_date = '9999-01-01'
      AND de2.to_date = '9999-01-01'
    GROUP BY d2.dept_no
);
```

| dept_name |
| :--- |
| Customer Service |
| Development |
| Finance |
| Human Resources |
| Marketing |
| Production |
| Quality Management |
| Research |
| Sales |

## 4. List employees whose earliest recorded salary is < ANY salary recorded for employee 10001.

```sql
SELECT 
    e.emp_no, 
    e.first_name, 
    e.last_name
FROM employees e
JOIN salaries s 
ON e.emp_no = s.emp_no
WHERE s.from_date = (
    SELECT MIN(from_date) 
    FROM salaries s2 
    WHERE s2.emp_no = e.emp_no
)
AND s.salary < ANY (
    SELECT salary 
    FROM salaries 
    WHERE emp_no = 10001
);
```

| emp_no | first_name | last_name |
| :--- | :--- | :--- |
| 10001 | Georgi | Facello |
| 10002 | Bezalel | Simmel |
| 10003 | Parto | Bamford |
... ... ...

## 5. Find titles where the current title count is < ALL current title counts of departments starting with 'Dev'.

```sql
SELECT 
    t.title, 
    COUNT(t.emp_no) AS current_title_count
FROM titles t
WHERE t.to_date = '9999-01-01'
GROUP BY t.title
HAVING COUNT(t.emp_no) < ALL (
    SELECT COUNT(de.emp_no)
    FROM dept_emp de
    JOIN departments d 
    ON de.dept_no = d.dept_no
    WHERE d.dept_name LIKE 'Dev%'
    AND de.to_date = '9999-01-01'
    GROUP BY d.dept_no
);
```

| title | current_title_count |
| :--- | :--- |
| Staff | 25526 |
| Engineer | 30983 |
| Assistant Engineer | 3588 |
| Technique Leader | 12055 |
| Manager | 9 |
