/*
6. DEFAULT Constraint

Create a table named customer with:
	customer_id (integer, primary key)
	name (string, no constraint)
	city (string, should have a default value of 'Unknown')

First, define the default value inside CREATE TABLE.
Then, drop and re-add the default constraint using ALTER TABLE.
*/

CREATE TABLE customer
(
	customer_id INT PRIMARY KEY,
	name VARCHAR(50),
	city VARCHAR(50) CONSTRAINT DF_City DEFAULT 'Unknown'
);

ALTER TABLE customer
DROP CONSTRAINT DF_City

ALTER TABLE customer
ADD CONSTRAINT yangisi DEFAULT 'Unknown' for city
