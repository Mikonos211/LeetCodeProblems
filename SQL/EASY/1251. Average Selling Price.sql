/* Write your T-SQL query statement below */
SELECT
    p.product_id,
    case when
    SUM(u.units) > 0 THEN ROUND(SUM(p.price * u.units) * 1.0 / SUM(u.units), 2)
    else 
    0
    end
    AS average_price
FROM
    Prices p
LEFT  JOIN
    UnitsSold u ON u.product_id = p.product_id
    AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY
    p.product_id;
