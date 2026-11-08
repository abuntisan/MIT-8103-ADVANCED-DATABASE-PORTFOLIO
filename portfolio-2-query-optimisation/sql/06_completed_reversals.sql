-- Query 5: Completed Transaction Reversals

SELECT
    r.reversal_ref,
    p.transaction_ref,
    r.amount AS reversal_amount,
    r.reason,
    r.status,
    r.reversal_time
FROM transaction_reversals r
JOIN payment_transactions p
    ON r.transaction_id = p.transaction_id
WHERE r.status = 'COMPLETED'
ORDER BY r.reversal_time DESC;
