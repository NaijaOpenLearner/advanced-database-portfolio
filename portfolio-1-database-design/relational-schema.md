# Relational Schema - NaijaOpenLearner Online Store

Course: MIT8103 - Advanced Database Systems

Portfolio 1: Database Design and Modelling

## 1. Relational Tables

### CUSTOMERS
- customer_id - Primary Key (PK)
- full_name
- email - UNIQUE, NOT NULL
- phone

### PRODUCTS
- product_id - Primary Key (PK)
- product_name
- category
- unit_price

### ORDERS
- order_id - Primary Key (PK)
- customer_id - Foreign Key (FK) referencing CUSTOMERS
- order_date
- order_status

### ORDER_ITEMS
- order_item_id - Primary Key (PK)
- order_id - Foreign Key (FK) referencing ORDERS
- product_id - Foreign Key (FK) referencing PRODUCTS
- quantity
- unit_price_at_order

### PAYMENTS
- payment_id - Primary Key (PK)
- order_id - Foreign Key (FK) referencing ORDERS
- amount
- payment_method
- payment_status
- attempted_at

### INVENTORY
- inventory_id - Primary Key (PK)
- product_id - Foreign Key (FK) referencing PRODUCTS; UNIQUE
- quantity_on_hand
- quantity_allocated
- last_updated

### DELIVERIES
- delivery_id - Primary Key (PK)
- order_id - Foreign Key (FK) referencing ORDERS; UNIQUE
- delivery_address
- delivery_status
- dispatched_at
- delivered_at

## 2. Relationship Summary

- One customer may place many orders.
- One order may contain multiple order items.
- One product may appear in multiple order items.
- One order may have multiple payment attempts.
- Each product is intended to have one inventory record.
- Each order may have at most one delivery record.

## 3. Implemented Data Integrity Constraints

The database design should enforce:

- Unique primary keys for every table.
- Valid foreign-key references.
- Unique customer email addresses.
- Product prices that are not negative.
- Order-item quantities greater than zero.
- Inventory quantities that are not negative.
- Allocated stock that cannot exceed physical stock.
- No more than one inventory record per product.
- No more than one delivery record per order.

These constraints have been implemented in PostgreSQL and tested using SQL statements and supporting screenshots. The implementation includes primary keys, foreign keys, uniqueness constraints, CHECK constraints and permitted status values.
