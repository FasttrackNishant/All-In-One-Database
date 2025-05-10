-- 1. Product count by category
CREATE PROCEDURE sp_GetProductCountByCategory
AS
BEGIN
    SELECT c.CatName, COUNT(p.ProdId) AS ProductCount
    FROM Product p
    JOIN Category c ON p.CatId = c.CatId
    GROUP BY c.CatName
END

-- 2. Product details
CREATE PROCEDURE sp_GetProductDetails
    @ProdId INT
AS
BEGIN
    SELECT *
    FROM Product
    WHERE ProdId = @ProdId
END

-- 3. Products by category name
CREATE PROCEDURE sp_GetProductsByCategoryName
    @CatName VARCHAR(50)
AS
BEGIN
    SELECT p.*
    FROM Product p
    JOIN Category c ON p.CatId = c.CatId
    WHERE c.CatName = @CatName
END

-- 4. Add category
CREATE PROCEDURE sp_AddCategory
    @CatName VARCHAR(50)
AS
BEGIN
    INSERT INTO Category (CatName)
    VALUES (@CatName)
END

-- 5. Add product to category
CREATE PROCEDURE sp_AddProductToCategory
    @ProdName VARCHAR(100),
    @Price DECIMAL(10, 2),
    @CatId INT
AS
BEGIN
    INSERT INTO Product (ProductName, Price, CatId)
    VALUES (@ProdName, @Price, @CatId)
END

-- 6. Get products by category
CREATE PROCEDURE sp_GetProductsByCategory
    @CatId INT
AS
BEGIN
    SELECT p.*
    FROM Product p
    WHERE p.CatId = @CatId
END

exec sp_GetProductsByCategory 1