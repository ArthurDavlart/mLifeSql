-- Перед запуском миграции создайте бекап бд, что бы в случаи ошибки или 
-- не корректной работы миграции можно было откатиться до стабильной версии

BEGIN;

CREATE TABLE specific_cases(
	id SMALLSERIAL PRIMARY KEY,
	case_id SMALLINT REFERENCES cases(id) NOT NULL,
	concretization JSONB NOT NULL DEFAULT '{}'
);

INSERT INTO specific_cases(case_id, concretization) SELECT id, '{}' FROM cases ORDER BY 1;

ALTER TABLE case_diary
	ADD COLUMN description JSONB NOT NULL DEFAULT '{}',
	ADD COLUMN specific_case_id INTEGER;

UPDATE case_diary SET specific_case_id = case_id;

ALTER TABLE case_diary
	DROP COLUMN case_id,
	ALTER COLUMN specific_case_id SET NOT NULL,
	ADD CONSTRAINT fk_specific_cases FOREIGN KEY (specific_case_id) REFERENCES specific_cases(id); 

INSERT INTO db_info(major, minor, patch) values(1, 0, 0);

END;