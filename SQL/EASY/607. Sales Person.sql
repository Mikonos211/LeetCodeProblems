select  s.name
from SalesPerson s
where s.name not in (select s.name
                        from SalesPerson s
                        join Orders o on  o.sales_id  = s.sales_id 
                        join Company c on o.com_id  = c.com_id
                        where c.name  = 'RED'
                        ) 
