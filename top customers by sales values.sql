-- top customers by sales values
SELECT 
    cu.customer_id,
    cu.company_name,
    SUM(od.unit_price * od.quantity * (1 - od.discount)) AS customer_sales
FROM 
    customers cu
    JOIN orders o ON cu.customer_id = o.customer_id
    JOIN order_details od ON o.order_id = od.order_id
GROUP BY 
    cu.customer_id, cu.company_name
ORDER BY 
    customer_sales DESC
LIMIT 10;
