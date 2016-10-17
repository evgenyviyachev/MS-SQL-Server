CREATE TABLE Users
(
Id BIGINT IDENTITY(1,1) PRIMARY KEY,
Username VARCHAR(30) NOT NULL,
[Password] VARCHAR(26) NOT NULL,
ProfilePicture IMAGE,
LastLoginTime TIME,
IsDeleted VARCHAR(5) NOT NULL CHECK (IsDeleted IN ('true', 'false'))
);

INSERT INTO Users
VALUES ('Evgeni','abv',NULL,NULL,'true');

INSERT INTO Users
VALUES ('Nikoleta','bbb',NULL,NULL,'false');

INSERT INTO Users
VALUES ('Pesho','ddd',NULL,NULL,'false');

INSERT INTO Users
VALUES ('Gosho','ggg',NULL,NULL,'true');

INSERT INTO Users
VALUES ('Ginka','dsgsg',NULL,NULL,'true');