COPY accounts (username,password,created_on,email,birth_date,first_name,last_name)
FROM 'E:/postgresql/postgreSQL/Basic/account.csv'
DELIMITER ','
CSV HEADER;