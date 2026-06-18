# Case Study 3 — Oil & Gas Industry (Production Monitoring)

## Background

An oil and gas company maintains information about wells, assets, engineers, and daily production readings collected from field sensors. Engineers report to managers in a hierarchy, and management requires analytical reports to monitor production trends, identify anomalies, and optimize query performance for large production datasets.

---

# Business Objective

Analyze production data, monitor operational efficiency, detect anomalies, and optimize query performance using SQL.

---

# Questions

## Level 1: Data Retrieval & Aggregation

### 1. Production Overview and Well Statistics

Retrieve production records with well details and calculate production metrics.

#### Tasks

* Show production records with corresponding well information.
* Calculate total production for each well.
* Find the average daily production across wells.
* Handle NULL production values appropriately.

#### Concepts Covered

* INNER JOIN
* GROUP BY
* SUM()
* AVG()
* COALESCE()
* IFNULL()

---

## Level 2: Analytical SQL & Window Functions

### 2. Production Trend Analysis

Perform advanced analysis to evaluate well performance over time.

#### Tasks

* Rank wells based on total production output.
* Generate cumulative (running total) production by date.
* Compare production changes between consecutive days.

#### Concepts Covered

* Window Functions
* RANK()
* DENSE_RANK()
* ROW_NUMBER()
* SUM() OVER()
* LAG()
* LEAD()

---

## Level 3: Data Quality & Monitoring

### 3. Sensor Data Validation

Identify inconsistencies and duplicate readings caused by sensor or ingestion issues.

#### Tasks

* Detect duplicate production records.
* Identify abnormal or repeated sensor readings.

#### Concepts Covered

* GROUP BY
* HAVING
* COUNT()
* Duplicate Detection

---

## Level 4: Hierarchical Reporting

### 4. Engineer Reporting Structure

Build a reporting hierarchy to understand manager-engineer relationships.

#### Tasks

* Generate the organizational hierarchy using recursive queries.
* Display reporting chains from engineers to managers.

#### Concepts Covered

* Recursive CTEs
* Hierarchical Queries

---

## Level 5: Query Optimization & Performance

### 5. Performance Tuning

Improve query efficiency for large production datasets.

#### Tasks

* Create composite indexes on frequently queried columns.
* Analyze query execution plans.
* Evaluate index usage and query performance.

#### Concepts Covered

* Composite Indexes
* EXPLAIN
* Query Optimization
* Execution Plans

---

# SQL Concepts Covered

### Basic SQL

* SELECT
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

* Duplicate Detection
* Recursive CTEs
* Hierarchical Queries
* Indexing
* Query Optimization
* Execution Plan Analysis

---

## Difficulty Level

**Intermediate → Advanced**

## Domain

**Oil & Gas Production Monitoring**

## Skills Demonstrated

* Relational Querying
* Analytical SQL
* Data Quality Analysis
* Window Functions
* Hierarchical Data Processing
* Query Performance Optimization
* Production Monitoring Analytics
