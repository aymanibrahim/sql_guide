## SQL NULL VALUES  
- NULL value represents a missing, unknown, or inapplicable piece of data in a table.

### the sample employees DB rarely stores NULLs
### use the student_notes scratch table

## 1. Insert a row into student_notes with note = NULL.

```sql
-- before insert NULL
SELECT * FROM student_notes;
```

| id | note | created_at |
| :--- | :--- | :--- |
| 1 | Finished the SQL WHERE clause exercises | 2026-03-02 10:45:53 |
| 2 | Learning SQL INSERT INTO statement | 2026-03-02 10:49:21 |
| 3 | Reviewing SQL Logical Operators | 2026-03-02 10:49:21 |

```sql
INSERT INTO student_notes (note)
VALUES(NULL);
```

```sql
-- after insert NULL
SELECT * FROM student_notes;
```
| id | note | created_at |
| :--- | :--- | :--- |
| 1 | Finished the SQL WHERE clause exercises | 2026-03-02 10:45:53 |
| 2 | Learning SQL INSERT INTO statement | 2026-03-02 10:49:21 |
| 3 | Reviewing SQL Logical Operators | 2026-03-02 10:49:21 |
| 4 | *NULL* | 2026-03-02 11:00:31 |

## 2. Select only rows where note IS NULL.

```sql
SELECT * FROM student_notes
WHERE note IS NULL;
```

| id | note | created_at |
| :--- | :--- | :--- |
| 4 | *NULL* | 2026-03-02 11:00:31 |

## 3. Select only rows where note IS NOT NULL.

```sql
SELECT * FROM student_notes
WHERE note IS NOT NULL;
```

| id | note | created_at |
| :--- | :--- | :--- |
| 1 | Finished the SQL WHERE clause exercises | 2026-03-02 10:45:53 |
| 2 | Learning SQL INSERT INTO statement | 2026-03-02 10:49:21 |
| 3 | Reviewing SQL Logical Operators | 2026-03-02 10:49:21 |
