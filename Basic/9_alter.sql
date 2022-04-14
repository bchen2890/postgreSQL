\i 1_create.sql

ALTER TABLE accounts 
--Add a new column
ADD COLUMN phone VARCHAR,
--Change column type
ALTER COLUMN first_name TYPE VARCHAR(40),
ALTER COLUMN birth_date SET NOT NULL,
ALTER COLUMN created_on DROP NOT NULL, 
ALTER COLUMN created_on SET DEFAULT NOW(),
--Drop a column
DROP COLUMN last_name,
--Add a check for password, include at least eight characters, at least one letter and one number
ADD CHECK (password ~* '^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$'),

--Add constraint for validate the email
ADD CONSTRAINT email_format CHECK (email ~* '^[A-Za-z0-9._+%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$');

--Rename a column
ALTER TABLE accounts 
RENAME COLUMN birth_date TO birth;

--Rename the table
ALTER TABLE accounts
RENAME TO users;


\d users;