use Test_EduHub;

create table Categories
(
  Id int primary key identity(1,1),
  CategoryName varchar(255) unique not null
);

INSERT INTO Categories (CategoryName)
VALUES 
('Web Development'),
('Mobile App Development'),
('Data Science'),
('Artificial Intelligence'),
('Cyber Security'),
('Database Administration'),
('Cloud Computing'),
('Networking Fundamentals'),
('Game Development'),
('Software Testing');
