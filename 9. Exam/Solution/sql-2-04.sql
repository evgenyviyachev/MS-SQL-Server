CREATE TABLE CustomerReviews
(
ReviewID INT PRIMARY KEY,
ReviewContent TEXT NOT NULL,
ReviewGrade INT NOT NULL,
AirlineID INT NOT NULL,
CustomerID INT NOT NULL,
CONSTRAINT CHK_CustomerReviews CHECK (ReviewGrade BETWEEN 0 AND 10),
CONSTRAINT FK_CustomerReviews_Airlines FOREIGN KEY (AirlineID)
REFERENCES Airlines(AirlineID),
CONSTRAINT FK_CustomerReviews_Customers FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID)
)

CREATE TABLE CustomerBankAccounts
(
AccountID INT PRIMARY KEY,
AccountNumber VARCHAR(10) NOT NULL UNIQUE,
Balance DECIMAL(10,2) NOT NULL,
CustomerID INT NOT NULL,
CONSTRAINT FK_CustomerBankAccounts_Customers FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID)
)