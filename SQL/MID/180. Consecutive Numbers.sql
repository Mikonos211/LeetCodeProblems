/* Write your T-SQL query statement below */
select distinct num as ConsecutiveNums 
from (
    select * ,
        lag(num, 1) over (order by id) pre1,
        lag(num, 2) over (order by id) pre2
    from Logs
) x
where num = pre1 and num = pre2
