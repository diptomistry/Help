                            --QUERY1--
mysql> ALTER TABLE Flight
    -> ADD COLUMN LandingTime DATETIME;
Query OK, 0 rows affected (0.16 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> -- Update the landing time for a specific flight
mysql> UPDATE Flight
    -> SET LandingTime = '2023-10-12 14:30:00'
    -> WHERE FlightID = 1;

--Answer:                    
mysql> SELECT FlightID, FlightNumber, DepartureAirport, DestinationAirport, DepartureTime, ArrivalTime, LandingTime
    -> FROM Flight
    -> WHERE TIMEDIFF(LandingTime, ArrivalTime) >= '00:30:00';

                          --QUERY2--

mysql> -- Add the foreign key constraint
mysql> ALTER TABLE Airline
    -> ADD CONSTRAINT fk_airline_gate
    -> FOREIGN KEY (GateID) REFERENCES Gate(GateID);
Query OK, 3 rows affected (0.30 sec)

  mysql> ALTER TABLE Airline
    -> ADD GateOpenDateTime DATETIME,
    ->     ADD GateCloseDateTime DATETIME;

                             
--Answer: 
SELECT G.GateID, G.GateNumber
FROM Gate G
LEFT JOIN Airline A ON G.GateID = A.GateID
WHERE (A.GateOpenDateTime IS NULL OR A.GateCloseDateTime <= '2023-10-12 15:00:00')
    OR (A.GateOpenDateTime >= '2023-10-12 15:00:00' OR A.GateCloseDateTime IS NULL);
