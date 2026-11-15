# Portfolio 4: NoSQL and Advanced Data Models

## 1. Project Overview

This portfolio explores NoSQL database modelling and implementation using **FinCore Payments**, a simulated fintech payment processing platform.

The practical implementation uses **MongoDB Community Server** and MongoDB Compass to store, retrieve, query, aggregate, index, validate and update payment transaction documents.

The objective is to demonstrate how a document-oriented database can complement a relational database when handling transaction events and records with embedded or flexible attributes.

## 2. Selected Case Study: FinCore Payments

FinCore Payments is a simulated electronic payment processing platform that handles transactions between customers and merchants through channels such as POS and web payments.

The system stores information including:

- Transaction references and amounts.
- Merchant and customer details.
- Transaction status and response codes.
- Payment channels and currencies.
- Transaction timestamps.

MongoDB was selected to demonstrate how related transaction information can be stored together in a single document using embedded objects.

The relational database developed in the earlier portfolios remains the primary structured database model for the case study. MongoDB serves as a complementary NoSQL implementation.

## 3. NoSQL Data Model

The implementation uses a MongoDB database named `fincore_nosql` and a collection named `Transactions`.

Each transaction document contains:

| Field | Description |
|---|---|
| `transaction_ref` | Unique transaction reference |
| `merchant` | Embedded merchant information |
| `customer` | Embedded customer information |
| `amount` | Transaction amount |
| `currency` | Transaction currency |
| `status` | Transaction outcome |
| `response_code` | Payment response code |
| `channel` | Transaction channel |
| `transaction_time` | Date and time of transaction |
| `audit_note` | Additional audit information added during the CRUD update test |

The merchant and customer details are embedded within each transaction document. This makes the related information available when retrieving a transaction without requiring relational joins.

## 4. Implementation and Practical Activities

The following activities were performed using MongoDB Compass and MongoDB Shell (`mongosh`):

### 4.1 Database and Collection Creation

- Installed MongoDB Community Server.
- Installed and configured MongoDB Compass.
- Established a local MongoDB connection.
- Created the `fincore_nosql` database.
- Created the `Transactions` collection.
- Inserted two sample transaction documents.

### 4.2 Querying and Filtering

The following queries were executed:

- Retrieve approved transactions.
- Retrieve declined transactions.
- Find transactions with amounts greater than ₦20,000.
- Find transactions with amounts below ₦20,000.
- Filter transactions by payment channel.
- Filter transactions by currency.
- Retrieve transactions using nested merchant fields.
- Combine multiple filter conditions.

### 4.3 Aggregation

MongoDB aggregation pipelines were used to group transactions and calculate:

- Transaction counts.
- Total transaction amounts.
- Average transaction amounts.

Aggregation was demonstrated using transaction status, currency and payment channel.

### 4.4 Indexing and Query Execution

An index was created on the `status` field:

```javascript
db.Transactions.createIndex({ status: 1 });
```

The index was named `status_1`.

The query execution plan was examined using:

```javascript
db.Transactions.find({
  status: "APPROVED"
}).explain("executionStats");
```

The execution plan showed an `IXSCAN` followed by a `FETCH` operation. The observed plan examined one index key and one document and returned one document.

The observed execution time was approximately 12 ms. This is a result from the small demonstration dataset and should not be interpreted as a general performance benchmark.

### 4.5 Schema Validation

A JSON Schema validation rule was applied to the `Transactions` collection.

The rule specifies required transaction fields and their expected BSON data types, including:

- Transaction reference as a string.
- Amount as an integer.
- Merchant and customer as embedded objects.
- Transaction timestamp as a date.
- Status, currency, channel and response code as strings.

An invalid document containing a string value in the `amount` field was submitted.

MongoDB rejected the document and returned:

**Document failed validation**

This confirmed that the collection's validation rule was being enforced.

### 4.6 CRUD Update and Verification

The `updateOne()` operation was used to add an audit note to transaction `FCP_TXN_001`.

```javascript
db.Transactions.updateOne(
  { transaction_ref: "FCP_TXN_001" },
  {
    $set: {
      audit_note: "Reviewed for Portfolio 4 CRUD test"
    }
  }
);
```

The operation returned:

- `acknowledged: true`
- `matchedCount: 1`
- `modifiedCount: 1`
- `upsertedCount: 0`

A subsequent `findOne()` operation confirmed that the new audit field was present and that the original transaction amount and status remained unchanged.

## 5. Summary of Practical Results

The implementation used two fictional transaction documents:

| Transaction | Amount | Status | Channel |
|---|---:|---|---|
| FCP_TXN_001 | ₦35,000 | APPROVED | POS |
| FCP_TXN_002 | ₦12,000 | DECLINED | WEB |

The aggregation exercises produced the following results:

**By currency**

- NGN: 2 transactions.
- Total amount: ₦47,000.
- Average amount: ₦23,500.

**By channel**

- POS: 1 transaction, total ₦35,000.
- WEB: 1 transaction, total ₦12,000.

**By status**

- APPROVED: 1 transaction, total ₦35,000.
- DECLINED: 1 transaction, total ₦12,000.

These figures describe only the two-document MongoDB demonstration dataset, not the full relational transaction dataset.

## 6. Suitability of MongoDB for FinCore Payments

MongoDB is suitable for demonstrating transaction event storage because its document model supports embedded objects and flexible document structures.

Its advantages in this scenario include:

- **Flexible data model:** Additional transaction attributes can be introduced as processing requirements change.
- **Embedded documents:** Merchant and customer information can be stored within the transaction record.
- **Aggregation:** Transaction records can be grouped and summarised.
- **Indexing:** Frequently queried fields such as transaction status can be indexed.
- **Schema validation:** Data type and required-field rules can help prevent inconsistent records.

MongoDB is not presented as a replacement for every relational database operation. A relational database remains useful where structured relationships, constraints and multi-record transactional consistency are central requirements.

## 7. Limitations

The practical implementation used two sample transaction documents. Consequently:

- Aggregation results demonstrate functionality rather than production-level transaction analysis.
- Index execution results are based on a very small collection.
- No large-scale load or stress test was conducted.
- The implementation was performed on a local MongoDB instance rather than a distributed production deployment.

A larger dataset and additional performance testing would be required before making production performance conclusions.

## 8. Conclusion

This portfolio provided practical experience with MongoDB as a document-oriented NoSQL database.

The implementation covered document insertion, retrieval, filtering, nested queries, aggregation, indexing, schema validation and CRUD updates.

The exercises demonstrated how MongoDB can complement the relational database model in a fintech environment by supporting flexible transaction event storage and document-based data retrieval.

## 9. Tools and References

**Tools used**
- MongoDB Community Server
- MongoDB Compass
- MongoDB Shell (`mongosh`)
- GitHub

**Technical references**
- [MongoDB Manual – Schema Validation](https://www.mongodb.com/docs/manual/core/schema-validation/)
- [MongoDB Manual – updateOne()](https://www.mongodb.com/docs/manual/reference/method/db.collection.updateone/)
- [MongoDB Manual – Aggregation](https://www.mongodb.com/docs/manual/aggregation/)
