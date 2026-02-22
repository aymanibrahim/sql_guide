-- =============================================================
-- setup/scratch_employees.sql
-- Run once before INSERT / UPDATE / DELETE challenges.
-- Re-run any time to reset to a clean state.
-- =============================================================

USE employees;

DROP TABLE IF EXISTS scratch_employees;

CREATE TABLE scratch_employees (
    emp_no       INT            NOT NULL,
    birth_date   DATE           NOT NULL,
    first_name   VARCHAR(14)    NOT NULL,
    last_name    VARCHAR(16)    NOT NULL,
    gender       ENUM('M','F')  NOT NULL,    
    hire_date    DATE           NULL,
    salary       INT            NULL,
    PRIMARY KEY (emp_no)
);

-- Seed with a small, representative sample from employees
INSERT INTO scratch_employees (emp_no, birth_date, first_name, last_name, gender, hire_date, salary)
SELECT
    e.emp_no,
    e.birth_date,
    e.first_name,
    e.last_name,
    e.gender,
    e.hire_date,
    s.salary
FROM employees e
JOIN salaries  s 
ON s.emp_no = e.emp_no AND s.to_date = '9999-01-01'
LIMIT 20;

-- Leave some rows with NULL hire_date and salary to support NULL-value challenges
INSERT INTO scratch_employees (emp_no, birth_date, first_name, last_name, gender, hire_date, salary)
VALUES
    (9999901,'1960-06-15', 'Alice', 'Testuser', 'F', NULL, NULL),
    (9999902,'1972-03-05', 'Bob', 'Example',  'M', '2021-03-01', NULL),
    (9999903,'1983-02-15', 'Charlie', 'Demo', 'M', NULL, 55000);

SELECT 'scratch_employees ready' AS status, COUNT(*) AS row_count
FROM scratch_employees;
