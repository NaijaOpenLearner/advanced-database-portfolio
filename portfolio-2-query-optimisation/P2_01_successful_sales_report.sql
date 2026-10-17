
-- Portfolio 2: Successful sales report
-- Count only successful payments, excluding failed attempts

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
