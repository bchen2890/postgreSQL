
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
