
-- Project: FinCore Payments
-- Portfolio 1: Database Design and Modelling
-- Purpose: Create terminals, transactions, and reversals

CREATE TABLE payment_terminals (
    terminal_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    merchant_id INTEGER NOT NULL
        REFERENCES merchants(merchant_id),
    terminal_code VARCHAR(30) NOT NULL UNIQUE,
    status VARCHAR(10) NOT NULL
        CHECK (status IN ('ACTIVE', 'INACTIVE'))
);

CREATE TABLE payment_transactions (
    transaction_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    terminal_id INTEGER NOT NULL
        REFERENCES payment_terminals(terminal_id),
    customer_id INTEGER
        REFERENCES customers(customer_id),
    transaction_ref VARCHAR(40) NOT NULL UNIQUE,
    amount NUMERIC(12, 2) NOT NULL CHECK (amount > 0),
    currency CHAR(3) NOT NULL,
    response_code VARCHAR(10),
    status VARCHAR(10) NOT NULL
        CHECK (status IN ('APPROVED', 'DECLINED', 'PENDING')),
    transaction_time TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE transaction_reversals (
    reversal_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    transaction_id BIGINT NOT NULL
        REFERENCES payment_transactions(transaction_id),
    reversal_ref VARCHAR(40) NOT NULL UNIQUE,
    amount NUMERIC(12, 2) NOT NULL CHECK (amount > 0),
    reason VARCHAR(200),
    status VARCHAR(10) NOT NULL
        CHECK (status IN ('PENDING', 'COMPLETED', 'FAILED')),
    reversal_time TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);
