-- Вывести дневное количество калорий за все время 

SELECT f.recording_timestamp:: DATE, SUM(0.01 * p.kcal * f.amount) 
FROM products p 
JOIN food_diary f ON f.product_id = p.id 
GROUP BY f.recording_timestamp::DATE
ORDER BY 1;