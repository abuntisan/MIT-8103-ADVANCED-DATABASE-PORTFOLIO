# Query Performance Comparison

## 1. Objective

This experiment evaluated the execution behaviour of an indexed query and a sequential scan in the FinCore Payments PostgreSQL database.

The same SQL query was used in both tests to retrieve approved payment transactions.

## 2. Test Query

SELECT
    transaction_id,
    status,
    amount
FROM payment_transactions
WHERE status = 'APPROVED';


## 3. Performance Results

The execution results from both tests are presented below:

| Metric | Indexed Execution | Sequential Scan |
|---|---:|---:|
| Execution method | Bitmap Index Scan | Sequential Scan |
| Records returned | 1,672 | 1,672 |
| Planning time | 0.195 ms | 0.192 ms |
| Execution time | 0.855 ms | 1.108 ms |



## 4. Analysis

The indexed execution used the existing single-column index, `idx_payment_transactions_status`, through a Bitmap Index Scan followed by a Bitmap Heap Scan.

The sequential scan examined the payment_transactions table and applied a filter to identify records with an APPROVED status.

Both execution methods returned 1,672 records. However, the indexed execution recorded an execution time of 0.855 ms, compared with 1.108 ms for the sequential scan.

This represents an observed execution-time reduction of approximately 22.8% for the indexed execution.

The result demonstrates how indexing can improve data retrieval for queries that filter on indexed columns. However, the measurements represent individual executions on a relatively small dataset and may vary depending on cache conditions, system load and PostgreSQL's query planner decisions.

## 5. Conclusion

The experiment demonstrated the practical role of indexing in PostgreSQL query optimisation. The indexed execution was faster in the observed test, while the sequential scan provided a useful baseline for comparison.

The results also demonstrate that PostgreSQL can use different execution strategies depending on the available indexes and query conditions.
