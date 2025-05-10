/* Write your T-SQL query statement below */
select  
    Signups.user_id,  
    round(avg(case when Confirmations.action = 'confirmed' then 1.00 else 0 end), 2) confirmation_rate
from Signups
left join Confirmations on Confirmations.user_id = Signups.user_id
group by Signups.user_id
