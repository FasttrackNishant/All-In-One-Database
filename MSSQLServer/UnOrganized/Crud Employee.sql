
create database crud_project

use crud_project

drop table employee

CREATE TABLE employee (
id INT PRIMARY KEY identity(1,1),
name VARCHAR(50),
salary DECIMAL(10, 2),
gender CHAR(1),
age INT,
city VARCHAR(50)
);

SET IDENTITY_INSERT employee  OFF


INSERT INTO employee (id, name, salary, gender, age, city) VALUES
(1, 'Avinash', 50000.00, 'M', 25, 'Mumbai'),
(2, 'Priya', 60000.00, 'F', 28, 'Delhi'),
(3, 'Rahul', 45000.00, 'M', 23, 'Bangalore'),
(4, 'Anjali', 55000.00, 'F', 26, 'Chennai'),
(5, 'Vivek', 70000.00, 'M', 30, 'Hyderabad'),
(6, 'Meena', 65000.00, 'F', 27, 'Pune'),
(7, 'Rajesh', 52000.00, 'M', 24, 'Kolkata'),
(8, 'Neha', 48000.00, 'F', 29, 'Ahmedabad'),
(9, 'Suresh', 68000.00, 'M', 22, 'Jaipur'),
(10, 'Seema', 58000.00, 'F', 25, 'Lucknow');


-- create store procedures

create procedure spGetEmployees
as
begin
	select * from employee
end

exec spGetEmployees

-- for insert operation

create procedure spAddEmployee1
(
@name varchar(50), 
@gender varchar(50),
@age int , 
@salary decimal(10,2),
@city  varchar(50)
)
as
begin
	 insert into employee (name,gender,age,salary,city)
	 values(@name,@gender,@age,@salary,@city)
end

exec spAddEmployee1 'Dev','M',23,3454.22,'Delhi'

-- update data

create procedure spUpdateEmployee
(
@id int,
@name varchar(50), 
@gender varchar(50),
@age int , 
@salary decimal(10,2),
@city  varchar(50)
)
as
begin
	 update employee set name=@name ,gender =@gender,age = @age,salary = @salary ,city = @city
	 where id =@id
end

exec spUpdateEmployee 4,'Ronny','M',63,13454.22,'Delhi'

-- delete procedure

create procedure spDeleteEmployee
(@id int)
as
begin
		delete from employee where id =@id
end

exec spDeleteEmployee 10