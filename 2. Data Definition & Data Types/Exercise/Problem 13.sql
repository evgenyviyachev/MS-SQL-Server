CREATE DATABASE Movies

USE Movies
GO

CREATE TABLE Directors
(
Id INT PRIMARY KEY IDENTITY NOT NULL,
DirectorName VARCHAR(50) NOT NULL,
Notes TEXT
)

CREATE TABLE Genres
(
Id INT PRIMARY KEY IDENTITY NOT NULL,
GenreName VARCHAR(50) NOT NULL,
Notes TEXT
)

CREATE TABLE Categories
(
Id INT PRIMARY KEY IDENTITY NOT NULL,
CategoryName VARCHAR(50) NOT NULL,
Notes TEXT
)

CREATE TABLE Movies
(
Id INT PRIMARY KEY IDENTITY NOT NULL,
Title VARCHAR(50) NOT NULL,
DirectorId INT NOT NULL,
CopyrightYear INT NOT NULL,
[Length] FLOAT NOT NULL,
GenreId INT NOT NULL,
CategoryId INT NOT NULL,
Rating FLOAT NOT NULL,
Notes TEXT
)

INSERT INTO Directors(DirectorName)
VALUES ('Spielberg')

INSERT INTO Directors(DirectorName)
VALUES ('Shalamayan')

INSERT INTO Directors(DirectorName)
VALUES ('Alfonso')

INSERT INTO Directors(DirectorName)
VALUES ('Hitchcock')

INSERT INTO Directors(DirectorName)
VALUES ('Kurosawa')

INSERT INTO Genres(GenreName)
VALUES ('Sci-fi')

INSERT INTO Genres(GenreName)
VALUES ('Comedy')

INSERT INTO Genres(GenreName)
VALUES ('Thriller')

INSERT INTO Genres(GenreName)
VALUES ('Adventure')

INSERT INTO Genres(GenreName)
VALUES ('Action')

INSERT INTO Categories(CategoryName)
VALUES ('A')

INSERT INTO Categories(CategoryName)
VALUES ('B')

INSERT INTO Categories(CategoryName)
VALUES ('C')

INSERT INTO Categories(CategoryName)
VALUES ('D')

INSERT INTO Categories(CategoryName)
VALUES ('R')

INSERT INTO Movies(Title,DirectorId,CopyrightYear,[Length],GenreId,CategoryId,Rating)
VALUES ('Jurasic Park', 1, 1995, 78.55, 4, 2, 4.5)

INSERT INTO Movies(Title,DirectorId,CopyrightYear,[Length],GenreId,CategoryId,Rating)
VALUES ('Rambo', 3, 1990, 91.21, 5, 5, 2.8)

INSERT INTO Movies(Title,DirectorId,CopyrightYear,[Length],GenreId,CategoryId,Rating)
VALUES ('Terminator', 1, 1988, 108.11, 5, 3, 5.0)

INSERT INTO Movies(Title,DirectorId,CopyrightYear,[Length],GenreId,CategoryId,Rating)
VALUES ('Inception', 4, 2015, 136.44, 1, 5, 5.0)

INSERT INTO Movies(Title,DirectorId,CopyrightYear,[Length],GenreId,CategoryId,Rating)
VALUES ('Wolf of Wallstreet', 4, 2015, 118.39, 5, 4, 5.0)