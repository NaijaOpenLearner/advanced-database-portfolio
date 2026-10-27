
# Portfolio 2: Query Performance Analysis

Course: MIT8103 - Advanced Database Systems

Case Study: NaijaOpenLearner Online Store

Database Platform: Neon PostgreSQL

## 1. Purpose of the Experiment

The purpose of this experiment was to investigate how database indexing affects SQL query execution.

I used a separate benchmark table containing 100,000 fictional payment records to compare query performance before and after creating an index on the payment_status column.

## 2. Benchmark Dataset

The benchmark table contains:

| Payment Status | Number of Records |
|---|---:|
| Failed | 94,000 |
| Pending | 5,000 |
| Successful | 1,000 |
| Total | 100,000 |

The test query retrieves records where payment_status = 'Successful'.

## 3. Performance Measurements

| Test | Execution Method | Execution Time |
|---|---|---:|
| Before indexing | Sequential Scan | 4.05 ms |
| After indexing - Run 1 | Index Scan | 1.07 ms |
| After indexing - Run 2 | Index Scan | 59.2 ms |
| After indexing - Run 3 | Index Scan | 0.538 ms |

## 4. Interpretation of Execution Plans

### 4.1 Before Indexing: Sequential Scan

Before creating the index, PostgreSQL used a Sequential Scan (Seq Scan).

A Sequential Scan means PostgreSQL examines the table's records to identify rows that satisfy the query condition.

In this experiment, the query searched for payments with the status 'Successful'.

The original execution time was 4.05 milliseconds.

### 4.2 After Indexing: Index Scan

I created a B-tree index named idx_p2_benchmark_payment_status on the payment_status column.

After creating the index, PostgreSQL used an Index Scan.

An Index Scan allows PostgreSQL to use the index to locate matching records rather than examining every record in the table.

Only 1,000 out of the 100,000 benchmark records had the status 'Successful'. This represents 1% of the dataset.

Because the query selected a relatively small proportion of records, an index could provide a more efficient way to locate them.

The execution plan screenshots confirm that PostgreSQL changed from a Sequential Scan to an Index Scan.

## 5. Performance Comparison and Observations

The original query took 4.05 milliseconds before indexing.

After indexing, the recorded execution times were 1.07 ms, 59.2 ms and 0.538 ms.

Two of the three indexed executions were faster than the original measurement. The fastest indexed execution was approximately 7.5 times faster than the baseline.

However, the second indexed execution took 59.2 ms, which was considerably slower.

This shows that query execution times can vary between runs, even when PostgreSQL uses the same type of execution plan.

Possible contributing factors include caching, server resource availability and other system activity. The available screenshots do not establish which factor caused the slower run.

Therefore, this experiment demonstrates that PostgreSQL selected the index and that some indexed executions were faster. It does not prove that indexing guarantees faster execution on every run.

A more reliable performance comparison would involve repeated measurements under comparable conditions.

## 6. Conclusion

This experiment helped me understand how indexing influences query processing in PostgreSQL.

Before indexing, PostgreSQL used a Sequential Scan to search the benchmark payment table. After I created a B-tree index on payment_status, the execution plan changed to an Index Scan.

The fastest indexed execution was substantially quicker than the original baseline. However, one indexed execution was slower, showing that indexing does not guarantee faster performance in every individual run.

I also learned why EXPLAIN and EXPLAIN ANALYZE are useful. EXPLAIN shows the query plan, while EXPLAIN ANALYZE executes the query and provides actual performance measurements.

For the NaijaOpenLearner Online Store, these techniques could help identify slow database queries and determine whether carefully selected indexes would improve performance.

Overall, the experiment demonstrated the importance of measuring database performance rather than assuming an optimisation will always produce better results.

## 7. References

PostgreSQL Global Development Group. (n.d.). Using EXPLAIN. PostgreSQL Documentation.
https://www.postgresql.org/docs/current/using-explain.html

PostgreSQL Global Development Group. (n.d.). CREATE INDEX. PostgreSQL Documentation.
https://www.postgresql.org/docs/current/sql-createindex.html

PostgreSQL Global Development Group. (n.d.). ANALYZE. PostgreSQL Documentation.
https://www.postgresql.org/docs/current/sql-analyze.html
