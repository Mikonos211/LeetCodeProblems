/* Write your T-SQL query statement below */
with help as(
SELECT 
    managerId, 
    COUNT(*) AS employee_count
FROM Employee
where managerId is not null
GROUP BY managerId
having COUNT(*) >= 5
)

select name
from Employee 
join help on help.managerId = Employee.id  
