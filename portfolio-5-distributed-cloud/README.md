# Portfolio 5: Distributed and Cloud Database Exercise

## 1. Overview

This portfolio explores distributed and cloud database concepts using the FinCore Payments case study, a simulated payment-processing platform. The exercise examines how database distribution can support availability, scalability, performance, and reliable access to payment data.

It focuses on replication, sharding, availability, consistency, and a proposed cloud database architecture suitable for a growing payment-processing environment.

## 2. Objectives

- Explain the role of distributed databases in payment-processing systems.
- Explore database replication and its benefits and limitations.
- Explain sharding and how payment data could be partitioned.
- Discuss database availability and consistency.
- Propose a suitable cloud database deployment architecture.
- Examine the importance of security, backup, and disaster recovery in distributed databases.

## 3. Case Study: FinCore Payments

FinCore Payments is a simulated payment-processing platform that stores customer, merchant, payment terminal, transaction, and reversal information.

As transaction volumes increase, the platform may need to distribute its database across multiple servers or adopt a managed cloud database service.

The proposed design must consider data availability, consistency, performance, security, scalability, and the accuracy of payment records.

Since payment systems process financial transactions, the architecture must ensure that confirmed transactions are properly recorded and that failures do not result in inconsistent or duplicated payment records.

## 4. Proposed Distributed Database Architecture

The proposed FinCore Payments architecture uses a cloud-hosted PostgreSQL database as the primary relational database for customers, merchants, payment terminals, transactions, and reversals.

The architecture will consist of:

- **Primary database:** Handles payment transactions, updates, and other write operations.
- **Standby replica:** Maintains a replicated copy of the primary database and supports failover if the primary server becomes unavailable.
- **Read replicas:** Support reporting, analytics, and other read-heavy operations to reduce the workload on the primary database.
- **Backup storage:** Stores regular database backups to support recovery in the event of data loss or system failure.
- **Application layer:** Connects payment-processing services securely to the database.

The primary database will remain responsible for authoritative payment records. Replication and failover mechanisms will improve availability, while appropriate transaction controls will help maintain the accuracy and consistency of financial records.

As transaction volumes increase, the system can introduce database partitioning and, where necessary, sharding to distribute transaction data across multiple database nodes.

This architecture is a proposed design for FinCore Payments and does not represent an actual cloud deployment.

## 5. Database Replication and Availability

Database replication involves maintaining copies of data across multiple database servers. For FinCore Payments, PostgreSQL streaming replication can be used to maintain a standby server that receives changes from the primary database.

### How replication will work

- The primary database processes payment transactions and updates.
- The standby replica receives and applies changes from the primary database.
- If the primary database fails, the standby can be promoted to become the new primary through an appropriate failover process.
- Read replicas can support reporting and analytics without placing additional workload on the primary database.

### Benefits to FinCore Payments

1. **High availability:** A standby server can help reduce service disruption when the primary database fails.
2. **Disaster recovery:** Replicated data provides another copy that can support recovery.
3. **Improved performance:** Read replicas can handle reporting and read-heavy operations.
4. **Business continuity:** Replication helps payment services recover more quickly from infrastructure failures.

### Limitations and considerations

Replication does not replace regular backups. Asynchronous replication may introduce replication lag, meaning a standby server might not immediately contain the latest transactions. Synchronous replication can improve data durability but may increase transaction latency.

For financial transactions, FinCore Payments should carefully configure replication and failover policies to reduce the risk of losing confirmed payment records. Database monitoring and regular recovery testing are also important.

## 6. Database Sharding and Scalability

Sharding is a database distribution technique that divides a large dataset into smaller sections called shards. Each shard stores a portion of the overall data and can operate on a separate database server.

For FinCore Payments, sharding could become useful when transaction volumes grow beyond what a single database server can efficiently handle.

### Proposed sharding strategy

A possible approach is to partition payment transaction records using a transaction-related key, such as merchant ID or transaction date.

For example:

- Transactions belonging to different merchant groups could be distributed across separate database shards.
- Historical transactions could be organised into time-based partitions.
- Each shard would handle queries and storage operations for its assigned data.

### Benefits of sharding

- Distributes database workload across multiple servers.
- Supports increased transaction volumes.
- Reduces the amount of data each individual shard must manage.
- Can improve query performance when requests target a specific shard.

### Challenges of sharding

- Adds complexity to database administration.
- Queries involving multiple shards may require additional coordination.
- Rebalancing data when new shards are added can be difficult.
- Maintaining consistency across distributed transactions requires careful design.

For the initial FinCore Payments implementation, PostgreSQL table partitioning by transaction date would be a simpler starting point than full database sharding. Merchant-based sharding could be considered as the platform grows.

## 7. Database Availability and Consistency

Availability and consistency are important requirements for payment-processing systems.

### Availability

Availability refers to the ability of a database system to remain accessible when users or applications need it.

