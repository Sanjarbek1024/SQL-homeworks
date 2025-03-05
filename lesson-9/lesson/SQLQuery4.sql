-- n = 2

select
	*
from employee
order by salary desc;



select
	*
from employee
where salary = (select distinct top 1
		salary
	from (
		select 
			* 
		from employee
		where salary in (
			select distinct top 2
				salary
			from employee
			order by salary desc)
	) as t
	order by salary asc
)



----------------------
select
	dept_id,
	max(salary)
from employee
group by dept_id

select top 1 salary
from (
	select distinct top 2
		salary
	from employee
	where dept_id = 2
	order by salary desc) as t
order by salary asc

select distinct dept_id, (
	select top 1 salary
from (
	select distinct top 2
		salary
	from employee
	where dept_id = f.dept_id
	order by salary desc) as t
order by salary asc
)
from employee as f
order by dept_id

--==================================================

select
	*
from employee







--update employee
--set salary = 9995
--where id = 266


select
	*
from employee as e1
where salary = (
	select top 1 salary
	from (
		select distinct top 2 salary
		from employee as e2
		where e1.dept_id = e2.dept_id
		order by salary desc
	) as t1
);

select *
from (select 
	*,
	dense_rank() over(partition by dept_id order by salary desc) as x
from employee) t
where x = 2




-- find second highest salary in each department

declare @n int = 2

select *
from (select 
	*,
	dense_rank() over(partition by dept_id order by salary desc) as x
from employee) t
where x = 2

