-- После приема пищи продукты заносятся в бд одной транзакцией
-- Это сделано для того, чтобы у них был одинаковый timestamp для дальнейших группировок

-- Вывести количество калорий в каждый прием пищи за текущий день 


SELECT f.recording_timestamp, SUM(0.01 * f.amount * p.kcal)
FROM food_diary as f
JOIN products as p ON f.product_id = p.id
WHERE f.recording_timestamp BETWEEN 'today':: DATE and 'tomorrow':: DATE
GROUP BY 1 
ORDER BY 1;