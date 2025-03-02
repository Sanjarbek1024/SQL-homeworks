USE class8;
GO

-- ****************************************************************************
-- QUESTION 1
-- ****************************************************************************

DROP TABLE IF EXISTS Groupings
CREATE TABLE Groupings (
    Step_Number INT PRIMARY KEY,
    Status VARCHAR(10) NOT NULL
);

INSERT INTO Groupings (Step_Number, Status) VALUES
(1, 'Passed'),
(2, 'Passed'),
(3, 'Passed'),
(4, 'Passed'),
(5, 'Failed'),
(6, 'Failed'),
(7, 'Failed'),
(8, 'Failed'),
(9, 'Failed'),
(10, 'Passed'),
(11, 'Passed'),
(12, 'Passed');

--********************************************************

SELECT * FROM Groupings;

SELECT
	MIN(Step_Number) AS Min_Step_Number,
    MAX(Step_Number) AS Max_Step_Number,
    Status,
    COUNT(*) AS Consecutive_Count
FROM (
	SELECT
		Step_Number,
		Status,
		Step_Number - ROW_NUMBER() OVER(PARTITION BY Status ORDER BY Step_Number) AS GroupedID -- I used this type to group in that case
	FROM Groupings
) AS Grouped  -- I used SUBQUERY to make it easy to filter
GROUP BY Status, GroupedID
ORDER BY Min_Step_Number;

-- The result of Subquery is like that

--  Step_Number	Status	ROW_NUMBER()	GroupedID
--	1			Passed		1			0
--	2			Passed		2			0
--	3			Passed		3			0
--	4			Passed		4			0
--	5			Failed	1				4
--	6			Failed	2				4
--	7			Failed	3				4
--	8			Failed	4				4
--	9			Failed	5				4
--	10			Passed		5			5
--	11			Passed		6			5
--	12			Passed		7			5


-- *************************************************
-- QUESTION 2
-- *************************************************

DROP TABLE IF EXISTS [dbo].[EMPLOYEES_N]
CREATE TABLE [dbo].[EMPLOYEES_N]
(
    [EMPLOYEE_ID] [int] NOT NULL,
    [FIRST_NAME] [varchar](20) NULL,
    [HIRE_DATE] [date] NOT NULL
);

INSERT INTO EMPLOYEES_N (EMPLOYEE_ID, FIRST_NAME, HIRE_DATE) VALUES
(1, 'Alice', '1975-06-15'),
(2, 'Bob', '1976-03-22'),
(3, 'Charlie', '1977-09-10'),
-- No hires in 1978
(4, 'David', '1979-12-05'),
(5, 'Eve', '1980-07-18'),
-- No hires in 1981
(6, 'Frank', '1982-11-30'),
(7, 'Grace', '1983-01-25'),
(8, 'Hank', '1984-05-14'),
(9, 'Ivy', '1985-08-09'),
-- No hires from 1986 to 1989
(10, 'Jack', '1990-02-17'),
-- No hires from 1991 to 1996
(11, 'Kevin', '1997-04-03'),
-- No hires from 1998 to current year
(12, 'Lily', '2026-07-21');  -- Future date, ignored in the query

--==============================================================

SELECT 
	MIN(YearVal) AS StartYear, 
	MAX(YearVal) AS EndYear
FROM (
    SELECT (ordinal + 1974) AS YearVal, -- Generate a list of years from 1975 to the current year
		(ordinal + 1974) - ROW_NUMBER() OVER (ORDER BY (ordinal + 1974)) AS Grp -- Create a grouping key to identify consecutive missing years
    FROM string_split(REPLICATE(',', 50), ',', 1) AS AllYears 
    LEFT JOIN (SELECT DISTINCT YEAR(HIRE_DATE) AS HireYear FROM EMPLOYEES_N) AS HiredYears -- Exclude years where employees were hired
		ON (ordinal + 1974) = HiredYears.HireYear
    WHERE HiredYears.HireYear IS NULL
) AS MissingYears
GROUP BY Grp -- Group consecutive missing years together
ORDER BY StartYear;  -- Sort the result by the starting year of each missing interval


