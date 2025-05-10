create database  DbSet_Students

use DbSet_Students;

CREATE TABLE Students1 (
  id INT PRIMARY KEY,
  studentname VARCHAR(50),
  studentgender VARCHAR(10),
  age INT,
  standard VARCHAR(20),
  fathername VARCHAR(50)
);

INSERT INTO Students1 (id, studentname, studentgender, age, standard, fathername)
VALUES
  (1, 'John Doe', 'Male', 15, '10th', 'Michael Doe'),
  (2, 'Jane Smith', 'Female', 16, '11th', 'Robert Smith'),
  (3, 'Rahul Patel', 'Male', 14, '9th', 'Rajesh Patel'),
  (4, 'Emily Johnson', 'Female', 17, '12th', 'David Johnson'),
  (5, 'Mohammed Ali', 'Male', 15, '10th', 'Ahmed Ali'),
  (6, 'Sophia Lee', 'Female', 16, '11th', 'James Lee'),
  (7, 'Oliver Brown', 'Male', 14, '9th', 'William Brown'),
  (8, 'Isabella Davis', 'Female', 17, '12th', 'Richard Davis'),  
  (9, 'Ethan Hall', 'Male', 15, '10th', 'Kevin Hall'),
  (10, 'Ava Martin', 'Female', 16, '11th', 'Brian Martin');


  select * from students1;


  create database EF_DB;

use EF_DB;

create table Students
(
id int primary key identity(1,1),
firstname varchar(50) not null , 
lastname varchar(50)not null ,
DOA Date not null 
);

select * from Students;

truncate table students;

INSERT INTO Students (firstname, lastname, DOA)
VALUES
    ('Rahul', 'Sharma', '2018-08-20'),
    ('Priya', 'Jain', '2019-02-15'),
    ('Kunal', 'Gupta', '2017-09-01'),
    ('Sonia', 'Kumar', '2016-05-25'),
    ('Amit', 'Singh', '2015-11-10'),
    ('Neha', 'Chopra', '2014-03-05'),
    ('Vikram', 'Patel', '2013-01-20');


-- Create the Products table
CREATE TABLE Products (
    ProductId INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL,
    Category VARCHAR(50) NOT NULL
);

-- Insert 7 records into the Products table
INSERT INTO Products (ProductId, Name, Price, Stock, Category)
VALUES
(1, 'Product 1', 10.99, 100, 'Electronics'),
(2, 'Product 2', 5.99, 50, 'Clothing'),
(3, 'Product 3', 7.99, 200, 'Home Goods'),
(4, 'Product 4', 12.99, 150, 'Electronics'),
(5, 'Product 5', 8.99, 250, 'Clothing'),
(6, 'Product 6', 9.99, 300, 'Home Goods'),
(7, 'Product 7', 11.99, 400, 'Electronics');

