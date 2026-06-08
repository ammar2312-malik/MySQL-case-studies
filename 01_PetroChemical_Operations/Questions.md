# Petrochemical Plant Operations & Workforce Analytics

## Background

A petrochemical company operates multiple plants where employees work in departments under supervisors and managers.

The company records daily production data, shift details, and employee performance metrics. Management requires analytical reports, hierarchy tracking, and optimized query performance to support operational decision-making.

---

# Questions

## 🟢 Beginner Level

### Question 1

Show all employees along with their department and plant details.

**Concept:** INNER JOIN

---

### Question 2

Calculate total production quantity for each plant.

**Concept:** Aggregation using SUM()

---

### Question 3

Display average production by department.

**Concept:** GROUP BY and AVG()

---

### Question 4

Handle NULL production values by replacing them with a default value.

**Concept:** COALESCE() / IFNULL()

---

## 🟡 Intermediate Level

### Question 5

Identify top-performing employees based on total production output.

**Concept:** RANK() / ROW_NUMBER()

---

### Question 6

Calculate a running total of production quantity ordered by production date.

**Concept:** Window Functions

---

### Question 7

Detect duplicate production records in the dataset.

**Concept:** ROW_NUMBER() with PARTITION BY

---

## 🔴 Advanced Level

### Question 8

Build the complete employee reporting hierarchy starting from top-level managers down to individual employees.

**Concept:** Recursive CTE

---

### Question 9

Create an index to improve production query performance and analyze the execution plan.

**Concept:** Indexing and EXPLAIN

---

### Question 10

Implement transaction management for production updates to ensure data consistency and safe rollback capabilities.

**Concept:** START TRANSACTION, COMMIT, ROLLBACK

---

## Skills Practiced

* Data Analysis
* Production Reporting
* SQL Joins
* Aggregations
* Window Functions
* Recursive Queries
* Query Optimization
* Transaction Management
