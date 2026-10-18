# Portfolio 3: Transactions and Concurrency

**Course:** MIT8103 - Advanced Database Systems

**Case Study:** NaijaOpenLearner Online Store

**Project Type:** Simulated E-Commerce Platform

**Database Platform:** Neon PostgreSQL

**Practical Tools:** Neon SQL Editor and DBeaver

**Status:** Practical exercises completed; final portfolio review pending.

## 1. Portfolio Overview

This portfolio demonstrates how PostgreSQL transactions and concurrency-control mechanisms can help maintain database consistency in an online store.

The practical exercises focus on transaction commit and rollback, stock reservation, transaction isolation, row-level locking and conflicting database sessions.

A separate practice table named `portfolio3_stock_practice` was used to test inventory operations without modifying the main store's inventory.

## 2. Practical Exercises

The following exercises were completed:

1. Created a practice inventory table with primary-key and CHECK constraints.
2. Demonstrated ROLLBACK and verified that uncommitted changes were cancelled.
3. Demonstrated COMMIT and confirmed that changes were retained.
4. Tested conditional stock reservations to prevent over-reservation.
5. Examined the READ COMMITTED transaction isolation setting.
6. Used two DBeaver connections to demonstrate a row-lock conflict and its resolution.

## 3. SQL Scripts

| File | Description |
|---|---|
| [P3_01_setup_transaction_practice.sql](./P3_01_setup_transaction_practice.sql) | Creates the practice table and inserts sample data |
| [P3_02_transaction_rollback.sql](./P3_02_transaction_rollback.sql) | Demonstrates ROLLBACK |
| [P3_02_verify_rollback.sql](./P3_02_verify_rollback.sql) | Independently verifies the rollback result |
| [P3_03_transaction_commit.sql](./P3_03_transaction_commit.sql) | Demonstrates COMMIT |
| [P3_04_prepare_last_copy.sql](./P3_04_prepare_last_copy.sql) | Prepares the final available textbook |
| [P3_05_reserve_last_copy.sql](./P3_05_reserve_last_copy.sql) | Reserves the remaining textbook |
| [P3_06_prevent_over_reservation.sql](./P3_06_prevent_over_reservation.sql) | Prevents reservation when stock is exhausted |
| [P3_07_read_committed_isolation.sql](./P3_07_read_committed_isolation.sql) | Checks the READ COMMITTED isolation setting |
| [P3_08_session_a_row_lock.sql](./P3_08_session_a_row_lock.sql) | Session A acquires a row lock |
| [P3_09_session_b_lock_conflict.sql](./P3_09_session_b_lock_conflict.sql) | Session B attempts a conflicting lock |
| [P3_10_session_b_after_lock_release.sql](./P3_10_session_b_after_lock_release.sql) | Verifies successful access after lock release |

## 4. Results and Observations

The transaction exercises demonstrated that ROLLBACK cancels uncommitted changes, while COMMIT retains completed changes.

The inventory-reservation exercise showed that a conditional UPDATE could prevent additional reservations when all three textbooks had already been reserved.

The two-session concurrency experiment demonstrated that PostgreSQL can reject a conflicting row-lock request.

Session A acquired the textbook row lock. Session B attempted to acquire the same lock using FOR UPDATE NOWAIT and received PostgreSQL error 55P03.

After Session A executed ROLLBACK, Session B repeated the query successfully.

## 5. Supporting Evidence

Twelve screenshots are included in this folder to document the practical exercises.

Key evidence includes:

- [Practice table structure](./p3-01-practice-table-structure.png)
- [Rollback verification](./p3-02-rollback-verification-check.png)
- [Transaction commit](./p3-03-commit.png)
- [Over-reservation rejected](./p3-06-reservation-rejected.png)
- [READ COMMITTED setting](./p3-07-read-committed.png)
- [Session A row lock](./p3-08-session-a-row-lock.png)
- [Session B lock conflict](./p3-09-session-b-lock-conflict.png)
- [Successful access after lock release](./p3-10-session-b-after-lock-release.png)

## 6. Detailed Analysis and Learning Reflection

The explanations, observations, limitations, personal learning reflection and PostgreSQL references are available in:

**[Portfolio 3: Transaction and Concurrency Analysis](./transaction-analysis.md)**

## 7. Reproducibility Notes

The SQL files document the sequence of experiments performed using Neon PostgreSQL and DBeaver.

Some scripts modify inventory records. They should not be rerun indiscriminately against an already populated database because repeated execution may change the practice data.

The row-locking experiment requires two separate database connections, with Session A keeping its transaction open while Session B attempts to acquire a conflicting lock.

All sample inventory data used in these experiments is fictional.
