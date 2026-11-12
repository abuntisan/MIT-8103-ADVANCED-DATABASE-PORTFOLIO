CREATE TABLE public.transaction_lab (
    account_id INTEGER PRIMARY KEY,
    account_name VARCHAR(100) NOT NULL,
    balance NUMERIC(12,2) NOT NULL
        CHECK (balance >= 0)
);

INSERT INTO public.transaction_lab
    (account_id, account_name, balance)
VALUES
    (1, 'FinCore Merchant A', 50000.00),
    (2, 'FinCore Merchant B', 30000.00);

SELECT *
FROM public.transaction_lab
ORDER BY account_id;
