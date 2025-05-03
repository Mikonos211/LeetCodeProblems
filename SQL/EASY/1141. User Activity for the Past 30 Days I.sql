-- /* Write your T-SQL query statement below */
-- select activity_date as day , count(user_id)  as active_users 
-- from Activity
-- where activity_type = 'open_session'
-- group by activity_date 
-- having min(activity_date ) >= '2019-06-27' and max(activity_date ) <= '2019-07-27';
select activity_date as day, count(distinct user_id) as active_users
from Activity  
group by activity_date 
having (min(activity_date ) >= '2019-06-28' and max(activity_date ) <= '2019-07-27')  ;
