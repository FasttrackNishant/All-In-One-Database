create database Classroom_Edu_Hub
use Classroom_Edu_Hub;
 
create table Users(userId int primary key identity(1,1),
userName varchar(255) not null unique,password varchar(15) not null check (LEN(password) between 8 and 15),
role  varchar(255) not null check(role in('Student','Educator')),email varchar(255) not null,
mobile_no varchar(10) not null,profileImage varchar(255));
 
 
create table Courses(courseId int primary key identity(1,1),
title varchar(255) not null,description varchar(255) not null,
courseStartDate Date, courseEndDate Date,userId int,category varchar(255),level varchar check(level in('beginner', 'intermediate','advanced')));
 
create table Enrollments(enrollmentId int primary key identity(1,1),
userId int , courseId int, enrollmentDate date, status varchar(25) check(status in ('Accepted', 'Rejected')));
 
create table Materials(materialId int primary key identity(1,1),
courseId int, title varchar(255), description varchar(255),URL varchar(255),uploadDate date,contentType varchar(255));
 
create table Enquiries(enquiryId int primary key identity(1,1),
userId int,courseId int, subject varchar(255), message varchar(255),enquiryDate date,status varchar(255)check(status in('Open','Closed','In Progress')),response varchar(255));
 
 
create table Feedbacks(feedbackId int identity(1,1),
userId int,feedback varchar(255),date date);