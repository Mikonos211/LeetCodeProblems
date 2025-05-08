/* Write your T-SQL query statement below */
with topeczka as (select 
    turn, 
    person_id as ID, 
    person_name as Name, 
    weight,
    sum(weight) over (order by turn) as running_weight 
from Queue)

select top 1 Name as person_name
from topeczka
where running_weight <= 1000
order by running_weight desc
