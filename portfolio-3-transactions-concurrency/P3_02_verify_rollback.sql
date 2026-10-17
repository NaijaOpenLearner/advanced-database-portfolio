-- Portfolio 3: Independently verify the rollback result

SELECT
    product_name,
    quantity_on_hand,
    quantity_reserved,
    quantity_on_hand - quantity_reserved AS quantity_available
FROM portfolio3_stock_practice
WHERE product_id = 1;
