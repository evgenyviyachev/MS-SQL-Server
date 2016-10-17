CREATE TABLE AccountHolders
(
Id INT PRIMARY KEY,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
SSN VARCHAR(50) NOT NULL
)

CREATE TABLE Accounts
(
Id INT PRIMARY KEY,
AccountHolderId INT NOT NULL,
Balance FLOAT NOT NULL,
CONSTRAINT FK_Accounts_AccountHolders FOREIGN KEY(AccountHolderId)
REFERENCES AccountHolders(Id)
)

ALTER TABLE Accounts
ADD CONSTRAINT UN_Accounts_AccountHolderId UNIQUE(AccountHolderId)

CREATE PROC usp_GetHoldersFullName
    AS
 BEGIN
SELECT FirstName + ' ' + LastName AS FullName FROM AccountHolders
   END