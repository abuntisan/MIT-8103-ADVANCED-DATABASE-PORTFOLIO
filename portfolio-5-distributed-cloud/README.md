# Portfolio 5: Distributed and Cloud Database Exercise

## 1. Overview

This portfolio explores distributed and cloud database concepts using the FinCore Payments case study, a simulated payment-processing platform. The exercise will examine how database distribution can support availability, scalability, and reliable access to payment data.

## 2. Objectives

- Explain the role of distributed databases in payment-processing systems.
- Explore database replication and its benefits and limitations.
- Explain sharding and how payment data could be partitioned.
- Discuss database availability and consistency.
- Explore a cloud database deployment or document a proposed deployment architecture.

## 3. Case Study: FinCore Payments

FinCore Payments stores customer, merchant, terminal, transaction, and reversal information. As transaction volumes grow, the platform may need to distribute its data across database servers or use a managed cloud database service.

The proposed design must consider data availability, consistency, performance, security, and the accuracy of payment records.

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

## 5. Expected Deliverables

- Distributed database architecture or design notes.
- Replication and sharding explanation.
- Availability and consistency analysis.
- Cloud deployment evidence or a clearly documented deployment proposal.
- Relevant screenshots, test outputs, and references.
- Individual reflection on the concepts learned.

## 6. Tools

- PostgreSQL
- pgAdmin
- GitHub
- A cloud database service or architecture diagram tool, if required

## 7. Progress

**Status:** Planned

Implementation evidence, analysis, and reflection will be added as the exercise progresses.

## 8. Individual Reflection

To be completed after the practical work. The reflection will explain what I learned, the challenges encountered, and how distributed database concepts apply to payment-processing systems.
