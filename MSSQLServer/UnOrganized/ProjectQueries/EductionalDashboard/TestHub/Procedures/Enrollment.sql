-- enrollments procedure

drop proc sp_get_enrollments

create proc sp_get_enrollments
@userid int 
as
begin

select e.id , e.EnrollmentDate , e.Courseid , e.UserId , e.Status , c.Title, p.firstname , p.lastname  from Enrollments as e inner join Courses as c on e.Courseid = c.id inner join Profiles as p on e.UserId = p.userId
where c.userid = @userid and e.status = 'Pending';
end

exec sp_get_enrollments 3


select e.id , e.EnrollmentDate , e.Courseid , e.UserId , e.Status , c.Title, p.firstname , p.lastname  from Enrollments as e inner join Courses as c on e.Courseid = c.id inner join Profiles as p on e.UserId = p.userId
where c.userid = 3;

--- studnet get enrolled courses


select c.id,c.Title,c.courseStartDate,c.courseEndDate, c.Price ,c.level from enrollments e join Courses c 
		  on e.courseid = c.courseid 
		  where e.userid=@userId and e.Status='Accepted';




