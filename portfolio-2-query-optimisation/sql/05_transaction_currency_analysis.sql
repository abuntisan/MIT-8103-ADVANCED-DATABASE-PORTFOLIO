--Transaction Volume and Value by Currency
SELECT
    currency,
    COUNT(*) AS total_transactions,
    SUM(amount) AS total_transaction_amount,
    AVG(amount) AS average_transaction_amount
FROM payment_transactions
GROUP BY currency
ORDER BY total_transaction_amount DESC;
