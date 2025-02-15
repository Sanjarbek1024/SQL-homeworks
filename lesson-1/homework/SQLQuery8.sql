/*
8. All at once

Create a books table with:
	book_id (integer, primary key, auto-increment)
	title (string, must not be empty)
	price (decimal, must be greater than 0)
	genre (string, default should be 'Unknown')

Insert data and test if all constraints work as expected.
*/

CREATE TABLE books
(
	book_id INT PRIMARY KEY IDENTITY(1,1),
	title VARCHAR(200) NOT NULL,
	price DECIMAL(8, 2) CHECK(price > 0),
	genre VARCHAR(200) DEFAULT 'Unknown'
);

INSERT INTO books (title, price, genre)
VALUES 
	('You and me', 300, 'Horror'),
	('Mindset', 100, 'bestseller'),
	('Atomic habits', 312, 'self-help')

SELECT * FROM books