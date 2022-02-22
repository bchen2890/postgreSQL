DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS orders2;
DROP TABLE IF EXISTS orders3;

DROP TABLE IF EXISTS products;

CREATE TABLE products (
    prod_id INT PRIMARY KEY,
    name VARCHAR (100) NOT NULL
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    prod_id INT,
	FOREIGN KEY (prod_id)
		REFERENCES products (prod_id)
);

INSERT INTO products (prod_id, name)
VALUES
    (1, 'Apple'),
    (2, 'Cake'),
    (3, 'Shampoo'),
    (4, 'Pants'),
	(5, 'Shirt');

INSERT INTO orders (order_id, prod_id)
VALUES
    (11,1),
    (12,2),
    (13,3),
    (14,4);
	
INSERT INTO orders (order_id)
VALUES
    (15),
    (16);
	
--INNER JOIN combines rows that have matching values in two or more tables
SELECT order_id, orders.prod_id, name FROM orders INNER JOIN products ON products.prod_id = orders.prod_id;

--LEFT or RIGHT JOIN select rows from one table that may or may not have the corresponding rows in other tables
SELECT order_id, orders.prod_id, name FROM orders LEFT JOIN products ON products.prod_id = orders.prod_id;
SELECT order_id, orders.prod_id, name FROM orders LEFT JOIN products ON products.prod_id = orders.prod_id WHERE orders.prod_id IS NULL;
SELECT order_id, orders.prod_id, name FROM orders RIGHT JOIN products ON products.prod_id = orders.prod_id;
SELECT order_id, orders.prod_id, name FROM orders RIGHT JOIN products ON products.prod_id = orders.prod_id WHERE orders.prod_id IS NULL;
--FULL JOIN returns all rows from both tables
SELECT order_id, orders.prod_id, name FROM orders FULL JOIN products ON products.prod_id = orders.prod_id;
SELECT order_id, orders.prod_id, name FROM orders FULL JOIN products ON products.prod_id = orders.prod_id WHERE orders.prod_id IS NULL;

--AS for table aliases
SELECT order_id, o.prod_id, name FROM orders AS o INNER JOIN products ON products.prod_id = o.prod_id;

--
INSERT INTO orders (order_id, prod_id)
VALUES
    (17,2),
    (18,3);

--Joining a table to itself to compare rows within the same table
SELECT DISTINCT ON(o1.prod_id) o1.prod_id, o1.order_id, o2.order_id 
	FROM orders o1 
	INNER JOIN orders o2 ON o1.prod_id = o2.prod_id 
	WHERE o1.order_id <> o2.order_id;

--CROSS JOIN allows you to produce a Cartesian Product of rows in two or more tables.
SELECT * FROM orders CROSS JOIN products;

--NATURAL JOIN is based on the same column names in the joined tables
SELECT order_id, orders.prod_id, name FROM orders NATURAL JOIN products; --Equivalent to INNER JOIN


CREATE TABLE orders2 (
    order_id INT PRIMARY KEY,
    prod INT,
	FOREIGN KEY (prod)
		REFERENCES products (prod_id)
);

INSERT INTO orders2 (order_id, prod)
VALUES
    (11,1),
    (12,2),
    (13,3),
    (14,4);

SELECT * FROM orders2 NATURAL JOIN products; --Equivalent to CROSS JOIN

CREATE TABLE orders3 (
    order_id INT PRIMARY KEY,
    prod_id INT
);

INSERT INTO orders3 (order_id, prod_id)
VALUES
    (11,11),
    (12,22),
    (13,33),
    (14,44);
SELECT * FROM orders3 NATURAL JOIN products; --It returns empty set because all values in both prod_id are different

INSERT INTO orders3 (order_id, prod_id)
VALUES
    (15,1);
	
SELECT * FROM orders3 NATURAL JOIN products; --Values in both prod_id are matching 

