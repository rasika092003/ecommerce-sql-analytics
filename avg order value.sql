SELECT AVG(order_total) AS avg_order_value
FROM (
    SELECT o.order_id,
           SUM(oi.quantity * p.price) AS order_total
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY o.order_id
) x;
