// Portfolio 4: MongoDB Index Testing
// Test the status index on the Transactions collection

db.Transactions.find({
    status: "APPROVED"
}).explain("executionStats");
