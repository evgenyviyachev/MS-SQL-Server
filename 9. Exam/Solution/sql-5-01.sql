CREATE TABLE ArrivedFlights
(
FlightID INT PRIMARY KEY,
ArrivalTime DATETIME NOT NULL,
Origin VARCHAR(50) NOT NULL,
Destintaion VARCHAR(50) NOT NULL,
Passengers INT NOT NULL
)