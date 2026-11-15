// Portfolio 4: Transaction Aggregation by Channel

db.Transactions.aggregate([
    {
        $group: {
            _id: "$channel",
            transaction_count: { $sum: 1 },
            total_amount: { $sum: "$amount" },
            average_amount: { $avg: "$amount" }
        }
    }
]);
