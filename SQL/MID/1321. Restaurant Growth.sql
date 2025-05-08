/* Write your T-SQL query statement below */
WITH daty AS (
    SELECT 
        visited_on AS visited_on_first, 
        DATEADD(day, 6, visited_on) AS visited_onlast
    FROM Customer
    GROUP BY visited_on
    HAVING DATEADD(day, 6, visited_on) IN (SELECT visited_on FROM Customer)
)

SELECT 
    d.visited_onlast as visited_on,
    sum(c.amount) as amount,
    round((sum( c.amount)/7.0) , 2) as average_amount
FROM daty d
JOIN Customer c 
    ON c.visited_on BETWEEN d.visited_on_first AND d.visited_onlast
group by d.visited_on_first, d.visited_onlast
