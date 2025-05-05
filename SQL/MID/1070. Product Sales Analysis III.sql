/* Write your T-SQL query statement below */
select product_id, year as first_year, quantity, price 
from Sales s1
where year = (select min(year) from Sales s2 where s2.product_id = s1.product_id)
