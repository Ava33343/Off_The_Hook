-- Create a table for each view in queries.sql
CREATE TABLE cardholder_trans AS 
SELECT * FROM cardholder_transactions;

CREATE TABLE cardholder_tran AS
SELECT * FROM cardholder_transaction;

CREATE TABLE smaller_than_2 AS
SELECT * FROM less_than_2;

CREATE TABLE mini_transactions AS
SELECT * FROM small_transactions;

CREATE TABLE top_100_07to09 AS
SELECT * FROM top_100_7to9;

CREATE TABLE transactions_07to09 AS
SELECT * FROM transaction_time;

CREATE TABLE vulnerable_merchant AS
SELECT * FROM vulnerable_merchants;

-- Since 12am to 5am is one of the most popular timeframe for fraudulent transactions,
-- Tables are created to fetch transaction data during the that time window.
-- One of the reasons is that people are not monitoring card activities when asleep.

CREATE TABLE suspicious_12to5am AS
SELECT * 
FROM cardholder_transactions 
  -- gets the hour of the day from the datetime
	WHERE date::time between time '00:00:00' and '05:00:00';
	
CREATE TABLE suspicious_moonlight AS
SELECT u.id, u.name, COUNT(u.id) AS "moonlight_transactions" 
FROM suspicious_12to5am as u
GROUP BY u.id, u.name
ORDER BY "moonlight_transactions" DESC;

-- Create tables for activities of less than $2.00 in amount occuring from 12am to 5am 
CREATE TABLE suspicious_mini_12to5am AS
SELECT * 
FROM suspicious_12to5am
	WHERE amount <= 2.00;

-- DROP TABLE suspicious_mini_transactions;
CREATE TABLE suspicious_mini_transactions AS
SELECT p.id, p.name, COUNT(p.id) AS "mini_transactions" 
FROM suspicious_mini_12to5am as p
GROUP BY p.id, p.name
ORDER BY "mini_transactions" DESC;

-- DROP TABLE vulnerable_merchants_moonlight;
CREATE TABLE vulnerable_merchants_moonlight AS
SELECT p.merchant, p.category, COUNT(p.merchant) AS "vulnerable_merchant_moonlight"
FROM suspicious_mini_12to5am as p
GROUP BY p.merchant, p.category
ORDER BY "vulnerable_merchant_moonlight" DESC;

-- Use export table feature to export tables created into csv file, 
-- specifying path and checking header and delimitor ','. Alternatively, an example as the following:
-- COPY suspicious_moonlight TO '../Data/suspicious_moonlight.csv' WITH (FORMAT CSV, HEADER);

