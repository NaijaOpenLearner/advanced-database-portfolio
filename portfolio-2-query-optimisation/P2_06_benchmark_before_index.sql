
-- Portfolio 2: Performance test BEFORE indexing
-- Retrieve successful payments from the benchmark table

EXPLAIN (ANALYZE, BUFFERS)
SELECT
    benchmark_id,
    payment_status,
    amount,
    created_at
FROM portfolio2_benchmark_payments
WHERE payment_status = 'Successful';
