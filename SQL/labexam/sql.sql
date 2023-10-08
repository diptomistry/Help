-- Create Passenger Information table
CREATE TABLE Passengers (
    PassengerID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    PassportNumber VARCHAR(20),
    ContactInformation VARCHAR(255)
);

-- Create Airlines table
CREATE TABLE Airlines (
    AirlineID INT PRIMARY KEY,
    AirlineName VARCHAR(255),
    IATACode VARCHAR(2),
    ICAOCode VARCHAR(3),
    -- Add other airline-specific fields here
);

-- Create Flights table
CREATE TABLE Flights (
    FlightID INT PRIMARY KEY,
    AirlineID INT,
    FlightNumber VARCHAR(10),
    OriginAirportCode VARCHAR(3),
    DestinationAirportCode VARCHAR(3),
    DepartureDateTime DATETIME,
    ArrivalDateTime DATETIME,
    FOREIGN KEY (AirlineID) REFERENCES Airlines(AirlineID)
);

-- Create Boarding Passes table
CREATE TABLE BoardingPasses (
    BoardingPassID INT PRIMARY KEY,
    PassengerID INT,
    FlightID INT,
    GateNumber VARCHAR(10),
    SeatNumber VARCHAR(10),
    BoardingDateTime DATETIME,
    FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID),
    FOREIGN KEY (FlightID) REFERENCES Flights(FlightID)
);

-- Create Baggage Tags table
CREATE TABLE BaggageTags (
    BaggageTagID INT PRIMARY KEY,
    BoardingPassID INT,
    TagNumber VARCHAR(20),
    Weight DECIMAL(5, 2),
    DestinationAirportCode VARCHAR(3),
    FOREIGN KEY (BoardingPassID) REFERENCES BoardingPasses(BoardingPassID)
);

-- Create Airport Facilities table
CREATE TABLE AirportFacilities (
    FacilityID INT PRIMARY KEY,
    FacilityName VARCHAR(255),
    Description TEXT
);

-- Create Gates table
CREATE TABLE Gates (
    GateID INT PRIMARY KEY,
    FacilityID INT,
    GateNumber VARCHAR(10),
    -- Add other gate-specific fields here
    FOREIGN KEY (FacilityID) REFERENCES AirportFacilities(FacilityID)
);

-- Create Runways table
CREATE TABLE Runways (
    RunwayID INT PRIMARY KEY,
    FacilityID INT,
    RunwayNumber VARCHAR(10),
    -- Add other runway-specific fields here
    FOREIGN KEY (FacilityID) REFERENCES AirportFacilities(FacilityID)
);

