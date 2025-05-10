create database employeeDB;
use employeeDB;

drop table employee_info ;


create table employee_info(
 empId int primary key , 
 empName varchar(20) not null , 
 empSalary decimal(10,2) not null , 
 job varchar(20),
 phone varchar(12) unique,
 deptId int not null  );

 
create table department_info(
	deptId int not null , 
	deptName varchar(20) not null , 
	deptLocation varchar(40) not null );

-- Insert Statements 

-- insert all values 
insert into employee_info values (
	1 , 'John',23.4534,'SDE','29394959493',101);

--insert specific values

insert into employee_info (
	empId ,empName, empSalary , deptId)
	values(
	2,'Rohit',35343.34,102);


--select 

select * from employee_info;
select empId,empName  from employee_info;

