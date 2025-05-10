SELECT TOP (1000) [id]
      ,[name]
      ,[description]
      ,[price]
      ,[category]
  FROM [DBSet_Products].[dbo].[products1]


  drop table category ;
  drop table product;


  CREATE TABLE category (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE product (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2),
    catid INT,
    FOREIGN KEY (catid) REFERENCES category(id)
);

INSERT INTO category (id, name) VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Home & Kitchen'),
(4, 'Books'),
(5, 'Toys'),
(6, 'Sports'),
(7, 'Beauty');

INSERT INTO product (id, name, description, price, catid) VALUES
(1, 'Laptop', 'A high-performance laptop', 999.99, 1),
(2, 'T-Shirt', 'Cotton T-shirt', 19.99, 2),
(3, 'Coffee Maker', 'Brews delicious coffee', 49.99, 3),
(4, 'Novel', 'A great fiction novel', 14.99, 4),
(5, 'Action Figure', 'Collectible action figure', 24.99, 5),
(6, 'Soccer Ball', 'Official size soccer ball', 29.99, 6),
(7, 'Lipstick', 'Long-lasting lipstick', 15.99, 7);
