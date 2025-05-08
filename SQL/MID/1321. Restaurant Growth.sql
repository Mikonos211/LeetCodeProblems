/* Write your T-SQL query statement below */
with daty as (
    select 
        visited_on as visited_on_first, 
        dateadd(day, 6, visited_on) as visited_onlast
    from customer
    group by visited_on
    having dateadd(day, 6, visited_on) in (select visited_on from customer)
)

select 
    d.visited_onlast as visited_on,
    sum(c.amount) as amount,
    round((sum(c.amount) / 7.0), 2) as average_amount
from daty d
join customer c 
    on c.visited_on between d.visited_on_first and d.visited_onlast
group by d.visited_on_first, d.visited_onlast
