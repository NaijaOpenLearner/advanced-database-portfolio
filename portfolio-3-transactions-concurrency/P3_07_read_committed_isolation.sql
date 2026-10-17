
-- Portfolio 3: Examine transaction isolation
-- Demonstrate the READ COMMITTED isolation setting

BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

SELECT
    current_setting('transaction_isolation') AS isolation_level;

COMMIT;
