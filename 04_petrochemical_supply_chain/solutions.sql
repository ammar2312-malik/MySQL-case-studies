1.
SELECT
sh.shipment_id,
s.supplier_name,
w.warehouse_name,
sh.shipment_date,
sh.delivery_date,
sh.shipment_status
FROM shipments sh
JOIN suppliers sON sh.supplier_id = s.supplier_id
JOIN warehouses w
ON sh.warehouse_id = w.warehouse_id;

2.
SELECT
s.supplier_name,
COUNT(sh.shipment_id) AS total_shipments
FROM suppliers s
LEFT JOIN shipments sh
ON s.supplier_id = sh.supplier_id
GROUP BY s.supplier_name;

3.
SELECT
w.warehouse_name,
p.product_name,
i.stock_quantity FROM
inventory i
JOIN warehouses w
ON i.warehouse_id = w.warehouse_id
JOIN products p
ON i.product_id = p.product_id;

4.
SELECT
shipment_id,
shipment_date,
COALESCE(delivery_date, 'Pending Delivery') AS delivery_status
FROM shipments;5.
SELECT
supplier_name,
avg_delivery_days,
DENSE_RANK()
OVER (ORDER BY avg_delivery_days ASC) AS supplier_rank
FROM
(
SELECT
s.supplier_name,
AVG(
DATEDIFF(delivery_date, shipment_date)
) AS avg_delivery_days
FROM suppliers s
JOIN shipments sh
ON s.supplier_id = sh.supplier_id
WHERE delivery_date IS NOT NULL
GROUP BY s.supplier_name
) t;

6.
Didn’t Did this one

7.
SELECT *
FROM(
SELECT
shipment_id,
supplier_id,
warehouse_id,
shipment_date,
delivery_date,
ROW_NUMBER()
OVER ( PARTITION BY
supplier_id,
warehouse_id,
shipment_date,
delivery_date
ORDER BY shipment_id
) AS rn
FROM shipments
)t
WHERE rn > 1;

8.
INSERT INTO inventory
(
warehouse_id,
product_id,
stock_quantity
)
VALUES
(1,1,250)ON DUPLICATE KEY UPDATE
stock_quantity = stock_quantity + VALUES(stock_quantity);
SELECT *
FROM inventory
WHERE warehouse_id = 1
AND product_id = 1;

9.
CREATE INDEX idx_inventory_lookup
ON inventory(warehouse_id, product_id);
EXPLAIN
SELECT *
FROM inventory
WHERE warehouse_id = 1
AND product_id = 1;

10.
DELIMITER $$
CREATE PROCEDURE monthly_inventory_report (
IN input_month INT,
IN input_year INT
)
BEGINSELECT
w.warehouse_name,
p.product_name,
SUM(
CASE
WHEN sm.movement_type = 'IN'
THEN sm.quantity
ELSE 0
END
) AS total_stock_in,
SUM(
CASE
WHEN sm.movement_type = 'OUT'
THEN sm.quantity
ELSE 0
END
) AS total_stock_out
FROM stock_movements sm
JOIN warehouses w
ON sm.warehouse_id = w.warehouse_id JOIN products p
ON sm.product_id = p.product_id
WHERE MONTH(sm.movement_date) = input_month
AND YEAR(sm.movement_date) = input_year
GROUP BY
w.warehouse_name,p.product_name;
END $$
DELIMITER ;
CALL monthly_inventory_report(4, 2025);