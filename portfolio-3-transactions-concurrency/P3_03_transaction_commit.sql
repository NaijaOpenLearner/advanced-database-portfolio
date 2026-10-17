
-- Portfolio 3: Demonstrate transaction COMMIT
-- Reserve one textbook and save the change permanently

BEGIN;

UPDATE portfolio3_stock_practice
SET quantity_reserved = quantity_reserved + 1
WHERE product_id = 1
  AND quantity_reserved < quantity_on_hand
RETURNING
    product_name,
    quantity_on_hand,
    quantity_reserved,
    quantity_on_hand - quantity_reserved AS quantity_available;

COMMIT;

-- Verify that the reservation was saved
SELECT
    product_name,
    quantity_on_hand,
    quantity_reserved,
    quantity_on_hand - quantity_reserved AS quantity_available
FROM portfolio3_stock_practice
WHERE product_id = 1;
