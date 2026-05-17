# SQL STORED PROCEDURES
- precompiled set of reusable SQL statements saved directly in the database to automate repetitive tasks.

## 1. Create sp_current_salary(emp INT) → returns the current salary for emp_no = emp.

```sql
DELIMITER $$

CREATE PROCEDURE sp_current_salary(IN emp INT)
BEGIN
    SELECT salary 
    FROM salaries 
    WHERE emp_no = emp 
    ORDER BY to_date DESC 
    LIMIT 1;
END $$

DELIMITER ;

CALL sp_current_salary(10001);
```

| salary |
| :--- |
| 88958 |

-- 2. Create sp_dept_headcount(dno CHAR(4)) → returns current headcount for that department.

```sql
DELIMITER $$

CREATE PROCEDURE sp_dept_headcount(IN dno CHAR(4))
BEGIN
    SELECT COUNT(emp_no) AS current_headcount
    FROM dept_emp
    WHERE dept_no = dno 
    AND to_date = '9999-01-01'; 
END $$

DELIMITER ;

CALL sp_dept_headcount('d001');
```

| current_headcount |
| :--- |
| 14842 |

-- 3. Create sp_give_raise(dno CHAR(4), pct DECIMAL(5,2)) → increases current salaries in a department by pct percent (for practice; in real life avoid bulk UPDATE in a proc without a WHERE guard).

```sql
DELIMITER $$

CREATE PROCEDURE sp_give_raise(IN dno CHAR(4), IN pct DECIMAL(5,2))
BEGIN
    UPDATE scratch_employees se
    JOIN dept_emp de 
    ON se.emp_no = de.emp_no
    SET se.salary = se.salary * (1 + (pct / 100))
    WHERE de.dept_no = dno 
    AND de.to_date = '9999-01-01'
    AND se.salary IS NOT NULL;
END $$

DELIMITER ;

SELECT 
    se.emp_no, 
    se.first_name, 
    se.last_name, 
    de.dept_no,
    se.salary AS current_salary
FROM scratch_employees se
JOIN dept_emp de 
ON se.emp_no = de.emp_no
WHERE de.dept_no = 'd004' 
AND de.to_date = '9999-01-01'
AND se.salary IS NOT NULL;

CALL sp_give_raise('d004', 5.50);

SELECT 
    se.emp_no, 
    se.first_name, 
    se.last_name, 
    de.dept_no,
    se.salary AS new_salary
FROM scratch_employees se
JOIN dept_emp de 
ON se.emp_no = de.emp_no
WHERE de.dept_no = 'd004' 
AND de.to_date = '9999-01-01'
AND se.salary IS NOT NULL;
```

-- Before raise

| emp_no | first_name | last_name | dept_no | current_salary |
| :--- | :--- | :--- | :--- | :--- |
| 10003 | Parto | Bamford | d004 | 43517 |
| 10004 | Chirstian | Koblick | d004 | 74410 |
| 10018 | Kazuhide | Peha | d004 | 85075 |
| 10020 | Mayuko | Warwick | d004 | 47241 |
| 10024 | Suzette | Pettey | d004 | 97107 |

-- After raise

| emp_no | first_name | last_name | dept_no | new_salary |
| :--- | :--- | :--- | :--- | :--- |
| 10003 | Parto | Bamford | d004 | 45693 |
| 10004 | Chirstian | Koblick | d004 | 78130 |
| 10018 | Kazuhide | Peha | d004 | 89329 |
| 10020 | Mayuko | Warwick | d004 | 49603 |
| 10024 | Suzette | Pettey | d004 | 101962 |

-- 4. Create sp_hires_by_year(y INT) → lists employees hired in year y.

```sql
DELIMITER $$

CREATE PROCEDURE sp_hires_by_year(IN y INT)
BEGIN
    SELECT 
        emp_no, 
        first_name, 
        last_name, 
        hire_date
    FROM employees
    WHERE YEAR(hire_date) = y;    
END $$

DELIMITER ;

CALL sp_hires_by_year(1990);
```

| emp_no | first_name | last_name | hire_date |
| :--- | :--- | :--- | :--- |
| 10011 | Mary | Sluis | 1990-01-22 |
| 10032 | Jeong | Reistad | 1990-06-20 |
| 10037 | Pradeep | Makrucki | 1990-12-05 |
| ... | ... | ... | ... |
| 499978 | Chiranjit | Kuzuoka | 1990-05-24 |
| 499994 | Navin | Argence | 1990-04-24 |
| 499996 | Zito | Baaz | 1990-09-27 |


-- 5. Create sp_top_n_salaries(n INT) → prints the top n current salaries with names and departments.

```sql
DELIMITER $$

CREATE PROCEDURE sp_top_n_salaries(IN n INT)
BEGIN
    -- Set up a user variable to hold the limit value securely
    SET @limit_count = n;

    -- Prepare the dynamic SQL query string with the normalized table joins
    PREPARE stmt FROM '
        SELECT 
            e.emp_no, 
            e.first_name, 
            e.last_name, 
            d.dept_name, 
            s.salary
        FROM employees e
        JOIN salaries s ON e.emp_no = s.emp_no AND s.to_date = \'9999-01-01\'
        LEFT JOIN dept_emp de ON e.emp_no = de.emp_no AND de.to_date = \'9999-01-01\'
        LEFT JOIN departments d ON de.dept_no = d.dept_no
        ORDER BY s.salary DESC
        LIMIT ?';

    EXECUTE stmt USING @limit_count;
    
    DEALLOCATE PREPARE stmt;
END $$

DELIMITER ;

CALL sp_top_n_salaries(10);
```

| emp_no | first_name | last_name | dept_name | salary |
| :--- | :--- | :--- | :--- | :--- |
| 43624 | Tokuyasu | Pesch | Sales | 158220 |
| 254466 | Honesty | Mukaidono | Sales | 156286 |
| 47978 | Xiahua | Whitcomb | Sales | 155709 |
| 253939 | Sanjai | Luders | Sales | 155513 |
| 109334 | Tsutomu | Alameldin | Sales | 155190 |
| 80823 | Willard | Baca | Sales | 154459 |
| 493158 | Lidong | Meriste | Sales | 154376 |
| 205000 | Charmane | Griswold | Sales | 153715 |
| 266526 | Weijing | Chenoweth | Sales | 152710 |
| 237542 | Weicheng | Hatcliff | Sales | 152687 |
