SELECT 
    product_name,
    revenue,
    cumulative_revenue,
    ROUND(cumulative_revenue / total_revenue * 100, 2) AS cumulative_pct
FROM (
    SELECT 
        p.product_name,
        SUM(oi.quantity * p.price) AS revenue,
        SUM(SUM(oi.quantity * p.price)) OVER (ORDER BY SUM(oi.quantity * p.price) DESC) AS cumulative_revenue,
        SUM(SUM(oi.quantity * p.price)) OVER () AS total_revenue
    FROM order_items oi
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY p.product_name
) t;
