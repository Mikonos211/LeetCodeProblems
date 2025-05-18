/* Write your T-SQL query statement below */
select *
from products 
where description like '% SN[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9] %'
or description like 'SN[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9] %'
or description like '% SN[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'
order by product_id
