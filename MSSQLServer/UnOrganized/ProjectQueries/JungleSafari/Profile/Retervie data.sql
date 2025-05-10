--- reterive data

use Jungle_Safari_API


SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_CATALOG = DB_NAME() order by table_name ;


-- User Authentication & Authorization Tables
SELECT * FROM Users;
SELECT * FROM Roles;
SELECT * FROM Admins;
SELECT * FROM Profiles;

-- Location and Basic Setup Tables
SELECT * FROM Countries;
SELECT * FROM Parks;
SELECT * FROM Gates;

-- Reference Tables

SELECT * FROM IdentityTypes;
SELECT * FROM IdentityProofs;
SELECT * FROM Vehicles;

-- Employee Related
SELECT * FROM Employees;

-- Safari Setup Tables
SELECT * FROM Safaris;
SELECT * FROM SafariSlots;
SELECT * FROM EntryFees;

-- Booking Related Tables
SELECT * FROM SafariBookings;
SELECT * FROM BookingStatusTypes;
SELECT * FROM BookingStatusHistory;
SELECT * FROM BookingTourists;
SELECT * FROM PaymentDetails;
SELECT * FROM Tourists;