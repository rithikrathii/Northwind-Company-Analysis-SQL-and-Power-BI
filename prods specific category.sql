-- products in specific categories

SELECT p.product_name 
FROM products p 
JOIN categories c ON p.category_id = c.category_id 
WHERE c.category_name = 'Beverages';