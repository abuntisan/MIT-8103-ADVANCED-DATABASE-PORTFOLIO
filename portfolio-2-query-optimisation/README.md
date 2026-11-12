# Portfolio 2: Query Processing and Optimisation

## 1. Project Overview

This portfolio investigates SQL query processing and optimisation using the FinCore Payments simulated fintech payment processing platform.

The objective is to retrieve payment information efficiently, examine query execution plans, implement database indexes and evaluate how indexing techniques affect query performance.

The practical implementation uses PostgreSQL and pgAdmin, with SQL scripts, query results and execution-plan evidence maintained in GitHub.

## 2. Objectives

- Write SQL queries for payment transaction analysis.
- Retrieve approved and declined transaction records.
- Analyse transaction volumes, values and response codes.
- Examine query execution plans using `EXPLAIN ANALYZE`.
- Implement suitable single-column and composite database indexes.
- Compare indexed query execution with sequential scanning.
- Evaluate query performance and document optimisation findings.

## 3. Selected Case Study

FinCore Payments is a fictional payment processing platform that stores information about customers, merchants, payment terminals, payment transactions and transaction reversals.

This portfolio uses the relational database designed and implemented in Portfolio 1.

The `payment_transactions` table is the primary focus of the optimisation exercises because it contains transaction amounts, statuses, response codes and timestamps.

## 4. Implementation and Deliverables

The following practical activities have been undertaken:

### 4.1 SQL Query Implementation

SQL queries were developed and executed to investigate:

- Transaction summaries.
- Merchant performance.
- Declined transaction analysis.
- Transaction currency analysis.
- Completed transaction reversals.
- Transaction status and response-code distributions.

### 4.2 Database Indexing

Single-column and composite indexing techniques were examined.

The composite index created was:

```sql
CREATE INDEX idx_payment_transactions_status_amount
ON payment_transactions(status, amount);
```

The existing single-column index on `status` was also investigated.

### 4.3 Query Execution Plan Analysis

PostgreSQL execution plans were examined using `EXPLAIN ANALYZE`.

The practical exercises demonstrated:

- Bitmap Index Scan.
- Bitmap Heap Scan.
- Sequential Scan.

The execution plans were used to investigate how PostgreSQL accesses transaction records under different query conditions.

### 4.4 Performance Comparison

An indexed query and a sequential scan were compared using the same status-based filtering condition.

The observed results were:

| Metric | Indexed Execution | Sequential Scan |
|---|---:|---:|
| Execution method | Bitmap Index Scan | Sequential Scan |
| Records returned | 1,672 | 1,672 |
| Planning time | 0.195 ms | 0.192 ms |
| Execution time | 0.855 ms | 1.108 ms |

The indexed execution recorded a lower execution time in the observed test.

### 4.5 GitHub Deliverables

The portfolio contains:

- SQL query scripts.
- Query result screenshots.
- Indexing and execution-plan evidence.
- Sequential scan comparison evidence.
- Query performance comparison documentation.
- Indexing and optimisation technical analysis.

## 5. Tools and Technologies

- PostgreSQL 18
- pgAdmin
- SQL
- GitHub

## 6. Progress

**Status: In Progress**

The practical implementation has commenced.

The relational database and sample transaction data from Portfolio 1 have been verified. Analytical SQL queries have been executed, and single-column and composite indexing techniques have been investigated.

Execution plans have also been examined to understand PostgreSQL's use of bitmap index scans, bitmap heap scans and sequential scans.

Performance comparison results and technical optimisation findings have been documented.

Further review and consolidation of the portfolio deliverables remain outstanding.

## 7. Technical Reflection

The practical exercise provided experience in SQL query analysis, database indexing and PostgreSQL query execution plans.

One important observation was that PostgreSQL used the composite index when the query filtered on both transaction status and amount. For a query filtering only on transaction status, PostgreSQL used the existing single-column index.

The execution-plan investigation also demonstrated the difference between bitmap-based index access and sequential scanning.

In the performance comparison, the indexed execution recorded an execution time of 0.855 ms, while the sequential scan recorded 1.108 ms. This represented an observed execution-time reduction of approximately 22.8%.

The experiment demonstrated that indexing can improve query execution for suitable filtering conditions. However, execution times may vary depending on dataset size, caching and the database query planner's decisions.

Overall, the exercise improved practical understanding of PostgreSQL indexing, execution-plan interpretation and query optimisation.

## 8. Repository Evidence

Practical implementation scripts and supporting evidence are maintained in the following directories:

- `sql/` – SQL implementation scripts.
- `results/` – Query outputs and execution-plan screenshots.

Additional technical documentation is maintained in the Portfolio 2 directory.
