use class14;
go

declare @inputdate date = getdate()

;with cte as (
	select DATEFROMPARTS(year(@inputdate), month(@inputdate), 1) as datevalues
	union all
	select dateadd(day, 1, datevalues)
	from cte
	where datevalues < eomonth(@inputdate)
), calendar as (
	select 
		datevalues,
		datepart(weekday, datevalues) as weekdays,
		DATEPART(week, datevalues) - datepart(week, DATEFROMPARTS(year(@inputdate), month(@inputdate), 1)) + 1 as weeknum
	from cte
) 
select 
	 weeknum,
     MAX(CASE WHEN weekdays = 1 THEN DAY(datevalues) END) AS Sunday,
     MAX(CASE WHEN weekdays = 2 THEN DAY(datevalues) END) AS Monday,
     MAX(CASE WHEN weekdays = 3 THEN DAY(datevalues) END) AS Tuesday,
     MAX(CASE WHEN weekdays = 4 THEN DAY(datevalues) END) AS Wednesday,
     MAX(CASE WHEN weekdays = 5 THEN DAY(datevalues) END) AS Thursday,
     MAX(CASE WHEN weekdays = 6 THEN DAY(datevalues) END) AS Friday,
     MAX(CASE WHEN weekdays = 7 THEN DAY(datevalues) END) AS Saturday
	from calendar
group by weeknum


SELECT DATENAME(WEEKDAY, GETDATE())
SELECT 1502 / 1 --DATEDIFF(MONTH, 0, GETDATE())


--*******************************************************************
--     PIVOT


--	weeknum     Sunday      Monday      Tuesday     Wednesday   Thursday    Friday      Saturday
--	----------- ----------- ----------- ----------- ----------- ----------- ----------- -----------
--	1           NULL        NULL        NULL        NULL        NULL        NULL        1
--	2           2           3           4           5           6           7           8
--	3           9           10          11          12          13          14          15
--	4           16          17          18          19          20          21          22
--	5           23          24          25          26          27          28          29
--	6           30          31          NULL        NULL        NULL        NULL        NULL


-- ***********************************************************************
-- **    ********************************************************************
-- **  ** ******************************************************************
-- **  ** ******************************************************************
-- **   *******************************************************************
-- **     ********************************************************************
-- ** ********************************************************************
-- ***********************************************************************


-- PIVOT




--	SELECT DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()), 0)
--	SELECT DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), 1)



