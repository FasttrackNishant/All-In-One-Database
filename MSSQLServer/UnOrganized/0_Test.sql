use classroom;

alter table employees add doj datetime; 

update categories set categoryname='Travel' where categoryid = 8;

alter table products add product_count int ;

alter table products add expiry datetime ;

update products set expiry= '2022-12-12';

alter table products alter column expiry date;


create table Items (
	id int primary key identity(1,1),
	name varchar(255),
	price decimal(2,2),
	quantity int 
	);

use yashdev;

select * from employees;


alter proc spGetEmployees
@id int
as
begin
	select * from employees where employeeid  = @id
end

exec spGetEmployees 2

exec getBothData;


create proc getBothData
as 
begin
	select * from employees;
	select * from departments;
end


create database ado_db;

use ado_db;

CREATE TABLE employee (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10, 2),
    designation VARCHAR(50),
    department VARCHAR(50),
    age INT,
    date_of_joining DATE
);


INSERT INTO employee (id, name, salary, designation, department, age, date_of_joining)
VALUES
  (1, 'Avinash', 50000.00, 'Software Engineer', 'IT', 28, '2023-01-01'),
  (2, 'Priya', 45000.00, 'Data Analyst', 'Analytics', 25, '2022-12-15'),
  (3, 'Rahul', 60000.00, 'Project Manager', 'Management', 32, '2021-08-20'),
  (4, 'Anjali', 48000.00, 'UI/UX Designer', 'Design', 27, '2023-03-10'),
  (5, 'Nikhil', 55000.00, 'Backend Developer', 'IT', 30, '2022-05-05'),
  (6, 'Neha', 42000.00, 'HR Executive', 'HR', 24, '2023-07-12'),
  (7, 'Amit', 58000.00, 'Sales Manager', 'Sales', 35, '2021-11-01'),
  (8, 'Ramesh', 40000.00, 'Finance Analyst', 'Finance', 26, '2023-02-18'),
  (9, 'Meena', 52000.00, 'QA Engineer', 'Testing', 29, '2022-09-25'),
  (10, 'Suresh', 47000.00, 'Marketing Executive', 'Marketing', 31, '2023-04-05');


  select * from employee;

  create procedure sp_get_employeeName
  as
  begin
	select id , name from employee;
  end

  exec sp_get_employeeName