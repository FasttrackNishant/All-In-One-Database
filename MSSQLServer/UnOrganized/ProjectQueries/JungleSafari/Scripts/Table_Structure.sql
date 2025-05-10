create database junglesafari

use Jungle_Safari_API

CREATE TABLE Users (
    UserId INT PRIMARY KEY IDENTITY(1,1),
    Username VARCHAR(50) NOT NULL UNIQUE,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    RoleId INT,
    IsActive BIT DEFAULT 1,
    LastLogin DATETIME,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Users_Roles FOREIGN KEY (RoleId) REFERENCES Roles(RoleId)
);

CREATE TABLE Roles (
    RoleId INT PRIMARY KEY IDENTITY(1,1),
    RoleName VARCHAR(50) NOT NULL
);

CREATE TABLE Safaris (
    SafariId INT PRIMARY KEY IDENTITY(1,1),
    ParkId INT,
    SafariName VARCHAR(100),
    Description TEXT,
    Status VARCHAR(10) CHECK (Status IN ('Active', 'Inactive')),
    Duration INT,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Safaris_Parks FOREIGN KEY (ParkId) REFERENCES Parks(ParkId)
);

CREATE TABLE SafariSlots (
    SlotId INT PRIMARY KEY IDENTITY(1,1),
    SlotName VARCHAR(50),
    StartTime TIME,
    EndTime TIME,
    Status BIT,
    ParkId INT,
    UNIQUE (ParkId, StartTime, EndTime),
    CONSTRAINT FK_SafariSlots_Parks FOREIGN KEY (ParkId) REFERENCES Parks(ParkId)
);

CREATE TABLE Countries (
    CountryId INT PRIMARY KEY IDENTITY(1,1),
    CountryName VARCHAR(100),
    CountryCode VARCHAR(10)
);
use jungle_safari_api

CREATE TABLE IdentityTypes (
    IdentityTypeId INT PRIMARY KEY IDENTITY(1,1),
    TypeName VARCHAR(50) UNIQUE
);

CREATE TABLE IdentityProofs (
    IdentityProofId INT PRIMARY KEY IDENTITY(1,1),
    UserId INT,
    IdentityTypeId INT,
    IdentityNumber VARCHAR(100),
    IdentityDocumentUrl VARCHAR(255),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_IdentityProofs_Users FOREIGN KEY (UserId) REFERENCES Users(Id),
    CONSTRAINT FK_IdentityProofs_IdentityTypes FOREIGN KEY (IdentityTypeId) REFERENCES IdentityTypes(IdentityTypeId),
    UNIQUE (UserId, IdentityTypeId),
    UNIQUE (IdentityTypeId, IdentityNumber)
);

CREATE TABLE Profiles (
    ProfileId INT PRIMARY KEY IDENTITY(1,1),
    UserId INT UNIQUE,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender varchar(255),
    PhoneNumber VARCHAR(20),
    Street VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    CountryId INT,
    ZipCode VARCHAR(20),
    ProfilePictureUrl VARCHAR(255) NULL,
    IsProfileComplete BIT DEFAULT 0,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Profiles_Users FOREIGN KEY (UserId) REFERENCES Users(Id),
    CONSTRAINT FK_Profiles_Countries FOREIGN KEY (CountryId) REFERENCES Countries(CountryId)
);

CREATE TABLE Gender (
    GenderId INT PRIMARY KEY IDENTITY(1,1),
    GenderName VARCHAR(20)
);

CREATE TABLE Tourists (
    TouristId INT PRIMARY KEY IDENTITY(1,1),
    UserId INT UNIQUE,
    IdentityTypeId INT,
    IdentityNumber VARCHAR(100),
    CONSTRAINT FK_Tourists_Users FOREIGN KEY (UserId) REFERENCES Users(Id),
    CONSTRAINT FK_Tourists_IdentityTypes FOREIGN KEY (IdentityTypeId) REFERENCES IdentityTypes(IdentityTypeId)
);

drop table employees

CREATE TABLE Employees (
    EmployeeId INT PRIMARY KEY IDENTITY(1,1),
    UserId INT UNIQUE,
    Department VARCHAR(100),
    Position VARCHAR(100),
    HireDate DATE,
	 IdentityTypeId INT,
    IdentityNumber VARCHAR(100),
    CONSTRAINT FK_Employees_Users FOREIGN KEY (UserId) REFERENCES Users(Id),
	 CONSTRAINT FK_Employees_Identity FOREIGN KEY (IdentityTypeId) REFERENCES IdentityTypes(IdentityTypeId)
);

CREATE TABLE Admins (
    AdminId INT PRIMARY KEY IDENTITY(1,1),
    UserId INT UNIQUE,
    AdminLevel INT,
    CONSTRAINT FK_Admins_Users FOREIGN KEY (UserId) REFERENCES Users(Id)
   
);

CREATE TABLE [Safaris] (
  [SafariId] int PRIMARY KEY IDENTITY(1, 1),
  [ParkId] int NOT NULL,
  [SafariName] nvarchar(100) NOT NULL,
  [Description] nvarchar(max),
  [Status] BIT DEFAULT 1,
  [Duration] time NOT NULL,
  [CreatedAt] datetime2 DEFAULT GETUTCDATE(),
  [UpdatedAt] datetime2 DEFAULT GETUTCDATE(),
  CONSTRAINT FK_Safaris_Parks FOREIGN KEY (ParkId) REFERENCES Parks(ParkId)
)



