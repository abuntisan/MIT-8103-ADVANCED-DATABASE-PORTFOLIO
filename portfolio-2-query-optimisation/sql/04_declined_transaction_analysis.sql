-- Query 3: Declined Transaction Analysis

SELECT
    transaction_ref,
    amount,
    currency,
    response_code,
    transaction_time
FROM payment_transactions
WHERE status = 'DECLINED'
ORDER BY amount DESC;
