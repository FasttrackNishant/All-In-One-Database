-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE SP_Product_Category
	
	AS
BEGIN
	SELECT dbo.categories.categoryname, dbo.products.productname, dbo.products.product_count, dbo.products.expiry, dbo.products.price
FROM   dbo.categories INNER JOIN
             dbo.products ON dbo.categories.categoryid = dbo.products.categoryid

END
GO
