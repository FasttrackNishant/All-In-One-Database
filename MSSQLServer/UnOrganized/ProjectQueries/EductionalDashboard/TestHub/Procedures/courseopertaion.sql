

select * from courses;
select * from categories;
use Test_EduHub;


drop procedure sp_Get_All_Courses

select id ,  from courses as c inner join categories as cat on c.categoryid = cat.id;

create proc sp_Get_All_Courses
as
begin

	select c.id , title , CourseStartDate , CourseEndDate , level , price , categoryname
	--select * 
	 from courses as c inner join categories as cat on c.categoryid = cat.id where c.status =1;

end;

exec sp_Get_All_Courses;


--- get courses by id educator

create proc sp_Get_All_Educator_Courses_By_Id
@userid int 
as
begin

	select c.id , title , CourseStartDate , CourseEndDate , level , price , categoryname
	--select * 
	 from courses as c inner join categories as cat on c.categoryid = cat.id where c.status =1 and c.userid=@userid;

end;

exec sp_Get_All_Educator_Courses_By_Id 3
drop proc sp_Get_Course_Details_By_Id

-- get course details by id 

create proc sp_Get_Course_Details_By_Id
@courseid int 
as
begin

	select c.id ,c.title , c.description , c.CourseStartDate , c.CourseEndDate , c.level , c.price , cat.categoryname , p.firstname  ,p.lastname ,p.userid from Courses as c inner join Categories as cat on c.categoryid = cat.Id inner join Profiles as P on 
c.userId = p.userId where c.id = @courseid;

end;

exec sp_Get_Course_Details_By_Id 2 ;


--- edit course procedure

CREATE PROCEDURE sp_edit_course_byId
    @Id INT,
    @Title NVARCHAR(100),
    @Description NVARCHAR(MAX),
    @CategoryId INT,
    @CourseStartDate DATETIME,
    @CourseEndDate DATETIME,
    @Level NVARCHAR(50),
    @Price DECIMAL(18, 2)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Courses
    SET
        Title = @Title,
        Description = @Description,
        CategoryId = @CategoryId,
        CourseStartDate = @CourseStartDate,
        CourseEndDate = @CourseEndDate,
        Level = @Level,
        Price = @Price
    WHERE Id = @Id;
END;

EXEC sp_edit_course_byId
    @Id = 15,
    @Title = 'Advanced SQL Server',
    @Description = 'A comprehensive course on SQL Server.',
    @CategoryId = 2,
    @CourseStartDate = '2023-10-01',
    @CourseEndDate = '2023-12-01',
    @Level = 'Advanced',
    @Price = 299.99;

create proc sp_delete_Course
@course_id int 
as
begin
	update courses set status = 0 where id = @course_id;
end;

exec sp_delete_Course 16