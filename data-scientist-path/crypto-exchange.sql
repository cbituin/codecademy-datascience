/*
Fiddy Cent is a digital currency exchange headquartered in Neo Tokyo. They broker exchanges of Bitcoin, Bitcoin Cash, Ethereum, and Litecoin with fiat currencies in around 50 countries.

Help them analyze their January ledger data using SQL aggregate functions! You are given the transactions table, which contains both money-in and money-out transactions.
*/
 -- inspecting `transactions` table
 SELECT * FROM transactions;

-- total amount bought by users
SELECT SUM(money_in)
FROM transactions;

-- total amount sold by users
SELECT SUM(money_out)
FROM transactions;

-- number of purchases
SELECT COUNT(money_in)
FROM transactions;

-- number of purchases of Bitcoin
SELECT currency, COUNT(money_in)
FROM transactions
WHERE currency LIKE '%BIT%';

-- largest transactions
SELECT MAX(money_in)
FROM transactions;
SELECT MAX(money_out)
FROM transactions;

-- average purchase for Ethereum
SELECT AVG(money_in)
FROM transactions
WHERE currency LIKE '%ETH%';

-- ledger by dates
SELECT date, ROUND(AVG(money_in), 2) AS average_money_in, ROUND(AVG(money_out), 2) as average_money_out
FROM transactions
GROUP BY date;