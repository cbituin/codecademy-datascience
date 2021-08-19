/*
The Metropolitan Museum of Art of New York is one of the world’s largest and finest art museums.

In this project, you will be working with a table named met that contains the museum’s collection of American Decorative Arts.

It has the following columns:

id - the id of the art piece
department - the department of the art piece
category - the category of the art piece
title - the title name of the art piece
artist - the name of the artist
date - the date(s) of the art piece
medium - the medium of the art piece
country - the country of the artist
This data was kindly made publicly available under the Open Access Policy.
*/

 -- Inspect `met` table
 SELECT * FROM met LIMIT 10;

-- How many pieces in this collection?
 SELECT COUNT(*) 
 FROM met;

-- How many pieces where `category` includes `celery`
SELECT COUNT(*)
FROM met
WHERE category LIKE '%celery%';

-- Find category names related to above query
SELECT DISTINCT category
FROM met
WHERE category LIKE '%celery%';

-- Find oldest piece in collection
SELECT title, medium, date
FROM met
ORDER BY date
LIMIT 1;

-- Find top 10 countries with most pieces in the collection
SELECT country, COUNT(*)
FROM met
WHERE country IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

-- Find categories that have more than 100 pieces
SELECT category, COUNT(*)
FROM met
WHERE category IS NOT NULL
GROUP BY 1
HAVING COUNT(*) > 100
ORDER BY 2 DESC;

-- How many pieces where medium contains 'gold' or 'silver'
SELECT CASE
    WHEN medium LIKE '%gold%' THEN 'Gold'
    WHEN medium LIKE '%silver%' THEN 'Silver'
    ELSE NULL
  END AS 'medium_contains',
  COUNT(*)
FROM met
WHERE medium_contains IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC;
