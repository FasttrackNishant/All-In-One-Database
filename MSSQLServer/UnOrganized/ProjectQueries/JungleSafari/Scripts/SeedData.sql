INSERT INTO Roles (RoleName) VALUES 
('Admin'),
('Tourist'),
('Employee')

use jungle_safari_api


INSERT INTO Parks (ParkName, ParkType, Description, Location, IsActive) VALUES
('Tadoba Andhari Tiger Reserve', 'Tiger Reserve', 'One of the largest and oldest national parks in Maharashtra, known for its rich biodiversity and tiger population.', 'Chandrapur, Maharashtra', 1),
('Sanjay Gandhi National Park', 'National Park', 'A large national park located in the northern part of Mumbai, known for its diverse flora and fauna.', 'Mumbai, Maharashtra', 1),
('Koynanagar Wildlife Sanctuary', 'Wildlife Sanctuary', 'A sanctuary known for its rich wildlife, including leopards, deer, and various bird species.', 'Koynanagar, Maharashtra', 1),
('Navegaon National Park', 'National Park', 'Famous for its beautiful lake and diverse wildlife, including various species of birds.', 'Gadchiroli, Maharashtra', 1),
('Bhima Shankar Wildlife Sanctuary', 'Wildlife Sanctuary', 'Known for its rich biodiversity and as a habitat for the Indian Giant Squirrel.', 'Pune, Maharashtra', 1);


INSERT INTO Vehicles (TypeName, SeatingCapacity, IsActive) VALUES
('Safari Jeep', 6, 1),
('Eco-friendly Electric Vehicle', 4, 1),
('Mini Bus', 15, 1),
('Open-top Tour Bus', 30, 1),
('Motorcycle', 2, 1);

INSERT INTO IdentityTypes (TypeName) VALUES
('Aadhar Card'),
('Passport'),
('Voter ID'),
('Driving License'),
('PAN Card');

INSERT INTO Gender (GenderName) VALUES
('Male'),
('Female')

INSERT INTO Users (Username, Email, Password, RoleId, IsActive, LastLogin) VALUES
('rajesh.kumar', 'rajesh.kumar@gmail.com', 'pass123', 1, 1, '2024-10-28 14:30:00'),
('priya.sharma', 'priya.sharma@gmail.com', 'pass123', 3, 1, '2024-10-28 16:45:00'),
('amit.patel', 'amit.patel@gmail.com', 'pass123', 2, 1, '2024-10-28 12:15:00'),
('neha.gupta', 'neha.gupta@gmail.com', 'pass123', 3, 1, '2024-10-28 09:20:00'),
('suresh.verma', 'suresh.verma@gmail.com', 'pass123', 2, 1, '2024-10-28 11:30:00');




INSERT INTO Profiles (UserId, FirstName, LastName, DateOfBirth, GenderId, Street, City, State, CountryId, ZipCode, IsProfileComplete) VALUES
(1, 'Rajesh', 'Kumar', '1990-05-15', 1,  '123 Main St', 'Delhi', 'Delhi', 1, '110001', 1)


(7, 'Priya', 'Sharma', '1992-08-20', 2, '2345678901', '456 Elm St', 'Mumbai', 'Maharashtra', 1, '400001', 1),
(8, 'Amit', 'Patel', '1988-12-30', 1, '3456789012', '789 Pine St', 'Ahmedabad', 'Gujarat', 1, '380001', 1),
(9, 'Neha', 'Gupta', '1995-04-10', 2, '4567890123', '321 Oak St', 'Bangalore', 'Karnataka', 1, '560001', 1),
(10, 'Suresh', 'Verma', '1985-11-25', 1, '5678901234', '654 Maple St', 'Chennai', 'Tamil Nadu', 1, '600001', 1);

