# Query Performance Analysis

## Objective

The purpose of this exercise was to examine how PostgreSQL executes a query before and after creating an index.

## Test Query

The query retrieves transactions with a DECLINED status from the payment_transactions table.

## Before Indexing

PostgreSQL used a Sequential Scan to examine the transaction table.

- Execution time: 1.133 ms
- Rows returned: 1,669
- Rows removed by filter: 3,341

## After Indexing

An index named `idx_payment_transactions_status` was created on the status column.

PostgreSQL then used a Bitmap Index Scan followed by a Bitmap Heap Scan.

- Execution time: 0.837 ms
- Rows returned: 1,669

## Performance Comparison

The execution time reduced from 1.133 ms to 0.837 ms, representing an observed improvement of approximately 26.1%.

## Conclusion

This exercise helped me understand how indexes influence query execution in PostgreSQL. The index allowed PostgreSQL to locate declined transactions using an index rather than performing a full sequential scan.

The results show that indexing can improve query performance, although the actual benefit depends on the dataset and query conditions.
