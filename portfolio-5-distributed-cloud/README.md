# Portfolio 5: Distributed and Cloud Database Exercise

**Course:** MIT8103 - Advanced Database Systems  
**Institution:** MIVA Open University  
**Case Study:** NaijaOpenLearner Online Store  
**Project Type:** Simulated Educational E-Commerce Business  
**Cloud Database Platform:** Neon PostgreSQL  
**Database:** `neondb`  
**Practical Date:** 18 October 2026  
**Status:** Practical exercises completed; final assessment review pending

---

## 1. Project Overview

NaijaOpenLearner Online Store is a simulated e-commerce business that sells educational products such as textbooks, calculators, notebooks and networking study kits.

The business maintains information about customers, products, inventory, orders, payments and deliveries.

As the business grows, it needs database infrastructure that can handle increasing workloads, support development activities and maintain reliable access to important information.

This portfolio investigates distributed and cloud database concepts through practical exercises using Neon PostgreSQL.

## 2. Objectives

The objectives of this portfolio were to:

- Verify an operational PostgreSQL cloud database environment.
- Create a database branch and investigate branch isolation.
- Configure and test a read-only database compute.
- Compare product information returned by the primary and read replica.
- Explain relevant consistency, replication and availability concepts.
- Propose a possible sharding approach for future growth.
- Document results, limitations and personal learning.

## 3. Cloud Database Environment

| Component | Configuration |
|---|---|
| Cloud provider | Neon |
| Database engine | PostgreSQL |
| PostgreSQL version reported | 18.6 |
| Neon project | `naijaopenlearner-db` |
| Database | `neondb` |
| Production branch | `production` |
| Test branch | `portfolio5-cloud-test` |
| Read-replica compute | `portfolio5-read-replica` |

The existing cloud database was verified using SQL queries executed through the Neon SQL Editor.

The primary compute returned `pg_is_in_recovery() = false`.

The environment was then used for database-branching and read-replica experiments.

## 4. Practical Exercise 1: Database Branching and Isolation

A database branch named `portfolio5-cloud-test` was created from the production branch using Neon's branching functionality.

On this test branch, I created a table named `portfolio5_branch_isolation_test` and inserted a sample record.

The table was successfully queried from the test branch.

I then switched to `production` and checked for the table using PostgreSQL's `to_regclass()` function.

**Observed result:** `test_table_exists = false` on production.

This demonstrated that the table created in the test branch was not automatically created in production.

Database branching can therefore provide an isolated environment for testing changes before applying them to a production database.

**Supporting SQL:** [branch-isolation-test.sql](branch-isolation-test.sql)

## 5. Practical Exercise 2: Read Replica Configuration

A read replica compute named `portfolio5-read-replica` was created on the production branch.

The replica was verified using PostgreSQL queries.

**Observed results:**

| Verification | Result |
|---|---|
| `pg_is_in_recovery()` | `true` |
| `transaction_read_only` | `on` |
| Tables retrieved | 9 |
| Product records retrieved | 4 |

The replica could access existing database tables and return product information through read-only SQL queries.

In Neon, read-replica computes access shared database storage rather than maintaining fully independent copies of the database.

This arrangement can support read scalability by directing suitable reading workloads away from the primary compute.

**Supporting SQL:** [cloud-and-replica-verification.sql](cloud-and-replica-verification.sql)

## 6. Practical Exercise 3: Primary and Replica Data Comparison

The same product query was executed separately on the primary compute and the read replica.

Both returned four matching product records.

| Product | Primary Price | Replica Price |
|---|---:|---:|
| Database Systems Textbook | ₦15,000 | ₦15,000 |
| Scientific Calculator | ₦25,000 | ₦25,000 |
| A4 Exercise Notebook | ₦2,000 | ₦2,000 |
| Networking Study Kit | ₦12,000 | ₦12,000 |

The matching results showed that both computes returned the same product information at the times of testing.

However, these tests did not measure replication lag or establish consistency guarantees during concurrent updates.

## 7. Distributed Database Concepts

The practical exercises were supported by a study of high availability, failover, replication, consistency and sharding.

