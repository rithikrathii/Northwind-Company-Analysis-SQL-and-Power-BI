 
 -- sales by product category
SELECT c.category_name, SUM(od.quantity * od.unit_price) AS total_sales
FROM order_details od
JOIN products p ON od.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY total_sales DESC;