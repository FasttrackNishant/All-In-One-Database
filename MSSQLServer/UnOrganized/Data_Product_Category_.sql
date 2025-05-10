select * from Products;


create database EF_ClassRoom_SP

use EF_ClassRoom_SP

-- Create Category table
CREATE TABLE Category (
  CatId INT PRIMARY KEY,
  CatName VARCHAR(50) NOT NULL
);

-- Create Product table
CREATE TABLE Product (
  ProdId INT PRIMARY KEY,
  ProductName VARCHAR(100) NOT NULL,
  Price DECIMAL(10, 2) NOT NULL,
  CatId INT,
  FOREIGN KEY (CatId) REFERENCES Category(CatId)
);

-- Insert sample data into Category table
INSERT INTO Category (CatId, CatName) VALUES
  (1, 'Electronics'),
  (2, 'Fashion'),
  (3, 'Home Appliances'),
  (4, 'Sports'),
  (5, 'Beauty');

-- Insert sample data into Product table
INSERT INTO Product (ProdId, ProductName, Price, CatId) VALUES
  (1, 'Samsung 4K TV', 999.00, 1),
  (2, 'LG Smart TV', 799.00, 1),
  (3, 'Sony Soundbar', 299.00, 1),
  (4, 'HP Laptop', 599.00, 1),
  (5, 'Canon Camera', 399.00, 1),
  (6, 'Levis Jeans', 79.00, 2),
  (7, 'Nike Running Shoes', 129.00, 4),
  (8, 'Whirlpool Refrigerator', 1299.00, 3),
  (9, 'Oreal Shampoo', 19.00, 5),
  (10, 'Adidas T-Shirt', 29.00, 2);


  select * from Category;
  select * from Product;