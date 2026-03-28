# SQL LIKE
- used in a WHERE clause to search for a specified pattern in a column using wildcards.

## 1. Find all employees whose first_name starts with 'Al'.

```sql
SELECT DISTINCT(first_name)
FROM employees
WHERE first_name LIKE 'Al%';
```

| first_name |
| :--- |
| Alain |
| Alejandro |
| Aleksandar |
| ... |

## 2. Find employees whose last_name ends with 'son'.

```sql
SELECT DISTINCT(last_name)
FROM employees
WHERE last_name LIKE '%son';
```

| last_name |
| :--- |
| Haraldson |
| Peltason |
| Casperson |
| ... |

## 3.List employees whose first_name contains the substring 'mar'.

```sql
SELECT DISTINCT(first_name)
FROM employees
WHERE first_name LIKE '%mar%';
```

| first_name |
| :--- |
| Mary |
| Otmar |
| Margareta |
| ... |

## 4.Show all employees whose last_name has exactly 5 characters.

```sql
SELECT DISTINCT(last_name)
FROM employees
WHERE last_name LIKE '_____';
```

| last_name |
| :--- |
| Sluis |
| Genin |
| Merlo |
| ... |