For FinCore Payments, availability can be improved through:

- Primary and standby database servers.
- Automated monitoring and failure detection.
- Replication and controlled failover.
- Regular backups and disaster recovery procedures.
- Deployment of database servers across separate infrastructure failure zones.

These measures can reduce downtime and support continuity of payment services.

### Consistency

Consistency ensures that database records remain valid and accurate when transactions are processed.

For FinCore Payments, transaction records must accurately reflect the outcome of payment operations. For example, a payment should not be recorded as successful when the database transaction has failed.

PostgreSQL transactions and ACID properties help maintain data integrity:

- **Atomicity:** A transaction is completed fully or rolled back.
- **Consistency:** Database rules and constraints are maintained.
- **Isolation:** Concurrent transactions are controlled to prevent unwanted interference.
- **Durability:** Committed changes are preserved according to the database's durability configuration.

For financial records, the system should prioritise reliable transaction commits. Synchronous replication with an appropriate write acknowledgement policy can help protect committed data, although it may introduce additional latency.

Read replicas may also experience replication lag. Therefore, payment confirmation and other operations that require the latest transaction status should read from the primary database or use an appropriate consistency-aware mechanism.

## 8. Proposed Cloud Database Deployment

A managed cloud PostgreSQL service would be a suitable option for FinCore Payments because it can provide database hosting, backup facilities, monitoring, and high-availability capabilities.

A possible deployment would include:

1. A managed PostgreSQL primary database for payment-processing operations.
2. A standby instance configured for high availability.
3. Read replicas for reporting and analytics.
4. Cloud storage for automated database backups.
5. Secure application connectivity using encrypted connections.
6. Monitoring and alerting for database availability, storage, CPU usage, and replication lag.

### Security considerations

The proposed deployment should implement:

- Strong database authentication and access controls.
- Role-based permissions based on job responsibilities.
- Encryption of data in transit and at rest.
- Network restrictions to prevent unauthorised database access.
- Regular security updates and vulnerability reviews.
- Secure backup storage and periodic recovery testing.

### Deployment status

The cloud deployment described in this section is a proposed architecture for the FinCore Payments case study. An actual cloud database instance has not been deployed or tested as part of this exercise.

The design provides a foundation for a future implementation using a managed PostgreSQL cloud service.

## 9. Tools and Technologies

The following tools and technologies are relevant to the exercise:

- **PostgreSQL:** Relational database technology used in the FinCore Payments case study.
- **pgAdmin:** Database administration and management interface.
- **GitHub:** Version control and documentation of portfolio activities.
- **Cloud PostgreSQL service:** Proposed platform for managed database hosting and high availability.
- **Architecture diagram tool:** Can be used to illustrate the proposed distributed database design.

## 10. Limitations and Future Improvements

This exercise focuses mainly on the design and analysis of distributed database concepts. The proposed cloud architecture has not been deployed in a live environment.

Future improvements could include:

- Implementing PostgreSQL streaming replication in a test environment.
- Testing primary database failure and standby promotion.
- Measuring replication lag under different workloads.
- Testing database partitioning with a larger transaction dataset.
- Deploying a managed cloud PostgreSQL instance.
- Evaluating automated backup and recovery procedures.
- Measuring query performance across distributed database nodes.

These activities would provide practical evidence of the performance, availability, and recovery capabilities of the proposed architecture.

## 11. Progress Status

**Status:** Design and documentation in progress.

The proposed distributed database architecture, replication approach, sharding strategy, availability and consistency considerations, and cloud deployment plan have been documented.

The cloud deployment remains a proposal rather than a completed practical implementation.

## 12. Individual Reflection

Working on this portfolio has improved my understanding of how distributed database concepts can support payment-processing systems.

I learned that replication can improve database availability and support recovery, while sharding can help distribute workloads as transaction volumes increase. I also gained a better understanding of the relationship between availability, consistency, and data integrity in financial systems.

One important lesson is that database distribution introduces additional complexity. Replication lag, failover management, and distributed data access must be carefully considered, especially when dealing with payment records.

Although I did not deploy the proposed cloud architecture, the exercise helped me understand how PostgreSQL and managed cloud database services could be used to build a more scalable and reliable payment-processing platform.

## 13. References

1. PostgreSQL Global Development Group. PostgreSQL Documentation – High Availability, Load Balancing, and Replication. https://www.postgresql.org/docs/current/high-availability.html
2. PostgreSQL Global Development Group. PostgreSQL Documentation – Table Partitioning. https://www.postgresql.org/docs/current/ddl-partitioning.html
3. PostgreSQL Global Development Group. PostgreSQL Documentation – Transactions. https://www.postgresql.org/docs/current/tutorial-transactions.html
4. PostgreSQL Global Development Group. PostgreSQL Documentation – Write-Ahead Logging and Reliability. https://www.postgresql.org/docs/current/wal.html
