-- Перед запуском миграции создайте бекап бд, что бы в случаи ошибки или 
-- не корректной работы миграции можно было откатиться до стабильной версии
 
ALTER TABLE case_diary
	ADD COLUMN elapsed_time_in_hours SMALLINT;
	
UPDATE case_diary SET elapsed_time_in_hours = 2;

ALTER TABLE case_diary 
	ALTER COLUMN elapsed_time_in_hours SET NOT NULL,
	ADD CONSTRAINT positive_number_check CHECK (elapsed_time_in_hours > 0);

UPDATE cases SET name = TRIM(TRAILING '_2_h' FROM name);