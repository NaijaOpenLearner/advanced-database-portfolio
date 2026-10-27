
# Portfolio 2: Query Processing and Optimisation

**Course:** MIT8103 - Advanced Database Systems

**Case Study:** NaijaOpenLearner Online Store

**Project Type:** Simulated E-Commerce Platform

**Database Platform:** Neon PostgreSQL

**Status:** In Progress - Practical exercises completed; documentation under review.

## 1. Portfolio Overview

This portfolio investigates SQL query processing, execution plans, indexing and database performance optimisation.

I used PostgreSQL to examine sales transactions for the NaijaOpenLearner Online Store and carried out a separate performance experiment using 100,000 fictional payment records.

## 2. SQL Scripts

| File | Description |
|---|---|
| [P2_01](P2_01_successful_sales_report.sql) | Generate a successful-sales report |
| [P2_02](P2_02_explain_sales_report.sql) | Examine the estimated query execution plan |
| [P2_03](P2_03_explain_analyze_sales_report.sql) | Measure actual sales-query execution |
| [P2_04](P2_04_create_benchmark_table.sql) | Create the benchmark payment table |
| [P2_05](P2_05_generate_benchmark_records.sql) | Generate 100,000 fictional payment records |
| [P2_06](P2_06_benchmark_before_index.sql) | Measure performance before indexing |
| [P2_07](P2_07_create_payment_status_index.sql) | Create the payment-status index |
| [P2_08](P2_08_benchmark_after_index.sql) | Measure performance after indexing |

## 3. Performance Experiment

The benchmark contained 100,000 payment records:

- 94,000 Failed
- 5,000 Pending
- 1,000 Successful

The experiment compared SQL performance before and after creating a B-tree index on the payment_status column.

The original query used a Sequential Scan and took 4.05 ms.

After indexing, PostgreSQL used an Index Scan. Recorded execution times included 1.07 ms, 59.2 ms and 0.538 ms.

These measurements show that an index can improve performance, but individual execution times may vary.

## 4. Evidence Screenshots

Nine screenshots are included in this folder.

They document the sales report, execution plans, benchmark table, record counts, index creation and performance tests before and after indexing.

## 5. Detailed Performance Analysis

Read the full experiment report:

[Portfolio 2 Query Performance Analysis](performance-analysis.md)

The report explains the execution plans, benchmark measurements, performance variations and conclusions.

## 6. Reproducibility Note

The SQL scripts document the practical work completed using Neon PostgreSQL.

Some scripts create database objects or insert records. They should be executed in the correct order on a fresh test database rather than rerun against the populated database.

The screenshots preserve the results obtained during the original experiment.

## 7. Learning Reflection

This exercise helped me understand how to use EXPLAIN and EXPLAIN ANALYZE to investigate SQL queries.

I also learned that query optimisation requires testing and interpreting execution plans rather than assuming that creating an index will always improve performance.
