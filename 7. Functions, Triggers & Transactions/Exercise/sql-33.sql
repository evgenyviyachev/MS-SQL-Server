CREATE TABLE Monasteries
(
Id INT PRIMARY KEY IDENTITY(1,1),
[Name] NVARCHAR(50) NOT NULL,
CountryCode CHAR(2) NOT NULL,
CONSTRAINT FK_Monasteries_Countries FOREIGN KEY (CountryCode)
REFERENCES Countries(CountryCode)
)

INSERT INTO Monasteries(Name, CountryCode) VALUES
('Rila Monastery “St. Ivan of Rila”', 'BG'), 
('Bachkovo Monastery “Virgin Mary”', 'BG'),
('Troyan Monastery “Holy Mother''s Assumption”', 'BG'),
('Kopan Monastery', 'NP'),
('Thrangu Tashi Yangtse Monastery', 'NP'),
('Shechen Tennyi Dargyeling Monastery', 'NP'),
('Benchen Monastery', 'NP'),
('Southern Shaolin Monastery', 'CN'),
('Dabei Monastery', 'CN'),
('Wa Sau Toi', 'CN'),
('Lhunshigyia Monastery', 'CN'),
('Rakya Monastery', 'CN'),
('Monasteries of Meteora', 'GR'),
('The Holy Monastery of Stavronikita', 'GR'),
('Taung Kalat Monastery', 'MM'),
('Pa-Auk Forest Monastery', 'MM'),
('Taktsang Palphug Monastery', 'BT'),
('Sümela Monastery', 'TR')

--ALTER TABLE Countries
--ADD IsDeleted BIT

--ALTER TABLE Countries
--ADD CONSTRAINT DF_False DEFAULT 0 FOR IsDeleted

UPDATE Countries
   SET IsDeleted = 1
 WHERE CountryCode = ANY(SELECT c.CountryCode FROM Countries AS c
		 INNER JOIN CountriesRivers AS cr
		    ON cr.CountryCode = c.CountryCode
		 INNER JOIN Rivers AS r
		    ON cr.RiverId = r.Id
		 GROUP BY c.CountryCode
		HAVING COUNT(r.Id) > 3)

SELECT mon.[Name] AS Monastery, c.CountryName AS Country FROM Monasteries AS mon
 INNER JOIN Countries AS c
    ON mon.CountryCode = c.CountryCode
 WHERE c.IsDeleted IS NULL
 ORDER BY Monastery