-- How can you isolate (or group) the transactions of each cardholder?
-- DROP VIEW cardholder_transactions;
CREATE VIEW cardholder_transactions AS
SELECT h.id, h.name, c.card, t.date, round(t.amount, 2) AS "amount", m.name AS "merchant", g.name AS "category" 
FROM card_holder h
	LEFT JOIN credit_card c
	ON h.id = c.cardholder_id
		LEFT JOIN transaction t
		ON c.card = t.card
			RIGHT JOIN merchant m
			ON t.id_merchant = m.id
				Right JOIN merchant_category g
				ON m.id_merchant_category = g.id
GROUP BY h.id, h.name, c.card, t.date, t.amount, m.name, g.name
ORDER BY h.id;

-- View transactions ranking by amounts from the highest to the lowest
CREATE VIEW cardholder_transaction AS
SELECT h.id, h.name, c.card, t.date, round(t.amount, 2) AS "amount", m.name AS "merchant", g.name AS "category" 
FROM card_holder h
	LEFT JOIN credit_card c
	ON h.id = c.cardholder_id
		LEFT JOIN transaction t
		ON c.card = t.card
			RIGHT JOIN merchant m
			ON t.id_merchant = m.id
				Right JOIN merchant_category g
				ON m.id_merchant_category = g.id
GROUP BY h.id, h.name, c.card, t.date, t.amount, m.name, g.name
ORDER BY round(t.amount, 2) DESC;

--Alternatively, could rename the columns first 
--EXEC sp_RENAME 'm.name' , 'merchant', 'COLUMN'
--EXEC sp_RENAME 'g.name' , 'category', 'COLUMN'

-- Consider the time period 7:00 a.m. to 9:00 a.m.
  -- What are the top 100 highest transactions during this time period?
CREATE VIEW transaction_time AS
SELECT * 
FROM cardholder_transaction 
  -- gets the hour of the day from the datetime
	WHERE date::time between time '07:00:00' and '09:00:00';
	
CREATE VIEW top_100_7to9 AS
SELECT * 
FROM cardholder_transaction 
  -- gets the hour of the day from the datetime
	WHERE date::time between time '07:00:00' and '09:00:00'
	LIMIT 100;
		
  -- Do you see any fraudulent or anomalous transactions?
	
  -- If you answered yes to the previous question, explain why you think there might be fraudulent transactions during this time frame.

-- Some fraudsters hack a credit card by making several small payments (generally less than $2.00), which are typically ignored by cardholders. 
-- Count the transactions that are less than $2.00 per cardholder. Is there any evidence to suggest that a credit card has been hacked? Explain your rationale.
CREATE VIEW less_than_2 AS
SELECT * 
FROM cardholder_transactions 
	WHERE amount <= 2.00;

--DROP VIEW small_transactions;
CREATE VIEW small_transactions AS
SELECT s.id, s.name, COUNT(s.id) AS "small_transactions" 
FROM less_than_2 s
GROUP BY s.id, s.name
ORDER BY "small_transactions" DESC;

-- What are the top 5 merchants prone to being hacked using small transactions?
CREATE VIEW vulnerable_merchants AS
SELECT s.merchant, s.category, COUNT(s.merchant) AS "vulnerable_merchant"
FROM less_than_2 s
GROUP BY s.merchant, s.category
ORDER BY "vulnerable_merchant" DESC;

-- Once you have a query that can be reused, create a view for each of the previous queries.
-- Alternatively, the queries from original data sets can be set up using "WHERE" and "IN" for amount <= 2
