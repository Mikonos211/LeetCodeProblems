/* Write your T-SQL query statement below */
select emp.employee_id , emp.name, count(mgr.employee_id) as reports_count , round(avg(mgr.age*1.00),0) as average_age 
from Employees emp
join Employees mgr on emp.employee_id = mgr.reports_to  
group by emp.employee_id, emp.name
order by emp.employee_id
