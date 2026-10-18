# MIT8103 – Advanced Database Systems Practical Portfolio

**Institution:** MIVA Open University  
**Course:** MIT8103 - Advanced Database Systems  
**Case Study:** NaijaOpenLearner Online Store  
**Project Type:** Simulated Educational Products E-Commerce Business  
**Status:** Practical portfolio exercises completed; final submission checks pending.

## 1. Project Overview

This repository contains my practical work for MIT8103 – Advanced Database Systems at MIVA Open University.

The project uses a fictional Nigerian online store called **NaijaOpenLearner Online Store**, which sells educational products such as textbooks, scientific calculators and networking study kits.

The business scenario provides a practical way to study how databases can manage customer information, products, orders, payments, inventory and deliveries.

The portfolio is divided into five parts covering relational database design, SQL query optimisation, transaction management, NoSQL databases, and distributed and cloud database concepts.

## 2. Portfolio Contents

| Portfolio | Focus | Practical Work |
|---|---|---|
| [Portfolio 1 – Database Design](portfolio-1-database-design/) | Requirements, data modelling and relational design | Business requirements, ER diagram, seven PostgreSQL tables, normalisation, SQL scripts and constraint tests |
| [Portfolio 2 – Query Processing and Optimisation](portfolio-2-query-optimisation/) | SQL queries and performance tuning | Sales reporting, execution plans, a 100,000-record fictional benchmark, B-tree indexing and performance analysis |
| [Portfolio 3 – Transactions and Concurrency](portfolio-3-transactions-concurrency/) | Transaction integrity and concurrent access | COMMIT, ROLLBACK, conditional stock reservations, READ COMMITTED isolation and two-session row-lock tests |
| [Portfolio 4 – NoSQL and Advanced Data Models](portfolio-4-nosql/) | MongoDB document databases | Product documents, embedded attributes, arrays, CRUD operations and PostgreSQL versus MongoDB comparison |
| [Portfolio 5 – Distributed and Cloud Databases](portfolio-5-distributed-cloud/) | Cloud database architecture and replication | Neon PostgreSQL branching, isolated test environments, read-replica behaviour and distributed database analysis |

Each portfolio folder contains its own README and supporting materials, including SQL files or practical documentation, screenshots, observations and learning reflections.

## 3. Tools and Technologies

The following tools and platforms were used during the practical exercises:

- **PostgreSQL:** Relational database design, SQL queries, transactions and performance testing.
- **Neon:** Cloud-hosted PostgreSQL database, development branching and read-replica experiments.
- **MongoDB Atlas:** Document-oriented NoSQL database exercises.
- **DBeaver:** PostgreSQL database connections and concurrency testing.
- **GitHub:** Version control, portfolio organisation and supporting evidence.

## 4. Key Practical Learning Outcomes

Through this portfolio, I gained practical experience in designing a relational database from business requirements and implementing tables with primary keys, foreign keys and data-integrity constraints.

I learned to use PostgreSQL execution plans to investigate query performance and to observe how an index can influence the database's choice of execution strategy.

The transaction exercises helped me understand the importance of COMMIT, ROLLBACK and row-level locking when multiple users attempt to access shared inventory records.

Using MongoDB Atlas introduced me to document-based storage, flexible product attributes and CRUD operations.

The cloud database exercises helped me understand database branching, read replicas and the differences between proposed distributed architectures and features actually demonstrated in a practical environment.

## 5. Implementation Scope and Limitations

This project is an academic simulation, not a deployed commercial e-commerce application. All business records used in the practical exercises are fictional.

The PostgreSQL and MongoDB exercises were performed separately. A production integration between the two databases was not implemented.

Some advanced features, including automated payment workflows, timed inventory reservations, database sharding and complete disaster-recovery testing, were discussed as possible designs rather than implemented as working systems.

Performance measurements reflect the recorded test environment and should not be treated as guarantees of production performance.

## 6. Evidence and Reproducibility

The five portfolio folders contain practical evidence supporting the work completed.

SQL scripts document the PostgreSQL exercises, while screenshots record database structures, query results, transaction behaviour, performance measurements and cloud database observations.

Some scripts change database records or depend on a specific transaction state. They should be reviewed before being rerun against an existing database.

## 7. References

- MIVA Open University. *MIT8103 – Advanced Database Systems*. Course materials.
- PostgreSQL Global Development Group. [PostgreSQL Documentation](https://www.postgresql.org/docs/current/).
- MongoDB. [MongoDB Manual](https://www.mongodb.com/docs/manual/).
- Neon. [Neon Documentation](https://neon.com/docs).

Additional references and explanations are included in the relevant portfolio folders.

## 8. AI Assistance Declaration

**AI tool used:** ChatGPT (OpenAI).

AI assistance was used to explain database concepts, support troubleshooting, provide guidance during practical exercises, and help draft, organise and review portfolio documentation.

I carried out the practical database activities using the stated tools, examined the results, captured supporting evidence and reviewed the technical explanations against my observations and relevant documentation.

AI assistance was used as a learning and documentation aid, not as a substitute for performing the practical database exercises.

---

**Repository purpose:** Academic practical portfolio for MIT8103 - Advanced Database Systems, MIVA Open University.
