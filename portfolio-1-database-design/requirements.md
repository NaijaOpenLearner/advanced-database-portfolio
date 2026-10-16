# NaijaOpenLearner Online Store
## Business Requirements and Rules

**Course:** MIT8103 - Advanced Database Systems

**Portfolio:** 1 - Database Design and Modelling

### 1. Business Overview

NaijaOpenLearner Online Store is a fictional Nigerian e-commerce business that sells educational products, including textbooks, calculators, stationery and learning materials.

The proposed database will help the business maintain accurate records of customers, products, sales, payments, stock levels and deliveries.

### 2. Business Problem

As the business grows, managing customer information, product availability, orders and payments without a properly designed database could lead to duplicate records, stock inaccuracies, difficulty tracking unpaid orders and poor delivery visibility.

A structured database is needed to organise this information and support reliable business operations.

### 3. Functional Requirements

The proposed system should support:

- Recording and retrieving customer information.
- Maintaining product details, including names, prices and stock quantities.
- Creating orders containing one or more products.
- Recording the quantity and price of each product in an order.
- Recording payment attempts and their outcomes.
- Tracking orders awaiting payment or fulfilment.
- Checking and allocating stock when payment succeeds.
- Recording delivery information and tracking delivery status.

### 4. Business Rules

**BR-01: Inventory Availability and Stock Management**

The store will maintain records of product quantities and availability. Unpaid orders will not reserve stock. When payment is successfully confirmed, the system will check stock availability before allocating products to the order. If sufficient stock is unavailable, the order will be flagged for resolution rather than confirmed for fulfilment. Inventory updates must not result in negative stock quantities.

**BR-02: Order and Payment Management**

Each customer order will have a unique identifier. An order may contain one or more products, with the quantity and selling price recorded for each item.

A customer may make multiple payment attempts for the same order. Each attempt will be recorded separately, including its amount, outcome and date or time.

A failed payment attempt will not automatically cancel the order. The customer may try another payment method while the order remains pending.

Payment status will be managed separately from order fulfilment status. Successful payment does not automatically mean an order has been delivered.

**BR-03: Delivery Management**

An order may proceed to fulfilment only after its payment has been confirmed and sufficient stock has been allocated.

The database will record delivery information and track whether an order is awaiting dispatch, in transit or delivered.

For this initial project, each order will have no more than one delivery record. More complex delivery arrangements, such as split shipments, are outside the project scope.

### 5. Non-Functional Requirements

The proposed database should:

- Maintain accurate and consistent records.
- Prevent unauthorised access to customer and transaction information.
- Support efficient retrieval of orders, payments and inventory details.
- Preserve the relationships between related records.
- Support reliable transaction processing and recovery.

### 6. Project Scope

The project will focus on customers, products, orders, order items, payment attempts, inventory and deliveries.

Employee payroll, live payment gateway integration, website development and countdown-based stock reservations are excluded from the initial implementation.

The project will use fictional sample data for learning, implementation and testing.
