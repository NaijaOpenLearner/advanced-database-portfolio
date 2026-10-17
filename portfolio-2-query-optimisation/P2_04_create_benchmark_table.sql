
CREATE TABLE portfolio2_benchmark_payments (
    benchmark_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    payment_status VARCHAR(20) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP NOT NULL
);
