# Concurrency Control Analysis

## 1. Introduction

Concurrency control is an important database management concept that ensures multiple transactions can execute simultaneously without compromising data consistency.

In the FinCore Payments environment, several payment operations may attempt to access or update the same merchant account concurrently. Without appropriate concurrency control, conflicting updates could result in inconsistent account balances.

This practical exercise demonstrates PostgreSQL row-level locking using the `SELECT FOR UPDATE` statement.

## 2. Row-Level Locking in PostgreSQL

PostgreSQL provides row-level locking to control concurrent access to database records.

The `SELECT FOR UPDATE` statement retrieves selected records and acquires locks that prevent other transactions from performing conflicting modifications to those rows until the current transaction ends.

This mechanism is useful when a transaction needs to read a record and subsequently modify it without allowing another transaction to interfere with that operation.

## 3. Practical Implementation

The experiment used two separate PostgreSQL Query Tool sessions connected to the FinCore Payments database.

Merchant A had a committed balance of ₦35,000 before the experiment.

### Session A: Acquiring the Lock

The first session executed:

```sql
BEGIN;

SELECT *
FROM public.transaction_lab
WHERE account_id = 1
FOR UPDATE;
```

The query successfully retrieved Merchant A's record and acquired a row-level lock.

The transaction remained open so that the locking behaviour could be tested from another session.

### Session B: Attempting a Concurrent Update

The second session attempted to deduct ₦2,000 from Merchant A:

```sql
BEGIN;

UPDATE public.transaction_lab
SET balance = balance - 2000
WHERE account_id = 1;
```

The UPDATE statement remained executing because Session A held a conflicting row-level lock on Merchant A's record.

### Releasing the Lock

Session A subsequently executed:

```sql
COMMIT;
```

This committed Session A's transaction and released the row-level lock.

Session B's waiting UPDATE then resumed and completed successfully.

Session B committed its transaction and retrieved the account balances:

```sql
COMMIT;

SELECT *
FROM public.transaction_lab
ORDER BY account_id;
```

## 4. Experimental Results

| Account | Balance before experiment | Balance after experiment |
|---|---:|---:|
| FinCore Merchant A | ₦35,000 | ₦33,000 |
| FinCore Merchant B | ₦40,000 | ₦40,000 |
| Total | ₦75,000 | ₦73,000 |

The experiment demonstrated that the second transaction was temporarily blocked until the first transaction released its lock.

## 5. Technical Analysis

The experiment demonstrated the following:

1. **Lock acquisition:** Session A acquired a row-level lock using `SELECT FOR UPDATE`.
2. **Transaction blocking:** Session B's conflicting UPDATE operation waited while the lock remained active.
3. **Lock release:** Committing Session A released the lock.
4. **Transaction continuation:** Session B automatically resumed and completed its update.
5. **Data consistency:** The database applied the update after the conflicting lock was released.

This demonstrates how PostgreSQL coordinates concurrent transactions through row-level locking.

## 6. Relevance to FinCore Payments

In a payment-processing environment, concurrent requests may attempt to modify the same merchant account balance.

For example, two settlement or adjustment operations could target the same merchant record at approximately the same time.

Using row-level locking allows a transaction to secure the relevant record before modifying it. Other conflicting transactions must wait until the lock is released.

This helps prevent simultaneous conflicting updates and supports the consistency of financial records.

However, locks should be held only as long as necessary because prolonged transactions can increase waiting time and reduce system throughput.

## 7. Conclusion

The practical exercise successfully demonstrated PostgreSQL concurrency control using SELECT FOR UPDATE.

The results showed that a conflicting update was blocked while another transaction held a row-level lock. Once the lock was released through COMMIT, the waiting transaction resumed and completed successfully.

This exercise provided practical understanding of transaction coordination, row-level locking and concurrency management in a simulated fintech payment-processing environment.

**Technology used:** PostgreSQL 18 and pgAdmin.
