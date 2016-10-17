CREATE TABLE Flights
(
FlightID INT PRIMARY KEY,
DepartureTime DATETIME NOT NULL,
ArrivalTime DATETIME NOT NULL,
[Status] VARCHAR(9) NOT NULL,
OriginAirportID INT NOT NULL,
DestinationAirportID INT NOT NULL,
AirlineID INT NOT NULL,
CONSTRAINT CHK_Flights CHECK ([Status] IN ('Departing', 'Delayed', 'Arrived', 'Cancelled')),
CONSTRAINT FK_Flights_Airports_Origin FOREIGN KEY (OriginAirportID)
REFERENCES Airports(AirportID),
CONSTRAINT FK_Flights_Airports_Destination FOREIGN KEY (DestinationAirportID)
REFERENCES Airports(AirportID),
CONSTRAINT FK_Flights_Airlines FOREIGN KEY (AirlineID)
REFERENCES Airlines(AirlineID)
)

CREATE TABLE Tickets
(
TicketID INT PRIMARY KEY,
Price DECIMAL(8,2) NOT NULL,
Class VARCHAR(6) NOT NULL,
Seat VARCHAR(5) NOT NULL,
CustomerID INT NOT NULL,
FlightID INT NOT NULL,
CONSTRAINT CHK_Tickets CHECK (Class IN ('First', 'Second', 'Third')),
CONSTRAINT FK_Tickets_Customers FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID),
CONSTRAINT FK_Tickets_Flights FOREIGN KEY (FlightID)
REFERENCES Flights(FlightID)
)