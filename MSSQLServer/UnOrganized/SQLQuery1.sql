use yashdev;

--create database with id and name with identity pk 
 --create employee with id  , first name, last name , salary , date of joining 

create table departments(Id int primary key identity(1000,1), Name varchar(15) );


insert into departments values('Electrical'),('Tech Support');

insert into departments values ('Finance'),('Account');

select * from departments;

