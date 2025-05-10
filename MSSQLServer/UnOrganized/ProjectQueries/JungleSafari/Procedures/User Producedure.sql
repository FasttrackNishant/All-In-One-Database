create trigger trInsertStudentAfter
on students
after insert 
as 
begin
declare @id int , @name varchar(255), @age int
select @id=Id , @name = name,  @age = age from inserted
insert into Student_History values (@id,@name,@age)
end;

disable trigger insertuser;


ALTER TRIGGER InsertUser
ON Users
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO Admin (userid, adminlevel)
    SELECT Id, 1
    FROM inserted;
END;

 SELECT [p].[ProfileId], [p].[City], [p].[CountryId], [p].[CreatedAt], [p].[DateOfBirth], [p].[FirstName], [p].[Gender], [p].[IsProfileComplete], [p].[LastName], [p].[ProfilePictureUrl], [p].[State], [p].[Street], [p].[UpdatedAt], [p].[UserId], [p].[ZipCode]
      FROM [Profiles] AS [p]


create proc sp_insertUserData
@userid int 
@role varchar(255)
begin
as
	
end