
-- Profile Table

select * from Profiles;

-- drop table
drop table ProfileOld;

truncate table Profiles;


--describe table

SELECT 
		COLUMN_NAME, 
		DATA_TYPE, 
		CHARACTER_MAXIMUM_LENGTH, 
		IS_NULLABLE
	--*
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_NAME = 'Profiles';

create table Profiles
(
	Id int primary key identity(1,1),
	firstname varchar (255) not null,
	lastname varchar(255) not null,
	email varchar(255) not null , 
	mobileNumber varchar(10) not null , 
	profileImage varchar(255) ,
	accountStatus bit not null default 'true' check (accountStatus in ('true','false')),
	profileCompleted bit not null default 'false' check ( profileCompleted in ('true','false')),
	userId int foreign key references Users(Id) on delete cascade
)


-- remove not null from the table
alter table Profiles alter column email varchar(255) not  null ; 

alter table Profiles add constraint unique_email unique(email) ; 

alter table Profiles alter column mobileNumber varchar(255);

alter table Profiles add profileCompleted bit not null default 'false' check ( profileCompleted in ('true','false'));

-- change order of columns in table 

exec sp_rename 'Profiles', 'ProfileOld' ;
--create new table 
-- insert old data into new table
insert into temptable select id , firstname , lastname , email , mobileNumber , profileImage , accountStatus , profileCompleted , userId from Profiles;




--- get user profile
drop proc sp_GetUserProfile
CREATE PROCEDURE sp_GetUserProfile
    @UserId INT
AS
BEGIN
    SELECT 
		u.Id,
        u.Role,
        u.Username,
        p.FirstName,
        p.LastName,
        p.Email,
        p.MobileNumber,
        p.ProfileImage,
        p.AccountStatus,
        p.ProfileCompleted
    FROM 
        Users u
    INNER JOIN 
        Profiles p ON u.Id = p.UserId
    WHERE 
        p.UserId = @UserId
END
GO

