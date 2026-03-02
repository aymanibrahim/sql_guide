# SQL UPDATE  
- Modify the existing records in a table.

### use the student_notes scratch table

## 1. Update any one student_notes row to change note text.

```sql
-- before UPDATE
SELECT * FROM student_notes;
```

| id | note | created_at |
| :--- | :--- | :--- |
| 1 | Finished the SQL WHERE clause exercises | 2026-03-02 10:45:53 |
| 2 | Learning SQL INSERT INTO statement | 2026-03-02 10:49:21 |
| 3 | Reviewing SQL Logical Operators | 2026-03-02 10:49:21 |
| 4 | *NULL* | 2026-03-02 11:00:31 |

```sql
UPDATE  student_notes
SET note = 'Modified: Finished SQL INSERT INTO statement'
WHERE id = 2;

-- after UPDATE
SELECT * FROM student_notes;
```

| id | note | created_at |
| :--- | :--- | :--- |
| 1 | Finished the SQL WHERE clause exercises | 2026-03-02 10:45:53 |
| 2 | Modified: Finished SQL INSERT INTO statement | 2026-03-02 10:49:21 |
| 3 | Reviewing SQL Logical Operators | 2026-03-02 10:49:21 |
| 4 | *NULL* | 2026-03-02 11:00:31 |

## 2. Update all rows where note IS NULL to 'No note provided'.

```sql
UPDATE  student_notes
SET note = 'No note provided'
WHERE note IS NULL;

SELECT * FROM student_notes;
```

| id | note | created_at |
| :--- | :--- | :--- |
| 1 | Finished the SQL WHERE clause exercises | 2026-03-02 10:45:53 |
| 2 | Modified: Finished SQL INSERT INTO statement | 2026-03-02 10:49:21 |
| 3 | Reviewing SQL Logical Operators | 2026-03-02 10:49:21 |
| 4 | No note provided | 2026-03-02 11:00:31 |