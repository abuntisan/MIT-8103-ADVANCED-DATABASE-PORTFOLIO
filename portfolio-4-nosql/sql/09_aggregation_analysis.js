// Test 9: Aggregate transaction data by status

db.Transactions.aggregate([
    {
        $group: {
            _id: "$status",
            transaction_count: { $sum: 1 },
            total_amount: { $sum: "$amount" },
            average_amount: { $avg: "$amount" }
        }
    }
]);
