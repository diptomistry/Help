-- Create Airport Table
CREATE TABLE Airport (
    AirportID INT PRIMARY KEY,
    AirportName VARCHAR(255),
    Location VARCHAR(255),
    IATACode VARCHAR(3),
    ICAOCode VARCHAR(4),
    RunwayCount INT,
    TerminalCount INT,
    GateCount INT
);

-- Create Runway Table
CREATE TABLE Runway (
    RunwayID INT PRIMARY KEY,
    AirportID INT,
    RunwayNumber VARCHAR(10),
    Length DECIMAL(10, 2),
    SurfaceType VARCHAR(50),
    Status VARCHAR(20),
    FOREIGN KEY (AirportID) REFERENCES Airport (AirportID)
);

-- Create Terminal Table
CREATE TABLE Terminal (
    TerminalID INT PRIMARY KEY,
    AirportID INT,
    TerminalName VARCHAR(255),
    BoardingBridgeCount INT,
    FOREIGN KEY (AirportID) REFERENCES Airport (AirportID)
);

-- Create Gate Table
CREATE TABLE Gate (
    GateID INT PRIMARY KEY,
    TerminalID INT,
    GateNumber VARCHAR(10),
    Status VARCHAR(20),
    FOREIGN KEY (TerminalID) REFERENCES Terminal (TerminalID)
);

-- Create Airline Table
CREATE TABLE Airline (
    AirlineID INT PRIMARY KEY,
    AirlineName VARCHAR(255),
    IATACode VARCHAR(3)
);

-- Create Flight Table
CREATE TABLE Flight (
    FlightID INT PRIMARY KEY,
    AirlineID INT,
    FlightNumber VARCHAR(10),
    DepartureAirport VARCHAR(3),
    DestinationAirport VARCHAR(3),
    DepartureTime DATETIME,
    ArrivalTime DATETIME,
    FOREIGN KEY (AirlineID) REFERENCES Airline (AirlineID)
);

-- Create Passenger Table
CREATE TABLE Passenger (
    PassengerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    PassportNumber VARCHAR(20),
    Nationality VARCHAR(50),
    ContactInfo VARCHAR(255)
);

-- Create Ticket Table
CREATE TABLE Ticket (
    TicketID INT PRIMARY KEY,
    PassengerID INT,
    FlightID INT,
    SeatNumber VARCHAR(10),
    TicketStatus VARCHAR(20),
    FOREIGN KEY (PassengerID) REFERENCES Passenger (PassengerID),
    FOREIGN KEY (FlightID) REFERENCES Flight (FlightID)
);

-- Create BoardingPass Table
CREATE TABLE BoardingPass (
    BoardingPassID INT PRIMARY KEY,
    TicketID INT,
    GateID INT,
    BoardingTime DATETIME,
    SeatNumber VARCHAR(10),
    FOREIGN KEY (TicketID) REFERENCES Ticket (TicketID),
    FOREIGN KEY (GateID) REFERENCES Gate (GateID)
);

-- Create Baggage Table
CREATE TABLE Baggage (
    BaggageID INT PRIMARY KEY,
    PassengerID INT,
    FlightID INT,
    BaggageTagNumber VARCHAR(20),
    Weight DECIMAL(10, 2),
    Status VARCHAR(20),
    FOREIGN KEY (PassengerID) REFERENCES Passenger (PassengerID),
    FOREIGN KEY (FlightID) REFERENCES Flight (FlightID)
);

---insert
Insert data into the Airport table
INSERT INTO Airport (AirportID, AirportName, Location, IATACode, ICAOCode, RunwayCount, TerminalCount, GateCount)
VALUES
    (1, 'John F. Kennedy International Airport', 'New York, USA', 'JFK', 'KJFK', 4, 6, 20),
    (2, 'Los Angeles International Airport', 'Los Angeles, USA', 'LAX', 'KLAX', 6, 7, 25),
    (3, 'Heathrow Airport', 'London, UK', 'LHR', 'EGLL', 5, 4, 15);

-- Insert data into the Runway table
INSERT INTO Runway (RunwayID, AirportID, RunwayNumber, Length, SurfaceType, Status)
VALUES
    (1, 1, '08L/26R', 12000.00, 'Asphalt', 'Active'),
    (2, 1, '04L/22R', 11000.00, 'Concrete', 'Active'),
    (3, 2, '25L/07R', 13000.00, 'Asphalt', 'Active');

