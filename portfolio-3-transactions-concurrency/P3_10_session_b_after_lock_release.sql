
-- Portfolio 3: Session B - Lock Release Verification
-- Case Study: NaijaOpenLearner Online Store
--
-- Session A previously locked this textbook record
-- using SELECT ... FOR UPDATE.
--
-- Session B initially received PostgreSQL error 55P03
-- when attempting to acquire the same lock.
--
-- After Session A executed ROLLBACK, Session B
-- repeated the same query successfully.
--
-- Observed result: One textbook record returned.

SELECT
    pg_backend_pid() AS session_b_id,
    product_id,
    product_name,
    quantity_on_hand,
    quantity_reserved
FROM public.portfolio3_stock_practice
WHERE product_id = 1
FOR UPDATE NOWAIT;
