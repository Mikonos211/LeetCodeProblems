/* Write your T-SQL query statement below */
WITH helptable AS (
SELECT  Department.name AS Department, MAX(salary) AS Salary  
FROM Employee
JOIN Department ON Department.id = Employee.departmentId 
GROUP BY Department.name
)

select helptable.Department ,Employee.name as Employee , helptable.Salary
from Employee
join Department on Department.id = Employee.departmentId 
join helptable on helptable.Department = Department.name
where helptable.Salary = Employee.salary


-- helptable.Department , distinct Employee.name as Employee , helptable.Salary
