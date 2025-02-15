/*
5. CHECK Constraint

Create a table named account with:
	account_id (integer, primary key)
	balance (decimal, should always be greater than or equal to 0)
	account_type (string, should only accept values 'Saving' or 'Checking')

Use CHECK constraints to enforce these rules.
First, define the constraints inside CREATE TABLE.
Then, drop and re-add the CHECK constraints using ALTER TABLE.
*/

CREATE TABLE account
(
	account_id INT PRIMARY KEY,
	balance DECIMAL(8, 2) CONSTRAINT B_con CHECK(balance >= 0),
	account_type VARCHAR(100) CONSTRAINT AT_con CHECK (account_type IN ('Saving', 'Checking'))
);

ALTER TABLE account
DROP CONSTRAINT B_con;
ALTER TABLE account
DROP CONSTRAINT AT_con;

ALTER TABLE account
ADD CONSTRAINT B_con CHECK (balance >= 0);
ALTER TABLE account
ADD CONSTRAINT AT_con CHECK (account_type IN ('Saving', 'Checking'));


