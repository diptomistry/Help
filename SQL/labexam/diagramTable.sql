Table Passengers {
  PassengerID INT [primary key]
  FirstName VARCHAR(255)
  LastName VARCHAR(255)
  PassportNumber VARCHAR(20)
  ContactInformation VARCHAR(255)
}

Table Airlines {
  AirlineID INT [primary key]
  AirlineName VARCHAR(255)
  IATACode VARCHAR(2)
  ICAOCode VARCHAR(3)
  // Add other airline-specific fields here
}

Table Flights {
  FlightID INT [primary key]
  AirlineID INT
  FlightNumber VARCHAR(10)
  OriginAirportCode VARCHAR(3)
  DestinationAirportCode VARCHAR(3)
  DepartureDateTime DATETIME
  ArrivalDateTime DATETIME
}

Table BoardingPasses {
  BoardingPassID INT [primary key]
  PassengerID INT
  FlightID INT
  GateNumber VARCHAR(10)
  SeatNumber VARCHAR(10)
  BoardingDateTime DATETIME
}

Table BaggageTags {
  BaggageTagID INT [primary key]
  BoardingPassID INT
  TagNumber VARCHAR(20)
  Weight DECIMAL(5, 2)
  DestinationAirportCode VARCHAR(3)
}

Table AirportFacilities {
  FacilityID INT [primary key]
  FacilityName VARCHAR(255)
  Description TEXT
}

Table Gates {
  GateID INT [primary key]
  FacilityID INT
  GateNumber VARCHAR(10)
  // Add other gate-specific fields here
}

Table Runways {
  RunwayID INT [primary key]
  FacilityID INT
  RunwayNumber VARCHAR(10)
  // Add other runway-specific fields here
}

Ref: BoardingPasses.PassengerID > Passengers.PassengerID
Ref: Flights.AirlineID > Airlines.AirlineID
Ref: BoardingPasses.FlightID > Flights.FlightID
Ref: BaggageTags.BoardingPassID > BoardingPasses.BoardingPassID
Ref: Gates.FacilityID > AirportFacilities.FacilityID
Ref: Runways.FacilityID > AirportFacilities.FacilityID
