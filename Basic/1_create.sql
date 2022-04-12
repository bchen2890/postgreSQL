--IF EXISTS avoid the error when you want to delete a non-exist table 
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS accounts;
DROP TABLE IF EXISTS type_examples;

CREATE TABLE accounts (
--SERIAL allows you to automatically generate unique integer numbers 
--PRIMARY KEY uniquely identifies each row in a table. A table can have one and only one primary key.
	user_id SERIAL PRIMARY KEY, 
--UNIQUE ensures that all values in a column are different
--NOT NULL enforces a column to NOT accept NULL values
	username VARCHAR ( 50 ) UNIQUE NOT NULL,
	password VARCHAR ( 50 ) NOT NULL,
	created_on TIMESTAMP NOT NULL,
	email VARCHAR ( 50 ),
--CHECK allows you to specify if values in a column must satisfy a specific requirement
	birth_date DATE CHECK (birth_date > '1900-01-01'),
	first_name VARCHAR ( 50 ),
	last_name VARCHAR ( 50 )
);

CREATE TABLE roles(
   role_id SERIAL PRIMARY KEY,
   role_name VARCHAR (255) UNIQUE NOT NULL,
   manager INT NOT NULL,
   FOREIGN KEY (manager)
		REFERENCES accounts(user_id)
);

CREATE TABLE type_examples(
-- Boolean Type
	is_employee BOOLEAN,
	
-- Array Type
	team_members TEXT[],

-- JSON Type
	info JSON,

-- UUID Type
	id UUID,
	
----- Character Types -----
--fixed-length character with space padded
	mother_tongue CHAR(2),
--variable-length character without space padded
	name VARCHAR(50),
--variable-length character with unlimited length
	description TEXT,
	
----- Integer Types -----
--integer numbers in the range of (-32767, 32767). 2B storage size.
	numpage SMALLINT,
--integer numbers in the range of (-2147483648, +2147483647). 4B storage size.
	population INT,
--integer numbers in the range of (-9223372036854775808,+9223372036854775807). 8B storage size.
	capital BIGINT,
--autoincrementing smallint
	numPage_id SERIAL,
--autoincrementing int
	order_id SMALLSERIAL,
--autoincrementing bigint,
	product_id BIGSERIAL,
	
----- Floating-point numbers Types -----
--floating-point number with precision n
	prob float(4),
--real 4-byte floating-point number
	price real,
--real number with p digits with s number after the decimal point. 
	calc numeric (4,4),

----- Temporal data Types -----
--date only
	publication_date DATE,
--the time of day values
	start_time TIME,
--date and time values
	created_on TIMESTAMP,
--timestamp with a timezone
	local_time TIMESTAMPTZ,

----- Geometric Types -----
--a geometric pair of numbers (x,y)
	piece_x POINT,
--infinite line represented by linear equation { A, B, C } or two points ( x1 , y1 ) , ( x2 , y2 )
	equation LINE,
--a line segment represented by pairs of points ( x1 , y1 ) , ( x2 , y2 )
	line_drawn LSEG,
--a rectangular box represented by pairs of points that are opposite corners
	rectangle BOX,
-- a polygon represented by lists of points (the vertexes of the polygon) ( x1 , y1 ) , ... , ( xn , yn )
	figure POLYGON,
-- a circle represented by a center point (x,y) and radius r
	bubble CIRCLE
);