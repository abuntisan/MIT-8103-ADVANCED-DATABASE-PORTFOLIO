
-- Portfolio 3: Row-Level Locking Demonstration
-- Case Study: FinCore Payments

-- SESSION A:
-- Acquire a row-level lock on Merchant A.
BEGIN;

SELECT *
FROM public.transaction_lab
WHERE account_id = 1
FOR UPDATE;

-- Keep Session A open.
-- Release the lock only after Session B is waiting.
-- COMMIT;






-- SESSION B:
-- Attempt to update the locked Merchant A account.

BEGIN;

UPDATE public.transaction_lab
SET balance = balance - 2000
WHERE account_id = 1;

-- This UPDATE waits until Session A releases its lock.

COMMIT;

-- Verify final account balances.
SELECT *
FROM public.transaction_lab
ORDER BY account_id;
