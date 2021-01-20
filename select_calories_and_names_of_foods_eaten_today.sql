-- Вывести калорий и названия съеденных продуктов сегодня 

--SELECT f.recording_timestamp, p.name, p.kcal, f.amount
--FROM food_diary AS f, products AS p
--WHERE f.product_id = p.id;

--SELECT f.id, f.recording_timestamp, p.name, f.amount, (0.01 * f.amount * p.kcal) as kcal 
--FROM food_diary AS f
--JOIN products AS p ON p.id = f.product_id
--WHERE f.recording_timestamp BETWEEN '2021-01-19' and '2021-01-21'
--ORDER BY f.recording_timestamp;   

SELECT f.id, f.recording_timestamp, p.name, f.amount, (0.01 * f.amount * p.kcal) as kcal 
FROM food_diary AS f
JOIN products AS p ON p.id = f.product_id
WHERE f.recording_timestamp BETWEEN 'today':: DATE and 'tomorrow':: DATE
ORDER BY f.recording_timestamp;   