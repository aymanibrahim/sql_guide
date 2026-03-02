





-- SQL DELETE
-- use the studen_notes scratch table

USE employees;

-- 1. Delete all rows where note = 'No note provided'.

-- before DELETE
SELECT * FROM student_notes;

DELETE FROM student_notes
WHERE note = 'No note provided';

-- after DELETE
SELECT * FROM student_notes;


-- 2. Delete the latest row (max id) from student_notes.

DELETE FROM student_notes
ORDER BY id DESC
LIMIT 1;

-- after DELETE
SELECT * FROM student_notes;