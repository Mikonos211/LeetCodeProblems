/* Write your T-SQL query statement below */
select 
    Users.user_id as buyer_id, 
    join_date, 
    count(
        case when year(Orders.order_date) = 2019 then 1 end
    ) as orders_in_2019 
from Users
left join Orders on Orders.buyer_id = Users.user_id
group by Users.user_id, join_date
 
