
drop table if exists items;
go

create table items
(
	ID						varchar(10),
	CurrentQuantity			int,
	QuantityChange   		int,
	ChangeType				varchar(10),
	Change_datetime			datetime
);
go

insert into items values
('A0013', 278,   99 ,   'out', '2020-05-25 0:25'), 
('A0012', 377,   31 ,   'in',  '2020-05-24 22:00'),
('A0011', 346,   1  ,   'out', '2020-05-24 15:01'),
('A0010', 347,   1  ,   'out', '2020-05-23 5:00'),
('A009',  348,   102,   'in',  '2020-04-25 18:00'),
('A008',  246,   43 ,   'in',  '2020-04-25 2:00'),
('A007',  203,   2  ,   'out', '2020-02-25 9:00'),
('A006',  205,   129,   'out', '2020-02-18 7:00'),
('A005',  334,   1  ,   'out', '2020-02-18 6:00'),
('A004',  335,   27 ,   'out', '2020-01-29 5:00'),
('A003',  362,   120,   'in',  '2019-12-31 2:00'),
('A002',  242,   8  ,   'out', '2019-05-22 0:50'),
('A001',  250,   250,   'in',  '2019-05-20 0:45');


-- *************************************************************

SELECT * FROM items;

-- *************************************************************

WITH cte AS
	(SELECT
		*,
		CASE
			WHEN changetype='out' THEN  DATEDIFF(DAY, '2019-05-20', change_datetime)
			else DATEDIFF(DAY, change_datetime, '2020-05-25') 
			END AS age_day
	FROM items) 
SELECT
    SUM(CASE WHEN age_day between 0 and 90 THEN quantitychange ELSE 0 END) AS [0-90 days old],
	SUM(CASE WHEN age_day between 91 and 180 THEN quantitychange ELSE 0 END) AS [91-180 days old],
	SUM(CASE WHEN age_day between 181 and 270 THEN quantitychange ELSE 0 END) AS [181-270 days old],
	SUM(CASE WHEN age_day between 271 and 365 THEN quantitychange ELSE 0 END) AS [271-365 days old],
	SUM(CASE WHEN age_day between 365 and 450 THEN quantitychange ELSE 0 END) 
	- (SELECT SUM(QuantityChange) FROM cte WHERE ChangeType = 'out') AS [361-450 days old]
FROM cte;

--	-----------------------------------------------------------------------------------------------
--	184		120		27		132		83
--	-----------------------------------------------------------------------------------------------

-- This is not dynamic, but result is true in this case.