INSERT INTO IdentityProofs (UserId, IdentityTypeId, IdentityNumber, IdentityDocumentUrl) VALUES
(6, 1, '1234-5678-9012', 'http://example.com/docs/identity1.jpg'),  -- Rajesh Kumar
(7, 2, 'A123456789', 'http://example.com/docs/identity2.jpg'),     -- Priya Sharma
(8, 3, 'VOTER123456', 'http://example.com/docs/identity3.jpg'),    -- Amit Patel
(9, 4, 'DL1234567890', 'http://example.com/docs/identity4.jpg'),   -- Neha Gupta
(10, 5, 'PAN1234567A', 'http://example.com/docs/identity5.jpg');     -- Suresh Verma


INSERT INTO Tourists (UserId, IdentityTypeId, IdentityNumber) VALUES
(8, 3, 'VOTER123456'),     -- Amit Patel with Voter ID
(10, 5, 'PAN1234567A');      -- Suresh Verma with PAN Card

INSERT INTO Employees (UserId, Department, Position, HireDate) VALUES
(9, 'Operations', 'Tour Guide', '2023-01-15'),  -- Neha Gupta
(7, 'Administration', 'Admin Officer', '2022-12-01');  -- Priya Sharma


INSERT INTO Admins (UserId, AdminLevel) VALUES
(6, 1);  -- Assuming Rajesh Kumar has UserId 1 and is at level 1

INSERT INTO EntryFees (ParkId, VehicleTypeId, Amount, EffectiveFrom, EffectiveTo) VALUES
(1, 1, 1500.00, '2023-01-01', '2023-12-31'),  -- Tadoba Andhari Tiger Reserve - Safari Jeep
(1, 2, 1000.00, '2023-01-01', '2023-12-31'),  -- Tadoba Andhari Tiger Reserve - Eco-friendly Electric Vehicle
(2, 1, 800.00, '2023-01-01', '2023-12-31'),   -- Sanjay Gandhi National Park - Safari Jeep
(3, 3, 1200.00, '2023-01-01', '2023-12-31'),  -- Koynanagar Wildlife Sanctuary - Mini Bus
(4, 4, 2000.00, '2023-01-01', '2023-12-31');  -- Bhima Shankar Wildlife Sanctuary - Open-top Tour Bus

INSERT INTO SafariBookings (ParkId, GateId, SlotId, VehicleTypeId, BookingDate, SafariDate, IsOwnVehicle, TotalAmount, CurrentStatusId) VALUES
(1, 1, 1, 1, '2023-10-01', '2023-10-05', 0, 1500.00, 1),
(2, 2, 2, 2, '2023-10-02', '2023-10-06', 0, 1000.00, 1),
(3, 3, 3, 3, '2023-10-03', '2023-10-07', 0, 1200.00, 1),
(4, 4, 4, 4, '2023-10-04', '2023-10-08', 1, 2000.00, 1),
(1, 1, 1, 1, '2023-10-05', '2023-10-09', 0, 1500.00, 1);


INSERT INTO BookingStatusTypes (StatusName, Description, IsActive) VALUES
('Confirmed', 'Booking is confirmed.', 1),
('Cancelled', 'Booking has been cancelled.', 1),
('Pending', 'Booking is pending confirmation.', 1),
('Completed', 'Booking has been completed.', 1);

INSERT INTO PaymentDetails (BookingId, TransactionId, PaymentDate, Amount, PaymentMethod, PaymentStatus, BankName) VALUES
(1, 'TXN123456789', '2023-10-01', 1500.00, 'Credit Card', 'Success', 'HDFC Bank'),
(2, 'TXN987654321', '2023-10-02', 1000.00, 'Debit Card', 'Success', 'ICICI Bank'),
(3, 'TXN456789123', '2023-10-03', 1200.00, 'Net Banking', 'Success', 'SBI'),
(4, 'TXN321654987', '2023-10-04', 2000.00, 'UPI', 'Success', 'Axis Bank'),
(5, 'TXN654321789', '2023-10-05', 1500.00, 'Credit Card', 'Success', 'HDFC Bank');

