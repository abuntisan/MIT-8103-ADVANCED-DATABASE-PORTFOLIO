BEGIN;

UPDATE public.transaction_lab
SET balance = balance - 10000
WHERE account_id = 1;

UPDATE public.transaction_lab
SET balance = balance + 10000
WHERE account_id = 2;

-- Verify balances before committing
SELECT *
FROM public.transaction_lab
ORDER BY account_id;

COMMIT;

-- Verify persisted balances
SELECT *
FROM public.transaction_lab
ORDER BY account_id;
