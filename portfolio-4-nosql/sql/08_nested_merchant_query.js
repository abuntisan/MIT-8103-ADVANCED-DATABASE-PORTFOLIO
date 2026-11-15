// Test 8: Query transactions by embedded merchant business name

db.Transactions.find({
    "merchant.business_name": "FinCore Merchant A"
});
