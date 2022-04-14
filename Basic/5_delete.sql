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

