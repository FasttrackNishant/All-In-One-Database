use test_eduhub;

select * from feedbacks where courseid =1;


create proc sp_getReviewsByCourseId 
@courseid int
as
begin
select f.feedbackid , f.feedback , p.firstname , p.lastname , f.Date from  Feedbacks f inner join profiles as p on f.UserId = p.userId where CourseId = @courseid;
end