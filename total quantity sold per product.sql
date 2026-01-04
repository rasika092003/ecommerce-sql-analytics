SELECT 
    product_id,
    SUM(quantity) AS total_quantity_sold
FROM order_items
GROUP BY product_id;
