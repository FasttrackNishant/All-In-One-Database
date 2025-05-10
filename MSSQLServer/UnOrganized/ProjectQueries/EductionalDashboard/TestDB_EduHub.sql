
create database Test_EduHub;

use Test_Eduhub;

drop table Users;

drop table Profile;


select * from Users;
select * from Profile;

create table Users
(
	userId int primary key identity(1,1),
	username varchar (20) ,
	password varchar(15) check (len(password) between 4 and 15 ),
	role varchar(10) not null check (role in ('Student','Educator','Admin'))
)

create table Profile 
(
	profileId int primary key identity(1,1),
	userId int foreign key references Users(userId),
	firstname varchar (255) not null,
	lastname varchar(255) not null,
	email varchar(255) not null , 
	mobileNumber varchar(10) not null , 
	profileImage varchar(255) ,
	accountStatus varchar(10) not null default 'Active'
)


-- insert data for Users

INSERT INTO Users ( username, password, role)
VALUES
  ( 'Rahul Kumar', 'password123', 'Student'),
  ( 'Priya Patel', 'securepass', 'Educator'),
  ( 'Avinash Sharma', 'temp1234', 'Student'),
  ( 'Meena Singh', 'adminpass', 'Educator'),
  ( 'Nikhil Gupta', 'mypassword', 'Student');

-- insert data for profile
INSERT INTO Profile (userId, firstname, lastname, email, mobileNumber)
VALUES
    (1, 'Admin', 'Admin', 'admin@example.com', '1234567890'),
    (3, 'Rahul', '123', 'rahul123@example.com', '9876543210'),
    (4, 'Rahul', '', 'rahul@example.com', '9876543210'),
    (5, 'Rahul', 'Kumar', 'rahul.kumar@example.com', '1234567890'),
    (6, 'Priya', 'Patel', 'priya.patel@example.com', '9876543210'),
    (7, 'Avinash', 'Sharma', 'avinash.sharma@example.com', '1234567890'),
    (8, 'Meena', 'Singh', 'meena.singh@example.com', '9876543210'),
    (9, 'Nikhil', 'Gupta', 'nikhil.gupta@example.com', '1234567890');


  select * from Users as U inner join Profile as p on U.userId = P.UserId;

  select username, firstname, lastname , role from Users U inner join Profile P on U.userid = P.userid
  --

  select username, firstname, lastname , role from Users U inner join Profile P on U.userid = P.userid and P.accountstatus = 'Inactive'


  select firstname,lastname , email , mobilenumber , profileimage from profile  where userid = 5 and accountstatus = 'active' ;


  select role from Users where username = 'admin' and  password= 'admin123' 


  select useri from Users where username = 'admin';




  INSERT INTO Users (username, password, role)
VALUES ('johndoe', 'password123', 'Student');


CREATE PROCEDURE InsertUserAndProfile
    @username VARCHAR(20),
    @password VARCHAR(15),
    @role VARCHAR(10),
    @firstname VARCHAR(255),
    @lastname VARCHAR(255),
    @email VARCHAR(255),
    @mobileNumber VARCHAR(10),
    @profileImage VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;

    -- Insert data into the Users table
    INSERT INTO Users (username, password, role)
    VALUES (@username, @password, @role);

    DECLARE @userId INT = SCOPE_IDENTITY();

    -- Insert data into the Profile table, using the generated userId
    INSERT INTO Profile (userId, firstname, lastname, email, mobileNumber, profileImage, accountStatus)
    VALUES (@userId, @firstname, @lastname, @email, @mobileNumber, @profileImage, 'Active');

    COMMIT TRANSACTION;
END




EXEC InsertUserAndProfile
    @username = 'johndoe',
    @password = 'password123',
    @role = 'Student',
    @firstname = 'John',
    @lastname = 'Doe',
    @email = 'johndoe@example.com',
    @mobileNumber = '1234567890',
    @profileImage = 'profile_image.jpg';

