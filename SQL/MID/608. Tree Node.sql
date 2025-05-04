/* Write your T-SQL query statement below */
select id,
case 
    when p_id is null then 'Root'
    when id in (select t2.p_id
    from Tree t1
    join Tree t2 on t1.id = t2.p_id) and id != 0 then 'Inner'
        else 
        'Leaf'
    end
    as [type]
from Tree
