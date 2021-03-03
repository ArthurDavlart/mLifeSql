-- Скрипт создает последнее состояние бд, после создания не нужно применять миграции

CREATE TABLE db_info(
	id SERIAL PRIMARY KEY,
	major INTEGER NOT NULL,
	minor INTEGER NOT NULL,
	patch INTEGER NOT NULL,
	UNIQUE (major, minor, patch)
);

INSERT INTO db_info(major, minor, patch) VALUES(0, 1, 0);

CREATE TABLE products (
	id SMALLSERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	kcal SMALLINT NOT NULL CHECK(kcal > 0)
);

CREATE TABLE food_diary(
	id SMALLSERIAL PRIMARY KEY,
	recording_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
	product_id SMALLINT REFERENCES products (id) NOT NULL,
	amount SMALLINT NOT NULL CHECK(amount > 0)
);

CREATE TABLE cases(
	id SMALLSERIAL PRIMARY KEY,
	name TEXT NOT NULL
);

CREATE TABLE case_diary(
	id SMALLSERIAL PRIMARY KEY,
	recording_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
	elapsed_time_in_hours SMALLINT NOT NULL CONSTRAINT positive_number_check (elapsed_time_in_hours > 0),
	case_id SMALLINT REFERENCES cases(id) NOT NULL
);