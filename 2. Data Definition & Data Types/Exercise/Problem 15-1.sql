CREATE TABLE Employees
(
Id INT IDENTITY(1,1) PRIMARY KEY,
FirstName NVARCHAR(50) NOT NULL,
LastName NVARCHAR(50) NOT NULL,
Title NVARCHAR(50),
Notes TEXT
)

CREATE TABLE Customers
(
AccountNumber INT IDENTITY(1,1) PRIMARY KEY,
FirstName NVARCHAR(50) NOT NULL,
LastName NVARCHAR(50) NOT NULL,
PhoneNumber NVARCHAR(50) NOT NULL,
EmergencyName NVARCHAR(50) NOT NULL,
EmergencyNumber NVARCHAR(50) NOT NULL,
Notes TEXT
)

CREATE TABLE RoomStatus
(
RoomStatus NVARCHAR(50) PRIMARY KEY NOT NULL,
Notes TEXT
)

CREATE TABLE RoomTypes
(
RoomType NVARCHAR(50) PRIMARY KEY NOT NULL,
Notes TEXT
)

CREATE TABLE BedTypes
(
BedType NVARCHAR(50) PRIMARY KEY NOT NULL,
Notes TEXT
)

CREATE TABLE Rooms
(
RoomNumber INT IDENTITY(1,1) PRIMARY KEY,
RoomType NVARCHAR(50) NOT NULL,
BedType NVARCHAR(50) NOT NULL,
Rate FLOAT NOT NULL,
RoomStatus NVARCHAR(50) NOT NULL,
Notes TEXT
)

CREATE TABLE Payments
(
Id INT IDENTITY(1,1) PRIMARY KEY,
EmployeeId INT NOT NULL,
PaymentDate DATE NOT NULL,
AccountNumber INT NOT NULL,
FirstDateOccupied DATE NOT NULL,
LastDateOccupied DATE NOT NULL,
TotalDays INT NOT NULL,
AmountCharged FLOAT NOT NULL,
TaxRate INT NOT NULL,
TaxAmount FLOAT NOT NULL,
PaymentTotal FLOAT NOT NULL,
Notes TEXT
)

CREATE TABLE Occupancies
(
Id INT IDENTITY(1,1) PRIMARY KEY,
EmployeeId INT NOT NULL,
DateOccupied DATE NOT NULL,
AccountNumber INT NOT NULL,
RoomNumber INT NOT NULL,
RateApplied FLOAT NOT NULL,
PhoneCharge FLOAT NOT NULL,
Notes TEXT
)