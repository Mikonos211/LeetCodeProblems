delete from Person 
where id not in (SELECT min(id) 
FROM Person
GROUP BY email
) 