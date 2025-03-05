CREATE TABLE Employees
(
	EmployeeID  INTEGER PRIMARY KEY,
	ManagerID   INTEGER NULL,
	JobTitle    VARCHAR(100) NOT NULL
);
INSERT INTO Employees (EmployeeID, ManagerID, JobTitle) 
VALUES
	(1001, NULL, 'President'),
	(2002, 1001, 'Director'),
	(3003, 1001, 'Office Manager'),
	(4004, 2002, 'Engineer'),
	(5005, 2002, 'Engineer'),
	(6006, 2002, 'Engineer');

--===========================================================================
--- QUESTION 1
--===========================================================================

SELECT * 
FROM Employees;

;WITH EmployeeHierarchy AS (
    -- Base Case: President (Depth 0)
    SELECT 
		EmployeeID,
		ManagerID,
		JobTitle,
		0 AS Depth
    FROM Employees
    WHERE ManagerID IS NULL

    UNION ALL

    -- Recursive Case
    SELECT 
		e.EmployeeID,
		e.ManagerID,
		e.JobTitle, 
		eh.Depth + 1
    FROM Employees e
    JOIN EmployeeHierarchy AS eh
		ON e.ManagerID = eh.EmployeeID
)

SELECT * FROM EmployeeHierarchy ORDER BY Depth, EmployeeID;

--==============================================================
--- QUESTION 2
--==============================================================

;WITH factorial AS (
	SELECT 1 AS nums, 1 AS facts -- BASE CASE
	
	UNION ALL
	
	-- Recursive Case: Compute factorial for the next number
    -- factorial(n) = n * factorial(n-1)
	SELECT nums + 1, facts * (nums + 1)
	FROM factorial
	WHERE nums < 10 -- Continue recursion until num reaches N (10)
)

SELECT * FROM factorial;

--==============================================================
--- QUESTION 3
--==============================================================

;WITH Fibonacci AS (
    -- Base Case: Start with F(1) = 1, F(2) = 1
    SELECT 1 AS n, 1 AS fib1, 1 AS fib2
    
    UNION ALL
    
    -- Recursive Case: Generate the next Fibonacci number
    SELECT n + 1, fib2, fib1 + fib2
    FROM Fibonacci
    WHERE n < 10  -- Change this to the desired N value
)

--Retrieve the Fibonacci sequence
SELECT n, fib1 AS Fibonacci_Number FROM Fibonacci;
