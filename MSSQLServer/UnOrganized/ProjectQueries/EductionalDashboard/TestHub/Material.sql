
create table Materials (
  Id  int primary key identity(1,1),
  Title   varchar(255) not null,
  Description  text not null,
  URL   varchar(255) not null	,
  UploadDate datetime not null,
  ContentType varchar(255) not null,
  Courseid int foreign key references Courses(id) ON DELETE CASCADE not null
);


-- insert material

CREATE PROCEDURE sp_InsertMaterial
    @Courseid int,
    @Title varchar(255),
    @Description varchar(255),
    @URL varchar(255),
    @UploadDate datetime,
    @ContentType varchar(255)
AS
BEGIN TRANSACTION;

BEGIN TRY
    INSERT INTO Materials (Courseid, Title, Description, URL, UploadDate, ContentType)
    VALUES (@Courseid, @Title, @Description, @URL, @UploadDate, @ContentType);

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW;
END CATCH;