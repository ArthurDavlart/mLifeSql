-- Вывести для каждого продукта его среднее количество калорий за один прием пищи 

SELECT p.name, ROUND(AVG(0.01 * p.kcal * f.amount), 2) AS avg_kcal 
FROM products p 
LEFT OUTER JOIN food_diary f ON f.product_id = p.id
GROUP BY 1;