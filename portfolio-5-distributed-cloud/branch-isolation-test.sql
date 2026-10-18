
-- MIT8103 Advanced Database Systems
-- Portfolio 5: Database Branch Isolation Test
-- Organisation: NaijaOpenLearner Online Store
-- Platform: Neon PostgreSQL
-- Database: neondb
--
-- PURPOSE:
-- Demonstrate that changes made in a separate
-- database branch do not automatically change
-- the production branch.
--
-- IMPORTANT:
-- The sections below were executed separately
-- on their specified branches.
-- DO NOT run the entire file on production.


-- ==========================================
-- TEST 1: CREATE TABLE ON TEST BRANCH ONLY
-- ==========================================
-- Branch: portfolio5-cloud-test
-- Database: neondb
-- Compute: Primary for the test branch

CREATE TABLE IF NOT EXISTS
public.portfolio5_branch_isolation_test (
    test_id INTEGER PRIMARY KEY,
    description TEXT NOT NULL
);

INSERT INTO public.portfolio5_branch_isolation_test
    (test_id, description)
VALUES
    (1, 'Created on Portfolio 5 test branch only')
ON CONFLICT (test_id) DO NOTHING;

-- Verify the inserted record on test branch

SELECT *
FROM public.portfolio5_branch_isolation_test;


-- ==========================================
-- TEST 2: VERIFY PRODUCTION IS ISOLATED
-- ==========================================
-- Branch: production
-- Database: neondb
-- Compute: Primary
--
-- IMPORTANT:
-- Run ONLY the SELECT statement below
-- on the production branch.
-- Do not execute the CREATE or INSERT above.

SELECT
    current_database() AS database_name,
    to_regclass(
      'public.portfolio5_branch_isolation_test'
    ) IS NOT NULL AS test_table_exists;


-- ==========================================
-- OBSERVED RESULTS
-- ==========================================
-- TEST BRANCH:
-- Table was created successfully.
-- One record was returned:
-- test_id = 1
-- description =
-- 'Created on Portfolio 5 test branch only'
--
-- PRODUCTION BRANCH:
-- database_name = neondb
-- test_table_exists = false
--
-- CONCLUSION:
-- The test table existed on the test branch
-- but was absent from production when checked.
-- This demonstrated branch isolation.
--
-- LIMITATION:
-- Database branching is not equivalent to
-- database replication, sharding or failover.
