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
