
-- Portfolio 3: Customer B attempts to reserve unavailable stock
-- Expected result: Zero new reservations

WITH attempted_reservation AS (
    UPDATE portfolio3_stock_practice
    SET quantity_reserved = quantity_reserved + 1
    WHERE product_id = 1
      AND quantity_reserved < quantity_on_hand
    RETURNING product_id
)
SELECT COUNT(*) AS reservations_made
FROM attempted_reservation;

-- Verify that stock was not overallocated
SELECT
    product_name,
    quantity_on_hand,
    quantity_reserved,
    quantity_on_hand - quantity_reserved AS quantity_available
FROM portfolio3_stock_practice
WHERE product_id = 1;
