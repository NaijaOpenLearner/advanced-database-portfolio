
-- Add three fictional customers
INSERT INTO customers (full_name, email)
VALUES
('Ada Okafor', 'ada.okafor@example.com'),
('Chinedu Obi', 'chinedu.obi@example.com'),
('Zainab Musa', 'zainab.musa@example.com');

-- Add four educational products
INSERT INTO products (product_name, category, unit_price)
VALUES
('Database Systems Textbook', 'Textbooks', 15000.00),
('Scientific Calculator', 'Calculators', 25000.00),
('A4 Exercise Notebook', 'Stationery', 2000.00),
('Networking Study Kit', 'Learning Kits', 12000.00);

-- Add inventory records
INSERT INTO inventory
(product_id, quantity_on_hand, quantity_allocated)
SELECT
    product_id,
    CASE product_name
        WHEN 'Database Systems Textbook' THEN 3
        WHEN 'Scientific Calculator' THEN 5
        WHEN 'A4 Exercise Notebook' THEN 20
        WHEN 'Networking Study Kit' THEN 8
    END,
    0
FROM products
WHERE product_name IN (
    'Database Systems Textbook',
    'Scientific Calculator',
    'A4 Exercise Notebook',
    'Networking Study Kit'
);

-- Display product inventory
SELECT
    p.product_name,
    p.unit_price,
    i.quantity_on_hand,
    i.quantity_allocated,
    i.quantity_on_hand - i.quantity_allocated
        AS quantity_available
FROM products p
JOIN inventory i
    ON p.product_id = i.product_id
ORDER BY p.product_id;
