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
CREATE PROCEDURE SP_GetData

AS
BEGIN
	select * from Person;
END
GO


create procedure sp_insertData1 (@name varchar(30) ,@email varchar(34) ,@mobile varchar(20) ,@city varchar(30))
as
begin
	insert into Person (name ,email,mobile,city) values(@name,@email,@mobile,@city);
END
GO