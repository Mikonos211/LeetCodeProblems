SELECT Email
FROM Person
GROUP BY email
having COUNT(*) > 1
