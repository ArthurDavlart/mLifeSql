SET PGUSER=postgres
SET PGPASSWORD=12345qwe

SET _current_date = %date%_%time%

pg_dump -d mDB > "D:\backups\dump"_%date%.txt