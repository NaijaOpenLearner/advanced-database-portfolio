
-- Portfolio 2: Generate fictional payment records

INSERT INTO portfolio2_benchmark_payments (
    payment_status,
    amount,
    created_at
)
SELECT
    CASE
        WHEN n % 100 = 0 THEN 'Successful'
        WHEN n % 100 BETWEEN 1 AND 5 THEN 'Pending'
        ELSE 'Failed'
    END,
    (1000 + (n % 100) * 250)::DECIMAL(10,2),
    CURRENT_TIMESTAMP - (n % 30) * INTERVAL '1 day'
FROM generate_series(1, 100000) AS gs(n);

ANALYZE portfolio2_benchmark_payments;

SELECT
    payment_status,
    COUNT(*) AS total_records
FROM portfolio2_benchmark_payments
GROUP BY payment_status
ORDER BY payment_status;
