
create table products
(
id int primary key identity (1,1),
name varchar(50) not null ,
price decimal (10,2) not null ,
stock int not null,
expirydate date not null );


INSERT INTO Products (Name, Price, Stock, ExpiryDate) VALUES
('Aashirvaad Atta', 45, 100, '2024-12-31'),
('Colgate Toothpaste', 70, 200, '2025-03-31'),
('Lux Soap', 35, 500, '2024-11-30'),
('Maggi Noodles', 20, 500, '2025-02-28'),
('Surf Excel Detergent Powder', 250, 150, '2025-01-31'),
('Amul Milk', 50, 300, '2024-09-15'),
('Sunsilk Shampoo', 150, 200, '2025-04-30'),
('Cadbury Dairy Milk', 50, 500, '2025-01-01'),
('Himalaya Face Wash', 120, 100, '2025-03-31'),
('Lays Potato Chips', 20, 1000, '2025-02-28'),
('Dettol Soap', 40, 300, '2024-11-30'),
('Nescafe Instant Coffee', 200, 50, '2025-04-30'),
('Goodluck Biscuits', 30, 500, '2024-12-31'),
('Himalaya Toothpaste', 80, 200, '2025-01-31'),
('Colgate Toothbrush', 50, 1000, '2025-02-28');


select * from products;


create procedure spGetProducts
as
begin
	select name,price , stock , expirydate from products;
end

exec sp


create procedure spAddProducts
(
@name varchar(50),
@price decimal(10,2),
@stock int ,
@expirydate datetime
)
as
begin
	insert into products (name,price,stock,expirydate) values(@name,@price,@stock,@expirydate);
end

exec spAddProducts 'Raj',232.32,222,'2023-04-03'


create proc spDeleteProductById
(@id int)
as
begin
	delete from products where id =@id
end


exec spDeleteProductById 16


-- get single product by id

create proc spGetProductById
(@id int)
as
begin
	select name , price , stock , expirydate from products where id =@id
end

exec spGetProductById 12





create procedure spUpdateProduct
(
@id int,
@name varchar(50),
@price decimal(10,2),
@stock int ,
@expirydate datetime
)
as
begin
	update products  set name = @name ,price = @price , stock =@stock , expirydate = @expirydate where id =@id;
end

exec spUpdateProduct 11,'Raj',232.32,222,'2023-04-03'



create proc spGetExpiredProducts
as
begin
	SELECT name , price , stock , expirydate FROM products WHERE expirydate < GETDATE();
end

exec spGetExpiredProducts