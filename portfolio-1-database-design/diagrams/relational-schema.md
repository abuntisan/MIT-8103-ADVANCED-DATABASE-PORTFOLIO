# FinCore Payments — Relational Schema

## 1. Introduction
For this project, I designed a database called FinCore Payments. It is a simulated payment-processing system that keeps records of customers, merchants, payment terminals, transactions, and transaction reversals.
I divided the database into five tables so that each table handles a specific part of the system. This makes the data easier to manage and helps reduce unnecessary duplication. I also used primary keys, foreign keys, and other constraints to keep the data organised and consistent.

## 2. Relational Schema

The relational schema shows the tables in my database, their attributes, and how they are connected.

In the schema below, PK means Primary Key, FK means Foreign Key, and UK means Unique Key or unique constraint.

### 2.1 Customers

**CUSTOMERS** (`customer_id`, `customer_ref`, `full_name`, `email`)

- Primary key: `customer_id`
- Unique fields: `customer_ref` and `email`
- `customer_ref` and `full_name` are required.
- `email` is optional.

This table stores the basic information of customers who use the payment platform.

### 2.2 Merchants

**MERCHANTS** (`merchant_id`, `merchant_ref`, `business_name`, `status`)

- Primary key: `merchant_id`
- Unique field: `merchant_ref`
- Required fields: `merchant_ref`, `business_name`, and `status`
- The status can only be `ACTIVE` or `INACTIVE`.

This table stores information about businesses that accept payments through the platform.

### 2.3 Payment Terminals

**PAYMENT_TERMINALS** (`terminal_id`, `merchant_id`, `terminal_code`, `status`)

- Primary key: `terminal_id`
- Foreign key: `merchant_id` references `MERCHANTS(merchant_id)`
- Unique field: `terminal_code`
- The status can only be `ACTIVE` or `INACTIVE`.

This table stores the terminals used by merchants to process payments. Each terminal is linked to a merchant through `merchant_id`.

### 2.4 Payment Transactions

**PAYMENT_TRANSACTIONS** (`transaction_id`, `terminal_id`, `customer_id`, `transaction_ref`, `amount`, `currency`, `response_code`, `status`, `transaction_time`)

- Primary key: `transaction_id`
- Foreign key: `terminal_id` references `PAYMENT_TERMINALS(terminal_id)`
- Foreign key: `customer_id` references `CUSTOMERS(customer_id)`
- Unique field: `transaction_ref`
- The transaction amount must be greater than zero.
- The status can be `APPROVED`, `DECLINED`, or `PENDING`.
- The transaction time defaults to the current timestamp if no time is provided.

This is the main table for recording payments. The `customer_id` field is optional because a transaction may not always be linked to a registered customer.

### 2.5 Transaction Reversals

**TRANSACTION_REVERSALS** (`reversal_id`, `transaction_id`, `reversal_ref`, `amount`, `reason`, `status`, `reversal_time`)

- Primary key: `reversal_id`
- Foreign key: `transaction_id` references `PAYMENT_TRANSACTIONS(transaction_id)`
- Unique field: `reversal_ref`
- The reversal amount must be greater than zero.
- The status can be `PENDING`, `COMPLETED`, or `FAILED`.
- The reversal time defaults to the current timestamp if no time is provided.
- `reason` is optional.

This table records reversals linked to payment transactions. Keeping reversals separate allows a transaction to have more than one reversal record if required.

## 3. Relationships Between the Tables

The tables are connected through foreign keys. The relationships are:

1. One merchant can have many payment terminals, but each terminal belongs to one merchant.
2. One terminal can process many payment transactions, but each transaction is linked to one terminal.
3. One customer can be associated with many transactions. However, a transaction can exist without a registered customer.
4. One payment transaction can have multiple reversal records, while each reversal belongs to one transaction.

These relationships help keep the database organised and allow related information to be retrieved using SQL joins.

## 4. Why I Used This Design

I separated the information into five tables instead of storing everything in one large table. For example, merchant details are stored in the `merchants` table, while terminal details are stored in `payment_terminals`.

This means that if a merchant changes its business name, I only need to update the merchant record rather than changing the name in every transaction or terminal record.

I also used automatically generated IDs to identify records and foreign keys to connect related tables. The unique constraints help prevent duplicate references, while the check constraints restrict certain fields to acceptable values.

Overall, the design makes the database easier to maintain and helps protect the accuracy of the data.

## 5. Implementation Status

I created the five tables in PostgreSQL and saved the SQL scripts in my GitHub repository. The next step is to verify the schema against the actual database, capture the ER diagram, and test the constraints with sample data.
