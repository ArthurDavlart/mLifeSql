-- Вывести дневное количество калорий за все время

SELECT t.recording_timestamp:: DATE, SUM(t.sum) 
FROM (SELECT f.recording_timestamp, SUM(0.01 * f.amount * p.kcal)
	FROM food_diary as f
	JOIN products as p ON f.product_id = p.id
	GROUP BY f.recording_timestamp
	ORDER BY f.recording_timestamp ) as t
GROUP BY t.recording_timestamp :: date
ORDER BY t.recording_timestamp :: date;