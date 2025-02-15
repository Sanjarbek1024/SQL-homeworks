/*
7. IDENTITY Column

Create a table named invoice with:
	invoice_id (integer, should auto-increment starting from 1)
	amount (decimal, no constraint)

Insert 5 rows into the table without specifying invoice_id.
Enable and disable IDENTITY_INSERT, then manually insert a row with invoice_id = 100.
*/

CREATE TABLE invoice
(
	invoice_id INT IDENTITY(1,1) PRIMARY KEY,
	amount DECIMAL(10, 2)
);

INSERT INTO invoice (amount) VALUES
(100.50), 
(200.75), 
(150.00), 
(300.25), 
(250.00);

SET IDENTITY_INSERT invoice ON;

INSERT INTO invoice (invoice_id, amount) 
VALUES (100, 500.00); 

SET IDENTITY_INSERT invoice OFF; 

SELECT * FROM invoice