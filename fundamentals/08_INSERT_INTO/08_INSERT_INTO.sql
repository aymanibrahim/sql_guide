-- SQL INSERT INTO  

USE employees;

-- use a scratch table to avoid polluting the dataset
-- Create a personal scratch table:

CREATE TABLE IF NOT EXISTS student_notes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  note VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

-- 1. Insert one row into student_notes with a custom note.

INSERT INTO student_notes (note)
VALUES ("Finished the SQL WHERE clause exercises");

SELECT * FROM student_notes;

-- 2. Insert two rows in a single statement into student_notes.

INSERT INTO student_notes (note)
VALUES 
("Learning SQL INSERT INTO statement"),
("Reviewing SQL Logical Operators");

SELECT * FROM student_notes;