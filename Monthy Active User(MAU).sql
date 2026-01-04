SELECT 
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    COUNT(DISTINCT o.customer_id) AS active_users
FROM orders o
GROUP BY month
ORDER BY month;
