SELECT TOP (1000) [Id]
      ,[RoleId]
      ,[IsActive]
      ,[LastLogin]
      ,[CreatedAt]
      ,[UpdatedAt]
      ,[UserName]
      ,[NormalizedUserName]
      ,[Email]
      ,[NormalizedEmail]
      ,[EmailConfirmed]
      ,[PasswordHash]
      ,[SecurityStamp]
      ,[ConcurrencyStamp]
      ,[PhoneNumber]
      ,[PhoneNumberConfirmed]
      ,[TwoFactorEnabled]
      ,[LockoutEnd]
      ,[LockoutEnabled]
      ,[AccessFailedCount]
  FROM [Test_Jungle_Safari].[dbo].[Users]


  CREATE TABLE Profiles (
    ProfileId INT PRIMARY KEY IDENTITY(1,1),
    UserId INT UNIQUE,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    GenderId INT,
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
    CONSTRAINT FK_Profiles_Gender FOREIGN KEY (GenderId) REFERENCES Gender(GenderId),
    CONSTRAINT FK_Profiles_Countries FOREIGN KEY (CountryId) REFERENCES Countries(CountryId)
);

CREATE TABLE Countries (
    CountryId INT PRIMARY KEY IDENTITY(1,1),
    CountryName VARCHAR(100),
    CountryCode VARCHAR(10)
);

CREATE TABLE Gender (
    GenderId INT PRIMARY KEY IDENTITY(1,1),
    GenderName VARCHAR(20)
);
