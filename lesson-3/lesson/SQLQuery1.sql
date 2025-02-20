--CREATE DATABASE class3;
--GO

--USE class3;
--GO

--select 0 astaxmi, * from Nums where n > 99989

SELECT TOP 10 PERCENT
	PRODUCTID, *
FROM [Production].[Products]

SELECT TOP 10
	PRODUCTID, *
FROM [Production].[Products]

SELECT 
	1 AS Birlar, productid as ID
FROM [Production].[Products]

SELECT
	ID = productid, -- NEW NAME = PREVIUS NAME
	*
FROM [Production].[Products]

------------------------------

SELECT *,
	2 * unitprice AS TWICE
FROM Production.Products

------------------------------

SELECT 
	[Production].[Products].[productid]
FROM [Production].[Products];

-------------------------------

SELECT 
	P.[productid]
FROM [Production].[Products] AS P;

-------------------------------

SELECT DISTINCT 
	supplierid, categoryid 
FROM production.products

-------------------------------
-------------------------------

/* WHERE condition */

SELECT /* *,*/ shippeddate
FROM [Sales].[Orders]
WHERE freight > 50
--GROUP BY
--HAVING 
--ORDER BY

-----------------------------
-----------------------------

SELECT shippeddate
FROM [Sales].[Orders]
WHERE 
	freight > 50 AND
	shipperid = 1 AND
	empid IN (1, 2, 4)

SELECT distinct shipperid--*, shipname as yangisi
FROM [Sales].[Orders]
WHERE
	shipperid != 1
	-- shipperid <> 1

SELECT distinct shipperid--*, shipname as yangisi
FROM [Sales].[Orders]
WHERE
	NOT shipperid = 1

-- AND, OR, NOT, BETWEEN

SELECT distinct empid  --*, shipname as yangisi
FROM [Sales].[Orders]
WHERE
	empid BETWEEN 3 AND 5