use Test_EduHub;

drop table Courses;

select * from courses;

select 
	COLUMN_NAME, 
    DATA_TYPE, 
    CHARACTER_MAXIMUM_LENGTH, 
    IS_NULLABLE
from
INFORMATION_SCHEMA.COLUMNS
where
TABLE_NAME='Courses'


create table Courses (
  id int primary key identity(1,1),
  Title varchar(255) not null,
  Description text not null,
  CourseStartDate date not null ,
  CourseEndDate date not null ,
  Level varchar(255) check(level in('beginner', 'intermediate','advanced')) not null ,
  Status bit check(Status in('true','false')) default 'true' ,
  userid int constraint fk_courses_users foreign key references Users(id) ON DELETE CASCADE ,
  categoryid int constraint fk_courses_category  foreign key references Categories(id) ON DELETE CASCADE on update cascade
);

-- alter table
alter table Courses
add Price decimal(10,2) not null default 0.00




UPDATE Courses
SET Price = 
    CASE Id
        WHEN 1 THEN 24000.00
        WHEN 2 THEN 32000.00
        WHEN 3 THEN 42000.00
        WHEN 4 THEN 20000.00
        WHEN 5 THEN 28000.00
        WHEN 6 THEN 38000.00
        WHEN 7 THEN 22000.00
        WHEN 8 THEN 30000.00
        WHEN 9 THEN 40000.00
        WHEN 10 THEN 21000.00
        WHEN 11 THEN 29000.00
        WHEN 12 THEN 39000.00
        WHEN 13 THEN 23000.00
        WHEN 14 THEN 31000.00
    END;


drop procedure sp_InsertCourse

CREATE PROCEDURE sp_InsertCourse
    @username nvarchar(50),
    @title nvarchar(100),
    @description nvarchar(200),
    @courseStartDate date,
    @courseEndDate date,
    @level nvarchar(20),
    @categoryId int
AS
BEGIN
    SET NOCOUNT OFF;

    DECLARE @userid int;
    DECLARE @role nvarchar(20);
	

    BEGIN TRANSACTION;

    BEGIN TRY
        -- Get the userid and role from the username
        SELECT @userid = u.id, @role = u.Role
        FROM Users u
        WHERE u.Username = @username;

		--select @categoryid = c.id from Categories c
		--where c.CategoryName = @categoryname;

        -- Check if the role is 'Educator'
        IF @role = 'Educator'
        BEGIN
            -- Insert the course
            INSERT INTO Courses (Title, Description, CourseStartDate, CourseEndDate, Level, userid, categoryid)
            VALUES (@title, @description, @courseStartDate, @courseEndDate, @level, @userid, @categoryid);
        END
        ELSE
        BEGIN
            -- Raise an error if the role is not 'Educator'
            RAISERROR ('Only Educators can insert courses', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        COMMIT TRANSACTION;
    END TRY


    BEGIN CATCH
        -- Rollback the transaction if an error occurs
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;



SELECT p.FirstName, p.LastName, c.Title, cat.CategoryName
FROM Profiles p
JOIN Courses c ON p.id = c.userid
JOIN Categories cat ON c.categoryid = cat.id
WHERE p.id = 10;


