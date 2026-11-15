# MIT 8103 – Advanced Database Systems Portfolio

**Academic Session:** 2026/2027  
**Assessment:** First Semester Continuous Assessment  
**Student:** TISAN ABUN

## 1. Project Overview

This repository contains my practical portfolio for MIT 8103 – Advanced Database Systems.

The project uses **FinCore Payments**, a simulated fintech payment-processing platform, to demonstrate database design, SQL query optimisation, transaction management, NoSQL data modelling, and distributed database concepts.

The portfolio combines practical database implementation, SQL and MongoDB exercises, execution evidence, technical documentation, and individual reflection.

## 2. Case Study: FinCore Payments

FinCore Payments is a fictional payment-processing platform designed for academic purposes.

The system manages information relating to customers, merchants, payment terminals, payment transactions, and transaction reversals.

The database exercises explore how these records can be structured, queried, optimised, validated, and managed reliably.

## 3. Portfolio Activities

### Portfolio 1 – Database Design and Modelling

Designed and implemented a relational database using PostgreSQL.

Activities included:
- Entity identification and relationship modelling.
- Entity-Relationship Diagram (ERD).
- Relational schema development.
- Primary keys, foreign keys and integrity constraints.
- Normalisation analysis.
- Creation of five relational tables and insertion of sample records.

**Evidence:** `portfolio-1-database-design/`

### Portfolio 2 – Query Processing and Optimisation

Implemented SQL queries and examined PostgreSQL query execution plans.

Activities included:
- Transaction summary and merchant performance queries.
- Declined transaction and currency analysis.
- Database indexing and composite indexing.
- EXPLAIN ANALYZE execution-plan investigation.
- Indexed query and sequential scan comparison.

**Evidence:** `portfolio-2-query-optimisation/`

### Portfolio 3 – Transactions and Concurrency

Explored transaction management and concurrent database operations using PostgreSQL.

Activities included:
- COMMIT and ROLLBACK demonstrations.
- READ COMMITTED isolation testing.
- Multi-session transaction visibility.
- Row-level locking using SELECT FOR UPDATE.
- Analysis of concurrent updates and transaction consistency.

**Evidence:** `portfolio-3-transactions-concurrency/`

### Portfolio 4 – NoSQL and Advanced Data Models

Implemented a document-oriented database using MongoDB Community Server and MongoDB Compass.

Activities included:
- Database and collection creation.
- Document insertion and retrieval.
- Filtering and nested-field queries.
- Aggregation by transaction status, currency and channel.
- Index creation and execution-plan analysis.
- JSON Schema validation.
- CRUD update and verification.

The MongoDB practical exercise used two sample transaction documents. Its results demonstrate functionality rather than production-scale performance.

**Evidence:** `portfolio-4-nosql/`

### Portfolio 5 – Distributed and Cloud Database Exercise

Examined distributed database concepts and proposed a cloud-hosted PostgreSQL architecture for FinCore Payments.

Topics covered:
- Database replication.
- Primary and standby database architecture.
- Read replicas.
- Sharding and partitioning.
- Availability and consistency.
- Cloud database deployment considerations.
- Security, backup and disaster recovery.

**Implementation note:** This portfolio presents a proposed architecture and technical analysis. An actual cloud deployment, replication setup, or failover test was not performed.

**Evidence:** `portfolio-5-distributed-cloud/`

## 4. Technology Stack

| Technology | Purpose |
|---|---|
| PostgreSQL 18 | Relational database implementation |
| pgAdmin | Database administration and SQL execution |
| MongoDB Community Server | NoSQL document database |
| MongoDB Compass | MongoDB graphical interface |
| MongoDB Shell (mongosh) | MongoDB queries and CRUD operations |
| SQL and JavaScript | Database scripts and practical exercises |
| GitHub | Version control and portfolio documentation |

## 5. Repository Structure

```text
MIT-8103-ADVANCED-DATABASE-PORTFOLIO/
│
├── portfolio-1-database-design/
├── portfolio-2-query-optimisation/
├── portfolio-3-transactions-concurrency/
├── portfolio-4-nosql/
├── portfolio-5-distributed-cloud/
│
└── README.md
```

Each portfolio directory contains its relevant implementation scripts, supporting documentation, and available practical evidence.

## 6. Overall Project Status

**Status: All five portfolio activities documented.**

The repository contains the implementation and supporting evidence for the relational database design, query optimisation, transaction management, and MongoDB exercises.

The distributed and cloud database portfolio is presented as a documented architecture proposal rather than a deployed cloud environment.

## 7. Academic Integrity and Use of AI

This is an individual academic portfolio. AI tools were used to support learning, technical explanations, documentation refinement, and troubleshooting.

The practical activities and reported results are based on the work and evidence maintained in this repository. Limitations and activities not performed have been identified transparently.

## 8. Conclusion

The FinCore Payments portfolio provided practical experience across relational database design, SQL query optimisation, transaction processing, concurrency control, NoSQL implementation, and distributed database architecture.

The exercises strengthened my understanding of how database technologies support the reliability, consistency, performance, and scalability requirements of financial transaction-processing systems.
