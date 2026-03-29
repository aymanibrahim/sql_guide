# SQL WILDCARDS
- search for specific patterns within the column data using special characters with the LIKE operator.

## 1. Find employees whose first_name is 2 letters only, like 'Jo' or 'Li'.

```sql
SELECT first_name
FROM employees
WHERE first_name LIKE '__';
```

| first_name |
| :--- |
| (null) |

## 2. List employees whose last_name starts with 'K' and has any 6 characters total.

```sql
SELECT DISTINCT(last_name)
FROM employees
WHERE last_name LIKE 'K_____';
```

| last_name |
| :--- |
| Klerer |
| Kakkad |
| Kolvik |
| ... |
| Kuszyk |
| Krybus |
| Karnin |

## 3. Find all employees whose first_name has '__a%' (3rd letter is a).

```sql
SELECT DISTINCT(first_name)
FROM employees
WHERE first_name LIKE '__a%';
```

| first_name |
| :--- |
| Duangkaew |
| Shahaf |
| Prasadram |
| ... |
| Leandro |
| Jiang |
| Khaled |

