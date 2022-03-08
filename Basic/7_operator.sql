
DROP TABLE IF EXISTS popular_products;
DROP TABLE IF EXISTS top_products;

CREATE TABLE popular_products (
    prod_id INT PRIMARY KEY,
    name VARCHAR (100) NOT NULL
);

INSERT INTO popular_products (prod_id, name)
VALUES
    (1, 'Apple'),
    (2, 'Cake'),
    (3, 'Shampoo'),
    (4, 'Pants'),
	(5, 'Shirt');
	
CREATE TABLE top_products (
    prod_id INT PRIMARY KEY,
    name VARCHAR (100) NOT NULL
);

INSERT INTO top_products (prod_id, name)
VALUES
    (1, 'Apple'),
	(2, 'Cake'),
    (6, 'Skirt'),
    (7, 'Cacao'),
    (8, 'Pullover'),
    (9, 'Brush'),
	(10, 'Avocado');

--UNION ALL combines results sets from the tables
SELECT * FROM popular_products UNION ALL SELECT * FROM top_products;

--UNION combines results sets and remove duplicate rows
SELECT * FROM popular_products UNION SELECT * FROM top_products;

--INTERSECT returns the rows that appear in both result sets
SELECT * FROM popular_products INTERSECT SELECT * FROM top_products;

--EXCEPT return the rows in the first query that does not appear in the output of the second query.
SELECT * FROM popular_products EXCEPT SELECT * FROM top_products;
SELECT * FROM top_products EXCEPT SELECT * FROM popular_products;

--A subquery is a query nested inside another query
SELECT * FROM popular_products WHERE prod_id IN (SELECT prod_id FROM top_products);
--EXISTS tests for existence of rows in a subquery
SELECT * FROM popular_products p WHERE EXISTS (SELECT prod_id FROM top_products WHERE prod_id=p.prod_id);
SELECT * FROM popular_products p WHERE NOT EXISTS (SELECT prod_id FROM top_products WHERE prod_id=p.prod_id);
--ANY compares a value to a set of values returned by a subquery
SELECT * FROM top_products WHERE LENGTH(name) > ANY (SELECT MAX(LENGTH(name)) FROM popular_products);
--= ANY is equivalent to IN
SELECT * FROM popular_products WHERE prod_id = ANY (SELECT prod_id FROM top_products);
--ALL query data by comparing a value with a list of values returned by a subquery
SELECT * FROM top_products WHERE LENGTH(name) > ALL (SELECT LENGTH(name) FROM popular_products);







