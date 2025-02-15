/* 
2. UNIQUE Constraint
Create a table named product with the following columns:
	product_id (integer, should be unique)
	product_name (string, no constraint)
	price (decimal, no constraint)
First, define product_id as UNIQUE inside the CREATE TABLE statement.
Then, drop the unique constraint and add it again using ALTER TABLE.
Extend the constraint so that the combination of product_id and product_name must be unique.
*/

CREATE TABLE product
(
	product_id int CONSTRAINT PID_constraints unique,
	product_name VARCHAR(50),
	price DECIMAL(8,2)
);

ALTER TABLE product
DROP CONSTRAINT PID_constraints;

ALTER TABLE product
ADD CONSTRAINT extended_constraint unique(product_id, product_name);