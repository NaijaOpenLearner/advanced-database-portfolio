
-- Portfolio 3: Session B - Amina
-- Attempt to lock the record already locked by Chinedu
-- NOWAIT prevents the query from waiting indefinitely

SELECT
    pg_backend_pid() AS session_b_id,
    product_id,
    product_name,
    quantity_on_hand,
    quantity_reserved
FROM public.portfolio3_stock_practice
WHERE product_id = 1
FOR UPDATE NOWAIT;
