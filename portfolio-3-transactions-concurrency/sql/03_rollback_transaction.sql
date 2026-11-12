BEGIN;

UPDATE public.transaction_lab
SET balance = balance - 15000
WHERE account_id = 1;

UPDATE public.transaction_lab
SET balance = balance + 15000
WHERE account_id = 2;

-- Check temporary changes
SELECT *
FROM public.transaction_lab
ORDER BY account_id;

-- Cancel the transaction
ROLLBACK;

-- Verify original committed balances remain
SELECT *
FROM public.transaction_lab
ORDER BY account_id;
