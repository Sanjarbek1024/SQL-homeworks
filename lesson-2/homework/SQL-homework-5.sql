USE class2;

DROP TABLE IF EXISTS worker;
CREATE TABLE worker (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

BULK INSERT worker
FROM 'C:\Users\Mezon\OneDrive\Desktop\CODES\SQL-homeworks\lesson-2\homework\worker_data.csv'  
WITH (
    FIELDTERMINATOR = ',',   
    ROWTERMINATOR = '\n',      
    FIRSTROW = 2               
);

SELECT * FROM worker;

