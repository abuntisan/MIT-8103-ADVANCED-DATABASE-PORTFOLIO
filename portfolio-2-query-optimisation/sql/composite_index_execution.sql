EXPLAIN ANALYZE
SELECT
    transaction_id,
    status,
    amount
FROM payment_transactions
WHERE status = 'APPROVED'
  AND amount > 5000
