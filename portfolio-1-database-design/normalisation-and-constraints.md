# FinCore Payments — Constraints and Normalisation

## 1. Introduction

In designing the FinCore Payments database, I used constraints to help keep the data accurate and consistent. I also separated the information into five tables to reduce unnecessary duplication and make the database easier to maintain.

This section explains the constraints used in my database and how the design follows the principles of database normalisation.

## 2. Constraints Used in the Database

Constraints are rules applied to database columns to control the type of data that can be stored and to prevent invalid records.

### 2.1 Primary Key Constraints

Each table has a primary key that uniquely identifies every record.

- `customer_id` identifies each customer.
- `merchant_id` identifies each merchant.
- `terminal_id` identifies each payment terminal.
- `transaction_id` identifies each payment transaction.
- `reversal_id` identifies each reversal.

These IDs are generated automatically by PostgreSQL.

### 2.2 Foreign Key Constraints

Foreign keys connect related tables and help prevent records from referring to records that do not exist.

For example, `merchant_id` in `payment_terminals` references the `merchants` table. This means a terminal must belong to an existing merchant.

Also, each payment transaction references an existing terminal, while a transaction reversal references an existing payment transaction. The `customer_id` in the transactions table is optional.

### 2.3 Unique Constraints

Unique constraints prevent duplicate values in fields that should identify records or distinguish them from one another.

In my database, these include:

- `customer_ref` and `email` in `customers`
- `merchant_ref` in `merchants`
- `terminal_code` in `payment_terminals`
- `transaction_ref` in `payment_transactions`
- `reversal_ref` in `transaction_reversals`

The email field is optional, but any non-NULL email value must be unique.

### 2.4 NOT NULL Constraints

The `NOT NULL` constraint ensures that important fields cannot be left without a value.

For example, a customer must have a customer reference and full name. A merchant must have a business name, and a transaction must have a reference, amount, currency, and status.

### 2.5 CHECK Constraints

I used CHECK constraints to restrict certain fields to acceptable values.

- Merchant and terminal statuses can only be `ACTIVE` or `INACTIVE`.
- Transaction statuses can only be `APPROVED`, `DECLINED`, or `PENDING`.
- Reversal statuses can only be `PENDING`, `COMPLETED`, or `FAILED`.
- Transaction and reversal amounts must be greater than zero.

These rules help prevent invalid values from being stored.

### 2.6 Default Constraints

The transaction and reversal timestamp fields use `CURRENT_TIMESTAMP` as their default value. If no timestamp is supplied when a record is inserted, PostgreSQL fills in the current timestamp.

## 3. Database Normalisation

Normalisation is the process of organising database tables to reduce unnecessary duplication and avoid problems when inserting, updating, or deleting records.

### 3.1 First Normal Form (1NF)

A table satisfies First Normal Form when each field contains a single value and there are no repeating groups of data.

In my design, each row represents one customer, merchant, terminal, transaction, or reversal. For example, multiple reversals are stored as separate records in `transaction_reversals` instead of being stored as a list inside a transaction record.

### 3.2 Second Normal Form (2NF)

Second Normal Form requires a table to be in 1NF and for every non-key attribute to depend on the whole candidate key, not just part of it.

The tables in my design use single-column primary keys, so partial dependency on part of a composite primary key does not arise. The design is consistent with 2NF, provided the non-key attributes also depend on their complete candidate keys.

### 3.3 Third Normal Form (3NF)

Third Normal Form requires a table to be in 2NF and to avoid inappropriate transitive dependencies between non-key attributes.

I separated merchants, terminals, transactions, and reversals into different tables rather than storing all their details together. For example, merchant names are stored in the `merchants` table, while the terminal table stores the corresponding `merchant_id`.

This means that if a merchant changes its business name, the change only needs to be made in one place. It reduces duplication and helps prevent inconsistent information across the database.

Based on the intended relationships and functional dependencies, the design appears consistent with 3NF. A complete formal verification would require documenting the candidate keys and functional dependencies for each table.


## 4. Conclusion

The FinCore Payments database uses primary keys, foreign keys, unique constraints, NOT NULL constraints, CHECK constraints, and default values to help maintain data integrity.

Separating the data into five related tables reduces unnecessary repetition and supports the principles of 1NF, 2NF, and 3NF. I will verify the implemented constraints against PostgreSQL and test them with sample data before finalising the portfolio.
