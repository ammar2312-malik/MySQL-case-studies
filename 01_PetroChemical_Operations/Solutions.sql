/* =====================================================
Question 1
Show all employees with their plant details
Concept: INNER JOIN
===================================================== */
SELECT   
e.employee_name,  
e.designation,  
d.department_name,  
p.plant_name,  
p.location  
FROM employees e  
JOIN departments d  
ON e.department_id = d.department_id  
JOIN plants p  
ON d.plant_id = p.plant_id;  

/* =====================================================
Question 2
Find total production per plant.
Concept: AGGREGATION
===================================================== */
SELECT   
p.plant_name,  
SUM(pr.quantity_produced) AS total_production  
FROM production pr  
JOIN plants p  
ON pr.plant_id = p.plant_id  
GROUP BY p.plant_name;  

/* =====================================================
Question 3
Display average production by department.
Concept: GROUP BY 
===================================================== */
3.  
SELECT  
d.department_name,  
AVG(pr.quantity_produced) AS avg_production  
FROM production pr  
JOIN departments d  
ON pr.department_id = d.department_id  

/* =====================================================
Question 4
Handle NULL production values using COALESCE/IFNULL.
Concept: Handling NULL Values 
===================================================== */
4.   
SELECT 
production_id,  
COALESCE(quantity_produced, 0) AS production_qty  
FROM production;  

/* =====================================================
Question 5
Find top-performing employees using ROW_NUMBER/RANK.
Concept: Windows Functions 
===================================================== */
5. Top-performing employees using RANK 
SELECT employee_id, employee_name, 
total_production,  
RANK() OVER (ORDER BY total_production DESC) AS  
performance_rank  
FROM  
(  
SELECT  
e.employee_id,  
e.employee_name,  
SUM(COALESCE(pr.quantity_produced,0)) AS total_production  
FROM employees e  
JOIN production pr  
ON e.employee_id = pr.employee_id  
GROUP BY e.employee_id, e.employee_name  
) t;  

/* =====================================================
Question 6
Calculate running total production by date.
Concept: Window Functions 
===================================================== */
6.   
SELECT  
production_date,  
SUM(quantity_produced) AS daily_total,  
SUM(SUM(quantity_produced))  
OVER (ORDER BY production_date) AS running_total  
FROM production  
GROUP BY production_date;  

/* =====================================================
Question 7
Detect duplicate production records using ROW_NUMBER
Concept: Window Functions
===================================================== */
7.   
SELECT *  
FROM  
(  
SELECT production_id, 
plant_id, employee_id, 
production_date, 
quantity_produced, 
ROW_NUMBER() OVER 
(  
PARTITION BY plant_id, 
employee_id, 
production_date, 
quantity_produced  
ORDER BY production_id  
) AS rn  
FROM production  
) x  
WHERE rn > 1;  

/* =====================================================
Question 8
Build employee reporting hierarchy using Recursive CTE
Concept: Common Table Expression 
===================================================== */
8.   
WITH RECURSIVE emp_hierarchy AS  
(  
SELECT  
employee_id,  
employee_name, 
designation, 
supervisor_id, 1 
AS level  
FROM employees  
WHERE supervisor_id IS NULL  
UNION ALL  
SELECT  
e.employee_id,  
e.employee_name,  
e.designation,  
e.supervisor_id, eh.level 
+ 1  
FROM employees e  
JOIN emp_hierarchy eh  
ON e.supervisor_id = eh.employee_id  
)  
SELECT * FROM emp_hierarchy;  

/* =====================================================
Question 9
Create index to optimize production queries and check using EXPLAIN.
Concept: Query Optimization 
===================================================== */
9.   
CREATE INDEX idx_production_date_plant  
ON production(production_date, plant_id);  
EXPLAIN  
SELECT *  
FROM production  
WHERE production_date = '2025-01-01'  
AND plant_id = 1;  

/* =====================================================
Question 10
Write a transaction (BEGIN / COMMIT / ROLLBACK) for safe production updates
Concept: Transactions 
===================================================== */
10.   
START TRANSACTION;  
UPDATE production  
SET quantity_produced = quantity_produced + 10  
WHERE production_id = 1;  
SELECT * FROM production WHERE production_id = 1;  
COMMIT;  
START TRANSACTION;  
UPDATE production  
SET quantity_produced = quantity_produced - 50  
WHERE production_id = 1; ROLLBACK; 