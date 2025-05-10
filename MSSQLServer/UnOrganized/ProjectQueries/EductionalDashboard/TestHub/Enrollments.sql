
use test_eduhub;

drop table Enrollments;

create table Enrollments (
  id int primary key identity(1,1),
  EnrollmentDate datetime not null ,
  Status varchar(255) check(Status in('Accepted', 'Rejected','Pending')) default 'Pending' not null,
  UserId int foreign key references Users(id) not null ,
  Courseid int foreign key references Courses(id)  not null
);



-- list foreing keys

SELECT 
  fk.name AS ForeignKey,
  OBJECT_NAME(fk.parent_object_id) AS TableName,
  COL_NAME(fc.parent_object_id, fc.parent_column_id) AS ColumnName,
  OBJECT_NAME(fk.referenced_object_id) AS ReferencedTableName,
  COL_NAME(fc.referenced_object_id, fc.referenced_column_id) AS ReferencedColumnName
FROM 
  sys.foreign_keys AS fk
  INNER JOIN sys.foreign_key_columns AS fc 
    ON fk.object_id = fc.constraint_object_id
ORDER BY 
  TableName, ColumnName;


  -- delete foreign key

  alter table enrollments drop constraint FK_Enrollments_Course
  alter table enrollments drop constraint FK_Enrollments_User
  alter table requests drop constraint FK_Requests_Enrollment

  -- add foreign keys

  alter table enrollments add constraint FK_Enrollments_Course foreign key (courseid) references Courses(id); 
  alter table enrollments add constraint FK_Enrollments_User foreign key (userid) references Users(id);

  truncate table enrollments 


select COLUMN_NAME, 
    DATA_TYPE, 
    CHARACTER_MAXIMUM_LENGTH, 
    IS_NULLABLE
from information_schema.columns where table_name ='enrollments';


-- create enrollments

drop proc sp_CreateEnrollment

create proc sp_CreateEnrollment
	@role varchar(10),
	@enrollmentdate datetime,
	@userid int ,
	@courseid int
as 
begin
	begin transaction
		begin try
			if @role = 'Student'
				begin
					insert into Enrollments (enrollmentdate ,userid , courseid ) values (@enrollmentdate,@userid,@courseid);

					-- request type
					declare @enrollmentId int = scope_identity();
					insert into requests (requestStatus,enrollmentid) values ('Pending',@enrollmentId);
					commit transaction
				end
			else
				begin
					raiserror ('Only Studnet can enroll in course ',16,1);
					rollback transaction
					return;
				end
			
		end try
			begin catch
				rollback transaction
				throw
				return;
			end catch
		
end;


select * from Enrollments where userid = 4;

-- course id 3 
select E.id, C.Title from Enrollments as E inner join Courses as C on E.Courseid = C.id where E.userid = 6 and E.Status = 'Approved'; 


-- change the request status

select requestStatus from Requests where enrollmentid = 3;





--- get previous enrollment

create proc sp_get_past_Enrollments
@userId int
as
begin
	select e.id , c.Title, p.firstname , p.lastname , cat.CategoryName , e.status from Enrollments e inner join 
	Courses c on e.Courseid = c.id inner join Categories as cat on cat.id  = c.id
	inner join Profiles as p on p.id = e.UserId where   e.status = 'Pending' and
	 e.UserId = @userId;

end