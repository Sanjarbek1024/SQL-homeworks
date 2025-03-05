use class7;
go

SELECT 
	[id]
    ,[name]
    ,[salary]
    ,[department]
    ,[mgr_id]
FROM [class7].[dbo].[employee]


-- empname, empdept, mgrname, mgrdept

select 
	emp.name,
	dp.name,
	mgr.name as mgrname,
	mgdp.name as mgrdep
from employee as emp
join employee as mgr
	on emp.mgr_id = mgr.id
join department as dp
	on emp.department = dp.id
join department as mgdp
	on mgr.department = mgdp.id


--****************************************************************&&&&&&&&&&&&&&&&
-- COMMON TABLE EXPRESSION

--	;WITH <cte name>[column names]
--	AS
--	(
--		<inner query>
--	)
--	<outer query>

;WITH emp
AS
(
	select e.id, e.name, d.name as dept_name, e.mgr_id
	from employee e
	join department d
		on e.department = d.id
)
select 
	*
from emp e
join emp m
	on e.mgr_id = m.id

-- 1	1	Mardon	IT	NULL
-- 1	1	Mardon	IT	NULL
















