# Portfolio 3: Transaction and Concurrency Analysis

**Course:** MIT8103 - Advanced Database Systems

**Case Study:** NaijaOpenLearner Online Store

**Database Platform:** Neon PostgreSQL

**Practical Tools:** Neon SQL Editor and DBeaver

## 1. Purpose of the Experiment

The purpose of this practical exercise was to investigate how PostgreSQL manages transactions, protects data integrity and controls access when multiple database sessions interact with the same records.

A separate practice table, `portfolio3_stock_practice`, was created to simulate stock reservations for an educational textbook. This allowed the experiments to be performed without changing the main online store's inventory.

## 2. Transaction Commit and Rollback

The first experiments examined the difference between `COMMIT` and `ROLLBACK`.

During the rollback experiment, a textbook reservation was made inside a transaction and subsequently cancelled using `ROLLBACK`. Verification showed that the reserved quantity returned to its original value.

During the commit experiment, the reservation was saved using `COMMIT`. The resulting stock quantities showed that the change had been retained.

These exercises demonstrate why transactions are important for operations involving payments, orders and inventory.

## 3. Preventing Excessive Stock Reservations

The practice table contained three textbooks.

After the reservation exercises, all three copies became reserved, leaving zero available.

An additional reservation was attempted using a conditional `UPDATE` statement:

`AND quantity_reserved < quantity_on_hand`

PostgreSQL returned zero newly reserved records. A subsequent verification showed that the reserved quantity remained at three.

This demonstrates how a conditional database update can help prevent customers from reserving more products than are available.

## 4. Transaction Isolation

The transaction isolation exercise confirmed that PostgreSQL could operate using the `READ COMMITTED` isolation level.

Under this isolation level, ordinary queries do not read changes that another transaction has not committed.

The practical evidence confirms the configured isolation setting. It does not, by itself, demonstrate every behaviour or anomaly associated with transaction isolation.

## 5. Row-Level Locking and Concurrency

A concurrency experiment was conducted using two separate DBeaver database connections.

**Session A - Chinedu:** Executed `SELECT ... FOR UPDATE` on the textbook record while keeping the transaction open.

**Session B - Amina:** Attempted to lock the same record using `SELECT ... FOR UPDATE NOWAIT`.

PostgreSQL rejected Session B's request with error `55P03`, indicating that the row lock could not be obtained.

Session A then executed `ROLLBACK`, releasing its lock.

When Session B repeated the same query, PostgreSQL successfully returned the textbook record.

This demonstrated that conflicting row locks can prevent simultaneous modifications and that transaction locks are released when the transaction ends.

## 6. Observations and Limitations

The practical exercises demonstrated transaction commit, rollback, conditional stock reservation, isolation configuration and row-lock contention.

The stock-reservation tests used a simplified fictional inventory table. They did not implement the complete online store's order-processing workflow or an automatic reservation-expiry timer.

The two-session experiment demonstrated a specific locking conflict and its resolution, rather than every possible concurrency problem.

## 7. Learning Reflection

This practical exercise helped me understand why database transactions and concurrency control are important for maintaining accurate information in an online store.

For example, if NaijaOpenLearner Online Store has only one textbook left and Chinedu and Amina attempt to reserve it at almost the same time, both customers might initially see that the book is available. If the system does not properly coordinate their reservations, it could confirm two orders for the same physical textbook.

This would create an inconsistency because the database records would no longer reflect the actual available stock. One customer might later be informed that the book is unavailable, even though their order had already been accepted.

Through the COMMIT and ROLLBACK exercises, I learned that COMMIT saves changes made within a transaction, while ROLLBACK cancels uncommitted changes. I also understood why checking stock availability and reserving inventory must be coordinated carefully.

The concurrency experiment in DBeaver helped me understand row-level locking more clearly. When Chinedu's transaction locked the textbook record, Amina's attempt to acquire the same lock using FOR UPDATE NOWAIT was rejected with PostgreSQL error 55P03. After Chinedu rolled back his transaction, Amina could successfully acquire the lock.

This demonstrated how PostgreSQL can control conflicting access to database records and how locks are released when transactions end.

For NaijaOpenLearner Online Store, I would use conditional stock updates, appropriate database constraints and transaction management to help prevent overselling and maintain consistency between inventory and confirmed orders.

My main lesson is that a database should not only store information correctly; it must also protect that information when several users perform operations at the same time.

## 8. Supporting Evidence

The Portfolio 3 GitHub folder contains 11 SQL scripts and 12 screenshots documenting the experiments.

Important concurrency evidence includes:

- [p3-08-session-a-row-lock.png](./p3-08-session-a-row-lock.png) - Session A's row-lock acquisition.
- [p3-09-session-b-lock-conflict.png](./p3-09-session-b-lock-conflict.png) - Session B's lock conflict, error 55P03.
- [p3-10-session-b-after-lock-release.png](./p3-10-session-b-after-lock-release.png) - Successful query after the lock was released.

## 9. References

- PostgreSQL Global Development Group. (n.d.). [Transactions](https://www.postgresql.org/docs/current/tutorial-transactions.html). *PostgreSQL Documentation*.

- PostgreSQL Global Development Group. (n.d.). [Transaction Isolation](https://www.postgresql.org/docs/current/transaction-iso.html). *PostgreSQL Documentation*.

- PostgreSQL Global Development Group. (n.d.). [Explicit Locking](https://www.postgresql.org/docs/current/explicit-locking.html). *PostgreSQL Documentation*.
