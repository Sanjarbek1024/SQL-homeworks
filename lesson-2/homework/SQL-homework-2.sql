USE class2;

CREATE TABLE data_types_demo (
    id INT IDENTITY(1,1) PRIMARY KEY, -- Auto-incrementing integer for ID
    name VARCHAR(50), -- Variable-length string (Name)
    age TINYINT, -- Small integer (Age, 0-255)
    height SMALLINT, -- Small integer (Height in cm)
    population BIGINT, -- Large integer (World population example)
    salary DECIMAL(10,2), -- Decimal for salary (supports two decimal places)
    birth_date DATE, -- Date (Birth date)
    created_at DATETIME, -- Date and time (Record creation timestamp)
    updated_at TIME, -- Getting local time
    unique_id UNIQUEIDENTIFIER, -- Unique identifier (GUID)
    profile_picture VARBINARY(MAX) -- Storing image as binary data (photo)
);

INSERT INTO data_types_demo (name, age, height, population, salary, birth_date, created_at, unique_id, profile_picture) 
VALUES 
('Alice', 25, 165, 7800000000, 50000.50, '1998-05-15', GETDATE(), NEWID(), NULL),  -- NULL for profile_picture
('Bob', 30, 175, 1400000000, 65000.75, '1993-08-22', GETDATE(), NEWID(), NULL),
('Charlie', 22, 180, 330000000, 40000.00, '2001-12-10', GETDATE(), NEWID(), NULL);

SELECT * FROM data_types_demo;
