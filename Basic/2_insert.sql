--RETURNING returns information of the inserted row
INSERT INTO accounts (username, password, created_on)
VALUES ('bchen', 'pass', '2022-2-13') RETURNING *;

INSERT INTO accounts (username, password, created_on)
VALUES ('user1', 'u123', '2022-2-13 12:24:02') RETURNING created_on;


INSERT INTO accounts (username, password, created_on, email)
VALUES ('user2', 'u123', '2022-2-13 12:24:02', 'user2@gmail.com') RETURNING *;

INSERT INTO accounts (username, password, created_on, birth_date)
VALUES ('user3', 'u123', '2022-2-14 12:24:02', '2000-01-01') RETURNING *;

--ERROR: it violates CHECK restriction of birth_date
INSERT INTO accounts (username, password, created_on, birth_date)
VALUES ('user3', 'u123', '2022-2-14 12:24:02', '1000-01-01') RETURNING *;

INSERT INTO roles (role_name, manager)
VALUES ('sales manager', 1) RETURNING *;

