/* Write your T-SQL query statement below */
with helptable as(
select  customer_id, count( distinct product_key) as totalbuy from Customer group by customer_id
)
select customer_id
from helptable 
WHERE totalbuy = (SELECT COUNT(*) FROM Product);

