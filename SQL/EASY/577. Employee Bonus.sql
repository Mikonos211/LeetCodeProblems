select name, bonus
from Employee
left JOIN Bonus on Bonus.empID = Employee.empId
where bonus < 1000 or bonus is null
