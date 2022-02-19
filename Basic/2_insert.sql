--RETURNING returns information of the inserted row
INSERT INTO accounts (username, password, created_on)
VALUES ('bchen', 'pass', '2022-2-13') RETURNING *;

INSERT INTO accounts (username, password, created_on)
VALUES ('user1', 'u123', '2022-2-13 12:24:02') RETURNING created_on;


INSERT INTO accounts (username, password, created_on, email)
VALUES ('user2', 'u123', '2022-2-13 12:24:02', 'user2@gmail.com') RETURNING *;

INSERT INTO accounts (username, password, created_on, birth_date)
VALUES ('user3', 'u123', '2022-2-14 12:24:02', '2000-01-01') RETURNING *;

INSERT INTO accounts (username, password, created_on, email, first_name, last_name)
VALUES ('user4', 'u123', '2022-2-14 12:24:02', 'user5@gmail.com', 'Aurora', 'Ruiz') RETURNING *;

INSERT INTO roles (role_name, manager)
VALUES ('sales manager', 1) RETURNING *;

--Insert multiple rows
INSERT INTO accounts (username, password, created_on, email, first_name, last_name)
VALUES 
	('user5', 'u123', '2022-2-14 12:24:02', 'user5@gmail.com', 'John', 'Smith'),
	('user6', 'u123', '2022-2-14 12:24:02', 'user6@gmail.com', 'Olivia', 'Smith')
 RETURNING *;
 
/*
--ERROR: username not UNIQUE 
INSERT INTO accounts (username, password, created_on)
VALUES ('user1', 'u123', '2022-2-13 12:24:02') RETURNING *;
--ERROR: username NULL
INSERT INTO accounts (password, created_on)
VALUES ( 'u123', '2022-2-13 12:24:02') RETURNING *;
--ERROR: password NULL
INSERT INTO accounts (username, created_on)
VALUES ('user4', '2022-2-13 12:24:02') RETURNING *;
--ERROR: created_on NULL
INSERT INTO accounts (username, password)
VALUES ('user5', 'u123') RETURNING *;
--ERROR: created_on not TIMESTAMP syntax
INSERT INTO accounts (username, password, created_on)
VALUES ('user6', 'u123', 'user123') RETURNING *;
--ERROR: email length is exceeded
INSERT INTO accounts (username, password, created_on, email)
VALUES ('user7', 'u123', '2022-2-13 12:24:02', 'user000000000000000000000000000000000000000000000000000@gmail.com') RETURNING *;
--ERROR: it violates CHECK restriction of birth_date
INSERT INTO accounts (username, password, created_on, birth_date)
VALUES ('user8', 'u123', '2022-2-14 12:24:02', '1000-01-01') RETURNING *;
*/


