-- Portfolio 3: READ COMMITTED Isolation Demonstration
-- Case Study: FinCore Payments

-- Session A
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

SELECT *
FROM public.transaction_lab
WHERE account_id = 1;

-- Session B (execute in a separate Query Tool)
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

UPDATE public.transaction_lab
SET balance = balance - 5000
WHERE account_id = 1;

SELECT *
FROM public.transaction_lab
WHERE account_id = 1;

-- Session A: Run SELECT again while Session B is uncommitted
SELECT *
FROM public.transaction_lab
WHERE account_id = 1;

-- Session B: Commit the update
COMMIT;

-- Session A: Run SELECT again after Session B commits
SELECT *
FROM public.transaction_lab
WHERE account_id = 1;

-- Session A: Close transaction
COMMIT;

-- Verify final balances
SELECT *
FROM public.transaction_lab
ORDER BY account_id;
