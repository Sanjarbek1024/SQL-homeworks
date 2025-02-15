/*
4. FOREIGN KEY Constraint

Create two tables:
	category:
		category_id (integer, primary key)
		category_name (string)
	item:
		item_id (integer, primary key)
		item_name (string)
		category_id (integer, should be a foreign key referencing category_id in category table)

First, define the foreign key inside CREATE TABLE.
Then, drop and add the foreign key using ALTER TABLE.
*/

CREATE TABLE category
(
	category_id int primary key,
	category_name VARCHAR(100)
);

CREATE TABLE item (
    item_id INT PRIMARY KEY,  -- PRIMARY KEY
    item_name VARCHAR(100),  -- Xato bor edi, to‘g‘rilandi
    category_id INT,
    CONSTRAINT FK_item_category FOREIGN KEY (category_id) REFERENCES category(category_id)  
);

ALTER TABLE item
DROP CONSTRAINT CID_cons;

ALTER TABLE item
ADD CONSTRAINT FK_cons FOREIGN KEY (category_id) REFERENCES category(category_id)