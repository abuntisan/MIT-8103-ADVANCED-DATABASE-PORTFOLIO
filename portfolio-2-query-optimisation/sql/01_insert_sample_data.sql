
-- FinCore Payments
-- Portfolio 2: Sample Data Insertion

-- 1. Insert sample customers
INSERT INTO customers (customer_ref, full_name, email)
VALUES
('CUS001', 'John Ade', 'john@example.com'),
('CUS002', 'Mary James', 'mary@example.com'),
('CUS003', 'David Okoro', 'david@example.com'),
('CUS004', 'Sarah Bello', 'sarah@example.com'),
('CUS005', 'Peter Musa', 'peter@example.com');

-- 2. Insert sample merchants
INSERT INTO merchants (merchant_ref, business_name, status)
VALUES
('MER001', 'ABC Supermarket', 'ACTIVE'),
('MER002', 'City Pharmacy', 'ACTIVE'),
('MER003', 'Quick Foods', 'ACTIVE'),
('MER004', 'Tech Store', 'INACTIVE');

-- 3. Insert payment terminals
INSERT INTO payment_terminals
(merchant_id, terminal_code, status)
VALUES
(1, 'TID1001', 'ACTIVE'),
(1, 'TID1002', 'ACTIVE'),
(2, 'TID2001', 'ACTIVE'),
(2, 'TID2002', 'ACTIVE'),
(3, 'TID3001', 'ACTIVE'),
(4, 'TID4001', 'INACTIVE');

-- 4. Insert payment transactions
INSERT INTO payment_transactions
(terminal_id, customer_id, transaction_ref, amount, currency, response_code, status)
VALUES
(1, 1, 'TXN10001', 15000.00, 'NGN', '00', 'APPROVED'),
(2, 2, 'TXN10002', 25000.00, 'NGN', '05', 'DECLINED'),
(3, 3, 'TXN10003', 5000.00, 'NGN', '00', 'APPROVED'),
(4, 4, 'TXN10004', 12000.00, 'NGN', '51', 'DECLINED'),
(5, 5, 'TXN10005', 8000.00, 'NGN', '00', 'APPROVED'),
(1, 1, 'TXN10006', 30000.00, 'NGN', NULL, 'PENDING'),
(2, 3, 'TXN10007', 4500.00, 'NGN', '00', 'APPROVED'),
(3, 2, 'TXN10008', 18000.00, 'NGN', '05', 'DECLINED'),
(5, 4, 'TXN10009', 7500.00, 'NGN', '00', 'APPROVED'),
(6, 5, 'TXN10010', 20000.00, 'NGN', NULL, 'PENDING');

-- 5. Insert transaction reversals
INSERT INTO transaction_reversals
(transaction_id, reversal_ref, amount, reason, status)
VALUES
(1, 'REV10001', 15000.00, 'Customer refund', 'COMPLETED'),
(3, 'REV10002', 5000.00, 'Duplicate transaction', 'PENDING'),
(5, 'REV10003', 8000.00, 'Customer dispute', 'FAILED');
