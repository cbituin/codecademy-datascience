-- The purpose of this project is to demonstrate understanding of the use of aggregates in SQL

-- SELECT * FROM startups;
/*
The startups table has ten columns:

name
location
category
employees
raised
valuation
founded
stage
ceo
info
*/

SELECT COUNT(*) from startups;
-- 70 total companies listed in DB

-- total value of all companies
SELECT SUM(valuation)
FROM startups;

-- highest amount raised by a startup
SELECT MAX(raised)
FROM startups;

-- highest amount raised by a startup during 'Seed'
SELECT MAX(raised)
FROM startups
WHERE stage = 'Seed';

-- year oldest company founded
SELECT MIN(founded)
FROM startups;

-- average valuation
SELECT AVG(valuation)
FROM startups;

-- average valuation BY CATEGORY
SELECT category, ROUND(AVG(valuation), 2)
FROM startups
GROUP BY 1
ORDER BY 2 DESC;

-- number of companies in each category, min 3
SELECT category, COUNT(*) as total_companies
FROM startups
GROUP BY category
HAVING total_companies > 3;

-- average size in each location
SELECT location, AVG(employees)
FROM startups
GROUP BY location
HAVING AVG(employees) > 500;