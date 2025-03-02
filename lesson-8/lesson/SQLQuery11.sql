---===================================================
-- SUBQUERY = SUB QUERY
---===================================================


SELECT 1
SELECT 1, 2
SELECT 1a
SELECT 'A'[1]


select *, --2000.00
	(select sum(price) from OrderDetails where ProductID = 201)
from OrderDetails


select *, --2000.00
	(select sum(price) from OrderDetails where ProductID = 201),
	(select Price from OrderDetails where ProductID = 201)
from OrderDetails

--Only one expression can be specified in the select list when the subquery is not introduced with EXISTS.
--Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.

select Category, ProductName, Price
into newtable
from OrderDetails od
join Products p
	on od.ProductID = p.ProductID;



select *
from (
	select --TOP 100 PERCENT
		*, DENSE_RANK() OVER(PARTITION BY Category ORDER BY Price desc) as rn
	from newtable
	--order by rn
) as mytable
order by rn;


--No column name was specified for column 4 of 'mytable'.

select * from OrderDetails;


select *
from OrderDetails
where productid in (select productid from OrderDetails where price > 100)

select * 
from OrderDetails as o
join Products as p
	on o.ProductID = p.ProductID
where CONCAT(o.ProductID, ProductName) IN (
	select CONCAT(ProductID, ProductName) from Products where Category = 'Electronics'
)


--====================================================
--'Zebulen,Grady,Gaylord,Mathilda,Hermina'
--'Cattrell,Gannaway,Yesson,Ryding,Currey'


select 
	fname,
	lname 
from (
	select 
		value as fname, 
		ROW_NUMBER() over(order by (select null)) as n 
	from string_split('Zebulen,Grady,Gaylord,Mathilda,Hermina', ',')
) as t
join (
	select 
		value as lname, 
		ROW_NUMBER() over(order by (select null)) as n 
	from string_split('Cattrell,Gannaway,Yesson,Ryding,Currey', ',')
) b
	on t.n = b.n 


--=======================================================
-- PUZZLE 2 : Find cumulative sum values
--=======================================================

SELECT 
	ORDINAL
	,sum(ordinal) over(order by ordinal)
into numbers
FROM string_split(REPLICATE(',', 9), ',', 1)


select
	ordinal,
	(select sum(ordinal) from numbers as t2 where t2.ordinal <= t1.ordinal )
from numbers t1

--================================================
--PUZZLE 3
--================================================

drop table if exists lagt;
CREATE TABLE lagt
(
	BusinessEntityID INT
	,SalesYear   INT
	,CurrentQuota  DECIMAL(20,4)
)
GO
 
INSERT INTO lagt
SELECT 275 , 2005 , '367000.00'
UNION ALL
SELECT 275 , 2006 , '556000.00'
UNION ALL
SELECT 275 , 2007 , '502000.00'
UNION ALL
SELECT 275 , 2008 , '550000.00'
UNION ALL
SELECT 275 , 2009 , '1429000.00'
UNION ALL
SELECT 275 , 2010 ,  '1324000.00'
UNION ALL
SELECT 276 , 2005 , '367000.00'
UNION ALL
SELECT 276 , 2006 , '556000.00'
UNION ALL
SELECT 276 , 2007 , '502000.00'
UNION ALL
SELECT 276 , 2008 , '550000.00'
UNION ALL
SELECT 276 , 2009 , '1429000.00'
UNION ALL
SELECT 276 , 2010 ,  '1324000.00'


SELECT
	*,
	LAG(CurrentQuota) OVER(partition by businessentityid ORDER BY SalesYear)
FROM lagt



SELECT
	l.*,
	isnull(t.CurrentQuota, 0) as prevquota,
	coalesce(t.CurrentQuota, 0) as prevquota
FROM lagt as l
left join lagt as t
	on l.BusinessEntityID = t.BusinessEntityID
		and l.SalesYear - 1 = t.SalesYear

select
	*,
	isnull((
		select CurrentQuota
		from lagt as l2
		where l1.BusinessEntityID = l2.BusinessEntityID
		and l1.SalesYear - 1 = l2.SalesYear
	), 0)
from lagt as l1







