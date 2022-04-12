\i 2_insert.sql
--Select all columns from table
SELECT * FROM accounts;
SELECT * FROM roles;

--Select usernames from table
SELECT username FROM accounts;

--Select usernames and emails from table
SELECT username, email FROM accounts;

--Select fullnames and email from table. AS allows you to assign a temporary name to a column or an expression.
SELECT first_name||' '||last_name AS fullname, email FROM accounts;


--DISTINCT is used to remove duplicate rows from a result set
SELECT last_name FROM accounts;
SELECT DISTINCT last_name FROM accounts;


--DISTINCT can be applied to multiple columns, it keeps one row for each group of duplicates
SELECT DISTINCT last_name, first_name FROM accounts;
--DISTINCT ON keeps the first row  for each group of duplicates in the returned result set
SELECT DISTINCT ON (last_name) last_name, first_name FROM accounts;

--Use NULLS FIRST or NULLS LAST to specify the order of NULL with other non-null values
SELECT last_name, LENGTH(last_name) len FROM accounts ORDER BY last_name NULLS LAST;
SELECT last_name, LENGTH(last_name) len FROM accounts ORDER BY last_name NULLS FIRST;

--WHERE filters rows of the returned result set
SELECT * FROM accounts WHERE username = 'bchen';
SELECT * FROM accounts WHERE NOT username = 'bchen';

SELECT * FROM accounts WHERE first_name = 'Aurora' OR first_name = 'John';
SELECT * FROM accounts WHERE first_name IN ('Aurora','John');

SELECT * FROM accounts WHERE username != 'bchen';
SELECT * FROM accounts WHERE username <> 'bchen';
SELECT * FROM accounts WHERE username NOT IN ('bchen');

SELECT * FROM accounts WHERE created_on >= '2022-2-14';
SELECT * FROM accounts WHERE birth_date <= '2002-01-01';

SELECT * FROM accounts WHERE created_on BETWEEN '2022-2-13' AND '2022-2-14';
SELECT * FROM accounts WHERE created_on > '2022-2-13' AND created_on < '2022-2-14';
SELECT * FROM accounts WHERE LENGTH(first_name) BETWEEN 1 AND 4;

	

--LIKE return true if a value matches a pattern. NOT LIKE returns true when the value does not match the pattern.
-- Percent sign (%) matches any sequence of zero or more characters.
-- Underscore sign (_)  matches any single character.

SELECT * FROM accounts WHERE username LIKE 'b%';
SELECT * FROM accounts WHERE username LIKE '_chen';
SELECT * FROM accounts WHERE username LIKE '%s%';
SELECT * FROM accounts WHERE username LIKE 'u%1';
SELECT * FROM accounts WHERE username NOT LIKE '_ser_';	

--IS NULL returns true if the value is NULL. IS NOT NULL returns true if the value is not NULL.
SELECT * FROM accounts WHERE email IS NULL;
SELECT * FROM accounts WHERE birth_date IS NOT NULL;


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

--LIMIT constrains the number of rows returned by the query
SELECT username FROM accounts ORDER BY username LIMIT 3;
--OFFSET skips a number of rows before LIMIT is applied
SELECT username FROM accounts ORDER BY username LIMIT 3 OFFSET 2;

--FETCH is functionally equivalent to LIMIT
SELECT username FROM accounts ORDER BY username FETCH FIRST 2 ROWS ONLY;
SELECT username FROM accounts ORDER BY username OFFSET 2 FETCH FIRST 2 ROWS ONLY;
SELECT username FROM accounts ORDER BY username OFFSET 2 FETCH NEXT 2 ROWS ONLY;

--GROUP BY divides the returned rows into groups
SELECT password, COUNT(password) FROM accounts GROUP BY password;
SELECT password, COUNT(password) numPass FROM accounts GROUP BY password ORDER BY numPass;
SELECT DATE(created_on), COUNT(created_on) FROM accounts GROUP BY DATE(created_on);

--GROUPING SETS allows you to define multiple grouping sets in the same query.
SELECT username, password, COUNT(created_on) FROM accounts GROUP BY GROUPING SETS ((username,password),(username),(password),());
--CUBE allows you to generates all possible grouping sets based on the dimension columns (2^n combinations)
SELECT username, password, COUNT(created_on) FROM accounts GROUP BY CUBE (username,password);--Equivalent to above query
--ROLLUP hierarchically applies the aggregate function
--	Equivalent to GROUPING SETS ((username,password),(username),())
SELECT username, password, COUNT(created_on) FROM accounts GROUP BY ROLLUP (username,password);

--HAVING clause specifies a condition to filter groups
SELECT password, COUNT(password) FROM accounts GROUP BY password HAVING COUNT(password) > 2;










