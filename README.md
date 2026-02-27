# SQL Guide
> SQL challenges for deep dives to demonstrate fundamentals and advanced SQL.

# Fundamentals

01. [SELECT](./fundamentals/01_SELECT) | [Script](./fundamentals/01_SELECT/01_SELECT.sql) | [Results](./fundamentals/01_SELECT/RESULTS.md)
02. [SELECT DISTINCT](./fundamentals/02_SELECT_DISTINCT) | [Script](./fundamentals/02_SELECT_DISTINCT/02_SELECT_DISTINCT.sql) | [Results](./fundamentals/02_SELECT_DISTINCT/RESULTS.md)
03. [WHERE](./fundamentals/03_WHERE) | [Script](./fundamentals/03_WHERE/03_WHERE.sql) | [Results](./fundamentals/03_WHERE/RESULTS.md)
04. [ORDER BY](./fundamentals/04_ORDER_BY) | [Script](./fundamentals/04_ORDER_BY/04_ORDER_BY.sql) | [Results](./fundamentals/04_ORDER_BY/RESULTS.md)
05. [AND](./fundamentals/05_AND) | [Script](./fundamentals/05_AND/05_AND.sql) | [Results](./fundamentals/05_AND/RESULTS.md)


## Folder Structure

```
sql_guide/
│
├── README.md                          
├── setup/
│   └── scratch_employees.sql             
├── fundamentals/                     
│   ├── 01_SELECT
│   │    ├── 01_SELECT.sql
│   │    └── RESULTS.md
│   └── 02_SELECT_DISTINCT
└── advanced/                
    ├── 01_JOINS
    │    ├── 01_JOINS.sql
    │    └── RESULTS.md
    └── 02_SUBQUERIES

```

### Quick Install

```bash
# Clone the employees sample data
git clone https://github.com/datacharmer/test_db.git
cd test_db
mysql -u root -p < employees.sql

# Clone this repo
git clone https://github.com/YOUR_USERNAME/sql_guide.git
cd sql_guide

# Create scratch employees table (needed for INSERT/UPDATE/DELETE)
mysql -u root -p employees < setup/scratch_employees.sql
```

## Scratch employees Table Convention

- Challenges that mutate data (`INSERT`, `UPDATE`, `DELETE`) target **`employees.scratch_employees`**
-  **`employees.scratch_employees`** is a lightweight copy that will not affect the canonical dataset. 
- Run `setup/scratch_employees.sql` once before these challenges
- Re-run it any time to reset.

## Contributing

Pull requests welcome. Please open an issue first for significant structural changes.

## License

SQL Guide: MIT.  
The `employees` sample database is © MySQL AB, distributed under the Creative Commons Attribution-Share Alike 3.0 Unported license.
