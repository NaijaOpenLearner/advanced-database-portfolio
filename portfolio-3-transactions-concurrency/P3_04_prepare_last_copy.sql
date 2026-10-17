
-- Portfolio 3: Prepare the last available textbook
-- Reserve one more copy for our concurrency exercise

UPDATE portfolio3_stock_practice
SET quantity_reserved = quantity_reserved + 1
WHERE product_id = 1
  AND quantity_reserved < quantity_on_hand
RETURNING
    product_name,
    quantity_on_hand,
    quantity_reserved,
    quantity_on_hand - quantity_reserved AS quantity_available;
