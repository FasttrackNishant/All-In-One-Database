use classroom;

-- first table products 
-- second table categories

select productname, categoryname from products as p inner join categories as c on p.categoryid = c.categoryid;


-- new example 
use classroom_joins;

select * from parent;
select * from child;

-- parent table

create table parent (
	parentId int primary key ,
	parentname varchar(20)
	);

create table child (
	Id int primary key , 
	childname varchar(20),
	age int , 
	parentId int 
	);

insert into parent values(1,'parent1'),(2,'parent2'),(3,'parent3'),(4,'parent4');

insert into child values (1,'Sara',10,1);
insert into child values (2,'Tara',20,3);
insert into child values (3,'Lara',5,2);
insert into child values (4,'Thomas',7,2);
insert into child values (5,'Berri',8,1);
insert into child values (6,'Jolly',10,3);
insert into child values (7,'Milli',15,null);
insert into child values (8,'Simmi',18,null);


select * from parent;
select * from child;

select parentname, childname	 from parent as p inner join child as c on p.parentId = c.parentId;

select parentname , count(*) from parent inner join child on parent.parentId = child.parentId group by parentname;

select p.parentId , p.parentname , c.childname from parent p left join child c on p.parentId = c.parentId
order by p.parentId;

select c.Id , p.parentId  ,p.parentname , c.childname from parent p right join child c on p.parentId = c.parentId order by c.Id;

--cross join


CREATE TABLE Meals(MealName VARCHAR(100))
CREATE TABLE Drinks(DrinkName VARCHAR(100))
INSERT INTO Drinks
VALUES('Orange Juice'), ('Tea'), ('Cofee')
INSERT INTO Meals
VALUES('Omlet'), ('Fried Egg'), ('Sausage')
SELECT *
FROM Meals;
SELECT *
FROM Drinks

SELECT * FROM Meals 
CROSS JOIN Drinks


create table selfEmployee (EmpId int primary key , Name varchar(30) , Designation varchar(20) , SuperiorId int );


insert into selfEmployee values
		--(1,'Raj','MD',null),
		--(2,'Roy','CEO',1);
		(3,'Ram Kumar','Tech Lead',2),
		(4,'Prasad','Dev',3),
		(5,'Jestor','Dev',3);



select * from selfEmployee;

