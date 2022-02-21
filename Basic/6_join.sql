DROP TABLE IF EXISTS orders;
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
	
--JOIN combines rows that have matching values in two or more tables
SELECT order_id, orders.prod_id, name FROM orders INNER JOIN products ON products.prod_id = orders.prod_id;
SELECT order_id, orders.prod_id, name FROM orders LEFT JOIN products ON products.prod_id = orders.prod_id;
SELECT order_id, orders.prod_id, name FROM orders LEFT JOIN products ON products.prod_id = orders.prod_id WHERE orders.prod_id IS NULL;
SELECT order_id, orders.prod_id, name FROM orders RIGHT JOIN products ON products.prod_id = orders.prod_id;
SELECT order_id, orders.prod_id, name FROM orders RIGHT JOIN products ON products.prod_id = orders.prod_id WHERE orders.prod_id IS NULL;
SELECT order_id, orders.prod_id, name FROM orders FULL JOIN products ON products.prod_id = orders.prod_id;
SELECT order_id, orders.prod_id, name FROM orders FULL JOIN products ON products.prod_id = orders.prod_id WHERE orders.prod_id IS NULL;

