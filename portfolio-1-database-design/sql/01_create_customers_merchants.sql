
-- Project: FinCore Payments
-- Portfolio 1: Database Design and Modelling
-- Purpose: Create customers and merchants tables
-- Database: PostgreSQL

CREATE TABLE customers (
    customer_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_ref VARCHAR(20) NOT NULL UNIQUE,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE
);

CREATE TABLE merchants (
    merchant_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    merchant_ref VARCHAR(20) NOT NULL UNIQUE,
    business_name VARCHAR(150) NOT NULL,
    status VARCHAR(10) NOT NULL
        CHECK (status IN ('ACTIVE', 'INACTIVE'))
);
