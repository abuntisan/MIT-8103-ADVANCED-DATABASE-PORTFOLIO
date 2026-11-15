// Portfolio 4: Aggregation by Currency

db.Transactions.aggregate([
    {
        $group: {
            _id: "$currency",
            transaction_count: { $sum: 1 },
            total_amount: { $sum: "$amount" },
            average_amount: { $avg: "$amount" }
        }
    }
]);
