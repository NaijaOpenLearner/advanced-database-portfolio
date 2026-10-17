
-- Portfolio 2: Measure actual query execution
-- EXPLAIN ANALYZE executes this read-only SELECT
-- BUFFERS reports PostgreSQL buffer usage

EXPLAIN (ANALYZE, BUFFERS)
SELECT
    c.full_name AS customer,
    COUNT(DISTINCT o.order_id) AS paid_orders,
    SUM(p.amount) AS total_paid
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN payments p
    ON o.order_id = p.order_id
WHERE p.payment_status = 'Successful'
GROUP BY c.customer_id, c.full_name
ORDER BY total_paid DESC;
