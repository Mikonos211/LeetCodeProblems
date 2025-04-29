/* Write your T-SQL query statement below */
select score, 
DENSE_RANK() over (order by score desc) as rank
from Scores
