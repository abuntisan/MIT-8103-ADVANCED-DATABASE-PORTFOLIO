# Transaction Isolation Analysis

## 1. Introduction

Transaction isolation is an important property of database transactions. It controls how concurrent transactions interact and determines which changes made by one transaction are visible to another.

For the FinCore Payments case study, transaction isolation is important because multiple payment operations may access or modify merchant account records simultaneously. Proper isolation helps maintain data consistency and prevents transactions from accessing incomplete changes made by other transactions.

## 2. PostgreSQL READ COMMITTED Isolation

This practical exercise used PostgreSQL's READ COMMITTED isolation level.

READ COMMITTED ensures that a transaction can only read data committed before the execution of each SQL statement. Uncommitted changes made by another transaction remain invisible.

PostgreSQL uses Multi-Version Concurrency Control (MVCC) to provide consistent views of data while allowing concurrent database operations.

## 3. Practical Implementation

The experiment used two separate PostgreSQL Query Tool sessions connected to the same FinCore Payments database.

The `transaction_lab` table contained two simulated merchant accounts. Before the experiment, Merchant A had a balance of ₦40,000.

### Session A

The first session started a transaction using READ COMMITTED and retrieved Merchant A's balance.

```sql
BEGIN;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

SELECT *
FROM public.transaction_lab
WHERE account_id = 1;
```

The query returned ₦40,000.

### Session B

The second session started another transaction and deducted ₦5,000 from Merchant A.

```sql
BEGIN;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

UPDATE public.transaction_lab
SET balance = balance - 5000
WHERE account_id = 1;

SELECT *
FROM public.transaction_lab
WHERE account_id = 1;
```

Session B returned ₦35,000 because a transaction can see its own uncommitted changes.

### Visibility Test in Session A

While Session B's transaction remained uncommitted, Session A executed the SELECT statement again.

The result remained ₦40,000. This demonstrated that Session A could not see the uncommitted update made by Session B.

Session B subsequently executed:

```sql
COMMIT;
```

After the commit, Session A executed the SELECT statement again. This time, the result was ₦35,000.

This demonstrated that READ COMMITTED provides a new committed-data snapshot for each statement.

## 4. Experimental Results

| Experiment stage | Session A balance | Session B balance |
|---|---:|---:|
| Initial committed state | ₦40,000 | ₦40,000 |
| Session B update uncommitted | ₦40,000 | ₦35,000 |
| Session B commits | ₦35,000 | ₦35,000 |

## 5. Technical Analysis

The experiment demonstrated three important characteristics of READ COMMITTED isolation:

1. **Visibility control:** Session A could not access Session B's uncommitted update.
2. **Transaction independence:** Session B could view its own changes before committing them.
3. **Fresh statement snapshots:** After Session B committed, a subsequent SELECT in Session A returned the updated balance, even though Session A's transaction was still open.

The behaviour was supported by PostgreSQL's MVCC mechanism, which allows database sessions to work concurrently without exposing uncommitted changes.

## 6. Relevance to FinCore Payments

In a fintech payment-processing environment, multiple transactions may access the same merchant account within a short period.

READ COMMITTED helps prevent dirty reads by ensuring that transactions only access committed changes from other sessions.

However, it does not guarantee that repeated queries within the same transaction will return identical results. As demonstrated, a later query can see a newly committed update.

For operations that require stronger consistency or protection against conflicting updates, additional mechanisms such as row-level locking may be appropriate.

## 7. Conclusion

The practical exercise successfully demonstrated PostgreSQL's READ COMMITTED isolation level using two concurrent database sessions.

The results confirmed that uncommitted changes remained invisible to other sessions and became visible after COMMIT. The experiment provided practical insight into transaction visibility, MVCC and the importance of isolation in payment-processing systems.

**Technology used:** PostgreSQL 18 and pgAdmin.
