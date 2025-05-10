use dbset_flight

drop table flights;

 CREATE TABLE Flights (
      Start VARCHAR(50),
      Destination VARCHAR(50),
      Start_Time DATETIME,
      Destination_Time DATETIME
    );


INSERT INTO Flights (Start, Destination, Start_Time, Destination_Time)
VALUES 
('New York', 'Los Angeles', '2022-01-01 08:00:00', '2022-01-01 11:00:00'),
('Los Angeles', 'New York', '2022-01-01 12:00:00', '2022-01-01 15:00:00'),
('Chicago', 'Miami', '2022-01-02 09:00:00', '2022-01-02 12:00:00'),
('Miami', 'Chicago', '2022-01-02 13:00:00', '2022-01-02 16:00:00'),
('San Francisco', 'Seattle', '2022-01-03 10:00:00', '2022-01-03 13:00:00'),
('Seattle', 'San Francisco', '2022-01-03 14:00:00', '2022-01-03 17:00:00'),
('Dallas', 'Denver', '2022-01-04 11:00:00', '2022-01-04 14:00:00'),
('Denver', 'Dallas', '2022-01-04 15:00:00', '2022-01-04 18:00:00'),
('Boston', 'Washington', '2022-01-05 12:00:00', '2022-01-05 15:00:00'),
('Washington', 'Boston', '2022-01-05 16:00:00', '2022-01-05 19:00:00');


select * from Flights;