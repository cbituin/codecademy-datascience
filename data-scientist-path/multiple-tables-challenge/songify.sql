/*
Songify Introduction
Welcome to Code Challenge: Multiple Tables!

In this Code Challenge, you’ll be performing analysis for Songify, a fictional music streaming service. Songify has a “freemium” model, meaning that it offers both a free product and a premium paid product.

You’ll be working with six tables:

plans
users
premium_users
songs
months
plays
*/

-- plans used by premium mmembers
SELECT u.user_id, p.description
FROM premium_users as u
LEFT JOIN plans as p
  on u.membership_plan_id = p.id;

-- songs played by each user
 SELECT p.user_id, p.play_date, s.title
 FROM songs as s
 LEFT JOIN plays as p
  ON s.id = p.song_id;

-- which users are not premium members
SELECT u.id
FROM users as u
LEFT JOIN premium_users as p
  ON u.id = p.user_id
WHERE p.user_id IS NULL;

-- which users played songs in January, but not February
WITH january AS (
  SELECT *
  FROM plays
  WHERE strftime("%m", play_date) = '01'
),
february AS (
  SELECT *
  FROM plays
  WHERE strftime("%m", play_date) = '02'

)
SELECT j.user_id 
FROM january as j
LEFT JOIN february as f
  ON j.user_id = f.user_id
WHERE f.user_id IS NULL;

-- For each month in months, we want to know if each user in premium_users was active or canceled
SELECT p.user_id, p.purchase_date, p.cancel_date, m.months
FROM premium_users as p
CROSS JOIN months as m;

-- This will tell us if a particular user is 'active' or 'not_active' each month
SELECT premium_users.user_id,
  months.months,
  CASE
    WHEN (
      premium_users.purchase_date <= months.months
      )
      AND
      (
        premium_users.cancel_date >= months.months
        OR
        premium_users.cancel_date IS NULL
      )
    THEN 'active'
    ELSE 'not_active'
  END AS 'status'
FROM premium_users
CROSS JOIN months;

-- the number of times that each song was played
WITH play_count as(
  SELECT song_id,
    COUNT(*) AS 'times_played'
  FROM plays
  GROUP BY song_id
)
SELECT s.title, s.artist, p.times_played
FROM songs as s
JOIN play_count as p
  ON s.id = p.song_id;