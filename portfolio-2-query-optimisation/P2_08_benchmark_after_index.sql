
-- Portfolio 2: Performance test AFTER indexing
-- Run the same query used before creating the index

EXPLAIN (ANALYZE, BUFFERS)
SELECT
    benchmark_id,
    payment_status,
    amount,
    created_at
FROM portfolio2_benchmark_payments
WHERE payment_status = 'Successful';
