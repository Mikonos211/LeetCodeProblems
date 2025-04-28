/* Write your T-SQL query statement below */
select name, sum(amount) as balance
from users
join Transactions on Transactions.account = Users.account
group by name
having sum(amount) > 10000
