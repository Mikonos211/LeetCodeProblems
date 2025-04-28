select sell_date, count(product) as num_sold  ,string_agg(product, ',') within group (order by product asc)  as products
from (
select DISTINCT sell_date , product
from Activities 
) as unice
group by sell_date
