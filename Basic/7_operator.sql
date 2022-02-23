DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS orders2;
DROP TABLE IF EXISTS orders3;

DROP TABLE IF EXISTS products;

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
    (1, 'Skirt'),
    (2, 'Cacao'),
    (3, 'Pullover'),
    (4, 'Brush'),
	(5, 'Avocado');
	
SELECT * FROM popular_products UNION SELECT * FROM top_products;
SELECT * FROM popular_products UNION ALL SELECT * FROM top_products;
