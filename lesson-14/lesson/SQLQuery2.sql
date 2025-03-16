
-- PIVOT

;WITH CTE AS (
	SELECT --DISTINCT
	--	empid,
		titleofcourtesy,
		empid
	FROM [HR].[Employees]
)
SELECT
	CASE
		WHEN titleofcourtesy = 'Dr.' THEN empid
	END AS 'Dr.',
	CASE
		WHEN titleofcourtesy = 'Mr.' THEN empid
	END AS 'Mr.',
	CASE
		WHEN titleofcourtesy = 'Mrs.' THEN empid
	END AS 'Mrs.',
	CASE
		WHEN titleofcourtesy = 'Ms.' THEN empid
	END AS 'Ms.'
FROM CTE

--	Dr.		1
--	Mr.		3
--	Mrs.	1
--	Ms.		4


SELECT *
into #nima
FROM
(
	SELECT 
	--	empid,
		titleofcourtesy,
		empid
	FROM [HR].[Employees]
) SMT
PIVOT
(
	COUNT(empid) FOR titleofcourtesy IN (
		[Dr.],
		[Mr.],
		[Mrs.],
		[Ms.]
	)
) CNT


SELECT titleofcourtesy, counts
FROM #nima
unpivot
(
	counts for titleofcourtesy IN (
		[Dr.],
		[Mr.],
		[Mrs.],
		[Ms.]
	)
) unpt


------	------	------	------	------	------	------	------	------	------	------	------
------	------	------	------	------	------	------	------	------	------	------	------
------	------	------	------	------	------	------	------	------	------	------	------

-- Step 1: Creating the test table
CREATE TABLE tesmax (
    year1 INT,
    max1 INT,
    max2 INT,
    max3 INT
);

-- Step 2: Inserting test data
INSERT INTO tesmax (year1, max1, max2, max3)
VALUES
(2001, 10, 101, 87),
(2002, 103, 19, 88),
(2003, 21, 23, 89),
(2004, 27, 28, 91);

-- Step 3: Using UNPIVOT and PIVOT
SELECT * 
FROM (
    -- Unpivot max1, max2, max3 into a single column
    SELECT year1, ValueColumn
    FROM tesmax
    UNPIVOT (
        ValueColumn FOR MaxType IN (max1, max2, max3)
    ) AS Unpvt
) AS SourceTable
PIVOT (
    MAX(ValueColumn) FOR year1 IN ([2001], [2002], [2003], [2004])
) AS PivotTable;






