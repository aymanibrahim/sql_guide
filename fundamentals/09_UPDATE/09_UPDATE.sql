


-- SQL UPDATE  
-- use the student_notes scratch table

USE employees;


-- 1. Update any one student_notes row to change note text.

UPDATE  student_notes
SET note = NULL
WHERE id = 2;

SELECT * FROM student_notes;

-- 2. Update all rows where note IS NULL to 'No note provided'.

UPDATE  student_notes
SET note = 'No note provided'
WHERE note IS NULL;

SELECT * FROM student_notes;