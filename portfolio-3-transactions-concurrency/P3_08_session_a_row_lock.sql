
-- Portfolio 3: Session A - Chinedu
-- Lock the textbook record for our concurrency experiment

SELECT
    pg_backend_pid() AS session_a_id,
    product_id,
    product_name,
    quantity_on_hand,
    quantity_reserved
FROM public.portfolio3_stock_practice
WHERE product_id = 1
FOR UPDATE;
