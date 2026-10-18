# PostgreSQL and MongoDB Comparison

**Course:** MIT8103 - Advanced Database Systems  
**Case Study:** NaijaOpenLearner Online Store

## 1. Introduction

NaijaOpenLearner Online Store is a fictional e-commerce business selling educational products such as textbooks, scientific calculators and networking study kits.

The business requires a database solution that can store different product characteristics while managing customers, orders, payments and inventory accurately.

This comparison examines the suitability of PostgreSQL, a relational database management system, and MongoDB, a document-oriented NoSQL database.

## 2. Comparison of Database Models

| Feature | PostgreSQL | MongoDB |
|---|---|---|
| Database model | Relational | Document-oriented |
| Data organisation | Tables and rows | Collections and documents |
| Schema | Structured relational schema with support for JSONB | Flexible document structure |
| Relationships | Foreign keys and joins | Embedded documents and references |
| Product-specific attributes | Can be stored in relational tables or JSONB | Can be embedded in documents |
| Transactions | Supports ACID transactions | Supports ACID transactions |
| Main consideration | Relational consistency and integrity | Flexibility for varied document structures |

## 3. Suitability for the Product Catalogue

The NaijaOpenLearner product catalogue contains items with different characteristics.

A textbook may have an author, number of pages and reading level. A scientific calculator may have a battery type, warranty and mathematical functions. A networking study kit may contain a list of components.

During the MongoDB practical exercise, I created a `products` collection containing these three product types.

Each document contained common information such as the product name, category and price. Product-specific information was stored inside an embedded `attributes` object.

MongoDB allowed these products to be represented within one collection without requiring every product to contain identical attributes.

This makes MongoDB a suitable option for a catalogue containing different categories of educational products.

## 4. Suitability for Orders and Payments

Orders and payments require accurate relationships between customers, orders, products and financial transactions.

PostgreSQL is a suitable option because it provides foreign keys, constraints and transactional controls that help maintain data integrity.

For example, transaction management can help ensure that related database changes are handled consistently.

If an external payment fails, the application should record the failed attempt, update the order appropriately and release any reserved inventory. These actions must be coordinated carefully because external payment services do not normally participate in the same database transaction.

PostgreSQL also supports row-level locking and conditional updates, which can help prevent two customers from reserving the same remaining stock.

## 5. Proposed Database Approach

My preferred approach is to use MongoDB for the flexible product catalogue and PostgreSQL for transactional information such as customers, orders, payments and stock reservations.

However, using two database systems introduces additional complexity.

The application must maintain consistent product identifiers and synchronise important information between the systems. PostgreSQL cannot directly enforce a foreign-key relationship against a document stored only in MongoDB.

An alternative is to use PostgreSQL alone, with JSONB fields for flexible product attributes. This could reduce operational complexity while still supporting different product categories.

Therefore, the final choice should depend on the size of the store, its technical resources, performance requirements and data consistency needs.

## 6. Conclusion

The MongoDB practical demonstrated how a document database can store products with different attributes and support queries involving embedded objects and arrays.

PostgreSQL provides strong relational integrity features that are useful for managing orders, payments and inventory.

A combination of both systems is a defensible architectural option, but it would require careful integration and synchronisation. For a smaller store, PostgreSQL with JSONB may be the simpler choice.
