/* Write your T-SQL query statement below */
select product_name , sum(unit) as unit
from Products 
join Orders on Orders.product_id = Products.product_id 
where YEAR(order_date) = 2020
  AND MONTH(order_date) = 2
group by product_name 
HAVING SUM(unit) >= 100;
