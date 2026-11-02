
-- FinCore Payments
-- Portfolio 2: Transaction Summary Analysis
-- Objective: Count transactions and calculate total amount by status.

SELECT
    status,
    COUNT(*) AS total_transactions,
    SUM(amount) AS total_amount
FROM payment_transactions
GROUP BY status
ORDER BY status;
