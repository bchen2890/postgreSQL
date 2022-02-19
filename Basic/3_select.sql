--Select all columns from table
SELECT * FROM accounts;
SELECT * FROM roles;

--Select usernames from table
SELECT username FROM accounts;

--Select usernames and emails from table
SELECT username, email FROM accounts;

--Select fullnames and email from table
SELECT first_name||' '||last_name as fullname, email FROM accounts;

--DISTINCT is used to remove duplicate rows from a result set
SELECT last_name FROM accounts;
SELECT DISTINCT last_name FROM accounts;


--DISTINCT can be applied to multiple columns, it keeps one row for each group of duplicates
SELECT DISTINCT last_name, first_name FROM accounts;
--DISTINCT ON keeps the first row  for each group of duplicates in the returned result set
SELECT DISTINCT ON (last_name) last_name, first_name FROM accounts;

--ORDER BY allows you to sort rows in ascending or descending order based on a sort expression
SELECT username FROM accounts ORDER BY username DESC;
--By default, it sorts in ascending order
SELECT username FROM accounts ORDER BY username;

--Order by multiple columns
SELECT last_name, first_name FROM accounts ORDER BY last_name, first_name DESC;
SELECT last_name, first_name FROM accounts ORDER BY last_name, first_name ASC;
SELECT last_name, first_name FROM accounts ORDER BY last_name DESC, first_name ASC;

--Order by expression
SELECT last_name, LENGTH(last_name) len FROM accounts ORDER BY len ASC;

--Use NULLS FIRST or NULLS LAST to specify the order of NULL with other non-null values
SELECT last_name, LENGTH(last_name) len FROM accounts ORDER BY last_name NULLS LAST;
SELECT last_name, LENGTH(last_name) len FROM accounts ORDER BY last_name NULLS FIRST;

