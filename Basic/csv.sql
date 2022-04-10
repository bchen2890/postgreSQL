\i 1_create.sql

COPY accounts (username,password,created_on,email,birth_date,first_name,last_name)
FROM 'E:/postgresql/postgreSQL/Basic/account.csv'
DELIMITER ','
CSV HEADER;

\i 2_insert.sql
COPY accounts 
TO 'E:/postgresql/postgreSQL/Basic/exportaccount.csv' 
DELIMITER ',' 
CSV HEADER;