-- Insert data into the Terminal table
INSERT INTO Terminal (TerminalID, AirportID, TerminalName, BoardingBridgeCount)
VALUES
    (1, 1, 'Terminal 1', 8),
    (2, 1, 'Terminal 2', 10),
    (3, 2, 'Terminal A', 12);

-- Insert data into the Gate table
INSERT INTO Gate (GateID, TerminalID, GateNumber, Status)
VALUES
    (1, 1, 'A1', 'Open'),
    (2, 1, 'A2', 'Closed'),
    (3, 2, 'B3', 'Open');

-- Insert data into the Airline table
INSERT INTO Airline (AirlineID, AirlineName, IATACode)
VALUES
    (1, 'American Airlines', 'AA'),
    (2, 'Delta Air Lines', 'DL'),
    (3, 'British Airways', 'BA');

-- Insert data into the Flight table
INSERT INTO Flight (FlightID, AirlineID, FlightNumber, DepartureAirport, DestinationAirport, DepartureTime, ArrivalTime)
VALUES
    (1, 1, 'AA123', 'JFK', 'LAX', '2023-10-08 08:00:00', '2023-10-08 11:00:00'),
    (2, 2, 'DL456', 'JFK', 'LAX', '2023-10-08 09:30:00', '2023-10-08 12:30:00'),
    (3, 3, 'BA789', 'LHR', 'JFK', '2023-10-08 14:00:00', '2023-10-08 18:00:00');

-- Insert data into the Passenger table
INSERT INTO Passenger (PassengerID, FirstName, LastName, PassportNumber, Nationality, ContactInfo)
VALUES
    (1, 'John', 'Doe', 'ABC12345', 'USA', 'john.doe@example.com'),
    (2, 'Jane', 'Smith', 'XYZ98765', 'USA', 'jane.smith@example.com'),
    (3, 'David', 'Johnson', 'PQR54321', 'UK', 'david.johnson@example.com');

-- Insert data into the Ticket table
INSERT INTO Ticket (TicketID, PassengerID, FlightID, SeatNumber, TicketStatus)
VALUES
    (1, 1, 1, '1A', 'Confirmed'),
    (2, 2, 1, '1B', 'Confirmed'),
    (3, 3, 2, '2A', 'Confirmed');

-- Insert data into the BoardingPass table
INSERT INTO BoardingPass (BoardingPassID, TicketID, GateID, BoardingTime, SeatNumber)
VALUES
    (1, 1, 1, '2023-10-08 07:30:00', '1A'),
    (2, 2, 1, '2023-10-08 07:45:00', '1B'),
    (3, 3, 3, '2023-10-08 09:00:00', '2A');

-- Insert data into the Baggage table
INSERT INTO Baggage (BaggageID, PassengerID, FlightID, BaggageTagNumber, Weight, Status)
VALUES
    (1, 1, 1, 'BAG123', 15.5, 'Checked'),
    (2, 2, 1, 'BAG456', 18.0, 'Checked'),
    (3, 3, 2, 'BAG789', 12.5, 'Checked');

                            --queries:
--Retrieve the details of all flights, including their airline and origin/destination airports.
--using join:
SELECT Flight.FlightID, Airline.AirlineName, Flight.FlightNumber, DepartureAirport, DestinationAirport, DepartureTime, ArrivalTime
FROM Flight
JOIN Airline ON Flight.AirlineID = Airline.AirlineID;
-- using nested:
SELECT
    Flight.FlightID,
    (SELECT AirlineName FROM Airline WHERE AirlineID = Flight.AirlineID) AS Airline,
    Flight.FlightNumber,
    Flight.DepartureAirport AS OriginAirport,
    Flight.DestinationAirport AS DestinationAirport,
    Flight.DepartureTime,
    Flight.ArrivalTime
FROM Flight;
--Retrieve the details of passengers and their associated flights.
SELECT Passenger.PassengerID, FirstName, LastName, Flight.FlightNumber, DepartureAirport, DestinationAirport
FROM Passenger
JOIN Ticket ON Passenger.PassengerID = Ticket.PassengerID
JOIN Flight ON Ticket.FlightID = Flight.FlightID;




