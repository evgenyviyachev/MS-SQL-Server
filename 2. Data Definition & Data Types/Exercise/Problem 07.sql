CREATE TABLE People
(
Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
[Name] VARCHAR(200) NOT NULL,
Picture IMAGE,
Height FLOAT(2),
[Weight] FLOAT(2),
Gender CHAR(1) NOT NULL CHECK (Gender IN ('m', 'f')),
Birthdate DATE NOT NULL,
Biography VARBINARY(MAX)
);

INSERT INTO People
VALUES ('Evgeni',NULL,1.86,88,'m','1989-03-26',NULL);

INSERT INTO People
VALUES ('Nikoleta',NULL,1.76,72,'f','1990-05-02',NULL);

INSERT INTO People
VALUES ('Pesho',NULL,2.16,188,'m','1968-11-12',NULL);

INSERT INTO People
VALUES ('Gosho',NULL,1.56,60,'m','1999-07-21',NULL);

INSERT INTO People
VALUES ('Ginka',NULL,1.63,61,'m','1977-01-01',NULL);