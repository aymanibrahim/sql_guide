# SQL Guide
> SQL challenges for deep dives to demonstrate fundamentals and advanced SQL.

# Fundamentals

01. [SELECT](./fundamentals/01_SELECT) | [Script](./fundamentals/01_SELECT/01_SELECT.sql) | [Results](./fundamentals/01_SELECT/RESULTS.md)
02. [SELECT DISTINCT](./fundamentals/02_SELECT_DISTINCT) | [Script](./fundamentals/02_SELECT_DISTINCT/02_SELECT_DISTINCT.sql) | [Results](./fundamentals/02_SELECT_DISTINCT/RESULTS.md)
03. [WHERE](./fundamentals/03_WHERE) | [Script](./fundamentals/03_WHERE/03_WHERE.sql) | [Results](./fundamentals/03_WHERE/RESULTS.md)
04. [ORDER BY](./fundamentals/04_ORDER_BY) | [Script](./fundamentals/04_ORDER_BY/04_ORDER_BY.sql) | [Results](./fundamentals/04_ORDER_BY/RESULTS.md)
05. [AND](./fundamentals/05_AND) | [Script](./fundamentals/05_AND/05_AND.sql) | [Results](./fundamentals/05_AND/RESULTS.md)
06. [OR](./fundamentals/06_OR) | [Script](./fundamentals/06_OR/06_OR.sql) | [Results](./fundamentals/06_OR/RESULTS.md)
07. [NOT](./fundamentals/07_NOT) | [Script](./fundamentals/07_NOT/07_NOT.sql) | [Results](./fundamentals/07_NOT/RESULTS.md)
08. [INSERT INTO](./fundamentals/08_INSERT_INTO) | [Script](./fundamentals/08_INSERT_INTO/08_INSERT_INTO.sql) | [Results](./fundamentals/08_INSERT_INTO/RESULTS.md)
09. [NULL VALUES](./fundamentals/09_NULL_VALUES) | [Script](./fundamentals/09_NULL_VALUES/09_NULL_VALUES.sql) | [Results](./fundamentals/09_NULL_VALUES/RESULTS.md)
10. [UPDATE](./fundamentals/10_UPDATE) | [Script](./fundamentals/10_UPDATE/10_UPDATE.sql) | [Results](./fundamentals/10_UPDATE/RESULTS.md)
11. [DELETE](./fundamentals/11_DELETE) | [Script](./fundamentals/11_DELETE/11_DELETE.sql) | [Results](./fundamentals/11_DELETE/RESULTS.md)
12. [LIMIT](./fundamentals/12_LIMIT) | [Script](./fundamentals/12_LIMIT/12_LIMIT.sql) | [Results](./fundamentals/12_LIMIT/RESULTS.md)
13. [AGGREGATE FUNCTIONS](./fundamentals/13_AGGREGATE_FUNCTIONS) | [Script](./fundamentals/13_AGGREGATE_FUNCTIONS/13_AGGREGATE_FUNCTIONS.sql) | [Results](./fundamentals/13_AGGREGATE_FUNCTIONS/RESULTS.md)
14. [MIN and MAX](./fundamentals/14_MIN_MAX) | [Script](./fundamentals/14_MIN_MAX/14_MIN_MAX.sql) | [Results](./fundamentals/14_MIN_MAX/RESULTS.md)
15. [COUNT](./fundamentals/15_COUNT) | [Script](./fundamentals/15_COUNT/15_COUNT.sql) | [Results](./fundamentals/15_COUNT/RESULTS.md)
16. [SUM](./fundamentals/16_SUM) | [Script](./fundamentals/16_SUM/16_SUM.sql) | [Results](./fundamentals/16_SUM/RESULTS.md)
17. [AVG](./fundamentals/17_AVG) | [Script](./fundamentals/17_AVG/17_AVG.sql) | [Results](./fundamentals/17_AVG/RESULTS.md)

# Advanced

01. [Joins Basics](./advanced/01_JOINS) | [Script](./advanced/01_JOINS/01_JOINS.sql) | [Results](./advanced/01_JOINS/RESULTS.md)
02. [Aggregation + Join](./advanced/02_AGGREGATION_JOINS) | [Script](./advanced/02_AGGREGATION_JOINS/02_AGGREGATION_JOINS.sql) | [Results](./advanced/02_AGGREGATION_JOINS/RESULTS.md)
03. [Filtering Logic](./advanced/03_FILTERING_LOGIC) | [Script](./advanced/03_FILTERING_LOGIC/03_FILTERING_LOGIC.sql) | [Results](./advanced/03_FILTERING_LOGIC/RESULTS.md)
04. [Subqueries](./advanced/04_SUBQUERIES) | [Script](./advanced/04_SUBQUERIES/04_SUBQUERIES.sql) | [Results](./advanced/04_SUBQUERIES/RESULTS.md)
05. [Top-N patterns](./advanced/05_TOP_N) | [Script](./advanced/05_TOP_N/05_TOP_N.sql) | [Results](./advanced/05_TOP_N/RESULTS.md)
06. [Date Logic](./advanced/06_DATE_LOGIC) | [Script](./advanced/06_DATE_LOGIC/06_DATE_LOGIC.sql) | [Results](./advanced/06_DATE_LOGIC/RESULTS.md)
07. [Data Quality](./advanced/07_DATA_QUALITY) | [Script](./advanced/07_DATA_QUALITY/07_DATA_QUALITY.sql) | [Results](./advanced/07_DATA_QUALITY/RESULTS.md)
08. [LIKE](./advanced/08_LIKE) | [Script](./advanced/08_LIKE/08_LIKE.sql) | [Results](./advanced/08_LIKE/RESULTS.md)
09. [WILDCARDS](./advanced/09_WILDCARDS) | [Script](./advanced/09_WILDCARDS/09_WILDCARDS.sql) | [Results](./advanced/09_WILDCARDS/RESULTS.md)
10. [IN](./advanced/10_IN) | [Script](./advanced/10_IN/10_IN.sql) | [Results](./advanced/10_IN/RESULTS.md)

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
