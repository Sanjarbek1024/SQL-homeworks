-- ===================================================================
-- SQL Server Temporary Table
-- ===================================================================

CREATE TABLE #sales 
(
	id INT,
	product VARCHAR(50),
	price INT
);

INSERT INTO #sales
VALUES 
	(1, 'ESD', 40867),
	(8, 'GPF', 60067),
	(9, 'VCB', 50000),
	(10, 'OIL', 70797)

SELECT * FROM #sales


--=====================================================
-- SQL Server Global Temp Tables
--=====================================================

CREATE TABLE ##temp
(
	id INT,
	name VARCHAR(50)
);

INSERT INTO ##temp
VALUES (1, 'JOHN'), (2, 'DOE')

SELECT * FROM ##temp







