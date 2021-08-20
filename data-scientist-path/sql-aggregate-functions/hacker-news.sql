-- The purpose of this project is to demonstrate understanding of the use of aggregates in SQL
/*
Hacker News is a popular website run by Y Combinator. It’s widely known by people in the tech industry as a community site for sharing news, showing off projects, asking questions, among other things.

In this project, you will be working with a table named hacker_news that contains stories from Hacker News since its launch in 2007. It has the following columns:

title: the title of the story
user: the user who submitted the story
score: the score of the story
timestamp: the time of the story
url: the link of the story
This data was kindly made publicly available under the MIT license.
*/

-- most popular HN stories
 SELECT title, score
 FROM hacker_news
 ORDER BY 2 DESC
 LIMIT 5;

-- total score
SELECT SUM(score)
FROM hacker_news;

-- top individual users by score
SELECT user, SUM(score)
FROM hacker_news
GROUP BY 1
HAVING SUM(score) > 200
ORDER BY 2 DESC;

-- combined percentage of top users by score
SELECT (517 + 309 + 304 + 282) / 6366.0;

-- specific video search
SELECT user, COUNT(*)
FROM hacker_news
WHERE url LIKE '%watch?v=dQw4w9WgXcQ%'
GROUP BY user
ORDER BY COUNT(*) DESC;

-- stories categorized by source
SELECT CASE
    WHEN url LIKE '%github%' THEN 'GitHub'
    WHEN url LIKE '%medium%' THEN 'Medium'
    WHEN url LIKE '%nytimes%' THEN 'NyTimes'
    ELSE 'Other'
  END AS 'Source', COUNT(*)
FROM hacker_news
GROUP BY 1;

-- first 10 timestamps
SELECT timestamp
FROM hacker_news
LIMIT 10;

-- first 20 timestamps formatted
SELECT timestamp,
   strftime('%H', timestamp)
FROM hacker_news
GROUP BY 1
LIMIT 20;

-- stories by hour and score
SELECT strftime('%H', timestamp), AVG(score), COUNT(*)
FROM hacker_news
GROUP BY 1
ORDER BY 1;

-- BEST HOURS TO POST: ~7AM AND ~6-8PM
SELECT strftime('%H', timestamp) AS 'Hour', 
   ROUND(AVG(score), 1) AS 'Average Score', 
   COUNT(*) AS 'Number of Stories'
FROM hacker_news
WHERE timestamp IS NOT NULL
GROUP BY 1
ORDER BY 1;