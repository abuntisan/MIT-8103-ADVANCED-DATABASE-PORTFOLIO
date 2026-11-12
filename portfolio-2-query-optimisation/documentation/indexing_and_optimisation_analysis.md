# Indexing and Query Optimisation Analysis

## 1. Introduction

This analysis examines the application of indexing techniques and query execution strategies in the FinCore Payments database. The practical investigation was conducted using PostgreSQL and focused on the `payment_transactions` table.

The objective was to understand how single-column and composite indexes influence query execution and how PostgreSQL selects different execution strategies based on query conditions.

## 2. Indexing Implementation

Two indexes were examined during the practical exercise.

### 2.1 Single-Column Index

The existing single-column index was:

```sql
CREATE INDEX idx_payment_transactions_status
ON payment_transactions(status);
```

This index supports queries that filter payment transactions using the `status` column.

### 2.2 Composite Index

A composite index was created using the `status` and `amount` columns.

```sql
CREATE INDEX idx_payment_transactions_status_amount
ON payment_transactions(status, amount);
```

The composite index was designed to support queries that filter using both transaction status and transaction amount.

PostgreSQL confirmed the existence of both indexes through the `pg_indexes` system catalogue.

## 3. Query Execution Plan Analysis

### 3.1 Composite Index Execution

The following query was executed:

```sql
EXPLAIN ANALYZE
SELECT
    transaction_id,
    status,
    amount
FROM payment_transactions
WHERE status = 'APPROVED'
  AND amount > 5000;
```

PostgreSQL selected a Bitmap Index Scan using `idx_payment_transactions_status_amount`, followed by a Bitmap Heap Scan.

The query returned 336 records, with an observed execution time of 1.320 ms and planning time of 0.142 ms.

This demonstrated that PostgreSQL could utilise the composite index to evaluate both filtering conditions.

### 3.2 Single-Column Index Execution

The next query filtered transactions using only the status column:

```sql
EXPLAIN ANALYZE
SELECT
    transaction_id,
    status,
    amount
FROM payment_transactions
WHERE status = 'APPROVED';
```

PostgreSQL selected a Bitmap Index Scan using `idx_payment_transactions_status`, followed by a Bitmap Heap Scan.

The query returned 1,672 records, with an observed execution time of 0.855 ms and planning time of 0.195 ms.

This demonstrated the use of the single-column index for a query that filtered only by transaction status.

### 3.3 Sequential Scan Execution

To examine sequential scanning behaviour, index and bitmap scans were temporarily disabled for the current database session.

The same status-only query was executed using `EXPLAIN ANALYZE`.

PostgreSQL selected a Sequential Scan on the `payment_transactions` table.

The query returned 1,672 records and removed 3,338 records through filtering. The observed execution time was 1.108 ms, while planning time was 0.192 ms.

The original query-planner settings were restored using the `RESET` commands.

## 4. Performance Comparison

The indexed and sequential executions of the status-only query produced the following results:

| Metric | Indexed Execution | Sequential Scan |
|---|---:|---:|
| Execution method | Bitmap Index Scan | Sequential Scan |
| Records returned | 1,672 | 1,672 |
| Planning time | 0.195 ms | 0.192 ms |
| Execution time | 0.855 ms | 1.108 ms |

The indexed execution recorded an execution time of 0.855 ms, compared with 1.108 ms for the sequential scan.

This represents an observed execution-time reduction of approximately 22.8%.

The result indicates that the indexed execution was faster in the measured test. However, the measurements represent individual executions and may be affected by cache conditions, system activity and other database factors.

## 5. Technical Observations

The practical exercise demonstrated three important PostgreSQL execution strategies:

1. **Bitmap Index Scan:** PostgreSQL uses an index to identify the locations of matching records.
2. **Bitmap Heap Scan:** PostgreSQL retrieves the matching records from the table using the bitmap information.
3. **Sequential Scan:** PostgreSQL examines table records and applies the specified filter.

The experiment also demonstrated that single-column and composite indexes support different filtering requirements.

The composite index was used when the query filtered on both `status` and `amount`, while the single-column index was used when filtering only on `status`.

## 6. Limitations

The `payment_transactions` table contained 5,010 records during the experiment. Although this provided sufficient data for practical SQL and execution-plan analysis, it represents a relatively small dataset for evaluating database performance at scale.

The execution-time measurements were individual observations rather than results from repeated controlled benchmarks. Consequently, the observed performance difference should not be interpreted as a guaranteed improvement under all workloads.

Further testing with larger datasets and repeated measurements would provide additional insight into indexing performance.

## 7. Conclusion

The indexing and query optimisation exercise demonstrated how PostgreSQL uses available indexes to execute queries and how sequential scanning provides an alternative execution strategy.

The practical results showed that the composite index supported queries involving transaction status and amount, while the single-column index supported status-based filtering.

The comparison of indexed and sequential execution also demonstrated an observed performance advantage for the indexed query in the tested environment.

Overall, the exercise provided practical experience in index creation, execution-plan interpretation and database query performance analysis.
