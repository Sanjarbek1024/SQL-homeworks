-- GROUP BY

SELECT DISTINCT empid
FROM [Sales].[Orders];

SELECT empid
FROM [Sales].[Orders]
GROUP BY empid

-- AGGREGATE FUNCTION: SUM, COUNT, ...

SELECT empid, COUNT(*) as soni
FROM [Sales].[Orders]
GROUP BY empid;

SELECT empid, COUNT(*) as soni
FROM [Sales].[Orders]
WHERE empid < 100
GROUP BY empid
HAVING COUNT(*) > 50;

-- ORDER BY

SELECT *,
	2 *  unitprice AS Price2
FROM Production.Products
WHERE 2 * unitprice > 10
ORDER BY categoryid DESC -- ASC

SELECT TOP 5
	*,
	2 *  unitprice AS Price2
FROM Production.Products
WHERE 2 * unitprice > 10
ORDER BY Price2 DESC;

/* Syntax order:
SELECT <COLUMNS>
FROM <TABLE NAME>
WHERE <FILTERING CONDITION>
GROUP BY <COLUMNS>
HAVING <FILTERING CONDITION>
ORDER BY
*/


/* Execution order:
FROM <TABLE NAME>
WHERE <FILTERING CONDITION>
GROUP BY <COLUMNS>
HAVING <FILTERING CONDITION>
SELECT <COLUMNS>
ORDER BY
*/



-- OFFSET AND FETCH


/*
...
ORDER BY <COLUMNS> [ASC, DESC]
OFFSET <n_rows to skip> {ROW|ROWS}
FETCH {FIRST|NEXT} <n_rows to select> {ROW|ROWS} ONLY
*/

SELECT *,
	2 * unitprice as Price2
FROM PRODUCTION.PRODUCTS
ORDER BY productid
offset 2 row fetch first 10 row only
