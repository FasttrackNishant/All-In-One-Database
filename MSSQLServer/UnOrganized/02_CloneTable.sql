use classroom;
select * from employees;

create table cloneEmp(employeeid int , empname varchar(30));

insert into cloneEmp (employeeid , empname)
	select	employeeid  , employeename from employees where employeeid<3;

select * from cloneEmp;