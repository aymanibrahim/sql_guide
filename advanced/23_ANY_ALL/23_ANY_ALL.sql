-- SQL ANY, ALL

USE employees;

-- 1. Find employees whose current salary is greater than ANY current salary in the Sales department.

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
    WHERE d.dept_name = 'Sales'
    AND s2.to_date = '9999-01-01'
    AND de.to_date = '9999-01-01'
);

-- 2. Find employees whose current salary is greater than ALL current salaries in the Customer Service department.

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


-- 3. Show departments whose average current salary is > ALL average current salaries of departments with 'Engineer' in the name.

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


-- 4. List employees whose earliest recorded salary is < ANY salary recorded for employee 10001.

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

-- 5. Find titles where the current title count is < ALL current title counts of departments starting with 'Dev'.

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