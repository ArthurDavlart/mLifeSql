SET PGUSER=postgres
SET PGPASSWORD=12345qwe 

pg_dump -d mDB > "D:\backups\dump"_%date%.txt