CREATE TABLE EntryFees (
    EntryFeeId INT PRIMARY KEY IDENTITY(1,1),
    ParkId INT,
    VehicleTypeId INT,
    Amount DECIMAL(18, 2),
    EffectiveFrom DATE,
    EffectiveTo DATE,
    CONSTRAINT FK_EntryFees_Parks FOREIGN KEY (ParkId) REFERENCES Parks(ParkId),
    CONSTRAINT FK_EntryFees_Vehicles FOREIGN KEY (VehicleTypeId) REFERENCES Vehicles(VehicleId)
);

CREATE TABLE Vehicles (
    VehicleId INT PRIMARY KEY IDENTITY(1,1),
    TypeName VARCHAR(50),
    SeatingCapacity INT,
    IsActive BIT DEFAULT 1
);

CREATE TABLE Parks (
    ParkId INT PRIMARY KEY IDENTITY(1,1),
    ParkName VARCHAR(100),
    ParkType VARCHAR(50),
    Description TEXT,
    Location VARCHAR(255),
    IsActive BIT DEFAULT 1
);




CREATE TABLE Gates (
    GateId INT PRIMARY KEY IDENTITY(1,1),
    ParkId INT,
    GateName VARCHAR(100),
    MaxVehiclesPerSlot INT,
    Status BIT,
    CONSTRAINT FK_Gates_Parks FOREIGN KEY (ParkId) REFERENCES Parks(ParkId)
);

CREATE TABLE SafariBookings (
    BookingId INT PRIMARY KEY IDENTITY(1,1),
    ParkId INT,
    GateId INT,
    SlotId INT,
    VehicleTypeId INT,
    BookingDate DATE,
    SafariDate DATE,
    IsOwnVehicle BIT,
    TotalAmount DECIMAL(18, 2),
    CurrentStatusId INT,
	PaymentId int , 
    CancellationReason TEXT NULL,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_SafariBookings_Parks FOREIGN KEY (ParkId) REFERENCES Parks(ParkId),
    CONSTRAINT FK_SafariBookings_Gates FOREIGN KEY (GateId) REFERENCES Gates(GateId),
    CONSTRAINT FK_SafariBookings_SafariSlots FOREIGN KEY (SlotId) REFERENCES SafariSlots(SlotId),
    CONSTRAINT FK_SafariBookings_Vehicles FOREIGN KEY (VehicleTypeId) REFERENCES Vehicles(VehicleId),
	CONSTRAINT FK_SafariBookings_Payments FOREIGN KEY (PaymentId) REFERENCES PaymentDetails(PaymentId)
);

CREATE TABLE BookingStatusTypes (
    StatusId INT PRIMARY KEY IDENTITY(1,1),
    StatusName VARCHAR(50),
    Description VARCHAR(255),
    IsActive BIT
);


CREATE TABLE BookingTourists (
    BookingTouristId INT PRIMARY KEY IDENTITY(1,1),
    BookingId INT NOT NULL,
    TouristId INT NOT NULL,
    CONSTRAINT FK_BookingTourists_SafariBookings FOREIGN KEY (BookingId) 
        REFERENCES SafariBookings(BookingId),
    CONSTRAINT FK_BookingTourists_Tourists FOREIGN KEY (TouristId) 
        REFERENCES Tourists(TouristId)
);

CREATE TABLE BookingStatusHistory (
    HistoryId INT PRIMARY KEY IDENTITY(1,1),
    BookingId INT,
    StatusId INT,
    Comments TEXT,
    ChangedBy INT,
    ChangedAt DATETIME DEFAULT GETDATE(),
    CreatedAt DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_BookingStatusHistory_Bookings FOREIGN KEY (BookingId) REFERENCES SafariBookings(BookingId),
    CONSTRAINT FK_BookingStatusHistory_StatusTypes FOREIGN KEY (StatusId) REFERENCES BookingStatusTypes(StatusId),
    CONSTRAINT FK_BookingStatusHistory_Users FOREIGN KEY (ChangedBy) REFERENCES Employees(EmployeeId)
);

CREATE TABLE BookingTourists (
    BookingTouristId INT PRIMARY KEY IDENTITY(1,1),
    BookingId INT,
    TouristId INT,
    CONSTRAINT FK_BookingTourists_Bookings FOREIGN KEY (BookingId) REFERENCES SafariBookings(BookingId),
    CONSTRAINT FK_BookingTourists_Tourists FOREIGN KEY (TouristId) REFERENCES Tourists(TouristId)
);

alter table bookingtourists add  UpdatedAt datetime;

CREATE TABLE PaymentDetails (
    PaymentId INT PRIMARY KEY IDENTITY(1,1),
    TransactionId VARCHAR(100),
    PaymentDate DATETIME DEFAULT GETDATE(),
    Amount DECIMAL(18, 2),
    PaymentMethod VARCHAR(50),
    PaymentStatus VARCHAR(50),
    BankName VARCHAR(100),
    CreatedAt DATETIME DEFAULT GETDATE(),  
);

delete from bookingtourists  where BookingTouristId = 7
