
-- NaijaOpenLearner Online Store
-- MIT8103 Portfolio 1: Database Constraint Tests
--
-- Each test is expected to fail because it deliberately
-- attempts to violate a database constraint.
--
-- IMPORTANT: Run each test separately in PostgreSQL.
-- These errors demonstrate that data integrity is enforced.


-- TEST 1: Negative Product Price
-- Expected: CHECK constraint violation (SQLSTATE 23514)

INSERT INTO products (
    product_name,
    category,
    unit_price
)
VALUES (
    'Invalid Price Test Product',
    'Testing',
    -5000.00
);


-- TEST 2: Nonexistent Customer
-- Expected: Foreign-key violation (SQLSTATE 23503)

INSERT INTO orders (customer_id)
VALUES (999999);


-- TEST 3: Excessive Inventory Allocation
-- Expected: CHECK constraint violation (SQLSTATE 23514)

UPDATE inventory
SET quantity_allocated = quantity_on_hand + 1
WHERE product_id = (
    SELECT product_id
    FROM products
    WHERE product_name = 'Database Systems Textbook'
);
