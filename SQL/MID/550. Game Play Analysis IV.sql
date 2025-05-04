/* Write your T-SQL query statement below */
with helptable as (
select player_id, min(event_date) as firstlogin
from Activity
group by player_id
)

select 
    round(cast( count(*) as float) / (select count(distinct player_id) from Activity) , 2) as fraction  
from Activity 
join helptable on helptable.player_id = Activity.player_id 
    AND Activity.event_date = DATEADD(DAY, 1, helptable.firstlogin);

