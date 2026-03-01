# SQL NOT

- The NOT operator is used to filter records that do not meet a specific condition.
- It displays a record if the condition(s) is FALSE.

## 1. Show employees not of gender 'M'.

```sql
SELECT *
FROM employees
WHERE NOT gender = 'M';
```
| emp_no | birth_date | first_name | last_name | gender | hire_date |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 10002 | 1964-06-02 | Bezalel | Simmel | F | 1985-11-21 |
| 10006 | 1953-04-20 | Anneke | Preusig | F | 1989-06-02 |
| 10007 | 1957-05-23 | Tzvetan | Zielinski | F | 1989-02-10 |
| ... | ... | ... | ... | ... | ... |
| 12585 | 1957-06-21 | Kotesh | Masada | F | 1988-12-22 |
| 12594 | 1958-09-25 | Thanasis | Ranst | F | 1993-06-21 |
| 12597 | 1952-09-07 | Kazuhito | Petereit | F | 1991-10-23 |
| ... | ... | ... | ... | ... | ... |

## 2. Show departments whose name does not contain the word 'Sales'.

```sql
SELECT *
FROM departments
WHERE NOT dept_name = 'Sales';
```

| dept_no | dept_name |
| :--- | :--- |
| d009 | Customer Service |
| d005 | Development |
| d002 | Finance |
| d003 | Human Resources |
| d001 | Marketing |
| d004 | Production |
| d006 | Quality Management |
| d008 | Research |