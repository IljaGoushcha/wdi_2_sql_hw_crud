-- In case there is already a bank_homework database, drop it
DROP DATABASE IF EXISTS bank_homework;

-- Create a bank_homework database
CREATE DATABASE bank_homework;

-- Connect to the bank_homework databases
--\echo 'bank_homework'
\connect "bank_homework"

-- Create a payments table
--  The table should have columns of id, created_at, amount, payer_name,
--  recipient_name, and description with the appropriate datatypes
CREATE TABLE payments (id SERIAL PRIMARY KEY, created_at DATE, amount INT, payer_name TEXT, recipient_name TEXT, description TEXT);
\d payments
-- Alter the payments table, add the column of `zipcode`
-- to specify where the transaction was made
ALTER TABLE payments ADD zipcode TEXT;
\d payments
-- Insert 5 rows into the payments table
-- The first of these payments should be deposits
-- try to keep the accounts positive and have at least three different payers.
INSERT INTO payments (created_at, amount, payer_name, recipient_name, description, zipcode) VALUES ('2014-09-23', 1000, 'Oleg', 'Ilja', 'rent', 92656);
INSERT INTO payments (created_at, amount, payer_name, recipient_name, description, zipcode) VALUES ('2014-09-01', 1000, 'Alex', 'Ilja', 'rent', 92656);
INSERT INTO payments (created_at, amount, payer_name, recipient_name, description, zipcode) VALUES ('2014-08-01', 4000, 'Kamila', 'Ilja', 'car payment', 92325);
INSERT INTO payments (created_at, amount, payer_name, recipient_name, description, zipcode) VALUES ('2014-10-01', 370, 'John', 'Ilja', 'concert tickets', 92311);
INSERT INTO payments (created_at, amount, payer_name, recipient_name, description, zipcode) VALUES ('2014-05-25', 1, 'Bob', 'Ilja', 'DONATION', 92124);
INSERT INTO payments (created_at, amount, payer_name, recipient_name, description, zipcode) VALUES ('2014-06-28', 500, 'Mike', 'Ilja', '', 92124);
SELECT * FROM payments;
-- You receive notice that the payment with id of 4 is $10 too low.
-- Alter that row so that it is corrected
UPDATE payments SET amount = 380 WHERE id = 4;
SELECT * FROM payments;

-- Delete all payments with an amount under $2
DELETE FROM payments WHERE amount < 2;


-- Select all entries from the payments table
SELECT * FROM payments;

-- In a single query, output all payments ordered from the largest to the smallest
SELECT amount FROM payments ORDER BY amount DESC;

-- In a single query, output the names of all distinct recipients
SELECT DISTINCT recipient_name FROM payments;

-- In a single query, select all payments created in the past week
SELECT * FROM payments WHERE created_at < '2014-09-23';

-- In a single query, select all payments with a blank description
SELECT * FROM payments WHERE description != '';

-- In a single query, select all payments matching the name of one of the payers (choose any single one)
SELECT * FROM payments WHERE payer_name = 'Kamila'
