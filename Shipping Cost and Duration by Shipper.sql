-- Shipping Cost and Duration by Shipper:
SELECT 
    s.company_name AS shipper, 
    COUNT(o.order_id) AS total_orders, 
    AVG(o.freight) AS avg_shipping_cost, 
    AVG(DATEDIFF(o.shipped_date, o.order_date)) AS avg_shipping_duration 
FROM 
    shippers s 
    JOIN orders o ON s.shipper_id = o.ship_via 
GROUP BY 
    s.company_name 
ORDER BY 
    avg_shipping_cost DESC 
LIMIT 1000;
