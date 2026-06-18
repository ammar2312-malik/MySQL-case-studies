1.
SELECT
a.aircraft_code,
a.aircraft_model,
t.technician_name,
t.specialization, mr.inspection_date,
mr.maintenance_status
FROM maintenance_records mr
JOIN aircraft a
ON mr.aircraft_id = a.aircraft_id
JOIN technicians t
ON mr.technician_id = t.technician_id;

2.
SELECT
a.aircraft_code,
COUNT(mr.maintenance_id) AS total_inspections
FROM aircraft a
LEFT JOIN maintenance_records mrON a.aircraft_id = mr.aircraft_id
GROUP BY a.aircraft_code;

3.
SELECT
t.technician_name,
AVG(mr.maintenance_hours) AS avg_maintenance_hours
FROM technicians t
JOIN maintenance_records mr
ON t.technician_id = mr.technician_id
GROUP BY t.technician_name;

4.
SELECT maintenance_id,
COALESCE(maintenance_status, 'Pending') AS maintenance_status
FROM maintenance_records;

5.
SELECT technician_name,
completed_inspections,
DENSE_RANK()
OVER (ORDER BY completed_inspections DESC) AS technician_rank
FROM
(
SELECT
t.technician_name,
COUNT(mr.maintenance_id) AS completed_inspections
FROM technicians t
JOIN maintenance_records mr
ON t.technician_id = mr.technician_id
WHERE mr.maintenance_status = 'Completed'GROUP BY t.technician_name
) x;

6.
aircraft_id, inspection_date,
COUNT(*) OVER (
PARTITION BY aircraft_id
ORDER BY inspection_date
) AS running_total_inspections
FROM maintenance_records;

7.
SELECT
aircraft_id, inspection_date,
LAG(inspection_date)
OVER (
PARTITION BY aircraft_id
ORDER BY inspection_date
) AS previous_inspection_date,
LEAD(inspection_date)
OVER (
PARTITION BY aircraft_id
ORDER BY inspection_date )
AS next_inspection_date,
DATEDIFF( inspection_date,
LAG(inspection_date)OVER (
PARTITION BY aircraft_id
ORDER BY inspection_date
)
) AS days_since_last_inspection
FROM maintenance_records;

8.
WITH RECURSIVE technician_hierarchy AS
(
SELECT
technician_id,
technician_name,
designation,
manager_id, 1 AS
hierarchy_level
FROM technicians
WHERE manager_id IS NULL
UNION ALL
SELECT
t.technician_id,
t.technician_name,
t.designation,t.manager_id,
th.hierarchy_level + 1
FROM technicians t
JOIN technician_hierarchy th
ON t.manager_id = th.technician_id
)

SELECT * FROM technician_hierarchy;
9. UDF I haven’t Done

10. Dynamic SQL + GRANT / REVOKE
Dynamic SQL I haven’t done
CREATE USER 'maintenance_analyst'@'localhost'
GRANT SELECT
ON aviation_maintenance_case_study.*
TO 'maintenance_analyst'@'localhost';
REVOKE INSERT, UPDATE, DELETE
ON aviation_maintenance_case_study.*
FROM 'maintenance_analyst'@'localhost';
FLUSH PRIVILEGES;