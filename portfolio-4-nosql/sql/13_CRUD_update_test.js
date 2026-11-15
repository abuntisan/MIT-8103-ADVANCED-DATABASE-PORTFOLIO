db.Transactions.updateOne(
  { transaction_ref: "FCP_TXN_001" },
  {
    $set: {
      audit_note: "Reviewed for Portfolio 4 CRUD test"
    }
  }
);
