/*
3. PRIMARY KEY Constraint
Create a table named orders with:
	order_id (integer, should be the primary key)
	customer_name (string, no constraint)
	order_date (date, no constraint)
First, define the primary key inside the CREATE TABLE statement.
Then, drop the primary key and add it again using ALTER TABLE.
*/

CREATE TABLE orders
(
	order_id int CONSTRAINT OI_cons primary key,
	customer_name VARCHAR(50),
	order_date DATE
);

ALTER TABLE orders
DROP CONSTRAINT OI_cons;

ALTER TABLE orders
ADD CONSTRAINT OI_cons primary key(order_id);