-- Employee performance by order count and revenue
SELECT 
    e.employee_id,
    COUNT(o.order_id) AS total_orders,
    SUM(od.unit_price * od.quantity * (1 - od.discount)) AS total_revenue
FROM 
    employees e
    JOIN orders o ON e.employee_id = o.employee_id
    JOIN order_details od ON o.order_id = od.order_id
GROUP BY 
    e.employee_id
ORDER BY 
    total_revenue DESC;

