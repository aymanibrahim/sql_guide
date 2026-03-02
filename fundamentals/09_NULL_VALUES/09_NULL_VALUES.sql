-- SQL NULL VALUES  
-- the sample employees DB rarely stores NULLs
-- use the student_notes scratch table)

USE employees;

-- 1. Insert a row into student_notes with note = NULL.

-- before insert NULL
SELECT * FROM student_notes;

INSERT INTO student_notes (note)
VALUES(NULL);

-- after insert NULL
SELECT * FROM student_notes;

-- 2. Select only rows where note IS NULL.

SELECT * FROM student_notes
WHERE note IS NULL;

-- 3. Select only rows where note IS NOT NULL.

SELECT * FROM student_notes
WHERE note IS NOT NULL;