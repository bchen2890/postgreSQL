--RETURNING returns information of the inserted row
INSERT INTO accounts (username, password, created_on)
VALUES ('bchen', 'pass', '2022-2-13') RETURNING *;


INSERT INTO accounts (username, password, created_on)
VALUES ('user1', 'u123', '2022-2-13 12:24:02') RETURNING created_on;


INSERT INTO accounts (username, password, created_on, email)
VALUES ('user2', 'u123', '2022-2-13 12:24:02', 'user2@gmail.com') RETURNING *;