INSERT INTO BookingStatusHistory (BookingId, StatusId, Comments, ChangedBy) VALUES
(1, 1, 'Booking confirmed by the employee.', 4),  -- BookingId 1, StatusId for Confirmed, ChangedBy Employee (User Id 4)
(2, 1, 'Booking confirmed by the employee.', 4),  -- BookingId 2, StatusId for Confirmed, ChangedBy Employee (User Id 4)
(3, 1, 'Booking confirmed by the employee.', 4),  -- BookingId 3, StatusId for Confirmed, ChangedBy Employee (User Id 4)
(4, 1, 'Booking confirmed by the employee.', 4),  -- BookingId 4, StatusId for Confirmed, ChangedBy Employee (User Id 4)
(5, 1, 'Booking confirmed by the employee.', 4);  -- BookingId 5, StatusId for Confirmed, ChangedBy Employee (User Id 4)



INSERT INTO Countries (CountryName, CountryCode) VALUES
('India', 'IN'),
('United States', 'US'),
('United Kingdom', 'GB'),
('Canada', 'CA'),
('Australia', 'AU'),
('Germany', 'DE'),
('France', 'FR'),
('Japan', 'JP'),
('China', 'CN'),
('Brazil', 'BR');



-- Profile


INSERT INTO [Jungle_Safari_API].[dbo].[Profiles]
(
   
    [UserId],
    [FirstName],
    [LastName],
    [DateOfBirth],
    [Gender],
    [Street],
    [City],
    [State],
    [CountryId],
    [ZipCode],
    [ProfilePictureUrl],
    [IsProfileComplete],
    [CreatedAt],
    [UpdatedAt]
)
VALUES
(
     -- ProfileId (assuming it's an identity column, you might want to omit this)
    1, -- UserId (adjust based on your user identification system)
    'Rahul', -- FirstName
    'Sharma', -- LastName
    '1992-05-20', -- DateOfBirth (in YYYY-MM-DD format)
    'Male', -- GenderId (assuming 1 represents Male)
    '42, Rajpath Marg', -- Street
    'New Delhi', -- City
    'Delhi', -- State
    1, -- CountryId (assuming 91 represents India)
    '110001', -- ZipCode
    'https://example.com/profile-pics/rahul-sharma.jpg', -- ProfilePictureUrl
    1, -- IsProfileComplete (1 for true, 0 for false)
    GETDATE(), -- CreatedAt (current date and time)
    GETDATE() -- UpdatedAt (current date and time)
);

drop table profiles;


INSERT INTO Safaris (ParkId, SafariName, Description, Status, Duration) VALUES
(1, 'Tadoba Tiger Trail', 'An exciting safari through the heart of Tadoba, focusing on tiger spotting and wildlife observation.', 1, '03:00:00'),
(2, 'Sanjay Gandhi Nature Walk', 'A peaceful safari exploring the diverse flora and fauna of Sanjay Gandhi National Park.', 1, '02:30:00'),
(3, 'Koyna Wildlife Explorer', 'An adventurous safari through Koynanagar, with opportunities to spot leopards and various bird species.', 1, '02:45:00'),
(4, 'Navegaon Lake Safari', 'A unique safari combining a boat ride on Navegaon Lake with wildlife spotting along the shores.', 1, '03:30:00'),
(5, 'Bhima Shankar Squirrel Safari', 'A specialized safari focused on observing the rare Indian Giant Squirrel and other local wildlife.', 1, '02:15:00');


-- all safari list

-- all gates data

-- For Tadoba Andhari Tiger Reserve (ParkId = 1)
INSERT INTO Gates (ParkId, GateName, MaxVehiclesPerSlot, Status) VALUES
(1, 'Moharli Gate', 15, 1),
(1, 'Tadoba Gate', 12, 1),
(1, 'Navegaon Gate', 10, 1),
(1, 'Zari Gate', 8, 1);

-- For Sanjay Gandhi National Park (ParkId = 2)
INSERT INTO Gates (ParkId, GateName, MaxVehiclesPerSlot, Status) VALUES
(2, 'Borivali Main Gate', 20, 1),
(2, 'Yeoor Gate', 15, 1),
(2, 'Tulsi Lake Gate', 10, 1);

-- For Koynanagar Wildlife Sanctuary (ParkId = 3)
INSERT INTO Gates (ParkId, GateName, MaxVehiclesPerSlot, Status) VALUES
(3, 'Koyna Main Gate', 12, 1),
(3, 'Vasota Gate', 8, 1),
(3, 'Tapola Gate', 10, 1);

-- For Navegaon National Park (ParkId = 4)
INSERT INTO Gates (ParkId, GateName, MaxVehiclesPerSlot, Status) VALUES
(4, 'Navegaon Main Gate', 15, 1),
(4, 'Lake View Gate', 10, 1),
(4, 'Forest Gate', 8, 1);

-- For Bhima Shankar Wildlife Sanctuary (ParkId = 5)
INSERT INTO Gates (ParkId, GateName, MaxVehiclesPerSlot, Status) VALUES
(5, 'Bhimashankar Main Gate', 12, 1),
(5, 'Sanctuary Gate', 10, 1),
(5, 'Temple Route Gate', 8, 1);




-- slot data for this

-- For Tadoba Andhari Tiger Reserve (ParkId = 1)
INSERT INTO SafariSlots (SlotName, StartTime, EndTime, Status, ParkId) VALUES
('Morning Slot 1', '06:00:00', '09:00:00', 1, 1),
('Morning Slot 2', '06:30:00', '09:30:00', 1, 1),
('Evening Slot 1', '15:30:00', '18:30:00', 1, 1),
('Evening Slot 2', '16:00:00', '19:00:00', 1, 1);

-- For Sanjay Gandhi National Park (ParkId = 2)
INSERT INTO SafariSlots (SlotName, StartTime, EndTime, Status, ParkId) VALUES
('Morning Slot 1', '07:00:00', '09:00:00', 1, 2),
('Morning Slot 2', '09:30:00', '11:30:00', 1, 2),
('Evening Slot 1', '14:00:00', '16:00:00', 1, 2),
('Evening Slot 2', '16:30:00', '18:30:00', 1, 2);

-- For Koynanagar Wildlife Sanctuary (ParkId = 3)
INSERT INTO SafariSlots (SlotName, StartTime, EndTime, Status, ParkId) VALUES
('Morning Slot 1', '06:30:00', '09:00:00', 1, 3),
('Morning Slot 2', '09:30:00', '12:00:00', 1, 3),
('Evening Slot 1', '15:00:00', '17:30:00', 1, 3),
('Evening Slot 2', '16:00:00', '18:30:00', 1, 3);

-- For Navegaon National Park (ParkId = 4)
INSERT INTO SafariSlots (SlotName, StartTime, EndTime, Status, ParkId) VALUES
('Morning Slot 1', '07:00:00', '09:30:00', 1, 4),
('Morning Slot 2', '10:00:00', '12:30:00', 1, 4),
('Evening Slot 1', '14:30:00', '17:00:00', 1, 4),
('Evening Slot 2', '15:30:00', '18:00:00', 1, 4);

-- For Bhima Shankar Wildlife Sanctuary (ParkId = 5)
INSERT INTO SafariSlots (SlotName, StartTime, EndTime, Status, ParkId) VALUES
('Morning Slot 1', '06:30:00', '09:00:00', 1, 5),
('Morning Slot 2', '09:30:00', '12:00:00', 1, 5),
('Evening Slot 1', '15:00:00', '17:30:00', 1, 5),
('Evening Slot 2', '16:00:00', '18:30:00', 1, 5);


-- booking status types

INSERT INTO BookingStatusTypes (StatusName, Description, IsActive) VALUES
('Pending', 'Booking is pending confirmation', 1),
('Confirmed', 'Booking has been confirmed', 1),
('Cancelled', 'Booking has been cancelled', 1),
('Completed', 'Safari tour has been completed', 1),
('Rescheduled', 'Booking has been rescheduled', 1),
('Refunded', 'Booking has been refunded', 1),
('No Show', 'Customer did not show up for the booking', 1),
('In Progress', 'The safari is currently ongoing', 1),
('Awaiting Payment', 'Payment is pending for the booking', 1),
('Expired', 'Booking date has passed without completion', 1);


-- payment details

INSERT INTO PaymentDetails (TransactionId, PaymentDate, Amount, PaymentMethod, PaymentStatus, BankName) VALUES
('TXN100001', '2023-06-01 10:00:00', 2500.00, 'Credit Card', 'Completed', 'HDFC Bank'),
('TXN100002', '2023-06-02 11:30:00', 3000.00, 'Debit Card', 'Completed', 'SBI Bank'),
('TXN100003', '2023-06-03 09:15:00', 2000.00, 'Net Banking', 'Completed', 'ICICI Bank'),
('TXN100004', '2023-06-04 14:45:00', 3500.00, 'UPI', 'Completed', 'Axis Bank'),
('TXN100005', '2023-06-05 16:20:00', 2800.00, 'Credit Card', 'Failed', 'Kotak Bank'),
('TXN100006', '2023-06-06 12:00:00', 1500.00, 'Cash', 'Completed', 'N/A'),
('TXN100007', '2023-06-07 15:30:00', 5000.00, 'Net Banking', 'Completed', 'Bank of Baroda'),
('TXN100008', '2023-06-08 08:00:00', 3200.00, 'Debit Card', 'Completed', 'Union Bank'),
('TXN100009', '2023-06-09 19:00:00', 4500.00, 'Credit Card', 'Pending', 'HDFC Bank'),
('TXN100010', '2023-06-10 11:00:00', 2700.00, 'UPI', 'Completed', 'Paytm Payments');


-- safari bookings

INSERT INTO SafariBookings (ParkId, GateId, SlotId, VehicleTypeId, BookingDate, SafariDate, IsOwnVehicle, TotalAmount, CurrentStatusId, PaymentId, CancellationReason) VALUES
(1, 1, 1, 1, '2023-06-01', '2023-06-15', 0, 2500.00, 2, 1, NULL),
(2, 5, 5, 2, '2023-06-02', '2023-06-20', 1, 3000.00, 2, 2, NULL),
(3, 9, 9, 1, '2023-06-03', '2023-06-25', 0, 2000.00, 3, 3, 'Weather conditions'),
(4, 12, 13, 3, '2023-06-04', '2023-06-30', 0, 3500.00, 1, 4, NULL),
(5, 16, 17, 2, '2023-06-05', '2023-07-05', 1, 2800.00, 1, 5, NULL),
(1, 1, 2, 1, '2023-06-06', '2023-07-10', 0, 2600.00, 1, 6, NULL),
(2, 5, 4, 2, '2023-06-07', '2023-07-15', 1, 3200.00, 2, 7, NULL),
(3, 9, 6, 1, '2023-06-08', '2023-07-20', 0, 2100.00, 3, 8, 'Cancellation by user'),
(3, 8, 7, 2, '2023-06-09', '2023-07-25', 0, 4500.00, 2, 9, NULL),
(4, 11, 10, 1, '2023-06-10', '2023-07-30', 1, 2700.00, 2, 10, NULL);


-- history


INSERT INTO BookingStatusHistory (BookingId, StatusId, Comments, ChangedBy) VALUES
(1, 1, 'Initial booking received', 1),
(1, 2, 'Payment confirmed, booking confirmed', 1),
(2, 1, 'Booking request received', 2),
(2, 2, 'Payment verified and confirmed', 2),
(3, 1, 'Initial booking created', 3),
(3, 3, 'Cancelled due to heavy rainfall', 3),
(4, 1, 'New booking registered', 4),
(4, 2, 'Payment successful, booking confirmed', 4),
(4, 4, 'Safari completed successfully', 4),
(5, 1, 'Booking initiated', 5),
(5, 2, 'Confirmed after payment verification', 5),
(6, 1, 'New booking request', 1),
(6, 5, 'Rescheduled as per customer request', 1),
(7, 1, 'Booking created in system', 2),
(7, 7, 'Marked as no-show', 2);


INSERT INTO BookingTourists (BookingId, TouristId) VALUES
-- Booking 1 (Family of 3)
(1, 1),  -- Father
(1, 2),  -- Mother
(1, 3),  -- Child

-- Booking 2 (Group of friends)
(2, 4),
(2, 5),
(2, 6),
(2, 7),

-- Booking 3 (Couple)
(3, 8),
(3, 9),

-- Booking 4 (Large group)
(4, 10),
(4, 11),
(4, 12),
(4, 13),
(4, 14),

-- Booking 5 (Small family)
(5, 15),
(5, 16),

-- Booking 6 (Solo traveler)
(6, 17),

-- Booking 7 (Group tour)
(7, 18),
(7, 19),
(7, 20),

-- Booking 8 (Family with grandparents)
(8, 21),
(8, 22),
(8, 23),
(8, 24),

-- Booking 9 (Couple with friend)
(9, 25),
(9, 26),
(9, 27),

-- Booking 10 (International tourists)
(10, 28),
(10, 29),
(10, 30);




-- booking status history

INSERT INTO BookingStatusHistory (BookingId, StatusId, Comments, ChangedBy, CreatedAt,ChangedAt ) VALUES
(12, 1, 'Initial booking received', 1, '2024-11-07 18:37:37.917', '2024-11-07 18:37:37.917'),
(12, 2, 'Payment confirmed, booking confirmed', 1, '2024-11-07 18:37:37.917', '2024-11-07 18:37:37.917'),
(13, 1, 'Booking request received', 1, '2024-11-07 18:37:37.917', '2024-11-07 18:37:37.917'),
(13, 2, 'Payment verified and confirmed', 1, '2024-11-07 18:37:37.917', '2024-11-07 18:37:37.917'),
(14, 1, 'Initial booking created',1, '2024-11-07 18:37:37.917', '2024-11-07 18:37:37.917'),
(14, 3, 'Cancelled due to weather conditions', 1, '2024-11-07 18:37:37.917', '2024-11-07 18:37:37.917'),
(15, 1, 'New booking registered', 1, '2024-11-07 18:37:37.917', '2024-11-07 18:37:37.917'),
(16, 1, 'Booking initiated', 1, '2024-11-07 18:37:37.917', '2024-11-07 18:37:37.917'),
(17, 1, 'New booking request', 1, '2024-11-07 18:37:37.917', '2024-11-07 18:37:37.917'),
(18, 1, 'Booking created in system', 1, '2024-11-07 18:37:37.917', '2024-11-07 18:37:37.917'),
(18, 2, 'Payment confirmed', 1, '2024-11-07 18:37:37.917', '2024-11-07 18:37:37.917');


INSERT INTO BookingTourists (BookingId, TouristId, CreatedAt, UpdatedAt) VALUES
-- Booking 14 (Couple)
(14, 1, '2024-11-07 18:37:37.917', '2024-11-07 18:37:37.917'),
(14, 2, '2024-11-07 18:37:37.917', '2024-11-07 18:37:37.917');


-- Booking 12 (Family of 3)
(12, 1, '2024-11-07 18:37:37.917', '2024-11-07 18:37:37.917'),
(12, 2, '2024-11-07 18:37:37.917', '2024-11-07 18:37:37.917'),
(12, 3, '2024-11-07 18:37:37.917', '2024-11-07 18:37:37.917'),

-- Booking 13 (Group of friends)
(13, 4, '2024-11-07 18:37:37.917', '2024-11-07 18:37:37.917'),
(13, 5, '2024-11-07 18:37:37.917', '2024-11-07 18:37:37.917'),
(13, 6, '2024-11-07 18:37:37.917', '2024-11-07 18:37:37.917'),


-- Continue for other bookings...


INSERT INTO BookingStatusTypes (StatusId, StatusName, Description, IsActive, CreatedAt, UpdatedAt) VALUES
(1, 'Pending', 'Initial booking status before confirmation', 1, '2024-11-07 18:37:37.917', '2024-11-07 18:37:37.917'),
(2, 'Confirmed', 'Booking has been confirmed after payment', 1, '2024-11-07 18:37:37.917', '2024-11-07 18:37:37.917'),
(3, 'Cancelled', 'Booking has been cancelled', 1, '2024-11-07 18:37:37.917', '2024-11-07 18:37:37.917');




-- Additional Safaris for Tadoba Andhari Tiger Reserve (ParkId 1)
INSERT INTO Safaris 
(ParkId, SafariName, Description, Status, Duration, CreatedAt, UpdatedAt)
VALUES 
(1, 'Tadoba Jungle Safari', 'A thrilling jungle safari exploring the heart of Tadoba, with chances to spot tigers and other wildlife.', 1, '03:30:00', GETDATE(), GETDATE()),

(1, 'Tadoba Night Safari', 'An adventurous night safari to experience the wilderness of Tadoba after dark.', 1, '02:00:00', GETDATE(), GETDATE());

-- Additional Safaris for Sanjay Gandhi National Park (ParkId 2)
INSERT INTO Safaris 
(ParkId, SafariName, Description, Status, Duration, CreatedAt, UpdatedAt)
VALUES 
(2, 'Sanjay Gandhi Eco Trail', 'An eco-friendly trail through the park, focusing on conservation and sustainable practices.', 1, '02:45:00', GETDATE(), GETDATE()),

(2, 'Sanjay Gandhi Wildlife Photography Tour', 'A guided photography tour to capture the diverse wildlife and landscapes of Sanjay Gandhi National Park.', 1, '03:00:00', GETDATE(), GETDATE());


-- Additional Safaris for Koynanagar Wildlife Sanctuary (ParkId 3)
INSERT INTO Safaris 
(ParkId, SafariName, Description, Status, Duration, CreatedAt, UpdatedAt)
VALUES 
(3, 'Koyna Bird Watching Expedition', 'A specialized safari focusing on the diverse bird species of the Koynanagar region.', 1, '02:30:00', GETDATE(), GETDATE()),

(3, 'Leopard Tracking Adventure', 'An expert-guided safari to track and observe leopards in their natural habitat.', 1, '03:00:00', GETDATE(), GETDATE()),

(3, 'Riverside Wildlife Exploration', 'A scenic safari along the riverside, exploring the rich ecosystem of Koynanagar.', 1, '02:45:00', GETDATE(), GETDATE());

-- Additional Safaris for Navegaon National Park (ParkId 4)
INSERT INTO Safaris 
(ParkId, SafariName, Description, Status, Duration, CreatedAt, UpdatedAt)
VALUES 
(4, 'Navegaon Forest Canopy Tour', 'A unique safari exploring the diverse forest canopy and its inhabitants.', 1, '03:00:00', GETDATE(), GETDATE()),

(4, 'Migratory Bird Paradise Safari', 'A specialized tour focusing on the migratory bird species that visit Navegaon National Park.', 1, '02:45:00', GETDATE(), GETDATE()),

(4, 'Sunset Wildlife Photography Expedition', 'An evening safari designed for wildlife photographers to capture the park''s beauty.', 1, '02:30:00', GETDATE(), GETDATE());

-- Additional Safaris for Bhima Shankar Wildlife Sanctuary (ParkId 5)
INSERT INTO Safaris 
(ParkId, SafariName, Description, Status, Duration, CreatedAt, UpdatedAt)
VALUES 
(5, 'Giant Squirrel Conservation Trek', 'An educational safari focused on the conservation efforts for the Indian Giant Squirrel.', 1, '02:30:00', GETDATE(), GETDATE()),

(5, 'Medicinal Plants and Wildlife Walk', 'A unique safari exploring the rich medicinal flora and fauna of the sanctuary.', 1, '03:00:00', GETDATE(), GETDATE()),

(5, 'Nocturnal Wildlife Exploration', 'An evening safari to observe the nocturnal wildlife of Bhima Shankar.', 1, '02:15:00', GETDATE(), GETDATE());