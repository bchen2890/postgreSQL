
CREATE TABLE accounts (
--SERIAL allows you to automatically generate unique integer numbers 
--PRIMARY KEY uniquely identifies each row in a table
	user_id SERIAL PRIMARY KEY, 
--UNIQUE ensures that all values in a column are different
--NOT NULL enforces a column to NOT accept NULL values.
	username VARCHAR ( 50 ) UNIQUE NOT NULL,
	password VARCHAR ( 50 ) NOT NULL,
	created_on TIMESTAMP NOT NULL,
	email VARCHAR ( 50 )
);