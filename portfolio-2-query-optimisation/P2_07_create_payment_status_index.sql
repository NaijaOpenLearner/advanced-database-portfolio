
-- Portfolio 2: Create an index on payment status
-- This index may improve searches for successful payments

CREATE INDEX idx_p2_benchmark_payment_status
ON portfolio2_benchmark_payments (payment_status);

-- Refresh PostgreSQL table statistics
ANALYZE portfolio2_benchmark_payments;
