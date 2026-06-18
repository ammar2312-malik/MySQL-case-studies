# Case Study 5 — Aviation Maintenance & Engineering

## Background

An aviation maintenance department tracks aircraft inspections, technician assignments, and maintenance history. Engineers follow a hierarchical reporting structure. Management requires analytical reports, technician performance rankings, and secure access control mechanisms.

---

# Business Objective

Analyze maintenance operations, monitor technician performance, manage reporting hierarchies, and implement database security and automation.

---

# Questions

## Level 1: Data Retrieval & Maintenance Analytics

### 1. Aircraft Maintenance Overview

Retrieve maintenance information and calculate inspection metrics.

#### Tasks

* Show aircraft information with technician details.
* Count total inspections performed per aircraft.
* Find average maintenance time per technician.
* Handle NULL maintenance status values.

#### Concepts Covered

* INNER JOIN
* GROUP BY
* COUNT()
* AVG()
* COALESCE()
* IFNULL()

---

## Level 2: Analytical SQL & Window Functions

### 2. Inspection Trend Analysis

Evaluate technician performance and inspection history.

#### Tasks

* Rank technicians based on completed inspections.
* Generate running total inspections per aircraft.
* Compare inspection intervals using LAG and LEAD.

#### Concepts Covered

* Window Functions
* RANK()
* DENSE_RANK()
* SUM() OVER()
* LAG()
* LEAD()

---

## Level 3: Hierarchical Reporting

### 3. Technician Reporting Structure

Analyze reporting relationships between technicians and managers.

#### Tasks

* Build technician hierarchy using Recursive CTE.

#### Concepts Covered

* Recursive CTEs
* Hierarchical Queries

---

## Level 4: User-Defined Functions & Business Logic

### 4. Maintenance Performance Evaluation

Encapsulate business logic into reusable database functions.

#### Tasks

* Create a User Defined Function (UDF) to calculate maintenance performance scores.

#### Concepts Covered

* User Defined Functions
* Business Logic Implementation

---

## Level 5: Dynamic Reporting & Security

### 5. Advanced Reporting and Access Control

Implement flexible reporting and secure database access.

#### Tasks

* Generate filtered reports using Dynamic SQL.
* Apply role-based access control using GRANT and REVOKE.

#### Concepts Covered

* Dynamic SQL
* Stored Programs
* Database Security
* GRANT
* REVOKE

---

# SQL Concepts Covered

### Basic SQL

* JOINs
* GROUP BY
* Aggregate Functions
* NULL Handling

### Intermediate SQL

* Window Functions
* Ranking Functions
* Running Totals
* LAG() / LEAD()

### Advanced SQL

* Recursive CTEs
* User Defined Functions
* Dynamic SQL
* Database Security
* Role-Based Access Control

---

## Difficulty Level

**Intermediate → Advanced**

## Domain

**Aviation Maintenance & Engineering**

## Skills Demonstrated

* Maintenance Analytics
* Technician Performance Analysis
* Hierarchical Data Processing
* User Defined Functions
* Dynamic SQL
* Database Security & Access Control
