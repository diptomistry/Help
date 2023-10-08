Table Airport {
  AirportID INT [primary key]
  AirportName VARCHAR(255)
  Location VARCHAR(255)
  IATACode VARCHAR(3)
  ICAOCode VARCHAR(4)
  RunwayCount INT
  TerminalCount INT
  GateCount INT
}

Table Runway {
  RunwayID INT [primary key]
  AirportID INT [ref: > Airport.AirportID]
  RunwayNumber VARCHAR(10)
  Length DECIMAL(10, 2)
  SurfaceType VARCHAR(50)
  Status VARCHAR(20)
}

Table Terminal {
  TerminalID INT [primary key]
  AirportID INT [ref: > Airport.AirportID]
  TerminalName VARCHAR(255)
  BoardingBridgeCount INT
}

Table Gate {
  GateID INT [primary key]
  TerminalID INT [ref: > Terminal.TerminalID]
  GateNumber VARCHAR(10)
  Status VARCHAR(20)
}

Table Airline {
  AirlineID INT [primary key]
  AirlineName VARCHAR(255)
  IATACode VARCHAR(3)
}

Table Flight {
  FlightID INT [primary key]
  AirlineID INT [ref: > Airline.AirlineID]
  FlightNumber VARCHAR(10)
  DepartureAirport VARCHAR(3)
  DestinationAirport VARCHAR(3)
  DepartureTime DATETIME
  ArrivalTime DATETIME
}

Table Passenger {
  PassengerID INT [primary key]
  FirstName VARCHAR(50)
  LastName VARCHAR(50)
  PassportNumber VARCHAR(20)
  Nationality VARCHAR(50)
  ContactInfo VARCHAR(255)
}

Table Ticket {
  TicketID INT [primary key]
  PassengerID INT [ref: > Passenger.PassengerID]
  FlightID INT [ref: > Flight.FlightID]
  SeatNumber VARCHAR(10)
  TicketStatus VARCHAR(20)
}

Table BoardingPass {
  BoardingPassID INT [primary key]
  TicketID INT [ref: > Ticket.TicketID]
  GateID INT [ref: > Gate.GateID]
  BoardingTime DATETIME
  SeatNumber VARCHAR(10)
}

Table Baggage {
  BaggageID INT [primary key]
  PassengerID INT [ref: > Passenger.PassengerID]
  FlightID INT [ref: > Flight.FlightID]
  BaggageTagNumber VARCHAR(20)
  Weight DECIMAL(10, 2)
  Status VARCHAR(20)
}
