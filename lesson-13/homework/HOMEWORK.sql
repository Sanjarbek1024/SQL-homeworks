USE class13;
GO

DECLARE @inputdate DATE = GETDATE();

;WITH Dates AS (
    -- Generate all dates in the given month
    SELECT DATEFROMPARTS(YEAR(@inputdate), MONTH(@inputdate), 1) AS DateValue
    UNION ALL
    SELECT DATEADD(DAY, 1, DateValue)
    FROM Dates
    WHERE DateValue < EOMONTH(@inputdate)
),
Calendar AS (
    -- Assign weekday numbers and week numbers
    SELECT
        DateValue,
        DATEPART(WEEKDAY, DateValue) AS WeekdayNum,
        DATEDIFF(WEEK, DATEFROMPARTS(YEAR(@inputdate), MONTH(@inputdate), 1), DateValue) + 1 AS WeekNum
    FROM Dates
)
SELECT 
    MAX(CASE WHEN WeekdayNum = 1 THEN DAY(DateValue) END) AS Sunday,
    MAX(CASE WHEN WeekdayNum = 2 THEN DAY(DateValue) END) AS Monday,
    MAX(CASE WHEN WeekdayNum = 3 THEN DAY(DateValue) END) AS Tuesday,
    MAX(CASE WHEN WeekdayNum = 4 THEN DAY(DateValue) END) AS Wednesday,
    MAX(CASE WHEN WeekdayNum = 5 THEN DAY(DateValue) END) AS Thursday,
    MAX(CASE WHEN WeekdayNum = 6 THEN DAY(DateValue) END) AS Friday,
    MAX(CASE WHEN WeekdayNum = 7 THEN DAY(DateValue) END) AS Saturday
FROM Calendar
GROUP BY WeekNum
ORDER BY WeekNum;




USE class13;
GO

DECLARE @inputdate DATE = GETDATE();

;WITH Dates AS (
    -- Generate all dates in the given month
    SELECT DATEFROMPARTS(YEAR(@inputdate), MONTH(@inputdate), 1) AS DateValue
    UNION ALL
    SELECT DATEADD(DAY, 1, DateValue)
    FROM Dates
    WHERE DateValue < EOMONTH(@inputdate)
),
Calendar AS (
    -- Assign weekday numbers and week numbers
    SELECT
        DateValue,
        DATEPART(WEEKDAY, DateValue) AS WeekdayNum,
        DATEDIFF(WEEK, DATEFROMPARTS(YEAR(@inputdate), MONTH(@inputdate), 1), DateValue) + 1 AS WeekNum
    FROM Dates
)
SELECT 
	-- WeekNum,
    MAX(CASE WHEN WeekdayNum = 1 THEN DAY(DateValue) END) AS Sunday,
    MAX(CASE WHEN WeekdayNum = 2 THEN DAY(DateValue) END) AS Monday,
    MAX(CASE WHEN WeekdayNum = 3 THEN DAY(DateValue) END) AS Tuesday,
    MAX(CASE WHEN WeekdayNum = 4 THEN DAY(DateValue) END) AS Wednesday,
    MAX(CASE WHEN WeekdayNum = 5 THEN DAY(DateValue) END) AS Thursday,
    MAX(CASE WHEN WeekdayNum = 6 THEN DAY(DateValue) END) AS Friday,
    MAX(CASE WHEN WeekdayNum = 7 THEN DAY(DateValue) END) AS Saturday
FROM Calendar
GROUP BY WeekNum
ORDER BY WeekNum;
