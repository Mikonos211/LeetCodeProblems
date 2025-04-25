select Product.product_id , product_name   
from Product 
join Sales on Sales.product_id = Product.product_id 
group by Product.product_id, product_name
having min(sale_date) >= '2019-01-01' and max(sale_date) <= '2019-03-31';
