USE class10;
GO
DROP TABLE IF EXISTS Shipments
CREATE TABLE Shipments (
    N INT PRIMARY KEY,
    Num INT
);

INSERT INTO Shipments (N, Num) VALUES
(1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1), (7, 1), (8, 1), 
(9, 2), (10, 2), (11, 2), (12, 2), (13, 2), 
(14, 4), (15, 4), (16, 4), (17, 4), (18, 4), (19, 4), (20, 4), (21, 4), (22, 4), (23, 4), (24, 4), (25, 4), 
(26, 5), (27, 5), (28, 5), (29, 5), (30, 5), (31, 5), 
(32, 6), (33, 7);

--============================================================================

;WITH cte AS (
    SELECT 1 AS numb
    UNION ALL
    SELECT numb + 1 FROM cte
    WHERE numb < 40
),
ShipmentsAdjusted AS (
    -- Join with actual shipments, replacing missing values with 0
    SELECT 
        c.numb AS Days,
        ISNULL(s.Num, 0) AS Numbers
    FROM cte c
    LEFT JOIN Shipments s 
		ON c.numb = s.N
)

SELECT AVG(Numbers * 1.0) AS Median
FROM (
    -- Find the median based on row count
    SELECT Numbers, 
           ROW_NUMBER() OVER (ORDER BY Numbers) AS row_num,
           COUNT(*) OVER () AS total_rows
    FROM ShipmentsAdjusted
) AS subquery
WHERE row_num IN (FLOOR((total_rows + 1) / 2), CEILING((total_rows + 1) / 2));