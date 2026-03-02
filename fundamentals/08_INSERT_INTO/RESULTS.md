-- SQL INSERT INTO  
-- Adding new records to a table.

USE employees;

-- use a scratch table to avoid polluting the dataset
-- Create a personal scratch table

```sql
CREATE TABLE IF NOT EXISTS student_notes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  note VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
```

-- 1. Insert one row into student_notes with a custom note.

```sql
INSERT INTO student_notes (note)
VALUES ("Finished the SQL WHERE clause exercises");

SELECT * FROM student_notes;
```
| id | note | created_at |
| :--- | :--- | :--- |
| 1 | Finished the SQL WHERE clause exercises | 2026-03-02 08:12:43 |

-- 2. Insert two rows in a single statement into student_notes.

```sql
INSERT INTO student_notes (note)
VALUES 
("Learning SQL INSERT INTO statement"),
("Reviewing SQL Logical Operators");

SELECT * FROM student_notes;
```

| id | note | created_at |
| :--- | :--- | :--- |
| 1 | Finished the SQL WHERE clause exercises | 2026-03-02 08:12:43 |
| 2 | Learning SQL INSERT INTO statement | 2026-03-02 08:21:48 |
| 3 | Reviewing SQL Logical Operators | 2026-03-02 08:21:48 |
