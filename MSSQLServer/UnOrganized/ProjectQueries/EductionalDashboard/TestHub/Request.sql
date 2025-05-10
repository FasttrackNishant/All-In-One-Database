
use Test_EduHub;

drop table Requests;

create table Requests
(
  id  int primary key identity(1,1),
  requestStatus  varchar(255) check(requestStatus in('Accepted', 'Rejected','Pending')) not null,
  enrollmentid int foreign key references Enrollments(id) ON DELETE CASCADE not null 
);


--alter table requests rename column requesttype to requeststatus; 
exec sp_rename 'Requests.requesttype' , 'requestStatus' , 'column';

-- add foreing key
alter table requests add constraint FK_Requests_Enrollment foreign key (enrollmentid) references Enrollments(id);


-- truncate 

truncate table requests;


SELECT 
    OBJECT_NAME(object_id) AS dependent_object, 
    OBJECT_NAME(parent_object_id) AS referenced_object, 
    *
FROM 
    sys.sql_dependencies
WHERE 
    referenced_major_id = OBJECT_ID('Requests.requesttype');