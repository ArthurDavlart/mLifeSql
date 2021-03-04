-- Перед запуском миграции создайте бекап бд, что бы в случаи ошибки или 
-- не корректной работы миграции можно было откатиться до стабильной версии

BEGIN;

ALTER TABLE case_diary ALTER COLUMN elapsed_time_in_hours TYPE real;

INSERT INTO db_info(major, minor, patch) values(1, 0, 1);

END;