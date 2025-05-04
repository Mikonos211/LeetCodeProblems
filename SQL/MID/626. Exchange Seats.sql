/* Write your T-SQL query statement below */
SELECT s.id,
       CASE 
           WHEN s.id % 2 != 0 AND s.id != (SELECT MAX(id) FROM seat)
               THEN (SELECT student FROM seat WHERE id = s.id + 1)
           WHEN s.id % 2 = 0 
               THEN (SELECT student FROM seat WHERE id = s.id - 1)
           WHEN s.id = (SELECT MAX(id) FROM seat) AND s.id % 2 != 0 
               THEN s.student
       END AS student
FROM seat s
ORDER BY s.id;

