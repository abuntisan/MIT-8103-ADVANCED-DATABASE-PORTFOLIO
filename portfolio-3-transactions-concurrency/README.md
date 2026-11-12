# Portfolio 3: Transactions and Concurrency

**Course:** MIT 8103 – Advanced Database Systems  
**Case Study:** FinCore Payments  
**Database Management System:** PostgreSQL 18  


## 1. Project Overview

This portfolio explores transaction management and concurrency control using the FinCore Payments simulated fintech platform.

The practical implementation demonstrates how database transactions maintain data consistency, how transaction isolation controls visibility between concurrent sessions, and how row-level locking prevents conflicting modifications to shared records.

PostgreSQL 18 and pgAdmin were used to implement and test the transaction scenarios.

## 2. Objectives

The objectives of this portfolio are to:

- Demonstrate transaction processing using COMMIT and ROLLBACK.
- Understand transaction isolation and READ COMMITTED behaviour.
- Investigate concurrent database operations using multiple sessions.
- Demonstrate row-level locking using SELECT FOR UPDATE.
- Evaluate how PostgreSQL manages concurrent access to financial records.

## 3. Practical Implementation

### 3.1 Transaction Testing Environment

A dedicated table named `transaction_lab` was created to simulate merchant accounts.

Two test accounts were inserted:

| Merchant | Initial balance |
|---|---:|
| FinCore Merchant A | ₦50,000 |
| FinCore Merchant B | ₦30,000 |

The dedicated testing table allowed transaction experiments to be performed without modifying the existing payment transaction records.

### 3.2 COMMIT Demonstration

A successful ₦10,000 transfer was simulated from Merchant A to Merchant B.

The transaction used BEGIN, UPDATE and COMMIT statements to demonstrate how changes are permanently saved.

### 3.3 ROLLBACK Demonstration

A subsequent ₦15,000 transfer was simulated and deliberately cancelled using ROLLBACK.

The experiment confirmed that uncommitted changes could be reversed, preserving the last committed account balances.

### 3.4 Transaction Isolation

The READ COMMITTED isolation level was tested using two separate PostgreSQL Query Tool sessions.

Session B deducted ₦5,000 from Merchant A while Session A maintained an open transaction.

The experiment demonstrated that Session A could not see Session B's uncommitted update. After Session B committed, Session A's subsequent query returned the updated balance.

This illustrated PostgreSQL's Multi-Version Concurrency Control (MVCC) mechanism.

### 3.5 Concurrency Control and Row-Level Locking

PostgreSQL row-level locking was demonstrated using SELECT FOR UPDATE.

Session A acquired a lock on Merchant A's record. Session B subsequently attempted to deduct ₦2,000 from the same account and remained waiting.

After Session A committed and released the lock, Session B resumed and completed its update.

This demonstrated how PostgreSQL coordinates conflicting transactions through row-level locking.

## 4. Technologies Used

- PostgreSQL 18
- pgAdmin
- SQL
- GitHub

## 5. Repository Structure

```text
portfolio-3-transactions-concurrency/
│
├── sql/
│   ├── 01_create_transaction_lab.sql
│   ├── 02_commit_transaction.sql
│   ├── 03_rollback_transaction.sql
│   ├── 04_read_committed_isolation.sql
│   └── 05_row_level_locking.sql
│
├── results/
│   ├── 01_transaction_lab_setup.png
│   ├── 02_commit_transaction_result.png
│   ├── 03_rollback_transaction_result.png
│   ├── 04_read_committed_isolation.png
│   ├── 05_row_level_locking_result.png
│   └── 05_row_level_locking_waiting.png
│
├── documentation/
│   ├── transaction_isolation_analysis.md
│   └── concurrency_control_analysis.md
│
└── README.md
```

## 6. Key Findings

The practical exercises demonstrated that:

1. COMMIT permanently saves successful transaction changes.
2. ROLLBACK reverses uncommitted changes.
3. READ COMMITTED prevents transactions from reading uncommitted changes made by other sessions.
4. PostgreSQL MVCC supports concurrent database access.
5. SELECT FOR UPDATE prevents conflicting updates while a row-level lock is held.
6. Waiting transactions can resume after the conflicting lock is released.

## 7. Technical Reflection

The practical implementation improved my understanding of transaction processing and concurrency management in relational database systems.

One important observation was that a transaction can see its own uncommitted changes, while another transaction operating under READ COMMITTED cannot see those changes until they are committed.

The row-level locking experiment also demonstrated how PostgreSQL handles competing updates to the same merchant record.

These concepts are particularly important in fintech systems, where transaction consistency and the integrity of financial records are essential.

## 8. Conclusion

This portfolio demonstrates practical application of transaction management, isolation and concurrency control using PostgreSQL 18.

The experiments provide evidence of how database transactions are committed, reversed, isolated and coordinated during concurrent operations.

Supporting SQL scripts, execution screenshots and technical analysis are maintained in this repository.
