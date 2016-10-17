CREATE TABLE DepositTypes
(
DepositTypeID INT PRIMARY KEY,
[Name] VARCHAR(20) NOT NULL
)

CREATE TABLE Deposits
(
DepositID INT PRIMARY KEY IDENTITY(1,1),
Amount DECIMAL(10,2) NOT NULL,
StartDate DATE,
EndDate DATE,
DepositTypeID INT,
CustomerID INT NOT NULL,
CONSTRAINT FK_Deposits_Customers FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID),
CONSTRAINT FK_Deposits_DepositTypes FOREIGN KEY (DepositTypeID)
REFERENCES DepositTypes(DepositTypeID)
)

CREATE TABLE EmployeesDeposits
(
EmployeeID INT NOT NULL,
DepositID INT NOT NULL,
CONSTRAINT PK_EmployeesDeposits PRIMARY KEY (EmployeeID, DepositID),
CONSTRAINT FK_EmployeesDeposits_Employees FOREIGN KEY (EmployeeID)
REFERENCES Employees(EmployeeID),
CONSTRAINT FK_EmployeesDeposits_Deposits FOREIGN KEY (DepositID)
REFERENCES Deposits(DepositID)
)

CREATE TABLE CreditHistory
(
CreditHistoryID INT PRIMARY KEY,
Mark CHAR(1),
StartDate DATE,
EndDate DATE,
CustomerID INT NOT NULL,
CONSTRAINT FK_CreditHistory_Customers FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID)
)

CREATE TABLE Payments
(
PaymentID INT PRIMARY KEY,
[Date] DATE,
Amount DECIMAL(10,2) NOT NULL,
LoanID INT NOT NULL,
CONSTRAINT FK_Payments_Loans FOREIGN KEY (LoanID)
REFERENCES Loans(LoanID)
)

CREATE TABLE Users
(
UserID INT PRIMARY KEY,
UserName VARCHAR(20) NOT NULL,
[Password] VARCHAR(20) NOT NULL,
CustomerID INT NOT NULL UNIQUE,
CONSTRAINT FK_Users_Customers FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID)
)

ALTER TABLE Employees
ADD ManagerID INT

ALTER TABLE Employees
ADD CONSTRAINT FK_Employees_Employees FOREIGN KEY (ManagerID)
REFERENCES Employees(EmployeeID)