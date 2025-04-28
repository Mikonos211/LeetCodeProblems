/* Write your T-SQL query statement below */
select user_id , Upper(left(name,1)) + LOWER(SUBSTRING(name, 2, LEN(name) - 1)) AS name
from Users 
order by user_id
