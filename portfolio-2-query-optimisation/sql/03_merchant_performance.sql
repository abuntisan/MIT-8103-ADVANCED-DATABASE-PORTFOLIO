-- Query 2: Merchant Transaction Performance

SELECT
    m.merchant_ref,
    m.business_name,
    COUNT(pt.transaction_id) AS total_transactions,
    COUNT(CASE WHEN pt.status = 'APPROVED' THEN 1 END) AS approved_transactions,
    COUNT(CASE WHEN pt.status = 'DECLINED' THEN 1 END) AS declined_transactions,
    COALESCE(SUM(pt.amount), 0) AS total_transaction_amount
FROM merchants m
LEFT JOIN payment_terminals t
    ON m.merchant_id = t.merchant_id
LEFT JOIN payment_transactions pt
    ON t.terminal_id = pt.terminal_id
GROUP BY
    m.merchant_id,
    m.merchant_ref,
    m.business_name
ORDER BY total_transactions DESC;
