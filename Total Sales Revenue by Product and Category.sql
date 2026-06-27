-- Total Sales Revenue by Product and Category:
SELECT 
    c.category_name,
    p.product_name,
    SUM(od.unit_price * od.quantity * (1 - od.discount)) AS total_sales
FROM 
    products p
    JOIN categories c ON p.category_id = c.category_id
    JOIN order_details od ON p.product_id = od.product_id
GROUP BY 
    c.category_name, p.product_name
ORDER BY 
    total_sales DESC;
