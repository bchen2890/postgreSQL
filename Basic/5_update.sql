--Replace existing password
UPDATE accounts SET password = 'password' WHERE username = 'bchen' RETURNING *;
UPDATE accounts SET email = 'user22@gmail.com' WHERE username = 'user22' RETURNING *;

--Add value to null column
UPDATE accounts SET email = 'user1@gmail.com' WHERE username = 'user1' RETURNING *;
UPDATE accounts SET email = 'bchen@gmail.com' WHERE username = 'bchen' RETURNING *;

--Replace multiple columns
UPDATE accounts SET password = 'pass2', email = 'bchen2@gmail.com' WHERE username = 'bchen' RETURNING *;


