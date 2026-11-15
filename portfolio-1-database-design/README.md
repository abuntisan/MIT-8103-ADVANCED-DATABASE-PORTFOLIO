# Portfolio 1: Database Design and Modelling

## 1. Project Overview

This portfolio focuses on the design and implementation of a relational database for FinCore Payments, a simulated fintech payment-processing platform.

The database is designed to manage customer information, merchant details, payment terminals, payment transactions and transaction reversals.

The main objective is to develop a structured and reliable database that supports payment processing, transaction monitoring, reporting and data integrity.

## 2. Objectives

The objectives of this portfolio are to:

- Identify the major entities and attributes required by the system.
- Develop an Entity-Relationship Diagram (ERD).
- Translate the ERD into a relational database schema.
- Define primary keys and foreign keys.
- Apply appropriate integrity constraints.
- Explain database normalisation and its importance.
- Implement the database using PostgreSQL.
- Test the database structure and relationships using SQL.

## 3. Selected Case Study: FinCore Payments

FinCore Payments is a simulated electronic payment-processing platform that manages payment-related information.

The platform requires a database capable of storing and managing information about:

- **Customers:** Individuals or organisations initiating payment transactions.
- **Merchants:** Businesses receiving payments.
- **Payment Terminals:** Devices or channels through which payment transactions are initiated.
- **Payment Transactions:** Records of payment activities, including transaction amounts, dates, channels and response statuses.
- **Transaction Reversals:** Records of transactions that require reversal or correction.

The database supports important business operations such as transaction recording, merchant monitoring, payment-status tracking, transaction reporting and reversal management.

All data used in this project is fictional and intended for academic purposes.

## 4. Database Design and Modelling

The database design follows a relational approach in which information is organised into related tables.

The main entities identified for FinCore Payments are:

1. Customers
2. Merchants
3. Payment Terminals
4. Payment Transactions
5. Transaction Reversals

The entities are related through primary and foreign keys to maintain referential integrity and reduce unnecessary duplication.

### 4.1 Entity-Relationship Diagram (ERD)

The Entity-Relationship Diagram illustrates the relationships between the five major entities.

It provides a visual representation of how customer, merchant, terminal, transaction and reversal records are connected.

The ERD serves as the foundation for translating the conceptual database design into relational tables.

**ERD Evidence:** Refer to the ER diagram included in this portfolio folder.

### 4.2 Relational Database Schema

The relational schema consists of five main tables:

| Table | Purpose |
|---|---|
| customers | Stores customer information. |
| merchants | Stores merchant information. |
| payment_terminals | Stores payment terminal details. |
| payment_transactions | Stores payment transaction records. |
| transaction_reversals | Stores transaction reversal records. |

The tables are connected through appropriate key relationships to ensure that transaction records can be associated with the relevant customers, merchants and payment terminals.

### 4.3 Primary and Foreign Keys

Primary keys uniquely identify individual records within each table.

Foreign keys establish relationships between related tables and help prevent invalid references.

The database design uses these keys to maintain consistency and support reliable retrieval of related payment information.

### 4.4 Integrity Constraints

Database integrity constraints help ensure that stored information remains accurate and valid.

The design considers:

- **Primary key constraints:** Prevent duplicate record identifiers.
- **Foreign key constraints:** Maintain valid relationships between tables.
- **NOT NULL constraints:** Ensure that required fields contain values.
- **UNIQUE constraints:** Prevent duplicate values in fields that require uniqueness.
- **CHECK constraints:** Restrict values to acceptable conditions where applicable.

These constraints help protect the quality and reliability of payment records.

## 5. Database Normalisation

Normalisation is the process of organising database tables to reduce unnecessary data duplication and improve data integrity.

The FinCore Payments database design considers the following normalisation stages:

### First Normal Form (1NF)

Each table is structured so that attributes contain atomic values and repeating groups are avoided.

### Second Normal Form (2NF)

The design considers the removal of partial dependencies so that non-key attributes depend on the complete primary key.

### Third Normal Form (3NF)

The design considers the removal of transitive dependencies so that non-key attributes depend on the primary key rather than other non-key attributes.

Applying normalisation principles helps reduce data redundancy and makes the database easier to maintain.

## 6. Database Implementation

The FinCore Payments relational database was implemented using PostgreSQL, with pgAdmin used as the database administration interface.

The implementation involved:

- Creating the FinCore Payments database.
- Creating the five relational tables: customers, merchants, payment_terminals, payment_transactions and transaction_reversals.
- Defining table attributes and appropriate data types.
- Establishing primary and foreign key relationships.
- Applying integrity constraints, including NOT NULL, UNIQUE and CHECK constraints.
- Inserting sample records into all five tables.
- Executing SQL statements to examine the database structure and relationships.

The sample records provided data for working with the database and demonstrated how information is organised across the related tables.

## 7. Testing and Validation

The database implementation was reviewed using PostgreSQL and pgAdmin.

The activities completed included:

- Confirming the creation of the five required tables.
- Inserting sample records into the tables.
- Working with the database structure and defined relationships.
- Using SQL to examine the stored records.

Although integrity constraints were defined in the database schema, separate tests involving deliberately invalid records were not performed as part of this exercise.

## 8. Tools and Technologies

The following tools were used in the database design and implementation activities:

- **PostgreSQL:** Used to create and manage the relational database.
- **pgAdmin:** Used as the graphical interface for database administration and SQL execution.
- **SQL:** Used to define database structures, relationships and constraints.
- **GitHub:** Used for version control, documentation and storage of portfolio evidence.

## 9. Technical Reflection

Working on this portfolio improved my understanding of relational database design and the importance of proper data organisation.

I learned how to identify entities, establish relationships and translate a conceptual database model into relational tables.

One important lesson was the role of primary keys, foreign keys and integrity constraints in maintaining reliable relationships between database records.

I also gained a better understanding of normalisation and how it helps reduce data duplication and improve database maintainability.

Using PostgreSQL and pgAdmin provided practical experience in implementing and managing a relational database.

Overall, this exercise established the database design foundation for the subsequent FinCore Payments activities involving query optimisation, transaction management, NoSQL modelling and distributed database concepts.

## 10. Conclusion

The FinCore Payments database design provides a structured relational foundation for managing customers, merchants, payment terminals, payment transactions and reversals.

The use of relational modelling, keys, integrity constraints and normalisation principles supports data consistency, maintainability and reliable transaction management.

The practical knowledge gained from this portfolio provides a foundation for applying more advanced database concepts in subsequent portfolio activities.

## 11. References

1. PostgreSQL Global Development Group. PostgreSQL Documentation. https://www.postgresql.org/docs/
2. Elmasri, R. and Navathe, S. B. Fundamentals of Database Systems.
3. Course learning materials for MIT 8103 Advanced Database Systems.
