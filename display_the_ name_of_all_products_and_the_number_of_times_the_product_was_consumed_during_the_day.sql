-- Вывести имя всех продуктов и количество раз, когда продукт был употреблен в течении дня

WITH today_food_diary AS (
	SELECT * 
	FROM food_diary 
	WHERE recording_timestamp BETWEEN 'today':: DATE AND 'tomorrow':: DATE
)
SELECT p.name, COUNT(f.product_id) 
FROM products p 
LEFT OUTER JOIN today_food_diary AS f ON f.product_id = p.id 
GROUP BY 1 
ORDER BY 2;