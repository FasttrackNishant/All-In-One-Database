

select * from courses;
select * from categories;

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

-- procedure for get enrolled course

drop proc sp_Get_Enrolled_Courses
create proc sp_Get_Enrolled_Courses
@userid int 
as
begin
		  select c.id , c.title , c.CourseStartDate , c.CourseEndDate , c.level , c.price , cat.categoryname 
	 from courses as c inner join categories as cat on c.categoryid = cat.id join enrollments e on e.courseid = c.id 
		  where e.userid=@userid and e.Status='Accepted' and  c.status =1 ; 


end

sp_Get_Enrolled_Courses 2


--- sp get enroole with user id

create proc sp_Get_Enrolled_Courses
@userid int 
as
begin
		  select @userid as StudentId, c.id , c.title , c.CourseStartDate , c.CourseEndDate , c.level , c.price , cat.categoryname 
	 from courses as c inner join categories as cat on c.categoryid = cat.id join enrollments e on e.courseid = c.id 
		  where e.userid=@userid and e.Status='Accepted' and  c.status =1 ; 
end