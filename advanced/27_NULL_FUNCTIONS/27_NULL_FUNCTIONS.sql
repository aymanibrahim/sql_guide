-- SQL NULL FUNCTIONS

USE employees;

-- 1. Select ContactName-like field substitute: show COALESCE(e.first_name, 'Unknown') (use any nullable field you create in a scratch table if needed).

SELECT 
    emp_no,
    COALESCE(first_name, 'Unknown') AS display_name,
    last_name
FROM scratch_employees;

-- 2. Create a scratch table x(emp_no INT, nick VARCHAR(50)) with some NULL nicks; select COALESCE(nick, CONCAT('emp_', emp_no)).

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
FROM x;

-- 3. Use IFNULL to substitute missing department names (via LEFT JOIN employees → current dept).

SELECT 
    CONCAT(e.first_name, ' ', e.last_name) AS Employee,
    IFNULL(d.dept_name, 'Unknown') AS Department
FROM employees e
LEFT JOIN dept_emp de 
ON e.emp_no = de.emp_no 
AND de.to_date = '9999-01-01'
LEFT JOIN departments d 
ON de.dept_no = d.dept_no;

-- 4. Use NULLIF to return NULL when first_name = last_name, else return first_name.

SELECT 
    first_name,
    last_name,
    NULLIF(first_name, last_name) AS unique_first_name
FROM employees;

-- 5. Show COALESCE(current_title, 'No current title') using a LEFT JOIN to current titles.

SELECT 
    CONCAT(e.first_name, ' ', e.last_name) AS Employee,
    COALESCE(t.title, 'No current title') AS Title
FROM employees e
LEFT JOIN titles t 
ON e.emp_no = t.emp_no 
AND t.to_date = '9999-01-01';
