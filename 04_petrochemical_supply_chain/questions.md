# Case Study 4 — Petrochemical Supply Chain & Inventory

## Background

A petrochemical supply chain system manages suppliers, shipments, warehouse inventory, and stock movement. Inventory updates must be transaction-safe, and reporting performance is critical for operational decision-making.

---

# Business Objective

Analyze supplier performance, monitor inventory movement, ensure transaction integrity, and optimize reporting queries.

---

# Questions

## Level 1: Data Retrieval & Inventory Analysis

### 1. Shipment and Inventory Overview

Retrieve shipment information and calculate inventory-related metrics.

#### Tasks

* Show shipment details with supplier information.
* Count total shipments per supplier.
* Calculate current inventory balance.
* Handle NULL shipment or delivery dates.

#### Concepts Covered

* INNER JOIN
* GROUP BY
* COUNT()
* SUM()
* COALESCE()
* IFNULL()

---

## Level 2: Analytical SQL & Window Functions

### 2. Supplier Performance and Stock Trends

Analyze supplier efficiency and stock movement over time.

#### Tasks

* Rank suppliers based on delivery performance.
* Generate running stock balance.

#### Concepts Covered

* Window Functions
* RANK()
* DENSE_RANK()
* SUM() OVER()

---

## Level 3: Data Quality Validation

### 3. Shipment Data Integrity

Detect duplicate shipment records and maintain data quality.

#### Tasks

* Identify duplicate shipment entries.

#### Concepts Covered

* GROUP BY
* HAVING
* COUNT()
* Duplicate Detection

---

## Level 4: Transaction Management

### 4. Inventory Update Operations

Implement transaction-safe stock updates.

#### Tasks

* Update inventory using INSERT ON DUPLICATE KEY UPDATE.

#### Concepts Covered

* UPSERT Operations
* Primary Keys
* Transaction Safety

---

## Level 5: Performance Optimization & Automation

### 5. Reporting and Query Optimization

Improve query performance and automate inventory reporting.

#### Tasks

* Create indexes for inventory lookup queries.
* Develop stored procedures for monthly inventory reports.

#### Concepts Covered

* Indexing
* EXPLAIN
* Stored Procedures
* Query Optimization

---

# SQL Concepts Covered

### Basic SQL

* JOINs
* GROUP BY
* Aggregate Functions
* NULL Handling

### Intermediate SQL

* Window Functions
* Ranking
* Running Totals

### Advanced SQL

* Duplicate Detection
* UPSERT Operations
* Indexing
* Stored Procedures
* Query Optimization

---

## Difficulty Level

**Intermediate → Advanced**

## Domain

**Petrochemical Supply Chain & Inventory Management**

## Skills Demonstrated

* Inventory Analytics
* Supplier Performance Monitoring
* Transaction Management
* Data Quality Analysis
* Query Optimization
* Report Automation
