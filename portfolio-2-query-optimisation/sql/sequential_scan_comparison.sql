SET enable_indexscan = off;
SET enable_bitmapscan = off;

EXPLAIN ANALYZE
SELECT
    transaction_id,
    status,
    amount
FROM payment_transactions
WHERE status = 'APPROVED';

RESET enable_indexscan;
RESET enable_bitmapscan;
