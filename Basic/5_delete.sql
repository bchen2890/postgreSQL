\i 2_insert.sql

SELECT * FROM accounts;

--Delete one row
DELETE FROM accounts WHERE user_id=9 RETURNING *;
SELECT * FROM accounts;

--Delete multiple rows
DELETE FROM accounts WHERE user_id IN (5,3) RETURNING *;
SELECT * FROM accounts;

--Delete all rows
SELECT * FROM roles;
DELETE FROM roles;
SELECT * FROM roles;


--TRUNCATE TABLE remove all data in a more efficient way
\i 2_insert.sql
TRUNCATE TABLE roles;

--Remove from multiple tables
\i 2_insert.sql
TRUNCATE TABLE roles, accounts;

--Reset the value in the identity column
\i 2_insert.sql
TRUNCATE TABLE roles
RESTART IDENTITY;

--Remove from a table that has foreign key references
\i 2_insert.sql
TRUNCATE TABLE accounts CASCADE;

