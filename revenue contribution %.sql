SELECT p.category,
       ROUND(
           SUM(oi.quantity * p.price) /
           (SELECT SUM(quantity * price) FROM order_items oi2 JOIN products p2 ON oi2.product_id=p2.product_id) * 100,
           2
       ) AS revenue_pct
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category;
