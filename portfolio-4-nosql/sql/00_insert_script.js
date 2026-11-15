{
  "transaction_ref": "FCP_TXN_001",
  "merchant": {
    "merchant_ref": "MER_001",
    "business_name": "FinCore Merchant A"
  },
  "customer": {
    "customer_ref": "CUS_001",
    "name": "John Ade"
  },
  "amount": 35000,
  "currency": "NGN",
  "status": "APPROVED",
  "response_code": "00",
  "channel": "POS",
  "transaction_time": {
    "$date": "2026-11-14T10:30:00Z"
  }
}




{
  "transaction_ref": "FCP_TXN_002",
  "merchant": {
    "merchant_ref": "MER_002",
    "business_name": "FinCore Merchant B"
  },
  "customer": {
    "customer_ref": "CUS_002",
    "name": "Mary Bello"
  },
  "amount": 12000,
  "currency": "NGN",
  "status": "DECLINED",
  "response_code": "05",
  "channel": "WEB",
  "transaction_time": {
    "$date": "2026-11-14T11:15:00Z"
  }
}
