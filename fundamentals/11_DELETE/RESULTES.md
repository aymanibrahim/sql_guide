# SQL DELETE
- Remove existing records from a table.
### use the student_notes scratch table

## 1. Delete all rows where note = 'No note provided'.
```sql
-- before DELETE
SELECT * FROM student_notes;
```

| id | note | created_at |
| :--- | :--- | :--- |
| 1 | Finished the SQL WHERE clause exercises | 2026-03-02 10:45:53 |
| 2 | Modified: Finished SQL INSERT INTO statement | 2026-03-02 10:49:21 |
| 3 | Reviewing SQL Logical Operators | 2026-03-02 10:49:21 |
| 4 | No note provided | 2026-03-02 11:00:31 |

```sql
DELETE FROM student_notes
WHERE note = 'No note provided';
```

```sql
-- after DELETE
SELECT * FROM student_notes;
```

| id | note | created_at |
| :--- | :--- | :--- |
| 1 | Finished the SQL WHERE clause exercises | 2026-03-02 10:45:53 |
| 2 | Modified: Finished SQL INSERT INTO statement | 2026-03-02 10:49:21 |
| 3 | Reviewing SQL Logical Operators | 2026-03-02 10:49:21 |


## 2. Delete the latest row (max id) from student_notes.

```sql
DELETE FROM student_notes
ORDER BY id DESC
LIMIT 1;
```

```sql
-- after DELETE
SELECT * FROM student_notes;
```

| id | note | created_at |
| :--- | :--- | :--- |
| 1 | Finished the SQL WHERE clause exercises | 2026-03-02 10:45:53 |
| 2 | Modified: Finished SQL INSERT INTO statement | 2026-03-02 10:49:21 |
