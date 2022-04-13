--CREATE SEQUENCE for a ordered list of integers
--a ascending sequence
DROP SEQUENCE IF EXISTS ascending;
CREATE SEQUENCE ascending
INCREMENT 2
START 10;
SELECT nextval('ascending');
SELECT nextval('ascending');

--a descending sequence from 3 to 1
DROP SEQUENCE IF EXISTS descending;
CREATE SEQUENCE descending
INCREMENT -1
MINVALUE 1 
MAXVALUE 3
START 3
CYCLE;
SELECT nextval('descending');
SELECT nextval('descending');
SELECT nextval('descending');
SELECT nextval('descending');

--a sequence associated with a table column
DROP TABLE IF EXISTS order_item;
CREATE TABLE order_item(
    order_id SERIAL,
    item_id INT NOT NULL);

CREATE SEQUENCE order_item_id
START 10
INCREMENT 10
OWNED BY order_item.item_id;

INSERT INTO 
    order_item(order_id, item_id)
VALUES
    (100, nextval('order_item_id')),
    (100, nextval('order_item_id')),
    (100, nextval('order_item_id'));
	
SELECT * FROM order_item;

--List all sequences in the current database
SELECT
    relname sequence_name
FROM 
    pg_class 
WHERE 
    relkind = 'S';
	
--When dropped a table,the associated sequence also dropped
DROP TABLE order_item;
SELECT
    relname sequence_name
FROM 
    pg_class 
WHERE 
    relkind = 'S';



