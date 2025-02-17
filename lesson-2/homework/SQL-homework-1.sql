CREATE DATABASE class2;

USE class2;

CREATE TABLE test_identity
(
	ID INT IDENTITY(1, 1) PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
);

INSERT INTO test_identity(name) VALUES
('Neo'),
('Alex'),
('Bob'),
('Sam'),
('Ali')

SELECT * FROM test_identity


DELETE FROM test_identity WHERE ID < 4;
SELECT * FROM test_identity
-- DELETE FROM removes only the data from the table while keeping the table structure intact. You can also specify conditions to delete specific rows. You don't need to create new table.
-- It also doesn't effect to IDENTITY. 

TRUNCATE TABLE test_identity;
SELECT * FROM test_identity;
-- This type of DELETE removes only the data from the table while keeping the table structure intact.The difference than DELETE FROM is that you cannot specify coditions. You don't need to create new table.


DROP TABLE test_identity;
SELECT * FROM test_identity; --Also you cannot see this after dropping. 
-- This type of DROP operation completely deletes the table. After that, you need to create a new table.
