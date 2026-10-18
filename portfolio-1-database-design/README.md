# Portfolio 1: Database Design and Modelling

**Course:** MIT8103 - Advanced Database Systems  
**Institution:** MIVA Open University  
**Case Study:** NaijaOpenLearner Online Store  
**Project Type:** Simulated E-Commerce Platform  
**Database Platform:** PostgreSQL (Neon)  
**Status:** Practical database design and constraint testing completed; final assessment review ongoing.

## 1. Business Overview

NaijaOpenLearner Online Store is a fictional Nigerian e-commerce business selling educational products, including textbooks, calculators, stationery and networking learning kits.

The database supports the organisation of customer information, product details, orders, payment attempts, inventory records and deliveries.

The business scenario was selected because it provides opportunities to demonstrate relational database modelling, referential integrity, normalisation and database constraints.

## 2. Portfolio Objectives

This portfolio demonstrates the design and initial implementation of a relational database for the selected online store.

The work includes requirements analysis, entity-relationship modelling, relational schema design, primary and foreign keys, normalisation to Third Normal Form (3NF), PostgreSQL table creation and integrity-constraint testing.

## 3. Database Design

The database contains seven related tables:

| Table | Purpose |
|---|---|
| `customers` | Stores customer information |
| `products` | Stores product details and current catalogue prices |
| `orders` | Records customer orders and their statuses |
| `order_items` | Records individual products, quantities and historical selling prices |
| `payments` | Stores payment attempts and their outcomes |
| `inventory` | Maintains stock quantities and allocations |
| `deliveries` | Records delivery details and statuses |

The relationships include one-to-many relationships between customers and orders, orders and order items, products and order items, and orders and payment attempts.

The initial design also permits at most one inventory record per product and one delivery record per order.

### Design Documents

- [Business requirements and rules](requirements.md)
- [Entity-Relationship diagram](NaijaOpenLearner%20Online%20Store%20-%20ERD.png)
- [Editable ER diagram source](online-store-erd.dbml)
- [Relational schema and relationships](relational-schema.md)
- [Database normalisation explanation](normalisation.md)

## 4. PostgreSQL Implementation

The seven relational tables were defined using PostgreSQL SQL scripts.

The implementation includes automatically generated primary keys, foreign keys, uniqueness constraints and checks intended to protect data integrity.

### SQL Files

| File | Purpose |
|---|---|
| [01_create_customers_products.sql](01_create_customers_products.sql) | Creates customers and products tables |
| [02_create_remaining_five_tables.sql](02_create_remaining_five_tables.sql) | Creates orders, order items, payments, inventory and deliveries |
| [03_insert_sample_data.sql](03_insert_sample_data.sql) | Inserts fictional records for testing |
| [04_constraint_tests.sql](04_constraint_tests.sql) | Contains SQL used for integrity-constraint testing |

## 5. Data Integrity and Business Rules

The database uses constraints to:

- Prevent duplicate customer email values.
- Reject negative product prices.
- Ensure order items have positive quantities.
- Maintain valid foreign-key relationships.
- Prevent negative inventory quantities.
- Prevent stock allocations from exceeding available stock.
- Restrict order, payment and delivery statuses to permitted values.
- Allow multiple payment attempts for the same order.
- Limit each order to at most one delivery record.

These controls help maintain consistent records and prevent certain invalid database states.

Some business workflows, including payment-triggered stock allocation and fulfilment authorisation, require additional transaction or application logic rather than being enforced automatically by the table definitions.

## 6. Constraint Testing and Evidence

Practical SQL tests were used to investigate whether important database constraints behaved as expected.

| Test | Evidence |
|---|---|
| Negative product price | [View screenshot](test-01-negative-price.png) |
| Invalid customer foreign key | [View screenshot](test-02-invalid-customer-fk.png) |
| Inventory allocation constraint | [View screenshot](test-03-inventory-allocation.png) |

The corresponding test SQL is available in [04_constraint_tests.sql](04_constraint_tests.sql).

## 7. Normalisation

The database was designed using First, Second and Third Normal Form principles.

Customer information is separated from orders, product information from individual order lines, and payment attempts from order records.

The `order_items` table resolves the many-to-many relationship between orders and products.

The `unit_price_at_order` field preserves the historical selling price for a transaction, even if the current catalogue price later changes.

See [normalisation.md](normalisation.md) for the full explanation.

## 8. Scope and Limitations

The project uses fictional customer, product and transaction data for learning and practical testing.

The initial database design does not include employee payroll, live payment gateway integration, website development, countdown-based cart reservations or split deliveries.

Although the schema enforces important integrity constraints, it does not by itself implement every business workflow. Further application or transaction logic would be required for a complete operational e-commerce platform.

## 9. Key Learning Outcomes

This portfolio provided practical experience with converting business requirements into relational tables and relationships.

It also demonstrated the importance of distinguishing conceptual database design from actual SQL implementation.

Constraint testing helped illustrate how PostgreSQL can reject invalid data and protect referential integrity.

The design and implementation provide the relational foundation for the remaining advanced database portfolio exercises.

## 10. References

- MIVA Open University. *MIT8103 - Advanced Database Systems*, course materials and Continuous Assessment brief.
- PostgreSQL Documentation. https://www.postgresql.org/docs/
- dbdiagram.io. https://dbdiagram.io/

## 11. AI Assistance Declaration

**AI Tool Used:** ChatGPT (OpenAI).

**Purpose:** AI assistance was used to explain database design concepts, support SQL learning and troubleshooting, and help draft, organise and refine portfolio documentation.

**Verification:** The SQL implementation, database relationships and practical results were examined during the learning exercises. The student reviewed the explanations, executed and checked practical SQL tests, and collected supporting evidence.
