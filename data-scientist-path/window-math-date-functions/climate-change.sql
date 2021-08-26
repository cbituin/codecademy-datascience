/* 
These data will show the average annual temperature for each state – this is the average temperature of every day in all parts of the state for that year.

For this project, you will be working with one table:

state_climate
*/

-- inspect table
SELECT * 
FROM state_climate;

-- start by looking at how the average temperature changes over time in each state.
SELECT state, year, tempf,
  AVG(tempf) OVER (
    PARTITION BY state
    ORDER BY year
  )
FROM state_climate;

-- explore the lowest temperatures for each state.
SELECT state, year, tempf,
  FIRST_VALUE (tempf) OVER (
    PARTITION BY state
    ORDER BY tempf
  )
FROM state_climate;


-- explore the highest temperatures for each state.
SELECT state, year, tempf,
  FIRST_VALUE (tempf) OVER (
    PARTITION BY state
    ORDER BY tempf DESC
  )
FROM state_climate;

-- see how temperature has changed each year in each state.
SELECT state, year, tempf,
  tempf - LAG(tempf, 1) OVER (
    PARTITION BY state
    ORDER BY year
  ) AS 'change_in_temp'
FROM state_climate
ORDER BY change_in_temp DESC;

-- return a rank of the coldest temperatures on record
SELECT RANK() OVER (
  ORDER BY tempf
) as coldest_rank, year, state, tempf
FROM state_climate
ORDER BY 1;

-- return a rank of the warmest temperatures on record
SELECT RANK() OVER (
  ORDER BY tempf DESC
) as coldest_rank, year, state, tempf
FROM state_climate
ORDER BY 1;

