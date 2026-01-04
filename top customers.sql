SELECT customer_id, total_spent,
       RANK() OVER (ORDER BY total_spent DESC) AS rank_
FROM (
    SELECT o.customer_id,
           SUM(oi.quantity * p.price) AS total_spent
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY o.customer_id
) t;
