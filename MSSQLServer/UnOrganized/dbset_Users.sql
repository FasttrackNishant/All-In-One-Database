create database dbset_users

use dbset_users


CREATE TABLE dbset_users (
    UserId INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Username NVARCHAR(50) UNIQUE NOT NULL,
    Password NVARCHAR(100) NOT NULL,
    Role NVARCHAR(50) NOT NULL,
    CreatedAt DATETIME2 DEFAULT GETDATE(),
    Email NVARCHAR(100),
    IsActive BIT DEFAULT 1
);


INSERT INTO dbset_users 
(FirstName, LastName, Username, Password, Role, Email) 
VALUES 
(N'Rajesh', N'Patel', N'rajesh.patel', 
 N'Pass@123', N'Admin', 
 N'rajesh.patel@example.com'),

(N'Priya', N'Sharma', N'priya.sharma', 
 N'Pass@123', N'User ', 
 N'priya.sharma@example.com'),

(N'Amit', N'Kumar', N'amit.kumar', 
 N'Pass@123', N'Manager', 
 N'amit.kumar@example.com'),

(N'Neha', N'Gupta', N'neha.gupta', 
 N'Pass@123', N'User ', 
 N'neha.gupta@example.com'),

(N'Vikram', N'Singh', N'vikram.singh', 
 N'Pass@123', N'Admin', 
 N'vikram.singh@example.com');