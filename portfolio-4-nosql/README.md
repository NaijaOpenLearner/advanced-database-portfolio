# Portfolio 4: NoSQL and Advanced Data Models

**Course:** MIT8103 - Advanced Database Systems  
**Case Study:** NaijaOpenLearner Online Store  
**Project Type:** Simulated E-Commerce Platform  
**Database Platform:** MongoDB Atlas  
**Database Name:** `naijaopenlearner_nosql`  
**Collection:** `products`  
**Status:** Practical exercises completed; final portfolio review pending.

## 1. Portfolio Overview

This portfolio demonstrates how a document-oriented NoSQL database can store, retrieve and manage product information for NaijaOpenLearner Online Store.

MongoDB was selected for the practical exercise because the store sells different types of educational products with varying characteristics.

The implementation uses a `products` collection containing three fictional products:

- Database Systems Textbook
- Scientific Calculator
- Networking Study Kit

Each document contains common product information, including a product identifier, name, category, price and description.

Product-specific information is stored inside an embedded `attributes` object. This allows textbooks, calculators and learning kits to have different characteristics without requiring every product document to contain identical fields.

All product information used in the practical exercise is fictional.

## 2. Practical Activities

The following MongoDB operations were demonstrated using MongoDB Atlas:

1. Created the `naijaopenlearner_nosql` database and its `products` collection.
2. Inserted three product documents containing different attributes.
3. Demonstrated embedded documents and arrays.
4. Filtered products by category using an equality condition.
5. Filtered products using the `$lte` comparison operator to identify items costing ₦15,000 or less.
6. Queried nested fields using dot notation, including `attributes.skill_level`.
7. Searched an embedded array for a specific component using `attributes.components`.
8. Updated the Scientific Calculator's warranty from 12 to 24 months.
9. Created a temporary fictional document to demonstrate safe deletion.
10. Deleted the temporary document and verified that it no longer appeared in the collection.

The practical exercise demonstrated all four CRUD operations: Create, Read, Update and Delete.

The original three product documents remained in the collection after the deletion test.

## 3. Supporting Screenshots

The following screenshots document the practical activities and their results.

| Evidence | Description |
|---|---|
| [P4-01](p4-01-first-document-inserted.png) | First product document inserted |
| [P4-02](p4-02-two-products-inserted.png) | Two products in the collection |
| [P4-03](p4-03-three-products-inserted.png) | Three products successfully inserted |
| [P4-04](p4-04-embedded-document-and-array.png) | Embedded documents and arrays |
| [P4-05](p4-05-filter-books.png) | Product category filtering |
| [P4-06](p4-06-price-filter.png) | Price filtering using `$lte` |
| [P4-07](p4-07-nested-field-query.png) | Nested-field query using dot notation |
| [P4-08](p4-08-calculator-before-update.png) | Calculator warranty before update |
| [P4-09](p4-09-calculator-after-update.png) | Calculator warranty after update |
| [P4-10](p4-10-array-query.png) | Searching an array for an Ethernet cable |
| [P4-11](p4-11-test-document-before-delete.png) | Temporary test document before deletion |
| [P4-12](p4-12-test-document-deleted.png) | Verification of temporary document deletion |

These screenshots provide evidence of the document structure, query results, updates and deletion verification performed in MongoDB Atlas.

## 4. Database Comparison

A comparison of PostgreSQL and MongoDB was prepared to examine their database models, characteristics, advantages, limitations and suitability for NaijaOpenLearner Online Store.

[Read the PostgreSQL versus MongoDB comparison](sql-vs-nosql-comparison.md)

MongoDB was considered suitable for managing a flexible catalogue because different product categories require different attributes.

PostgreSQL was considered suitable for managing customer orders, payments and stock reservations because it provides relational integrity features such as foreign keys, constraints and transactional controls.

The proposed approach combines MongoDB for the product catalogue with PostgreSQL for transactional records.

However, using two database systems introduces additional responsibilities, including coordinating product identifiers, synchronising information and managing both databases.

PostgreSQL with JSONB was also identified as a possible alternative that could reduce the complexity of operating two separate systems.

The proposed hybrid architecture is a design recommendation. The practical exercises do not represent a deployed integration between PostgreSQL and MongoDB.

## 5. Personal Learning Reflection

This practical exercise helped me understand how MongoDB stores information in documents and collections rather than traditional relational tables.

I learned that documents within the same collection can contain different product-specific attributes.

The most useful exercise for me was querying nested fields. When I searched for products using `attributes.skill_level`, MongoDB returned the Networking Study Kit.

This demonstrated that flexible document structures can still support searches for specific information.

I also gained practical experience with inserting documents, filtering records, updating an embedded field and deleting a temporary test document.

The experience helped me understand why database selection should depend on the nature of the data and the business requirements.

[Read my Portfolio 4 learning reflection](learning-reflection.md)

## 6. Observations and Limitations

The MongoDB practical demonstrated how a document database can manage products with different attributes within one collection.

Embedded objects allowed product-specific information to be stored alongside common product details.

The query exercises demonstrated category filtering, numerical comparisons, nested-field queries and array searches.

The update exercise confirmed that an existing document could be modified without deleting and recreating it.

The deletion exercise demonstrated how a temporary test document could be removed and its absence verified.

However, the practical had several limitations:

- The collection contained only three permanent fictional products.
- The exercise did not implement a complete e-commerce application.
- Live customer orders and payment processing were not implemented in MongoDB.
- The proposed integration between MongoDB and PostgreSQL was not deployed.
- Production-level database synchronisation and security configuration were outside the scope of the exercise.
- Performance comparisons between PostgreSQL and MongoDB were not conducted.

The practical therefore focused on demonstrating MongoDB's document model, flexible product attributes and basic database operations rather than evaluating a complete production system.

## 7. References

1. MongoDB Documentation. *MongoDB Manual*.  
   https://www.mongodb.com/docs/manual/

2. PostgreSQL Global Development Group. *PostgreSQL Documentation*.  
   https://www.postgresql.org/docs/current/

3. MIVA Open University. *MIT8103 - Advanced Database Systems*. Course materials.

## 8. AI Assistance Declaration

AI assistance was used as a learning and documentation support tool during this portfolio.

It helped explain database concepts, provided guidance on MongoDB practical exercises and queries, assisted with troubleshooting, and supported the drafting, editing and organisation of portfolio documentation.

I carried out the MongoDB practical activities in MongoDB Atlas, reviewed the query results, captured the supporting screenshots and provided my own responses to the knowledge checks and learning-reflection questions.

The technical observations and practical evidence relate to the database exercises I performed for the fictional NaijaOpenLearner Online Store case study.
