--Select all columns from table
SELECT * FROM accounts;
SELECT * FROM roles;

--Select usernames from table
SELECT username FROM accounts;

--Select usernames and emails from table
SELECT username, email FROM accounts;

--Select fullnames and email from table
SELECT first_name||' '||last_name as fullname, email FROM accounts;

