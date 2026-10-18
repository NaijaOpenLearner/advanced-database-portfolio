# Portfolio 5: Personal Learning Reflection

**Course:** MIT8103 - Advanced Database Systems  
**Case Study:** NaijaOpenLearner Online Store  
**Topic:** Distributed and Cloud Database Exercise

## What I Found Challenging

What I found to be the most confusing part of Portfolio 5 was understanding the difference between a database branch and a read replica.

Initially, both seemed like copies of the same database, so I did not fully understand why they were used for different purposes.

As I worked through the practical exercises in Neon PostgreSQL, the difference became clearer.

## What Helped Me Understand

Creating and testing both features helped me understand their purposes better than simply reading their definitions.

When I created a separate database branch, added a table and then checked the production branch, I discovered that the table existed only in my test branch. This helped me understand how database branching provides an isolated environment for development and testing.

The read-replica experiment was different. I connected to a read-only compute and successfully retrieved product information from the existing database. I also compared the results with those from the primary compute.

I learned that the read replica was intended to support reading workloads rather than provide a separate testing environment. In Neon, the read-replica compute uses shared database storage rather than maintaining a completely independent database copy.

Another useful lesson was the importance of selecting the correct compute before running a query. During the consistency comparison, I initially had the read replica selected when I intended to query the primary. Correcting this helped me understand why checking the environment is just as important as writing the correct SQL.

## What I Learned

This practical helped me understand that database branching, read replicas, backups and failover serve different purposes.

I now understand that a database branch can be useful when testing changes without affecting production, while a read replica can help an application handle read-only workloads.

I also learned that a read replica should not automatically be treated as a backup or a guarantee of failover.

The consistency comparison showed that the primary and replica returned matching product data during my tests. However, I understand that this result alone does not prove zero replication delay or guaranteed consistency during every database update.

I also developed a clearer understanding of sharding, which involves distributing different portions of data across database shards rather than creating copies of the same data.

## How I Can Apply This Knowledge

For NaijaOpenLearner Online Store, I would consider database branches useful for testing schema changes before applying them to the production database.

A read replica could be useful if the store grows and needs additional capacity for product browsing or reporting queries.

However, the business would still need appropriate backup, recovery and high-availability arrangements to protect important customer orders and payment information.

## What I Would Improve

If I repeated this practical, I would like to conduct more controlled experiments to understand how data changes become visible to different database connections.

I would also like to learn how to measure database performance under heavier workloads and how failover is configured and tested.

Overall, Portfolio 5 helped me move from knowing database terms to understanding their different purposes through practical experience. It also taught me the importance of checking my assumptions against actual database results.
