CREATE DATABASE Library

USE Library

CREATE TABLE book
(
	book_id INT IDENTITY(1,1) PRIMARY KEY,
	title VARCHAR(255) NOT NULL,
	author VARCHAR(255) NOT NULL,
	published_year INT CHECK (published_year >= 0) 
);

CREATE TABLE member
(
	member_id INT IDENTITY(1, 1) PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	email VARCHAR(255) UNIQUE,
	phone_number VARCHAR(20) DEFAULT 'Telefon raqam mavjud emas'
);

CREATE TABLE loan
(
	loan_id INT IDENTITY(1, 1) PRIMARY KEY,
	book_id INT FOREIGN KEY REFERENCES book(book_id),
	member_id INT FOREIGN KEY REFERENCES member(member_id),
	loan_date DATE NOT NULL,
	return_date Date DEFAULT 'Qaytarilmagan'
);

INSERT INTO member (name, email, phone_number) VALUES
('Ali Valiyev', 'ali@example.com', '998901234567'),
('Zarina Karimova', 'zarina@example.com', '998937654321'),
('Jamshid Anvarov', 'jamshid@example.com', NULL);

INSERT INTO book (title, author, published_year) VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 1925),
('1984', 'George Orwell', 1949),
('To Kill a Mockingbird', 'Harper Lee', 1960);

INSERT INTO loan (book_id, member_id, loan_date, return_date) VALUES
(1, 1, '2024-02-10', NULL),
(2, 1, '2024-01-15', '2024-02-01'),
(3, 2, '2024-02-05', NULL);


SELECT * FROM member;
SELECT * FROM book;
SELECT * FROM loan; 
