/*

Suppose you are a Data Analyst at Lyft, a ride-sharing platform. For a project, you were given three tables:

trips: trips information
riders: user data
cars: autonomous cars

*/
-- examine the three tables.
SELECT * FROM trips;
 
SELECT * FROM riders;
 
SELECT * FROM cars;

-- create a Trip Log with the trips and its users.
SELECT *
FROM trips as t
LEFT JOIN riders as r
  ON t.rider_id = r.id;

-- create a link between the trips and the cars used during those trips.
SELECT *
FROM trips as t
INNER JOIN cars as c
  ON t.car_id = c.id;

-- Stack riders tables
SELECT *
FROM riders
UNION
SELECT *
FROM riders2;

-- What is the average cost for a trip?
SELECT ROUND(AVG(COST), 2)
FROM trips;

-- Find all the riders who have used Lyft less than 500 times!
SELECT *
FROM riders
WHERE total_trips < 500;

-- Calculate the number of cars that are active.
SELECT COUNT(*)
FROM cars
WHERE status = 'active';

-- Find the two cars that have the highest trips_completed.
SELECT *
FROM cars
ORDER BY trips_completed DESC
LIMIT 2;