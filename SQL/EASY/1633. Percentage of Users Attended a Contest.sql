/* Write your T-SQL query statement below */
declare @ilosc int;
set @ilosc = (select count(*) from Users) ;

select contest_id, round((COUNT(Register.user_id) * 100.0) / @ilosc, 2)  as percentage 
from Users 
join Register on Register.user_id = Users.user_id
group by contest_id  
order by percentage desc,   contest_id asc
