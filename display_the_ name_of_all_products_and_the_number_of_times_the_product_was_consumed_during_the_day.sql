-- Вывести имя всех продуктов и количество раз, когда продукт был употреблен в течении дня

SELECT p.name, COUNT(f.product_id) 
FROM products p 
LEFT OUTER JOIN(SELECT * 
				FROM food_diary 
				WHERE recording_timestamp BETWEEN 'today':: DATE AND 'tomorrow':: DATE) AS f ON f.product_id = p.id 
GROUP BY 1 
ORDER BY 2;