| Concept | Application to NaijaOpenLearner | Implementation Status |
|---|---|---|
| Cloud database | Hosting and querying PostgreSQL through Neon | Verified |
| Branch isolation | Testing database changes away from production | Demonstrated |
| Read replica | Supporting read-only product queries | Demonstrated |
| Data consistency | Comparing primary and replica product records | Observed during testing |
| High availability and failover | Restoring service after component failures | Studied, not tested |
| Database sharding | Dividing a large orders dataset across shards | Proposed, not implemented |

For future growth, the business could evaluate a customer-based shard key for distributing order records.

Any sharding design would need to consider uneven workloads, cross-shard queries, transaction management and operational complexity.

## 8. Practical Evidence

The screenshots below document the actual Neon environment and SQL experiments.

| No. | Evidence | Screenshot |
|---|---|---|
| 1 | Neon cloud compute | [View evidence](p5-01-neon-cloud-compute.png) |
| 2 | Cloud database verification | [View evidence](p5-02-cloud-database-verification.png) |
| 3 | Database branches overview | [View evidence](p5-03-neon-branches-overview.png) |
| 4 | Test branch creation | [View evidence](p5-04-neon-test-branch-created.png) |
| 5 | Test-branch table creation | [View evidence](p5-05-test-branch-table-created.png) |
| 6 | Production isolation verification | [View evidence](p5-06-production-isolation-verified.png) |
| 7 | Read replica creation | [View evidence](p5-07-read-replica-created.png) |
| 8 | Read-only replica verification | [View evidence](p5-08-read-replica-verification.png) |
| 9 | Tables accessible through replica | [View evidence](p5-09-read-replica-tables.png) |
| 10 | Product query on replica | [View evidence](p5-10-read-replica-product-query.png) |
| 11 | Product query on primary | [View evidence](p5-11-primary-product-query.png) |
| 12 | Replica consistency comparison | [View evidence](p5-12-replica-consistency-query.png) |

## 9. Supporting Files

| File | Description |
|---|---|
| [branch-isolation-test.sql](branch-isolation-test.sql) | SQL used to create and verify the isolated test table |
| [cloud-and-replica-verification.sql](cloud-and-replica-verification.sql) | Cloud configuration and read-replica verification queries |
| [cloud-database-analysis.md](cloud-database-analysis.md) | Detailed technical analysis, results and limitations |
| [learning-reflection.md](learning-reflection.md) | Personal learning experience and reflection |

## 10. Limitations

The practical used a small simulated e-commerce dataset and was not designed as a production-scale performance benchmark.

No controlled failover experiment, load test, concurrent-write consistency test or replication-lag measurement was performed.

Database sharding was explained as a possible architectural approach but was not implemented.

The successful primary-versus-replica comparison should not be interpreted as proof of zero latency, automatic failover or guaranteed data consistency under every workload.

## 11. Key Learning Outcomes

The practical helped clarify the differences between database branches, read replicas, backups and failover mechanisms.

Creating a test branch showed how changes can be tested without automatically affecting production.

Using a read replica demonstrated how an existing database can be queried through a separate read-only compute.

Comparing primary and replica results also reinforced the importance of verifying the selected compute and interpreting results only within the limits of the experiment.

## 12. References

1. Neon. [Manage computes](https://neon.com/docs/manage/endpoints/)
2. Neon. [Database branching workflow primer](https://neon.com/docs/get-started-with-neon/workflow-primer)
3. Neon. [Introducing Same-Region Read Replicas to Serverless Postgres](https://neon.com/blog/introducing-same-region-read-replicas-to-serverless-postgres)
4. Neon. [Our Approach to High Availability](https://neon.com/blog/our-approach-to-high-availability)
5. MIVA Open University. MIT8103 - Advanced Database Systems course materials.

## 13. AI Assistance Declaration

**AI Tool Used:** ChatGPT (OpenAI).

**Purpose of Use:** ChatGPT was used as a learning assistant to explain advanced database concepts, suggest and explain SQL queries, troubleshoot practical exercises, and assist with drafting, structuring and editing the portfolio documentation.

**Verification and Individual Work:** I executed the practical SQL queries using Neon PostgreSQL, examined the returned results, captured screenshots and verified the differences between the primary database, test branch and read-replica compute. I also reviewed the explanations and documentation against my practical observations, corrected errors encountered during testing and checked that the supporting evidence was accessible through GitHub.
