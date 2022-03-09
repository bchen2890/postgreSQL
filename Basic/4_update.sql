--Replace existing password
UPDATE accounts SET password = 'password' WHERE username = 'bchen' RETURNING *;
UPDATE accounts SET email = 'user22@gmail.com' WHERE username = 'user22' RETURNING *;

--Add value to null column
UPDATE accounts SET email = 'user1@gmail.com' WHERE username = 'user1' RETURNING *;
UPDATE accounts SET email = 'bchen@gmail.com' WHERE username = 'bchen' RETURNING *;

--Replace multiple columns
UPDATE accounts SET password = 'pass2', email = 'bchen2@gmail.com' WHERE username = 'bchen' RETURNING *;

--Update data in a table based on values in another table
UPDATE roles SET role_name = 'agile coach' FROM accounts WHERE accounts.user_id = roles.role_id; 


--Insert a new row if it does not exists, otherwise, do nothing or update the row.
INSERT INTO accounts (username, password, created_on, email)
VALUES ('user2', 'u123', '2022-2-13 12:24:02', 'user22@gmail.com') 
ON CONFLICT (username)
DO NOTHING;

SELECT * FROM accounts;

INSERT INTO accounts (username, password, created_on)
VALUES ('user2', 'u222', '2022-3-09 12:24:02') 
ON CONFLICT (username)
DO 
   UPDATE SET password = EXCLUDED.password, created_on=EXCLUDED.created_on;

SELECT * FROM accounts;

INSERT INTO accounts (username, password, created_on, email)
VALUES ('user2', 'u123', '2022-2-13 12:24:02', 'user22@gmail.com') 
ON CONFLICT ON CONSTRAINT accounts_username_key
DO NOTHING;

SELECT * FROM accounts;
