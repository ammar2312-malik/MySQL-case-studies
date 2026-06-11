# Case Study 2 — Airlines Industry (Flight & Passenger Analytics)

## Background

An airline company manages flights, crew assignments, passenger bookings, and revenue data. Management requires analytical reports to monitor revenue trends, identify the busiest routes, analyze flight delays, and improve operational efficiency. Additionally, the company must ensure secure booking transactions and optimize flight search performance.

## Questions

### Basic Level

1. Display all flights along with their passenger details using appropriate JOIN operations.

2. Count the total number of passengers booked on each flight.

3. Calculate the total revenue generated for each route using aggregation and grouping techniques.

4. Handle missing delay values using suitable NULL handling functions.

### Intermediate Level

5. Rank flights based on revenue generated using the `DENSE_RANK()` window function.

6. Calculate running revenue totals ordered by flight date.

7. Compare the current flight delay with the previous and next flight delays using `LAG()` and `LEAD()` functions.

8. Identify duplicate passenger bookings in the system.

### Advanced Level

9. Analyze and optimize flight search queries using `EXPLAIN` and appropriate indexing strategies.

10. Implement transaction management logic to prevent seat overbooking during concurrent booking operations.

## Expected Concepts Covered

* JOIN Operations
* Aggregate Functions
* GROUP BY
* NULL Handling Functions
* Window Functions (`DENSE_RANK`, `LAG`, `LEAD`)
* Running Totals
* Duplicate Detection
* Query Optimization
* Indexing
* Transaction Management
* Concurrency Control
