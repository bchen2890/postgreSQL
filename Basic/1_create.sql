--IF EXISTS avoid the error when you want to delete a non-exist table 
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS accounts;

CREATE TABLE accounts (
--SERIAL allows you to automatically generate unique integer numbers 
--PRIMARY KEY uniquely identifies each row in a table. A table can have one and only one primary key.
	user_id SERIAL PRIMARY KEY, 
--UNIQUE ensures that all values in a column are different
--NOT NULL enforces a column to NOT accept NULL values
	username VARCHAR ( 50 ) UNIQUE NOT NULL,
	password VARCHAR ( 50 ) NOT NULL,
	created_on TIMESTAMP NOT NULL,
	email VARCHAR ( 50 ),
--CHECK allows you to specify if values in a column must satisfy a specific requirement
	birth_date DATE CHECK (birth_date > '1900-01-01'),
	first_name VARCHAR ( 50 ),
	last_name VARCHAR ( 50 )
);

CREATE TABLE roles(
   role_id SERIAL PRIMARY KEY,
   role_name VARCHAR (255) UNIQUE NOT NULL,
   manager INT NOT NULL,
   FOREIGN KEY (manager)
		REFERENCES accounts(user_id)
);
