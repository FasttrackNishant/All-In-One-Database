create  database DBSet_Products

use DbSet_Products;

drop table products1;

CREATE TABLE products1 (
  id INT PRIMARY KEY identity(1,1), 
  name VARCHAR(255),
  description VARCHAR(255),
  price DECIMAL(10, 2),
  category VARCHAR(255)
);

INSERT INTO products1 ( name, description, price, category)
VALUES
  ( 'Apple Watch', 'Smartwatch from Apple', 299.99, 'Electronics'),
  ( 'Samsung TV', '4K UHD Smart TV', 999.99, 'Electronics'),
  ( 'Nike Shoes', 'Running shoes for men', 79.99, 'Fashion'),
  ( 'Sony Headphones', 'Wireless noise-cancelling headphones', 149.99, 'Electronics'),
  ( 'Calvin Klein Jeans', 'Slim fit jeans for men', 59.99, 'Fashion'),
  ( 'HP Laptop', '15.6" laptop with Intel Core i5', 699.99, 'Electronics'),
  ( 'Adidas Jacket', 'Water-resistant windbreaker', 49.99, 'Fashion'),
  ( 'Bose Speakers', 'Portable Bluetooth speakers', 129.99, 'Electronics');


  DROP TABLE IF EXISTS Users;

CREATE TABLE Users (
  Id INT PRIMARY KEY IDENTITY(1,1),
  FUllname VARCHAR(50),
  Username VARCHAR(50),
  Password VARCHAR(50),
  Email VARCHAR(50),
  Role VARCHAR(50),
  Status VARCHAR(50)
);
INSERT INTO Users (FUllname, Username, Password, Email, Role, Status)
VALUES
  ('John Doe', 'johndoe', 'password123', 'johndoe@example.com', 'User ', 'Active'),
  ('Jane Smith', 'janesmith', 'password456', 'janesmith@example.com', 'Admin', 'Active'),
  ('Bob Johnson', 'bobjohnson', 'password789', 'bobjohnson@example.com', 'User ', 'Inactive');



  select * from Users;
  select * from products1;