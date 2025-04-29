/* Write your T-SQL query statement below */
select max(salary) as SecondHighestSalary 
from Employee
where salary != (select top 1 salary 
from Employee 
order by salary desc)

