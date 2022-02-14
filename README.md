# postgreSQL
Learning SQL with PostgreSQL

## Windows 11 Set Up

### Install Postgresql version 14.2 with pgAdmin
https://www.enterprisedb.com/downloads/postgres-postgresql-downloads 
### Manual
https://www.postgresql.org/docs/ 

#### Add `C:\yourpath\PostgreSQL\14\bin` and `C:\yourpath\PostgreSQL\14\lib` to the PATH system variable.

## psql
### Access to database
#### Open Command Prompt
#### Connect to database "postgres" as user "postgres"
```
$ psql -U postgres -d postgres
```
#### Insert your password and now you can enter any SQL command


### Run a SQL file
```
$ \i /pathto/file.sql
```

### List all tables
```
$ \dt
```
