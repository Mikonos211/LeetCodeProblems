/* Write your T-SQL query statement below */
select name , coalesce(sum(distance), 0) as travelled_distance
from Users 
left join  Rides on Rides.user_id  = Users.id
group by name, user_id
order by travelled_distance  desc, name asc;
