
-- MIT8103 Advanced Database Systems
-- Portfolio 5: Distributed and Cloud Database Exercise
-- Organisation: NaijaOpenLearner Online Store
-- Database: Neon PostgreSQL (neondb)
--
-- These are read-only verification queries.
-- Each query was executed in the Neon SQL Editor.
-- The appropriate compute is specified for each test.

-- TEST 1: Verify cloud PostgreSQL database
-- Branch: production
-- Compute: Primary

SELECT
    current_database() AS database_name,
    current_setting('server_version') AS postgres_version,
    pg_is_in_recovery() AS in_recovery,
    CURRENT_TIMESTAMP AS checked_at;


-- TEST 2: Verify read replica configuration
-- Branch: production
-- Compute: portfolio5-read-replica

SELECT
    current_database() AS database_name,
    pg_is_in_recovery() AS in_recovery,
    current_setting('transaction_read_only') AS read_only_mode,
    CURRENT_TIMESTAMP AS checked_at;


-- TEST 3: List tables accessible through replica
-- Branch: production
-- Compute: portfolio5-read-replica

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
  AND table_type = 'BASE TABLE'
ORDER BY table_name;


-- TEST 4: Compare product records
-- Execute the same query separately on:
--   A. Primary
--   B. portfolio5-read-replica
-- Branch: production
-- Database: neondb

SELECT
    product_id,
    product_name,
    category,
    unit_price
FROM public.products
ORDER BY product_id;
