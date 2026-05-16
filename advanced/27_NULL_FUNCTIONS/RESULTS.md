# SQL NULL FUNCTIONS
- Built-in database functions used to detect, substitute, or conditionally return NULL values
- Useful functions: IFNULL(x, y), COALESCE(a, b, c), NULLIF(x, y).

## 1. Select ContactName-like field substitute: show COALESCE(e.first_name, 'Unknown') (use any nullable field you create in a scratch table if needed).

```sql
SELECT 
    emp_no,
    COALESCE(first_name, 'Unknown') AS display_name,
    last_name
FROM scratch_employees;
```

| emp_no | display_name | last_name |
| :--- | :--- | :--- |
| 10001 | Georgi | Facello |
| 10002 | Bezalel | Simmel |
| 10003 | Parto | Bamford |
| ... | ... | ... |
| 9999901 | Alice | Testuser |
| 9999902 | Bob | Example |
| 9999903 | Charlie | Demo |

## 2. Create a scratch table x(emp_no INT, nick VARCHAR(50)) with some NULL nicks; select COALESCE(nick, CONCAT('emp_', emp_no)).

```sql
CREATE TABLE x (
    emp_no INT,
    nick VARCHAR(50)
);

INSERT INTO x (emp_no, nick) VALUES
(101, 'Alex'),
(102, NULL),
(103, 'Ben'),
(104, NULL);

SELECT 
    emp_no,
    nick,
    COALESCE(nick, CONCAT('emp_', emp_no)) AS display_name
FROM 
    x;
```

| emp_no | nick | display_name |
| :--- | :--- | :--- |
| 101 | Alex | Alex |
| 102 | (null) | emp_102 |
| 103 | Ben | Ben |
| 104 | (null) | emp_104 |

## 3. Use IFNULL to substitute missing department names (via LEFT JOIN employees → current dept).

```sql
SELECT 
    CONCAT(e.first_name, ' ', e.last_name) AS Employee,
    IFNULL(d.dept_name, 'Unknown') AS Department
FROM employees e
LEFT JOIN dept_emp de 
ON e.emp_no = de.emp_no 
AND de.to_date = '9999-01-01'
LEFT JOIN departments d 
ON de.dept_no = d.dept_no;
```

| Employee | Department |
| :--- | :--- |
| Georgi Facello | Development |
| Bezalel Simmel | Sales |
| Parto Bamford | Production |
| ... | ... |

## 4. Use NULLIF to return NULL when first_name = last_name, else return first_name.

```sql
SELECT 
    first_name,
    last_name,
    NULLIF(first_name, last_name) AS unique_first_name
FROM employees;
```

| first_name | last_name | unique_first_name |
| :--- | :--- | :--- |
| Georgi | Facello | Georgi |
| Bezalel | Simmel | Bezalel |
| Parto | Bamford | Parto |
| ... | ... | ... |

## 5. Show COALESCE(current_title, 'No current title') using a LEFT JOIN to current titles.

```sql
SELECT 
    CONCAT(e.first_name, ' ', e.last_name) AS Employee,
    COALESCE(t.title, 'No current title') AS Title
FROM employees e
LEFT JOIN titles t 
ON e.emp_no = t.emp_no 
AND t.to_date = '9999-01-01';
```

| Employee | Title |
| :--- | :--- |
| Georgi Facello | Senior Engineer |
| Bezalel Simmel | Staff |
| Parto Bamford | Senior Engineer |
| ... | ... |
