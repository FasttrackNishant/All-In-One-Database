create table Person(
	Id int primary key identity(1,1) ,
	name varchar(30) ,
	email varchar(34) , 
	mobile varchar(20) , 
	city varchar(30)  ,
	constraint city check ( city ='Pune'),
	pincode int default 422321
	);

	INSERT INTO Person (Name, Email, Mobile, City, Pincode) VALUES
('John Doe', 'johndoe@example.com', '9876543210', 'Pune', 422321),
('Jane Smith', 'janesmith@example.com', '8765432109', 'Pune', 422321),
('Alice Johnson', 'alicejohnson@example.com', '7654321098', 'Pune', 422321),
('Bob Brown', 'bobbrown@example.com', '6543210987', 'Pune', 422321),
('Charlie Chen', 'charliechen@example.com', '5432109876', 'Pune', 422321);

-- view list

exec SP_GetData

-- insert 

exec SP_InsertData1 'Ram Kumar','Ram@gmail.com','23423424','Pune'