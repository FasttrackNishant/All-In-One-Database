use Test_EduHub;


select * from Users;
select * from Profiles;



drop table Users;
drop table Profile;


create table Users
(
	Id int primary key identity(1,1),
	username varchar (255) unique not null ,
	password varchar(15) check (len(password) between 4 and 15 ),
	role varchar(10) not null check (role in ('Student','Educator','Admin'))
)

-- ~~~~~~~~~~~~~~~ foreign key queries


-- delete foreign key
alter table profiles
drop constraint FK_Profiles_User

truncate table users;
truncate table profiles;

-- add foreign key

alter table profiles add constraint  FK_Profiles_User foreign key (userid) references Users(id) 
on delete cascade
on update cascade

-- list names of foreign keys

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


  -- ~~~~~~~~~~~~~~~~~~~~~~ User table queries

-- create user  which takes only username , password , role ,first, lastname

create proc sp_InsertUserProfile
@username varchar(255),
@password varchar(255),
@role varchar(10),
@firstname varchar(255),
@lastname varchar(255),
@email varchar (255) = null ,
@mobileNumber varchar(10) = null , 
@profileImage  varchar(255) = null,
@profileCompleted bit = false
as 
begin

	set nocount on;

	-- profilecompleted true if all valid


	if @email is not null and @mobileNumber is not null and @profileImage is not null 
	begin
		set @profileCompleted = 1
	end 


	begin try
		begin transaction;
	-- insert into users
		insert into users (username,password,role) 
		values (@username,@password,@role);

	-- user id store 
		declare @userid int = scope_identity();

	-- insert into profile
		insert into profiles (firstname,lastname,email,mobileNumber,profileImage,profileCompleted,userId)
		values(@firstname,@lastname,@email,@mobileNumber,@profileImage,@profileCompleted,@userid);

		commit transaction;

	end try

-- rollback
	begin catch
		rollback transaction;
		throw;
	end catch;
end



exec sp_InsertUserProfile 'jane@123','12345','Student','jane','smith';

exec sp_InsertUserProfile 'ravi@123','12345','Educator','Ravi','Kumar','ravi@gmail.com','1234567894','ravi.jpg';

exec sp_InsertUserProfile 'ravi1@123','12345','Educator','Ravi','Kumar','ravi@gmail.com','ravi.jpg';

EXEC sp_InsertUserProfile 
    @Username = 'ravi2@123',
    @Password = '12345',
    @Role = 'Educator',
    @FirstName = 'Ravi',
    @LastName = 'Kumar',
    @Email = 'ravi@gmail.com',
    @ProfileImage = 'ravi.jpg';




-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Operational Queries ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 username , firstname , lastname , role 


-- 1. select all active users

select  username , firstname , lastname , role  from users  u
inner join
profiles p on
u.id = p.userId where accountStatus = 1;


-- profile complete or not

select  profileCompleted from Profiles where userid = (select id from users where username = 'kunalm');

-- 3. check login 
select count(username) as login from Users where username = 'rohanp' and password = 'rohan123';

-- 4. user exist 
select count(username) as exist from Users where username = 'rohanp' ;

-- 5. total student 

select count(id) as Student_Count from Users where role ='Student';

-- 6 . total educator
select count(id) as Educator_Count from Users where role ='Educator';

-- 7. Admin count
select count(id) as Admin_Count from Users where role ='Admin';

-- 8. get user id from username
select id from Users where username = 'rohanp';

-- 9. all info from userid
select  username , firstname , lastname , role  ,email , mobileNumber , profileImage,profileCompleted from Users U 
inner join Profiles P
on U.id = P.userId
where u.id = 6;

-- 10. change password
update  Users set password='Test@123' where id = 6;

-- 11. update profile

--create proc sp_Update_Profile 
--@firstname,
--@lastname,
--@email,
--@mobileNumber,
--@profileImage
--@profileCompleted
--as
--begin
--end


