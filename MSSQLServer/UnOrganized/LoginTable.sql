use Ef_DB

drop table users;

select * from users;

create table Users
( id int primary key , 
name varchar(40) not null , 
gender varchar(20) not null , 
email varchar(50) not null , 
password varchar(20) not null
);

INSERT INTO Users (id, name, gender, email, password)
VALUES
(1, 'John Doe', 'Male', 'johndoe@example.com', 'johndoe123'),
(2, 'Jane Smith', 'Female', 'janesmith@example.com', 'janesmith123'),
(3, 'Bob Johnson', 'Male', 'bobjohnson@example.com', 'bobjohnson123'),
(4, 'Alice Brown', 'Female', 'alicebrown@example.com', 'alicebrown123'),
(5, 'Mike Davis', 'Male', 'mikedavis@example.com', 'mikedavis123');