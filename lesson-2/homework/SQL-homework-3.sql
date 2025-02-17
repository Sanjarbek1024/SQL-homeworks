USE class2;

CREATE TABLE photos
(
	id INT IDENTITY(1, 1) PRIMARY KEY,
	photos_path VARBINARY(MAX)
);

INSERT INTO photos (photos_path)
SELECT BulkColumn
FROM OPENROWSET(BULK 'C:\Users\Mezon\OneDrive\Desktop\CODES\SQL-homeworks\lesson-2\homework\pythonimg.jpeg', SINGLE_BLOB) AS img;

SELECT * FROM photos;