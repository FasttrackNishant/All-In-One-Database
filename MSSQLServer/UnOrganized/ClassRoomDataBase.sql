use yashdev;

select * from employee;

alter table employee a id int identity(1,1); 


create database classroom;

use classroom;

create table departments (
    departmentid int primary key,
    departmentname varchar(50)
);

create table employees (
    employeeid int primary key identity(1,1),
    employeename varchar(50),
    departmentid int foreign   
 key references departments(departmentid)
);

create table categories (
    categoryid int primary key,
    categoryname varchar(50)
);


create table products (
    productid int primary key,
    productname   
 varchar(50),
    categoryid int foreign key references categories(categoryid)
);

-- departments
insert into departments (departmentid, departmentname)
values
    (1, 'sales'),
    (2, 'marketing'),
    (3, 'hr'),
    (4, 'finance'),
    (5, 'it'),
    (6, 'production'),
    (7, 'customer service'),
    (8, 'research and development'),
    (9, 'legal'),
    (10, 'accounting');

-- employees
insert into employees (employeeid, employeename, departmentid)
values
    (1, 'john doe', 1),
    (2, 'jane smith', 2),
    (3, 'michael johnson', 3),
    (4, 'emily davis', 4),
    (5, 'william brown', 5),
    (6, 'olivia taylor', 6),
    (7, 'noah wilson', 7),
    (8, 'sophia adams', 8),
    (9, 'liam jones', 9),
    (10, 'ava miller', 10);

-- categories
insert into categories (categoryid, categoryname)
values
    (1, 'electronics'),
    (2, 'clothing'),
    (3, 'furniture'),
    (4, 'books'),
    (5, 'toys'),
    (6, 'groceries'),
    (7, 'stationery'),
    (8, 'home appliances'),
    (9, 'beauty'),
    (10, 'sports ');

-- products
insert into products (productid, productname, categoryid)
values
    (1, 'laptop', 1),
    (2, 'dress', 2),
    (3, 'sofa', 3),
    (4, 'novel', 4),
    (5, 'teddy bear', 5),
    (6, 'milk', 6),
    (7, 'pen', 7),
    (8, 'refrigerator', 8),
    (9, 'lipstick', 9),
    (10, 'football', 10);



use classroom;

select * from products;
select * from categories;
select * from employees;
select * from departments;


select productid from products where productid = 2;