CREATE TABLE AccountLogs
(
AccountID INT PRIMARY KEY,
AccountNumber CHAR(12) NOT NULL,
StartDate DATE NOT NULL,
CustomerID INT NOT NULL,
CONSTRAINT FK_AccountLogs_Customers FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID)
)