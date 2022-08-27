@echo off
TITLE Setup SQL

SET PGBIN="C:\Program Files\PostgreSQL\9.5\bin\psql.exe"
SET PGDATABASE=postgres
SET PGHOST=localhost
SET PGPORT=5432
SET PGUSER=postgres
SET PGPASSWORD=123456

%PGBIN% -f public.sql

pause