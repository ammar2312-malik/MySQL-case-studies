1.
SELECT dp.production_id,
w.well_name,
a.asset_name,
dp.production_date,
dp.oil_barrels, dp.gas_mcf
FROM daily_production dp
JOIN wells w
ON dp.well_id = w.well_id
JOIN assets a
ON w.asset_id = a.asset_id;

2.
SELECT
w.well_name,
SUM(dp.oil_barrels) AS total_oil_production
FROM daily_production dpJOIN wells w
ON dp.well_id = w.well_id
GROUP BY w.well_name;

3.
SELECT production_date,
AVG(oil_barrels) AS avg_daily_production
FROM daily_production
GROUP BY production_date;
4.
SELECT production_id,
COALESCE(oil_barrels, 0) AS oil_barrels
FROM daily_production;

5.
SELECT well_name,
total_production,
DENSE_RANK()
OVER (ORDER BY total_production DESC) AS production_rank
FROM
(
SELECT
w.well_name,
SUM(COALESCE(dp.oil_barrels,0)) AS total_production
FROM wells w
JOIN daily_production dp
ON w.well_id = dp.well_id
GROUP BY w.well_name) t;

6.
SELECT production_date,
daily_total,
SUM(daily_total)
OVER (ORDER BY production_date) AS running_total
FROM
(
SELECT production_date,
SUM(COALESCE(oil_barrels,0)) AS daily_total
FROM daily_production
GROUP BY production_date
) t;

7.
SELECT
production_date,
well_id, oil_barrels,
LAG(oil_barrels)
OVER (
PARTITION BY well_id
ORDER BY production_date
) AS previous_day_production,
LEAD(oil_barrels)
OVER (
PARTITION BY well_id
ORDER BY production_date
) AS next_day_productionFROM daily_production;

8.
SELECT *
FROM
(
SELECT
production_id,
well_id, sensor_id,
production_date,
oil_barrels,
ROW_NUMBER()
OVER ( PARTITION BY
well_id, sensor_id,
production_date,
oil_barrels ORDER BY
production_id
) AS rn
FROM daily_production
)t
WHERE rn > 1;

9.
WITH RECURSIVE engineer_hierarchy AS
(
SELECT engineer_id,
engineer_name,
designation,
manager_id, 1 AS
hierarchy_levelFROM engineers
WHERE manager_id IS NULL
UNION ALL
SELECT
e.engineer_id,
e.engineer_name,
e.designation,
e.manager_id,
eh.hierarchy_level + 1 FROM
engineers e
JOIN engineer_hierarchy eh
ON e.manager_id = eh.engineer_id
)
SELECT * FROM engineer_hierarchy;

10.
CREATE INDEX idx_well_date_sensor
ON daily_production(well_id, production_date, sensor_id);
EXPLAIN
SELECT *
FROM daily_production
WHERE well_id = 1
AND production_date = '2025-03-01'
AND sensor_id = 1;
Case