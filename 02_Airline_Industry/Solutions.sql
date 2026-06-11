1.
SELECT
f.flight_number,
f.flight_date,
p.passenger_name,
b.seat_number,
b.booking_status
FROM bookings b JOIN
flights f
ON b.flight_id = f.flight_id
JOIN passengers pON b.passenger_id = p.passenger_id;

2.
SELECT
f.flight_number,
COUNT(b.passenger_id) AS total_passengers
FROM flights f
LEFT JOIN bookings b
ON f.flight_id = b.flight_id
GROUP BY f.flight_number;

3.
SELECT
CONCAT(a1.airport_code, ' -> ', a2.airport_code) AS route,
SUM(b.booking_amount) AS total_revenue
FROM bookings b
JOIN flights f
ON b.flight_id = f.flight_id
JOIN airports a1
ON f.source_airport_id = a1.airport_id
JOIN airports a2
ON f.destination_airport_id = a2.airport_id
GROUP BY route;

4.
SELECT
flight_number,
COALESCE(delay_minutes, 0) AS delay_minutes
FROM flights;5. Rank flights by revenue using
DENSE_RANK SELECT flight_number,
total_revenue,
DENSE_RANK() OVER (ORDER BY total_revenue DESC) AS
revenue_rank
FROM
(
SELECT
f.flight_number,
SUM(b.booking_amount) AS total_revenue
FROM flights f
JOIN bookings b
ON f.flight_id = b.flight_id
GROUP BY f.flight_number
) t;

6.
SELECT
flight_date,
daily_revenue,
SUM(daily_revenue)
OVER (ORDER BY flight_date) AS running_total_revenue
FROM
(
SELECT
f.flight_date,
SUM(b.booking_amount) AS daily_revenue
FROM flights f
JOIN bookings bON f.flight_id = b.flight_id
GROUP BY f.flight_date
) x;

7.
SELECT
flight_number,
flight_date,
delay_minutes,
LAG(delay_minutes)
OVER (ORDER BY flight_date) AS previous_delay,
LEAD(delay_minutes)
OVER (ORDER BY flight_date) AS next_delay
FROM flights;

8. 
SELECT *
FROM
(
SELECT
booking_id,
flight_id,
passenger_id,
seat_number,
booking_date,
ROW_NUMBER() OVER (
PARTITION BY flight_id,
passenger_id,seat_number,
booking_date
ORDER BY booking_id
) AS rn
FROM bookings
)t
WHERE rn > 1;

9.
CREATE INDEX idx_flight_search
ON flights(source_airport_id, destination_airport_id, flight_date);
EXPLAIN
SELECT *
FROM flights
WHERE source_airport_id = 1
AND destination_airport_id = 2
AND flight_date = '2025-02-01';

10.
START TRANSACTION;
SELECT total_seats
FROM aircraft a
JOIN flights f
ON a.aircraft_id = f.aircraft_id
WHERE f.flight_id = 1;
SELECT COUNT(*) AS booked_seats
FROM bookings
WHERE flight_id = 1AND booking_status = 'CONFIRMED';
INSERT INTO bookings
(
flight_id,
passenger_id,
seat_number,
booking_date,
booking_amount,
booking_status
)
VALUES
(1,6,'15C','2025-01-30',6500,'CONFIRMED');
COMMIT;
START TRANSACTION;
INSERT INTO bookings
(
flight_id,
passenger_id,
seat_number,
booking_date,
booking_amount,
booking_status
)
VALUES
(1,6,'15D','2025-01-30',6500,'CONFIRMED');
ROLLBACK;