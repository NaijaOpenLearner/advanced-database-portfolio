# Portfolio 5: Distributed and Cloud Database Technical Analysis

**Course:** MIT8103 - Advanced Database Systems  
**Case Study:** NaijaOpenLearner Online Store  
**Platform:** Neon PostgreSQL  
**Database:** `neondb`  
**Date of Practical:** 18 October 2026

## 1. Introduction and Objectives

NaijaOpenLearner Online Store is a simulated e-commerce business selling educational products, including textbooks, calculators, stationery and networking kits.

As an online store grows, its database must support customer requests while maintaining reliable access to product, inventory, order and payment information.

The objective of this practical was to explore cloud database features using Neon PostgreSQL, with particular attention to cloud deployment, database branching, read replicas and data consistency.

The practical also considers high availability, failover and database sharding as possible architectural requirements for a larger e-commerce system.

## 2. Cloud Database Environment

I used an existing Neon PostgreSQL project named `naijaopenlearner-db`, containing the `neondb` database on the `production` branch.

To verify the environment, I executed a SQL query using `current_database()`, `current_setting('server_version')` and `pg_is_in_recovery()`.

The results confirmed:

- Database name: `neondb`
- PostgreSQL version reported: `18.6`
- `pg_is_in_recovery()`: `false` on the primary compute

The result was consistent with a primary PostgreSQL compute accepting normal database operations.

**Evidence:** `p5-01-neon-cloud-compute.png` and `p5-02-cloud-database-verification.png`

## 3. Database Branching and Isolation

I created a Neon database branch named `portfolio5-cloud-test` from the existing `production` branch, selecting the option to include schema and data.

Neon branching uses copy-on-write storage, enabling a branch to begin with the parent database's state without immediately duplicating the entire dataset.

To test isolation, I created a table called `portfolio5_branch_isolation_test` in the test branch and inserted one record.

The query returned a record with `test_id = 1`, confirming that the table existed on the test branch.

I then switched to the production branch and checked for the table using `to_regclass()`.

The production result was `test_table_exists = false`.

**Interpretation:** The practice table existed in the test branch but was absent from production when checked. This demonstrated that changes made in the test branch did not automatically affect its parent.

For NaijaOpenLearner Online Store, branching could provide a safer environment for testing database changes before applying them to production.

**Evidence:** `p5-03-neon-branches-overview.png` through `p5-06-production-isolation-verified.png`  
**SQL:** `branch-isolation-test.sql`

## 4. Read Replica Configuration and Verification

Next, I created a read replica compute named `portfolio5-read-replica` on the production branch.

Its purpose was to provide a read-only compute for queries such as product browsing and reporting.

I selected the replica compute in the Neon SQL Editor and executed verification queries.

The results included:

- `pg_is_in_recovery() = true`
- `transaction_read_only = on`

These results were consistent with a read-only PostgreSQL replica connection.

I also queried `information_schema.tables` and retrieved nine tables, including `customers`, `orders`, `payments`, `inventory` and `products`.

A product query successfully returned four product records through the replica.

Unlike conventional PostgreSQL replicas that maintain separately synchronized database copies, Neon read-replica computes access a shared storage architecture.

**Evidence:** `p5-07-read-replica-created.png` through `p5-10-read-replica-product-query.png`  
**SQL:** `cloud-and-replica-verification.sql`

## 5. Primary and Replica Data Consistency

To compare the primary compute and read replica, I executed the same product query on each compute, ordering the output by `product_id`.

Both queries returned four matching products:

| Product | Price on Primary | Price on Replica |
|---|---:|---:|
| Database Systems Textbook | ₦15,000 | ₦15,000 |
| Scientific Calculator | ₦25,000 | ₦25,000 |
| A4 Exercise Notebook | ₦2,000 | ₦2,000 |
| Networking Study Kit | ₦12,000 | ₦12,000 |

All observed product IDs, names, categories and prices matched.

**Interpretation:** The primary and replica returned the same product information at the times of the tests.

However, this was a comparison of existing data, not a controlled experiment involving concurrent updates. It therefore did not measure replication lag or establish consistency guarantees for every possible workload.

**Evidence:** `p5-11-primary-product-query.png` and `p5-12-replica-consistency-query.png`

## 6. High Availability and Failover

High availability concerns keeping database services accessible or restoring them quickly when components fail.

Failover refers to transferring or restoring service through another available component after a failure.

For NaijaOpenLearner Online Store, a database interruption during checkout could prevent customers from placing orders or confirming payments.

An appropriate production architecture would need failure monitoring, recovery arrangements and clearly defined recovery objectives.

Two useful measurements are:

**Recovery Time Objective (RTO):** The maximum acceptable time required to restore service.

**Recovery Point Objective (RPO):** The maximum acceptable amount of recent data that could be lost, normally expressed as a time interval.

I did not conduct a primary failure or failover experiment. Therefore, no actual RTO, RPO or failover duration was measured.

The read replica created in this practical should not be presented as proof of automatic failover.

## 7. Proposed Sharding Architecture

Database sharding involves dividing a dataset into different subsets distributed across multiple shards.

If NaijaOpenLearner Online Store eventually manages millions of orders, it could consider horizontally sharding its orders data using a carefully selected shard key.

For example, a customer-based shard key could help locate the orders belonging to a particular customer.

Potential benefits include distributing storage and processing workloads.

However, sharding introduces additional complexity, including choosing a balanced shard key, managing transactions across shards and performing cross-shard queries.

The organisation would need to evaluate whether its actual workload justifies this complexity before implementing sharding.

**Implementation status:** Sharding was studied and proposed conceptually. No database shards were deployed in this practical.

## 8. Practical Limitations

The main limitations of this exercise were:

- The dataset was small and did not represent real production traffic.
- No concurrent-write consistency test was conducted.
- No replication-lag measurement was performed.
- No controlled failover experiment was carried out.
- No database sharding was implemented.
- No load test established that the read replica improved throughput.
- Cloud database branching was demonstrated, but branching is not equivalent to failover or sharding.

These limitations should be considered when interpreting the results.

## 9. Conclusion

This practical demonstrated several useful cloud database capabilities through hands-on work with Neon PostgreSQL.

The branch-isolation experiment showed that a separate database branch could be modified without automatically changing production.

The read-replica experiment confirmed a read-only compute connection, access to existing tables and matching product records between the primary and replica during testing.

The broader analysis also identified high availability, consistency requirements and sharding as important considerations for the future growth of NaijaOpenLearner Online Store.

The exercise distinguishes demonstrated results from proposed architecture rather than treating theoretical features as implemented systems.

## References

1. Neon. *Manage computes.* https://neon.com/docs/manage/endpoints/
2. Neon. *Database branching workflow primer.* https://neon.com/docs/get-started-with-neon/workflow-primer
3. Neon. *Introducing Same-Region Read Replicas to Serverless Postgres.* https://neon.com/blog/introducing-same-region-read-replicas-to-serverless-postgres
4. Neon. *Our Approach to High Availability.* https://neon.com/blog/our-approach-to-high-availability

Additional practical evidence and SQL scripts are available in this Portfolio 5 GitHub folder.
