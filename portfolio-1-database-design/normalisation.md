# Database Normalisation - NaijaOpenLearner Online Store

**Course:** MIT8103 - Advanced Database Systems  
**Portfolio:** 1 - Database Design and Modelling

## 1. Purpose of Normalisation

Database normalisation is the process of organising data into related tables to reduce unnecessary duplication and prevent insertion, update and deletion anomalies.

The NaijaOpenLearner Online Store database is designed around seven related tables: customers, products, orders, order_items, payments, inventory and deliveries.

## 2. First Normal Form (1NF)

First Normal Form requires attributes to contain atomic values, with no repeating groups or lists of products stored in a single field.

For example, a single order containing two textbooks and one calculator should not store both products as a comma-separated list.

Instead, each product is represented as a separate record in the `order_items` table.

| order_id | product_id | quantity |
|---|---|---|
| 101 | 10 | 2 |
| 101 | 20 | 1 |

The actual `order_items` table also uses `order_item_id` as its primary key.

## 3. Second Normal Form (2NF)

Second Normal Form requires a table to satisfy 1NF and ensures that non-key attributes depend on the entire candidate key.

Consider a hypothetical combined sales table with a composite key of `(order_id, product_id)`.

In that table, `order_date` would depend only on `order_id`, while `product_name` would depend only on `product_id`. These are partial dependencies.

To eliminate them, the database separates:

- `orders` - information about each order.
- `products` - information about each product.
- `order_items` - products, quantities and selling prices within an order.

In the current schema, each table uses a single-column primary key. No additional composite candidate keys have been defined, so the documented non-key attributes do not introduce partial-key dependencies.

## 4. Third Normal Form (3NF)

Third Normal Form requires a table to satisfy 2NF and removes transitive dependencies of non-key attributes on candidate keys.

For example, storing `customer_name` inside Orders alongside `customer_id` would duplicate customer information.

The dependency would be:

`order_id → customer_id → customer_name`

Our design avoids this by storing customer details in `customers`. The `orders` table keeps `customer_id` as a foreign key.

Similarly, product details are maintained in `products`, rather than repeated in every order item.

The `unit_price_at_order` attribute remains in `order_items` because it records the actual selling price agreed for that order line, rather than the product's current catalogue price.

## 5. Normalisation of the Seven Tables

| Table | Reason for separation |
|---|---|
| customers | Stores customer details without repeating them in every order. |
| products | Stores product descriptions and current prices centrally. |
| orders | Stores information about individual customer orders. |
| order_items | Handles the relationship between orders and products, including quantities and historical selling prices. |
| payments | Records multiple payment attempts without overwriting earlier attempts. |
| inventory | Maintains stock information separately from product descriptions. |
| deliveries | Stores delivery information without mixing it with payment or order-item records. |

## 6. Conclusion

The seven-table PostgreSQL database was designed to satisfy First, Second and Third Normal Forms by storing atomic values, separating data according to their dependencies and avoiding unnecessary duplication.

Normalisation helps reduce insertion, update and deletion anomalies, improve data consistency and simplify database maintenance.

The implemented schema was reviewed against the Entity-Relationship diagram and normalisation principles. Primary keys, foreign keys, uniqueness constraints and CHECK constraints were also implemented to help maintain data integrity.

The separation of customers, products, orders, order items, payments, inventory and deliveries provides a structured relational foundation for NaijaOpenLearner Online Store.
