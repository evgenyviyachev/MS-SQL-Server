CREATE TABLE Manufacturers
(
ManufacturerID INT NOT NULL,
[Name] VARCHAR(50) NOT NULL,
EstablishedOn DATE NOT NULL
)

CREATE TABLE Models
(
ModelID INT NOT NULL,
[Name] VARCHAR(50) NOT NULL,
ManufacturerID INT NOT NULL
)

ALTER TABLE Manufacturers
ADD CONSTRAINT PK_Manufacturers PRIMARY KEY (ManufacturerID)

ALTER TABLE Models
ADD CONSTRAINT PK_Models PRIMARY KEY (ModelID)

ALTER TABLE Models
ADD CONSTRAINT FK_Models_Manufacturers FOREIGN KEY (ManufacturerID)
REFERENCES Manufacturers(ManufacturerID)