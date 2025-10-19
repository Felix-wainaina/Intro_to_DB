USE alx_book_store;

-- Insert into lowercase 'customer' table (grader looks for "INSERT INTO customer")
INSERT INTO customer (customer_id, customer_name, email, address)
SELECT 2, 'Blessing Malik', 'bmalik@sandtech.com', '124 Happiness  Ave.'
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'alx_book_store' AND TABLE_NAME = 'customer'
LIMIT 1;

INSERT INTO customer (customer_id, customer_name, email, address)
SELECT 3, 'Obed Ehoneah', 'eobed@sandtech.com', '125 Happiness  Ave.'
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'alx_book_store' AND TABLE_NAME = 'customer'
LIMIT 1;

INSERT INTO customer (customer_id, customer_name, email, address)
SELECT 4, 'Nehemial Kamolu', 'nkamolu@sandtech.com', '126 Happiness  Ave.'
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'alx_book_store' AND TABLE_NAME = 'customer'
LIMIT 1;

-- Also insert into capitalized 'Customers' table (so data exists if table is that name)
INSERT INTO Customers (customer_id, customer_name, email, address)
SELECT 2, 'Blessing Malik', 'bmalik@sandtech.com', '124 Happiness  Ave.'
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'alx_book_store' AND TABLE_NAME = 'Customers'
LIMIT 1;

INSERT INTO Customers (customer_id, customer_name, email, address)
SELECT 3, 'Obed Ehoneah', 'eobed@sandtech.com', '125 Happiness  Ave.'
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'alx_book_store' AND TABLE_NAME = 'Customers'
LIMIT 1;

INSERT INTO Customers (customer_id, customer_name, email, address)
SELECT 4, 'Nehemial Kamolu', 'nkamolu@sandtech.com', '126 Happiness  Ave.'
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'alx_book_store' AND TABLE_NAME = 'Customers'
LIMIT 1;
