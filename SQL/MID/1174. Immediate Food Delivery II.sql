/* Write your T-SQL query statement below */
with cte as (
    select customer_id,min(order_date) order_date
    ,min(customer_pref_delivery_date) customer_pref_delivery_date
     from Delivery
     group by 
     customer_id
)
select round((sum(case when order_date=customer_pref_delivery_date then 100.00 end) / count(customer_id)),2) as immediate_percentage from cte
