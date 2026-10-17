
-- Portfolio 3: Set up a separate transaction practice table
-- This exercise does not modify the main store's inventory

CREATE TABLE IF NOT EXISTS portfolio3_stock_practice (
    product_id INTEGER PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    quantity_on_hand INTEGER NOT NULL
        CHECK (quantity_on_hand >= 0),
    quantity_reserved INTEGER NOT NULL DEFAULT 0
        CHECK (quantity_reserved >= 0),
    CHECK (quantity_reserved <= quantity_on_hand)
);

-- Add one fictional textbook for transaction testing
INSERT INTO portfolio3_stock_practice (
    product_id,
    product_name,
    quantity_on_hand,
    quantity_reserved
)
VALUES (
    1,
    'Practice Database Textbook',
    3,
    0
)
ON CONFLICT (product_id) DO NOTHING;

-- Check our starting stock quantities
SELECT
    product_name,
    quantity_on_hand,
    quantity_reserved,
    quantity_on_hand - quantity_reserved AS quantity_available
FROM portfolio3_stock_practice;
