--Select all columns from table
SELECT * FROM accounts;
SELECT * FROM roles;

--Select usernames from table
SELECT username FROM accounts;

--Select usernames and email from table
SELECT username,email FROM accounts;

--Select username and password in one row from table
SELECT username||' '||password FROM accounts;

--Select username and password in a userInfo row  from table
SELECT username||' '||password as userInfo FROM accounts;